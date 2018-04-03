class choseKeyMenu {
	idd = 34564;
	movingEnable = 0;
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Rasta Populos, v1.063, #Limato)
		////////////////////////////////////////////////////////

		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0.6};
			x = 0.340643 * safezoneW + safezoneX;
			y = 0.346994 * safezoneH + safezoneY;
			w = 0.334649 * safezoneW;
			h = 0.23801 * safezoneH;
		};
		class cancel_btn: w_RscButton
		{
			idc = 1600;
			text = "Annuler"; //--- ToDo: Localize;
			x = 0.356579 * safezoneW + safezoneX;
			y = 0.517001 * safezoneH + safezoneY;
			w = 0.143421 * safezoneW;
			h = 0.0510022 * safezoneH;
		};
		class ok_btn: w_RscButton
		{
			idc = 1601;
			text = "OK"; //--- ToDo: Localize;
			x = 0.515936 * safezoneW + safezoneX;
			y = 0.517001 * safezoneH + safezoneY;
			w = 0.143421 * safezoneW;
			h = 0.0510022 * safezoneH;
		};
		class header: w_RscText
		{
			idc = 1000;
			text = "Choisissez une touche"; //--- ToDo: Localize;
			x = 0.356579 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.310746 * safezoneW;
			h = 0.0680029 * safezoneH;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class key_txt: w_RscText
		{
			idc = 1001;
			text = "<>"; //--- ToDo: Localize;
			x = 0.484064 * safezoneW + safezoneX;
			y = 0.448998 * safezoneH + safezoneY;
			w = 0.0557749 * safezoneW;
			h = 0.0510022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};