// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: loadAccount.sqf
//	@file Author: Torndeco, AgentRev

if (!isServer) exitWith {};

params ["_UID", "_player"];
private ["_result", "_data", "_location", "_dataTemp", "_ghostingTimer", "_secs", "_columns", "_pvar", "_pvarG"];

private _moneySaving = ["A3W_moneySaving"] call isConfigOn;
private _crossMap = ["A3W_extDB_playerSaveCrossMap"] call isConfigOn;
private _environment = ["A3W_extDB_Environment", "normal"] call getPublicVar;
private _mapID = call A3W_extDB_MapID;

private _query = [["checkPlayerSave", _UID, _mapID], ["checkPlayerSaveXMap", _UID, _environment]] select _crossMap;
_result = ([_query, 2] call extDB_Database_async) param [0,false];

if (!_result) then
{
	_data = [["PlayerSaveValid", false]/*, ["BankMoney", _bank]*/];

	// prevent constraint fail on first save
	private _sqlValues = [[["Name", name _player]], [0,1], false] call extDB_pairsToSQL;
	[["insertOrUpdatePlayerInfo", _UID, _sqlValues select 0, _sqlValues select 1]] call extDB_Database_async;
}
else
{
	// The order of these values is EXTREMELY IMPORTANT!
	_data =
	[
		"Damage",
		"HitPoints",

		"LoadedMagazines",

		"PrimaryWeapon",
		"SecondaryWeapon",
		"HandgunWeapon",

		"PrimaryWeaponItems",
		"SecondaryWeaponItems",
		"HandgunItems",

		"AssignedItems",

		"CurrentWeapon",

		"Uniform",
		"Vest",
		"Backpack",
		"Goggles",
		"Headgear",

		"UniformWeapons",
		"UniformItems",
		"UniformMagazines",

		"VestWeapons",
		"VestItems",
		"VestMagazines",

		"BackpackWeapons",
		"BackpackItems",
		"BackpackMagazines",

		"WastelandItems",

		"Hunger",
		"Thirst"
	];

	_location = ["Stance", "Position", "Direction"];

	if (!_crossMap) then
	{
		_data append _location;
	};

	if (_moneySaving) then
	{
		_data pushBack "Money";
	};

	_query = [["getPlayerSave", _UID, _mapID], ["getPlayerSaveXMap", _UID, _environment]] select _crossMap;
	_query pushBack (_data joinString ",");
	_result = [_query, 2] call extDB_Database_async;

	{ _data set [_forEachIndex, [_data select _forEachIndex, _x]] } forEach _result;

	if (_crossMap) then
	{
		_result = [["getPlayerSave", _UID, _mapID, _location joinString ","], 2] call extDB_Database_async;

		if (count _result == count _location) then
		{
			{ _location set [_forEachIndex, [_location select _forEachIndex, _x]] } forEach _result;

			_data append _location;
		};
	};

	_dataTemp = _data;
	_data = [["PlayerSaveValid", true]];

	_ghostingTimer = ["A3W_extDB_GhostingTimer", 5*60] call getPublicVar;

	if (_ghostingTimer > 0) then
	{
		_query = [["getTimeSinceServerSwitch", _UID, _mapID], ["getTimeSinceServerSwitchXMap", _UID, _environment]] select _crossMap;
		_query pushBack call A3W_extDB_ServerID;
		_result = [_query, 2] call extDB_Database_async;

		if (count _result > 0) then
		{
			_secs = _result select 0; // [_result select 1] = LastServerID, if _crossMap then [_result select 2] = WorldName

			if (_secs < _ghostingTimer) then
			{
				_data pushBack ["GhostingTimer", _ghostingTimer - _secs];
			};
		};
	};

	_data append _dataTemp;
	//_data pushBack ["BankMoney", _bank];
};

private _bank = 0;
private _bounty = 0;
private _bountyKills = [];



if (_moneySaving) then
{
	_result = ["getPlayerBankMoney:" + _UID, 2] call extDB_Database_async;

	_bank = _result param [0,0];
};

if (["A3W_atmBounties"] call isConfigOn) then
{
	_result = ["getPlayerBounty:" + _UID, 2] call extDB_Database_async;

	_bounty = _result param [0,0];
	_bountyKills = _result param [1,[]];
};


_result = ["getPlayerLevelInfo:" + _UID, 2] call extDB_Database_async;
private _xp = _result param [0,0,[0]];
private _level = _result param [1,0,[0]];
private _skills = _result param [2,[],[[]]];
private _skillPoints = _result param [3,0,[0]];

if(_skillPoints == -1) then { //for old accounts with no skill points
	_skillPoints = 0;
	_levels = getArray (missionConfigFile >> "CfgLeveling" >> "levels");
	for "_i" from 0 to _level do {
		private _level = _levels select _i;
		_points = _level select	4;
		_skillPoints = _skillPoints + _points;
	};
};

_skillsDefault = (getArray (missionConfigFile >> "CfgLeveling" >> "Skills")) apply {[_x select 0,_x select 1]};

if(count _skills > count _skillsDefault) then { // old profile ?
	{
		_skillName = _x select 0;
		_val = _x select 1;

		if (([_skillsDefault,_skillName,""] call bis_fnc_getFromPairs) isEqualTo "") then {
			[_skills,_skillName] call bis_fnc_removeFromPairs;
		};
	}foreach _skills;
};
if(count _skills < count _skillsDefault) then { //skills change or new profile
	{
		_skillDefault = _x select 0;
		_defaultVal = _x select 1;

		_skillVal = [_skills,_skillDefault,""] call bis_fnc_getFromPAirs;
		if (_skillVal == "") then {
			_skills pushBackUnique _x;
		}else{
			if !(_skillVal isEqualType 0) then {
				[_skills,_skillDefault,_defaultVal] call bis_fnc_setToPairs;
			}else{
				if (_skillVal > 1 || _skillVal < 0) then {
					[_skills,_skillDefault,_skillVal] call bis_fnc_setToPairs;
				};
			};
		};
	}foreach _skillsDefault;
};

{
	if !(_skills isEqualType []) then {
		_skills set [_forEachIndex,_skillsDefault select _forEachIndex];
	};
	if !(_skills isEqualTypeAll ["",0]) then {
		_skills set [_forEachIndex,_skillsDefault select _forEachIndex];
	};
}foreach _skills;
	

_parkingSlots = ["getPlayerParkingSlots:" + _UID,2] call extDB_Database_async;
_parkingSlots = _parkingSlots param [0,2];

_data append
[
	["BankMoney", _bank],
	["Bounty", _bounty],
	["XP",_xp],
	["Level",_level],
	["ParkingSlots",_parkingSlots],
	["BountyKills", _bountyKills],
	["Skills",_skills],
	["SkillPoints",_skillPoints]
];

if (["A3W_privateParking"] call isConfigOn) then
{ 
	_columns = (call fn_getVehicleVars) apply {_x select 0};
	_result = [["getParkedVehicles", _UID, _environment, _columns joinString ","], 2, true] call extDB_Database_async;

	_columns deleteAt 0; // remove ID col
	private _vehicles = [];
	private ["_vehID", "_vehVars"];

	{
		_vehID = _x deleteAt 0;
		_vehVars = _x;

		{ _vehVars set [_forEachIndex, [_columns select _forEachIndex, _x]] } forEach _vehVars;

		_vehicles pushBack [_vehID, _vehVars];
	} forEach _result;

	_player setVariable ["parked_vehicles", _vehicles];
	_data pushBack ["ParkedVehicles", _vehicles];
};

if (["A3W_privateStorage"] call isConfigOn) then
{
	_columns = ["Weapons", "Magazines", "Items", "Containers"];
	_result = [["getPlayerStorageXMap", _UID, _environment, _columns joinString ","], 2] call extDB_Database_async;

	private _storage = [];

	{ _storage pushBack [_columns select _forEachIndex, _x] } forEach _result;

	_data pushBack ["PrivateStorage", _storage];
};

// before returning player data, restore global player stats if applicable
if (["A3W_playerStatsGlobal"] call isConfigOn) then
{
	_columns = ["playerKills", "aiKills", "teamKills", "deathCount", "reviveCount", "captureCount"];
	_result = [["getPlayerStats", _UID, _columns joinString ","], 2] call extDB_Database_async;

	{
		_pvar = format ["A3W_playerScore_%1_%2", _columns select _forEachIndex, _UID];
		_pvarG = _pvar + "_global";
		missionNamespace setVariable [_pvarG, _x - (missionNamespace getVariable [_pvar, 0])];
		publicVariable _pvarG;
	} forEach _result;
};

_data
