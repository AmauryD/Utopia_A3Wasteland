/*
	@author : by  [utopia] Amaury
*/ 

_id = param [0,-1,[0]];

[format ["deleteMessage:%1",_id]] call extDB_Database_async;

uiSleep 0.2;

[] call ug_fnc_msgBoxSendMessages;