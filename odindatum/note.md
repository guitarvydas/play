There is a bug in my code. In the process of debugging, I've come across something that I don't understand.

The last 2 lines of "main" produce what appears to be gibberish.

Any help/comments would be appreciated.

background: Main() wants to create a generic struct containing a string. The function "new_datum_strin()" appears to work and appears to display the copied string correctly. Main() can println() the result in whole, but, appears to print gibberish when println()ing the .data field of the result. [Itlooks like I've created a traditional C pointer problem of some sort.]


Whittled-down code...

```
package zd

import "core:strings"
import "core:mem"
import "core:os"
import "core:fmt"

Datum :: struct {
    data: any,
    clone: #type proc (^Datum) -> ^Datum,
    reclaim: #type proc (^Datum),
}

new_datum_string :: proc (s : string) -> ^Datum {
    p := new (Datum)
    p.data = strings.clone (s)
    p.clone = clone_datum_string
    p.reclaim = reclaim_datum_string
    fmt.println ("new_datum_string", p.data)
    return p
}

clone_datum_string :: proc (src: ^Datum) -> ^Datum {
    // don't care
    return src
}

reclaim_datum_string :: proc (src: ^Datum) {
    // don't care
}

main :: proc () {
    d := new_datum_string ("fr/find.md")
    fmt.println (d)
    fmt.println (d.data)
    fmt.println ("inject B", d.data)
}
```
