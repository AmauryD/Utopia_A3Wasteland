// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

diag_log "WASTELAND SERVER - Initializing Server Compile";

//Factory Compiles
_path = "server\missions\factoryMethods";
attemptCompileMissions = [_path, "attemptCompileMissions.sqf"] call mf_compile;
checkMissionVehicleLock = [_path, "checkMissionVehicleLock.sqf"] call mf_compile;
cleanLocationObjects = [_path, "cleanLocationObjects.sqf"] call mf_compile;
createCustomGroup = [_path, "createUnits\customGroup.sqf"] call mf_compile;
createCustomGroup2 = [_path, "createUnits\customGroup2.sqf"] call mf_compile;
createLargeDivers = [_path, "createUnits\largeDivers.sqf"] call mf_compile;
createMissionLocation = [_path, "createMissionLocation.sqf"] call mf_compile;
createMissionMarker = [_path, "createMissionMarker.sqf"] call mf_compile;
createMissionVehicle = [_path, "createMissionVehicle.sqf"] call mf_compile;
createMissionVehicle2 = [_path, "createMissionVehicle2.sqf"] call mf_compile;
createOutpost = [_path, "createOutpost.sqf"] call mf_compile;
createRandomSoldier = [_path, "createUnits\createRandomSoldier.sqf"] call mf_compile;
createRandomSoldierC = [_path, "createUnits\createRandomSoldierC.sqf"] call mf_compile;
createSmallDivers = [_path, "createUnits\smallDivers.sqf"] call mf_compile;
generateMissionWeights = [_path, "generateMissionWeights.sqf"] call mf_compile;
mission_VehicleCapture = "server\missions\mainMissions\mission_VehicleCapture.sqf" call mf_compile;
missionHint = [_path, "missionHint.sqf"] call mf_compile;
moveIntoBuildings = [_path, "moveIntoBuildings.sqf"] call mf_compile;
removeDisabledMissions = [_path, "removeDisabledMissions.sqf"] call mf_compile;
setLocationObjects = [_path, "setLocationObjects.sqf"] call mf_compile;
setLocationState = [_path, "setLocationState.sqf"] call mf_compile;
setMissionState = [_path, "setMissionState.sqf"] call mf_compile;
createSpecialForces = [_path,"createUnits\createSpecialForces.sqf"] call mf_compile;
ug_fnc_randomLoadout = [_path,"createUnits\fn_randomLoadout.sqf"] call mf_compile;


fn_serverLog = ["addons\simpleAC","fn_serverLog.sqf"] call mf_compile;

_path = "server\functions";

// Bug Box
fn_debugBoxRequest = ["server\bugBox", "fn_debugBoxRequest.sqf"] call mf_compile;
fn_debugBoxAddTicket = ["server\bugBox", "fn_debugBoxAddTicket.sqf"] call mf_compile;

ug_fnc_createDrop = ["server\supplyDrop\fn_createDrop.sqf",-2] call ug_fnc_compileRemote;

ug_fnc_dbSafeVehicleDelete = ["server\database\fn_safeDeleteVehicle.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_dbSafeVehicleSave = ["server\database\fn_safeSaveVehicle.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_dbSafeObjectSave = ["server\database\fn_safeObjectSave.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_dbSafeObjectDelete = ["server\database\fn_safeObjectDelete.sqf",-2] call ug_fnc_compileRemote;

ug_fnc_msgBoxDeleteMessage = ["server\messageBox\fn_deleteMessage.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_msgBoxSendMessages = ["server\messageBox\fn_sendMessages.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_msgBoxnewMessage = ["server\messageBox\fn_newMessage.sqf",-2] call ug_fnc_compileRemote;


ug_fnc_groupDisband = ["server\permanentGroup\fn_groupDisband.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupRequestData = ["server\permanentGroup\fn_groupRequestData.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupCreate = ["server\permanentGroup\fn_groupCreate.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupLeave = ["server\permanentGroup\fn_groupLeave.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupInvitePlayer = ["server\permanentGroup\fn_groupInvitePlayer.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupJoinPlayer = ["server\permanentGroup\fn_groupJoinPlayer.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupKickPlayer = ["server\permanentGroup\fn_groupKickPlayer.sqf",-2] call ug_fnc_compileRemote;
ug_fnc_groupNewLeader = ["server\permanentGroup\fn_groupNewLeader.sqf"] call ug_fnc_compileRemote;
ug_fnc_groupPlayerConnected = "server\permanentGroup\fn_groupPlayerConnected.sqf" call mf_compile;
ug_fnc_groupFind = "server\permanentGroup\fn_groupFind.sqf" call mf_compile;
ug_fnc_groupsFind = "server\permanentGroup\fn_groupsFind.sqf" call mf_compile;
ug_fnc_groupFindNewLeader = "server\permanentGroup\fn_groupFindNewLeader.sqf" call mf_compile;

//hall oF Fame
fn_requestHallOfFameData = ["server\hallOfFame", "fn_requestHallOfFameData.sqf"] call mf_compile;


ug_fnc_remoteOwnerToObject = [_path,"fn_remoteOwnerToObject.sqf"] call mf_compile;

//Function Compiles

fn_escapeSQLChars = [_path,"fn_escapeSQLChars.sqf"] call mf_compile;
fn_entityKilled = [_path, "fn_entityKilled.sqf"] call mf_compile;

A3W_fnc_checkHackedVehicles = [_path, "checkHackedVehicles.sqf"] call mf_compile;
A3W_fnc_deleteEmptyGroup = [_path, "fn_deleteEmptyGroup.sqf"] call mf_compile;
A3W_fnc_registerKillScore = [_path, "fn_registerKillScore.sqf"] call mf_compile;
A3W_fnc_requestTickTime = [_path, "fn_requestTickTime.sqf"] call mf_compile;
A3W_fnc_setItemCleanup = [_path, "fn_setItemCleanup.sqf"] call mf_compile;
A3W_fnc_updateSpawnTimestamp = [_path, "fn_updateSpawnTimestamp.sqf"] call mf_compile;
addMilCap = [_path, "addMilCap.sqf"] call mf_compile;
basePartSetup = [_path, "basePartSetup.sqf"] call mf_compile;
cleanVehicleWreck = [_path, "cleanVehicleWreck.sqf"] call mf_compile;
convertTerritoryOwner = "territory\server\convertTerritoryOwner.sqf" call mf_compile;
defendArea = [_path, "defendArea.sqf"] call mf_compile;
dropPlayerItems = [_path, "dropPlayerItems.sqf"] call mf_compile;
findClientPlayer = [_path, "findClientPlayer.sqf"] call mf_compile;
fn_onPlayerConnected = [_path, "fn_onPlayerConnected.sqf"] call mf_compile;
fn_onPlayerDisconnected = [_path, "fn_onPlayerDisconnected.sqf"] call mf_compile;
fn_publicVariableAll = [_path, "fn_publicVariableAll.sqf"] call mf_compile;
fn_refillBox = [_path, "fn_refillbox.sqf"] call mf_compile;
fn_refillTruck = [_path, "fn_refilltruck.sqf"] call mf_compile;
fn_replaceMagazines = [_path, "fn_replaceMagazines.sqf"] call mf_compile;
fn_replaceWeapons = [_path, "fn_replaceWeapons.sqf"] call mf_compile;
fn_updatePlayerScore = [_path, "fn_updatePlayerScore.sqf"] call mf_compile;
fn_vehicleGetInOutServer = [_path, "fn_vehicleGetInOutServer.sqf"] call mf_compile;
fn_vehicleKilledServer = [_path, "fn_vehicleKilledServer.sqf"] call mf_compile;
hintBroadcast = [_path, "hintBroadcast.sqf"] call mf_compile;
parachuteLiftedVehicle = [_path, "parachuteLiftedVehicle.sqf"] call mf_compile;
A3W_fnc_playerRespawnServer = [_path, "playerRespawnServer.sqf"] call mf_compile;
processGroupInvite = [_path, "processGroupInvite.sqf"] call mf_compile;
processItems = [_path, "processItems.sqf"] call mf_compile;
processMoneyPickup = [_path, "processMoneyPickup.sqf"] call mf_compile;
processTransaction = [_path, "processTransaction.sqf"] call mf_compile;
punishTeamKiller = [_path, "punishTeamKiller.sqf"] call mf_compile;
refillPrimaryAmmo = [_path, "refillPrimaryAmmo.sqf"] call mf_compile;
respawnEventServer = [_path, "respawnEventServer.sqf"] call mf_compile;
setMissionSkill = [_path, "setMissionSkill.sqf"] call mf_compile;
spawnStoreObject = [_path, "spawnStoreObject.sqf"] call mf_compile;
teamKillUnlock = [_path, "teamKillUnlock.sqf"] call mf_compile;
teamSwitchLock = [_path, "teamSwitchLock.sqf"] call mf_compile;
teamSwitchUnlock = [_path, "teamSwitchUnlock.sqf"] call mf_compile;
updateConnectingClients = "territory\client\updateConnectingClients.sqf" call mf_compile;
vehicleRepair = [_path, "vehicleRepair.sqf"] call mf_compile;
vehicleSetup = [_path, "vehicleSetup.sqf"] call mf_compile;
waitUntilBagTaken = [_path, "waitUntilBagTaken.sqf"] call mf_compile;
weaponDisassembledServer = [_path, "weaponDisassembledServer.sqf"] call mf_compile;


//Player Management
server_playerDied = [_path, "serverAiDied.sqf"] call mf_compile;
A3W_fnc_serverPlayerDied = [_path, "serverPlayerDied.sqf"] call mf_compile;

//Spawning Compiles
_path = "server\spawning";
addVehicleRespawn = [_path, "addVehicleRespawn.sqf"] call mf_compile;
boatCreation = [_path, "boatCreation.sqf"] call mf_compile;
objectCreation = [_path, "objectCreation.sqf"] call mf_compile;
planeCreation = [_path, "planeCreation.sqf"] call mf_compile;
randomWeapons = [_path, "randomWeapon.sqf"] call mf_compile;
// staticGunCreation = [_path, "staticGunCreation.sqf"] call mf_compile;
staticHeliCreation = [_path, "staticHeliCreation.sqf"] call mf_compile;
vehicleCreation = [_path, "vehicleCreation.sqf"] call mf_compile;
