/*
	@author : by  [utopia] Amaury
*/ 

disableSerialization;

[
	"hall_of_fame",
	[100,100],
	[
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["main_header","w_RscTextCenter",-1,[
			["text","The Hall Of Fame"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["title_richest","w_RscTextCenter",-1,[
			["text","Richest players"]
		]],
		["title_aikills","w_RscTextCenter",-1,[
			["text","Ai killers"]
		]],
		["title_pkills","w_RscTextCenter",-1,[
			["text","Player killers"]
		]],
		["list_richest","RscListBox",-1],
		["list_aikills","RscListBox",-1],
		["list_pkills","RscListBox",-1],

		["player_pkills","w_RscTextCenter",-1],
		["player_money","w_RscTextCenter",-1],
		["player_aiKills","w_RscTextCenter",-1],

		["close_btn","w_RscButton",-1,[
			["text","X"],
			["ButtonClick",{ctrlParent (_this select 0) closeDisplay 0}]
		]]
	],
	[
		["background",[20,25,60,45]],
		["main_header",[20,20,60,5]],
		["title_richest",[22,26,17,3]],
		["title_aikills",[41,26,17,3]],
		["title_pkills",[62,26,17,3]],
		["list_richest",[21,30,17,35]],
		["list_aikills",[41,30,17,35]],
		["list_pkills",[61,30,17,35]],
		["player_pkills",[61,50,17,35]],
		["player_money",[21,50,17,35]],
		["player_aiKills",[41,50,17,35]],
		["close_btn",[77,21,2,3]]
	]
] call ED_fnc_register;


if (["hall_of_fame"] call ED_fnc_isOpened) exitWith {};

_display = ["hall_of_fame",
	["DISPLAY",[["player_menu"] call ED_fnc_find]]
] call ED_fnc_create;

[] remoteExec ["fn_requestHallOfFameData",2];