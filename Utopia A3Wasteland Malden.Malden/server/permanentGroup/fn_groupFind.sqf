private _search = param [0,-1,[0,""]];
private _side = param [1,sideUnknown,[west]];
private _group = grpNull;

_searchType = switch (typename _search) do { 
	case "STRING" : { ["ug_group_name",""] }; 
	case "SCALAR" : { ["ug_group_id",-1] }; 
	default { ["ug_group_id",-1] }; 
};

{
	if(_x getVariable _searchType == _search && _side == side _x) exitWith {
		_group = _x;
	};
}foreach allGroups;

_group