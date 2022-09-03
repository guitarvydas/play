const grammar = String.raw`
Verbatim {
  main = vs*
  vs = 
    | anything+ verbatimspace? -- prefixed
    | verbatimspace            -- single
  verbatimspace = lv recursiveverbatim+ rv
  recursiveverbatim = recursiveverbatim_recur | recursiveverbatim_bottom
  recursiveverbatim_recur = lv recursiveverbatim+ rv
  recursiveverbatim_bottom = anythingVerbatim
  anythingVerbatim = anychar
  anything = anychar
  anychar= ~lv ~rv any

  lv = "⟪"
  rv = "⟫"
}

Tester <: Verbatim {
}

`;

