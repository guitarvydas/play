const net = require ('net');
const fs = require ('fs');

var inputPortNumber = 59090;
var inputPort = net.createServer ((socket) => {
    socket.on ('data', (buff) => {
	var s = buff.toString ('utf-8');
	console.log (s);
	inputPort.close ();
    });
});
inputPort.maxConnections = 1;
inputPort.listen (inputPortNumber);
console.log (`stringwriter listening on ${inputPortNumber}`);
