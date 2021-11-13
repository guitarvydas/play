const net = require ('net');
const fs = require ('fs');

var text = fs.readFileSync ("test.txt");

// from https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
// sleep time expects milliseconds
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

var out1 = new net.Socket ();
sleep(1).then(() => {
out1.connect ({ host: "127.0.0.1", port: 59090},
	      () => {
		  out1.write (text);
	      });
});    
