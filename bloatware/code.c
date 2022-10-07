/****/

float add2if (int a, float f) {
}

float add2ii (int a, int f) {
}

float add2ff (float a, float f) {
}

float add2fi (float a, int f) {
}


void main_bloated () {
  int a;
  float f;
  float result;
  result = add2if (a, f);
}

/****/

normalized add2normalized (normalized a, normalized f) {
}

void main_not_bloated () {
  normalized a;
  normalized f;
  normalized result;
  result = add2normalized (a, f);
}

/*
  unix FDs -> normalized access to all files & devices
  SELF -> determine un-normalizing (unrolling) at runtime, not compile-time, unrolling / JIT done on-the-fly
  USB : appears "complicated" because it is a union of possibilities instead of a normalization (reduction of possibilities)
  Concurrency via Message Passing -> normalized inter-process communication (simple)
  Concurrency via locking -> specialized, not normalized, per use-case (difficult, too much nuance)
  APIs - supposed to be a reduction of possibilities
       - simplicity thwarted by gradual addition of parameters

  checking for combination of types must be done, but, where to put it?
  normalized ("dynamic") variables allow most code to be small, push unrolling/checking down to lowest levels
  specialized ("static") variables are handled in every function, pervasively

"State Explosion Problem"
- the main reason why people avoid state machines
- Harel's StateCharts encapsulate state explosion problem
-- top down overriding, not bottom-up
- sync code, stong type-checking experiences "state explosion problem"
-- lots of types => lots of possible states

what does this suggest? 
- check types only at low levels
-- macros devolve all code to sequences of low-level operations
--- Lispers understand "macro mentality"
--- compiler writers / language designers build full-blown compilers instead of macros
--- Ohm-JS => macros for the rest of us
--- text-based languages - grids of non-overlapping bitmap cells, sync left-to-right & top-to-bottom
---- working outside of this box - non-sync, overlapping, etc. - requires epicycles (aka workkarounds)

- type stacks - progressive type checking
- check types in dev code, eschew type checking in production code
- divide type checking away from 1st-pass coding
-- OPL - Orthogonal Programming Languages
--- express all operands in normalized format, e.g. Objects
--- Objects check whether operations can be applied
--- Objects unroll type info and contain bloated code
- Sector Lisp
-- successfully small
--- one reason is that there are only 2 types
--- very little code needed to check types - binary decision 1/0 (List/Atom)
*/
