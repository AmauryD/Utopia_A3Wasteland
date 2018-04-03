// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createMissionMarker.sqf
//	@file Author: AgentRev

private ["_text", "_pos", "_marker","_color","_image"];

_text = _this select 0;
_pos = _this select 1;
_color = param [2,"ColorRed",[""]];
_image = param [3,"\A3\ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa",[""]];

_marker = format ["mission_active:%1:%2:%3", _text, call A3W_fnc_generateKey,_image];

_marker = createMarker [_marker, _pos];
_marker setMarkerColor _color;
//_marker setMarkerType "mil_destroy";
//_marker setMarkerSize [1.25, 1.25];
//_marker setMarkerColor "ColorRed";
//_marker setMarkerText _text;

_marker
