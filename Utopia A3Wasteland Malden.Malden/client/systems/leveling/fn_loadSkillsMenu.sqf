disableSerialization;

comment "strange way to code huh ? i'm actually having fun doing this , that's the most important ...";

_skills = getArray (missionConfigFile >> "CfgLeveling" >> "Skills");


_part_1 = [];
_part_2 = [];

{
	_skillInfo = _skills select _forEachIndex;
	_skillClass = _skillInfo select 0;
	_skillDefault = _skillInfo select 1;
	_skillName = _skillInfo select 2;
	_skillCost = _skillInfo select 3;

	_part_1 pushBack [format["%1",_skillClass],"RscProgressBar",-1];
	_part_1 pushBack [format["pText_%1",_skillClass],"w_RscTextCenter",-1,[["text",format ["%1%2",(_x select 1) * 100,"%"]]]];
	_part_1 pushBack [format["cText_%1",_skillClass],"w_RscText",-1,[["text",format ["cost : %1",_skillCost]]]];
	_part_1 pushBack [format["text_%1",_skillClass],"RscText",-1,[["text",_skillName]]];
	_part_1 pushBack [format["button_%1",_skillClass],"w_RscButton",-1,[["text",">"],["data",_skillInfo],["ButtonClick",{
		_display = ctrlParent (_this select 0);
		_data = (_this select 0) getVariable "ED_data";
		_className = _data select 0;
		_cost = _data select 3;
		_max = _data select 4;

		_val = [ug_skills,_className] call bis_fnc_getFromPairs;
		_newVal = _val + 0.1;

		if(_newVal > _max) exitWith {hintSilent "Skill at his maximum"};
		if(ug_skillPoints < _cost) exitWith {hintSilent "You don't have enough skill points to buy this"};

		ug_skillPoints = ug_skillPoints - _cost;
		[ug_skills,_className,_newVal] call bis_fnc_setToPairs;

		(_display getVariable _className) progressSetPosition _newVal;
		(_display getVariable format["pText_%1",_className]) ctrlSetText format ["%1%2",_newVal * 100,"%"];
		(_display getVariable "skill_text") ctrlSetText format ["Available skill points : %1",ug_skillPoints];

		[] call lvl_updateSkills;
		[] spawn fn_savePlayerData;
	}]]];
}foreach ug_skills;

_i = 0;
{
	_skillInfo = _skills select _forEachIndex;
	_skillClass = _skillInfo select 0;
	_skillDefault = _skillInfo select 1;
	_skillName = _skillInfo select 2;

	_part_2 pushBack [format["%1",_skillClass],			[41,33+_i,20,5]	];
	_part_2 pushBack [format["pText_%1",_skillClass],	[41,33+_i,20,5]	];
	_part_2 pushBack [format["ctext_%1",_skillClass],	[65,33+_i,10,5]	];
	_part_2 pushBack [format["text_%1",_skillClass],	[26,33+_i,14,5]	];
	_part_2 pushBack [format["button_%1",_skillClass],	[62,33+_i,2,5]	];

	_i = _i + 7;
}foreach ug_skills;


[
	"skills_menu",
	[100,100],
	[
		["background","IGUIBACK",-1,[["backGroundColor",[0,0,0,0.6]]]],
		["header","RscText",-1],
		["close_btn","w_RscButton",-1,[["text","X"],["ButtonClick",{ctrlParent (_this select 0) closeDisplay 0}]]],
		["skill_text","w_RscTextCenter",-1],
		["main_header","w_RscTextCenter",-1,[
			["text","Skills"],
			["backgroundcolor",[0.25,0.51,0.96,0.8]]
		]]
	] + _part_1
	,
	[
		["background",[25,25,50,count ug_skills * 9]],
		["skill_text",[26,26,48,5]],
		["main_header",[25,20,50,5]],
		["close_btn",[72,21,2,4]]
	] + _part_2
	,true
] call ED_fnc_register;


_display = ["skills_menu",
	["DISPLAY",[["player_menu"] call ED_fnc_find]]
] call ED_fnc_create;

(_display getVariable "skill_text") ctrlSetText format ["Available skill points : %1",ug_skillPoints];

{
	_progressBar = _display getVariable (_x select 0);
	_progressBar progressSetPosition (_x select 1);
	_progressBar ctrlSetTextColor [0.25,0.51,0.96,1];
}foreach ug_skills;