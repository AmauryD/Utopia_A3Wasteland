/*
	@author : by  [utopia] Amaury
*/ 

disableSerialization;

[
	"messages_menu",
	[100,100],
	[
		["header","Rsctext",-1,[
			["backgroundcolor",[0.25,0.51,0.96,0.8]],
			["text","Messages"]
		]],
		["from_text","w_RscText",-1,[
			["text","From"]
		]],
		["date_text","w_RscText",-1,[
			["text","Date"]
		]],
		["message_text","RscStructuredText",-1,[

		]],
		["reply_btn","w_RscButton",-1,[
			["text","Reply"],
			["ButtonClick",{
				_this spawn {
					disableSerialization;
					_display = ctrlParent (_this select 0);
					_list = _display getVariable "messages_list";

					if(lbCurSel _list < 0) exitWith {hintSilent "No message selected"};

					_data = call compile (_list lbData (lbCurSel _list));
					_uid = _data param [1,"",[""]];

					if(_uid == "") exitWith {};
					if(_uid == getPlayerUID player) exitWith {hintSilent "Can't reply to yourself"};
					if !([10,"message_box"] call ug_fnc_notTooFast) exitWith {hintSilent "Please wait a little before sending another message"};

					_text = ["Enter message",_display] call ug_fnc_editDialog;

					if(_text == "") exitWith {};

					[_text,_uid] remoteExec ["ug_fnc_msgBoxNewMessage",2];
				};
			}]
		]],
		["delete_btn","w_RscButton",-1,[
			["text","Delete"],
			["ButtonClick",{
				_display = ctrlParent (_this select 0);
				_list = _display getVariable "messages_list";

				_id = _list lbValue (lbCurSel _list);

				if(lbCurSel _list < 0) exitWith {hintSilent "No message selected"};
				if(_id <= 0) exitWith {};
				if !([1,"message_box"] call ug_fnc_notTooFast) exitWith {hintSilent "No spam please."};
 
				[_id] remoteExec ["ug_fnc_msgBoxDeleteMessage",2];
			}]
		]],
		["players_list","w_RscCombo"],
		["new_msg","w_RscButton",-1,[
			["text","Send Message"],
			["ButtonClick",{
				_this spawn {
					disableSerialization;
					_display = ctrlParent (_this select 0);
					_pList = _display getVariable "players_list";
					_selPlayer = _pList lbData (lbCurSel _pList);

					if(_selPlayer == "") exitWith {hintSilent "Please select a player"};
					if(_selPlayer == getPlayerUID player) exitWith {hintSilent "Can't send message to yourself"};
					if !([10,"message_box"] call ug_fnc_notTooFast) exitWith {hintSilent "Please wait a little before sending another message"};

					_text = ["Enter message",_display] call ug_fnc_editDialog;

					if(_text == "") exitWith {};

					[_text,_selPlayer] remoteExec ["ug_fnc_msgBoxNewMessage",2];
				}
			}]
		]],
		["background_right","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["background_left","IGUIBack",-1,[
			["backGroundColor",[0,0,0,0.6]]
		]],
		["messages_list","w_RscListBox",-1,[
			["LBSelChanged",{
				_display = ctrlParent (_this select 0);
				_msgCtrl = _display getVariable "message_text";
				_fromCtrl = _display getVariable "from_text";
				_dateCtrl = _display getVariable "date_text";

				_data = call compile ((_this select 0) lbData (_this select 1));
				_msgCtrl ctrlSetStructuredText parseText (_data select 2);
				_fromCtrl ctrlSetText (_data select 3);
				_dateCtrl ctrlSetText (_data select 4);
			}]
		]]
	],
	[
		["messages_list",[31,26,18,40]],
		["background_right",[50.5,25,20,48]],
		["background_left",[30,25,20,48]],
		["header",[30,19,40.5,5]],
		["from_text",[51,26,7,4]],
		["date_text",[59,26,9,4]],
		["reply_btn",[52,67,8,4]],
		["delete_btn",[61,67,8,4]],
		["message_text",[51,31,18,35]],
		["players_list",[30.5,67,10,4]],
		["new_msg",[41,67,8,4]]
	]
] call ED_fnc_register;

if(["messages_menu"] call ED_fnc_isOpened) exitWith {};

_display = ["messages_menu",
	["DISPLAY",[["player_menu"] call ED_fnc_find]]
] call ED_fnc_create;

[] remoteExec ["ug_fnc_msgBoxSendMessages",2];