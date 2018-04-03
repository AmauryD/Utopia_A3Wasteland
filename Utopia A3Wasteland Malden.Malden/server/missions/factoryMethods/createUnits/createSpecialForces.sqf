// ******************************************************************************************
// * _unit project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	if (_unit == leader _group) then
	{
		_unit setRank "CAPTAIN";
	}else{
		_unit setRank "LIEUTENANT";
	};

	switch (true) do
	{
		// RPG every 7 units, starting from second one
		case (_i in [0]):
		{
			comment "Add containers";
			_unit forceAddUniform "U_O_V_Soldier_Viper_F";
			_unit addVest "V_PlateCarrierGL_rgr";
			for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
			_unit addItemToVest "MineDetector";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
			_unit addBackpack "B_Carryall_oli";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
			_unit addHeadgear "H_HelmetB_Enh_tna_F";
			_unit addGoggles "G_Balaclava_TI_G_blk_F";

			comment "Add weapons";
			_unit addWeapon "arifle_SPAR_01_GL_khk_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_ERCO_khk_F";
			_unit addWeapon "launch_B_Titan_tna_F";
			_unit addSecondaryWeaponItem "acc_pointer_IR";
			_unit addWeapon "binocular";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_INDEP";

			comment "Set identity";
			_unit setFace "Default";
			_unit setSpeaker "male01eng";

			_unit setVariable ["xp",500];

		};
		case (_i in [1]): //sniper-medic
		{
			comment "Add containers";
			_unit forceAddUniform "U_O_V_Soldier_Viper_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
			_unit addVest "V_PlateCarrierGL_rgr";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 3 do {_unit addItemToVest "5Rnd_127x108_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
			_unit addItemToVest "Laserbatteries";
			for "_i" from 1 to 2 do {_unit addItemToVest "5Rnd_127x108_APDS_Mag";};
			_unit addBackpack "B_ViperLightHarness_ghex_F";
			for "_i" from 1 to 3 do {_unit addItemToBackpack "FirstAidKit";};
			_unit addItemToBackpack "Medikit";
			_unit addItemToBackpack "5Rnd_127x108_APDS_Mag";
			_unit addItemToBackpack "16Rnd_9x21_Mag";
			_unit addItemToBackpack "5Rnd_127x108_Mag";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
			_unit addHeadgear "H_HelmetB_Enh_tna_F";
			_unit linkItem "NVGoggles_INDEP";

			comment "Add weapons";
			_unit addWeapon "srifle_GM6_ghex_F";
			_unit addPrimaryWeaponItem "optic_DMS_ghex_F";
			_unit addWeapon "hgun_P07_khk_F";
			_unit addHandgunItem "muzzle_snds_L";
			_unit addWeapon "Laserdesignator";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_INDEP";

			comment "Set identity";
			_unit setFace "Default";
			_unit setSpeaker "male01eng";

			_unit setVariable ["xp",500];

		};
		case (_i in [2]): // machinegunner
		{
			comment "Add containers";
			_unit forceAddUniform "U_O_V_Soldier_Viper_F";
			_unit addVest "V_PlateCarrierGL_rgr";
			for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
			for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			_unit addBackpack "B_ViperLightHarness_ghex_F";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "130Rnd_338_Mag";};
			_unit addHeadgear "H_HelmetB_Enh_tna_F";
			_unit addGoggles "G_Balaclava_TI_G_blk_F";

			comment "Add weapons";
			_unit addWeapon "MMG_02_camo_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_DMS";
			_unit addPrimaryWeaponItem "bipod_03_F_oli";
			_unit addWeapon "binocular";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_INDEP";

			comment "Set identity";
			_unit setFace "Default";
			_unit setSpeaker "male01eng";

			_unit setVariable ["xp",500];
		};

		case (_i in [3]): // at
		{
			comment "Add containers";
			_unit forceAddUniform "U_O_V_Soldier_Viper_F";
			_unit addVest "V_PlateCarrierGL_rgr";
			for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
			_unit addItemToVest "MineDetector";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
			_unit addBackpack "B_Carryall_oli";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
			_unit addItemToBackpack "Titan_AP";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
			_unit addHeadgear "H_HelmetB_Enh_tna_F";
			_unit addGoggles "G_Balaclava_TI_G_blk_F";

			comment "Add weapons";
			_unit addWeapon "arifle_SPAR_01_GL_khk_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_ERCO_khk_F";
			_unit addWeapon "launch_B_Titan_short_tna_F";
			_unit addSecondaryWeaponItem "acc_pointer_IR";
			_unit addWeapon "binocular";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_INDEP";

			comment "Set identity";
			_unit setFace "Default";
			_unit setSpeaker "male01eng";
		};
		// Rifleman
		default
		{
			comment "Add containers";
			_unit forceAddUniform "U_O_V_Soldier_Viper_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
			_unit addVest "V_PlateCarrier1_rgr";
			for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
			for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
			for "_i" from 1 to 5 do {_unit addItemToVest "20Rnd_762x51_Mag";};
			for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			_unit addHeadgear "H_HelmetB_Enh_tna_F";
			_unit addGoggles "G_Balaclava_TI_G_blk_F";

			comment "Add weapons";
			_unit addWeapon "srifle_DMR_03_multicam_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_ERCO_khk_F";
			_unit addPrimaryWeaponItem "bipod_03_F_oli";
			_unit addWeapon "hgun_P07_khk_F";
			_unit addWeapon "binocular";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_INDEP";

			_unit setVariable ["xp",400];
		};
	};

	{_unit setSkill [_x select 0, _x select 1];}foreach [
		["aimingAccuracy",0.6],
		["aimingSpeed",1],
		["spotDistance",1],
		["spotTime",1],
		["courage",0.8],
		["reloadSpeed",1],
		["aimingShake",0.7],
		["commanding",1]
	];
	_unit enableFatigue false;

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
