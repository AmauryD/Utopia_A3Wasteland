/**
	@autor : [utopia] Amaury
	@description : function compiled with ug_fnc_compileRemote , only for remoteExec
**/


_title = param[0,"",[""]];
_content = param[1,"",[""]];

_sender = [] call ug_fnc_remoteOwnerToObject;

if (isNull _sender) exitWith {};

_ownerUID = getPlayerUID _sender;

//_title = [_title] call fn_escapeSQLChars; // thank's extDB , don't need that anymore
//_content = [_content] call fn_escapeSQLChars;

[format ["addTicket:%1:%2:%3",_title,_content,_ownerUID]] call extDB_Database_async;

uiSleep 0.2;

[] call fn_debugBoxRequest;