package odinany2

import "core:fmt"
import "core:os"
import "core:strings"

Message :: struct {
    port:  Port_Type,
    datum: Datum_Type,
    from: DontCare,
    cause: ^Message, // message that caused this message
}

Port_Type :: string
Datum_Type :: any
DontCare :: string

clone_port :: proc (s : string) -> Port_Type {
    p : Port_Type = strings.clone (s) // clone to heap
    return p
}


// Utility for making a `Message`. Used to safely "seed" messages
// entering the very top of a network.

make_message :: proc(port: Port_Type, data: Datum_Type, who : DontCare, cause: Message) -> Message {
    pcause := cause
    p := clone_port (port)
    data_ptr := new_clone(data)
    data_id := typeid_of (type_of (data))

    m := new (Message)
    m.port  = p
    m.datum = any{data_ptr, data_id}
    m.from = who
    m.cause = &pcause

    return m^
}

read_text_file_proc :: proc(msg: Message) {
    fd, errnum := os.open ((msg.datum).(string))
}

main :: proc() {
    nothing := Message {}
    m := make_message ("abc", "/tmp/junk.txt", "dontcare", nothing)
    read_text_file_proc (m)
}
