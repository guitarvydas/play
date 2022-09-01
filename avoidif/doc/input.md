# Component Diagram

![[test5.png]]

---
# Components
![[test5-Components.png]]

---
# Connections
![[test5-Connections.png]]

---
# Self

![[test5-Self.png]]

---
# Routing
![[test5-Routing.png]]

---
# Container Owns Routing Map

![[test5-Container Owns Routing Map.png]]

# Internal Naming
![[test5-Internal Naming.png]]

---
# Text Version 
- Simplified - Details Removed
```
...
{
  "receivers": [ {"receiver": {"component":"cell_7", "port":"b"}} ],
  "senders": [ {"sender": {"component":"cell_6", "port":"a"}} ]
},
{
  "receivers": [ {"receiver": {"component":"cell_8", "port":"d"}} ],
  "senders": [ {"sender": {"component":"cell_7", "port":"c"}} ]
},
{
  "receivers": [ {"receiver": {"component":"cell_6", "port":"f"}} ],
  "senders": [ {"sender": {"component":"cell_8", "port":"e"}} ]
}
...
```

---
## Routing Textified
HelloWorld.a -> Hello.b
Hello.c -> World.d
World.e -> Helloworld.f

---
# The Problem
Wanted:
- emit code for the diagram
- a -> b becomes *down*
- b -> c becomes *route*
- e -> f becomes *up*
---
# A Solution

3 basic steps

---
# Steps
- convert diagram to text
	- so that existing tools can be used (Ohm-JS)
- use Ohm-Editor to REPL-create a grammar
- use syntax-directed transpilation in small steps
	1. fixup *self*
		- cell_6 -> self
	2. match routing use-cases
	3. emit code
---
# Gory Details
## Skip This Unless You Want To Build A Transpiler
- tbd elsewhere
- 
