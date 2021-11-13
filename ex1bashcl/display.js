var fs = require ('fs');
try {
    var text = fs.readFileSync ('/dev/fd/6');
    console.error (`[js display]: ${text}`);
} catch (err) {
    throw err;
}
