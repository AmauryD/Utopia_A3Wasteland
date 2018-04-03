#include "macro.h"
/**
@Author : [utopia] Amaury
@Creation : 2#/11/16
@Modification : 27/11/16
@Description : 
**/

private _rank = param [0,0];

private _img = ([_rank] call lvl_getLevelData) select RANK_IMAGE;

_img