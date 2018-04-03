/**
	@creator : [utopia] Amaury
	@creation: 12/08/17
	@description : script displays , just want to try because i'm lazy
	TODO : improve performance
**/

disableSerialization;

private "_displayType";

private _displayClassName = param [0,"",[""]];
private _type = param [1,"DISPLAY",[[],""]];

if !([_displayClassName] call ED_fnc_isRegistered) exitWith {displayNull};

private _typeParams = [];

if(_type isEqualType []) then {
	_typeParams = _type param [1,[],[[]]];
	_displayType = _type param [0,"DISPLAY",[""]];
}else{
	_displayType = _type;
};	

_entry = missionNamespace getVariable format ["ED_menu_%1",_displayClassName];

if !(_entry isEqualType {}) exitWith {hintSilent "UI save system has changed , please restart your game"};
	
_entry = call _entry;

private _inputGrid = _entry select 1;
private _usedCtrls = _entry select 2;

private _precisionW = _inputGrid param [0,12];
private _precisionH = _inputGrid param [1,12];


private _ED_main_display = switch (_displayType) do { 
	case "DISPLAY" : { 
		(_typeParams param [0,findDisplay 46]) createDisplay "RscDisplayEmptyUG"; 
	}; 
	case "DIALOG" : { 
		createDialog "RscDisplayEmptyUG";
		findDisplay 127001; 
	}; 
	case "RSC" : {  
		(_displayClassName call BIS_fnc_rscLayer) cutRsc [
			_typeParams param [0,"RscTitleDisplayEmptyUG"],
			_typeParams param [1,"PLAIN"],
			_typeParams param [2,0],
			_typeParams param [3,true]
		];
		uiNamespace getVariable "RscTitleDisplayEmptyUG"; 
	}; 
};

if(isNil "ED_openedDisplays") then {
	ED_openedDisplays = [];
};

_ED_main_display setVariable ["ED_name",_displayClassName];
[ED_openedDisplays,_displayClassName,_ED_main_display] call bis_fnc_setToPairs;

_ED_main_display displayAddEventHandler ["Unload",{
	[ED_openedDisplays,(_this select 0) getVariable "ED_name"] call BIS_fnc_removeFromPairs;
}];

{
	_ctrlName = _x select 0;
	_coords = _x select 1;
	_ctrlClassName = _x param [2,""];
	_ctrlIDC = _x param [3,-1];
	_specialParams = _x param [4,[]];

	_xa = _coords select 1; //inverteeeeeeeeeeeeeeeeeeeeeeed
	_ya = _coords select 0;
	_W = _coords param [2,1];
	_H = _coords param [3,1];

	_ctrl = _ED_main_display ctrlCreate [_ctrlClassName,_ctrlIDC];
	_ctrl setVariable ["ED_name",_ctrlName];

	_ctrl ctrlSetPosition [
		safezoneX + ((safezoneW / _precisionW) * _ya),
		safezoneY + ((safezoneH / _precisionH) * _xa),
		(safezoneW / _precisionW) * _W,
		(safezoneH / _precisionH) * _H
	];
	_ctrl ctrlCommit 0;

	if (count _specialParams > 0) then {
		{
			_val = _x select 1;
			switch (tolower (_x select 0)) do { 
				case "text" : { 
					if(tolower _ctrlClassName find "structuredtext" != -1) then {
						_ctrl ctrlSetStructuredText parseText _val
					}else{
						_ctrl ctrlSetText _val
					};
				}; 
				case "backgroundcolor" : { _ctrl ctrlSetBackgroundColor _val }; 
				case "tooltip" : { _ctrl ctrlSetTooltip _val };
				case "textcolor" : {_ctrl ctrlSetTextColor _val };
				case "buttonclick": { _ctrl ctrlAddEventHandler ["ButtonClick",_val]};
				case "lbdblclick": { _ctrl ctrlAddEventHandler ["LBDblClick",_val]};
				case "keydown": { _ctrl ctrlAddEventHandler ["KeyDown",_val]};
				case "videostopped": { _ctrl ctrlAddEventHandler ["VideoStopped",_val]};
				case "lbselchanged": { _ctrl ctrlAddEventHandler ["LBSelChanged",_val]};
				case "data" : { _ctrl setVariable ["ED_data",_val] };
				case "enabled" : { _ctrl ctrlEnable _val	};
				case "show" : { _ctrl ctrlShow _val };
			};
		}foreach _specialParams;
	};

	_ctrl ctrlCommit 0;
	_ED_main_display setVariable [_ctrlName,_ctrl];
}foreach _usedCtrls;

_ED_main_display
