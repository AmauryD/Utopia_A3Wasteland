disableSerialization;
[
	"bounty_menu",
	[100,100],
	[
		["header","RscText",-1,[
			["text","Bounty Menu"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["close_btn","w_RscButton",-1,[
			["text","X"],
			["ButtonClick",{(ctrlParent (_this select 0)) closeDisplay 0}]
		]],
		["players_list","RscCombo",-1,[]],
		["players_bounties_list","W_RscListBox"],
		["amount","RscEdit"],
		["add_bounty_btn","w_RscButton",-1,[
			["text","Add bounty"],
			["ButtonClick",{[] spawn ug_fnc_addBounty}]
		]]
	],
	[
		["header",[36,20,28,5]],
		["background",[36,25,28,44]],
		["players_list",[37,26,26,4]],
		["amount",[37,32,17,4]],
		["add_bounty_btn",[55,32,8,4]],
		["players_bounties_list",[37,39,26,28]],
		["close_btn",[61,21,2,3]]
	]
] call ED_fnc_register;

if(["bounty_menu"] call ED_fnc_isOpened) exitWith {};

_menu = ["bounty_menu",
	["DISPLAY",[["player_menu"] call ED_fnc_find]]
] call ED_fnc_create;

_players_list = _menu getVariable "players_list";

{
	if !(_x isEqualTo player) then {
		_idx = _players_list lbAdd name _x;
		_players_list lbSetData [_idx,getPlayerUID _x];
	};
}foreach allPlayers;

[] call ug_fnc_updateBountyList;