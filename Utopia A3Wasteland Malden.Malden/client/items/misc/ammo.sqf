// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: repair.sqf
//@file Author: MercyfulFate
//@file Created: 23/7/2013 16:00
//@file Description: Repair the nearest Vehicle

#define DURATION 30
#define REPAIR_RANGE 6;
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_VEHICLE "You are not close enough to a vehicle that needs rearming"
#define ERR_IN_VEHICLE "Rearming Failed! You can't do that in a vehicle"
#define ERR_FULL_AMMO "Rearming Failed! The vehicle is already rearmed"
#define ERR_DESTROYED "The vehicle is too damaged to rearm"
#define ERR_TOO_FAR_AWAY "Rearming failed! You moved too far away from the vehicle"
#define ERR_CANCELLED "Rearming cancelled!"

private ["_vehicle", "_checks", "_success"];
_vehicle = call mf_repair_nearest_vehicle;

_checks = {
	private ["_progress","_failed", "_text"];
	_progress = _this select 0;
	_vehicle = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _vehicle > (sizeOf typeOf _vehicle / 3) max 2): {_text = ERR_TOO_FAR_AWAY};
		case (!alive _vehicle): {_text = ERR_DESTROYED};
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default {
			_text = format["Rearming %1%2 Complete", round(100 * _progress), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, [_vehicle]] call a3w_actions_start;

if (_success) then {
	[netId _vehicle] remoteExec ["mf_remote_rearm", _vehicle];
	["Rearm complete!", 5] call mf_notify_client;
};
_success;
