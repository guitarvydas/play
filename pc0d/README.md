working paper Oct. 11, 2022

intention: define templates for Objects using multiple views/sections:

0. ids (names)
- standard ASCII version: letter alphanum*
- containing spaces, other ids, etc.
-- Unicode brackets ❲...❳
-- ... can be anything, including other bracketed ids
-- brackets must be matching pairs - ATM no error message for mis-matched brackets

0. blocks
- { ... } (ASCII brace brackets)
-- ... can be anything, including other blocks
-- brackets must be matching pairs - ATM no error message for mis-matched brackets

1. template *id* *block*
   - defines slots for each Object
   -- slot types:

   --- prop : property slot, a handle

   --- incorporate

   --- action
   --- action-predicate
   --- value
   --- predicate

   --- parameterized-action
   --- parameterized-action-predicate
   --- parameterized-value
   --- parameterized-predicate

- internal *id* *block*
-- needed?

2. synonyms

- synonym *id* = external
- external id
- id is simply a handle to underlying code

- synonym *id* = *other id*
- synonym (abbreviation) for "other id"

- synonym *id* = [ *other id* ]
- stack of *other id*
- top of stack == left-most item (push onto left-most, pop from left-most)

