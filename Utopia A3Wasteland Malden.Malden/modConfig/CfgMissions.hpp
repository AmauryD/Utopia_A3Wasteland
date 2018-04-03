/** centralization of server config by {utopia}Amaury **/



class CfgMissions
{
	class missionInfos {
		class mainMission {
			class mission_APC {
				displayName = "Transport blindé";
				description = "";
				hintText = "%1 <t color='%3'>%2</t> a été immobilisé , allez le récupérer !";
				hintTextSuccess = "Le %1 a été capturé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_armor.paa";
			};
			class mission_ArmedDiversquad {
				displayName = "Plongeurs armés";
				description = "";
				hintText = "An armed expedition is trying to recover sunken ammo crates.<br/>If you want to capture them, you will need diving gear and an underwater weapon.";
				hintTextSuccess = "The sunken crates have been captured, well done.";
				nbUnits = 6;
				missionMarkerImage = "";
			};
			class mission_ArmedHeli {
				displayName = "Hélicoptère armé";
				description = "";
				hintText = "%1 <t color='%3'>%2</t> a été immobilisé , allez le récupérer !";
				hintTextSuccess = "Le %1 a été capturé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_air.paa";
			};
			class mission_CivHeli {
				displayName = "Hélicoptère civil";
				description = "";
				hintText = "%1 <t color='%3'>%2</t> a été immobilisé , allez le récupérer !";
				hintTextSuccess = "Le %1 a été capturé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_air.paa";
			};
			class mission_Coastal_Convoy {
				displayName = "Patrouille côtière";
				description = "";
				hintText = "Deux <t color='%3'>%1</t> patrouillent sur le bord des côtes , escortés par <t color='%3'>%2</t>.<br/>Interceptez les et récupérez leur chargement !";
				hintTextSuccess = "La patrouille a été arrêtée , les caisses d'armes sont vôtres. Vous les trouverez près des épaves !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_naval.paa";
			};
			class mission_Convoy {
				displayName = "Convoi armé";
				description = "";
				hintText = "Un <t color='%2'>%1</t> transportant une caisse d'arme a été repéré. Arretez-les !";
				hintTextSuccess = "Le convoi a été neutralisé , les caisses d'armes sont à vous .";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_recon.paa";
			};
			class mission_HostileHeliFormation {
				displayName = "Patrouille d'hélicoptères";
				description = "";
				hintText = "Une formation d'hélicoptères composé de <t color='%3'>%1</t> et de deux <t color='%3'>%2</t> patrouille autour de l'île. Détruisez-les et récupérez leur contenu !";
				hintTextSuccess = "La patrouille d'hélicoptères	a été éliminée ! Les caisses d'armes sont tombées sur le sol.";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\o_air.paa";
			};
			class mission_LightArmVeh {
				displayName = "Véhicule armé légé";
				description = "";
				hintText = "%1 <t color='%3'>%2</t> a été immobilisé , allez le récupérer !";
				hintTextSuccess = "Le %1 a été capturé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_mech_inf.paa";
			};
			class mission_MBT {
				displayName = "Tank";
				description = "";
				hintText = "%1 <t color='%3'>%2</t> a été immobilisé , allez le récupérer !";
				hintTextSuccess = "Le %1 a été capturé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\GUI\Rsc\RscDisplayGarage\tank_ca.paa";
			};
		};
		class sideMission {
			class mission_AirWreck  {
				displayName = "Crash d'avion";
				description = "Capturez le !";
				hintText = "Un hélicoptère a été abattu !";
				hintTextSuccess = "Le contenu de l'avion a été récupéré.";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_plane.paa";
			};
			class mission_HostileHelicopter {
				displayName = "Patrouille d'hélicoptères";
				description = "Capturez le !";
				hintText = "Un <t color='%2'>%1</t> armé est en train de patrouiller . Interceptez-le et récupérez les caisses d'arme !";
				hintTextSuccess = "Le patrouille a été éliminée !<br/> Les caisses d'armes sont tombées au sol .";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\o_air.paa";
			};
			class mission_MetalConvoy {
				displayName = "Convoi de métal";
				description = "Capturez le !";
				hintText = "Un <t color='%2'>%1</t> transportant des pièces de métal a été repéré .";
				hintTextSuccess = "Le camion a été stoppé , n'hésitez pas à prendre le métal !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_recon.paa";
			};
			class mission_MiniConvoy {
				displayName = "Petit convoi";
				description = "Capturez le !";
				hintText = "Un <t color='%2'>%1</t> transportant une caisse d'armes est en route vers une destination inconnue. Arretez le convoi !";
				hintTextSuccess = "Le convoi a été stoppé , les caisses d'arme sont à vous !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_recon.paa";
			};
			class mission_Outpost {
				displayName = "Outpost";
				description = "Capturez le !";
				hintText = "Des forces spéciales ont été repérées patrouillant dans la zone , les combattre augmentera fortement votre expérience au combat.";
				hintTextSuccess = "L'outpost a été capturé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_installation.paa";
			};
			class mission_SunkenSupplies {
				displayName = "";
				description = "Capturez le !";
				hintText = "Sunken supplies have been spotted in the ocean near the marker, and are heavily guarded. Diving gear and an underwater weapon are recommended.";
				hintTextSuccess =  "The sunken supplies have been collected, well done.";
				nbUnits = 6;
			};
			class mission_TownInvasion {
				displayName = "Ville envahie";
				description = "Capturez le !";
				hintText = "Des rebelles ont pris <br/><t size='1.25' color='%1'>%2</t><br/><br/>Il semble y avoir <t color='%1'>%3 ennemis</t> se cachant dans les bâtiments. Eliminez-les et récupérez leur armement .<br/>Attention aux embuscades !";
				hintTextSuccess = "Bon boulot !<br/><br/><t color='%1'>%2</t><br/>est à nouveau un endroit sûr!<br/>Leurs affaires sont à vous !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa";
			};
			class mission_Truck {
				displayName = "Camion de ravitaillement";
				description = "";
			    hintText = "Un <t color='%2'>%1</t> a été immobilisé, récupérez-le pour votre équipe.";
				hintTextSuccess = "Le camion a été capturé , bien joué.";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_maint.paa";
			};
			class mission_vehPart {
				displayName = "Morceaux de véhicule";
				description = "";
				hintText = "Des caisses contenant des fournitures et une epave de véhicule en bon état ont été stockées dans un bunker millitaire haute sécurité , leur contenu pourrait vous êtes utile.";
				hintTextSuccess = "Le bunker a été nettoyé , bon boulot !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\b_unknown.paa";
			};
			class mission_WepCache {
				displayName = "Cache d'armes";
				description = "";
				hintText = "Une cache d'arme a été repérée près du marqueur.";
				hintTextSuccess = "Le contenu de l'épave a été sécurisé , bien joué !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa";
			};
			class mission_XP {
				displayName = "Forces spéciales";
				description = "";
				hintText = "Des forces spéciales ont été repérées patrouillant dans la zone , les combattre augmentera fortement votre expérience au combat.";
				hintTextSuccess = "Bon boulot !.";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
			};
		};
		class moneyMission {
			class mission_MoneyShipment {
				displayName = "Convoi d'argent";
				description = "";
				hintText = "Un convoi transportant <t color='%1'>%2</t> escorté par un <t color='%1'>%3</t> est en route vers une destination inconnue.<br/>Arretez-les !";
				hintTextSuccess = "Le convoi a été stoppé , l'argent est à vous.";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\NATO\o_armor.paa";
			};
			class mission_HackComputer {
				displayName = "Hack d'ordinateur";
				description = "";
				hintText = "Un ordinateur contenant des mots de passe de comptes banquaires se trouvant au Panama a été transféré à un camp rebelle local <br/> Hackez-le et profitez de l'argent !";
				hintTextSuccess = "L'ordinateur a été hacké , à vous l'argent !";
				nbUnits = 6;
				missionMarkerImage = "\A3\ui_f\data\Map\Markers\HandDrawn\objective_CA.paa";
			};
		};
	};

	class missionVehicles {
		class MainMissions {
			mission_APC[] = {"B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","I_APC_Wheeled_03_cannon_F"};
			mission_ArmedHeli[] = {"I_Heli_light_03_F","O_Heli_Light_02_F","B_Heli_Light_01_armed_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_black_F","B_CTRG_Heli_Transport_01_tropic_F","B_CTRG_Heli_Transport_01_sand_F"};
			mission_CivHeli[] = {"B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_stripped_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_F","I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","I_C_Heli_Light_01_civil_F"};
			mission_LightArmVeh[] = {"B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"};
			mission_MBT[] = {"B_APC_Tracked_01_AA_F","O_MBT_02_cannon_F","I_APC_tracked_03_cannon_F"}; //no MBT 
		};
		class SideMissions {
			mission_Truck[] = { "B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F","I_Truck_02_covered_F","I_Truck_02_fuel_F","I_Truck_02_medical_F","I_Truck_02_box_F"};
		};
		class MoneyMissions {
			mission_MoneyShipment[] = {
				{
					"Petit convoi d'argent", // Marker text
					25000, // Money
					{
						{ // NATO convoy
							{"B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"}, // Veh 1
							{"B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"} // Veh 2
						},
						{ // CSAT convoy
							{"O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"}, // Veh 1
							{"O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"} // Veh 2
						},
						{ // AAF convoy
							{"I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"}, // Veh 1
							{"I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"} // Veh 2
						}
					}
				},
				// Medium
				{
					"Convoi d'argent", // Marker text
					50000, // Money
					{
						{ // NATO convoy
							{"B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"}, // Veh 1
							{"B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F"}, // Veh 2
							{"B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"} // Veh 3
						},
						{ // CSAT convoy
							{"O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"}, // Veh 1
							{"O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"}, // Veh 2
							{"O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"} // Veh 3
						},
						{ // AAF convoy
							{"I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"}, // Veh 1
							{"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"}, // Veh 2
							{"I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"} // Veh 3
						}
					}
				},
				// Hard
				{
					"Gros convoi d'argent", // Marker text
					75000, // Money
					{
						{ // NATO convoy
							{"B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F"}, // Veh 1
							{"B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"}, // Veh 2
							{"B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F"} // Veh 3
						},
						{ // CSAT convoy
							{"O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"}, // Veh 1
							{"O_MBT_02_cannon_F"}, // Veh 2
							{"O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"} // Veh 3
						},
						{ // AAF convoy
							{"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"}, // Veh 1
							{"I_MBT_03_cannon_F"}, // Veh 2
							{"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"} // Veh 3
						}
					}
				},
				// Extreme
				{
					"Enorme convoi d'argent", // Marker text
					100000, // Money
					{
						{ // NATO convoy
							{"B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"}, // Veh 1
							{"B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"}, // Veh 2
							{"B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"}, // Veh 3
							{"B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"} // Veh 4
						},
						{ // CSAT convoy
							{"O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"}, // Veh 1
							{"O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"}, // Veh 2
							{"O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"}, // Veh 3
							{"O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"} // Veh 4
						},
						{ // AAF convoy
							{"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"}, // Veh 1
							{"I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"}, // Veh 2
							{"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"}, // Veh 3
							{"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"} // Veh 4
						}
					}
				}
			};
		};
	};

	class missionLoots {
		class boxes {
			mission_AircraftWreck[] =  {
				{"wep", {"arifle_CTAR_blk_F"}, 2 , 4},
				{"wep", {"launch_RPG32_F"}, 1 , 4},
				{"wep", {"launch_RPG7_F"}, 1 , 4},
				{"wep", {"srifle_DMR_06_camo_F"}, 1 , 4},
				{"wep", {"arifle_MXC_F"}, 1 , 4},
				{"wep", {"hgun_Pistol_heavy_01_snds_F"}, 2 , 8},

				{"itm", "optic_NVS" , 2}
			};
			mission_ArmedConvoy[] =  {
				{"wep", {"hgun_PDW2000_F"},2,4},
				{"wep", {"SMG_02_F"},2,4},
				{"wep", {"arifle_AKM_F"},1,4},
	            {"wep", {"srifle_DMR_01_DMS_BI_F"}, 1 , 2},
				{"wep", {"MMG_02_black_F"}, 1 , 2},
				{"wep", {"LMG_Mk200_F"}, 2 , 4},
				{"wep", {"launch_RPG32_ghex_F"}, 1 , 4},
				{"wep", {"launch_RPG7_F"}, 1 , 4}
			};
			mission_Outpost[] =  {
				{"wep", {"srifle_DMR_01_F"}, 1 , 2},
				{"wep", {"srifle_EBR_F"}, 2 , 4},
				{"wep", {"hgun_Pistol_heavy_02_F"}, 2 , 4},
	            {"wep", {"arifle_Katiba_F"}, 2 , 4},
				{"wep", {"arifle_MXC_F"}, 1 , 2},
				{"wep", {"launch_NLAW_F"}, 1 , 4},
	            {"wep", {"srifle_DMR_06_olive_F"}, 2 , 4},
				{"wep", {"hgun_Pistol_heavy_01_MRD_F"}, 2 , 8}
			};
			mission_Supplytruck[] = {
				{"wep", {"LMG_Zafir_F"}, 1 , 4},
				{"wep", {"arifle_Mk20_GL_F"}, 2 , 4},
				{"wep", {"arifle_TRG20_ACO_F"}, 2 , 4},
				{"wep", {"launch_RPG32_F"}, 1 , 4},
				{"wep", {"launch_RPG7_F"}, 1 , 4},
				{"wep", {"hgun_ACPC2_snds_F"}, 2 , 8},
				{"wep", {"srifle_DMR_01_F"}, 2 , 4},
				{"wep", {"arifle_MX_GL_F"}, 2 , 4}
			};
			mission_USLaunchers[] =  {
				{"wep", {"launch_NLAW_F"}, 1 , 3},
				{"wep", {"launch_RPG32_F"}, 2 , 2},
				{"wep", {"launch_RPG7_F"}, 3 , 2},
				{"mag", {"HandGrenade"} , 4},
				{"mag", {"MiniGrenade"} , 6}
			};
			mission_USSpecial[] =  {
				{"wep", {"arifle_Katiba_F"}, 2 , 3},
				{"wep", {"arifle_Mk20_F"}, 1 , 3},
				{"wep", {"arifle_Mk20C_F"}, 1 , 3},
				{"wep", {"arifle_MXC_F"}, 2 , 3},
				{"wep", {"arifle_MX_F"}, 2 , 3},
				{"wep", {"hgun_PDW2000_F"}, 1 , 3},
				{"wep", {"SMG_05_F"}, 1, 3},
				{"wep", {"arifle_SDAR_F"}, 1, 3},
				{"wep", {"arifle_AKS_F"}, 2, 4},
				{"wep", {"SMG_05_F"}, 1, 3},
				{"wep", {"arifle_TRG20_F"}, 1, 3},
				{"wep", {"arifle_TRG21_F"}, 1, 3}
			};
			mission_Pistols[] =  {
				{"wep", {"hgun_ACPC2_F"},2,5},
				{"wep", {"hgun_P07_F"},2,5},
				{"wep", {"hgun_Rook40_F"},2,5}
			};
			mission_Main_A3snipers[] = {
				{"wep", {"arifle_MXM_F"}, 4 , 3},
				{"wep", {"srifle_DMR_01_F"}, 4 , 3},
				{"itm", "FirstAidKit" , 5},
				{"itm", "NVGoggles" , 5},
				{"itm", "ItemMap" , 2},
				{"itm", "optic_DMS" , 2},
				{"itm", "optic_Arco" , 1},
				{"itm", "optic_Aco" , 1},
				{"itm", "ItemGPS" , 2},
				{"wep", {"srifle_DMR_02_F"}, 4 , 3}
			};
		};
		class trucks {
			main[] = {
				{"wep", {"arifle_Mk20_F"}, 1 , 2},
				{"wep", {"arifle_Mk20C_F"}, 1 , 2},
				{"wep", {"arifle_MXC_F"}, 2 , 4},

				{"mag", {"SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange"} , 10},
				{"mag", {"MiniGrenade"} , 10},
				{"mag", {"SLAMDirectionalMine_Wire_Mag"} , 1},
				{"mag", {"APERSTripMine_Wire_Mag"} , 2},
				{"mag", {"DemoCharge_Remote_Mag"} , 1},

				{"itm", "FirstAidKit" , 20},
				{"itm", "NVGoggles" , 5},
				{"itm", "ItemMap" , 2},
				{"itm", "ItemGPS" , 2},
				{"itm", "MineDetector" , 2},
				{"itm", "optic_Hamr" , 2},
				{"itm", "optic_Arco" , 2},
				{"itm", "optic_Aco" , 2},
				{"itm", "optic_Holosight" , 2},
				{"itm", "optic_Holosight_smg" , 1},
				{"itm", "optic_MRCO" , 2},
				{"itm", "optic_Yorris" , 1},
				{"itm", "optic_MRD" , 1},
				{"itm", "acc_flashlight" , 2},
				{"itm", "acc_pointer_IR" , 2},
				{"itm", "muzzle_snds_acp" , 1},
				{"itm", "muzzle_snds_58_blk_F" , 1},
				{"itm", "muzzle_snds_H_khk_F" , 1},
				{"itm", "muzzle_snds_m_khk_F" , 1},
				{"itm", "muzzle_snds_B_khk_F" , 1}
			};
		};
	};
};