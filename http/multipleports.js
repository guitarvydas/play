//https://stackoverflow.com/questions/15098823/using-node-js-to-listen-on-2-different-ports/15098969

var http = require('http');

http.createServer(onRequest_a).listen(9011);
http.createServer(onRequest_b).listen(9012);

function onRequest_a (req, res) {
  res.write('Response from 9011\n');
  res.end();
}

function onRequest_b (req, res) {
  res.write('Response from 9012\n');
  res.end();
}
// Then, you can test it (with your browser, or curl):

// $ curl http://localhost:9011
// Response from 9011

// $ curl http://localhost:9012
// Response from 9012
