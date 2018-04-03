private _control = param [0,controlNull,[controlNull]];
private _displayGridSize = [100,100];

_nameParent = (ctrlParent _control) getVariable "ED_Name";
if !(isNil "_nameParent") then {
	_displayGridSize = (missionNameSpace getVariable format ["ED_menu_%1",_nameParent]) select 1;
};

private _pos = param [1,[0,0],[[]]];
private _gridSize = param [2,_displayGridSize,[[]]];
private _commit = param [3,false,[true]];

_precisionW = _displayGridSize select 0;
_precisionH = _displayGridSize select 1;

_WPrec = safezoneW / _precisionW;
_hPrec = safezoneH / _precisionH;

_xa = _pos select 1;
_ya = _pos select 0;
_W = _pos select 2;
_H = _pos select 3;

_control ctrlSetPosition [
	safezoneX + (_WPrec * _ya),
	safezoneY + (_hPrec * _xa),
	_WPrec * _W,
	_hPrec * _H
];

if(_commit) then {
	_control ctrlCommit 0;
};

true