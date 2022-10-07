- class *id* { ... }

-- prop - property declaration (not definition)
-- include - inheritance of another class, order of includes matters
-- predicate - declaration of a function that returns yes/no (only)
-- value - declaration of a function that returns a value (type specified further down)
-- action - declaration of a routine that returns nothing (side-effect only)

- predicate and action can have either 0 or 1 parameters

- internal *id* { ... }
-- same as class, but can only be used in scripts, not exported

- .*id* - dereference of slot *id* in current class/internal
- $*id* - dereference of parameter *id* in current after initializer for class/internal
- %*id* - dereference of local variable *id* in code
- %*id* - var declarations of local variable *id* in code
- : Down *port* *pair* - down-connection
- : Across *pair* *pair* - across-connection
- : Up *pair* *port* - up-connection
- : PassThrough *port* *port* - pass-through-connection
- { *id* *port* } - Pair
- @'...' - Port string name
- *class id*/*routine id*
- 
- signature *class id*/*routine id*
- with . *class id* { ... } all operations inside ... are prefixed with *class id*/

- [ *class id* ] -- stack (list) of *class id*, top is left-most (first of list) 
- after initializer for *class id* ( parameter-block ) { ... } - script that is invoked after an empty (uninitialized) object has been allocated - initialization is recursive, deepest-first
-- parameter-block contains 1 or more data 
-- parameter-block specifies destructuring of parameters in block of data
-- string '...'
-- string with eval (id) '...«id»...'
-- comma "," is white-space

- connection
-- :{ Down *port* *pair* }
-- :{ Up *pair* *port* }
-- :{ Across *pair* *pair* }
-- :{ PassThrough *port* *port* }

- data block
-- *id*
- destructured data block
-- ( *id* )

- types of routines
-- action
-- parameterized-action
-- predicate
-- parameterized-predicate
-- value
-- parameterized-value


;; - altscript borrowing:
;; -- [ *id*+ ] stack of operands
;; -- { *key* *value* } object block
;; -- ( *id*+ ) expression block - eval each *id*
;; -- numerical value
;; --- digit+
;; --- digit+ "." digit+ -- floating point
;; --- digit+ "," digit+ -- floating point (European)
;; --- $*float* - high precision float (currency)
;; --- #hexdigit+ - hexadecimal integer
;; --- number x number - coordinate
;; 

