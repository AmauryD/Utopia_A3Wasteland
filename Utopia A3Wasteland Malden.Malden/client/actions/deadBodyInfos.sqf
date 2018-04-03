_dead = param [0,objNull,[objNull]];

if (_dead isEqualTo objNull) exitWith {};
if !(_dead isKindOf "man") exitWith {};
if (alive _dead) exitWith {}; //ok...

_name = _dead getVariable ["ug_name","Unknown"];

[format ["His name was %1.",_name], 5] call mf_notify_client;