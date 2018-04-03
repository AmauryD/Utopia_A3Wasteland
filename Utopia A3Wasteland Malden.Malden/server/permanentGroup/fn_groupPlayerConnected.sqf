private _player = param [0,objNull,[objNull]];
private _UID = param [1,"",[""]];

_result = [format ["getPlayerGroupData:%1",_UID],2] call extDB_Database_async;

if(_result isEqualTo []) exitWith {};

_groupID = _result select 0;
_groupOwner = _result select 1;
_groupName = _result select 2;

_groupFound = [_groupID,side _player] call ug_fnc_groupFind;

if(isNull _groupFound) then {
	_groupFound = createGroup (side _player);
	_groupFound setGroupId [_groupName];
	_groupFound setVariable ["ug_group_id",_groupID];
	_groupFound setVariable ["ug_group_owner",_groupOwner];
	_groupFound setVariable ["ug_group_name",_groupName,true];
	_groupFound setVariable ["ug_group_type","permanent",true];
};

[_player] joinSilent _groupFound;

if (getPlayerUID _player == _groupOwner) then {
	[_groupFound,_player] remoteExec ["selectLeader", groupOwner _groupFound];
};