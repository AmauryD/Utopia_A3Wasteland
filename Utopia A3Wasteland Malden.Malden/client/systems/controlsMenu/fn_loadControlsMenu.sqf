/**
author : [utopia] Amaury
creation : 10/07/17
description : controls menu , not the best but it works
**/

[
	"controls_menu",
	[100,100],
	[
		["header","RscText",-1,[
			["text","Controls"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["controls_list","RscListBox",-1,[]],
		["keys_list","RscListBox",-1,[]],
		["add_btn","w_RscButton",-1,[
			["text","Add"],
			["ButtonClick",{}]
		]],
		["del_btn","w_RscButton",-1,[
			["text","Delete"],
			["ButtonClick",{}]
		]],
		["close_btn","w_RscButton",-1,[
			["text","X"],
			["ButtonClick",{(ctrlParent (_this select 0)) closeDisplay 0}]
		]]
	],
	[
		["header",[36,20,28,5]],
		["background",[36,25,28,44]],
		["controls_list",[37,27,12,40]],
		["keys_list",[51,27,12,35]],
		["add_btn",[51,63,5.5,4]],
		["del_btn",[57.5,63,5.5,4]],
		["close_btn",[61,21,2,3]]
	]
] call ED_fnc_register;

disableSerialization;

if (["controls_menu"] call ED_fnc_isOpened) exitWith {};

_controlsMenu = ["controls_menu",
	["DISPLAY",[["player_menu"] call ED_fnc_find]]
] call ED_fnc_create;

_list = _controlsMenu getVariable "controls_list";
_kList = _controlsMenu getVariable "keys_list";
_add_btn = _controlsMenu getVariable "add_btn";
_delete_btn = _controlsMenu getVariable "del_btn";

{

	_idx = _list lbAdd (_x select 2);
	_list lbSetData [_idx,(_x select 0)];
	_list lbSetValue [_idx,_forEachIndex];
}forEach (profileNamespace getVariable ["utopia_keys",[]]);

lbSort _list;

fn_updateControlsList = {
	_list = _this select 0;
	_idx = _this select 1;
	_display = ctrlParent _list;
	_kList = _display getVariable "keys_list";

	lbClear _kList;

	_controlname = _list lbData _idx;
	_controlIndex = _list lbValue _idx;

	_keyData = (profileNamespace getVariable "utopia_keys") select _controlIndex;
	_keysDataList = _keyData select 1;

	{
		_idx = _kList lbAdd (keyName _x);
		_kList lbSetValue [_idx,_x];
	}foreach _keysDataList;
};

_list ctrlAddEventHandler ["LBSelChanged",fn_updateControlsList];

_add_btn ctrlAddEventHandler ["ButtonClick",{
	_this spawn {
		disableSerialization;
		_display = ctrlParent (_this select 0);
		_kList = _display getVariable "keys_list";
		_list = _display getVariable "controls_list";

		if(lbCurSel _list isEqualTo -1) exitWith {};

		_key = [_display] call fn_chooseKey;

		if(_key isEqualTo 0) exitWith {};

		_controlIndex = _list lbValue (lbCurSel _list);
		_controlname = _list lbData (lbCurSel _list);

		{
			_keysValue = _x select 1;

			if(_x select 0 isEqualTo _controlname) then {
				_keysValue pushBackUnique _key;
			};
		}forEach (profileNamespace getVariable ["utopia_keys",[]]);

		[_list,lbCurSel _list] call fn_updateControlsList;
	};
}];
_delete_btn ctrlAddEventHandler ["ButtonClick",{
	_display = ctrlParent (_this select 0);
	_kList = _display getVariable "keys_list";
	_list = _display getVariable "controls_list";

	if(lbCurSel _kList isEqualTo -1) exitWith {};
	if(lbCurSel _list isEqualTo -1) exitWith {};

	_controlname = _list lbData (lbCurSel _list);
	_keyVal = _kList lbValue (lbCurSel _kList);

	{
		_keysValue = _x select 1;

		if(_x select 0 isEqualTo _controlname) then {
			_keysValue deleteAt (_keysValue find _keyVal);
		};
	}forEach (profileNamespace getVariable ["utopia_keys",[]]);

	[_list,lbCurSel _list] call fn_updateControlsList;
}];