var messageClass = require ('./message.js');

function Leaf (func) {
    this.func = func;
    this.reset = reset;
    this.isCompleted = isCompleted;
    this.handle = handle;
    this.step = step;
    this.outputs = [];

    this.reset ();

}

function handle (message, sendFunction) {
    if (this.state === "armed") {
	function send (port, data, trace) {
	    this.outputs.push (new messageClass.Message (port, data, trace));
	}
	var val = this.func (message, send);
	this.outputs.push (new messageClass.Message ('$out', val, message));
	this.state = "completed";
    } else {
	throw "Leaf not armed";
    }
}

function step (sendFunction) {
    // nothing to do
    // Leaf calls its function once, then doesn't call it again until reset() has been called
    // protocol: (1) call reset (2) call handle (3) call step 0 or more times
    // in a Leaf, (3) step should only be called after (2) handle has been called, hence, there is nothing left to do in step
    // in a Leaf (3) step is called only after the Leaf is in the completed state - step is a no-op in Leaf
    if (this.isCompleted ()) {
    } else {
	throw "internal error: Leaf.step called on armed leaf";
    }
}

function reset () {
    this.state = "armed"; // armed => ready to run function, completed => function already executed once
}

function isCompleted () {
    return this.state === "completed";
}

exports.Leaf = Leaf;
