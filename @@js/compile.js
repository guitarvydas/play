var fs = require ('fs');

function compilefile (fname) {
    var name = '__dirname' + '/' fname;
    var s = fs.readFileSync(name,'UTF-8');
    eval(s);
}
