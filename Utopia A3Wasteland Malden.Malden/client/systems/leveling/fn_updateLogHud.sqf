#include "macro.h"
/*
	@author : by  [utopia] Amaury
*/ 

disableSerialization;

private _amount = param [0,0,[0]];
private _hasLostXP = param [1,false,[true]];
private _reason = param [2,0,[0]];

_reason = switch (_reason) do { 
	case 0 : { "player kill" }; 
	case 1 : {  "AI kill" }; 
	case 2 : { "Suicide" };
	case 3 : { "Teamkill" };
	case 4 : { "Group assist"};
	default {  "" }; 
};


_ui = uiNamespace getVariable ["WastelandHud", displayNull];
_logs = _ui displayCtrl 1500;
 
_index = _logs lbAdd format["%1%2 XP - %3",(if(_hasLostXP) then {"-"}else{"+"}),_amount,_reason];
if(_hasLostXP) then {
	_logs lbSetColor [_index,[255, 0, 0,0.9]];
}else{
	_logs lbSetColor [_index,[0, 255, 0,0.9]];
};


_time = -diag_tickTime;
_id = str (random 100);


_logs lbSetValue [_index,_time];
_logs lbSetData [_index,_id];
lbSortByValue _logs;

_id spawn {
	disableSerialization;

	uiSleep 10;

	_ui = uiNamespace getVariable ["WastelandHud", displayNull];
	_logs = _ui displayCtrl 1500;

	for "_i" from 0 to lbSize _logs do {
		if((_logs lbData _i) isEqualTo _this) then {
			_logs lbDelete _i;
		};
    };
    _logs lbSetCurSel -1;
};


