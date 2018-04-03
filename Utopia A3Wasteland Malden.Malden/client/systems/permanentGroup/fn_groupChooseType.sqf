disableSerialization;
private _parent = param [0,displayNull,[displayNull]];

scopeName "main";

if !(isNil "ug_group_invite") then {
	_ok = [format["You have been invited join a permanent group named '%1' , do you accept ?",ug_group_invite getVariable ["ug_group_name","(bad group type)"]],"Confirm",true,true] call bis_fnc_guiMessage;
	if(_ok) then {
		_oldGroup = group player;
		[ug_group_invite] remoteExec ["ug_fnc_groupJoinPlayer",2];
		ug_group_invite = nil;
		breakOut "main";
	};
};

_groupType = group player getVariable ["ug_group_type","temporary"];
if(_groupType == "permanent") exitWith {
	[["player_menu"] call ED_fnc_find] spawn ug_fnc_groupCreateMenu;
};

[
	"choose_group_type",
	[100,100],
	[
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["header","RscText",-1,[
			["text","What do you want to do ?"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["normal_btn","w_RscButton",-1,[
			["text","Classic"],
			["ButtonClick",{
				[ctrlParent (_this select 0)] execVM "client\systems\groups\loadGroupManagement.sqf";
			}]
		]],
		["permanent_btn","w_RscButton",-1,[
			["text","Permanent"],
			["ButtonClick",{
				_this spawn {
					disableSerialization;
					_ok = ["Creating a permanent group will cost you 100.000$ , you will automativaly join this group when you connect in any side","Confirm",true,true] call bis_fnc_guiMessage;
					if(_ok) then {
						_name = ["Enter the name of your group",ctrlParent (_this select 0)] call ug_fnc_editDialog;
						if(count _name < 1) exitWith {hintSilent "please add some text to your group name"};
						if(count _name > 40) exitWith {hintSilent "group name too long"};
						if (player getVariable ["cmoney",0] < 100000) exitWith {
							hintSilent "No Enough Money :(";
						};
						[-100000] call ug_fnc_playerAddMoney;
						[_name] remoteExec ["ug_fnc_groupCreate",2];
						(ctrlParent (_this select 0)) closeDisplay 0;
						[["player_menu"] call ED_fnc_find] spawn ug_fnc_groupCreateMenu;
					};
				};
			}]
		]]
	],
	[
		["background",[40,35,15,15]],
		["header",[40,30,15,5]],
		["normal_btn",[41,36,13,5]],
		["permanent_btn",[41,42,13,5]]
	],true
] call ED_FNC_REGISTER;

["choose_group_type",["DISPLAY",[_parent]]] call ed_fnc_create;

