/**
@Author : [utopia] Amaury
@Creation : 2#/11/16
@Modification : ??/11/16
@Description : 
**/

disableSerialization;
if !(isNull findDisplay 666) exitWith {};

createDialog "bugBox";

if(isNil "debug_send") then {
	debug_send = false;
};

private _display = findDisplay 666;
private _send_btn = _display displayCtrl 1600;

[] remoteExec ["fn_debugBoxRequest",2];

_send_btn ctrlAddEventHandler ["ButtonClick",{
	private _display = findDisplay 666;
	private _titleCtrl = _display displayCtrl 1400;
	private _textCtrl = _display displayCtrl 1401;

	private _title = ctrlText _titleCtrl;
	private _text = ctrlText _textCtrl;

	if(count _title > 30) exitWith {hintSilent "Your title is too long"};
	if(count _text > 500) exitWith {hintSilent "Your content is too long"};

	if(count _title < 5) exitWith {hintSilent "Your title is too short"};
	if(count _text < 5) exitWith {hintSilent "Your bug explanation / content is too short."};

	if !([30,"bug_box"] call ug_fnc_notTooFast) exitWith {hintSilent "Please wait a little before sending another ticket"};

	[_title,_text] remoteExec ["fn_debugBoxAddTicket",2];

	_titleCtrl ctrlSetText "";
	_textCtrl ctrlSetText "";
	debug_send = true;
}];
