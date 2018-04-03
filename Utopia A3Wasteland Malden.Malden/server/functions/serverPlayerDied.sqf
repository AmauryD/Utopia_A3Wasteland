// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: serverPlayerDied.sqf
//	@file Author: [404] Pulse, AgentRev
//	@file Created: 20/11/2012 05:19

if (!isServer) exitWith {};

params [	//TODO : manage all this 
	["_unit",objNull,[objNull]],
	"",
	"",
	["_deathCause",[],[[]]],
	["_Uside",sideUnknown],
	["_Ubounty",0],
	["_Uplayer",objNull]
]; // _unit, _killer, _presumedKiller, _deathCause

_unit call A3W_fnc_setItemCleanup;
_unit setVariable ["A3W_deathCause_local", _deathCause];

private _killer = (_this select [0,3]) call A3W_fnc_registerKillScore;

_unit setVariable ["killer",_killer];

// Remove player save on death
if (isPlayer _unit && {["A3W_playerSaving"] call isConfigOn}) then
{
	(getPlayerUID _unit) call fn_deletePlayerSave;
};

private _backpack = unitBackpack _unit;

if (!isNull _backpack) then
{
	_backpack call A3W_fnc_setItemCleanup;
};

if !(isNull _Uplayer) then {
	_unit setVariable ["ug_name",name _Uplayer,true]; // for corpse info and burry
};

// Eject corpse from vehicle once stopped
if (vehicle _unit != _unit) then
{
	if (local _unit) then
	{
		_unit spawn fn_ejectCorpse;
	}
	else
	{
		_unit remoteExec ["fn_ejectCorpse", _unit];
	};
};

if(isPlayer _killer && isPlayer _Uplayer) then {
	if !([_Uplayer,_killer] call ug_fnc_isTeamKill) then {
		if(_Ubounty > 0) then {
			_Uplayer setVariable ["bounty",0,true];
			_killer setVariable ["bmoney",(_killer getVariable ["bmoney",0]) + _Ubounty,true];
			[format ["You've earned a bounty of %1$ from the kill of %2",_Ubounty,name _Uplayer]] remoteExecCall ["ug_fnc_displayMessage",_killer];
		};
	};
};


if(isPlayer _killer && !(_killer == _unit)) then {
	if !(isPlayer _unit) then { //IA killed
		_reward = _unit getVariable ["xp",100];
		{
			if(_x isEqualTo _killer) then {
				[_reward,1] remoteExec ["lvl_addXp",_killer]; 
			}else{
				[floor (_reward / (count units group _killer)),4] remoteExec ["lvl_addXp",_x]; 
			};
		}forEach units group _killer;
	};
	if (isPlayer _unit) then { //Player killed
		_reward = 1000;
		if !(_Uside isEqualTo side _killer) then {
			{
				if(_x isEqualTo _killer) then {
					[_reward,0] remoteExec ["lvl_addXp",_killer]; 
				}else{
					[floor (_reward / (count units group _killer)),4] remoteExec ["lvl_addXp",_x]; 
				};
			}forEach units group _killer;
			[250,0] remoteExec ["lvl_removeXp",_Uplayer]; 
		}else{
			if(side _killer isEqualTo independent) then {
				{
					if(_x isEqualTo _killer) then {
						[_reward,0] remoteExec ["lvl_addXp",_killer]; 
					}else{
						[floor (_reward / (count units group _killer)),4] remoteExec ["lvl_addXp",_x]; 
					};
				}forEach units group _killer;
			}else{
				[500,3] remoteExec ["lvl_removeXp",_killer]; 
			};
		};
	};
}else{
	[100,2] remoteExec ["lvl_removeXP",_unit];
};


//if !(["G_Diving", goggles _unit] call fn_startsWith) then { removeGoggles _unit };
