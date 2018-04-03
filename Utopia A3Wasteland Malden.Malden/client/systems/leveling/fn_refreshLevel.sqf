#include "macro.h"
/*
	@author : by  [utopia] Amaury
*/ 

_levels = getArray (missionConfigFile >> "CfgLeveling" >> "levels");
_levels_count = count _levels - 1;
_maxLvlXP = [player_level] call lvl_getRequiredXP;

if(player_xp >= _maxLvlXP) then {
	if(player_level < _levels_count) then {
		player_xp = player_xp - _maxLvlXP;

		_oldlevelData = [player_level] call lvl_getLevelData;
		_earnedPoints = _oldlevelData select 4;

		player_level = player_level + 1;
		_newlevelData = [player_level] call lvl_getLevelData;
		_levelName = _newlevelData select 1;
		_levelPicture = _newlevelData select 2 select 0;
		_levelPictureColor = (_newlevelData select 2 select 1) call bis_fnc_colorRGBAtoHTML;


		hint parseText format ["<t size='1.5' align='center'>Bravo !</t> <br/> You are now level %1<br/><img image='%3' size='3' color='%4'/><br/><t align='center' color='%4' size='1.4'>%2</t><br/>
		<t align='center'>You have earned %5 skill points</t>",player_level,_levelName,_levelPicture,_levelPictureColor,_earnedPoints];
		ug_skillPoints = ug_skillPoints + _earnedPoints;
		[] call lvl_updateSkills;
	}else{
		player_xp = _maxLvlXP;
	};
};
while {player_xp < 0} do {
	if(player_level != 0) then {
		_maxLvlXP = (player_level - 1) call lvl_getRequiredXP;
		player_level = player_level - 1;
		player_xp = _maxLvlXP + player_xp;
	}else{
		player_xp = 0;
	};
};