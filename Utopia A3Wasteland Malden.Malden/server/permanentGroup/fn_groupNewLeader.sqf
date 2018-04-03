_newLeader = param [0,"",[""]];
_sender = [] call ug_fnc_remoteOwnerToObject; // old leader
_newLeaderObj = [_newLeader] call ug_fnc_getPlayerByUID;

_group = group _sender;
_groupID = _group getVariable ["ug_group_id",-1];
_groupOwner = _group getVariable ["ug_group_owner",""];
_groupName = _group getVariable ["ug_group_name",""];

if (_groupID == -1) exitWith {};
if(_groupOwner == getPlayerUID _sender) exitWith {
	["You're already the leader"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

_success = [format["changeGroupLeader:%1:%2",_groupID,_newLeader]] call extDB_database_async;

if (_success) then {
	if !(isNull _newLeaderObj) then {
		[format["You are now the leader of '%1'",_groupName]] remoteExecCall ["ug_fnc_displayMessage",_newLeaderObj];
		_group selectleader _newLeaderObj;
	};
	_group setVariable ["ug_group_owner",_newLeader];
	[format["You left the leadership of '%1'",_groupName]] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
	uiSleep 0.2;
	[] call ug_fnc_groupRequestData;
}else{
	[format["Failed to change leadership of '%1'",_groupName]] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

_success