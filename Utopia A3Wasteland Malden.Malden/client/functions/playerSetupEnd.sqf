// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupEnd.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

#include "..\..\addons\storage\futura.h"

#define RANK_NUMBER 0
#define RANK_NAME 1
#define RANK_IMAGE 2
#define RANK_REQUIRED_XP 3
#define RANK_PRICE_REDUCTION 4
#define RANK_RECOIL_REDUCTION 5
#define RANK_SWAY_REDUCTION 6

private "_player";
_player = _this;

_player addRating 1e11;

[objNull, _player] call mf_player_actions_refresh;
[] execVM "client\functions\playerActions.sqf";

if(player getVariable "is_new_profile") then {
	[] call ps_access;
	waitUntil {!isNull (findDisplay IDD_FUTURAGEAR)};
	waitUntil {isNull (findDisplay IDD_FUTURAGEAR)};
	player setVariable ["is_new_profile",false];
};

[] call lvl_updateSkills;

_player groupChat "Wasteland - Initialization Complete";
playerSetupComplete = true;
