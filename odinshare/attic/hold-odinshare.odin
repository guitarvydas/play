package odinshare

import "core:fmt"

buff :  [1]rune
sbuff :: struct {
    buff : [1]rune
}

basic :: proc () {
    buff[0] = 'a'
    fmt.println (buff)
    buff_copy := (new_clone (buff))^
    buff[0] = 'z'
    fmt.println (buff)
    fmt.println (buff_copy)
}

deeper :: proc () {
    b : sbuff
    b.buff[0] = 'a'
    fmt.println (b)
    b_copy := (new_clone (b))^
    b.buff[0] = 'z'
    fmt.println ("b:      ", b)
    fmt.println ("b_copy: ", b_copy)
}

main :: proc () {
//    basic ()
    deeper ()
}

