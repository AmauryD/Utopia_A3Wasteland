/*
	@author : by  [utopia] Amaury
*/ 

disableSerialization;

_display = ["hall_of_fame"] call ED_fnc_find;

_list_money = _display getVariable "list_richest";
_list_pKills = _display getVariable "list_pKills";
_list_aiKills = _display getVariable "list_aikills";

_playerData = param [3,[],[[]]];
_pKills = _playerData param [0,0,[0]];
_aiKills = _playerData param [1,0,[0]];

_player_pkills = _display getVariable "player_pkills";
_player_money = _display getVariable "player_money";
_player_aiKills =  _display getVariable "player_aiKills";

_player_pkills ctrlSetText format ["Yours : %1",_pKills];
_player_money ctrlSetText format ["Yours : %1",[player getVariable ["bmoney",0]] call fn_numbersText];
_player_aiKills ctrlSetText format ["Yours : %1",_aiKills];

{
	_pName = _x select 0;
	_money = [_x select 1] call fn_numbersText;

	_list_money lbAdd format ["%1 : %2",_pName,_money];
}forEach (param [0,[],[[]]]);

{
	_pName = _x select 0;
	_kills = _x select 1;

	_list_pKills lbAdd format ["%1 : %2",_pName,_kills];
}forEach (param [1,[],[[]]]);

{
	_pName = _x select 0;
	_kills = _x select 1;

	_list_aiKills lbAdd format ["%1 : %2",_pName,_kills];
}forEach (param [2,[],[[]]]);