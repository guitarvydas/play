package zd

import "core:strings"
import "core:mem"
import "core:os"
import "core:fmt"

main :: proc (){
    cs := "TARVY"
    fmt.printf ("%v\n", typeid_of (type_of (cs)))
    fmt.printf ("%v\n", len (cs))
    fmt.printf ("%v\n", raw_data (cs))
    fmt.printf ("%v\n", &cs)
    
    fmt.printf ("\n")
    clonedcs := strings.clone (cs)
    fmt.printf ("%v\n", typeid_of (type_of (clonedcs)))
    fmt.printf ("%v\n", len (clonedcs))
    fmt.printf ("%v\n", raw_data (clonedcs))
    fmt.printf ("%v\n", &clonedcs)

    fmt.printf ("\n")
    two_quads :: struct { a: rawptr, b : rawptr}  
    tq := transmute(two_quads)clonedcs
    fmt.printf ("%v\n", typeid_of (type_of (tq)))
    fmt.printf ("%v\n", tq.b)
    fmt.printf ("%v\n", tq.a)
    fmt.printf ("0x%p\n", &tq)

}
