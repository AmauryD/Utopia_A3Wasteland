private _data = param [0,[],[[]]];
private _pos = param [1,[],[[]]];

private _chute = createVehicle ["B_Parachute_02_F", [100, 100, 100], [], 0, 'FLY'];
_chute setPosATL [_pos select 0,_pos select 1, (_pos select 2) + 50];
_crate = createVehicle [_data select 0, position _chute, [], 0, 'NONE'];
_crate setVariable ["R3F_LOG_disabled",true,true];
_crate attachTo [_chute, [0, 0, -1.3]];
_crate allowdamage false;

clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

{
	_crate addWeaponCargoGlobal [_x select 0,_x select 1];
}foreach (_data select 4);

{
	_crate addMagazineCargoGlobal [_x select 0,_x select 1];
}foreach (_data select 5);

{
	_crate addItemCargoGlobal [_x select 0,_x select 1];
}foreach (_data select 6);

_content = [];

{
	for "_i" from 1 to (_x select 1) do {
		_content pushBack (_x select 0);
	};
}foreach (_data select 7);

_crate setVariable ["virtualItems",[_content,20],true];

waitUntil {
	isNull _chute || (getPosATL _chute select 2) < 5
};

detach _crate;

_crate call A3W_fnc_setItemCleanup;

_crate setVelocity [0,0,0];
_crate allowdamage true;
_crate setPosATL [getPosATL _crate select 0,getPosATL _crate select 1,0];

deleteVehicle _chute; //just in case ...