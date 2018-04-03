// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "player_sys.sqf"

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'client\systems\playerMenu\item_list.sqf'";

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Impri Mante, v1.063, #Tadyjo)
		////////////////////////////////////////////////////////

		class MainBG: IGUIBack
		{
			idc = -1;
			moving = 1;

			x = 0.225878 * safezoneW + safezoneX;
			y = 0.159986 * safezoneH + safezoneY;
			w = 0.430307 * safezoneW;
			h = 0.527022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.6};
		};
		class TopBar: IGUIBack
		{
			idc = -1;

			x = 0.225878 * safezoneW + safezoneX;
			y = 0.159986 * safezoneH + safezoneY;
			w = 0.430307 * safezoneW;
			h = 0.0510022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.25,0.51,0.96,0.8};
		};
		class MainTitle: w_RscText
		{
			shadow = 2;

			idc = 1000;
			text = "Player Inventory"; //--- ToDo: Localize;
			x = 0.38047 * safezoneW + safezoneX;
			y = 0.159986 * safezoneH + safezoneY;
			w = 0.191247 * safezoneW;
			h = 0.0425018 * safezoneH;
		};
		class waterIcon: w_RscPicture
		{
			idc = 1001;
			text = "client\icons\water.paa"; //--- ToDo: Localize;
			x = 0.245004 * safezoneW + safezoneX;
			y = 0.227988 * safezoneH + safezoneY;
			w = 0.0191247 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class foodIcon: w_RscPicture
		{
			idc = 1002;
			text = "client\icons\food.paa"; //--- ToDo: Localize;
			x = 0.245004 * safezoneW + safezoneX;
			y = 0.278991 * safezoneH + safezoneY;
			w = 0.0191247 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class moneyIcon: w_RscPicture
		{
			idc = 1003;
			text = "client\icons\money.paa"; //--- ToDo: Localize;
			x = 0.245004 * safezoneW + safezoneX;
			y = 0.329993 * safezoneH + safezoneY;
			w = 0.0191247 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class waterText: w_RscText
		{
			idc = 2003;

			x = 0.276878 * safezoneW + safezoneX;
			y = 0.227988 * safezoneH + safezoneY;
			w = 0.167341 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class foodText: w_RscText
		{
			idc = 2004;

			x = 0.276878 * safezoneW + safezoneX;
			y = 0.278991 * safezoneH + safezoneY;
			w = 0.167341 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class moneyText: w_RscText
		{
			idc = 2002;

			x = 0.276878 * safezoneW + safezoneX;
			y = 0.329993 * safezoneH + safezoneY;
			w = 0.167341 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class uptimeText: w_RscText
		{
			idc = 2010;

			x = 0.492031 * safezoneW + safezoneX;
			y = 0.636006 * safezoneH + safezoneY;
			w = 0.143436 * safezoneW;
			h = 0.0255011 * safezoneH;
		};
		class itemList: w_RscList
		{
			idc = 2005;

			x = 0.492031 * safezoneW + safezoneX;
			y = 0.227988 * safezoneH + safezoneY;
			w = 0.14981 * safezoneW;
			h = 0.276262 * safezoneH;
		};
		class DropButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[1] execVM 'client\systems\playerMenu\itemfnc.sqf'";

			text = "Drop"; //--- ToDo: Localize;
			x = 0.570124 * safezoneW + safezoneX;
			y = 0.521421 * safezoneH + safezoneY;
			w = 0.073949 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class UseButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[0] execVM 'client\systems\playerMenu\itemfnc.sqf'";

			text = "Use"; //--- ToDo: Localize;
			x = 0.492988 * safezoneW + safezoneX;
			y = 0.521421 * safezoneH + safezoneY;
			w = 0.073949 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class moneyInput: w_RscCombo
		{
			idc = 2007;

			x = 0.571718 * safezoneW + safezoneX;
			y = 0.585004 * safezoneH + safezoneY;
			w = 0.073949 * safezoneW;
			h = 0.0255011 * safezoneH;
		};
		class DropcButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\playerMenu\dropMoney.sqf'";

			text = "Drop"; //--- ToDo: Localize;
			x = 0.492988 * safezoneW + safezoneX;
			y = 0.585004 * safezoneH + safezoneY;
			w = 0.073949 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CloseButton: w_RscButton
		{
			idc = 20120;
			onButtonClick = "[] execVM 'client\systems\playerMenu\closePlayerMenu.sqf'";

			text = "Close"; //--- ToDo: Localize;
			x = 0.237035 * safezoneW + safezoneX;
			y = 0.636006 * safezoneH + safezoneY;
			w = 0.0796864 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GroupsButton: w_RscButton
		{
			idc = 2011;
			onButtonClick = "[] execVM 'client\systems\groups\loadGroupManagement.sqf'";

			text = "Group Management"; //--- ToDo: Localize;
			x = 0.340627 * safezoneW + safezoneX;
			y = 0.636006 * safezoneH + safezoneY;
			w = 0.127498 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class btnDistanceCHVD: w_RscButton
		{
			idc = -1;
			onButtonClick = "call CHVD_fnc_openDialog";

			text = "Viewdist."; //--- ToDo: Localize;
			x = 0.235685 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.0830703 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class level_image : w_RscPicture
		{
			idc = 1016;
			text = ""; //--- ToDo: Localize;
			x = 0.245004 * safezoneW + safezoneX;
			y = 0.431997 * safezoneH + safezoneY;
			w = 0.0191247 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class level_bar : RscProgressBar
		{
			idc = 2009;

			x = 0.276878 * safezoneW + safezoneX;
			y = 0.431997 * safezoneH + safezoneY;
			w = 0.167341 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class bank_image : w_RscPicture
		{
			idc = 1020;
			text = "client\icons\suatmm_icon.paa"; //--- ToDo: Localize;
			x = 0.245004 * safezoneW + safezoneX;
			y = 0.380995 * safezoneH + safezoneY;
			w = 0.0191247 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class bank_text : w_RscText
		{
			idc = 2102;

			x = 0.276878 * safezoneW + safezoneX;
			y = 0.380995 * safezoneH + safezoneY;
			w = 0.167341 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 0.667341 * safezoneW + safezoneX;
			y = 0.159986 * safezoneH + safezoneY;
			w = 0.151404 * safezoneW;
			h = 0.527022 * safezoneH;
		};
		class TopBar_right: IGUIBack
		{
			idc = -1;

			x = 0.667341 * safezoneW + safezoneX;
			y = 0.159986 * safezoneH + safezoneY;
			w = 0.151404 * safezoneW;
			h = 0.0510022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.25,0.51,0.96,0.8};
		};
		class right_level_title: RscText
		{
			idc = 1018;
			text = "Level Reductions"; //--- ToDo: Localize;
			x = 0.691247 * safezoneW + safezoneX;
			y = 0.159986 * safezoneH + safezoneY;
			w = 0.111561 * safezoneW;
			h = 0.0510022 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\A3\ui_f\data\IGUI\Cfg\WeaponIcons\srifle_ca.paa";
			x = 0.67531 * safezoneW + safezoneX;
			y = 0.227988 * safezoneH + safezoneY;
			w = 0.0318746 * safezoneW;
			h = 0.0510022 * safezoneH;
		};
		class wpSway : w_RscText
		{
			idc = 1022;
			text = "Weapon Sway :"; //--- ToDo: Localize;
			x = 0.707185 * safezoneW + safezoneX;
			y = 0.227988 * safezoneH + safezoneY;
			w = 0.103592 * safezoneW;
			h = 0.0510022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class gs : w_RscText
		{
			idc = 1022;
			text = "Gun store :"; //--- ToDo: Localize;
			x = 0.707185 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.103592 * safezoneW;
			h = 0.0510022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "\A3\ui_f\data\GUI\Cfg\Hints\AmmoType_CA.paa";
			x = 0.673693 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.0318746 * safezoneW;
			h = 0.0510022 * safezoneH;
		};
		class gun_store_txt: RscText
		{
			idc = 1024;
			x = 0.673693 * safezoneW + safezoneX;
			y = 0.431997 * safezoneH + safezoneY;
			w = 0.127498 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class wp_sway_txt: RscText
		{
			idc = 1025;
			x = 0.67531 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.127498 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class controls_btn: w_RscButton
		{
			idc = 1600;
			text = "Controls"; //--- ToDo: Localize;
			onButtonClick="[] spawn fn_loadControlsMenu;";
			x = 0.235685 * safezoneW + safezoneX;
			y = 0.517001 * safezoneH + safezoneY;
			w = 0.0830703 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class HOF_btn: w_RscButton
		{
			idc = 1600;
			text = "Hall Of Fame"; //--- ToDo: Localize;
			onButtonClick="[] spawn loadHallOfFame;";
			x = 0.340627 * safezoneW + safezoneX;
			y = 0.517001 * safezoneH + safezoneY;
			w = 0.127498 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
