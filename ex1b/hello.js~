// see https://cs.lmu.edu/~ray/notes/jsnetexamples/

const net = require ('net');
const fs = require ('fs');
const kernel = require ('./kernel.js');

var text = "abc def";

var outputPortNumber = 59090;
var output = new net.Socket ();

kernel.waitForBaton ().then(() => {
    console.error (`hello connecting ${outputPortNumber}`);
    output.connect ({ host: "127.0.0.1", port: outputPortNumber},
		    () => {
			output.write (text);
			output.destroy ();
		    });
});    
