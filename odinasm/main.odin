package odinasm

pt :: proc (x, y : int) -> int {
  return x + y
}

main :: proc () {
  z : int = pt (65, 66)
}

