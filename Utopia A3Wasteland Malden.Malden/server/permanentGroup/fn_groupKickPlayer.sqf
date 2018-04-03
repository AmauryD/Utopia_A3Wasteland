// remote-only

_uid = param [0,"",[""]];

if(_uid == "") exitWith {};

_sender = [] call ug_fnc_remoteOwnerToObject;
_target = [_uid] call ug_fnc_getPlayerByUID;

if (isNull _sender) exitWith {};
_sGroup = group _sender;
_sUID = getPlayerUID _sender;
_grpID = _sGroup getVariable ["ug_group_id",-1];
_owner = _sGroup getVariable ["ug_group_owner",""];

if(_owner == "" || _sUID != _owner) exitWith {
	["You do not own this group"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

if(_sender isEqualTo _target) exitWith {
	["You cannot kick yourself"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

_success = [format["removePlayerFromGroup:%1",_uid]] call extDB_database_async;

if(_success) then {
	if !(isNull _target) then {
		_groupName = (group _target) getVariable "ug_group_name";
		[format["You have been kicked from '%1'",_groupName],1] remoteExecCall ["ug_fnc_displayMessage",_target];
		[_target] joinSilent grpNull;
	};
	[format["You have  kicked '%1'",name _target],1] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
	uiSleep 0.2;
	[] call ug_fnc_groupRequestData;
}else{
	["Failed to kick"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};
