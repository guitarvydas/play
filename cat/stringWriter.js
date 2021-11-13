const net = require ('net');

var in1 = net.createServer  ((socket) => {
    socket.on ('data', (buff) => {
	var data = buff.toString ('utf-8');
	console.log (data);
    });
});
in1.listen (59091);
