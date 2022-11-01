var container = require ('./container.js');
var leaf = require ('./leaf.js');
var messageClass = require ('./message.js');

function helloWorld () {
    return 'Hello World';
}

function ConstructTop () {
    var top = new container.Container ();
    var leaf1 = new leaf.Leaf (helloWorld);
    var routings = [
	{'direction': 'down', 'receiver': leaf1, 'port' : '$in'},
	{'direction': 'up', 'receiver': top, 'port' : '$out'}
    ];
    top.setChildren ([leaf1]);
    top.setRoutings (routings);
    return top;
}

var top = ConstructTop ();
top.handle (new messageClass.Message ('$in', true, null, null));
top.runToCompletion ();
print (top.outputs);
