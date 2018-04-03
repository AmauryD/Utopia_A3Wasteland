/**
By [utopia] Amaury
**/

private _activeMissionMarkers = [];
private _map = _this select 0;

{
   if(_x select [0,14] == "mission_active") then {
   		_markerInfo = _x splitString ":";
		_missionClassName = _markerInfo select 1;
   		_activeMissionMarkers pushBack _x;
   };
} forEach allMapMarkers;

{		//mission markers
	_marker = _x;
	_control = [_map] call ug_fnc_getOrCreateMarkerControl;
	_markerInfo = _marker splitString ":";
	_missionClassName = _markerInfo select 1;
    _key = _markerInfo select 2;//don't need this
    _missionImage = _markerInfo param [3,""];

	_missionText = _missionClassName;

	_markerGroup = grpNull;
	{
		if(_x getVariable ["A3W_missionMarkerName",""] == _marker) then {
			_markerGroup = _x;
		};
	}forEach allGroups;

	_leader = leader _markerGroup;

	if(_markerGroup isEqualTo grpNull) exitWith {diag_log "drawMapMissions.sqf : group marker is Null ?"};

	_missionVehicle = _markerGroup getVariable ["A3W_missionVehicle",objNull];

    _colorRGBA = getArray (configfile >> "CfgMarkerColors" >> (getMarkerColor _marker) >> "color");
    if(_colorRGBA isEqualTypeParams ["","","",""]) then {
        _colorRGBA  = _colorRGBA apply {call compile _x};
    };
    _control ctrlSetTextColor _colorRGBA;
    _control ctrlSetScale 0.8;

	_mapPos2D = _map ctrlMapWorldToScreen (getMarkerPos _marker);
	if(ctrlMapScale _map < 0.1) then {
		_control ctrlEnable true;
	}else{
		_control ctrlEnable false;
	};
	
	if(_control getVariable ["MouseOn",false]) then {
		_control ctrlSetStructuredText parseText format["
		<img size='2' image='%3'/><t>%1</t><br/>
		<t size='0.8'><img image='\A3\ui_f\data\Map\Markers\Military\dot_CA.paa'/> %2 AI left</t><br/>
		",
		_missionText,{alive _x} count units _markerGroup,_missionImage];

		_control ctrlSetBackgroundColor [0.1,0.1,0.1,0.5];
		_mapPos2D = [(_mapPos2D select 0) - 0.025,(_mapPos2D select 1) - 0.025,0.37,0.13];
	}else{
		_control ctrlSetStructuredText parseText format["
		<img size='1' image='%2'/><t>%1</t><br/>",
		_missionText,_missionImage];

		_control ctrlSetBackgroundColor [0,0,0,0];
		_mapPos2D = [(_mapPos2D select 0) - 0.025,(_mapPos2D select 1) - 0.025,0.37,0.07];
	};

	_control ctrlSetPosition _mapPos2D;
	_control ctrlCommit 0;
	_control ctrlShow true;
}forEach _activeMissionMarkers;

{ 
	if !(_x getVariable ["busy",false]) then {
		_x ctrlShow false;
		_x ctrlEnable false;
	};
	_x setVariable ["busy",false]; 
}foreach (_map getVariable "ug_mapMarkers_availableControls"); //release controls