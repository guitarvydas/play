package odinany2

import "core:os"
import "core:strings"

Message :: struct {
    datum: Datum_Type,
}

Datum_Type :: any

make_message :: proc(data: Datum_Type) -> Message {
    data_ptr := new_clone(data)
    data_id := typeid_of (type_of (data))

    m := new (Message)
//    m.datum = any{data_ptr, data_id}
    m.datum = data

    return m^
}

read_text_file_proc :: proc(msg: Message) {
    fd, errnum := os.open ((msg.datum).(string))
}

main :: proc() {
    nothing := Message {}
    m := make_message ("/tmp/junk.txt")
    read_text_file_proc (m)
}
