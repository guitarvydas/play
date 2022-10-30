all:
	cat syn1-head.js fmt-js/fmt-js.js fmt-js/transpile.js syn1.js syn1-tail.js >exec.js
	node exec.js

install: npmstuff repos

repos:
	multigit -r

npmstuff:
	npm install ohm-js yargs atob pako
