/**
	@autor : [utopia] Amaury
	@creation : 15/08/17
**/


private _name = param [0,"",[""]];

if(isNil "ED_openedDisplays") then {
	ED_openedDisplays = [];
};

!(([ED_openedDisplays,_name,displayNull] call bis_fnc_getFromPairs) isEqualTo displayNull)