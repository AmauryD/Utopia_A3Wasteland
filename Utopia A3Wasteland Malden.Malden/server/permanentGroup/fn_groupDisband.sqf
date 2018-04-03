_sender = [] call ug_fnc_remoteOwnerToObject;

if (isNull _sender) exitWith {};
_sGroup = group _sender;
_grpname = _sGroup getVariable ["ug_group_name",""];
_grpowner = _sGroup getVariable ["ug_group_owner",""];
_grpID = _sGroup getVariable ["ug_group_id",-1];

if(getPlayerUID _sender != _grpowner) exitWith {
	["You does not own this group"] remoteExecCall ["ug_fnc_displayMessage",remoteExecutedOwner];
};

[format["deleteGroup:%1",_grpID]] call extDB_Database_async; 

_groups = [_grpID] call ug_fnc_groupsFind;
{
	{[_x] joinSilent grpNull}foreach units _x;
	deleteGroup _x;
}foreach _groups;

[format["Group %1 was disbanded by %2",_grpname,name _sender]] remoteExecCall ["ug_fnc_displayMessage",-2];