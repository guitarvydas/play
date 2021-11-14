

// from https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
// sleep time expects milliseconds
exports.waitForBaton = function () {
  return new Promise((resolve) => setTimeout(resolve, 1));
}
