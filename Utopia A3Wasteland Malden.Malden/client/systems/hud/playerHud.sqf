// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, [KoS] Bewilderbeest
//	@file Created: 11/09/2012 04:23
//	@file Args:

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603

scriptName "playerHud";

disableSerialization;
private ["_lastHealthReading", "_lastTerritoryName", "_lastTerritoryDescriptiveName", "_territoryCaptureIcon", "_activityIconOrigPos", "_activityTextboxOrigPos", "_dispUnitInfo", "_topLeftBox", "_topLeftBoxPos"];

_lastHealthReading = 100; // Used to flash the health reading when it changes

// Needed for territory system
_lastTerritoryName = "";
_lastTerritoryDescriptiveName = "";

_displayTerritoryActivity =
{
	private ['_boldFont', '_descriptiveName', '_configEntry', '_territoryActionText', '_territoryAction', '_seconds', '_minutes'];

	_boldFont = "PuristaBold";

	_descriptiveName = "Unknown territory";

	// Expensive lookup for the HUD, so cache it
	if (_territoryName != _lastTerritoryName) then
	{
		// Look up the descriptive name of this territory
		_configEntry = [["config_territory_markers", []] call getPublicVar, { _x select 0 == _territoryName }] call BIS_fnc_conditionalSelect;
		_descriptiveName = (_configEntry select 0) select 1;
		_lastTerritoryName = _territoryName;
		_lastTerritoryDescriptiveName = _descriptiveName;
	}
	else
	{
		_descriptiveName = _lastTerritoryDescriptiveName;
	};

	_territoryActionText = "";
	_territoryAction = _territoryActivity select 0;

	switch (_territoryAction) do
	{
		case "CAPTURE":
		{
			_territoryCaptureCountdown = round (_territoryActivity select 1);

			if (_territoryCaptureCountdown > 60) then
			{
				_seconds = _territoryCaptureCountdown % 60;
				_territoryCaptureCountdown = (_territoryCaptureCountdown - _seconds) / 60;
				_minutes = _territoryCaptureCountdown % 60;

				_territoryActionText = format["Capture du territoire dans environ <t font='%1'>%2 minutes</t>", _boldFont, _minutes + 1];
			}
			else
			{
				if (_territoryCaptureCountdown < 5) then
				{
					_territoryActionText = "Transfer du territoire en cours...";
				}
				else
				{
					_territoryActionText = format["Capture du territoire dans <t font='%1'>%2 secondes</t>", _boldFont, _territoryCaptureCountdown];
				};
			};
		};
		case "BLOCKEDATTACKER": { _territoryActionText = "Capture du territoire bloquée" };
		case "BLOCKEDDEFENDER": { _territoryActionText = "Territoire attaqué" };
		case "RESET":           { _territoryActionText = "Capture du territoire commencée" };
	};

	_activityMessage = format ["Lieu: <t font='%1'>%2</t><br/>%3", _boldFont, _descriptiveName, _territoryActionText];
	_topLeftIconText = format ["<img size='%1' image='territory\client\icons\territory_cap_white.paa'/>", 3 * (0.55 / (getResolution select 5))];

	[_topLeftIconText, _activityMessage]
};

_survivalSystem = ["A3W_survivalSystem"] call isConfigOn;
_unlimitedStamina = ["A3W_unlimitedStamina"] call isConfigOn;
_atmEnabled = ["A3W_atmEnabled"] call isConfigOn;
_disableUavFeed = ["A3W_disableUavFeed"] call isConfigOn;

private ["_mapCtrls", "_mapCtrl"];
_ui = displayNull;

while {true} do
{
	if (isNull _ui) then
	{
		1000 cutRsc ["WastelandHud","PLAIN",-1,false];
		_ui = uiNamespace getVariable ["WastelandHud", displayNull];
	};

	_health_icon_ctrl = _ui displayCtrl 1200;
	_health_bar_ctrl = _ui displayCtrl 2201;

	_food_icon_ctrl = _ui displayCtrl 1201;
	_food_bar_ctrl = _ui displayCtrl 2202;

	_water_icon_ctrl = _ui displayCtrl 1202;
	_water_bar_ctrl = _ui displayCtrl 2203;

	_money_icon_ctrl = _ui displayCtrl 1203;
	_money_text_ctrl = _ui displayCtrl 1001;

	_bank_icon_ctrl = _ui displayCtrl 1204;
	_bank_text_ctrl = _ui displayCtrl 1000;

	_rank_icon_ctrl =  _ui displayCtrl 1205;
	_rank_bar_ctrl = _ui displayCtrl 2206;

	_rank_xp_ctrl = _ui displayCtrl 1003;
	_rank_level_ctrl = _ui displayCtrl 1002;

	_hudVehicle = _ui displayCtrl 1100;

	_hudActivityIcon = _ui displayCtrl hud_activity_icon_idc;
	_hudActivityTextbox = _ui displayCtrl hud_activity_textbox_idc;

	_healthTextColor = [1,1,1,1];

	_health = ((1 - damage player) * 100) max 0;
	_health = if (_health > 1) then { floor _health } else { ceil _health };

	if (_health != _lastHealthReading) then
	{
		// Health change. Up or down?
		if (_health < _lastHealthReading) then
		{
			// Gone down. Red flash
			_healthTextColor = [1, 0.1, 0.1,1];
		}
		else
		{
			// Gone up. Green flash
			_healthTextColor = [0.1,1,0.1,1];
			if (!isNil "BIS_HitCC" && {ppEffectEnabled BIS_HitCC}) then { BIS_HitCC ppEffectEnable false }; // fix for permanent red borders due to fire damage
		};
	};

	_lastHealthReading = _health;


	_maxLvlXP = [player_level] call lvl_getRequiredXP;

	_health_icon_ctrl ctrlSetText "client\icons\health.paa";
	_health_icon_ctrl ctrlSetTextColor _healthTextColor;
	_bank_icon_ctrl ctrlSetText "client\icons\suatmm_icon.paa";
	_water_icon_ctrl ctrlSetText "client\icons\water.paa";
	_money_icon_ctrl ctrlSetText "client\icons\money.paa";
	_food_icon_ctrl  ctrlSetText "client\icons\food.paa";

	_imgData = [player_level] call lvl_getLevelImage;
	_img = _imgData select 0;
	_imgcolor = _imgData select 1;
	
	_rank_icon_ctrl ctrlSetText _img;	
	_rank_icon_ctrl ctrlSetTextColor _imgcolor;

	_rank_bar_ctrl ctrlSetTextColor [0.25,0.51,0.96,1];
	_water_bar_ctrl ctrlSetTextColor [0.25,0.51,0.96,1];
	_food_bar_ctrl ctrlSetTextColor [0.25,0.51,0.96,1];
	_health_bar_ctrl ctrlSetTextColor [0.25,0.51,0.96,1];
	

	_rank_bar_ctrl progressSetPosition (player_xp / _maxLvlXP);
	_water_bar_ctrl progressSetPosition (thirstLevel / 100);
	_food_bar_ctrl progressSetPosition (hungerLevel / 100);
	_health_bar_ctrl progressSetPosition (1 - getDammage player);

	_rank_xp_ctrl ctrlSetStructuredText parsetext format ["<t size='0.65'>%1 / %2</t>",player_xp,_maxLvlXP];
	_rank_level_ctrl ctrlSetText str player_level;
	_bank_text_ctrl ctrlSetStructuredText parseText format["<t align='right'>%1</t>",[(player getVariable ["bMoney",0])] call fn_numbersText];
	_money_text_ctrl ctrlSetStructuredText parseText format["<t align='right'>%1</t>",[(player getVariable ["cMoney",0])] call fn_numbersText];


	_yOffsetVitals = 0.857015;
	_tempString = "";
	_yOffset = _yOffsetVitals + 0.04;



	if (isStreamFriendlyUIEnabled) then
	{
		_tempString = format ["<t color='#CCCCCCCC'>A3Wasteland %1<br/>a3wasteland.com</t>", getText (configFile >> "CfgWorlds" >> worldName >> "description")];
		_yOffset = _yOffset + 0.08;
	}
	else
	{
		if (player != vehicle player) then
		{
			_vehicle = vehicle player;

			{
				if (alive _x) then
				{
					_icon = switch (true) do
					{
						case (driver _vehicle == _x): { "client\icons\driver.paa" };
						case (gunner _vehicle == _x): { "client\icons\gunner.paa" };
						default                       { "client\icons\cargo.paa" };
					};

					_tempString = format ["%1 %2 <img image='%3'/><br/>", _tempString, name _x, _icon];
					_yOffset = _yOffset + 0.04;
				};
			} forEach crew _vehicle;
		};
	};

	_hudVehiclePos = ctrlPosition _hudVehicle;
	_hudVehiclePos set [1, safeZoneY + safeZoneH - _yOffset]; // x
	_hudVehiclePos set [3, _yOffset - _yOffsetVitals]; // h

	_hudVehicle ctrlSetStructuredText parseText _tempString;
	_hudVehicle ctrlSetPosition _hudVehiclePos;
	_hudVehicle ctrlCommit 0;

	// Territory system! Uses two new boxes in the top left of the HUD. We
	// can extend the system later to encompas other activities
	//
	// This does nothing if the system is not enabled, as TERRITORY_ACTIVITY is never set
	_activityIconStr = "";
	_activityMessage = "";
	_activityBackgroundAlpha = 0;

	// Activity does not show when the map or Esc menu is open
	if (!visibleMap && isNull findDisplay 49) then
	{
		// Determine activity. Currently this is territory cap only
		_territoryActivity = player getVariable ["TERRITORY_ACTIVITY", []];
		_territoryName = player getVariable ["TERRITORY_OCCUPATION", ""];

		if (count _territoryActivity > 0 && _territoryName != "") then
		{
			_activityDetails = [] call _displayTerritoryActivity;

			_activityIconStr = _activityDetails select 0;
			_activityMessage = _activityDetails select 1;
		};

		// Show the UI if we have activity
		if (_activityIconStr != "" && _activityMessage != "") then
		{
			if (isNil "_activityIconOrigPos" && isNil "_activityTextboxOrigPos") then
			{
				_activityIconOrigPos = ctrlPosition _hudActivityIcon;
				_activityTextboxOrigPos = ctrlPosition _hudActivityTextbox;
			};

			_activityBackgroundAlpha = 0.4;

			_dispUnitInfo = uiNamespace getVariable ["RscUnitInfo", displayNull];
			_topLeftBox = _dispUnitInfo displayCtrl getNumber (configfile >> "RscInGameUI" >> "RscUnitInfo" >> "CA_BackgroundVehicle" >> "idc"); // idc = 1200

			// If top left vehicle info box is displayed, move activity controls a bit to the right
			if (ctrlShown _topLeftBox && {[_topLeftBox, _activityIconOrigPos] call fn_ctrlOverlapCheck || [_topLeftBox, _activityTextboxOrigPos] call fn_ctrlOverlapCheck}) then
			{
				_topLeftBoxPos = ctrlPosition _topLeftBox;

				_hudActivityIcon ctrlSetPosition
				[
					(_topLeftBoxPos select 0) + (_topLeftBoxPos select 2) + (_activityIconOrigPos select 0) - safezoneX,
					_activityIconOrigPos select 1,
					_activityIconOrigPos select 2,
					_activityIconOrigPos select 3
				];

				_hudActivityTextbox ctrlSetPosition
				[
					(_topLeftBoxPos select 0) + (_topLeftBoxPos select 2) + (_activityTextboxOrigPos select 0) - safezoneX,
					_activityTextboxOrigPos select 1,
					_activityTextboxOrigPos select 2,
					_activityTextboxOrigPos select 3
				];
			}
			else
			{
				_hudActivityIcon ctrlSetPosition _activityIconOrigPos;
				_hudActivityTextbox ctrlSetPosition _activityTextboxOrigPos;
			};
		};
	};

	_hudActivityIcon ctrlSetBackgroundColor [0, 0, 0, _activityBackgroundAlpha];
	_hudActivityIcon ctrlSetStructuredText parseText _activityIconStr;
	_hudActivityIcon ctrlCommit 0;

	_hudActivityTextbox ctrlSetBackgroundColor [0, 0, 0, _activityBackgroundAlpha];
	_hudActivityTextbox ctrlSetStructuredText parseText _activityMessage;
	_hudActivityTextbox ctrlCommit 0;

	// Remove unrealistic blur effects
	if (!isNil "BIS_fnc_feedback_damageBlur" && {ppEffectCommitted BIS_fnc_feedback_damageBlur}) then { ppEffectDestroy BIS_fnc_feedback_damageBlur };
	if (!isNil "BIS_fnc_feedback_fatigueBlur" && {ppEffectCommitted BIS_fnc_feedback_fatigueBlur}) then { ppEffectDestroy BIS_fnc_feedback_fatigueBlur };

	// Voice monitoring
	[false] call fn_voiceChatControl;

	if (isNil "_mapCtrls") then
	{
		_mapCtrls =
		[
			[{(uiNamespace getVariable ["RscDisplayAVTerminal", displayNull]) displayCtrl 51}, controlNull]/*, // UAV Terminal
			[{artilleryComputerDisplayGoesHere displayCtrl 500}, controlNull]*/  // Artillery computer - cannot be enabled until this issue is resolved: http://feedback.arma3.com/view.php?id=21546
		];
	};

	if (!isNil "A3W_mapDraw_eventCode") then
	{
		// Add custom markers and lines to misc map controls
		{
			if (isNull (_x select 1)) then
			{
				_mapCtrl = call (_x select 0);

				if (!isNull _mapCtrl) then
				{
					_mapCtrl ctrlAddEventHandler ["Draw", A3W_mapDraw_eventCode];
					_x set [1, _mapCtrl];
				};
			};
		} forEach _mapCtrls;
	};

	// Improve revealing and aimlocking of targetted vehicles
	{
		if (!isNull _x) then
		{
			if ((group player) knowsAbout _x < 4) then
			{
				(group player) reveal [_x, 4];
			};
		};
	} forEach [cursorTarget, cursorObject];

	if (_disableUavFeed && shownUavFeed) then
	{
		showUavFeed false;
	};

	// override no-grass exploits
	if (getTerrainGrid > 10) then
	{
		setTerrainGrid 10;
	};

	// fix for disappearing chat
	if (!shownChat && isNull findDisplay 49) then
	{
		showChat true;
	};

	uiSleep 1;
};
