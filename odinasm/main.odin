package odinasm

pt0 :: proc (x, y : int) -> int {
  return x + y
}

pt1 :: proc (x : int) -> int {
  return x
}

pt2 :: proc (x : any) -> any {
  return x
}

pt3 :: proc (x : []int) -> []int {
  return x
}

pt4 :: proc (s : string) -> int {
  return len (s)
}

pt5 :: proc (s : string) -> string {
  return s
}

main :: proc () {
  z0 : int = pt0 (65, 66)
  z1 : int = pt1 (65)
  z2 : any = pt2 (65)
  z3 : []int = pt3 ([]int{65,66,67})
  z4 := pt4 ("abcdefghijklmn ABCDEFGHIJKLMN")
  z5 := pt5 ("abcdefghijklmn ABCDEFGHIJKLMN")
}

