// Constructor
// function Container (↩children, ↩map) {
//     @set š as instance of ≈
//     @set parent of each child as š
//     @set š.children array to ↩children
//     @return š
// }

function Container (children, map) {
    children.foreach (child => {
	child.container = this;
    });
    this.children = children;
    this.routingMap = map;
    this.handle = handle;
    this.route = route;
    this.runToCompletion = runToCompletion;
}


function handle (message) {
    this.routingMap.forEach (connection => {
	if ("down" == connection.direction) {
	    connection.receiver.handle (message);
	}
    });
}

function route () {
    this.routingMap.forEach (connection => {
	var deferredMessageStack = [];
	if ("across" == connection.direction) {
	    var outputMessage = connection.sender.outputQueue [connection.sender.port];
	    var message = Message (connection.receiver.port, outputMessage.data, outputMessage);
	    deferredMessageStack.push ({'target': connection.receiver, 'message': message});
	} else if ("up" == connection.direction) {
	    var outputMessage = connection.sender.outputQueue [connection.sender.port];
	    var message = Message (connection.receiver.port, outputMessage.data, outputMessage);
	    emit (connection.receiver.port, message);
	}
	deferredMessageStack.forEach (pair => {
	    pair.target.handle (pair.message);
	});
    });
}

// internal
function emit (outputPort, message) {
    throw 'this is not quite right yet';

    // ensure this has an output port queue
    if (this.outputQueue) {
    } else {
	this.outputQueue = {};
    }
    // ensure this has an output port with the given name
    if (this.outputQueue.outputPort) {
    } else {
	this.outputQueue.outputPort = [];
    }
    this.outputQueue.outputPort.enqueue (message);
}
