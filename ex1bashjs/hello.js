// from https://nodejs.dev/learn/working-with-file-descriptors-in-nodejs

var fs = require ('fs');
try {
    fs.writeFileSync ('test.txt', '[js] hello\n')
} catch (err) {
    throw err;
}
