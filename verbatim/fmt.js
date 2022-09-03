const fmt = String.raw`
Verbatim {
  main [vs*] = ‛⟨vs⟩’
  vs_prefixed [anythings+ verbatimspace?] = ‛⟨anythings⟩⟨verbatimspace⟩’
  vs_single [verbatimspace] = ‛⟨verbatimspace⟩’
  verbatimspace [lv recursiveverbatim+ rv] = ‛⟨lv⟩⟨recursiveverbatim⟩⟨rv⟩’
  recursiveverbatim_recur [lv recursiveverbatim+ rv] = ‛⟨lv⟩⟨recursiveverbatim⟩⟨rv⟩’
  recursiveverbatim_bottom [c] = ‛⟨c⟩’
  anythingVerbatim [c] = ‛⟨c⟩’
  anything [c] = ‛’
  anychar [c] = ‛⟨c⟩’

  lv [c] = ‛⟨c⟩’
  rv [c] = ‛⟨c⟩’
}

Tester {
}
`;

