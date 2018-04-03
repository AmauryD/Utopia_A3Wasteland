_dead = param [0,objNull,[objNull]];

if (_dead isEqualTo objNull) exitWith {};
if !(_dead isKindOf "man") exitWith {};
if (alive _dead) exitWith {}; //ok...

_checks =
{
	params ["_progress", "_target", "_name"];
	private _failed = true;
	private _text = "Action failed!";

	if (alive player && vehicle player == player && !isNull _target) then
	{
		_failed = false;
		_text = format ["Burying soldier %1 (%2%3)",_name,floor (_progress * 100), "%"];
	};

	[_failed, _text];
};

_name = _dead getVariable ["ug_name","Unknown"];

_success = [3,"", _checks, [_dead,_name]] call a3w_actions_start;

if(_success) then {
	_reward = (floor random 10) max 5;
	deleteVehicle _dead;
	[_reward] call ug_fnc_playerAddMoney;
	[format ["You have buried %1 , may he rest in peace...\n%2$ was found in his pocket.",_name,_reward], 5] call mf_notify_client;
};