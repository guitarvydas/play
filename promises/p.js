async function f () {
    return "f done";
}

var x = "not done"
f ().then (result => { 
    x = result;
});

console.log (x);
