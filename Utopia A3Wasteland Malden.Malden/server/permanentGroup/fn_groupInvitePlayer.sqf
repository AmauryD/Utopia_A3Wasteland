// remote-only

_uidToInvite = param [0,"",[""]];

_sender = [] call ug_fnc_remoteOwnerToObject;
_target = [_uidToInvite] call ug_fnc_getPlayerByUID;

if (isNull _sender) exitWith {};
_sGroup = group _sender;
_grpId = _sGroup getVariable ["ug_group_id",-1];

if(_sender isEqualTo _target) exitWith {
	["You cannot invite yourself"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

if !(_sender isEqualTo leader _sGroup) exitWith {
	["You're not the actual group leader"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

if(isNull _target) exitWith {
	["Cette personne n'est pas connectée"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

_players = [format["getPlayerGroupMembers:%1",_grpId],2,true] call extDB_Database_async;
_playersUIDs = _players apply {_x select 0};

if(count _players >= 6) exitWith {
	["This system is not finished , max players allowed is 6 . group with more people limit will come later"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

if (_uidToInvite in _playersUIDs) exitWith {
	["This person is already in your group"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

[_sender] remoteExecCall ["ug_fnc_groupReceiveInvite",_target];