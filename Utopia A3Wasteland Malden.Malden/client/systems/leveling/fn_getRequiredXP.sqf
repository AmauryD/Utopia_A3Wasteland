#include "macro.h"
/*
	@author : by  [utopia] Amaury
*/ 

private _level = param [0,0,[0]];
private _xp = ([_level] call lvl_getLevelData) select RANK_REQUIRED_XP;

_xp