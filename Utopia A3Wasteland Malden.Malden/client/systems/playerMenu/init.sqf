// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************

#define RANK_NUMBER 0
#define RANK_NAME 1
#define RANK_IMAGE 2
#define RANK_REQUIRED_XP 3
#define RANK_PRICE_REDUCTION 4
#define RANK_RECOIL_REDUCTION 5
#define RANK_SWAY_REDUCTION 6

#include "dialog\player_sys.sqf";
disableSerialization;

[
	"rules_menu",
	[100,100],
	[
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["rules","w_rscStructuredText"],
		["header","RscText",-1,[
			["text","Da Rules"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["close_btn","w_RscButton",-1,[
			["text","X"],
			["ButtonClick",{(ctrlParent (_this select 0)) closeDisplay 0}]
		]]
	],
	[
		["background",[25,20,50,50]],
		["header",[25,15,50,5]],
		["rules",[26,21,48,48]],
		["close_btn",[72,16,2,3]]
	]
] call ED_fnc_register;

[
	"player_menu",
	[100,100],
	[
		["background_left","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["background_right","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["close_btn","w_RscButton",-1,[
			["text","X"],
			["ButtonClick",{ctrlParent (_this select 0) closeDisplay 0}]
		]],
		["main_header","RscText",-1,[
			["text","Player Menu"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["groups_btn","w_RscButton",-1,[
			["text","Groups"],
			["buttonclick",{[ctrlParent (_this select 0)] spawn ug_fnc_groupChooseType}]
		]],
		["viewdist_btn","w_RscButton",-1,[
			["text","Viewdist"],
			["buttonclick",{
				(["player_menu"] call ED_fnc_find) closeDisplay 0;
				_this call CHVD_fnc_openDialog
			}]
		]],
		["hallOfFame_btn","w_RscButton",-1,[
			["text","Hall of fame"],
			["buttonclick",{[] spawn loadHallOfFame;}]
		]],
		["lvlMenu_btn","w_RscButton",-1,[
			["text","Level menu"],
			["buttonclick",{[] spawn lvl_loadSkillsMenu;}]
		]],
		["controls_btn","w_RscButton",-1,[
			["text","Controls"],
			["buttonclick",{[] spawn fn_loadControlsMenu;}]
		]],
		["supplydrop_btn","w_RscButton",-1,[
			["text","Supply Drop"],
			["buttonclick",{_this spawn ug_fnc_loadDropMenu}]
		]],
		["inbox_btn","w_RscButton",-1,[
			["text","Inbox"],
			["buttonclick",{_this spawn ug_fnc_loadMessageBox}]
		]],
		["rules_btn","w_RscButton",-1,[
			["text","Rules"],
			["buttonclick",{
				[] spawn { //if you don't spawn , makes your arma 3 crash , don't know whyyy
					disableSerialization;
					if(["rules_menu"] call ED_fnc_isOpened) exitWith {};

					_display = ["rules_menu",
						["DISPLAY",[["player_menu"] call ED_fnc_find]]
					] call ED_fnc_create;
					(_display getVariable "rules") ctrlSetStructuredText parseText ug_serverRules;
				};
			}]
		]],
		["bounty_btn","w_RscButton",-1,[
			["text","Bounties"],
			["buttonclick",{_this spawn ug_fnc_loadBountyMenu}]
		]],
		["killFeed_btn","w_RscButton",-1,[
			["text","KillFeed"],
			["buttonclick",{with missionNamespace do { [] call A3W_fnc_killFeedMenu }}]
		]],
		["ts3_text","w_rscStructuredText",-1,[
			["text","<a underline='true' href='https://utopiagaming.org/'>Website</a><t size='0.6'><br/><br/>ts.utopiagaming.org</t>"]
		]],

		["water_Text","RscText",-1,[]],
		["food_Text","RscText",-1,[]],
		["money_Text","RscText",-1,[]],
		["atm_Text","RscText",-1,[]],

		["money_img","w_RscPicture",-1,[
			["text","client\icons\money.paa"]
		]],
		["water_img","w_RscPicture",-1,[
			["text","client\icons\water.paa"]
		]],
		["food_img","w_RscPicture",-1,[
			["text","client\icons\food.paa"]
		]],
		["atm_img","w_RscPicture",-1,[
			["text","client\icons\suatmm_icon.paa"]
		]],

		["level_xp_text","w_RscText",-1],
		["level_img","w_RscPicture",-1,[]],
		["level_bar","RscProgressBar",-1,[]],
		["level_text","RscText",-1,[]],

		["items_list","w_RscListBox",1500,[
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],

		["drop_btn","w_RscButton",-1,[
			["text","Drop"],
			["ButtonClick",{[1] execVM 'client\systems\playerMenu\itemfnc.sqf'}]
		]],
		["use_btn","w_RscButton",-1,[
			["text","Use"],
			["ButtonClick",{[0] execVM 'client\systems\playerMenu\itemfnc.sqf'}]
		]],
		["dropMoney_btn","w_RscButton",-1,[
			["text","Drop Money"],
			["ButtonClick",{[] execVM 'client\systems\playerMenu\dropMoney.sqf'}]
		]],
		["money_combo","w_RscCombo",1600,[]]
	],
	[
		["background_left",[25,20,10,50]],
		["background_right",[36,20,40,50]],
		["main_header",[25,14,51,5]],
		["close_btn",[73,15,2,3]],

		["groups_btn",[26,21,8,3.5]],
		["viewdist_btn",[26,25,8,3.5]],
		["hallOfFame_btn",[26,29,8,3.5]],
		["supplydrop_btn",[26,33,8,3.5]],
		["controls_btn",[26,37,8,3.5]],
		["rules_btn",[26,41,8,3.5]],
		["bounty_btn",[26,45,8,3.5]],
		["inbox_btn",[26,49,8,3.5]],
		["lvlMenu_btn",[26,53,8,3.5]],
		["killFeed_btn",[26,57,8,3.5]],

		["water_Img",[37,22,3,5]],
		["water_Text",[41,22,17,5]],

		["food_Img",[37,29,3,5]],
		["food_Text",[41,29,17,5]],

		["money_Img",[37,36,3,5]],
		["money_Text",[41,36,20,5]],

		["atm_img",[37,43,3,5]],
		["atm_Text",[41,43,20,5]],

		["level_Img",[37,50,3,5]],
		["level_bar",[41,50,16,5]],
		["level_text",[57,50,3,5]],
		["level_xp_text",[46,51,8,3]],

		["ts3_text",[26,61,8,9]],

		["items_list",[60,22,15,40]],
		["use_btn",[60,64,7,4]],
		["drop_btn",[68,64,7,4]],
		["money_combo",[37,64,7,4]],
		["dropMoney_btn",[45,64,8,4]]
	],true
] call ED_fnc_register;

if (["player_menu"] call ED_fnc_isOpened) exitWith {};

if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue"];

_Dialog = ["player_menu","DIALOG"] call ED_fnc_create;
[] execVM "client\systems\playerMenu\item_list.sqf";

_foodtext = _Dialog getVariable "food_Text";
_watertext = _Dialog getVariable "water_Text";
_moneytext = _Dialog getVariable "money_Text";
_mvalue = _Dialog getVariable "money_combo";
_groupButton = _Dialog getVariable "groups_btn";

_bankText = _Dialog getVariable "atm_text";
_levelBar = _Dialog	getVariable "level_bar";
_levelImg = _Dialog	 getVariable "level_img";
_level_xp_text = _Dialog getVariable "level_xp_text";
_level_text = _Dialog getVariable "level_text";

_foodtext  ctrlSetText format["%1 / 100", round(hungerLevel)];
_watertext ctrlSetText format["%1 / 100", round(thirstLevel)]; 
_moneytext ctrlSetText  format["%1", [player getVariable ["cmoney", 0]] call fn_numbersText];
_bankText ctrlSetText  format["%1", [player getVariable ["bmoney", 0]] call fn_numbersText];

_imgData = [player_level] call lvl_getLevelImage;
_img = _imgData select 0;
_imgcolor = _imgData select 1;
_levelImg ctrlSetText _img;
_levelImg ctrlSetTextColor _imgcolor;

_maxLvlXP = [player_level] call lvl_getRequiredXP;
_level_xp_text ctrlSetText format ["%1/%2",player_xp,_maxLvlXP];

_levelBar progressSetPosition (player_xp / _maxLvlXP);
_levelBar ctrlSetTextColor [0.25,0.51,0.96,1];
_level_text ctrlSetText str player_level;

{
	_mvalue lbSetData [_mvalue lbAdd format ["$%1", [_x] call fn_numbersText], str _x];
} forEach [5, 15, 20, 25, 50, 75, 100, 200, 300, 400, 500, 1000, 2000, 3000, 4000, 5000, 10000, 15000, 20000, 25000, 50000];

[] spawn
{
	disableSerialization;
	_dialog = findDisplay playersys_DIALOG;
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49;
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }; // Force close Esc menu if open
		sleep 0.1;
	};
};
