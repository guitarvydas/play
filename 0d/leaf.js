function handle (message) {
    var resultMap = {};
    function send (port, data) {
	resultMap = enqueue (resultMap, port, data);
    }
    var val = this.func (message, send);
    resultMap = enqueue (resultMap, 'out', val);
    return resultMap;
}

function route () {
    // nothing to do
}

function Leaf (func) {
    this.func = func;
}


// internal
function enqueue (resultObj, portName, val) {
    if (resultObj [portName]) {
    } else {
	resultObje [portName] = [];
    }
    resultObj [portName].push (val);
    return resultObj;
}
