/*
	@author : by  [utopia] Amaury
*/ 

private _messages = param [0,[],[[]]];

_display = ["messages_menu"] call ED_fnc_find;
_list = _display getVariable "messages_list";
_pList = _display getVariable "players_list";
_message_text = _display getVariable "message_text";

lbClear _list;

{
	_idx = _list lbAdd format ["Message from %1",_x select 3];
	_list lbSetData [_idx,str _x];
	_list lbSetValue [_idx,_x select 0];
}foreach _messages;

_message_text ctrlSetStructuredText parseText "";
_list lbSetCurSel 0;

lbClear _pList;

{
	if !(_x isEqualTo player) then {
		_idx = _pList lbAdd name _x;
		_pList lbSetData [_idx,getPlayerUID _x];
	};
}foreach allPlayers;
