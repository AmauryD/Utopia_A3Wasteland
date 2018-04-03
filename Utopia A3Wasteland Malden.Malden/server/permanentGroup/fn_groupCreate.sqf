_name = param [0,"",[""]];

if(_name == "") exitWith {};

_sender = [] call ug_fnc_remoteOwnerToObject;

if(isNull _sender) exitWith {};

_uid = getPlayerUID _sender;

_data = [format["createGroup:%1:%2",_uid,_name],2] call extDB_database_async;

if !(_data isEqualTo []) then {
	_groupID = _data select 0;


	[format["The group '%1' was created",_name]] remoteExecCall ["ug_fnc_displaymessage",remoteExecutedOwner];
	[format["addPlayerToGroup:%1:%2",_uid,_groupID]] call extDB_database_async;

	_group = createGroup (side _sender);
	_group setGroupId [_data select 2];
	_group setVariable ["ug_group_id",_groupID];
	_group setVariable ["ug_group_owner",_data select 1];
	_group setVariable ["ug_group_name",_data select 2,true];
	_group setVariable ["ug_group_type","permanent",true];

	[_sender] joinSilent _group;
	_group selectLeader _sender;

	uiSleep 0.2;
	[] call ug_fnc_groupRequestData;
}else{
	[format["Failed to create the group '%1' , name already exists ?",_name]] remoteExecCall ["ug_fnc_displaymessage",remoteExecutedOwner];
};