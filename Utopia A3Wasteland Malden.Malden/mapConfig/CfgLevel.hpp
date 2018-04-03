/**
@Author : [utopia] Amaury
@Creation : 13/11/16
@Modification : 27/11/16
@Description : 
**/

#define colorWhite {1,1,1,1}
#define colorBronze {0.8,0.49,0.19,1}
#define colorSilver {0.75,0.75,0.75,1}
#define colorGold {0.9,0.83,0,1}
#define colorIPOD {0.25,0.5,1,1}

#define true 1
#define false 0

class CfgLeveling {
	skills[] = {
		// className / def val / str / points cost / max val
		{"unit_recoil"		,		0 , "Recoil coeff"			,	15 , 0.5},
		{"aim_coeff"		,		0 , "Aim coeff"				,	15 , 0.7},
		{"gun_store_red"	,		0,  "Gun store reduction"	,	20 , 0.5},
		{"veh_store_red"	,		0 ,	"Veh store reduction"	,	50 , 0.4},
		{"gen_store_red"	,		0 ,	"Gen store reduction" 	,	20 , 0.5}
	};
	levels[] = {
		//level,DisplayName,RankImage,required XP,PriceReduction(%),RecoilReduction(%),WPSwayReduction(%)
		{0,"Private 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\private_gs.paa",colorWhite},		200,		5},
		{1,"Private 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\private_gs.paa",colorBronze},		1000,		10},
		{2,"Private 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\private_gs.paa",colorSilver},		2000,		15},
		{3,"Private 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\private_gs.paa",colorGold},		4000,		20},

		{4,"Corporal 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",colorWhite},		5000,		5},
		{5,"Corporal 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",colorBronze},	6000,		10},
		{6,"Corporal 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",colorSilver},	7000,		15},
		{7,"Corporal 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",colorGold},		8000,		20},

		{8,"Sergeant 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",colorWhite},		10000,		5},
		{9,"Sergeant 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",colorBronze},	12000,		10},
		{10,"Sergeant 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",colorSilver},	14000,		15},
		{11,"Sergeant 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",colorGold},		16000,		20},

		{12,"Major 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\major_gs.paa",colorWhite},			20000,		5},
		{13,"Major 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\major_gs.paa",colorBronze},			22000,		10},
		{14,"Major 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\major_gs.paa",colorSilver},			24000,		15},
		{15,"Major 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\major_gs.paa",colorGold},			25000,		20},

		{16,"Lieutenant 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",colorWhite},25000,		5},
		{17,"Lieutenant 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",colorBronze},26000,		10},
		{18,"Lieutenant 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",colorSilver},27000,		15},
		{19,"Lieutenant 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",colorGold},	28000,		20},

		{20,"Captain 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",colorWhite},		29000,		10},
		{21,"Captain 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",colorBronze},		29000,		15},
		{22,"Captain 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",colorSilver},		29000,		15},
		{23,"Captain 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",colorGold},		29000,		20},

		{24,"Colonel 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa",colorWhite},		30000,		15},
		{25,"Colonel 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa",colorBronze},		35000,		20},
		{26,"Colonel 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa",colorSilver},		40000,		20},
		{27,"Colonel 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa",colorGold},		45000,		25},

		{28,"General 1",{"\A3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa",colorWhite},		50000,		20},
		{29,"General 2",{"\A3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa",colorBronze},		75000,		25},
		{30,"General 3",{"\A3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa",colorSilver},		100000,		25},
		{31,"General 4",{"\A3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa",colorGold},		100000,		30},
		{32,"IPOD",{"\A3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa",colorIPOD},			200000,		0},
		{33,"SUPER IPOD",{"\A3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa",colorIPOD},		300000,		0}
	};
};

class cfgSupplyDrop {
	// crate/vehicle |cost|requiredLevel|weapons|magazines|items|virtualItems
	drops[] = {
		{"Land_PaperBox_open_full_F","Survival box",1250,1,{},{},{},{
			{"cannedfood",5},
			{"water",5},
			{"energydrink",2},
			{"cookie",1}
		}},
		{"C_Quadbike_01_F","Emergency quadbike",1000,0,{},{},{},{}},
		{"Land_PaperBox_open_full_F","Repair box",30000,3,{},{},{},{
			{"jerrycanfull",2},
			{"syphonhose",1},
			{"repairkit",2},
			{"ammokit",1}
		}},
		{"Box_NATO_Wps_F","First Aid Box",10000,1,{},
		{
			{"B_IR_Grenade",1},
			{"O_IR_Grenade",1},
			{"I_IR_Grenade",1}
		},
		{
			{"FirstAidKit",20},
			{"itemGPS",5},
			{"Chemlight_blue",5},
			{"Binocular",5},
			{"RangeFinder",3}
		},
		{

		}},
		{"Box_NATO_Wps_F","'I need more rockets'",30000,4,{},
		{
			{"RPG7_F",5},
			{"RPG32_F",5},
			{"RPG32_HE_F",5},
			{"NLAW_F",5},
			{"Titan_AT",5},
			{"Titan_AP",5},
			{"Titan_AA",5}
		},
		{

		},
		{

		}}
	};
};