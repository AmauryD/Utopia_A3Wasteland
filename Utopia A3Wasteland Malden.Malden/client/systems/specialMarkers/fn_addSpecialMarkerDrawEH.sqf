disableSerialization;

private _ctrl = param [0,controlNull,[controlNull]];

waitUntil {!isNull _ctrl};//security

if !(isNil {_ctrl getVariable "ug_mapMarkers_availableControls"}) then {
	{ctrlDelete _x}foreach (_ctrl getVariable "ug_mapMarkers_availableControls");
};

_ctrl ctrlRemoveEventHandler ["Draw",_ctrl getVariable ["ug_mapMarkers_eh_id",-1]];

_ctrl setVariable ["ug_mapMarkers_availableControls",[]];
_ctrl setVariable ["ug_mapMarkers_eh_id",[]];
_eh_id = _ctrl ctrlAddEventHandler ["Draw",ug_fnc_drawSpecialMarkers];
_ctrl setVariable ["ug_mapMarkers_eh_id",_eh_id];