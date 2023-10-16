Ultimate goal: brainstorm in Kinopio, use A.I. to convert this brainsstorming to chapters for a book (or essays for a blog)

advice appreciated - I'm reading up on Khoj, but, would like any help for reducing my learning curve ; I don't mind writing code if necessary but I don't want to reinvent the wheel or do unnecessary coding and thinking and learning, if possible

- background:
  - Kinopio arranges ideas as small snippets called "cards"
  - "cards" can be be joined by (directional) connections called "connections"
  - the meaning of a connection is defined by the user, not by Kinopio
	- e.g. in the simple example (see below), I use only "Connection Type 1" connections
	- I want to tell the A.I. that "Connection Type 1" means that the connections represent sub-headings
  - all of this info can be exported by Kinopio in JSON format
  - most of the JSON is related to display information (e.g. graphical paths), the semantic information is there, but intermingled with display information (e.g. semantic info is: card-id, card-text, connection start, connection-end, connection types) [I've use PROLOG to do such culling in the past, but, I wonder if A.I. can do it for me with less bother]
  - I would like A.I. to cull the JSON, leaving only the semantic info
  - I would like to tell the A.I. what each kind Connection should mean (sub-headings, footnotes, etc.)
  - I would like A.I. to wrap prose around the points ("cards") to create chapters / essays out of the point-form brainstorming
  - a (simplified) sample Kinopio page ("space") is: https://kinopio.club/sw-atoms-XidvtBMoiFFoAGym3XYx4
  - the JSON output of this page is: https://github.com/guitarvydas/play/blob/dev/swatoms/SW%20Atoms.json
  - this all sounds like it's in the right ballpark, but, I don't know how to do it yet, nor if I can coax Khoj into doing it
  
Thoughts would be appreciated. I wish to cull my learning curve, comments (knee-jerk, untested) are welcome (by definition you know more than I do about what Khoj is capable of).

I've seen ChatGPT deal with this sort of stuff, but the limitations on prompt text length prevented me from doing anything serious.

- (sub-question: I've told Khoj to look in a certain local directory.  If I were to manually convert this stuff to .md format in that certain directory, how do I get Khoj to see the new stuff?)

