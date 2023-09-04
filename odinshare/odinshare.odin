package odinshare

import "core:fmt"

sbuff :: struct {
    buff : [5]rune
}
clone_sbuff :: proc (orig: ^sbuff) -> ^sbuff {
    return new_clone (orig^)
}

deeper :: proc () {
    b : sbuff
    for i := 0; i < 5; i += 1 {
        b.buff[i] = 'a'
    }
    fmt.println ("orig b: ", b)
    b_copy := new_clone (b)
    b_copy2 := clone_sbuff (b_copy)
    for i := 0; i < 5; i += 1 {
        b.buff[i] = 'z'
    }
    b_copy.buff[0] = 'y'
    fmt.println ("b:       ", b)
    fmt.println ("b_copy:  ", b_copy)
    fmt.println ("b_copy2: ", b_copy2)
}

main :: proc () {
    deeper ()
}

