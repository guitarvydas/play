// from https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
// sleep time expects milliseconds
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

function waitForBaton (id) {
    console.error (`waiting for baton ${id}`);
    var _ = fs.readFileSync ('/dev/fd/3');
}

function sendBaton () {
    fs.writeFileSync ('/dev/fd/4', 'phase2');
}

function Send (socket, message) {
    socket.write (text);
}
