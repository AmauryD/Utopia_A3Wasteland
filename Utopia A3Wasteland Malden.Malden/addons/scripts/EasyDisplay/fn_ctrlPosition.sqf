private _control = param [0,controlNull,[controlNull]];
private _displayGridSize = [100,100];

_nameParent = (ctrlParent _control) getVariable "ED_Name";
if !(isNil "_nameParent") then {
	_displayGridSize = (missionNamespace getVariable format ["ED_menu_%1",_nameParent]) select 1;
};

private _gridSize = param [1,_displayGridSize,[[]]];

_pos = ctrlPosition _control;

_xa = _pos select 0;
_ya = _pos select 1;
_W = _pos select 2;
_H = _pos select 3;

_precisionW = _displayGridSize select 0;
_precisionH = _displayGridSize select 1;

_WPrec = safezoneW / _precisionW;
_hPrec = safezoneH / _precisionH;


[
	abs (-_xa + safezoneX) / _WPrec,
	abs (-_ya + safezoneY) / _HPrec,
	_W / _WPrec,
	_H / _HPrec
]
