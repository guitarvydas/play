

#include <stdio.h>

char identity (char c) {
      $ir.functionBegin “identity” 1
  return c;
      $ir.return ⟨char ⟨dd 1 param “c”⟩⟩
      $ir.functionEnd “identity” 1
}  

int main (int argc, char **argv) {
      $ir.functionBegin “main” 2
  char x = identity ('x');
      $ir.resetArgs
      $ir.createTemp “𝜏0” ⟨char ⟨dd 1 temp “𝜏0” “”⟩⟩
      $ir0.initialize ⟨char ⟨dd 0 string 0 _⟩⟩ “x”
      $ir.assignArg 0 ⟨char ⟨dd 0 string 0 _⟩⟩
      $ir.call ⟨dd 1 code “identity” “identity”⟩
      $ir.assignReturnInto 0 ⟨char ⟨dd 1 temp “𝜏0” “”⟩⟩
  printf ("result = %c\n", x);
      $ir.resetArgs
      $ir.createTemp “𝜏1” ⟨char ⟨dd 1 temp “𝜏1” “𝜏1”⟩⟩
      $ir0.initialize ⟨char ⟨dd 0 string 2 _⟩⟩ “result = %c\n”
      $ir.assignArg 0 ⟨char ⟨dd 0 2 _⟩⟩
      $ir.appendArg ⟨char ⟨dd 1 temp “𝜏0” “”⟩⟩
      $ir.call ⟨dd 1 code “printf” “printf”⟩
      $ir.assignReturnInto 0 ⟨void ⟨dd 0 temp “𝜏1” _⟩⟩
      $ir.returnVoid
}
      $ir.functionEnd “main” 2

