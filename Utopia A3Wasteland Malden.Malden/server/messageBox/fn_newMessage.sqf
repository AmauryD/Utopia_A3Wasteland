/*
	@author : by  [utopia] Amaury
*/ 

_message = param [0,"",[""]];
_receiverUID = param [1,"",[""]];

_sender = [] call ug_fnc_remoteOwnerToObject;
_receiver = [_receiverUID] call ug_fnc_getPlayerByUID;

_senderUID = getPlayerUID _sender;

if(_receiverUID == "" || _senderUID == "" || _message == "") exitWith {};

[format ["insertMessage:%1:%2:%3",_message,_senderUID,_receiverUID]] call extDB_Database_async;

if !(isNull _receiver) then {
	[format["Message from %1 : \n%2",name _sender,_message]] remoteExecCall ["ug_fnc_displayMessage",_receiver];
};

uiSleep 0.2;

[] call ug_fnc_msgBoxSendMessages;