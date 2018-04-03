/**
	@autor : [utopia] Amaury
	@creation : 15/08/17
**/

disableSerialization;

[
	"drop_menu",
	[100,100],
	[
		["header","RscText",-1,[
			["text","Amazdrop.com"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["drops_list","RscListBox",-1,[]],
		["command_btn","w_RscButton",-1,[
			["text","Order"],
			["ButtonClick",{[ctrlParent (_this select 0) getVariable "drops_list"] spawn ug_fnc_dropContainer}]
		]],
		["close_btn","w_RscButton",-1,[
			["text","Close"],
			["ButtonClick",{(ctrlParent (_this select 0)) closeDisplay 0}]
		]]
	],
	[
		["header",[40,20,20,5]],
		["background",[40,25,20,55]],
		["command_btn",[41,68,18,5]],
		["close_btn",[41,74,18,5]],
		["drops_list",[41,27,18,40]]
	]
] call ED_fnc_register;

if (["drop_menu"] call ED_fnc_isOpened) exitWith {};

_display = ["drop_menu",
	["DISPLAY",[["player_menu"] call ED_fnc_find]]
] call ED_fnc_create;
_list = _display getVariable "drops_list";

{
	_idx = _list lbAdd format ["%1 (%2$)",_x select 1,_x select 2];
	_list lbSetData [_idx,str _x];
	if(player_level < (_x select 3)) then {
		_list lbSetColor [_idx,[0.5,0.5,0.5,0.8]];
		_list lbSetTooltip [_idx,format["level %1 required",_x select 3]];
	};
	_list lbSetValue [_idx,_x select 3];
}foreach (getArray (missionConfigFile >> "cfgSupplyDrop" >> "drops"));

lbSortByValue _list;  

