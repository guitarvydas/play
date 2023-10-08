package odinparameters

import "core:fmt"

State :: struct {
    state : int
}

mutate_state :: proc (env: ^State) {
    env.state = 21
}

main :: proc () {
    state_in_heap := new (State)
    state_in_heap.state = 7
    fmt.println (state_in_heap)
    mutate_state (state_in_heap)
    fmt.println (state_in_heap)
}

