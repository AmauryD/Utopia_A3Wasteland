// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: savePlayerData.sqf
//	@file Author: AgentRev

#define PLAYER_CONDITION (alive player && !(missionNamespace getVariable ["playerSpawning", true]) && (isNil "A3W_fnc_isUnconscious" || {!(player call A3W_fnc_isUnconscious)}))

if (!isNil "savePlayerHandle" && {savePlayerHandle isEqualType 0 && {!completedFSM savePlayerHandle}}) exitWith {};

savePlayerHandle = [_this,
{
	if (PLAYER_CONDITION && {!isNil "isConfigOn" && {["A3W_playerSaving"] call isConfigOn}}) then
	{
		_UID = getPlayerUID player;
		_manualSave = param [0, false, [false]];

		// In case script is triggered via menu action
		if (!_manualSave) then
		{
			_manualSave = param [3, false, [false]];
		};

		private _info =
		[
			["Name", profileName],
			["LastSide", str playerSide],
			["Level",missionNameSpace getVariable ["player_level",0]], // [utopia] Amaury , should avoid nil values 
			["ParkingSlots",missionNamespace getVariable ["parking_slots",2]],
			["XP",missionNameSpace getVariable ["player_xp",0]],
			["SkillPoints",missionNameSpace getVariable ["ug_skillPoints",0]],
			["Skills",str (missionNamespace getVariable ["ug_skills",[]])] //need to str because don't detect changes with array ?
		];

		if (["A3W_privateStorage"] call isConfigOn) then
		{
			_info pushBack ["PrivateStorage", player getVariable ["private_storage", []]]; // not expected by server unless A3W_privateStorage = 1, otherwise will cause errors
		};

		_data = [player] call fn_getPlayerData;


		if (!isNil "playerData_infoPairs") then
		{
			{
				_oldPair = _x;
				{
					if (_x isEqualTo _oldPair) then
					{
						_info set [_forEachIndex, -1];
					};
				} forEach _info;
			} forEach playerData_infoPairs;

			_info = _info - [-1];
		};

		if (!isNil "playerData_savePairs") then
		{
			{
				_oldPair = _x;
				{
					if (_x isEqualTo _oldPair) then
					{
						_data set [_forEachIndex, -1];
					};
				} forEach _data;
			} forEach playerData_savePairs;

			_data = _data - [-1];
		};

		if (PLAYER_CONDITION) then
		{
			if (count _info > 0 || count _data > 0) then
			{
				pvar_savePlayerData = [_UID, _info, _data, player];
				publicVariableServer "pvar_savePlayerData";
			};

			if (_manualSave) then
			{
				cutText ["\nPlayer saved!", "PLAIN DOWN", 0.2];
			};
		};

		if (isNil "playerData_infoPairs") then
		{
			playerData_infoPairs = _info;
		}
		else
		{
			{
				[playerData_infoPairs, _x select 0, _x select 1] call fn_setToPairs;
			} forEach _info;
		};

		if (isNil "playerData_savePairs") then
		{
			playerData_savePairs = _info;
		}
		else
		{
			{
				[playerData_savePairs, _x select 0, _x select 1] call fn_setToPairs;
			} forEach _data;
		};
	};
}] execFSM "call.fsm";

if (savePlayerHandle isEqualType 0) then
{
	_savePlayerHandle = savePlayerHandle;
	waitUntil {completedFSM _savePlayerHandle};
	savePlayerHandle = nil;
};
