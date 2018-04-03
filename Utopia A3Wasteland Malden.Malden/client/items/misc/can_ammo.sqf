// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: can_repair.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can repair the nearest vehicle
//@file Argument: [_vehicle] the vehicle to test
//@file Argument: [] automatically find the nearest vehicle

#define ERR_NO_VEHICLE "You are not close enough to a vehicle that needs rearming"
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_DESTROYED "The vehicle is too damaged to rearm"
#define ERR_NO_AMMO_KITS "You have no ammo kits"
#define ITEM_COUNT(ITEMID) ITEMID call mf_inventory_count

private ["_vehicle", "_hitPoints", "_error"];
_vehicle = objNull;
if (count _this == 0) then { // if array empty
	_vehicle = call mf_repair_nearest_vehicle;
} else {
	_vehicle = _this select 0;
};

_hitPoints = (typeOf _vehicle) call getHitPoints;

_error = "";
switch (true) do {
	case (isNull _vehicle): {_error = ERR_NO_VEHICLE};
	case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (player distance _vehicle > (sizeOf typeOf _vehicle / 3) max 2): {_error = ERR_NO_VEHICLE};
	case (!alive _vehicle): {_error = ERR_DESTROYED};
	case (ITEM_COUNT(MF_ITEMS_AMMO_KIT) <= 0): {_error = ERR_NO_AMMO_KITS};
};
_error;
