var messageClass = require ('./message.js');

function Container () {
    // api for every Component
    this.reset = reset;
    this.isCompleted = isCompleted;
    this.handle = handle;
    this.step = step;
    this.setChildren = setChildren;
    this.setRoutings = setRoutings;
    this.outputs = [];

    // helper functions
    this.internal_acceptInput = acceptInput;
    this.internal_mergeOutputs = mergeOutputs;
    this.internal_route = route;
    this.internal_runToCompletion = runToCompletion;
}

function setChildren (childrenArray) {
     // additions for Container Components
    childrenArray.forEach (child => {
	child.container = this;
    });
    this.children = childrenArray;
}

function setRoutings (map) {
    this.routingMap = map;
}

function reset () {
    this.children.forEach (child => {
	child.reset ();
    });
}

function isCompleted () {
    var done = true;
    this.children.forEach (child => {
	done = done & child.isCompleted ();
    });
    return done;
}

function handle (message) {
    this.reset ();
    if (this.isCompleted ()) {
	throw "internal error: container.handle called on completed container";
    }
    this.internal_acceptInput (message)
    function send (port, data) {
	this.outputs.push (new messageClass.Message (port, data, this, message));
    }
    this.internal_runToCompletion (send);
    this.outputs.push (new messageClass.Message ('$out', null, this, message));
}

function acceptInput (message) {
    this.outputs = [];
    this.routingMap.forEach (connection => {
	if ("down" == connection.direction) {
	    var m = new messageClass.Message (connection.port, message.data, this, message);
	    var childOutputs = connection.receiver.handle (m, sendFunction);
	    this.outputs = this.internal_mergeOutputs (outputs, childOutputs);
	} else if ("passthrough" == connection.direction) {
	    var childOutputs = new messageClass.Message (connection.port, message.data, this, message);
	    this.outputs = this.internal_mergeOutputs (this.outputs, childOutputs);
	}
    });    
}

function mergeOutputs (outputs, childOutputs) {
    // outputs & childOutputs are queues
    // copy from least recent to most recent
    var clonedOuts = Array.from (outputs);
    var childOuts = childOutputs.reverse ();
    childOuts.forEach (cout => {
	clonedOutputs.push (cout);
    });
    return clonedOutputs;
}

function runToCompletion (sendFunction) {
    while (! this.completed ()) {
	this.step (sendFunction);
	this.route (sendFunction);
    }
}

function step (sendFunction) {
    this.children.forEach (child => {
	child.step (sendFunction);
    });
}

function route (sendFunction) {
    this.routingMap.forEach (connection => {
	var deferredMessageStack = [];
	if ("across" == connection.direction) {
	    var outputMessage = connection.sender.outputQueue [connection.sender.port];
	    var message = new messageClass.Message (connection.receiver.port, outputMessage.data, connection.sender, outputMessage);
	    deferredMessageStack.push ({'target': connection.receiver, 'message': message});
	} else if ("up" == connection.direction) {
	    var outputMessage = connection.sender.outputQueue [connection.sender.port];
	    var message = new messageClass.Message (connection.receiver.port, outputMessage.data, connection.sender, outputMessage);
	    send (connection.receiver.port, message);
	}
	deferredMessageStack.forEach (pair => {
	    pair.target.handle (pair.message, sendFunction);
	});
    });
}

exports.Container = Container;

