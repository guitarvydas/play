var db = {
    next: 3,
    top: {
        title: "Top Level",
        size: [4, 4], // width, height.
        grid: { a1: "x1", d4: "x2" }
    },
    x1: { title: "Investigating Strange Actions",
         tags: [],
         text: "It's also easy for junior people to think that changing jobs is a perfect reset button for their reputation or that the consequences of their actions will be neatly contained to the people around them.\n\nIt can be a shock to discover just how much backchannel reference checking happens when evaluating candidates as well as how often they'll end up working with former coworkers again at other companies down the road."
       },
    x2: { title: "Avuncular Incognito",
          tags: [],
          text: "That evolved into a 30 min talk about what I thought was holding the project back and possibly transitioning out of some the tech that was kind of forced on the project to a better framework that would speed up building this app. I stood at a whiteboard and quickly ran the numbers for them showed them it wasn't too late to pivot."
        }
};

const xnames = "abcdefghijklmnopqrstuvwxyz";

function range(n) {
    var hold = [];
    for(i = 0; i < n; i += 1) { hold.push(i); }
    return hold;
}


// Components

function Title() {
    state = "show"; // show | edit
    hold = "Untitled";
    
    function view(vnode) {
        var s = vnode.attrs.s;
        var v = s.title || "Untitled";
        
        return m("h2",
                 "show" === state ?
                 [v, " ", m("button", {
                     onclick: (e) => { hold = v; state = "edit"; }
                 }, "change")] :
                 [m("input", { value: hold, oninput: (e) => hold = e.target.value }), " ",
                  m("button", {
                      onclick: (e) => { s.title = hold; state = "show" }
                  }, "save"), " ",
                  m("button", { onclick: (e) => state = "show" }, "abandon")]
                 )
    }

    return { view };
}


function Card() {
    function view(vnode) {
        var s = vnode.attrs.s;
        var a = vnode.attrs.address;
        var t = db[s.grid[a]];
        
        return m("div.card" +
                 (vnode.attrs.current == a ? ".card-picked" : ""),
                 { onclick: vnode.attrs.onclick }, t.title);
    }

    return { view };
}


function Workspace() {
    function view(vnode) {
        var s = vnode.attrs.s;
        var current = vnode.attrs.current;
        var cols = xnames.slice(0, s.size[1]).split("");

        return m("div.workspace",
                 m("table",
                   range(s.size[1]).map(
                       (n) => m("tr",
                                cols.map((a) => {
                                    var address = a + (n + 1);
                                    var popped = s.grid[address];
                                    var highlight = current == address;
                                    return m("td",
                                             popped ? m(Card, { s, current, address }) :
                                             highlight ? m("div.card.card-empty.card-picked") :
                                             "");
                                }))
                   )));
    }

    return { view };
}


function Detail() {
    var state = "show"; // show | edit
    
    function view(vnode) {
        var s = vnode.attrs.s;
        var current = vnode.attrs.current;
        var d = db[s.grid[current]];
        
        return m("div.details",
                 d ?
                 [m("div.title", d.title),
                  m("div.tags",
                    d.tags && 0 < d.tags.length ?
                    d.tags.map((t) => m("span.tag", t)) : m("i", "No tags...")),
                  m("div",
                    d.text.split(/\n\n/).map((p) => m("p", p)))] : 
                 m("i", "Click to add card...")
                );
    }

    return { view };
}


function App() {
    var space = "top";
    var current = "a1";
    var count = 0;


    function oninit(vnode) {
        window.addEventListener("keyup", keying);
    }


    function move(dx, dy) {
        // ( dx dy --) Move around workspace.
        
        var old = current;
        var x = xnames.indexOf(old[0]);
        var y = parseInt(old[1], 10);

        x += dx;
        if(x < 0) { x = 3; }
        if(x > 3) { x = 0; }
        y += dy;
        if(y < 1) { y = 4; }
        if(y > 4) { y = 1; }

        console.log("Location " + xnames[x] + y);
        current = xnames[x] + y;
    }


    function keying(e) {
        // ( e --) Keyboard event listener.

        console.log(e);

        if("ArrowLeft" == e.key)       { move(-1, 0); }
        else if("ArrowRight" == e.key) { move(1, 0); }
        else if("ArrowUp" == e.key)    { move(0, -1); }
        else if("ArrowDown" == e.key)  { move(0, 1); }

        m.redraw();
    }


    function view(vnode) {
        var s = db[space];
        
        return [m(Title, { s }),
                m("div.tray",
                  m(Workspace, { s, current }),
                  m(Detail, { s, current }))
                 ];
    }

    
    return { oninit, view };
}


m.mount(document.getElementById("dyno"), App);
