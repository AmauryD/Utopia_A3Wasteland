/**
	@autor : [utopia] Amaury
**/

_money = ["getRichest", 2,true] call extDB_Database_async;
_pKills = ["getSerialKillers", 2,true] call extDB_Database_async;
_aiKills  = ["getAIKillers", 2,true] call extDB_Database_async;

_player = [] call ug_fnc_remoteOwnerToObject;

if(_player isEqualTo objNull) exitWith {};

_columns = ["playerKills", "aiKills", "teamKills", "deathCount", "reviveCount", "captureCount"];
_pStats = [["getPlayerStats",getPlayerUID _player, _columns joinString ","], 2] call extDB_Database_async;

[_money,_pKills,_aiKills,_pStats] remoteExec ["fn_updateHallOfFame",remoteExecutedOwner]; // pretty heavy huh ?