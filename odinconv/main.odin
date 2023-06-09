package conv
import "core:fmt"
import "core:time"
import "core:runtime"

Bytr :: struct {
    btr : rawptr,
    len : int
}

Message_Content :: Bytr
Message_Port :: Bytr

Message :: struct {
    port:  Message_Port,
    datum: Message_Content,
}

Data :: struct {
  a : int
}

clone_bytr :: proc (b : Bytr) -> Bytr {
    r := new (Bytr)
    r.btr = b.btr
    r.len = b.len
    return r^
}

main :: proc () {
    dp := new (Data)
    dp^.a = 5
    data := dp^
    fmt.println(data)

    data_p := &data
    data_len := size_of(data)
    fmt.println (data_p, data_len)

    bp := Bytr { btr=data_p, len=data_len}
    fmt.println (bp)

    data2_p := transmute(^Data) bp.btr
    fmt.println (data2_p^)

    bp3 := clone_bytr (bp)
    data3_p := transmute(^Data) bp3.btr
    fmt.println (data3_p^)
    
    // data := Data { a = 5 }
    // fmt.println(data)

    // fmt.println(typeid_of(type_of(data)))
    
    // pdata := &data
    // fmt.println(pdata^)
    // //u8data := cast([]u8)(pdata^)

    // fmt.println (size_of (data))

    // // sd := new (SliceData)
    // // sd.elem = &data
    // // sd.elem_size = size_of (data)
    // // fmt.println (sd)

    // // u8sd := transmute(^[]u8)sd
    // // fmt.println (u8sd)

    // // fmt.println(cast([]u8)data)
    // // fmt.println(typeid_of(data))
}

// Sleep_Data :: struct {
//     init: time.Tick,
//     payload:  Message_Content,
// }

// main :: proc () {
//     data := Sleep_Data {
//         init = time.tick_now(),
//         payload  = transmute(Message_Content)[]u8{4,5,6}
//     }
//     fmt.println(data)

//     fmt.println(typeid_of(type_of(data)))
    
//     pdata := ^data

//     // fmt.println(cast([]u8)data)
//     // fmt.println(typeid_of(data))
// }


// ---

	// // This is how `new` is implemented
	// alloc_type :: proc($T: typeid) -> ^T {
	// 	t := cast(^T)alloc(size_of(T), align_of(T))
	// 	t^ = T{} // Use default initialization value
	// 	return t
	// }

	// copy_slice :: proc(dst, src: []$T) -> int {
	// 	n := min(len(dst), len(src))
	// 	if n > 0 {
	// 		mem.copy(&dst[0], &src[0], n*size_of(T))
	// 	}
	// 	return n
	// }


// clone message:
//  payload := clone message.data
//  name    := clone message.port (port is currently defined as string, but may change in the future)
//  m_copy    := new Message
//  m_copy.port  = name
//  m_copy.datum = payload

// free message:
//  free (message.d)
//  free (message.port)
//  free (message)

// clone_message :: proc (message: Message) -> Message {
//   payload := clone_message_data (message)
//   port_name := clone_message_port (message)
//   m_copy := new Message
//   m_copy.port = port_name
//   m_copy.datum = payload
//   return m_copy
// }

// clone_message_data (message : Message) -> Message_Content {
//     original := message.datum
//     d := cast (^Message_Content) alloc (size_of (original), align_of (original))
//     mem.copy (d, message.datum, size_of (original))
//     return d
// }

// clone_message_port (message : Message) -> Message_Port {
//     original := message.port
//     p := cast (^Message_Port) alloc (size_of (original), align_of (original))
//     mem.copy (d, message.port, size_of (original))
//     return p
// }

// destroy_message :: proc (message : Message) {
//     free (message.datum)
//     free (message.port)
//     free (message)
// }
