/*
	Author: He-Man - EpochMod.com

	Contributors:

	Description:
	Player Login

	Licence:
	Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Github:
	https://github.com/EpochModTeam/Epoch/tree/release/Sources/epoch_server/compile/epoch_player/EPOCH_server_SetUnitLoadout.sqf
*/
private ["_type"];

params ["_newPlyr","_loadout"];
				
//	_loadout params ["_primaryarr","_secondaryarr","_handgunarr","_uniformarr","_vestarr","_bpackarr","_HeadGear","_Glasses","_Rangefinderarr","_LinedItemsarr"];
_loadout params ["_primaryarr","_secondaryarr","_handgunarr","_uniformarr","_vestarr","_bpackarr","_headGear","_Glasses","_Rangefinderarr","_LinedItemsarr"];
_uniformarr params [["_uniform",""],["_uniformitems",[]]];
_vestarr params [["_vest",""],["_vestitems",[]]];
_bpackarr params [["_bpack",""],["_bpackitems",[]]];


removeAllWeapons _newPlyr;
removeAllAssignedItems _newPlyr;
removeVest _newPlyr;
removeBackpack _newPlyr;

if !(_uniform isequalto "") then {
	_newPlyr forceadduniform _uniform;
};
if !(_vest isequalto "") then {
	_newPlyr addVest _vest;
};
if !(_bpack isequalto "") then {
	_newPlyr addBackpack _bpack;
};
if !(_headGear isequalto "") then {
	_newPlyr addHeadgear _headGear;
};
if !(_Glasses isequalto "") then {
	_newPlyr addGoggles _Glasses;
};

_primaryarr params [
	"_wpClass",
	"_wpsilencer",
	"_wppointer",
	"_wpoptic",
	["_wpMag1",[]],
	["_wpMag2",[]],
	"_wpbipod"
];
_secondaryarr params [
	"_sdClass",
	"_sdsilencer",
	"_sdpointer",
	"_sdoptic",
	["_sdMag1",[]],
	["_sdMag2",[]],
	"_sdbipod"
];
_handgunarr params [
	"_hgClass",
	"_hgsilencer",
	"_hgpointer",
	"_hgoptic",
	["_hgMag1",[]],
	["_hgMag2",[]],
	"_hgbipod"
];
_Rangefinderarr params ["_binocular"];

{
	if !(_x isEqualTo []) then {
		_newPlyr addMagazine _x;
	};
}foreach [_wpMag1,_wpMag2,_sdMag1,_sdMag2,_hgMag1,_hgMag2];

if(count _primaryarr > 0) then {
	_newPlyr addWeapon _wpClass;
	{_newPlyr addPrimaryWeaponItem _x}foreach [_wpsilencer,_wppointer,_wpoptic,_wpbipod];
};

if(count _secondaryarr > 0) then {
	_newPlyr addWeapon _sdClass;
	{_newPlyr addSecondaryWeaponItem _x}foreach [_sdsilencer,_sdpointer,_sdoptic,_sdbipod];
};

if(count _handgunarr > 0) then {
	_newPlyr addWeapon _hgClass;
	{_newPlyr addHandgunItem _x}foreach [_hgsilencer,_hgpointer,_hgoptic,_hgbipod];
};

if(count _Rangefinderarr > 0) then {
	_newPlyr addWeapon _binocular;
};

{
    _newPlyr linkItem _x;
} forEach _LinedItemsarr;

{
	_x params ["_container","_items"];
	if !(isnull _container) then {
		clearitemcargoglobal _container;
		clearbackpackcargoglobal _container;
		clearmagazinecargoglobal _container;
		clearweaponcargoglobal _container;
		{
			if (count _x > 2) then {
				_container addMagazineAmmoCargo _x;
			}
			else {
				if ((_x select 0) isequaltype []) then {
					_x params ["_arr","_cnt"];
					_type = _arr deleteat 0;
					_container addWeaponcargoglobal [_type,_cnt];
					{
						if !(_x isequalto "" || _x isequalto []) then {
							if (_x isequaltype []) then {
								_container addMagazineAmmoCargo [_x select 0,1,_x select 1];
							}
							else {
								_container addItemCargoGlobal [_x,1];
							};
						};
					} foreach _arr;
				}
				else {
					_x params [["_type",""],["_cnt",1]];
					if !(_cnt isequaltype 1) then {
						_cnt = 1;
					};
					if (_type iskindof "Bag_Base") then {
						_container addBackpackCargoGlobal [_type,_cnt];
					}
					else {
						_container addItemCargoGlobal [_type,_cnt];
					};
				};
			};
		} foreach _items;
	};
} foreach [
	[Uniformcontainer _newPlyr, _uniformitems],
	[Vestcontainer _newPlyr, _vestitems],
	[BackpackContainer _newPlyr, _bpackitems]
];
true