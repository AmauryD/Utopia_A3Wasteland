#include "macro.h"
/**
@Author : [utopia] Amaury
@Creation : 2#/11/16
@Modification : 27/11/16
@Description : 
**/
private _rank = param [0,0];
private _levels = getArray (missionConfigFile >> "cfgLeveling" >> "levels");
private _return = "";

{
	if((_x select 0) == _rank) exitWith {
		_return = _x select 1;
	};
}forEach _levels;

_return