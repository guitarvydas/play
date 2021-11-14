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



// from https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
// sleep time expects milliseconds
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
