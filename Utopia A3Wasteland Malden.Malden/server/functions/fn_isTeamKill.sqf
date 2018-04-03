private _killed = param [0,objNull,[objNull]];
private _killer = param [1,objNull,[objNull]];
private _isTeamKill = false;


if(isNull _killer || isNull _killed) exitWith {_isTeamKill};
if(_killed isEqualTo _killer) exitWith {_isTeamKill};
if(vehicle _killer isEqualTo vehicle _killed) exitWith {_isTeamKill};
if (!isPlayer _killer || !isPlayer _killed) exitWith {_isTeamKill};

if(side _killer isEqualTo side _killed) then {
	if(side _killer isEqualTo independent) then {
		if(_killer in units group _killed) then {
			_isTeamKill = true;
		};
	}else{
		_isTeamKill = true;
	};
};

_isTeamKill