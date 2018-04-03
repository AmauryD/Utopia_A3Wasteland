/*
	@author : by  [utopia] Amaury
*/ 

disableSerialization;

[
	"itemTrunk_menu",
	[100,100],
	[
		["background_left","IGUIBack"],
		["background_right","IGUIBack"],
		["player_inv","RscListBox"],
		["container_inv","RscListBox"],
		["header_left","RscText",-1,[
			["text","Player inventory"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["header_right","RscText",-1,[
			["text","Container inventory"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["button_toContainer","w_RscButton",-1,[
			["text","To container"]
		]],
		["button_toPlayer","w_RscButton",-1,[
			["text","To player"]
		]]
	],
	[
		["background_left",[30,25,20,48]],
		["background_right",[51,25,20,48]],
		["player_inv",[31,27,18,38]],
		["container_inv",[52,27,18,38]],
		["header_left",[30,20,20,5]],
		["header_right",[51,20,20,5]],
		["button_toContainer",[31,66,18,5]],
		["button_toPlayer",[52,66,18,5]]
	]
] call ED_fnc_register;

private _theBOX = cursorObject; // _this select 3 addAction argument is not working with cursorObject , edit 3 months later : ok i know why

if(_theBOX isEqualTo objNull || !alive player || !alive _theBOX) exitWith {};
if (isNil {_theBOX getVariable "virtualItems"}) exitWith {};
if (locked _theBOX > 1 || (_theBOX getVariable ["A3W_inventoryLockR3F", false])) exitWith { ["This vehicle is locked.", 5] call mf_notify_client; };
if (["itemTrunk_menu"] call ED_fnc_isOpened) exitWith {};

_access = _theBOX getVariable ["virtualItems_access",[false,serverTime,objNull]];
_accessing = _access select 0;
_lastUsedTime = _access select 1;
_lastUser = _access select 2;

if ((serverTime - _lastUsedTime > 300 && _accessing && _lastUser != player) || _lastUser isEqualTo objNull) then { // safe anti glitching bug exploit
	_theBOX setVariable ["virtualItems_access",[false,serverTime,player],true];
};

_access = _theBOX getVariable "virtualItems_access"; //refresh
_accessing = _access select 0;

if (_accessing) exitWith { ["Another player is already looking at the inventory of this vehicle.", 5] call mf_notify_client; };

_theBOX setVariable ["virtualItems_access",[true,serverTime,player],true];
item_box_currBox = _theBOX; //global because need it

private _display = ["itemTrunk_menu","DIALOG"] call ED_fnc_create;

_itemsList = _display getVariable "container_inv";
_pItemsList=  _display getVariable "player_inv";

_dropBtn = _display getVariable "button_toContainer";
_takeBtn = _display getVariable "button_toPlayer";

_dropBtn ctrlAddEventHandler ["ButtonClick",{
	_display = ctrlParent (_this select 0);
	_pItemsList=  _display getVariable "player_inv";
	_dropped = _pItemsList lbData (lbCurSel _pItemsList);
	if(_dropped == "") exitWith {};

	_boxItems = item_box_currBox getVariable ["virtualItems",[[],5]];
	_maxContainerItems = _boxItems select 1;
	_containeritems = _boxItems select 0;

	if(count _containeritems >= _maxContainerItems) exitWith {hintSilent "Container is FULL"};

	_findIndex = _containeritems find _dropped;

	[_dropped,1] call mf_inventory_remove;
    (_boxItems select 0) pushBack _dropped;

    item_box_currBox setVariable ["virtualItems",_boxItems,true];

	call fn_updateItemsLists;
}];
_takeBtn ctrlAddEventHandler ["ButtonClick",{
	_display = ctrlParent (_this select 0);
	_itemsList=  _display getVariable "container_inv";
	_taken = _itemsList lbData (lbCurSel _itemsList);
	if(_taken == "") exitWith {};

	_boxItems = item_box_currBox getVariable ["virtualItems",[[],5]];
	_maxContainerItems = _boxItems select 1;

	(_boxItems select 0) deleteAt ((_boxItems select 0) find _taken);

	if (_taken call mf_inventory_is_full) exitWith {hintSilent "You cannot take more of this item";};
	[_taken,1] call mf_inventory_add;
	item_box_currBox setVariable ["virtualItems",_boxItems,true];

	call fn_updateItemsLists;
}];

_display displayAddEventHandler ["Unload",{
	_accessInfos = item_box_currBox getVariable "virtualItems_access";
	_accessInfos set [0,false]; // don't know if set broadcast the value so ...
	item_box_currBox setVariable ["virtualItems_access",_accessInfos,true];
}];

call fn_updateItemsLists;
