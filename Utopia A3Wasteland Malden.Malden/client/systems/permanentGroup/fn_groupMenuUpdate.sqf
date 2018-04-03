#define COLOR_OFFLINE [0.75,0.75,0.75,0.5]

private _groupData = param [0,[],[[]]];
private _groupMembers = param [1,[],[[]]];

_menu = ["group_menu"] call ED_fnc_find;

if (isnull _menu) exitWith {};

if (count _groupData == 0 || count _groupMembers == 0) exitWith {
	_menu closeDisplay 0;
};

_membersList = _menu getvariable ["members_list",controlNull];
_owner_image = _menu getvariable ["owner_image",controlNull];
_owner_text =_menu getvariable ["owner_text",controlNull];
_group_bank_image = _menu getvariable ["group_bank_image",controlNull];
_group_bank_text = _menu getvariable ["group_bank_text",controlNull];
_btn_kick = _menu getvariable ["btn_kick",controlNull];
_btn_promote = _menu getvariable ["btn_promote",controlNull];
_btn_disband = _menu getvariable ["btn_disband",controlNull];
_btn_leave = _menu getvariable ["btn_leave",controlNull];
_players_online = _menu getVariable ["players_online",controlNull];
_btn_invite = _menu getVariable ["btn_invite",controlNull];

_groupID = _groupData select 0;
_groupOwner = _groupData select 1;
_groupName = _groupData select 2;
_groupBank = _groupData select 3;

_groupLeaderName = _groupData select 4;
_groupLeaderLevel = _groupData select 5;

(_menu getVariable "header") ctrlSetText _groupName;

lbClear _membersList;

{
	_uid = _x select 0;
	_name = _x select 1;
	_level = _x select 2;

	_levelImageData = [_level] call lvl_getlevelimage;
	_player = [_uid] call ug_fnc_getPlayerByUID;

	_idx = _membersList lbAdd _name;
	_membersList lbSetValue [_idx,-_level];
	_membersList lbSetData [_idx,_uid];

	_status = ["Online","Offline"] select (isNull _player);

	_tooltip = format["Level : %1\nStatus : %2\n",_level,_status];

	if (isNull _player) then {
		_membersList lbSetColor [_idx,COLOR_OFFLINE];
		_membersList lbSetValue [_idx,1];
	}else{
		_color = switch (side _player) do { 
			case east : {  [0.5,0,0,1] }; 
			case west : {  [0,0.3,0.6,1] }; 
			case independent : { [0,0.5,0,1] };
		};
		_side = switch (side _player) do { 
			case east : {  "OPFOR" }; 
			case west : {  "BLUFOR" }; 
			case independent : { "INDEPENDENT" };
		};
		_membersList lbSetColor [_idx,_color];
		_membersList lbSetValue [_idx,1];
		_tooltip = _tooltip + format["Side : %1\n",_side];
	};
	_membersList lbSetPicture [_idx,(_levelImageData select 0)];
	_membersList lbSetPictureColor [_idx,(_levelImageData select 1)];
 

	_membersList lbSetTooltip [_idx,_tooltip];
}foreach _groupMembers;

lbSortByValue _membersList;

lbClear _players_online;
{
	_color = switch (side _x) do { 
		case east : {  [0.5,0,0,1] }; 
		case west : {  [0,0.3,0.6,1] }; 
		case independent : { [0,0.5,0,1] };
		default	{ [1,1,1,1] }
	};
	_idx = _players_online lbAdd name _x;
	_players_online lbSetPicture [_idx,"A3\ui_f\data\Map\Markers\NATO\O_inf.paa"];
	_players_online lbSetPictureColor [_idx,_color];
	_players_online lbSetData [_idx,getPlayerUID _x];
}foreach allPlayers;
lbSort _players_online;

if(getPlayerUId player == _groupOwner) then {
	_btn_kick ctrlShow true;
	_btn_promote ctrlShow true;
	_btn_disband ctrlShow true;
}else{
	_btn_kick ctrlShow false;
	_btn_promote ctrlShow false;
	_btn_disband ctrlShow false;
};

if(leader group player == player) then {
	_btn_invite ctrlEnable true;
}else{
	_btn_invite ctrlEnable false;
};

_owner_image ctrlSetText "client\icons\playermenu.paa";
_owner_text ctrlSetText _groupLeaderName;
_group_bank_image ctrlSetText "client\icons\suatmm_icon.paa";
_group_bank_text ctrlSetText format["%1 $",[_groupBank] call fn_numbersText];