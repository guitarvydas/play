Checking to see if what you mean by "token" means the same to me.  

(I'm back to thinking about this problem).

The following works, but I want to check if there is a better way to do it.

[A macro, for this simple example, is i(...), called an "identmacro", where "..." is a list of comma-separated idents]

[The token is "tIdentMacro".]


```
G {
  start = findMacros*
  findMacros =
    | applySyntactic<Macro> -- macro
    | ident                 -- ident
    | any                   -- any

  Macro = 
    | tIdentMacro "(" ListOf<ident, ","> ")"

  ident = identFirst identRest*
  identFirst = "A" .. "Z" | "a" .. "z" | "_" 
  identRest = "0" .. "9" | identFirst

  tIdentMacro = "i" ~identRest

}
```

I have generalized this using PEG "()" matching, but don't want to complicate the question.
