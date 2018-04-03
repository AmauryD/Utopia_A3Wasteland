// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customKeys.sqf
//	@file Author: AgentRev

// Load custom keys from profile

private ["_varName", "_defKeys", "_customKeys", "_isValid", "_voiceKeys"];


//modified by [utopia] Amaury
_keys = profileNamespace getVariable ["utopia_keys",[]];
_keysName = _keys apply {_x select 0};

if !(_keys isEqualType []) then {
	profileNamespace setVariable ["utopia_keys",[]];
	_keys = profileNamespace getVariable ["utopia_keys",[]];
};

{ // ugly code heh ...
	_varName = _x select 0;
	_defKeys = _x select 1;

	if !(_varName isEqualType "") then { 
		_keys deleteAt _forEachIndex;
	};
	if !(_defKeys isEqualType []) then {
		_keys deleteAt _forEachIndex;
	}else{
		if !(_defKeys isEqualTypeAll 0) then {
			_keys deleteAt _forEachIndex;
		};
	};
}foreach _keys;

{
	_varName = _x select 0;
	_defKeys = _x select 1;

	if !(_varName in _keysName) then {
		_keys pushBack _x;
	};
}forEach
[
	["A3W_customKeys_adminMenu", [22],"Admin Menu"], // 22 = U
	["A3W_customKeys_playerMenu", [41],"Player Menu"], // 41 = Tilde (above Tab)
	["A3W_customKeys_playerNames", [199,219,220],"Player Tags"], // 199 = Home, 219 = LWin, 220 = RWin
	["A3W_customKeys_Holster", [35],"Holster Weapon"], // 
	["A3W_customKeys_earPlugs", [207],"Ear Plugs"] // 207 = End
];

profileNamespace setVariable ["utopia_keys",_keys];

_voiceKeys = [];
{ _voiceKeys append actionKeys _x } forEach
[
	"NextChannel",
	"PrevChannel",
	"PushToTalk",
	"PushToTalkAll",
	"PushToTalkCommand",
	"PushToTalkDirect",
	"PushToTalkGroup",
	"PushToTalkSide",
	"PushToTalkVehicle"
];

A3W_allVoiceChatKeys = compileFinal str _voiceKeys;