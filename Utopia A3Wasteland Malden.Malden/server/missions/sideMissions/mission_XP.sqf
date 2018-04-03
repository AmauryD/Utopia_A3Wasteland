// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf";

private ["_nbUnits", "_outpost", "_objects"];

_setupVars =
{
	_missionType = "Special Forces";
	_nbUnits = 6;
	_locationsArray = ForestMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits, 200] call createSpecialForces;

	_missionHintText = "They are gonna rape you ...<br/>You will gain a lot of experience fighting them.";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{

};

_successExec =
{
	_successHintMessage = "Good joob !";
};

_this call sideMissionProcessor;
