package odinstate

import "core:fmt"
import "core:runtime"

State :: struct {
    state : int
}

Object :: struct {
    data : State
}

old_mutate_state :: proc (anyparam: any) {
    fmt.printf ("in proc %v\n", transmute(runtime.Raw_Any)anyparam)
    obj := anyparam.(Object)
    fmt.printf ("in proc obj=%p\n", obj)
    obj.data.state = 71
}

mutate_state :: proc (anyparam: any) {
    fmt.printf ("in proc %v\n", transmute(runtime.Raw_Any)anyparam)
    p := &anyparam.(Object)
    fmt.printf ("in proc obj=%p\n", p)
    p.data.state = 71
}

do_nothing :: proc (anyparam: any) {
    x := 1
    y := 2
    z := 3
    fmt.println (anyparam, x, y, z)
}

main :: proc () {
    v := new (Object)
    v.data.state = 5
    mutate_state (v^)
    do_nothing (0)
    fmt.printf ("%v\n", v)
}

