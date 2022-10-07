let animal = {
    eats: true,
    walk () {
	console.log ('Animal walk');
    }
};
let rabbit = {
    jumps: true,
    __proto__: animal
};

rabbit.walk ();

for (let prop in rabbit) {
    let isOwn = rabbit.hasOwnProperty (prop);
    console.log (`${prop} ${isOwn}`);
}
