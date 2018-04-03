// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: territories.sqf
//	@file Author: AgentRev, Bewilderbeest

// Territory system definitions. See territory/README.md for more details.
//
// 1 - Territory marker name. Must begin with 'TERRITORY_'
// 2 - Descriptive name
// 3 - Monetary value
// 4 - Territory category, currently unused. See territory/README.md for details.

[
	["TERRITORY_AIRPORT_NORTH", "North Malden Airbase", 750, "AIRBASE"],
	["TERRITORY_AIRPORT_SOUTH", "South Malden Airbase", 750, "AIRBASE"],
	["TERRITORY_RADIO_STATION", "Radio Tower", 400, "MILITARY"],

	["TERRITORY_PORT_EAST", "East Of Le Port", 250, "MILITARY"],
	["TERRITORY_PORT_WEST", "West Of Le Port", 250, "MILITARY"],
	["TERRITORY_SAINT_MARTIN" , "Saint Martin" , 200 ,"CIVILIAN"],
	["TERRITORY_SMALL_HARBOUR" , "Small Harbour" ,150,"CIVILIAN"],
	["TERRITORY_AIRPORT_MORAY","Moray Airport",500,"AIRBASE"],
	["TERRITORY_MIL_BASE","Military Outpost",300,"MILITARY"],
	["TERRITORY_LIGHTHOUSE","Lighthouse",150,"CIVILIAN"],

	["TERRITORY_FARM","Some random farm",100,"FARM"]
]