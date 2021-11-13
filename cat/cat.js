const net = require ('net');

// from https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
// sleep time expects milliseconds
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

var in1 = net.createServer  ((socket) => {
    socket.on ('data', (buff) => {
	var data = buff.toString ('utf-8');
	out1.write (data);
    });
});
in1.listen (59090);

var out1 = new net.Socket ();
sleep(1).then(() => {
    out1.connect ({ host: "127.0.0.1", port: 59091});
});    

