CField_id [dq1 k dq2 kcolon* s] = ‛⟨dq1⟩⟨k⟩⟨dq2⟩⟨kcolon⟩⟨s⟩’
{
CField_id: function (_dq1,_k,_dq2,_kcolon,_s) {
_ruleEnter ("CField_id");
var dq1 = _dq1._fmt ();
var k = _k._fmt ();
var dq2 = _dq2._fmt ();
var kcolon = _kcolon._fmt ().join ('');
    var s = _s._fmt ();
    var r = { ...dq1, ...k, ...dq2, ...kcolon, ...s,
	      'selfid': `${s.nq}`,
	      'stdout': `${dq1.stdout}${k.stdout}${dq2.stdout}${kcolon.stdout}${s.stdout}`
	    } ;
    return r;
_ruleExit ("CField_id");
},
