// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: sideMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST TeamMissions
#define MISSION_CTRL_TYPE_NAME "Team"
#define MISSION_CTRL_FOLDER "teamMissions"
#define MISSION_CTRL_DELAY (["A3W_teamMissionDelay", 15*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE teamMissionColor

#include "teamMissions\teamMissionDefines.sqf"

private _fn_getTeamMissionPlayers = {
	_array = [];

	{
		if(side _x in [BLUFOR,OPFOR]) then {
			_array pushBackUnique (side _x);
		};
	}forEach allPlayers;

	_array
};

_controllerRunCondition = {
	count ([] call _fn_getTeamMissionPlayers) > 0
};
#include "missionController.sqf";
