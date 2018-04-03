private _groupID = param [0,-1,[0]];

if (_groupID == -1) exitWith {};

_players = [format["getPlayerGroupMembers:%1",_groupID],2,true] call extDB_Database_async;

private "_leaderUID";

_maxLvl = 0;
{
	_level = _x select 2;
	if(_level > _maxLvl) then {
		_maxLvl = _level;
		_leaderUID = _x select 0;
	};
}foreach _players;

_leaderUID