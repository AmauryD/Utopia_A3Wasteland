// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedDiversquad.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitwith {};
#include "teamMissionDefines.sqf";

private ["_vehicleClass", "_vehicle","_hostage","_side","_enemiesSide","_aiGroup","_objects"];

_setupVars =
{
	_locationsArray = MissionSpawnMarkers;
	_side = selectRandom (call _fn_getTeamMissionPlayers);
	_teamStr = switch (_side) do { 
		case east : { _missionMarkerColor = "ColorEAST";"OPFOR"  }; 
		case west : { _missionMarkerColor = "ColorWEST";"BLUFOR" }; 
	};
	_enemiesSide = [WEST,east,independent] - [_side];
	_ignoreAiDeaths = true;
	_missionType = format["Protect Hostage (%1)",_teamStr];
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_hostage = "C_man_polo_1_F" createVehicle _missionPos;
	_hostage allowDamage false;

	_id = _enemiesSide;

	[
    _hostage,                                                                           
    "Kill Hostage",                                                                     
    "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa",                      
    "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa",                     
    "_this distance _target < 3",                                                        
    "_caller distance _target < 3",                                                     
    {},                                                                                  
    {},                                                                                  
    {
    	(_this select 0) setVariable ["killer",(_this select 1)];
    	(_this select 0) setDammage 1;
    },                                
    {},                                                                                  
    [],                                                                                  
    10,                                                                               
    0,                                                                                   
    true,                                                                               
    false                                                                                
	] remoteExec ["BIS_fnc_holdActionAdd",_enemiesSide,_hostage];            

	_objects = ["Outpost3", _missionPos, 0] call createOutpost;
	_tower = nearestObject [_missionPos,"Land_Cargo_Tower_V1_No1_F"];
	_hostage setPos selectRandom (_tower buildingPos -1);

	_color = switch (_side) do { 
		case east : { "#ff0000"  }; 
		case west : { "#0099cc" }; 
	};
	_teamStr = switch (_side) do { 
		case east : { "OPFOR"  }; 
		case west : { "BLUFOR" }; 
	};

	_aiGroup = createGroup _side;

	[_aiGroup, _missionPos, 10] call createCustomGroup;
	[_aiGroup, _missionPos,50,true,true] call moveIntoBuildings;

	_missionPicture = 'A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa';
	_missionHintText = format ["The %1 team needs to protect the hostage , hold the position and protect the hostage. The other teams need to kill the hostage.<br/>The winning side will be awarded of <t color ='#0099cc'>25000$ for each players</t>",_teamStr];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _hostage};
_waitUntilSuccessCondition = {diag_tickTime - _starttime >= (_missionTimeout - 10)};

_failedExec =
{
	_killer = _hostage getVariable ["killer",objNull];

	if(side _killer == independent) then {
		{[25000,_x] call ug_fnc_playerAddMoney}foreach units group _killer;
		["Your group has won $25000 for the kill of the hostage"] remoteExecCall ["ug_fnc_displayMessage",units group _killer];
	}else{
		{
			if(side _x in _enemiesSide) then {
				[25000,_x] call ug_fnc_playerAddMoney
			};
		} foreach allPlayers;
		["Your team has won $25000 for the kill of the hostage"] remoteExecCall ["ug_fnc_displayMessage",_enemiesSide];
	};
	[_locationsArray, _missionLocation, _objects] call setLocationObjects;
	{deleteVehicle _x}foreach units _aiGroup;
	deleteVehicle _hostage;
};

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	_successHintMessage = "";
	{
		if(side _x == _side) then {
			[25000,_x] call ug_fnc_playerAddMoney
		};
	} foreach allPlayers;

	{deleteVehicle _x}foreach units _aiGroup;
	[_locationsArray, _missionLocation, _objects] call setLocationObjects;
	["Your team has won $25000 for keeping the hostage alive"] remoteExecCall ["ug_fnc_displayMessage",_side];
	deleteVehicle _hostage;
};

_this call teamMissionProcessor;
