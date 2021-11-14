const net = require ('net');

exports.timedWaitForBaton = function (port) {
  return new Promise((resolve) => setTimeout(resolve, 1));
}

exports.waitForBaton = function (portNumber, func) {
    let batonInput = net.createServer ((socket) => {
	socket.on ('data', (buff) => {
	    var s = buff.toString ('utf-8');
	    func (s);
	});
    });
    batonInput.maxConnections = 1;
    batonInput.listen (portNumber);
}
