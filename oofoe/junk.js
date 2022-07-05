
const semObject = {

    text : function (_macro) { 
	_ruleEnter ("text");

	var macro = _macro._glue ().join ('');
	var _result = `${macro}`; 
	_ruleExit ("text");
	return _result; 
    },
    
    macro : function (_x) { 
	_ruleEnter ("macro");

	var x = _x._glue ();
	var _result = `${x}`; 
	_ruleExit ("macro");
	return _result; 
    },
    
    ShowPhrase : function (_kShow,_filename,_kat,_Coordinate) { 
	_ruleEnter ("ShowPhrase");

	var kShow = _kShow._glue ();
	var filename = _filename._glue ();
	var kat = _kat._glue ();
	var Coordinate = _Coordinate._glue ();
	var _result = `${kShow}${filename}${kat}${Coordinate}`; 
	_ruleExit ("ShowPhrase");
	return _result; 
    },
    
    MovePhrase : function (_kMove,_filename,_kto,_Coordinate,_TimeSpan) { 
	_ruleEnter ("MovePhrase");

	var kMove = _kMove._glue ();
	var filename = _filename._glue ();
	var kto = _kto._glue ();
	var Coordinate = _Coordinate._glue ();
	var TimeSpan = _TimeSpan._glue ();
	var _result = `${kMove}${filename}${kto}${Coordinate}${TimeSpan}`; 
	_ruleExit ("MovePhrase");
	return _result; 
    },
    
    WaitPhrase : function (_kWait,_number,_kframes) { 
	_ruleEnter ("WaitPhrase");

	var kWait = _kWait._glue ();
	var number = _number._glue ();
	var kframes = _kframes._glue ();
	var _result = `${kWait}${number}${kframes}`; 
	_ruleExit ("WaitPhrase");
	return _result; 
    },
    
    FadeToBlackPhrase : function (_kFade,_kto,_kblack,_TimeSpan) { 
	_ruleEnter ("FadeToBlackPhrase");

	var kFade = _kFade._glue ();
	var kto = _kto._glue ();
	var kblack = _kblack._glue ();
	var TimeSpan = _TimeSpan._glue ();
	var _result = `${kFade}${kto}${kblack}${TimeSpan}`; 
	_ruleExit ("FadeToBlackPhrase");
	return _result; 
    },
    
    JumpPhrase : function (_kJump,_ChapterName) { 
	_ruleEnter ("JumpPhrase");

	var kJump = _kJump._glue ();
	var ChapterName = _ChapterName._glue ();
	var _result = `${kJump}${ChapterName}`; 
	_ruleExit ("JumpPhrase");
	return _result; 
    },
    
    CHELNAspoken : function (_kCHELNA,_Spoken) { 
	_ruleEnter ("CHELNAspoken");

	var kCHELNA = _kCHELNA._glue ();
	var Spoken = _Spoken._glue ();
	var _result = `${kCHELNA}${Spken}`; 
	_ruleExit ("CHELNAspoken");
	return _result; 
    },
    
    MEspoken : function (_kME,_Spoken) { 
	_ruleEnter ("MEspoken");

	var kME = _kME._glue ();
	var Spoken = _Spoken._glue ();
	var _result = `${kME}${Spoken}`; 
	_ruleExit ("MEspoken");
	return _result; 
    },
    
    RADIOspoken : function (_kRADIO,_Spoken) { 
	_ruleEnter ("RADIOspoken");

	var kRADIO = _kRADIO._glue ();
	var Spoken = _Spoken._glue ();
	var _result = `${kRADIO}${Spoken}`; 
	_ruleExit ("RADIOspoken");
	return _result; 
    },
    
    Coordinate : function (_number1,_kx,_number2) { 
	_ruleEnter ("Coordinate");

	var number1 = _number1._glue ();
	var kx = _kx._glue ();
	var number2 = _number2._glue ();
	var _result = `${number1}${kx}${number2}`; 
	_ruleExit ("Coordinate");
	return _result; 
    },
    
    TimeSpan : function (_kover,_number,_kframes) { 
	_ruleEnter ("TimeSpan");

	var kover = _kover._glue ();
	var number = _number._glue ();
	var kframes = _kframes._glue ();
	var _result = `${kover}${number}${kframes}`; 
	_ruleExit ("TimeSpan");
	return _result; 
    },
    
    ChapterName : function (_name) { 
	_ruleEnter ("ChapterName");

	var name = _name._glue ();
	var _result = `${name}`; 
	_ruleExit ("ChapterName");
	return _result; 
    },
    
    filename : function (_name) { 
	_ruleEnter ("filename");

	var name = _name._glue ();
	var _result = `${name}`; 
	_ruleExit ("filename");
	return _result; 
    },
    
    Spoken : function (_cs) { 
	_ruleEnter ("Spoken");

	var cs = _cs._glue ().join ('');
	var _result = `${cs}`; 
	_ruleExit ("Spoken");
	return _result; 
    },
    
    spokenchar : function (_c) { 
	_ruleEnter ("spokenchar");

	var c = _c._glue ();
	var _result = `${c}`; 
	_ruleExit ("spokenchar");
	return _result; 
    },
    
    name : function (_nameFirst,_nameRest) { 
	_ruleEnter ("name");

	var nameFirst = _nameFirst._glue ();
	var nameRest = _nameRest._glue ().join ('');
	var _result = `${nameFirst}${nameRest}`; 
	_ruleExit ("name");
	return _result; 
    },
    
    nameFirst : function (_letter) { 
	_ruleEnter ("nameFirst");

	var letter = _letter._glue ();
	var _result = `${letter}`; 
	_ruleExit ("nameFirst");
	return _result; 
    },
    
    nameRest : function (_c) { 
	_ruleEnter ("nameRest");

	var c = _c._glue ();
	var _result = `${c}`; 
	_ruleExit ("nameRest");
	return _result; 
    },
    
    number : function (_kminus,_digit) { 
	_ruleEnter ("number");

	var kminus = _kminus._glue ().join ('');
	var digit = _digit._glue ().join ('');
	var _result = `${kminus}${kdigit}`; 
	_ruleExit ("number");
	return _result; 
    },
    
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) { return children.map(c => c._glue ()); }
}
