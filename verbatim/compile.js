function compile (s) {
    return eval ('(' + s + ')');
}

function loadAndRun (f) {
    return f.run ();
}
