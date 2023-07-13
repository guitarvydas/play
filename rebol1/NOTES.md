You just about have it figured out.

## Discussion

recap: The "global environment" is the environment in which ALL other evaluations take place.  It is a "soup" of bindings.  There are 2 choices:
1. Do the imperative thing and make the the global environment global, then set! as 'define's go by.  The parameter 'environment' is passed by reference (implicitly), so you can grab various bits of it and modify it in-place using set!.  This is what the original code does.  
2. Do the pure-functional thing, push a new definition onto the front of the parameter and recur, making all future evaluations "see" the new version of the envinronment.  The depth of the callstack depends on the number of 'defines' in the code, which is probably quite manageable for today's machines.  In 1950, we didn't have memory to spare, so in-place modification was vital.  Also, the hardware CPU+RAM works like this, so it seemed natural to keep doing that.  

The problem with (2) is if you want to build a REPL.  A REPL is a soup of definitions.  You can add definitions to the soup, or, you can change existing definitons.  Every time you add a new definition, you have to restart and recur on the REPL, so that subsequent evals see the new definition.  All definitions disappear when the REPL RETURNs, since successive versions of 'environment' are stored on the callstack only, not in some global place.  An obvious approach to building a recursive REPL is to ensure that ALL definitions are re-scanned and re-curred into place EVERY time the REPL comes up for air.  In essence, the file system becomes the "global" environment - the file system stores source code in a persistent manner and the REPL simply re-reads the source code every time around.

Of course, if you have free tail-call-optimization, the "problem" goes away and you can recur until the cows come home.

Recursive calling with tail-recursion-optimization is a synonym for LOOP.  Purists will tell you that recursion is the CORRECT way to write a LOOP.  The ONLY way to write a LOOP.  Practically, it is true that older forms of LOOP were too low-level and encouraged programmers to skip over niggly details on loop termination, thereby creating mysterious bugs.

It would seem that the preferred way in Racket is to convert the code to be recursive (then, rely on tail-call-optimization).

## Towards the Answer:

So, I've stuck Marshall's code into a file and I've got it running in LispWorks.  Let's see if I can convert it into recursive form...

### a

This line of code confuses me
```
(setf (car environment) (acons symbol value (car environment))))))
```

(in function `envinronment-define!`)

To understand this line, one must know what the shape of `environment` is.

aside: In essence, the code hard-codes knowledge of the data structure into the code itself.  You MUST know what the data structure looks like before you can understand what the code is doing.  This is something that OO tried to address - remove all knowledge of data shapes from the main code and allow every class to define operations on itself, which the main code references as methods.

So, I've modified the code to dump out the final environment (see modified testit):

(((FACT-ITER . #<CLOSURE 402000269B>) (FACT . #<CLOSURE 4020002663>) (FIB . #<CLOSURE 402000262B>) (ADD . #<Function + 40F0044AD4>) (LESSP . #<Function < 40F006EFD4>) (MULT . #<Function * 40F006D2E4>) (PRINT . #<Function PRINT 40F00AACAC>) (SUB . #<Function - 40F006D4E4>) (SUB1 . #<Function 1- 40F00A8B4C>) (ZEROP . #<Function ZEROP 40F006EF54>)))

which, when pretty-printed is:

(
 (
  (FACT-ITER . #<CLOSURE 402000269B>) 
  (FACT . #<CLOSURE 4020002663>) 
  (FIB . #<CLOSURE 402000262B>) 
  (ADD . #<Function + 40F0044AD4>) 
  (LESSP . #<Function < 40F006EFD4>) 
  (MULT . #<Function * 40F006D2E4>) 
  (PRINT . #<Function PRINT 40F00AACAC>) 
  (SUB . #<Function - 40F006D4E4>) 
  (SUB1 . #<Function 1- 40F00A8B4C>) 
  (ZEROP . #<Function ZEROP 40F006EF54>)
  )
 )

Ahh, so an environment is a list containing one list (an alist).  So the mysterious line of code `(setf (car environment) ...)` just replaces the alist with a new alist.  There is only 1 `car` of the above environment.  Mutating the `car` (with `setf`) replaces that 1 `car` with a different value (another alist).

The RIGHT way to fix this code is to make environment a class which contains a hash table and provides 2 methods:
- insert new key:value
- lookup.

Alists are sooo 1950s anyway...  Alists imply linear lookup times, while hash tables give better performance (non-linear).

... break ...
