/**
	@autor : [utopia] Amaury
**/

_allTickets = ["getTickets", 2,true] call extDB_Database_async;
[_allTickets] remoteExecCall ["fn_updateDebugBox",remoteExecutedOwner];