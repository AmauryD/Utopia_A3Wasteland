params [["_types",["SoldierWB"]],["_isHard",false]];

_weights = [];

{
	_weights pushBack configName _x;
	if (_isHard) then {
		_weights pushBack (getNumber (_x >> "cost"));
	}else{
		_weights pushBack (1000000 - getNumber (_x >> "cost"));
	};
}foreach ((format ["'%1' in ([_x,true] call BIS_fnc_returnParents)",selectRandom _types]) configClasses (configFile >> "CfgVehicles"));

_selected = selectRandomWeighted _weights;

[getUnitLoadout _selected,_selected]




