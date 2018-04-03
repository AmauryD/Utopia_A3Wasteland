_player = [] call ug_fnc_remoteOwnerToObject;

if(isNull _player) exitWith {};

_gid = (group _player) getVariable ["ug_group_id",-1];

if(_gid == -1) exitWith {};

_groupData = [format["getGroupAndOwnerData:%1",_gid],2] call extDB_Database_async;
_players = [format["getPlayerGroupMembers:%1",_gid],2,true] call extDB_Database_async;

[_groupData,_players] remoteExecCall ["ug_fnc_groupMenuUpdate",remoteExecutedOwner];