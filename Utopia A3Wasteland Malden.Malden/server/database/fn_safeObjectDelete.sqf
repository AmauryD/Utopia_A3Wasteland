_obj = param [0,objNull,[objNull,""]];

if(_obj isEqualType "") then {
	_obj = objectFromNetId _obj;
};

if(_obj isEqualTo objNull) exitWith {};

[_obj,_obj getVariable "A3W_objectID"] call fn_manualObjectDelete;