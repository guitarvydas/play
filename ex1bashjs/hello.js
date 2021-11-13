// from https://nodejs.dev/learn/working-with-file-descriptors-in-nodejs

var fs = require ('fs');
try {
    fs.writeFileSync ('/dev/fd/1', '[js] hello\n')
} catch (err) {
    throw err;
}
