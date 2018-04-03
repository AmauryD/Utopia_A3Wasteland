-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: a3wasteland_maden
-- ------------------------------------------------------
-- Server version	5.5.55-0+deb8u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlog` (
  `ServerID` int(10) unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` varchar(256) CHARACTER SET utf8 NOT NULL,
  `PlayerUID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `ActionType` varchar(128) NOT NULL,
  `ActionValue` varchar(1024) NOT NULL,
  KEY `fk_AdminLog_ServerInstance_idx` (`ServerID`),
  CONSTRAINT `fk_AdminLog_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `antihacklog`
--

DROP TABLE IF EXISTS `antihacklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antihacklog` (
  `ServerID` int(10) unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` varchar(256) CHARACTER SET utf8 NOT NULL,
  `PlayerUID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `HackType` varchar(128) NOT NULL,
  `HackValue` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `KickOnJoin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `AdminNote` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  KEY `fk_AntihackLog_ServerInstance_idx` (`ServerID`),
  KEY `idx_AntihackLog_kickOnJoin` (`PlayerUID`,`KickOnJoin`),
  CONSTRAINT `fk_AntihackLog_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banktransferlog`
--

DROP TABLE IF EXISTS `banktransferlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banktransferlog` (
  `ServerID` int(10) unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SenderName` varchar(256) CHARACTER SET utf8 NOT NULL,
  `SenderUID` varchar(32) NOT NULL,
  `SenderSide` varchar(32) DEFAULT NULL,
  `RecipientName` varchar(256) CHARACTER SET utf8 NOT NULL,
  `RecipientUID` varchar(32) NOT NULL,
  `RecipientSide` varchar(32) DEFAULT NULL,
  `Amount` float NOT NULL,
  `Fee` float NOT NULL,
  KEY `fk_BankTransfers_ServerInstance_idx` (`ServerID`),
  CONSTRAINT `fk_BankTransfers_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbinfo`
--

DROP TABLE IF EXISTS `dbinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbinfo` (
  `Name` varchar(128) NOT NULL,
  `Value` varchar(1024) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playergroups`
--

DROP TABLE IF EXISTS `playergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playergroups` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `bank` int(11) NOT NULL DEFAULT '0',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `owner` (`owner`),
  CONSTRAINT `FK_playergroups_playerinfo` FOREIGN KEY (`owner`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerinfo`
--

DROP TABLE IF EXISTS `playerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerinfo` (
  `UID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `LastSide` varchar(32) DEFAULT NULL,
  `BankMoney` float NOT NULL DEFAULT '0',
  `XP` int(32) NOT NULL DEFAULT '0',
  `Level` int(32) NOT NULL DEFAULT '0',
  `Bounty` int(10) unsigned NOT NULL DEFAULT '0',
  `BountyKills` varchar(8192) NOT NULL DEFAULT '[]',
  `ParkingSlots` int(9) NOT NULL DEFAULT '2',
  `Skills` varchar(8192) NOT NULL DEFAULT '[]',
  `SkillPoints` int(32) NOT NULL DEFAULT '-1',
  `Group` int(11) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  KEY `FK_playerinfo_playergroups` (`Group`),
  CONSTRAINT `FK_playerinfo_playergroups` FOREIGN KEY (`Group`) REFERENCES `playergroups` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playermessages`
--

DROP TABLE IF EXISTS `playermessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playermessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `sender` varchar(25) NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `receiver` (`receiver`),
  KEY `FK_sender_playerinfo` (`sender`),
  CONSTRAINT `FK_receiver_playerinfo` FOREIGN KEY (`receiver`) REFERENCES `playerinfo` (`UID`),
  CONSTRAINT `FK_sender_playerinfo` FOREIGN KEY (`sender`) REFERENCES `playerinfo` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playersave`
--

DROP TABLE IF EXISTS `playersave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playersave` (
  `PlayerUID` varchar(32) NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastServerID` int(10) unsigned DEFAULT NULL,
  `Position` varchar(256) NOT NULL DEFAULT '[]',
  `Direction` float NOT NULL DEFAULT '0',
  `Damage` float NOT NULL DEFAULT '0',
  `HitPoints` varchar(1024) NOT NULL DEFAULT '[]',
  `Hunger` float NOT NULL DEFAULT '100',
  `Thirst` float NOT NULL DEFAULT '100',
  `Money` float NOT NULL DEFAULT '0',
  `CurrentWeapon` varchar(128) NOT NULL DEFAULT '""',
  `Stance` varchar(128) NOT NULL DEFAULT '""',
  `Headgear` varchar(128) NOT NULL DEFAULT '""',
  `Goggles` varchar(128) NOT NULL DEFAULT '""',
  `Uniform` varchar(128) NOT NULL DEFAULT '""',
  `Vest` varchar(128) NOT NULL DEFAULT '""',
  `Backpack` varchar(128) NOT NULL DEFAULT '""',
  `UniformWeapons` varchar(1024) NOT NULL DEFAULT '[]',
  `UniformItems` varchar(4096) NOT NULL DEFAULT '[]',
  `UniformMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `VestWeapons` varchar(1024) NOT NULL DEFAULT '[]',
  `VestItems` varchar(4096) NOT NULL DEFAULT '[]',
  `VestMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `BackpackWeapons` varchar(2048) NOT NULL DEFAULT '[]',
  `BackpackItems` varchar(4096) NOT NULL DEFAULT '[]',
  `BackpackMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `PrimaryWeapon` varchar(128) NOT NULL DEFAULT '""',
  `SecondaryWeapon` varchar(128) NOT NULL DEFAULT '""',
  `HandgunWeapon` varchar(128) NOT NULL DEFAULT '""',
  `PrimaryWeaponItems` varchar(512) NOT NULL DEFAULT '[]',
  `SecondaryWeaponItems` varchar(512) NOT NULL DEFAULT '[]',
  `HandgunItems` varchar(512) NOT NULL DEFAULT '[]',
  `AssignedItems` varchar(512) NOT NULL DEFAULT '[]',
  `LoadedMagazines` varchar(1024) NOT NULL DEFAULT '[]',
  `WastelandItems` varchar(1024) NOT NULL DEFAULT '[]',
  UNIQUE KEY `idx_PlayerSave_uniquePlayerMap` (`PlayerUID`,`MapID`),
  KEY `fk_PlayerSave_ServerMap_idx` (`MapID`),
  KEY `fk_PlayerSave_ServerInstance_idx` (`LastServerID`),
  KEY `idx_PlayerSave_crossMap` (`PlayerUID`,`LastModified`),
  CONSTRAINT `fk_PlayerSave_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerSave_ServerInstance` FOREIGN KEY (`LastServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerSave_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerstats`
--

DROP TABLE IF EXISTS `playerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstats` (
  `PlayerUID` varchar(32) NOT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PlayerKills` int(10) unsigned NOT NULL DEFAULT '0',
  `AIKills` int(10) unsigned NOT NULL DEFAULT '0',
  `TeamKills` int(10) unsigned NOT NULL DEFAULT '0',
  `DeathCount` int(10) unsigned NOT NULL DEFAULT '0',
  `ReviveCount` int(10) unsigned NOT NULL DEFAULT '0',
  `CaptureCount` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_PlayerStats_uniquePlayer` (`PlayerUID`),
  CONSTRAINT `fk_PlayerStats_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerstatsmap`
--

DROP TABLE IF EXISTS `playerstatsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstatsmap` (
  `PlayerUID` varchar(32) NOT NULL,
  `ServerID` int(10) unsigned NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PlayerKills` int(10) unsigned NOT NULL DEFAULT '0',
  `AIKills` int(10) unsigned NOT NULL DEFAULT '0',
  `TeamKills` int(10) unsigned NOT NULL DEFAULT '0',
  `DeathCount` int(10) unsigned NOT NULL DEFAULT '0',
  `ReviveCount` int(10) unsigned NOT NULL DEFAULT '0',
  `CaptureCount` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_PlayerStatsMap_uniquePlayer` (`PlayerUID`,`ServerID`,`MapID`),
  KEY `fk_PlayerStatsMap_ServerMap_idx` (`MapID`),
  KEY `fk_PlayerStatsMap_ServerInstance_idx` (`ServerID`),
  CONSTRAINT `fk_PlayerStatsMap_PlayerStats` FOREIGN KEY (`PlayerUID`) REFERENCES `playerstats` (`PlayerUID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatsMap_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatsMap_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerstorage`
--

DROP TABLE IF EXISTS `playerstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstorage` (
  `PlayerUID` varchar(32) NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Weapons` varchar(4096) NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) NOT NULL DEFAULT '[]',
  `Items` varchar(4096) NOT NULL DEFAULT '[]',
  `Containers` varchar(8192) NOT NULL DEFAULT '[]',
  UNIQUE KEY `idx_PlayerStorage_uniquePlayerMap` (`PlayerUID`,`MapID`),
  KEY `fk_PlayerStorage_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_PlayerStorage_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStorage_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serverinstance`
--

DROP TABLE IF EXISTS `serverinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverinstance` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WarchestMoneyBLUFOR` float NOT NULL DEFAULT '0',
  `WarchestMoneyOPFOR` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servermap`
--

DROP TABLE IF EXISTS `servermap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servermap` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WorldName` varchar(128) NOT NULL,
  `Environment` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_ServerMap_uniqueWorldEnv` (`WorldName`,`Environment`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servermines`
--

DROP TABLE IF EXISTS `servermines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servermines` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) unsigned NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastInteraction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OwnerUID` varchar(32) NOT NULL DEFAULT '""',
  `Class` varchar(128) NOT NULL DEFAULT 'nil',
  `Position` varchar(256) NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) NOT NULL DEFAULT '[]',
  `Damage` float NOT NULL DEFAULT '0',
  `Variables` varchar(4096) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerMines_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerMines_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_ServerMines_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerMines_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1723 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serverobjects`
--

DROP TABLE IF EXISTS `serverobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverobjects` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) unsigned NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastInteraction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OwnerUID` varchar(32) NOT NULL DEFAULT '""',
  `Class` varchar(128) NOT NULL DEFAULT 'nil',
  `Position` varchar(256) NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) NOT NULL DEFAULT '[]',
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Deployable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Damage` float NOT NULL DEFAULT '0',
  `AllowDamage` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Variables` varchar(4096) NOT NULL DEFAULT '[]',
  `Weapons` varchar(4096) NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) NOT NULL DEFAULT '[]',
  `Items` varchar(4096) NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `AmmoCargo` float NOT NULL DEFAULT '0',
  `FuelCargo` float NOT NULL DEFAULT '0',
  `RepairCargo` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerObjects_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerObjects_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_ServerObjects_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerObjects_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3729 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servertickets`
--

DROP TABLE IF EXISTS `servertickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servertickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(500) NOT NULL DEFAULT '',
  `status` int(6) NOT NULL DEFAULT '0',
  `ownerUID` varchar(32) NOT NULL DEFAULT '',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ownerUID` (`ownerUID`),
  CONSTRAINT `FK_playerInfo` FOREIGN KEY (`ownerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servertime`
--

DROP TABLE IF EXISTS `servertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servertime` (
  `ServerID` int(10) unsigned NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `DayTime` float DEFAULT NULL,
  `Fog` float DEFAULT NULL,
  `Overcast` float DEFAULT NULL,
  `Rain` float DEFAULT NULL,
  `Wind` varchar(128) DEFAULT NULL,
  UNIQUE KEY `idx_ServerTime_uniqueServerMap` (`ServerID`,`MapID`),
  KEY `fk_ServerTime_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerTime_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_ServerTime_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerTime_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servervehicles`
--

DROP TABLE IF EXISTS `servervehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servervehicles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) unsigned NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastUsed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OwnerUID` varchar(32) NOT NULL DEFAULT '""',
  `Parked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `LockState` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Class` varchar(128) NOT NULL DEFAULT 'nil',
  `Position` varchar(256) NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) NOT NULL DEFAULT '[]',
  `Velocity` varchar(256) NOT NULL DEFAULT '[]',
  `Flying` tinyint(1) NOT NULL DEFAULT '0',
  `Damage` float NOT NULL DEFAULT '0',
  `Fuel` float NOT NULL DEFAULT '0',
  `HitPoints` varchar(4096) NOT NULL DEFAULT '[]',
  `Variables` varchar(4096) NOT NULL DEFAULT '[]',
  `Textures` varchar(4096) NOT NULL DEFAULT '[]',
  `Weapons` varchar(4096) NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) NOT NULL DEFAULT '[]',
  `Items` varchar(4096) NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines2` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines3` varchar(4096) NOT NULL DEFAULT '[]',
  `AmmoCargo` float NOT NULL DEFAULT '0',
  `FuelCargo` float NOT NULL DEFAULT '0',
  `RepairCargo` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerVehicles_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerVehicles_ServerMap_idx` (`MapID`),
  KEY `idx_ServerVehicles_parkedOwners` (`OwnerUID`,`Parked`),
  CONSTRAINT `fk_ServerVehicles_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerVehicles_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9579 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-03 15:59:44
