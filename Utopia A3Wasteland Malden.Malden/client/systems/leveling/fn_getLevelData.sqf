#include "macro.h"

private _level = param [0,0,[0]];
private _data = [0,"",["",[0,0,0,0]],1,1,1,1];

{
	if(_x select RANK_NUMBER isEqualTo _level) exitWith {
		_data = _x;
	};
}forEach (getArray (CONFIG_ENTRY >> "levels"));

_data