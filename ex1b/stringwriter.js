const net = require ('net');
const fs = require ('fs');
const kernel = require ('./kernel.js');

var batonInput = process.argv [2];
var batonOutput = process.argv [3];
var inputPortNumber = process.argv [4];
var outputPortNumber = process.argv [5];

var inputPort = net.createServer ((socket) => {
    socket.on ('data', (buff) => {
	var s = buff.toString ('utf-8');
	console.log (s);
    });
});
inputPort.maxConnections = 1;
inputPort.listen (inputPortNumber);

kernel.sendBaton (batonOutput);
