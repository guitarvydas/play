function handler_phraseFaker (me, message) {
    me.send ("long phrase", "I Want A Hamburger With Ketchup And Bacon And Pickles");
}

var PhraseFaker_signature = {
    name: "Phrase Faker",
    inputs: [{name: "go", structure: []}],
    outputs: [
	{ name: "short phrase", structure: [] },
	{ name: "long phrase", structure: ["condiments", "extras"] }
    ]
};

let PhraseFaker_protoImplementation = {
    name: "Phrase Faker",
    kind: "leaf",
    handler: handler_phraseFaker,
    begin: function () {},
    finish: function () {}
};

function PhraseFaker (container, instancename) {
    let me = new Leaf (signature, PhraseFaker_protoImplementation, container, instancename);
    return me;
}
    
    
