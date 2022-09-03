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
  sender: {"cell_6", "a"}
  receiver: {"cell_7", "b"}
}
{
  sender: {"cell_7", "c"}
  receiver: {"cell_8", "d"}
}
{
  sender: {"cell_8", "e"}
  receiver: {"cell_6", "f"}
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

- 3 basic steps
- "declaration before use" handled by computer, not by programmers
	- pipeline allows input file to "use before declaration" (if desired)
---
# Steps
1. convert diagram to text
2. use Ohm-Editor to REPL-create a grammar
3. use syntax-directed transpilation in small steps (3)
	1. fixup *self*
		- cell_6 -> self
	2. match routing use-cases
	3. emit code
---
# Step 1 Convert Diagram to Text
1. convert diagram to text
	- so that existing tools can be used (Ohm-JS)
	- see "Text Version", shown previously

```
const src = String.raw`
{
  sender: {"cell_6", "a"}
  receiver: {"cell_7", "b"}
}
{
  sender: {"cell_7", "c"}
  receiver: {"cell_8", "d"}
}
{
  sender: {"cell_8", "e"}
  receiver: {"cell_6", "f"}
}
```

# Step 2 Connections Ohm Grammar
![[connections.ohm.png]]

---
# Step 3 Generate Code
a. Rough-in a Rewriter

Rewrite original source in 3 passes

---
## Step 3 - Rewrite In Several Passes

b. fixup *self*
	- cell_6 -> self
c. match routing use-cases
	- *route*
	- *down*
	- *up*
	- *pass-through*
d. emit new code

---

## a. Rough-in a Rewriter 
- create an identity FMT specification
- rough-in .HTML program (*avoidif.html*)
	- pipeline of 3 passes
	- each pass has a separate grammar (slightly different / stripped-down)

---

### Rough-In A Rewriter: Connections FMT Specification
![[FMT Explorer connections.ohm.png]]

---
## Rough-In HTML File (*avoidif.html*)
- Create a pipeline that applies the same grammar 3 times

- When that works, hack on pass 2 and pass 3 to use intermediate grammars (each slightly different)
![[Rough-in AvoidIf.html.png]]
---
## Rough-In HTML File (*avoidif.html*) con't
- change code to feed transpiled output into next input
	- pass1transpiled -> pass 2
	- pass2transpiled -> pass 3
- add newlines to help with debugging readability
---
### b. Step 3 - Fixup Self 

Pass 2 changes all "cell_6" to "self"

```
...
function maybeMapSelf (s) {
    if ('"cell_6"' === s) {
        return '"self"';
    } else {
        return s;
    }
}
...
  ComponentName [s] = ‛⟨maybeMapSelf (s)⟩’
...
```

N.B. '"cell_6"' hard-coded to make this example more clear, see eh.html for a more detailed version

- hint: use a "lifting" pass to determine self's *id* before use, to help subsequent passes
	- lifting pass does only 1 job: determine *self*'s id, emit that id before all other code
	- computer performs declaration-before-use, programmers don't need to deal with this

---
### c. Step 3 Match Routing Use-Cases
- *route*: self.child -> self.child
- *down*: self input -> self.child
- *up*: self.child -> self output
- *pass-through*: self input -> self output

---
#### c. Add More Detail to Connection Rule
```
...
Connection = 
    | "{" SelfSender SelfReceiver "}" -- passThrough
    | "{" SelfSender Receiver "}" -- down
    | "{" Sender SelfReceiver "}" -- up
    | "{" Sender Receiver "}" -- route
...
```

N.B. Order matters - specify most specialized first

---
#### c. Add More Detail to Sender and Receiver Rules
```
...
  SelfSender = "sender" ":" "{" SelfComponentName "," PortName "}"
  Sender = "sender" ":" "{" ComponentName "," PortName "}"
  SelfReceiver = "receiver" ":" "{" SelfComponentName "," PortName "}"
  Receiver = "receiver" ":" "{" ComponentName "," PortName "}"
...
```
---
### d. Step 3 - Emit New Code
Finally, we have enough information to choose between `self.route` or `self.down` or `self.up` or `self.passThrough`.
```
...
  Connection_route [lb Sender Receiver rb] = ‛\nConnection (⟨Sender⟩, ⟨Receiver⟩, self.route)’
...
```
---
#### d. Emitter Details
```
Connections {
  Connections [Connections+] = ‛⟨Connections⟩’
  Connection_route [lb Sender Receiver rb] = ‛\nConnection (⟨Sender⟩, ⟨Receiver⟩, self.route)’
  Connection_down [lb Sender Receiver rb] = ‛\nConnection (⟨Sender⟩, ⟨Receiver⟩, self.down)’
  Connection_up [lb Sender Receiver rb] = ‛\nConnection (⟨Sender⟩,⟨Receiver⟩, self.up)’
  Connection_passThrough [lb Sender Receiver rb] = ‛\nConnection (⟨Sender⟩, ⟨Receiver⟩, self.passThrough)’
  Sender [ksender kcolon lb ComponentName kcomma PortName rb] = ‛{⟨ComponentName⟩, ⟨PortName⟩}’
  SelfSender [ksender kcolon lb ComponentName kcomma PortName rb] = ‛{⟨ComponentName⟩, ⟨PortName⟩}’
  Receiver [kreceiver kcolon lb ComponentName kcomma PortName rb] = ‛{⟨ComponentName⟩, ⟨PortName⟩}’
  SelfReceiver [kreceiver kcolon lb ComponentName kcomma PortName rb] = ‛{⟨ComponentName⟩, ⟨PortName⟩}’

  SelfComponentName [s] = ‛self’
  ComponentName [s] = ‛⟨s⟩’
  PortName [s] = ‛⟨s⟩’

  string [q1 cs* q2] = ‛⟨q1⟩⟨cs⟩⟨q2⟩’
  dq [q] = ‛⟨q⟩’
```
---
# Gory Details
## Skip This Unless You Want To Build A Transpiler
- elsewhere
- see [eh](https://github.com/guitarvydas/eh) for a fully-worked solution to a real use-case
