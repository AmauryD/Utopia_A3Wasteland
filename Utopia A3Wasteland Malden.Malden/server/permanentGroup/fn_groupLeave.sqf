_sender = [] call ug_fnc_remoteOwnerToObject;

if (isNull _sender) exitWith {};
_sGroup = group _sender;
_grpname = _sGroup getVariable ["ug_group_name",""];
_grpowner = _sGroup getVariable ["ug_group_owner",""];
_grpID = _sGroup getVariable ["ug_group_id",-1];
_sUID = getPlayerUID _sender;

[format["removePlayerFromGroup:%1",_sUID],2] call extDB_database_async;//used 2 to return for sync

if (_grpowner == _sUID) then {
	_newLeader = [_grpID] call ug_fnc_groupfindNewLeader;
	if(isNil "_newLeader") then {
		[format["deleteGroup:%1",_grpID]] call extDB_Database_async; 
		_groups = [_grpID] call ug_fnc_groupsFind;
		{
			{[_x] joinSilent grpNull}foreach units _x;
			deleteGroup _x;
		}foreach _groups;
		[format["Group '%1' was disbanded because %2 left the group",_grpname,name _sender]] remoteExecCall ["ug_fnc_displayMessage",true];
	}else{
		[format["changeGroupLeader:%1:%2",_grpID,_newLeader]] call extDB_database_async;
	};
}else{
	[format["You left '%1' successfully",_grpname]] remoteExecCall ["ug_fnc_displaymessage",remoteExecutedOwner];
};
[_sender] joinSilent grpNull;