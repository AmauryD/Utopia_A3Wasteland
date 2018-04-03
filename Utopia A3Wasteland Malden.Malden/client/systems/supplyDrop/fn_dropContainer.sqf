/**
	@autor : [utopia] Amaury
	@creation : 15/08/17
**/
disableSerialization;

_list = _this select 0;

_data = _list lbData (lbCurSel _list);

if(_data == "") exitWith {};

_data = call compile _data; //this is bad , don't do it at home

if(player_level < _data select 3) exitWith {hintSilent format ["You need to be level %1",_data select 3]};
if(player getVariable "cmoney" < _data select 2) exitWith {hintSilent "No enough money"};
if !([10] call ug_fnc_notTooFast) exitWith {hintSilent "Please wait a little before making a new action"};

[-(_data select 2)] call ug_fnc_playerAddMoney;

[_data,getPosATL player] remoteExec ["ug_fnc_createDrop",2];

hintSilent "Your crate is coming !";

[] spawn fn_savePlayerData;

