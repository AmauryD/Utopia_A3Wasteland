if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_vehicle", "_vehicleName", "_vehDeterminer" , "_nbUnits" , "_ignoreAiDeaths" , "_vehicle_2" , "_objects"];

_setupVars =
{
	_missionType = "Computer Hacking";
	_nbUnits = 12;
	_locationsArray = ComputerMissionMarkers;
	_ignoreAiDeaths = true;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_objects = ["Computer1", _missionPos, 0] call createOutpost;
	_vehicle = nearestObject [_missionPos,"Land_Laptop_device_F"];
	_desk = nearestObject [_missionPos,"Land_TableDesk_F"];
	_bigBuilding = nearestObject [_missionPos,"Land_Cargo_HQ_V4_F"];

	_desk setPosATL [getPosATL _bigBuilding select 0,getPosATL _bigBuilding select 1,(getPosATL _bigBuilding select 2) + 5];
	_vehicle setPosATL [getPosATL _desk select 0,getPosATL _desk select 1,(getPosATL _desk select 2) + 1.5];
	_vehicle setVariable ["hacked",false,true];
	_missionPicture = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa";

	_id = -2;
	if(hasInterface) then { //FOR TEST
		_id = 0;
	};

	[
    _vehicle,                                                                           
    "Hack Laptop",                                                                     
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                     
    "_this distance _target < 5",                                                        
    "_caller distance _target < 5",                                                     
    {},                                                                                  
    {},                                                                                  
    {(_this select 0) setVariable ["hacked",true,true]},                                
    {},                                                                                  
    [],                                                                                  
    12,                                                                               
    0,                                                                                   
    true,                                                                               
    false                                                                                
	] remoteExec ["BIS_fnc_holdActionAdd",_id,_vehicle];                                 

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;

	_missionHintText = "Hacking this computer will give you 1% of all the bank accounts of the players connected on the server plus an extra money , perfect when there's a lot of ennemies !";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};
_waitUntilSuccessCondition = {_vehicle getVariable ["hacked",false]};

_failedExec =
{
	{ deleteVehicle _x } forEach _objects;
};

_successExec =
{
	deleteVehicle _vehicle;
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach _objects;
	{ if(alive _x) then {deleteVehicle _x}; }forEach units _aiGroup;
	[_locationsArray, _missionLocation, _objects] call setLocationObjects;
	_cash = createVehicle ["Land_Money_F",_vehicle, [], 0, "CAN_COLLIDE"];

	private _money = 1000;

	{
		_pMoney = _x getVariable ["bmoney",0];
		if(_pMoney > 10000) then {
			_x setVariable ["bmoney",round(_pMoney - (_pMoney / 100)),true];
			_money = _money + (round (_pMoney / 100));
		};
	}foreach allPlayers;

	_cash setVariable ["cmoney",_money, true];
	_cash setVariable ["owner", "world", true];
	[_cash] call A3W_fnc_setItemCleanup;
	_successHintMessage = "success";
};

_this call moneyMissionProcessor;