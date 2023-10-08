package odinstate

import "core:fmt"

State :: struct {
    state : int
}

mutate_state :: proc (any1: any, any2: any) {
    fmt.printf ("begin mutate\n  any1=%p %v\n  any2=%p %v\n", any1, any1, any2, any2)
    a1 := any1.(^State)
    a2 := &any2.(State)
    a1.state = 51
    a2.state = 75
    fmt.printf ("finish mutate\n  a1=%p %v\n  a2=%p %v\n", a1, a1, a2, a2)
}

do_nothing :: proc (envany: any) {
    x := 1
    y := 2
    z := 3
    fmt.println (envany, x, y, z)
}

main :: proc () {
    a1 := new (State)
    a2 := new (State)
    a1.state = 1
    a2.state = 2
    fmt.printf ("a1=%p %v, a2=%p %v\n", a1, a1, a2, a2)
    mutate_state (a1, a2^)
    do_nothing (0)
    fmt.printf ("a1=%p %v, a2=%p %v\n", a1, a1, a2, a2)
}

