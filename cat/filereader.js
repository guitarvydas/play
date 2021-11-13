const net = require ('net');
const fs = require ('fs');
const kernel = require ('./kernel.js');

var text = fs.readFileSync ("test.txt");

var inputPortNumber = parseInt (process.argv [2]);
var outputPortNumber = parseInt (process.argv [3]);
var output = new net.Socket ();

kernel.waitForBaton ();
sleep(1).then(() => {
    console.error (`filereader connecting ${outputPortNumber}`);
    output.connect ({ host: "127.0.0.1", port: outputPortNumber},
		  () => {
		      kernel.Send (output, text);
	      });
});    
kernel.sendBaton ()

