What is the correct way to write "string_to_any"?

(I might have a wrong mental model of what `any` is, so the answer might be: not possible and here's why).

In this whittled-down example, the first println prints the function result as the empty string.

```
package odinany

import "core:fmt"

string_to_any :: proc (s : string) -> any {
    s2 := s
    return s2
}

any_to_any :: proc (s : any) -> any {
    s2 := s
    return s2
}

main :: proc() {
    fmt.println ("string_to_any:", string_to_any ("helloA"))
    fmt.println ("any_to_any:", any_to_any ("helloB"))
}
```
