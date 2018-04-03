/**
	[utopia] Amaury
	just remoteExec to manual vehicle delete
**/

private _vehicle = param [0,objNull,[objNull,""]];

if(_vehicle isEqualType "") then {
	_vehicle = objectFromNetId _vehicle;
};

_player = [] call ug_fnc_remoteOwnerToObject;

if (_vehicle getVariable ["owneruid",""] == "") exitWith {
	[_vehicle,_vehicle getVariable ["A3W_vehicleID",-1]] call fn_manualVehicleDelete;
	diag_log format ["%1 sold a %2",name _player,typeOf _vehicle];
};

if (getPlayerUID _player != _vehicle getVariable "owneruid") exitWith {};

diag_log format ["%1 sold his %2",name _player,typeOf _vehicle];

[_vehicle,_vehicle getVariable ["A3W_vehicleID",-1]] call fn_manualVehicleDelete;