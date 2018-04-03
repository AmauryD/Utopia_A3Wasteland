/**
	@creator : [utopia] Amaury
	@creation: 12/08/17
	@description : register display
**/
private _displayName = param [0,"",[""]];
private _displayGridPrecision = param [1,[100,100],[[]]];
private _usedControls = param [2,[],[[]]];
private _controlsPosOnGrid = param [3,[],[[]]];
private _override = param [4,false,[true]];

if !(_displayGridPrecision isEqualTypeParams [0,0]) exitWith {false};

if ([_displayName] call ED_fnc_isRegistered && !_override) exitWith {false};

_controlsMergedData = [];

{
	_ctrlName = _x select 0;
	_coords = _x select 1;

	_ctrlArgs = [];

	{
		if(_x select 0 == _ctrlName) then {
			_ctrlArgs = _x;
		};
	}foreach _usedControls;

	_ctrlClassName = _ctrlArgs param [1,""];
	_ctrlIDC = _ctrlArgs param [2,-1];
	_specialParams = _ctrlArgs param [3,[]];

	_controlsMergedData pushBack [_ctrlName,_coords,_ctrlClassName,_ctrlIDC,_specialParams];
}foreach _controlsPosOnGrid;

_data = [
	_displayName,
	_displayGridPrecision,
	_controlsMergedData
];

if (isNil "ED_DEBUG") then {
	missionNamespace setVariable [format["ED_menu_%1",_displayName],compileFinal str _data];
}else{
	missionNamespace setVariable [format["ED_menu_%1",_displayName],compile str _data];
};

true