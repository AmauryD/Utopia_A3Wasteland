private _veh = param [0,objNull,[objNull,""]];
private _isManual = param [1,false,[true]];

if(_veh isEqualType "") then {
	_veh = objectFromNetId _veh;
};

if (isNull _veh) exitWith {};

if(_isManual) then {
	[_veh,false] call fn_manualVehicleSave;
}else{
	[_veh] call fn_saveVehicle;
};
