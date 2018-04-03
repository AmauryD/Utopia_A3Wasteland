// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: loadGroupManagement.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
disableSerialization;

_parent = param [0,findDisplay 46,[displayNull]];

if ((group player getVariable ["ug_group_type","temp"]) == "permanent") exitWith {

	[_parent] spawn ug_fnc_groupCreateMenu;
};

_parent createDisplay "RscDisplayDynamicGroups";