// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileHeliFormation.sqf
//	@file Author: JoSchaap, AgentRev
//  @ Thx Ctrl+c + ctrl+V

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf"

private ["_heliChoices", "_convoyVeh", "_veh1", "_veh2", "_veh3", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_vehicleName2", "_numWaypoints", "_box1", "_box2", "_box3"];

_setupVars =
{
	_missionType = "Hostile Jets";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_heliChoices =
	[
		["B_Plane_Fighter_01_F","B_Plane_Fighter_01_F"]
	];

	_convoyVeh = _heliChoices call BIS_fnc_selectRandom;

	_veh1 = _convoyVeh select 0;
	_veh2 = _convoyVeh select 1;
	_veh3 = _convoyVeh select 1;

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_variant", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;
		_variant = _type param [1,"",[""]];

		if (_type isEqualType []) then
		{
			_type = _type select 0;
		};

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"];
		_vehicle setPosATL [_position select 0,_position select 1,2000];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];

		if (_variant != "") then
		{
			_vehicle setVariable ["A3W_vehicleVariant", _variant, true];
		};

		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		// add a driver/pilot/captain to the vehicle
		// the little bird, orca, and hellcat do not require gunners and should not have any passengers
		_soldier = [_aiGroup, _position] call createRandomSoldierC;
		_soldier moveInAny _vehicle;

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;


	_vehicles =
	[
		[_veh1,[(_missionPos select 0) + 50,	_missionPos select 1,10], 0] call _createVehicle,
		[_veh2,[(_missionPos select 0) - 50,	_missionPos select 1,10], 0] call _createVehicle,
		[_veh3,[(_missionPos select 1) + 50,			_missionPos select 1,10], 0] call _createVehicle
	];

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "YELLOW"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "VEE";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	_waypoint = _aiGroup addWaypoint [[worldSize / 2,worldSize / 2,0], 0];
	_waypoint setWaypointType "GUARD";
	_waypoint setWaypointCompletionRadius 5000;
	_waypoint setWaypointCombatMode "YELLOW";
	_waypoint setWaypointBehaviour "SAFE";
	_waypoint setWaypointFormation "VEE";
	_waypoint setWaypointSpeed _speedMode;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> (_veh1 param [0,""]) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_veh1 param [0,""]) >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> (_veh2 param [0,""]) >> "displayName");

	_missionHintText = format ["A formation of armed planes containing a <t color='%3'>%1</t> and two <t color='%3'>%2</t> are patrolling the island. Destroy them before they kill you!", _vehicleName, _vehicleName2, mainMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed
	_successHintMessage = "The sky is clear again, the enemy patrol was taken out!";
};

_this call mainMissionProcessor;