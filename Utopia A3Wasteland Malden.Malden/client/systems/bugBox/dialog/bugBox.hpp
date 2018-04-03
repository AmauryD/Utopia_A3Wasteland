


class bugBox {
	idd = 666; //evilBox
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by riril, v1.063, #Fynyti)
		////////////////////////////////////////////////////////

		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.383125 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.456875 * safezoneW;
			h = 0.476 * safezoneH;
		};
		class bug_box_title: RscText
		{
			idc = 1000;
			text = "BUG BOX"; //--- ToDo: Localize;
			x = 0.404375 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.40375 * safezoneW;
			h = 0.051 * safezoneH;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class tickets_list: RscListbox
		{
			idc = 1500;
			x = 0.404375 * safezoneW + safezoneX;
			y = 0.381 * safezoneH + safezoneY;
			w = 0.414375 * safezoneW;
			h = 0.289 * safezoneH;
		};
		class tickets_stats: RscStructuredText
		{
			idc = 1100;
			text = "Vos tickets : % | CorrigÃ©s : % | En attente : % | RefusÃ©s : % "; //--- ToDo: Localize;
			x = 0.404375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.414375 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 0.13875 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.23375 * safezoneW;
			h = 0.476 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Write a ticket"; //--- ToDo: Localize;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.228 * safezoneH + safezoneY;
			w = 0.2125 * safezoneW;
			h = 0.051 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class ticket_title: RscEdit
		{
			idc = 1400;
			x = 0.213125 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.138125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class ticket_text: RscEdit
		{
			idc = 1401;
			x = 0.16 * safezoneW + safezoneX;
			y = 0.347 * safezoneH + safezoneY;
			w = 0.19125 * safezoneW;
			h = 0.272 * safezoneH;
			text = "";
            style = 16;
            lineSpacing = 1;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Title : "; //--- ToDo: Localize;
			x = 0.16 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.0425 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 0.13875 * safezoneW + safezoneX;
			y = 0.704 * safezoneH + safezoneY;
			w = 0.70125 * safezoneW;
			h = 0.119 * safezoneH;
		};
		class Infos_txt: RscStructuredText
		{
			idc = 1101;
			text = "You can report bugs here or suggestions by sending a ticket. SPAM/ABUSE = BAN"; //--- ToDo: Localize;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.721 * safezoneH + safezoneY;
			w = 0.68 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class send_ticket_btn: RscButton
		{
			idc = 1600;
			text = "Send Ticket"; //--- ToDo: Localize;
			x = 0.16 * safezoneW + safezoneX;
			y = 0.636 * safezoneH + safezoneY;
			w = 0.19125 * safezoneW;
			h = 0.034 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};