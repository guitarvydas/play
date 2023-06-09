package pretty
import "core:fmt"
import "core:strings"

Message_Content :: distinct []u8
Message_Port :: distinct string

ok :: proc () {
    sb: strings.Builder
    defer strings.builder_destroy(&sb)
    v := []u8{7}
    fmt.println(v)
}

ok1 :: proc () {
    sb: strings.Builder
    defer strings.builder_destroy(&sb)
    v := transmute(Message_Content)[]u8{9}
    fmt.sbprintf(&sb, "%v", as_unchanged (v))
    fmt.println (strings.to_string (sb))
}

ok2 :: proc () {
    sb: strings.Builder
    defer strings.builder_destroy(&sb)
    s := "paul t"
    v := transmute(Message_Content)s
    fmt.sbprintf(&sb, "%v", as_string (v))
    fmt.println (strings.to_string (sb))
}

main :: proc () {
  ok ()
  ok1 ()
  ok2 ()
}

as_unchanged :: proc (c : Message_Content) -> []u8 {
  return transmute([]u8)c
}

as_string :: proc (x : Message_Content) -> string {
  return transmute(string)x
}
