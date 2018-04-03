/*
	@author : by  [utopia] Amaury
*/ 

_sender = [] call ug_fnc_remoteOwnerToObject;

_result = [format ["getPlayerMessages:%1",getPlayerUID _sender],2,true] call extDB_Database_async;

[_result] remoteExecCall ["ug_fnc_updateMessageBox",remoteExecutedOwner];