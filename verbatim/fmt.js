const fmt = String.raw`
Verbatim {
  main [vs*] = ‛⟨vs⟩’
  vs_prefixed [anythings+ verbatimspace?] = ‛⟨anythings⟩⟨verbatimspace⟩’
  vs_single [verbatimspace] = ‛⟨verbatimspace⟩’
  verbatimspace [lv recursiveverbatim+ rv] = ‛⟨lv⟩X⟨recursiveverbatim⟩Y⟨rv⟩’
  recursiveverbatim_recur [lv recursiveverbatim+ rv] = ‛⟨lv⟩R⟨recursiveverbatim⟩S⟨rv⟩’
  recursiveverbatim_bottom [c] = ‛⟨c⟩’
  anythingVerbatim [c] = ‛⟨c⟩’
  anything [c] = ‛⟨c⟩’
  anychar [c] = ‛⟨c⟩’

  lv [c] = ‛⟨c⟩’
  rv [c] = ‛⟨c⟩’
}

Tester {
}
`;

