let animal = {
  eats: true
};
let rabbit = {
  jumps: true
};

rabbit.__proto__ = animal; // (*)

// // we can find both properties in rabbit now:
// alert( rabbit.eats ); // true (**)
// alert( rabbit.jumps ); // true


console.log (rabbit.eats);
console.log (rabbit.jumps);
console.log (rabbit.__proto__);
