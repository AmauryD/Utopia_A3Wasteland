// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: sideMissionProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "Team"
#define MISSION_PROC_TIMEOUT (["A3W_teamMissionTimeout", 60*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE teamMissionColor

#include "teamMissions\teamMissionDefines.sqf"
#include "missionProcessor.sqf";
