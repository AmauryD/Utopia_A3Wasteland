/**
	@autor : [utopia] Amaury
	@creation : 15/08/17
**/

private _name = param [0,"",[""]];

[missionNamespace getVariable ["ED_openedDisplays",[]],_name,displayNull] call bis_fnc_getFrompairs;