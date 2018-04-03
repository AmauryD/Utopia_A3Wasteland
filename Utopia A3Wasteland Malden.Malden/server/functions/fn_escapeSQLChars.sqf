private _string = param [0,"",[""]];

_string = (_string splitString "") apply {
	_char = _x;
	if(_char in ["-","*",'"',"'","\","|"]) then {
		_char = " ";
	};
	_char
};
_string = _string joinString "";

_string