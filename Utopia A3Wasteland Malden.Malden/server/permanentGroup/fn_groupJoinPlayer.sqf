// remote-only

_group = param [0,grpNull,[grpNull]];
_sender = [] call ug_fnc_remoteOwnerToObject;

_groupType = group _sender getVariable ["ug_group_type",""];

if (_groupType in ["permanent","temporary"]) exitWith {
	["You're already in a group"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};
if (isNull _sender) exitWith {};
if (isNull _group) exitWith {
	["Invitation has expired"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

_uid = getPlayerUID _sender;
_grpID = _group getVariable ["ug_group_id",-1];
_grpName = _group getVariable ["ug_group_name",""];
_grpOwner = _group getVariable ["ug_group_owner",""];

if(_grpID == -1) exitWith {};

_realGroup = [_grpID,side _group] call ug_fnc_groupFind;

_success = [format["addPlayerToGroup:%1:%2",_uid,_grpID]] call extDB_database_async;

if (_success) then {
	if(isNull _realGroup) then {
		_group = createGroup (side _sender);
		_group setGroupId [_data select 2];
		_group setVariable ["ug_group_id",_groupID];
		_group setVariable ["ug_group_owner",_grpOwner];
		_group setVariable ["ug_group_name",_grpName,true];
		_group setVariable ["ug_group_type","permanent",true];
		[_sender] joinSilent _group;
		_group selectLeader _sender;
	}else{
		[_sender] joinSilent _group;
	};
	[format["You have successfully join '%1'",_grpName]] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
}else{
	[format["Cannot join '%1'",_grpName]] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};