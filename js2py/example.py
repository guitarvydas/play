__all__ = ['example']

# Don't look below, you will not understand this Python code :) I don't.

from js2py.pyjs import *
# setting scope
var = Scope( JS_BUILTINS )
set_global_object(var)

# Code follows:
var.registers(['resultArray', 'transpile'])
@Js
def PyJsHoisted_transpile_(src, grammarName, grammars, fmt, ohmlang, compfmt, this, arguments, var=var):
    var = Scope({'src':src, 'grammarName':grammarName, 'grammars':grammars, 'fmt':fmt, 'ohmlang':ohmlang, 'compfmt':compfmt, 'this':this, 'arguments':arguments}, var)
    var.registers(['compfmt', 'grammars', 'ohmlang', 'src', 'fmt', 'grammarName'])
    pass
PyJsHoisted_transpile_.func_name = 'transpile'
var.put('transpile', PyJsHoisted_transpile_)
pass
var.put('resultArray', var.get('transpile')(var.get('src'), var.get('grammarName'), var.get('grammar'), var.get('fmt'), var.get('ohm'), var.get('compilefmt')))
pass


# Add lib to the module scope
example = var.to_python()