// see https://cs.lmu.edu/~ray/notes/jsnetexamples/

const net = require ('net');
const fs = require ('fs');
const kernel = require ('./kernel.js');

var text = "ghi jkl";

var batonInput = process.argv [2];
var batonOutput = process.argv [3];
var inputPortNumber = process.argv [4];
var outputPortNumber = process.argv [5];
var output = new net.Socket ();

kernel.waitForBaton (batonInput, (s) => {
    send (s);
});

function send (s) {
    output.connect ({ host: "127.0.0.1", port: outputPortNumber},
		    () => {
			output.write (s);
		    });
}
