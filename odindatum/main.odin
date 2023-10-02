package zd

import "core:strings"
import "core:mem"
import "core:os"
import "core:fmt"

main :: proc (){
    cs := "TARVY"
    fmt.printf ("%v\n", typeid_of (type_of (cs)))
    fmt.printf ("%v\n", raw_data (cs))
    fmt.printf ("%v\n", len (cs))
    fmt.printf ("%v\n", &cs)
    
    fmt.printf ("\nBLOCK 2\n")
    clonedcs := strings.clone (cs)
    fmt.printf ("%v\n", typeid_of (type_of (clonedcs)))
    fmt.printf ("%v\n", raw_data (clonedcs))
    fmt.printf ("%v\n", len (clonedcs))
    fmt.printf ("%v\n", &clonedcs)

    // \nBLOCK 3
    fmt.printf ("\nBLOCK 3\n")
    pany : ^any = new (any)
    pany^ = clonedcs
    fmt.printf ("%v\n", typeid_of (type_of (pany.(string))))
    fmt.printf ("%v\n", raw_data (pany.(string)))
    fmt.printf ("%v\n", len (pany.(string)))
    fmt.printf ("0x%p\n", &pany)

    // \nBLOCK 4
    fmt.printf ("\nBLOCK 4\n")
    Datum :: struct { data : any }
    pdatum : ^Datum = new (Datum)
    pdatum.data = clonedcs
    fmt.printf ("%v\n", typeid_of (type_of (pdatum.data.(string))))
    fmt.printf ("%v\n", raw_data (pdatum.data.(string)))
    fmt.printf ("%v\n", len (pdatum.data.(string)))
    fmt.printf ("0x%p\n", &pdatum)

}
