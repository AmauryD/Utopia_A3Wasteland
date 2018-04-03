// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat, [KoS] Bewilderbeest
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603

class WastelandHud {
	idd = -1;
	fadeout=0;
	fadein=0;
	duration = 1e10;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";

	class controlsBackground {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Impri Mante, v1.063, #Remexi)
		////////////////////////////////////////////////////////

		class main_background: IGUIBack
		{
			idc = 2200;
			x = 0.914369 * safezoneW + safezoneX;
			y = 0.704009 * safezoneH + safezoneY;
			w = 0.087655 * safezoneW;
			h = 0.306013 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class health_bar: RscProgressBar
		{
			idc = 2201;
			x = 0.914369 * safezoneW + safezoneX;
			y = 0.857015 * safezoneH + safezoneY;
			w = 0.0637491 * safezoneW;
			h = 0.0340014 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class health_icon: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.978118 * safezoneW + safezoneX;
			y = 0.857015 * safezoneH + safezoneY;
			w = 0.02125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class food_bar: RscProgressBar
		{
			idc = 2202;
			x = 0.914369 * safezoneW + safezoneX;
			y = 0.95902 * safezoneH + safezoneY;
			w = 0.0637491 * safezoneW;
			h = 0.0340014 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class food_icon: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.978118 * safezoneW + safezoneX;
			y = 0.95902 * safezoneH + safezoneY;
			w = 0.02125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class water_bar: RscProgressBar
		{
			idc = 2203;
			x = 0.914369 * safezoneW + safezoneX;
			y = 0.908017 * safezoneH + safezoneY;
			w = 0.0637491 * safezoneW;
			h = 0.0340014 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class water_icon: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.978118 * safezoneW + safezoneX;
			y = 0.908017 * safezoneH + safezoneY;
			w = 0.02125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class money_icon: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.978118 * safezoneW + safezoneX;
			y = 0.704009 * safezoneH + safezoneY;
			w = 0.02125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class bank_icon: RscPicture
		{
			idc = 1204;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.978118 * safezoneW + safezoneX;
			y = 0.755011 * safezoneH + safezoneY;
			w = 0.02125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class xp_bar: RscProgressBar
		{
			idc = 2206;
			x = 0.914369 * safezoneW + safezoneX;
			y = 0.806013 * safezoneH + safezoneY;
			w = 0.0637491 * safezoneW;
			h = 0.0340014 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class class_icon: RscPicture
		{
			idc = 1205;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.978118 * safezoneW + safezoneX;
			y = 0.806013 * safezoneH + safezoneY;
			w = 0.02125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class xp_logs: RscListbox
		{
			idc = 1500;
			x = 0.786871 * safezoneW + safezoneX;
			y = 0.857015 * safezoneH + safezoneY;
			w = 0.127498 * safezoneW;
			h = 0.136006 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 0.65 * GUI_GRID_H;
		};
		class money_text: RscStructuredText
		{
			idc = 1001;
			text = "1000"; //--- ToDo: Localize;
			x = 0.814369 * safezoneW + safezoneX;
			y = 0.704009 * safezoneH + safezoneY;
			w = 0.1637491 * safezoneW;
			h = 0.0340014 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class bank_text: RscStructuredText
		{
			idc = 1000;
			text = "1000"; //--- ToDo: Localize;
			x = 0.814369 * safezoneW + safezoneX;
			y = 0.755011 * safezoneH + safezoneY;
			w = 0.1637491 * safezoneW;
			h = 0.0340014 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class level_text: RscText
		{
			idc = 1002;
			x = 0.888432 * safezoneW + safezoneX;
			y = 0.806013 * safezoneH + safezoneY;
			w = 0.0189373 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class xp_text: RscText
		{
			idc = 1003;
			x = 0.923868 * safezoneW + safezoneX;
			y = 0.815767 * safezoneH + safezoneY;
			w = 0.0478118 * safezoneW;
			h = 0.0170007 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



		class WastelandHud_ActivityIcon:w_RscText
		{
			idc = hud_activity_icon_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.007);
			y = safeZoneY + (safeZoneH * 0.011);
			w = (0.06 * 3/4) * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class WastelandHud_ActivityTextBox:w_RscText
		{
			idc = hud_activity_textbox_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.055);
			y = safeZoneY + (safeZoneH * 0.011);
			w = 0.18 * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 1;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + safeZoneW - 0.42;
			y = safeZoneY + safeZoneH - 0.33;
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
