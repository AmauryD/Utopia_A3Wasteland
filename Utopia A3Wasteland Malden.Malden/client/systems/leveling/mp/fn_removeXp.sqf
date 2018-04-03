/*
	@author : by  [utopia] Amaury
*/ 

private _amount = param [0,0,[0]];
private _reason = param [1,0,[0]];

player_xp = player_xp - _amount;

[_amount,true,_reason] spawn lvl_updateLogHud;
[] spawn lvl_refreshLevel;