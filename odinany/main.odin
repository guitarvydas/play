package odinany

import "core:fmt"

string_to_any :: proc (s : string) -> any {
    // a := any{v.data, ti.id}
    fmt.println ("s2a", s, raw_data (s), typeid_of (string))
    a := any {raw_data (s), typeid_of (string)}
    fmt.println (a)
    return a
}

any_to_any :: proc (s : any) -> any {
    return s
}

any_to_rawptr :: proc (s : any) -> rawptr {
    return raw_data(s)
}

any_to_typeof :: proc (s : any) -> int {
    return type_of (s)
}

main :: proc() {
    fmt.println (typeid_of (string))
    hc := "helloC"
    hd := "helloD"
    fmt.println ("begin main:", hc, hd, raw_data (hc), raw_data (hd))
    fmt.println ("any_to_any:", any_to_any (hd))
    fmt.println ("any_to_rawptr", any_to_rawptr (hc))
    fmt.println ("any_to_typeof", any_to_typeof (hc))
    fmt.println ("string_to_any:", string_to_any (hc))
    fmt.println ("end main:", hc, hd)
}
