proto Sender (component, port) {
    component : component,
    port : port
}

proto Receiver (component, port) {
    component : component,
    port : port
}

proto Message (port, data) {
    port : port,
    data : data
}

proto Decoupler (parent, name) {
    parent : parent,
    name : name,
    inq : new FIFO (),
    outq : new FIFO (),
}

proto HSM (defaultState, enter, states, exit) {
    default : defaultState,
    enter : enter,
    states : states,
    exit : exit
}

proto State (enter, handler, exit, childMachine) {
}

// ------

methods HSM {
    handle
}

signature HSM {
    default : State,
    enter : Procedure,
    exit : Procedure,
    state : List of State
    handle : MessageHandler
}

proto CoupledComponent (???) {
    like state machine
}
