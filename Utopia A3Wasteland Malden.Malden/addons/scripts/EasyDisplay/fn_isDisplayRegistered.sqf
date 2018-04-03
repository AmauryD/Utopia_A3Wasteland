/**
	@creator : [utopia] Amaury
	@creation: 12/08/17
	@description : check if display has already been registered
**/

private _displayName = param [0,"",[""]];

!(isNil {missionNamespace getVariable format ["ED_menu_%1",_displayName]})

