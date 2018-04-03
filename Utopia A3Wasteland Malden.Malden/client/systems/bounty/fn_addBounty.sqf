disableSerialization;

_menu = ["bounty_menu"] call ED_fnc_find;

_amountEdit = _menu getVariable "amount";
_players_list = _menu getVariable "players_list";

_playerUID = _players_list lbData (lbCurSel _players_list);

if(_playerUID == "") exitWith {hintSilent "Please select a player in the combo box"};
if(_playerUID isEqualTo getPlayerUID player) exitWith {hintSilent "You cannot put bounty on your own head"};

_player = [_playerUID] call ug_fnc_getPlayerByUID;
_amount = floor (parseNumber ctrlText _amountEdit);

if(_amount <= 0) exitWith {hintSilent "Invalid input"};
if(_amount < 1000) exitWith {hintSilent "Are you so poor ?"};
if(isNull _player) exitWith {hintSilent "Error"};
if(side _player == playerSide && playerSide != independent) exitWith {hintSilent "Cannot put bounty in your own team"};
if(_player in units group player) exitWith	{hintSilent "Cannot put a bounty on a member of your own group"};

_amountWithFee = _amount + floor (_amount / 10);

_ok = [format ["You'll need to pay %1$ to add a %2$ bounty on the player %3",_amountWithFee,_amount,name _player],"Confirm",true,true,_menu] call bis_fnc_guimessage;

if(_ok) then {
	if(player getVariable "cmoney" >= _amountWithFee) then {
		if(isNull _player) exitWith {hintSilent "Error"};
		[-_amountWithFee] call ug_fnc_playerAddMoney;
		_player setVariable ["bounty",(_player getVariable ["bounty",0]) + _amount,true];
		[] spawn fn_savePlayerData;
		[format["%1 has put %2$ on your head",name player,_amount]] remoteExecCall ["ug_fnc_displayMessage",_player];
		[format["%1 has put %2$ on the head of %1",name _player,_amount]] remoteExecCall ["ug_fnc_displayMessage",allPlayers - [_player]];
	}else{
		hintSilent "You don't have enough money";
	};
};

[] call ug_fnc_updateBountyList;