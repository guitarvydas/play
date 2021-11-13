const net = require ('net');
const fs = require ('fs');
const kernel = require ('./kernel.js');


var inputPortNumber = parseInt (process.argv [2]);
var outputPortNumber = parseInt (process.argv [3]);

var outputPort = new net.Socket ();
var input = net.createServer  ((socket) => {
    socket.on ('data', (buff) => {
	var data = buff.toString ('utf-8');
	outputPort.write (data);
    });
});

input.listen (inputPortNumber);
console.error (`cat listening on ${inputPortNumber}`);

kernel.waitForBaton ();
sleep(2).then(() => {
    console.error (`cat connecting ${output}`);
    outputPort.connect ({ host: "127.0.0.1", port: outputPortNumber});
});    
kernel.sendBaton ();
