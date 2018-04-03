#include "macro.h"
// [utopia] Amaury
// never less than half of the price , or exploits

private _price = _this select 0;
private _reductionSkill = _this select 1;

_reduc = [missionNamespace getVariable ["ug_skills",[]],_reductionSkill,-1] call bis_fnc_getFromPairs;

if (_reduc isEqualTo -1) exitWith {_price};

_reducInPercent = _reduc * 100;

if(_reduc < 0 || _reduc > 0.5) exitWith {_price};

(round _price - ((_price / 100) * _reducInPercent))