if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_box1", "_box2"];

_setupVars =
{
	_missionType = "Item crate";
	_locationsArray = [ForestMissionMarkers, MissionSpawnMarkers] select (ForestMissionMarkers isEqualTo []);
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_box1 = createVehicle ["Land_PaperBox_closed_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;

 	_box1 setVariable ["R3F_LOG_disabled", true, true];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;

	_missionHintText = "An item cache has been spotted near the marker.<br/>It contains some usefull stuff like ammokits or repairkits.";
	_missionPicture = "\A3\ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	deleteVehicle _box1;
};

_successExec =
{
	// Mission completed
	_box1 setVariable ["R3F_LOG_disabled", false, true];
	private _itemsInBox = [];
	_rand = floor random 100;

	{
		for "_i" from 0 to (round random (_x select 1)) do {
			_itemsInBox pushBack (_x select 0);
		};
	}foreach [
		["water",5],
		["cookie",2],
		["cannedfood",5],
		["repairkit",2],
		["ammokit",1],
		["jerrycanfull",2],
		["spawnbeacon",1],
		["camonet",2],
		["syphonhose",2],
		["energydrink",3]
	];

	_box1 setVariable ["virtualItems",[_itemsInBox,count _itemsInBox],true];

	_successHintMessage = "The item box has been captured, well done.";
};

_this call sideMissionProcessor;
