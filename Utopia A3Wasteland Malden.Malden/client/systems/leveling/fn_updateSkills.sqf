_skills = missionNamespace getVariable ["ug_skills",[]];

{
	_key = _x param [0,"",[""]];
	_value =  _x param [1,0,[0]];
	switch (_x select 0) do { 
		case "unit_recoil" : 	{ 	player setUnitRecoilCoefficient  (1 - (_x select 1)) 	}; 
		case "aim_coeff" : 		{ 	player setCustomAimCoef    (1 - (_x select 1)) 	}; 
		case "gun_store_red" :  { 													};
		case "veh_store_red" :  {													};
		case "gen_store_red" :  {													};
	};
}foreach _skills;

