const assert = require('assert');

class MyError extends Error {
	constructor() {
		super();
	}
}

let flag = false;

try {
	throw new MyError();
} catch(err) {
	console.error(err);
} finally {
	flag = true;
}

assert.equal(flag, true);
