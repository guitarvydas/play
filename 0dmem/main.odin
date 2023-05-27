package any_examples

import "core:fmt"

import zd "../../odin0d/0d"

first: string
second: string

test_proc :: proc(eh: ^zd.Eh, msg: zd.Message(any)) {
    switch msg.port {
    case "first": first = msg.datum.(string)
    case "second": second = msg.datum.(string)
    }
}

Counter :: struct {
    i: int,
    total: int,
}

counter_proc :: proc(eh: ^zd.Eh, msg: zd.Message(int), data: ^Counter) {
    data.i += 1
    data.total += msg.datum
    fmt.println(eh.name, ": ", data.i, "total =", data.total)
}

main :: proc() {
    container := zd.make_container("top")

    test := zd.make_leaf("test", test_proc)

    c1 := zd.make_leaf("counter 1", new(Counter), counter_proc)
    c2 := zd.make_leaf("counter 2", new(Counter), counter_proc)

    container.children = {
        test,
        c1,
        c2,
    }

    container.connections = {
        {.Down, {nil, "first"}, {&test.input, "first"}},
        {.Down, {nil, "second"}, {&test.input, "second"}},

        {.Down, {nil, "c1"}, {&c1.input, "input"}},
        {.Down, {nil, "c2"}, {&c2.input, "input"}},
    }

    container->handler(zd.make_message("first", "1"))
    container->handler(zd.make_message("second", "2"))

    fmt.println("first =", first)
    fmt.println("second =", second)

    container->handler(zd.make_message("c1", 5))
    container->handler(zd.make_message("c1", 10))
    container->handler(zd.make_message("c1", 20))
    container->handler(zd.make_message("c2", 1))
    container->handler(zd.make_message("c2", 2))

    /*
        Output:
        first = 1
        second = 2
        counter 1 :  1 total = 5
        counter 1 :  2 total = 15
        counter 1 :  3 total = 35
        counter 2 :  1 total = 1
        counter 2 :  2 total = 3
    */
}