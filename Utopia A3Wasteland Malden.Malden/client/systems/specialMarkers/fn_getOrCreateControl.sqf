// is doing this a good idea ? we will see in the future

private _parent = param [0,displayNull,[displayNull,controlNull]];

_availableControls = _parent getVariable ["ug_mapMarkers_availableControls",[]];

private _control = controlNull;

_availableControls = _availableControls - [controlNull]; // delete null controls ?
_parent	setVariable ["ug_mapMarkers_availableControls",_availableControls];

{
    if !(_x getVariable	["busy",false]) exitWith {
    	_control = _x;
    	_control setVariable ["busy",true];
    };
} forEach _availableControls;

if (isNull _control) then {
	_control = (ctrlParent _parent) ctrlCreate ["RscStructuredText",-1];
	_control setVariable ["MouseOn",false];
	_control ctrlAddEventHandler ["MouseEnter",{
		(_this select 0) setVariable ["MouseOn",true];
	}];
	_control ctrlAddEventHandler ["MouseExit",{
		(_this select 0) setVariable ["MouseOn",false];
	}];
	_availableControls pushBack _control;
};
_control