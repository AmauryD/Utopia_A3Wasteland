disableSerialization;

[
	"group_menu",
	[100,100],
	[
		["background","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["background_right","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["header","w_RscTextCenter",-1,[
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]],
		["header_right","w_RscTextCenter",-1,[
			["backgroundcolor",[0.25,0.51,0.96,0.8]],
			["text","Actions"]
		]],
		["members_text","w_RscText",-1,[
			["text","Group members : "]
		]],
		["members_list","w_RscListBox"],
		["owner_text","w_RscText"],
		["owner_image","w_rscPicture"],
		["btn_kick","w_rscButton",-1,[
			["show",false],
			["text","Kick"],
			["ButtonClick",{
				_display = ctrlparent (_this select 0);
				_list = _display getVariable "members_list";

				_uid = _list lbData (lbCurSel _list);
				if (_uid == "") exitWith {hintSilent "Please select a group member"};
				[_uid] remoteExec ["ug_fnc_groupKickPlayer",2];
			}]
		]],
		["btn_promote","w_rscButton",-1,[
			["show",false],
			["text","Promote"],
			["ButtonClick",{
				_display = ctrlparent (_this select 0);
				_list = _display getVariable "members_list";

				_uid = _list lbData (lbCurSel _list);
				if (_uid == "") exitWith {hintSilent "Please select a group member"};
				[_uid] remoteExec ["ug_fnc_groupNewLeader",2];
			}]
		]],
		["btn_leave","w_rscButton",-1,[
			["show",true],
			["text","Leave"],
			["ButtonClick",{
				[] remoteExec ["ug_fnc_groupLeave",2];
			}]
		]],
		["btn_disband","w_rscButton",-1,[
			["show",false],
			["textcolor",[1,0,0,1]],
			["text","Disband"],
			["ButtonClick",{
				disableSerialization;
				_menu = ctrlParent (_this select 0);
				_menu spawn {
					disableSerialization;
					_menu = _this;
					_ok = ["Are you sure ? This action will delete everything in your group", "Confirm", true, true,_menu] call bis_fnc_guiMessage;
					if (_ok) then {
						[] remoteExec ["ug_fnc_groupDisband",2];
					};
				};
			}]
		]],
		["group_bank_image","w_rscPicture"],
		["players_online","w_RscCombo"],
		["btn_invite","w_RscButton",-1,[
			["ButtonClick",{
				_display = ctrlparent (_this select 0);
				_list = _display getVariable "players_online";

				_uid = _list lbData (lbCurSel _list);
				if (_uid == "") exitWith {hintSilent "Please select a player to invite"};
				[_uid] remoteExec ["ug_fnc_groupInvitePlayer",2];
			}],
			["enabled",false],
			["text","Invite"]
		]],
		["group_bank_text","w_RscText"]
	],
	[
		["header",[25,20,35,5]],
		["background",[25,25,35,50]],
		["members_text",[26,26,20,4]],
		["members_list",[26,30,20,42]],
		["owner_text",[51,30,10,5]],
		["owner_image",[48,30,3,5]],

		["btn_kick",[48,48,10,4]],
		["btn_promote",[48,55,10,4]],
		["btn_leave",[48,60,10,4]],
		["btn_disband",[48,65,10,4]],

		["group_bank_image",[48,36,3,5]],
		["group_bank_text",[51,36,10,5]],

		["header_right",[61,20,15,5]],
		["background_right",[61,25,15,50]],
		["players_online",[62,26,13,4]],
		["btn_invite",[62,31,13,4]]
	],true
] call ED_FNC_REGISTER;

private _parent = param [0,displayNull,[displayNull]];

_display = ["group_menu",["DISPLAY",[_parent]]] call ed_fnc_create;

[] remoteExec ["ug_fnc_groupRequestData",2];