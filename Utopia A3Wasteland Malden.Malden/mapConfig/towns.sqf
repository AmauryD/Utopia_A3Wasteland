// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: towns.sqf
//	@file Author: AgentRev, JoSchaap
// modified by [utopia] Amaury

/*
[
	["Town_1", 200, "Air Station Mike-28"],
	["Town_2", 100, "Agios Loannis"],
	["Town_3", 100, "Agios Cephas"],
	["Town_4", 200, "Girna"],
	["Town_5", 200, "Camp Tempest"],
	["Town_6", 300, "Stratis Airbase Town"],
	["Town_7", 250, "Stratis Airbase Runway"],
	["Town_8", 350, "Agia Marina"],
	["Town_9", 250, "Kill Farm"],
	["Town_10", 200, "Camp Rogain"],
	["Town_11", 230, "Kamino Firing Range"],
	["Town_12", 240, "Camp Maxwell"],
	["Town_13", 150, "ol-Kamino"],
	//["Town_14", 15, "Isla Pythos"], // who the heck thought a town on an island was a good idea!?
	["Town_15", 100, "Baldy Barracks"],
	["Town_16", 175, "ol-Keiros"],
	["Town_17", 175, "Tsoukalia"],
	["Town_18", 100, "LZ Connor"],
	["Town_19", 180, "Playa-del-Stragos"],
	["Town_20", 250, "ol-Jay"]
]
*/

if(isServer) then {
	private _i = 0;

	{
		createMarker [format["Town_%1",_i],locationPosition _x];
		_i = _i + 1;
	}foreach (nearestLocations [[0,0,0], ["NameCityCapital"], worldSize]);

	{
		createMarker [format["Town_%1",_i],locationPosition _x];
		_i = _i + 1;
	}foreach (nearestLocations [[0,0,0], ["NameCity"], worldSize]);

	{
		createMarker [format["Town_%1",_i],locationPosition _x];
		_i = _i + 1;
	}foreach (nearestLocations [[0,0,0], ["NameVillage"], worldSize]);
};


private _array = [];

{
	_array pushBack [format["Town_%1",count _array],275,text _x];
}foreach (nearestLocations [[0,0,0], ["NameCityCapital"], worldSize]);

{
	_array pushBack [format["Town_%1",count _array],250,text _x];
}foreach (nearestLocations [[0,0,0], ["NameCity"], worldSize]);

{
	_array pushBack [format["Town_%1",count _array],150,text _x];
}foreach (nearestLocations [[0,0,0], ["NameVillage"], worldSize]);

_array