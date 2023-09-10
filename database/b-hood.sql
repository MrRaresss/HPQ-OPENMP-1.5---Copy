-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 93.115.101.23
-- Generation Time: Mar 23, 2023 at 07:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s340_mrx`
--

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `R` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`ID`, `X`, `Y`, `Z`, `R`) VALUES
(1, 2216.57, 1675.92, 1007.97, 98.9999),
(2, 2255.2, 1678.34, 1007.97, -81.1);

-- --------------------------------------------------------

--
-- Table structure for table `banlog`
--

CREATE TABLE `banlog` (
  `ID` int(11) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `player` varchar(25) NOT NULL,
  `admin` varchar(25) NOT NULL,
  `reason` varchar(60) NOT NULL,
  `day` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `ID` int(11) NOT NULL,
  `PlayerName` varchar(30) NOT NULL,
  `AdminName` varchar(30) NOT NULL,
  `Reason` varchar(128) NOT NULL,
  `IP` varchar(16) NOT NULL DEFAULT 'NULL',
  `Days` int(11) NOT NULL,
  `Time` int(15) NOT NULL DEFAULT -1,
  `Active` int(11) NOT NULL,
  `Date` varchar(60) NOT NULL DEFAULT '1999-1-1 10:00',
  `Userid` int(11) NOT NULL,
  `ByUserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bizz`
--

CREATE TABLE `bizz` (
  `ID` int(11) NOT NULL,
  `Owned` int(11) NOT NULL,
  `Owner` varchar(25) NOT NULL DEFAULT 'The State',
  `Type` int(11) NOT NULL,
  `Message` varchar(50) NOT NULL,
  `EntranceX` float NOT NULL,
  `EntranceY` float NOT NULL,
  `EntranceZ` float NOT NULL,
  `ExitX` float NOT NULL,
  `ExitY` float NOT NULL,
  `ExitZ` float NOT NULL,
  `LevelNeeded` int(11) NOT NULL,
  `BuyPrice` int(11) NOT NULL,
  `EntranceCost` int(11) NOT NULL DEFAULT 5000,
  `Till` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `Virtual` int(11) NOT NULL,
  `Radio` int(11) NOT NULL DEFAULT -1,
  `Static` int(11) NOT NULL,
  `Gas` int(11) NOT NULL,
  `Products` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bizz`
--

INSERT INTO `bizz` (`ID`, `Owned`, `Owner`, `Type`, `Message`, `EntranceX`, `EntranceY`, `EntranceZ`, `ExitX`, `ExitY`, `ExitZ`, `LevelNeeded`, `BuyPrice`, `EntranceCost`, `Till`, `Locked`, `Interior`, `Virtual`, `Radio`, `Static`, `Gas`, `Products`) VALUES
(1, 1, 'The State', 6, '24/7', 2063.08, 2308.88, 10.8203, -25.9517, -187.761, 1003.55, 1, 0, 5000, 728500, 0, 17, 1, -1, 0, 0, 0),
(2, 1, 'The State', 7, 'Binco', 2102.14, 2257.42, 11.0234, 207.655, -110.479, 1005.13, 1, 0, 5000, 552000, 0, 15, 2, -1, 0, 0, 0),
(3, 1, 'The State', 9, 'Casino', 1290.96, -1161.12, 23.961, 2234.07, 1714.11, 1012.35, 1, 0, 5000, 255000, 0, 1, 3, -1, 0, 0, 0),
(4, 1, 'The State', 1, '{00FF00}#EL {FF0000}LA#', 1462.35, -1011.23, 26.8438, 2305.07, -15.9066, 26.7422, 1, 0, 2000, 185705, 0, 0, 4, 1, 0, 0, 0),
(5, 1, 'The State', 1, 'Banca', 2196.58, 1677.17, 12.3672, 2305.07, -15.9066, 26.7422, 1, 0, 5000, 6070000, 0, 0, 5, -1, 0, 0, 0),
(6, 1, 'The State', 9, 'Casino', 2017.04, 1916.5, 12.3424, 2234.07, 1714.11, 1012.35, 1, 0, 5000, 40000, 0, 1, 6, -1, 0, 0, 0),
(7, 1, 'The State', 5, 'Sex Shop', 2085.12, 2074.01, 11.0547, -100.354, -25.0326, 1000.72, 1, 0, 5000, 0, 0, 3, 7, -1, 0, 0, 0),
(8, 1, 'The State', 16, 'Gas Station', 2187.95, 2469.64, 11.2422, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 8, -1, 1, 0, 0),
(9, 1, 'The State', 10, 'CNN', 2868.99, 2438.48, 11.069, 0, 0, 0, 1, 0, 5000, 50000, 0, 0, 9, -1, 1, 0, 0),
(10, 1, 'The State', 4, 'Restaurant', 2014.9, 1150.44, 10.8203, -794.96, 489.431, 1376.2, 1, 0, 5000, 28500, 0, 1, 10, -1, 0, 0, 0),
(11, 1, 'The State', 15, 'Paintball', 2186.65, 1113.42, 12.6484, 0, 0, 0, 1, 0, 5000, 90000, 0, 0, 11, -1, 1, 0, 0),
(12, 1, 'The State', 2, 'Gun Shop', 2596.12, 1089.14, 10.8222, 285.676, -86.3199, 1001.52, 1, 0, 5000, 180500, 0, 4, 12, -1, 0, 0, 0),
(13, 1, 'The State', 6, '24/7', 2637.19, 1129.51, 11.1797, -25.9517, -187.761, 1003.55, 1, 0, 5000, 750000, 0, 17, 13, -1, 0, 0, 0),
(14, 1, 'The State', 16, 'Gas Station', 2117.49, 896.777, 11.1797, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 14, -1, 1, 0, 0),
(15, 1, 'The State', 6, '24/7', 2194.94, 1990.99, 12.2969, -25.9517, -187.761, 1003.55, 1, 0, 5000, 26500, 0, 17, 15, -1, 0, 0, 0),
(16, 1, 'The State', 8, 'Burger', 1872.25, 2071.86, 11.0625, 363.04, -75.3009, 1001.51, 1, 0, 5000, 35000, 0, 10, 16, -1, 0, 0, 0),
(17, 1, 'The State', 18, 'PNS', 1966.14, 2162.65, 10.8203, 0, 0, 0, 1, 0, 5000, 4670, 0, 0, 17, -1, 1, 0, 0),
(18, 1, 'The State', 19, 'Pizza', 2764.23, 2469.39, 11.0625, 372.286, -133.524, 1001.49, 1, 0, 5000, 1000, 0, 5, 18, -1, 0, 0, 0),
(19, 1, 'The State', 7, 'Binco', 2779.65, 2453.67, 11.0625, 207.655, -110.479, 1005.13, 1, 0, 5000, 0, 0, 15, 19, -1, 0, 0, 0),
(20, 1, 'The State', 2, 'Gun Shop', 2556.99, 2065.36, 11.0995, 285.676, -86.3199, 1001.52, 1, 0, 5000, 0, 0, 4, 20, -1, 0, 0, 0),
(21, 1, 'The State', 8, 'Burger', 2472.84, 2034.26, 11.0625, 363.04, -75.3009, 1001.51, 1, 0, 5000, 0, 0, 10, 21, -1, 0, 0, 0),
(22, 1, 'The State', 16, 'Gas Station', 2639.46, 1065.67, 10.8203, 0, 0, 0, 1, 0, 5000, 1666, 0, 0, 22, -1, 1, 0, 0),
(23, 1, 'The State', 11, 'Rent Moto', 2200.86, 1394.81, 11.0625, 0, 0, 0, 1, 0, 5000, 4420000, 0, 0, 23, -1, 1, 0, 0),
(25, 1, 'The State', 6, '24/7', 1833.76, -1842.51, 13.5781, -25.9517, -187.761, 1003.55, 1, 0, 5000, 0, 0, 17, 25, -1, 0, 0, 0),
(26, 1, 'The State', 17, 'Race Arena', 1099.66, 1601.43, 12.5469, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 26, -1, 1, 1, 0),
(27, 1, 'The State', 3, 'Club', 1837.02, -1682.32, 13.3236, 493.397, -24.8437, 1000.68, 1, 0, 5000, 47200, 0, 17, 27, -1, 0, 0, 0),
(28, 1, 'The State', 16, 'Gas Station', 1928.58, -1776.24, 13.5469, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 28, -1, 1, 0, 0),
(29, 1, 'The State', 18, 'PNS', 488.377, -1733.41, 11.1841, 0, 0, 0, 1, 0, 5000, 700, 0, 0, 29, -1, 1, 0, 0),
(30, 1, 'The State', 18, 'PNS', 2073.61, -1831.61, 13.5469, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 30, -1, 1, 0, 0),
(31, 1, 'The State', 19, 'Pizza', 2105.33, -1806.58, 13.5547, 372.286, -133.524, 1001.49, 1, 0, 5000, 11000, 0, 5, 31, -1, 0, 0, 0),
(32, 1, 'The State', 10, 'CNN', 649.291, -1357.32, 13.5672, 0, 0, 0, 1, 0, 5000, 10000, 0, 0, 32, -1, 1, 0, 0),
(33, 1, 'The State', 13, 'GYM', 2229.82, -1721.38, 13.5624, 772.302, -4.8968, 1000.73, 1, 0, 5000, 76000, 0, 5, 33, -1, 0, 0, 0),
(34, 1, 'The State', 10, 'CNN', -1782.32, 573.38, 35.1641, 0, 0, 0, 1, 0, 5000, 5000, 0, 0, 34, -1, 1, 0, 0),
(35, 1, 'The State', 7, 'Binco', 1456.55, -1137.76, 23.9572, 207.655, -110.479, 1005.13, 1, 0, 5000, 23500, 0, 15, 35, -1, 0, 0, 0),
(36, 1, 'The State', 18, 'PNS', -1904.66, 276.029, 41.0469, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 36, -1, 1, 0, 0),
(37, 1, 'The State', 18, 'PNS', 1024.82, -1031.38, 31.9847, 0, 0, 0, 1, 0, 5000, 7493, 0, 0, 37, -1, 1, 0, 0),
(38, 1, 'The State', 20, 'Tunning', 1034.55, -1028.3, 32.1016, 0, 0, 0, 1, 0, 5000, 15000, 0, 0, 38, -1, 1, 0, 0),
(39, 1, 'The State', 20, 'Tunning', -1942.84, 238.277, 34.1251, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 39, -1, 1, 0, 0),
(40, 1, 'The State', 14, 'Car Color', 1616.44, -1498.45, 14.2309, 0, 0, 0, 1, 0, 5000, 172500, 0, 0, 40, -1, 1, 0, 0),
(41, 1, 'The State', 6, '24/7', 1000.42, -919.976, 42.3281, -25.9517, -187.761, 1003.55, 1, 0, 5000, 14000, 0, 17, 41, -1, 0, 0, 0),
(42, 1, 'The State', 16, 'Gas Station', 1006.22, -930.103, 42.3281, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 42, -1, 1, 0, 0),
(43, 1, 'The State', 16, 'Gas Station', -2410.9, 964.916, 45.4609, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 43, -1, 1, 0, 0),
(44, 1, 'The State', 6, '24/7', -2420.16, 969.855, 45.2969, -25.9517, -187.761, 1003.55, 1, 0, 5000, 5000, 0, 17, 44, -1, 0, 0, 0),
(45, 1, 'The State', 18, 'PNS', -2425.46, 1029.79, 50.3906, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 45, -1, 1, 0, 0),
(46, 1, 'The State', 6, '24/7', -2442.65, 755.418, 35.1719, -25.9517, -187.761, 1003.55, 1, 0, 5000, 10000, 0, 17, 46, -1, 0, 0, 0),
(47, 1, 'The State', 8, 'Burger', -2336.87, -166.736, 35.5547, 363.04, -75.3009, 1001.51, 1, 0, 5000, 0, 0, 10, 47, -1, 0, 0, 0),
(48, 1, 'The State', 8, 'Burger', -2672.34, 257.94, 4.63281, 363.04, -75.3009, 1001.51, 1, 0, 5000, 5000, 0, 10, 48, -1, 0, 0, 0),
(49, 1, 'The State', 8, 'Burger', -326.047, 821.71, 14.2697, 363.04, -75.3009, 1001.51, 1, 0, 5000, 385000, 0, 10, 49, -1, 0, 0, 0),
(50, 1, 'The State', 7, 'Binco', 1656.85, 1733.25, 10.8281, 207.655, -110.479, 1005.13, 1, 0, 5000, 0, 0, 15, 50, -1, 0, 0, 0),
(51, 1, 'The State', 5, 'Sex Shop', 1087.64, -922.48, 43.3906, -100.354, -25.0326, 1000.72, 1, 0, 5000, 0, 0, 3, 51, -1, 0, 0, 0),
(52, 1, 'The State', 2, 'Gun Shop', 1368.84, -1279.85, 13.5469, 285.676, -86.3199, 1001.52, 1, 0, 5000, 225000, 0, 4, 52, -1, 0, 0, 0),
(53, 1, 'The State', 6, '24/7', 1352.35, -1759.25, 13.5078, -25.9517, -187.761, 1003.55, 1, 0, 5000, 146500, 0, 17, 53, -1, 0, 0, 0),
(54, 1, 'The State', 16, 'Gas Station', -2034.87, 148.606, 28.8359, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 54, -1, 1, 0, 0),
(55, 0, 'The State', 1, 'Banca', -2766.55, 375.614, 6.33468, 2305.07, -15.9066, 26.7422, 1, 0, 5000, 0, 0, 0, 55, -1, 0, 0, 0),
(56, 1, 'The State', 1, 'Banca', -1492.13, 920.147, 7.1875, 2305.07, -15.9066, 26.7422, 1, 0, 5000, 0, 0, 0, 56, -1, 0, 0, 0),
(57, 1, 'The State', 19, 'Pizza', 1367.56, 248.225, 19.5669, 372.286, -133.524, 1001.49, 1, 0, 5000, 5000, 0, 5, 57, -1, 0, 0, 0),
(58, 1, 'The State', 6, '24/7', 1642.27, -2334.86, 13.5469, -25.9517, -187.761, 1003.55, 10, 0, 5000, 401500, 0, 17, 58, -1, 0, 0, 0),
(59, 0, 'The State', 7, 'Binco', 1685.62, -2335.07, 13.5469, 207.655, -110.479, 1005.13, 10, 0, 5000, 291000, 0, 15, 59, -1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `ID` int(10) NOT NULL,
  `Userid` int(10) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Faction` int(10) NOT NULL,
  `Reason` int(10) NOT NULL,
  `Added` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `ID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Locationx` float NOT NULL,
  `Locationy` float NOT NULL,
  `Locationz` float NOT NULL,
  `Angle` float NOT NULL,
  `ColorOne` int(11) NOT NULL,
  `ColorTwo` int(11) NOT NULL,
  `Owner` varchar(25) NOT NULL DEFAULT 'Dealership',
  `Value` int(11) NOT NULL,
  `License` varchar(15) NOT NULL DEFAULT 'LS-01-RGM',
  `LicenseColor` varchar(10) NOT NULL DEFAULT 'none',
  `Alarm` int(11) NOT NULL,
  `Lockk` int(11) NOT NULL,
  `paintjob` int(11) NOT NULL DEFAULT 3,
  `KM` float NOT NULL,
  `Userid` int(11) NOT NULL DEFAULT 0,
  `Confiscated` int(2) NOT NULL,
  `Points` int(10) NOT NULL DEFAULT 5,
  `Tax` int(10) NOT NULL DEFAULT 50,
  `Fuel` int(10) NOT NULL DEFAULT 100,
  `Neon` int(10) NOT NULL,
  `Text` varchar(256) NOT NULL DEFAULT '-',
  `ColorText` int(11) NOT NULL,
  `Virtual` int(11) NOT NULL,
  `RainBow` int(11) NOT NULL,
  `Rainbows` varchar(128) NOT NULL DEFAULT '0|0|0|0',
  `Stage` int(11) NOT NULL,
  `MaxSpeed` int(11) NOT NULL,
  `Days` int(11) NOT NULL,
  `Temporar` int(11) NOT NULL,
  `TemporarTime` int(11) NOT NULL,
  `VIP` int(11) NOT NULL,
  `Cordonate` varchar(50) NOT NULL DEFAULT '0.0|0.0|0.0|0.0|0.0|0.0',
  `Components` varchar(50) NOT NULL DEFAULT '0|0|0|0',
  `TimeGoto` int(11) NOT NULL,
  `Mods` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `Premium` tinyint(1) NOT NULL,
  `Garage` int(11) NOT NULL DEFAULT -1,
  `NeonObj` varchar(32) NOT NULL DEFAULT '-1|-1',
  `PFuel` tinyint(1) NOT NULL,
  `SNeon` int(11) NOT NULL,
  `Special` int(11) NOT NULL,
  `CustomLicense` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`ID`, `Model`, `Locationx`, `Locationy`, `Locationz`, `Angle`, `ColorOne`, `ColorTwo`, `Owner`, `Value`, `License`, `LicenseColor`, `Alarm`, `Lockk`, `paintjob`, `KM`, `Userid`, `Confiscated`, `Points`, `Tax`, `Fuel`, `Neon`, `Text`, `ColorText`, `Virtual`, `RainBow`, `Rainbows`, `Stage`, `MaxSpeed`, `Days`, `Temporar`, `TemporarTime`, `VIP`, `Cordonate`, `Components`, `TimeGoto`, `Mods`, `Premium`, `Garage`, `NeonObj`, `PFuel`, `SNeon`, `Special`, `CustomLicense`) VALUES
(1, 473, 2148.42, -1166.44, 23.4452, 268.668, 1, 1, 'cibu', 1, 'New Car', 'none', 0, 0, 3, 0, 1, 0, 5, 50, 100, 0, '-', 0, 0, 0, '0|0|0|0', 0, 0, 0, 0, 0, 0, '0.0|0.0|0.0|0.0|0.0|0.0', '0|0|0|0', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0', 0, -1, '-1|-1', 0, 0, 0, 0),
(2, 473, 2161.05, -1192.25, 23.4451, 92.1009, 1, 1, 'cibu', 1, 'New Car', 'none', 0, 0, 3, 0, 1, 0, 5, 50, 100, 0, '-', 0, 0, 0, '0|0|0|0', 0, 0, 0, 0, 0, 0, '0.0|0.0|0.0|0.0|0.0|0.0', '0|0|0|0', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0', 0, -1, '-1|-1', 0, 0, 0, 0),
(3, 473, 2161.17, -1158.09, 23.4638, 90.2938, 1, 1, 'cibu', 1, 'New Car', 'none', 0, 0, 3, 0, 1, 0, 5, 50, 100, 0, '-', 0, 0, 0, '0|0|0|0', 0, 0, 0, 0, 0, 0, '0.0|0.0|0.0|0.0|0.0|0.0', '0|0|0|0', 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0', 0, -1, '-1|-1', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clanhq`
--

CREATE TABLE `clanhq` (
  `ID` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `EnterX` float NOT NULL,
  `EnterY` float NOT NULL,
  `EnterZ` float NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Clan` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clans`
--

CREATE TABLE `clans` (
  `ID` int(10) NOT NULL,
  `Owner` varchar(64) NOT NULL,
  `OwnerSQL` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Motd` varchar(256) NOT NULL DEFAULT 'Nu este setat.',
  `Tag` varchar(32) NOT NULL,
  `RankName1` varchar(64) NOT NULL DEFAULT 'Rank 1',
  `RankName2` varchar(64) NOT NULL DEFAULT 'Rank 2',
  `RankName3` varchar(64) NOT NULL DEFAULT 'Rank 3',
  `RankName4` varchar(64) NOT NULL DEFAULT 'Rank 4',
  `RankName5` varchar(64) NOT NULL DEFAULT 'Rank 5',
  `RankName6` varchar(64) NOT NULL DEFAULT 'Rank 6',
  `Color` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `Slots` int(10) NOT NULL,
  `RegisterDate` varchar(64) NOT NULL,
  `Days` int(10) NOT NULL DEFAULT 60,
  `TagType` int(11) NOT NULL,
  `HQ` int(11) NOT NULL,
  `PremiumPoints` int(11) NOT NULL,
  `RankName7` varchar(32) NOT NULL DEFAULT 'Rank 7',
  `Safebox` int(11) NOT NULL,
  `Bonus` int(11) NOT NULL DEFAULT 1,
  `Premium` int(11) NOT NULL,
  `VIP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clanvehicle`
--

CREATE TABLE `clanvehicle` (
  `ID` int(11) NOT NULL,
  `Locationx` float NOT NULL,
  `Locationy` float NOT NULL,
  `Locationz` float NOT NULL,
  `Angle` float NOT NULL,
  `ColorOne` int(11) NOT NULL,
  `ColorTwo` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `paintjob` int(11) NOT NULL,
  `Fuel` int(11) NOT NULL DEFAULT 100,
  `RainBow` int(11) NOT NULL,
  `Stage` int(11) NOT NULL,
  `Mods` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `ClanID` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Model` int(11) NOT NULL DEFAULT 400,
  `VIP` int(11) NOT NULL,
  `TimeGoto` int(11) NOT NULL,
  `Neon` int(11) NOT NULL,
  `NeonObj` varchar(33) NOT NULL DEFAULT '-1 -1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dsveh`
--

CREATE TABLE `dsveh` (
  `ID` int(10) NOT NULL,
  `Model` int(11) NOT NULL,
  `Price` int(11) NOT NULL DEFAULT 1,
  `Stock` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dsveh`
--

INSERT INTO `dsveh` (`ID`, `Model`, `Price`, `Stock`) VALUES
(1, 509, 1250000, 89),
(2, 510, 1, 100),
(3, 404, 3350000, 3),
(4, 600, 3900000, 4),
(5, 413, 4200000, 9),
(6, 543, 4720000, 7),
(7, 478, 5550000, 10),
(8, 422, 6050000, 8),
(9, 401, 6325000, 9),
(10, 466, 6100000, 9),
(11, 474, 5000000, 10),
(12, 471, 6900690, 9),
(13, 546, 7000500, 5),
(14, 436, 7230000, 10),
(15, 526, 9000000, 8),
(16, 517, 8000000, 10),
(17, 550, 7800000, 8),
(18, 458, 7770000, 9),
(19, 500, 5750000, 6),
(20, 551, 13300000, 9),
(21, 400, 8500000, 4),
(22, 542, 9520000, 9),
(23, 549, 9700000, 7),
(24, 439, 10000500, 6),
(25, 496, 13250000, 7),
(26, 561, 10000500, 9),
(27, 507, 14300000, 10),
(28, 567, 17600000, 9),
(29, 535, 16000000, 8),
(30, 554, 18350000, 10),
(31, 405, 19805000, 9),
(32, 555, 20000000, 8),
(33, 534, 20000000, 9),
(34, 489, 21500000, 9),
(35, 426, 23550000, 9),
(36, 589, 24000000, 8),
(37, 603, 27102000, 8),
(38, 475, 28700020, 9),
(39, 533, 29999996, 4),
(40, 587, 32000000, 10),
(41, 602, 35250000, 7),
(42, 565, 30250000, 10),
(43, 579, 39870230, 6),
(44, 480, 43220000, 8),
(45, 506, 57050000, 4),
(46, 402, 69999996, 5),
(47, 477, 77007007, 0),
(48, 495, 162000261, 149),
(49, 562, 61000069, 0),
(50, 415, 66000066, 2),
(51, 429, 196000000, 4),
(52, 451, 285000000, 0),
(53, 560, 390000000, 2),
(54, 541, 430000000, 0),
(55, 411, 555555555, 55),
(56, 522, 475000000, 0),
(57, 463, 10000000, 7),
(58, 462, 3000000, 5),
(59, 461, 25000000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `eat_stand`
--

CREATE TABLE `eat_stand` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Rot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eat_stand`
--

INSERT INTO `eat_stand` (`ID`, `X`, `Y`, `Z`, `Rot`) VALUES
(1, 2086.27, 2038.88, 10.8103, 0),
(2, 2620.54, 1727.37, 10.7503, -177.5),
(3, 1014.76, 1397.79, 10.6719, -177.8),
(4, 1120.14, 1820.4, 10.8019, -91.4),
(5, 2411.88, 1682.21, 10.7903, 0),
(6, 1908.55, 2077.14, 10.8125, 179.8),
(7, 2022.81, 1701.09, 10.7903, 89),
(8, 2198.73, 1523.89, 10.6719, 89.8),
(9, 2280.15, 955.818, 10.7519, 0),
(10, 2369.86, 640.741, 10.7719, 0),
(11, 2679.7, 759.676, 10.8319, 0),
(12, 2787.2, 890.217, 10.75, 0),
(13, 1577.23, 788.017, 11.1, 0),
(14, 1333.09, -915.631, 36.3597, -104.2),
(15, 1233.28, -922.005, 42.7049, -80),
(16, 976.57, -912.87, 45.7656, -167.3),
(17, 754.387, -1043.24, 23.6672, -59.6),
(18, 665.521, -1761.45, 13.5705, 73.7),
(19, 644.743, -1497.6, 14.8223, -178.9),
(20, 613.024, -1307.09, 14.4883, 90.8),
(21, 1170.2, -1130.46, 23.7954, 0),
(22, 1335.55, -1121.22, 23.7914, 0),
(23, 1650.98, -1153.59, 24.0549, -91.7),
(24, 1195.23, -1704.68, 13.5469, -89.3),
(25, 1073.91, -1816.09, 13.6735, -179.3),
(26, 2165.59, 2355.22, 10.8203, -94.1);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `ID` int(10) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Text` varchar(256) NOT NULL,
  `By` varchar(64) NOT NULL DEFAULT 'AdmBot',
  `Date` varchar(256) NOT NULL,
  `Read` int(10) NOT NULL,
  `Action` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`ID`, `Name`, `Text`, `By`, `Date`, `Read`, `Action`) VALUES
(1, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:15', 0, ''),
(2, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:16', 0, ''),
(3, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:17', 0, ''),
(4, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:18', 0, ''),
(5, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:19', 0, ''),
(6, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:20', 0, ''),
(7, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:22', 0, ''),
(8, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:23', 0, ''),
(9, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:24', 0, ''),
(10, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:25', 0, ''),
(11, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:26', 0, ''),
(12, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:27', 0, ''),
(13, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:28', 0, ''),
(14, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:29', 0, ''),
(15, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:30', 0, ''),
(16, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:32', 0, ''),
(17, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:33', 0, ''),
(18, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:34', 0, ''),
(19, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:35', 0, ''),
(20, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:36', 0, ''),
(21, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:37', 0, ''),
(22, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:38', 0, ''),
(23, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:39', 0, ''),
(24, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:41', 0, ''),
(25, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:42', 0, ''),
(26, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:43', 0, ''),
(27, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:44', 0, ''),
(28, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:45', 0, ''),
(29, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:46', 0, ''),
(30, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:47', 0, ''),
(31, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:48', 0, ''),
(32, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:50', 0, ''),
(33, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:51', 0, ''),
(34, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:52', 0, ''),
(35, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:53', 0, ''),
(36, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:54', 0, ''),
(37, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:55', 0, ''),
(38, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:56', 0, ''),
(39, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:58', 0, ''),
(40, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:32:59', 0, ''),
(41, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:00', 0, ''),
(42, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:01', 0, ''),
(43, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:02', 0, ''),
(44, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:03', 0, ''),
(45, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:04', 0, ''),
(46, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:05', 0, ''),
(47, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:07', 0, ''),
(48, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:08', 0, ''),
(49, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:09', 0, ''),
(50, '?', 'Your raport was not in considered because you have an active release.', 'AdmBot', '08-10-2022 21:33:10', 0, ''),
(51, '?', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '16-10-2022 19:00:17', 0, ''),
(52, 'f', 'Your raport was not in considered because you have an active release.', 'AdmBot', '20-10-2022 22:29:25', 0, ''),
(53, 'f', 'Your raport was not in considered because you have an active release.', 'AdmBot', '21-10-2022 23:34:44', 0, ''),
(54, 'ihatepink', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 00:40:34', 0, ''),
(55, 'ihatepink', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 00:42:18', 0, ''),
(56, 'ihatepink', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 00:43:25', 0, ''),
(57, 'ihatepink', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 00:44:32', 0, ''),
(58, 'ihatepink', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 00:45:39', 0, ''),
(59, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:33', 0, ''),
(60, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:34', 0, ''),
(61, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:35', 0, ''),
(62, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:36', 0, ''),
(63, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:37', 0, ''),
(64, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:39', 0, ''),
(65, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:40', 0, ''),
(66, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:41', 0, ''),
(67, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:42', 0, ''),
(68, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:43', 0, ''),
(69, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:44', 0, ''),
(70, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:45', 0, ''),
(71, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:46', 0, ''),
(72, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:48', 0, ''),
(73, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:49', 0, ''),
(74, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:50', 0, ''),
(75, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:51', 0, ''),
(76, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:52', 0, ''),
(77, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:53', 0, ''),
(78, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:54', 0, ''),
(79, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:55', 0, ''),
(80, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:57', 0, ''),
(81, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:58', 0, ''),
(82, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:09:59', 0, ''),
(83, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:00', 0, ''),
(84, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:01', 0, ''),
(85, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:02', 0, ''),
(86, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:03', 0, ''),
(87, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:04', 0, ''),
(88, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:06', 0, ''),
(89, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:07', 0, ''),
(90, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:08', 0, ''),
(91, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:09', 0, ''),
(92, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:10', 0, ''),
(93, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:11', 0, ''),
(94, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:12', 0, ''),
(95, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:14', 0, ''),
(96, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:15', 0, ''),
(97, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:16', 0, ''),
(98, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:17', 0, ''),
(99, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:18', 0, ''),
(100, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:19', 0, ''),
(101, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:20', 0, ''),
(102, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:21', 0, ''),
(103, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:23', 0, ''),
(104, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:24', 0, ''),
(105, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:25', 0, ''),
(106, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:26', 0, ''),
(107, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:27', 0, ''),
(108, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:28', 0, ''),
(109, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:29', 0, ''),
(110, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:30', 0, ''),
(111, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:32', 0, ''),
(112, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:33', 0, ''),
(113, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:34', 0, ''),
(114, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:35', 0, ''),
(115, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:36', 0, ''),
(116, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:37', 0, ''),
(117, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:38', 0, ''),
(118, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:39', 0, ''),
(119, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:41', 0, ''),
(120, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:42', 0, ''),
(121, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:43', 0, ''),
(122, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:44', 0, ''),
(123, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:45', 0, ''),
(124, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:46', 0, ''),
(125, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:47', 0, ''),
(126, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:49', 0, ''),
(127, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:50', 0, ''),
(128, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:51', 0, ''),
(129, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:52', 0, ''),
(130, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:53', 0, ''),
(131, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:54', 0, ''),
(132, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:55', 0, ''),
(133, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:56', 0, ''),
(134, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:58', 0, ''),
(135, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:10:59', 0, ''),
(136, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:00', 0, ''),
(137, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:01', 0, ''),
(138, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:02', 0, ''),
(139, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:03', 0, ''),
(140, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:04', 0, ''),
(141, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:05', 0, ''),
(142, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:07', 0, ''),
(143, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:08', 0, ''),
(144, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:09', 0, ''),
(145, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:10', 0, ''),
(146, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:11', 0, ''),
(147, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:12', 0, ''),
(148, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:13', 0, ''),
(149, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:14', 0, ''),
(150, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:16', 0, ''),
(151, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:17', 0, ''),
(152, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:18', 0, ''),
(153, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:19', 0, ''),
(154, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:20', 0, ''),
(155, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:21', 0, ''),
(156, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:22', 0, ''),
(157, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:24', 0, ''),
(158, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:25', 0, ''),
(159, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:26', 0, ''),
(160, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:27', 0, ''),
(161, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:28', 0, ''),
(162, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:29', 0, ''),
(163, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:30', 0, ''),
(164, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:31', 0, ''),
(165, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:32', 0, ''),
(166, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:34', 0, ''),
(167, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:35', 0, ''),
(168, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:36', 0, ''),
(169, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:37', 0, ''),
(170, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:38', 0, ''),
(171, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:39', 0, ''),
(172, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:40', 0, ''),
(173, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:42', 0, ''),
(174, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:43', 0, ''),
(175, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:44', 0, ''),
(176, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:45', 0, ''),
(177, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:46', 0, ''),
(178, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:47', 0, ''),
(179, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:48', 0, ''),
(180, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:49', 0, ''),
(181, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:51', 0, ''),
(182, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:52', 0, ''),
(183, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:53', 0, ''),
(184, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:54', 0, ''),
(185, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:55', 0, ''),
(186, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:56', 0, ''),
(187, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:57', 0, ''),
(188, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:11:58', 0, ''),
(189, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:00', 0, ''),
(190, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:01', 0, ''),
(191, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:02', 0, ''),
(192, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:03', 0, ''),
(193, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:04', 0, ''),
(194, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:05', 0, ''),
(195, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:06', 0, ''),
(196, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:07', 0, ''),
(197, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:09', 0, ''),
(198, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:10', 0, ''),
(199, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:11', 0, ''),
(200, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:12', 0, ''),
(201, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:13', 0, ''),
(202, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:14', 0, ''),
(203, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:15', 0, ''),
(204, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:16', 0, ''),
(205, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:18', 0, ''),
(206, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:19', 0, ''),
(207, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:20', 0, ''),
(208, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:21', 0, ''),
(209, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:22', 0, ''),
(210, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:23', 0, ''),
(211, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:24', 0, ''),
(212, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:25', 0, ''),
(213, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:27', 0, ''),
(214, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:28', 0, ''),
(215, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:29', 0, ''),
(216, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:30', 0, ''),
(217, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:31', 0, ''),
(218, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:32', 0, ''),
(219, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:33', 0, ''),
(220, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:34', 0, ''),
(221, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:36', 0, ''),
(222, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:37', 0, ''),
(223, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:38', 0, ''),
(224, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:39', 0, ''),
(225, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:40', 0, ''),
(226, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:41', 0, ''),
(227, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:42', 0, ''),
(228, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:44', 0, ''),
(229, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:45', 0, ''),
(230, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:46', 0, ''),
(231, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:47', 0, ''),
(232, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:48', 0, ''),
(233, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:49', 0, ''),
(234, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:50', 0, ''),
(235, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:51', 0, ''),
(236, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:53', 0, ''),
(237, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:54', 0, ''),
(238, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:55', 0, ''),
(239, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:56', 0, ''),
(240, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:57', 0, ''),
(241, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:58', 0, ''),
(242, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:12:59', 0, ''),
(243, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:01', 0, ''),
(244, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:02', 0, ''),
(245, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:03', 0, ''),
(246, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:04', 0, ''),
(247, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:05', 0, ''),
(248, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:06', 0, ''),
(249, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:07', 0, ''),
(250, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:08', 0, ''),
(251, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:10', 0, ''),
(252, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:11', 0, ''),
(253, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:12', 0, ''),
(254, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:13', 0, ''),
(255, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:14', 0, ''),
(256, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:15', 0, ''),
(257, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:16', 0, ''),
(258, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:17', 0, ''),
(259, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:19', 0, ''),
(260, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:20', 0, ''),
(261, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:21', 0, ''),
(262, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:22', 0, ''),
(263, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:23', 0, ''),
(264, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:24', 0, ''),
(265, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:25', 0, ''),
(266, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:27', 0, ''),
(267, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:28', 0, ''),
(268, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:29', 0, ''),
(269, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:30', 0, ''),
(270, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:31', 0, ''),
(271, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:32', 0, ''),
(272, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:33', 0, ''),
(273, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:35', 0, ''),
(274, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:36', 0, ''),
(275, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:37', 0, ''),
(276, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:38', 0, ''),
(277, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:39', 0, ''),
(278, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:40', 0, ''),
(279, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:41', 0, ''),
(280, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:42', 0, ''),
(281, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:44', 0, ''),
(282, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:45', 0, ''),
(283, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:46', 0, ''),
(284, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:47', 0, ''),
(285, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:48', 0, ''),
(286, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:49', 0, ''),
(287, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:50', 0, ''),
(288, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:51', 0, ''),
(289, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:53', 0, ''),
(290, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:54', 0, ''),
(291, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:55', 0, ''),
(292, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:56', 0, ''),
(293, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:57', 0, ''),
(294, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:58', 0, ''),
(295, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:13:59', 0, ''),
(296, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:01', 0, ''),
(297, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:02', 0, ''),
(298, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:03', 0, ''),
(299, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:04', 0, ''),
(300, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:05', 0, ''),
(301, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:06', 0, ''),
(302, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:07', 0, ''),
(303, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:08', 0, ''),
(304, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:10', 0, ''),
(305, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:11', 0, ''),
(306, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:12', 0, ''),
(307, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:13', 0, ''),
(308, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:14', 0, ''),
(309, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:15', 0, ''),
(310, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:16', 0, ''),
(311, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:18', 0, ''),
(312, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:19', 0, ''),
(313, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:20', 0, ''),
(314, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:21', 0, ''),
(315, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:22', 0, ''),
(316, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:23', 0, ''),
(317, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:24', 0, ''),
(318, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:25', 0, ''),
(319, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:27', 0, ''),
(320, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:28', 0, ''),
(321, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:29', 0, ''),
(322, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:30', 0, ''),
(323, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:31', 0, ''),
(324, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:32', 0, ''),
(325, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:33', 0, ''),
(326, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:35', 0, ''),
(327, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:36', 0, ''),
(328, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:37', 0, ''),
(329, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:38', 0, ''),
(330, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:39', 0, ''),
(331, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:40', 0, ''),
(332, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:41', 0, ''),
(333, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:42', 0, ''),
(334, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:44', 0, ''),
(335, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:45', 0, ''),
(336, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:46', 0, ''),
(337, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:47', 0, ''),
(338, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:48', 0, ''),
(339, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:49', 0, ''),
(340, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:50', 0, ''),
(341, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:51', 0, ''),
(342, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:53', 0, ''),
(343, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:54', 0, ''),
(344, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:55', 0, ''),
(345, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:56', 0, ''),
(346, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:57', 0, ''),
(347, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:58', 0, ''),
(348, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:14:59', 0, ''),
(349, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:00', 0, ''),
(350, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:02', 0, ''),
(351, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:03', 0, ''),
(352, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:04', 0, ''),
(353, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:05', 0, ''),
(354, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:06', 0, ''),
(355, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:07', 0, ''),
(356, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:08', 0, ''),
(357, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:09', 0, ''),
(358, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:11', 0, ''),
(359, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:12', 0, ''),
(360, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:13', 0, ''),
(361, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:14', 0, ''),
(362, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:15', 0, ''),
(363, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:16', 0, ''),
(364, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:17', 0, ''),
(365, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:19', 0, ''),
(366, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:20', 0, ''),
(367, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:21', 0, ''),
(368, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:22', 0, ''),
(369, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:23', 0, ''),
(370, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:24', 0, ''),
(371, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:25', 0, ''),
(372, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:26', 0, ''),
(373, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:28', 0, ''),
(374, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:29', 0, ''),
(375, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:30', 0, ''),
(376, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:31', 0, ''),
(377, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:32', 0, ''),
(378, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:33', 0, ''),
(379, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:34', 0, ''),
(380, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:36', 0, ''),
(381, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:37', 0, ''),
(382, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:38', 0, ''),
(383, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:39', 0, ''),
(384, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:40', 0, ''),
(385, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:41', 0, ''),
(386, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:42', 0, ''),
(387, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:44', 0, ''),
(388, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:45', 0, ''),
(389, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:46', 0, ''),
(390, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:47', 0, ''),
(391, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:48', 0, ''),
(392, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:49', 0, ''),
(393, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:50', 0, ''),
(394, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:51', 0, ''),
(395, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:53', 0, '');
INSERT INTO `emails` (`ID`, `Name`, `Text`, `By`, `Date`, `Read`, `Action`) VALUES
(396, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:54', 0, ''),
(397, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:55', 0, ''),
(398, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:56', 0, ''),
(399, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:57', 0, ''),
(400, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:58', 0, ''),
(401, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:15:59', 0, ''),
(402, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:00', 0, ''),
(403, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:02', 0, ''),
(404, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:03', 0, ''),
(405, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:04', 0, ''),
(406, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:05', 0, ''),
(407, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:06', 0, ''),
(408, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:07', 0, ''),
(409, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:08', 0, ''),
(410, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:10', 0, ''),
(411, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:11', 0, ''),
(412, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:12', 0, ''),
(413, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:13', 0, ''),
(414, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:14', 0, ''),
(415, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:15', 0, ''),
(416, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:16', 0, ''),
(417, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:17', 0, ''),
(418, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:19', 0, ''),
(419, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:20', 0, ''),
(420, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:21', 0, ''),
(421, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:22', 0, ''),
(422, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:23', 0, ''),
(423, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:24', 0, ''),
(424, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:25', 0, ''),
(425, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:27', 0, ''),
(426, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:28', 0, ''),
(427, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:29', 0, ''),
(428, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:30', 0, ''),
(429, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:31', 0, ''),
(430, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:32', 0, ''),
(431, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:33', 0, ''),
(432, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:34', 0, ''),
(433, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:36', 0, ''),
(434, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:37', 0, ''),
(435, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:38', 0, ''),
(436, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:39', 0, ''),
(437, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:40', 0, ''),
(438, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:41', 0, ''),
(439, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:42', 0, ''),
(440, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:43', 0, ''),
(441, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:45', 0, ''),
(442, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:46', 0, ''),
(443, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:47', 0, ''),
(444, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:48', 0, ''),
(445, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:49', 0, ''),
(446, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:50', 0, ''),
(447, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:51', 0, ''),
(448, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:52', 1, ''),
(449, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:54', 0, ''),
(450, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:55', 0, ''),
(451, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:56', 0, ''),
(452, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:16:57', 0, ''),
(453, 'cibu', 'Your raport was not in considered because you have an active release.', 'AdmBot', '22-10-2022 01:17:01', 0, ''),
(454, 'ihatepink', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:02', 0, ''),
(455, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:03', 0, ''),
(456, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:05', 0, ''),
(457, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:06', 0, ''),
(458, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:07', 0, ''),
(459, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:08', 0, ''),
(460, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:09', 0, ''),
(461, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:10', 0, ''),
(462, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:11', 0, ''),
(463, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:12', 0, ''),
(464, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:14', 0, ''),
(465, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:15', 0, ''),
(466, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:16', 0, ''),
(467, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:17', 0, ''),
(468, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:18', 0, ''),
(469, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:19', 0, ''),
(470, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:20', 0, ''),
(471, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:21', 0, ''),
(472, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:22', 0, ''),
(473, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:24', 0, ''),
(474, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:25', 0, ''),
(475, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:26', 0, ''),
(476, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:27', 0, ''),
(477, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:28', 0, ''),
(478, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:29', 0, ''),
(479, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:30', 0, ''),
(480, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:31', 0, ''),
(481, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:37', 0, ''),
(482, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:38', 0, ''),
(483, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:39', 0, ''),
(484, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:41', 0, ''),
(485, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:42', 0, ''),
(486, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:43', 0, ''),
(487, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:44', 0, ''),
(488, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:45', 0, ''),
(489, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:46', 0, ''),
(490, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:47', 0, ''),
(491, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:48', 0, ''),
(492, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:50', 0, ''),
(493, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:51', 0, ''),
(494, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:52', 0, ''),
(495, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:53', 0, ''),
(496, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:54', 0, ''),
(497, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:55', 0, ''),
(498, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:56', 0, ''),
(499, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:57', 0, ''),
(500, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:17:59', 0, ''),
(501, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:00', 0, ''),
(502, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:01', 0, ''),
(503, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:06', 0, ''),
(504, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:07', 0, ''),
(505, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:08', 0, ''),
(506, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:09', 0, ''),
(507, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:10', 0, ''),
(508, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:12', 0, ''),
(509, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:13', 0, ''),
(510, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:14', 0, ''),
(511, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:15', 0, ''),
(512, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:16', 0, ''),
(513, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:17', 0, ''),
(514, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:18', 0, ''),
(515, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:19', 0, ''),
(516, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:21', 0, ''),
(517, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:22', 0, ''),
(518, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:23', 0, ''),
(519, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:24', 0, ''),
(520, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:25', 0, ''),
(521, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:26', 0, ''),
(522, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:27', 0, ''),
(523, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:28', 0, ''),
(524, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:30', 0, ''),
(525, '', 'Your raport has been successfully reviewed (incomplete). You have been kicked out of faction because you have < 2.95 hours.', 'AdmBot', '22-10-2022 01:18:31', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `factionlog`
--

CREATE TABLE `factionlog` (
  `ID` int(11) NOT NULL,
  `Faction` int(11) NOT NULL,
  `Text` varchar(256) NOT NULL,
  `Date` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `IntX` float NOT NULL,
  `IntY` float NOT NULL,
  `IntZ` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Anunt` varchar(128) NOT NULL DEFAULT 'None',
  `Name1` varchar(64) NOT NULL DEFAULT 'Rank 1',
  `Name2` varchar(64) NOT NULL DEFAULT 'Rank 2',
  `Name3` varchar(64) NOT NULL DEFAULT 'Rank 3',
  `Name4` varchar(64) NOT NULL DEFAULT 'Rank 4',
  `Name5` varchar(64) NOT NULL DEFAULT 'Rank 5',
  `Name6` varchar(64) NOT NULL DEFAULT 'Rank 6',
  `Name7` varchar(64) NOT NULL DEFAULT 'Rank 7',
  `App` int(10) NOT NULL DEFAULT 0,
  `Lock` int(11) NOT NULL DEFAULT 1,
  `MaxMembers` int(3) NOT NULL DEFAULT 0,
  `MinLevel` int(11) NOT NULL DEFAULT 7,
  `sX` float NOT NULL,
  `sY` float NOT NULL,
  `sZ` float NOT NULL,
  `RaportRank1` varchar(30) NOT NULL DEFAULT '0|0|0',
  `RaportRank2` varchar(30) NOT NULL DEFAULT '0|0|0',
  `RaportRank3` varchar(30) NOT NULL DEFAULT '0|0|0',
  `RaportRank4` varchar(30) NOT NULL DEFAULT '0|0|0',
  `RaportRank5` varchar(30) NOT NULL DEFAULT '0|0|0',
  `RaportRank6` varchar(30) NOT NULL DEFAULT '0|0|0',
  `RaportRank7` varchar(30) NOT NULL DEFAULT '0|0|0',
  `vX` float NOT NULL,
  `vY` float NOT NULL,
  `vZ` float NOT NULL,
  `eX` float NOT NULL,
  `eY` float NOT NULL,
  `eZ` float NOT NULL,
  `vRot` float NOT NULL,
  `eRot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`ID`, `Name`, `X`, `Y`, `Z`, `IntX`, `IntY`, `IntZ`, `Interior`, `VW`, `Anunt`, `Name1`, `Name2`, `Name3`, `Name4`, `Name5`, `Name6`, `Name7`, `App`, `Lock`, `MaxMembers`, `MinLevel`, `sX`, `sY`, `sZ`, `RaportRank1`, `RaportRank2`, `RaportRank3`, `RaportRank4`, `RaportRank5`, `RaportRank6`, `RaportRank7`, `vX`, `vY`, `vZ`, `eX`, `eY`, `eZ`, `vRot`, `eRot`) VALUES
(1, 'Los Santos Police Department', 1555.1, -1675.62, 16.195, 246.78, 63.3446, 1003.64, 6, 1, 'rpg.b-hood.ro - factions', '[1] Officer', 'Sergent', '[3] Sergeant', '[4] Lieutenant', '[5] Captain', 'Chestor', 'Chestor General', 0, 0, 50, 15, 1559.71, -1635.3, 13.5578, '50 15 0', '40 13 10', '30 10 8', '20 7 6', '15 5 5', '10 0 0', '0 0 0', 1559.79, -1627.53, 13.1099, 1566.07, -1653.02, 28.5725, 91.1499, 90.7578),
(2, 'Federal Bureau of Investigation', 626.975, -571.419, 17.9207, 238.567, 139.299, 1003.02, 3, 2, 'rpg.b-hood.ro - factions', '7 bosu', '[2] Special Agent', '[3] Charge', '[4] Supervisory', 'Chestor', 'Co-Lider', 'Lider', 0, 1, 40, 15, 624.215, -588.913, 16.9743, '60|0|0', '50|4|0', '40|3|0', '30|2|0', '25|1|0', '10|0|0', '0|0|0', 627.231, -596.344, 16.3633, 661.407, -584.13, 16.5124, 274.63, 90.4194),
(3, 'National Guard', 154.818, 1903.26, 18.7252, 288.763, 167.704, 1007.17, 3, 3, 'rpg.b-hood.ro - factions', '[1] Private', '[2] Second Lieutenant', '[3] First Lieutenant', '[4] Captain', '[5] Major', '[6] Colonel', '[7] General', 0, 1, 40, 15, 206.661, 1916.21, 17.6406, '60|0|0', '50|0|0', '40|0|0', '30|0|0', '25|0|0', '10|0|0', '0|0|0', 211.357, 1918.64, 17.3677, 307.847, 1802.47, 17.8185, 178.666, 0.614579),
(4, 'Grove Street', 2495.22, -1690.91, 14.7656, 2544.49, -1304.77, 1054.64, 2, 4, 'rpg.b-hood.ro - factions', '[1] Soldier', '[2] Supplier', '[3] Launderer', '[4] Chief Enforcer', '[5] Councilor', '[6] Advisor', '[7] Supreme Chief', 0, 1, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Los Aztecas', 1456.52, 2773.59, 10.8203, 2544.49, -1304.77, 1054.64, 2, 5, 'rpg.b-hood.ro - factions', '[1] Servant', '[2] Minion', '[3] Fighter', '[4] Gangster', '[5] War Gangster', '[6] Count', '[7] Lord', 0, 0, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Los Vagos', 691.571, -1276.05, 13.5607, 2544.49, -1304.77, 1054.64, 2, 6, 'rpg.b-hood.ro - factions', '[1] Recluta', '[2] Cholo', '[3] Solado', '[4] Pandillero', '[5] Vato del Jefe', '[6] Mano Derecha', '[7] El Jefe', 0, 0, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'School Instructors LS', 476.902, -1498.75, 20.4789, 1494.49, 1304.18, 1093.29, 3, 7, 'rpg.b-hood.ro - factions', '[1] Trainee', '[2] Instructor', '[3] Senior Instructor', '[4] Supervisor', '[5] Manager', '[6] Under Boss', '[7] Boss', 0, 0, 50, 10, 490.688, -1499.76, 20.4693, '30 0 0', '25 0 0', '20 0 0', '15 0 0', '10 0 0', '5 0 0', '0 0 0', 484.348, -1498.86, 20.0216, 500.682, -1511.38, 39.3322, 355.388, 270.518),
(8, 'Tow Truck Company', 2451.17, -2120.77, 13.5469, 626.835, -12.0344, 1000.92, 1, 8, 'rpg.b-hood.ro - factions', '[1] Trainee', '[2] Mechanic', '[3] Senior Mechanic', '[4] Supervisor', '[5] Manager', '[6] Under Boss', '[7] Owner', 0, 0, 50, 10, 2464.67, -2114.29, 13.5469, '25 40 35', '20 35 30', '15 30 25', '10 25 20', '10 20 15', '5 5 5', '0 0 0', 2454.55, -2089.32, 13.4194, 0, 0, 0, 88.9317, 0),
(9, 'News Reporters', -329.801, 1537.04, 76.612, -2026.96, -104.033, 1035.17, 3, 9, 'rpg.b-hood.ro - factions', '[1] Jurnalist', '[2] Ziarist', '[3] Editor', '[4] Redactor', '[5] Meteorologist', '[6] News presenter', '[7] Political commentator', 0, 0, 50, 10, -311.84, 1536.3, 75.5625, '40 12 0', '35 10 0', '25 8 4', '20 6 3', '15 4 2', '10 3 0', '0 0 0', -317.872, 1514.77, 75.3828, -369.754, 1558.2, 75.7106, 0.202718, 214.531),
(10, 'The Ballas', 1455.48, 750.583, 11.023, 2544.49, -1304.77, 1054.64, 2, 10, 'rpg.b-hood.ro - factions', '(1) Ragazzino -', '(2) Spacciatore -', '(3) Capodecina -', '6', '(5) Fattam -', 'cartoon123', '(7) Capo Di Tutti', 0, 0, 20, 20, 1081.06, -345.265, 73.9836, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Hitman Agency', 1051.72, -345.962, 73.9922, -2158.61, 642.401, 1052.38, 1, 11, 'rpg.b-hood.ro - factions', '[1] Freelancer', '[2] Marksman', '[3] Agent', '[4] Special Agent', '[5] Special Agent in Charge', '[6] Vice Director', '[7] Director', 0, 0, 40, 15, 1043.78, -349.841, 73.9922, '30 0 0', '25 0 0', '20 0 0', '15 0 0', '10 0 0', '5 0 0', '0 0 0', 1077.94, -309.984, 73.7193, 1038.64, -355.085, 74.2422, 177.426, 0.000002),
(12, 'Taxi Company', 1752.5, -1894.02, 13.557, 1701.24, -1668.03, 20.2188, 18, 12, 'rpg.b-hood.ro - factions', '[1] Trainee', '[2] Taxi Rookie', '[3] Cabbie', '[4] Dispatcher', '[5] Shift Supervisor', '[6] Taxi Company Manager', '[7] Taxi Company Owner', 0, 0, 50, 10, 1759.92, -1900.19, 13.5634, '45|25|0', '30|20|0', '30|15|0', '20|10|0', '10|10|0', '10|0|0', '0|0|0', 1777.32, -1912.88, 13.1144, 1792.34, -1924.3, 13.6405, 269.663, 0.000073),
(13, 'Paramedic Departament', 1607.19, 1815.25, 10.8203, 1494.46, 1304.12, 1093.29, 3, 13, 'rpg.b-hood.ro - factions', '[1] Candidate Paramedic', '[2] Paramedic', '[3] Paramedic in Charge', '[4] Paramedic Ambulance Commander', '[5] Paramedic Field Chief', '[6] Assistant Chief Paramedic', '[7] Chief Paramedic', 0, 0, 50, 10, 1624.25, 1820.08, 10.8203, '70 0 0', '60 0 0', '50 0 0', '35 0 0', '20 0 0', '10|0|0', '0 0 0', 1606.4, 1839.09, 10.5474, 1607.96, 1768.21, 38.0222, 358.253, 357.821),
(14, 'Las Venturas Police Department', 2287.24, 2431.63, 10.8203, 246.78, 63.3446, 1003.64, 6, 14, 'rpg.b-hood.ro - factions', '[1] Officer', '[2] Detective', '[3] Sergeant', '[4] Lieutenant', '[5] Captain', '[6] Assistant Chief', '[7] Chief', 0, 0, 50, 15, 2305.63, 2434.14, 10.8203, '50 15 0', '40 13 10', '30 10 8', '20 7 6', '15 5 5', '10 0 0', '0 0 0', 2305.68, 2436.92, 10.5474, 2284.09, 2440.85, 47.1543, 176.846, 180.687),
(15, 'Uber Company', 938.703, 1733.45, 8.852, 1701.24, -1668.03, 20.2188, 18, 15, 'rpg.b-hood.ro - factions', '[1] Driver', '[2] Driver Advanced', '[3] Driver Expert', '[4] Supervisor', '[5] Manager', '# Vice-Director', '# Director', 0, 1, 50, 10, 947.796, 1720.27, 8.85156, '45|25|0', '30|20|0', '30|15|0', '20|10|0', '10|10|0', '10|0|0', '0|0|0', 945.808, 1711.35, 8.56875, 0, 0, 0, 270.757, 0),
(16, 'School Instructors LV', 2427.6, 1662.88, 10.8203, 1494.49, 1304.18, 1093.29, 3, 16, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 50, 10, 2424.1, 1672.07, 10.8203, '30 0 0', '25 0 0', '20 0 0', '15 0 0', '10 0 0', '5 0 0', '0 0 0', 2398.94, 1658.53, 10.5474, 2395.81, 1687.54, 19.523, 179.164, 183.556),
(17, 'Verdant Family', 1122.89, -2037, 69.894, 2544.49, -1304.77, 1054.64, 2, 17, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 1, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(18, 'The Rifa', 2632.32, 2350.61, 10.8203, 2544.49, -1304.77, 1054.64, 2, 18, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 1, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(19, 'San Fierro Police Department', -1605.64, 711.33, 13.8672, 246.78, 63.3446, 1003.64, 6, 19, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 50, 15, -1620.3, 685.758, 7.19012, '50 15 0', '40 13 10', '30 10 8', '20 7 6', '15 5 5', '10 0 0', '0 0 0', -1616.74, 651.306, 6.91455, -1681.28, 705.873, 30.7784, 359.312, 270.179),
(20, 'San Fierro Paramedic Departament', -2655.06, 639.121, 14.4531, 1494.46, 1304.12, 1093.29, 3, 19, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 50, 10, -2557.85, 662.084, 14.4531, '70 0 0', '60 0 0', '50 0 0', '35 0 0', '20 0 0', '10 0 0', '0 0 0', -2682.66, 634.186, 14.1806, -2574.74, 642.998, 28.0625, 181.06, 179.732),
(21, 'School Instructors SF', -2065.85, -859.943, 32.1719, 1494.49, 1304.18, 1093.29, 3, 21, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 50, 10, -2099.02, -859.713, 32.1719, '30 0 0', '25 0 0', '20 0 0', '15 0 0', '10 0 0', '5 0 0', '0 0 0', -2125.46, -837.556, 31.7489, -2026.5, -859.932, 32.4219, 269.493, 269.51),
(22, 'Tow Truck Company SF', -2455.75, 503.971, 30.0781, 626.835, -12.0344, 1000.92, 1, 22, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 1, 50, 10, -2446.33, 522.941, 30.2019, '25 40 35', '20 35 30', '15 30 25', '10 25 20', '10 20 15', '5 5 5', '0 0 0', -2440.77, 523.337, 29.6372, 0, 0, 0, 180.063, 0),
(23, 'Yango', -2665.65, -5.4771, 6.1328, 1701.24, -1668.03, 20.2188, 18, 23, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 50, 15, -2692.23, -35.6604, 4.33594, '45|25|0', '30|20|0', '30|15|0', '20|10|0', '10|10|0', '10|0|0', '0 0 0', -2683.3, -55.323, 4.06306, -2648.48, -30.2745, 6.32195, 0.721721, 179.277),
(24, 'Special Guard', -2281.96, 2288.39, 4.974, 288.763, 167.704, 1007.17, 3, 24, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 50, 15, -2286.12, 2282.57, 4.96799, '30 0 0', '25 0 0', '20 0 0', '15 0 0', '10 0 0', '5 0 0', '0 0 0', -2260.67, 2287.61, 4.81466, 0, 0, 0, 359.563, 0),
(25, 'SF Bikers', -2463.01, 132.31, 35.1719, 2544.49, -1304.77, 1054.64, 2, 25, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(26, 'Camorra Family', -2624.65, 1412.26, 7.0938, 2544.49, -1304.77, 1054.64, 2, 26, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Rank7', 0, 0, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0),
(27, 'Avispa Cartel', -2521.21, -624.953, 132.784, 2544.49, -1304.77, 1054.64, 2, 27, 'rpg.b-hood.ro - factions', 'Rank1', 'Rank2', 'Rank3', 'Rank4', 'Rank5', 'Rank6', 'Admin', 0, 0, 20, 20, 0, 0, 0, '150000|10000|0', '130000|10000|0', '110000|10000|0', '100000|10000|0', '100000|5000|0', '50000|5000|0', '0|0|0', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faction_apply`
--

CREATE TABLE `faction_apply` (
  `ID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 1,
  `I1` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I2` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I3` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I4` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I5` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I6` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I7` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I8` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I9` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I10` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I11` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I12` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I13` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I14` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `I15` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faction_logs`
--

CREATE TABLE `faction_logs` (
  `id` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `leader` int(11) NOT NULL,
  `Text` text NOT NULL,
  `time` varchar(30) NOT NULL DEFAULT '01.01.1999 10:00:00',
  `deleted` int(11) NOT NULL,
  `player_name` varchar(32) NOT NULL DEFAULT 'invalid',
  `leader_name` varchar(32) NOT NULL DEFAULT 'invalid',
  `skin` int(11) NOT NULL,
  `faction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `ID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `friendName` varchar(644) NOT NULL,
  `AddBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `garages`
--

CREATE TABLE `garages` (
  `ID` int(11) NOT NULL,
  `EntranceX` float NOT NULL,
  `EntranceY` float NOT NULL,
  `EntranceZ` float NOT NULL,
  `House` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='5';

--
-- Dumping data for table `garages`
--

INSERT INTO `garages` (`ID`, `EntranceX`, `EntranceY`, `EntranceZ`, `House`) VALUES
(1, 835.708, -2146.82, 13.1456, 39);

-- --------------------------------------------------------

--
-- Table structure for table `graffiti`
--

CREATE TABLE `graffiti` (
  `ID` int(10) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Owned` int(10) NOT NULL,
  `RotX` float NOT NULL,
  `RotY` float NOT NULL,
  `RotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `graffiti`
--

INSERT INTO `graffiti` (`ID`, `X`, `Y`, `Z`, `Owned`, `RotX`, `RotY`, `RotZ`) VALUES
(1, 2305.25, -2655.71, 14.162, 0, 0, 0, 90.1),
(2, 2090.94, -2385.01, 14.057, 22, 0, 0, 0),
(3, 1338.57, -2474.36, 8, 22, 0, 0, 90.3),
(4, 1777.58, -2204.82, 14.157, 0, 0, 0, 89.7),
(5, 2510.15, -2218.89, 14.013, 0, 0, 0, 90),
(6, 1811.01, -1920.43, 14.364, 0, 0, 0, 0),
(7, 1938.53, -1865.24, 14, 0, 0, 0, 89.9),
(8, 1215.45, -1817.24, 14.261, 0, 0, 0, 90.2),
(9, 737.673, -1861.63, 6.797, 0, 0, 0, 0),
(10, 160.279, -1765.38, 5.227, 6, 0, 0, 0),
(11, 1802.19, -1572.24, 14.324, 0, 0, 0, -49.7),
(12, 907.403, -1604.06, 14.273, 0, 0, 0, 0),
(13, 2110.71, -1549.33, 3.441, 0, 0, 0, 70),
(14, 555.746, -1439.49, 16.681, 0, 0, 0, 4.1),
(15, 867.688, -1369.66, 14.407, 0, 0, 0, 0),
(16, 1804.31, -1353.77, 16.157, 0, 0, 0, 90),
(17, 1283.06, -1255.35, 14.655, 0, 0, 0, 0),
(18, 1082.57, -1233.34, 16.93, 0, 0, 0, 0),
(19, 415.03, -1305.19, 15.885, 0, 0, 0, -56.2),
(20, 1711.48, -1108.4, 25.058, 0, 0, 0, 90.2),
(21, 1284.88, -1015.55, 32.04, 0, 0, 0, 0),
(22, 815.442, -1010.55, 28.929, 0, 0, 0, 31.4),
(23, 1772.35, 624.128, 11.51, 0, 0, 0, 75.5),
(24, 2656.38, 809.36, 6.006, 0, 0, 0, 0),
(25, 1288.34, 889.246, 7.882, 0, 0, 0, 52),
(27, 1024.04, 1029.28, 12.11, 0, 0, 0, 33.8),
(28, 587.764, 1239.86, 12.679, 0, 0, 0, 30.2),
(29, 1612.47, 923.312, 11.65, 0, 0, 0, 89.9),
(30, 1600.66, 1403.32, 11.771, 0, 0, 0, -43.6),
(31, 2227.24, 1410.76, 11.62, 0, 0, 0, 0),
(32, 2144.12, 1543.5, 11.54, 0, 0, 0, 90),
(33, 2348.73, 1602.14, 11.662, 0, 0, 0, 90),
(34, 1976.37, 1805.32, 13.224, 0, 0, 0, 89.8),
(35, 793.47, 1682.97, 5.921, 0, 0, 0, 0),
(36, 2555.82, 1890.32, 11.912, 0, 0, 0, 0),
(37, 2804.49, 2019.47, 11.53, 0, 0, 0, 90.1),
(38, 2575.23, 2073.44, 11.783, 0, 0, 0, 0),
(39, 925.705, 1735.33, 9.508, 0, 0, 0, 0),
(40, 1027.24, 2376.18, 11.89, 0, 0, 0, 0),
(41, 2342.67, 2503.7, 11.62, 0, 0, 0, 89.9),
(42, 1937.37, 2257.31, 11.64, 0, 0, 0, 0),
(43, 1678.92, 2245.74, 11.68, 0, 0, 0, 0),
(44, 2141.23, 2547.63, 11.38, 0, 0, 0, -75.5),
(45, 2783.11, 2515.28, 11.81, 0, 0, 0, -45),
(46, 2538.4, 2605.42, 5.54, 0, 0, 0, 62.1),
(47, 2098.38, 2741.08, 11.28, 0, 0, 0, 0),
(48, 1986.18, 2786.34, 10.82, 0, 0, 0, 89.4),
(49, -1481.67, -264.638, 14.8384, 0, 0, 0, 81.7999),
(50, -2190.5, -328.439, 36.5364, 0, 0, 0, -90.4999),
(51, -2764.9, -398.587, 7.55112, 0, 0, 0, 89.3),
(52, -2458.86, -164.343, 26.468, 0, 0, 0, 90),
(53, -2716.08, 76.0557, 5.50595, 0, 0, 0, -4.3),
(54, -2693.57, 239.67, 4.86594, 0, 0, 0, 89.9),
(55, -1964.42, 412.928, 35.6518, 0, 0, 0, 89.8),
(56, -2699.78, 553.232, 15.4135, 0, 0, 0, 89.6999),
(57, -1760.54, 765.117, 25.6021, 0, 0, 0, 89.9),
(58, -2399.29, 793.031, 36.016, 0, 0, 0, 0),
(59, -1977.03, 954.454, 45.9853, 0, 0, 0, 0),
(60, -1701.68, 1209.56, 25.8593, 0, 0, 0, 0),
(61, -1589.37, 1277.72, 7.91882, 0, 0, 0, 90.0999),
(62, -2633.13, 1196.42, 35.1719, 0, 0, 0, -49.4),
(63, -2659.26, 1353.84, 8.10933, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int(10) NOT NULL,
  `Entrancex` float NOT NULL,
  `Entrancey` float NOT NULL,
  `Entrancez` float NOT NULL,
  `Exitx` float NOT NULL,
  `Exity` float NOT NULL,
  `Exitz` float NOT NULL,
  `Owner` varchar(25) NOT NULL DEFAULT 'The State',
  `Discription` varchar(50) NOT NULL DEFAULT 'Fara descriere.',
  `Value` int(20) NOT NULL,
  `Hel` int(11) NOT NULL,
  `Arm` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `Lockk` int(11) NOT NULL,
  `Owned` int(11) NOT NULL,
  `Rent` int(11) NOT NULL,
  `Rentabil` int(11) NOT NULL,
  `Takings` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Virtual` int(11) NOT NULL,
  `Radio` int(11) NOT NULL DEFAULT -1,
  `Zise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`ID`, `Entrancex`, `Entrancey`, `Entrancez`, `Exitx`, `Exity`, `Exitz`, `Owner`, `Discription`, `Value`, `Hel`, `Arm`, `Interior`, `Lockk`, `Owned`, `Rent`, `Rentabil`, `Takings`, `Level`, `Virtual`, `Radio`, `Zise`) VALUES
(1, 1673.85, 1447.82, 10.7843, 225.662, 1022.08, 1084.02, 'HAndreiH', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 250, 1, 0, 1, 1, -1, 0),
(2, 2012.29, 919.952, 10.8203, 140.182, 1366.47, 1083.86, 'The State', 'Fara descriere.', 0, 0, 0, 5, 0, 1, 250, 1, 0, 1, 2, -1, 0),
(3, 2006.82, 1167.48, 10.8203, 234.203, 1064.15, 1084.21, 'The State', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 250, 1, 0, 1, 3, -1, 0),
(4, 2238.9, 1285.52, 10.8203, 140.182, 1366.47, 1083.86, 'The State', 'Fara descriere.', 0, 0, 0, 5, 0, 1, 250, 1, 0, 1, 4, -1, 0),
(5, 2364.44, 2377.49, 10.8203, 225.662, 1022.08, 1084.02, 'The State', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 250, 1, 0, 1, 5, -1, 0),
(6, 1319.1, 1249.48, 10.8203, 234.203, 1064.15, 1084.21, 'The State', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 250, 1, 0, 1, 6, -1, 0),
(7, 1624.66, 1018.31, 10.8203, 2282.79, -1139.4, 1050.9, 'The State', 'Fara descriere.', 0, 0, 0, 11, 0, 1, 250, 1, 0, 1, 7, -1, 0),
(8, 1845.76, 741.383, 11.4609, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 8, -1, 0),
(9, 2397.59, 656.107, 11.4609, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 9, -1, 0),
(10, 2581.27, 1060.55, 11.7815, 300.862, 309.887, 1003.3, 'The State', 'Fara descriere.', 0, 0, 0, 4, 0, 1, 250, 1, 0, 1, 10, -1, 0),
(11, 1497.02, -687.897, 95.5633, 225.662, 1022.08, 1084.02, 'The State', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 250, 1, 0, 1, 11, -1, 0),
(12, 980.489, -677.259, 121.976, 225.662, 1022.08, 1084.02, 'The State', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 250, 1, 0, 1, 12, -1, 0),
(13, 300.277, -1154.49, 81.3905, 225.662, 1022.08, 1084.02, 'The State', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 250, 1, 0, 1, 13, -1, 0),
(14, 416.747, -1154.17, 76.6876, 234.203, 1064.15, 1084.21, 'The State', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 250, 1, 0, 1, 14, -1, 0),
(15, 2818.31, 2415.34, 11.0625, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 15, -1, 0),
(16, 2826.76, 2203.61, 11.0234, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 16, -1, 0),
(17, 2546.57, 1972.64, 10.8203, 328.003, 1478.55, 1084.44, 'The State', 'Fara descriere.', 0, 0, 0, 15, 0, 1, 250, 1, 0, 1, 17, -1, 0),
(18, 2167.16, 2164.57, 10.8203, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 18, -1, 0),
(19, 168.094, -1769.07, 4.47643, 234.203, 1064.15, 1084.21, 'The State', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 250, 1, 0, 1, 19, -1, 0),
(20, 315.875, -1769.43, 4.62261, 226.705, 1114.25, 1080.99, 'mihaitoma', 'baross', 0, 1, 0, 5, 0, 1, 250, 1, 0, 1, 20, -1, 0),
(21, 1382.14, -1088.79, 28.2066, 225.662, 1022.08, 1084.02, 'The State', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 250, 1, 0, 1, 21, -1, 0),
(22, 1421.75, -886.227, 50.6861, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 22, -1, 0),
(23, 1540.47, -851.381, 64.3361, 223.08, 1287.74, 1082.14, 'The State', 'Fara descriere.', 0, 0, 0, 1, 0, 1, 250, 1, 0, 1, 23, -1, 0),
(24, 1045.11, -642.947, 120.117, 235.407, 1187.37, 1080.26, 'The State', 'Fara descriere.', 0, 0, 0, 3, 0, 1, 250, 1, 0, 1, 24, -1, 0),
(25, 848.729, -1817.99, 12.1938, 140.182, 1366.47, 1083.86, 'The State', 'Fara descriere.', 0, 0, 0, 5, 0, 1, 250, 1, 0, 1, 25, -1, 0),
(26, 821.93, -1757.84, 13.6484, 234.203, 1064.15, 1084.21, 'The State', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 0, 0, 0, 1, 26, -1, 0),
(27, 725.797, -1440.45, 13.5391, 490.865, 1399.2, 1080.26, 'The State', 'Fara descriere.', 0, 0, 0, 2, 0, 1, 0, 0, 0, 1, 27, -1, 0),
(28, 1566.66, 23.294, 24.1641, 225.662, 1022.08, 1084.02, 'HAndreiH', 'Fara descriere.', 0, 0, 0, 7, 0, 1, 0, 0, 0, 1, 28, -1, 0),
(29, 1685.02, -2099.02, 13.8343, 234.203, 1064.15, 1084.21, 'HAndreiH', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 0, 1, 0, 10, 29, -1, 0),
(30, 2177.88, 655.857, 11.4609, 2365.34, -1134.84, 1050.88, 'The State', 'Fara descriere.', 250000000, 0, 0, 8, 0, 0, 0, 0, 0, 10, 30, -1, 0),
(31, 2111.34, 1002.86, 11.0725, 490.865, 1399.2, 1080.26, 'The State', 'Fara descriere.', 250000000, 0, 0, 2, 0, 0, 0, 0, 0, 10, 31, -1, 0),
(32, 2019.8, 1007.65, 10.8203, 234.203, 1064.15, 1084.21, 'The State', 'Fara descriere.', 300000000, 0, 0, 6, 0, 0, 0, 0, 0, 10, 32, -1, 0),
(33, 1280.62, -813.754, 83.6623, 225.662, 1022.08, 1084.02, 'The State', 'Fara descriere.', 300000000, 0, 0, 7, 0, 0, 0, 0, 0, 10, 33, -1, 0),
(34, 228.305, -1405.21, 51.6094, 2496.02, -1692.68, 1014.74, 'The State', 'Fara descriere.', 300000000, 0, 0, 3, 0, 0, 0, 0, 0, 10, 34, -1, 0),
(35, 298.699, -1338.18, 53.4415, 2365.34, -1134.84, 1050.88, 'The State', 'Fara descriere.', 300000000, 0, 0, 8, 0, 0, 0, 0, 0, 10, 35, -1, 0),
(36, 423.864, 2536.45, 16.1484, 2308.81, -1212.24, 1049.02, 'AlexandruTnT1', 'Fara descriere.', 0, 1, 0, 6, 0, 1, 0, 1, 0, 10, 36, 1, 0),
(37, 2113.76, 2499.3, 14.839, 226.705, 1114.25, 1080.99, 'The State', 'Fara descriere.', 100000000, 0, 0, 5, 0, 0, 0, 0, 0, 10, 37, -1, 0),
(38, 24.6618, -1728.62, 14.7238, 226.705, 1114.25, 1080.99, 'The State', 'Fara descriere.', 1, 0, 0, 5, 0, 0, 0, 0, 0, 1, 38, -1, 0),
(39, 839.165, -2152.17, 13.5297, 234.203, 1064.15, 1084.21, 'cibu', 'Fara descriere.', 0, 0, 0, 6, 0, 1, 0, 0, 0, 100, 39, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `iplogs`
--

CREATE TABLE `iplogs` (
  `ID` int(11) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `playerid` int(24) NOT NULL,
  `time` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `iplogs`
--

INSERT INTO `iplogs` (`ID`, `ip`, `playerid`, `time`) VALUES
(1, '127.0.0.1', 1, '23/3/2023 19:40:00'),
(2, '127.0.0.1', 1, '23/3/2023 19:42:29'),
(3, '127.0.0.1', 1, '23/3/2023 19:46:59'),
(4, '127.0.0.1', 1, '23/3/2023 19:50:38'),
(5, '127.0.0.1', 1, '23/3/2023 19:53:50'),
(6, '127.0.0.1', 1, '23/3/2023 19:55:25'),
(7, '127.0.0.1', 1, '23/3/2023 19:56:41'),
(8, '127.0.0.1', 1, '23/3/2023 19:58:30'),
(9, '127.0.0.1', 1, '23/3/2023 20:01:06'),
(10, '127.0.0.1', 1, '23/3/2023 20:01:37'),
(11, '127.0.0.1', 1, '23/3/2023 20:03:47'),
(12, '127.0.0.1', 1, '23/3/2023 20:05:09'),
(13, '127.0.0.1', 1, '23/3/2023 20:10:16'),
(14, '127.0.0.1', 1, '23/3/2023 20:11:40'),
(15, '127.0.0.1', 1, '23/3/2023 20:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `ID` int(10) NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT 'No name',
  `Description` varchar(64) NOT NULL DEFAULT 'b-hood.ro',
  `NeedLevel` int(10) NOT NULL,
  `Legal` int(10) NOT NULL,
  `Skill1Veh` int(10) NOT NULL DEFAULT 400,
  `Skill2Veh` int(10) NOT NULL DEFAULT 400,
  `Skill3Veh` int(10) NOT NULL DEFAULT 400,
  `Skill4Veh` int(10) NOT NULL DEFAULT 400,
  `Skill5Veh` int(10) NOT NULL DEFAULT 400,
  `Skill6Veh` int(10) NOT NULL DEFAULT 400,
  `Owner` varchar(24) NOT NULL DEFAULT 'None',
  `Userid` int(11) NOT NULL,
  `WorkPos` varchar(100) NOT NULL DEFAULT '0.0,0.0,0.0',
  `Pos` varchar(100) NOT NULL DEFAULT '0.0,0.0,0.0',
  `Balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`ID`, `Name`, `Description`, `NeedLevel`, `Legal`, `Skill1Veh`, `Skill2Veh`, `Skill3Veh`, `Skill4Veh`, `Skill5Veh`, `Skill6Veh`, `Owner`, `Userid`, `WorkPos`, `Pos`, `Balance`) VALUES
(1, 'Farmer', 'b-hood.ro', 1, 1, 531, 531, 531, 531, 531, 531, 'cibu', 0, '-84.3012,45.7011,3.1172', '-95.1542,25.3176,3.1172', 104224),
(2, 'Trucker', 'b-hood.ro', 1, 1, 515, 515, 515, 515, 515, 515, 'HAndreiH', 0, '2430.5615,-2207.2661,13.5469', '2415.4604,-2228.9482,13.5469', 2376993),
(3, 'Lumberjack', 'b-hood.ro', 1, 1, 478, 478, 478, 478, 478, 478, 'None', 0, '-589.4131,-1078.9364,23.4845', '-601.1035,-1065.3776,23.4033', -263352186),
(4, 'Garbage Man', 'b-hood.ro', 1, 1, 408, 408, 408, 408, 408, 408, 'None', 0, '2521.5334,2793.2646,10.8203', '2502.9802,2778.5674,10.8203', 5115206),
(5, 'Arms Dealer', 'b-hood.ro', 2, 3, 400, 400, 400, 400, 400, 400, 'None', 0, '2798.1772,1976.6501,10.8203', '2810.8726,1987.0040,10.8203', 2502949),
(6, 'Drugs Dealer', 'b-hood.ro', 3, 0, 400, 400, 400, 400, 400, 411, 'None', 0, '-807.8198,2430.9902,156.9962', '-797.0580,2439.1462,157.0806', 4815807),
(7, 'Quarry Worker', 'b-hood.ro', 3, 1, 400, 400, 400, 400, 400, 400, 'None', 0, '839.6926,888.8485,13.3516', '816.6052,856.5006,12.7891', 0),
(8, 'Detective', 'b-hood.ro', 5, 1, 400, 400, 400, 400, 400, 400, 'None', 0, '0.0,0.0,0.0', '-2056.7822,454.7194,35.1719', 0),
(9, 'Pizza Boy', 'b-hood.ro', 1, 1, 448, 448, 448, 448, 448, 448, 'None', 0, '2631.8708,1845.4863,10.8203', '2638.7864,1849.7213,11.0234', 68731),
(10, 'Courier', 'b-hood.ro', 1, 1, 482, 499, 499, 499, 499, 499, 'None', 0, '2805.2300,967.9019,10.7500', '2814.7793,972.6347,10.7500', 0),
(11, 'Fisher LV', 'b-hood.ro', 1, 1, 400, 400, 400, 400, 400, 400, 'None', 0, '0.0,0.0,0.0', '2325.4380,556.3793,8.4116', 134721),
(12, 'Forklift', 'b-hood.ro', 1, 1, 530, 530, 530, 530, 530, 530, 'None', 0, '972.0071,2125.2549,10.8203', '966.9892,2133.0393,10.8203', 0),
(13, 'Fisher LS', 'b-hood.ro', 1, 1, 400, 400, 400, 400, 400, 400, 'None', 0, '0.0,0.0,0.0', '401.6425,-2070.5994,10.7423', 0),
(14, 'Bus Driver', 'b-hood.ro', 1, 1, 437, 437, 437, 437, 437, 437, 'None', 0, '2828.9609,1328.1018,10.7708', '2840.7317,1318.4473,11.3906', 0),
(15, 'Glovo', 'b-hood.ro', 3, 0, 510, 510, 510, 510, 468, 468, 'None', 0, '-2460.2925,741.7111,34.6232', '-2471.6094,756.4418,35.1786', 299815),
(16, 'Fisher SF', 'b-hood.ro', 1, 1, 400, 400, 400, 400, 400, 400, 'None', 0, '0.0,0.0,0.0', '-2960.9246,476.9930,5.4050', 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `ID` int(10) NOT NULL,
  `Userid` int(10) NOT NULL,
  `Text` varchar(256) NOT NULL,
  `Date` varchar(256) NOT NULL,
  `Type` int(10) NOT NULL,
  `IP` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`ID`, `Userid`, `Text`, `Date`, `Type`, `IP`) VALUES
(1, 1, '(chat) .v', '23/03/2023 - 19:42:36', 9, '127.0.0.1'),
(2, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $40.000 | pp: 49750 | bp: 0]', '23/03/2023 - 19:46:59', 4, '127.0.0.1'),
(3, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $40.000 | pp: 49500 | bp: 0]', '23/03/2023 - 19:50:38', 4, '127.0.0.1'),
(4, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $40.000 | pp: 49500 | bp: 0]', '23/03/2023 - 19:53:50', 4, '127.0.0.1'),
(5, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $40.000 | pp: 49500 | bp: 0]', '23/03/2023 - 19:55:25', 4, '127.0.0.1'),
(6, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $40.000 | pp: 49500 | bp: 0]', '23/03/2023 - 19:56:41', 4, '127.0.0.1'),
(7, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $40.000 | pp: 49500 | bp: 0]', '23/03/2023 - 19:58:30', 4, '127.0.0.1'),
(8, 1, 'cibu(0) s-a logat pe server. [money: $50.000 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:01:06', 4, '127.0.0.1'),
(9, 1, 'cibu(0) s-a deconectat de pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:01:21', 4, '127.0.0.1'),
(10, 1, 'cibu(0) s-a logat pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:01:37', 4, '127.0.0.1'),
(11, 1, 'cibu(0) s-a logat pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:03:47', 4, '127.0.0.1'),
(12, 1, 'cibu(0) s-a logat pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:05:09', 4, '127.0.0.1'),
(13, 1, 'cibu(0) s-a logat pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:10:16', 4, '127.0.0.1'),
(14, 1, 'cibu(0) s-a logat pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:11:40', 4, '127.0.0.1'),
(15, 1, 'cibu(0) s-a logat pe server. [money: $49.900 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:14:14', 4, '127.0.0.1'),
(16, 1, 'cibu(0) s-a deconectat de pe server. [money: $51.137 | bank: $753.923 | pp: 49500 | bp: 0]', '23/03/2023 - 20:17:26', 4, '255.255.255.255');

-- --------------------------------------------------------

--
-- Table structure for table `money_logs`
--

CREATE TABLE `money_logs` (
  `ID` int(11) NOT NULL,
  `Name` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `reasonAction` varchar(128) DEFAULT NULL,
  `Time` varchar(64) NOT NULL DEFAULT '1999-1-1 10:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_queue`
--

CREATE TABLE `panel_queue` (
  `ID` int(11) NOT NULL,
  `Username` varchar(32) NOT NULL DEFAULT '',
  `AdminName` varchar(32) NOT NULL DEFAULT '',
  `playerid` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Reason` varchar(64) NOT NULL,
  `Amount` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `safezones`
--

CREATE TABLE `safezones` (
  `ID` int(10) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Range` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `safezones`
--

INSERT INTO `safezones` (`ID`, `X`, `Y`, `Z`, `Range`) VALUES
(1, -84.345, 45.553, 3.117, 200),
(2, 2415.43, -2228.98, 13.547, 50),
(3, -625.821, -1599.85, 22.474, 50),
(4, 803.251, 850.394, 9.337, 200),
(5, 2326.11, 549.03, 13.032, 80),
(6, 990.614, 2130.2, 10.82, 60),
(7, 381.855, -2056.03, 7.836, 65),
(8, 2130.98, 1403.43, 11.133, 50),
(9, 288.763, 167.704, 1007.17, 18),
(10, 2815.38, 970.555, 10.75, 15),
(11, 1363.3, -1282.68, 13.5469, 15),
(12, 1536.12, -1671.33, 13.3828, 21),
(13, 2126.84, 2364.89, 10.8203, 100),
(14, 2126.71, 2363.9, 10.8203, 15),
(15, 1468.56, -1010.35, 26.8438, 15),
(16, 1468.56, -1010.35, 26.8438, 15),
(17, 2196.53, 1677.18, 12.3672, 15),
(18, -2390.28, -589.355, 132.516, 50);

-- --------------------------------------------------------

--
-- Table structure for table `sanctions`
--

CREATE TABLE `sanctions` (
  `ID` int(10) NOT NULL,
  `Player` varchar(256) NOT NULL,
  `By` varchar(256) NOT NULL,
  `Time` varchar(256) NOT NULL,
  `Userid` int(10) NOT NULL,
  `Type` int(10) NOT NULL,
  `Reason` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sanctions`
--

INSERT INTO `sanctions` (`ID`, `Player`, `By`, `Time`, `Userid`, `Type`, `Reason`) VALUES
(1, 'cibu (1)', 'AdmBot (-1)', '18/08/2022 - 00:57:36', 1, 1, 'Teleport to checkpoint.'),
(2, 'cibu (1)', 'AdmBot (-1)', '18/08/2022 - 13:40:00', 1, 1, 'Teleport to checkpoint.'),
(3, 'cibu (1)', 'AdmBot (-1)', '18/08/2022 - 15:19:24', 1, 1, 'Teleport to checkpoint.'),
(4, 'cibu (1)', 'AdmBot (-1)', '19/08/2022 - 18:06:47', 1, 1, 'Teleport to checkpoint.'),
(5, 'cibu (4)', 'AdmBot (-1)', '19/08/2022 - 22:10:48', 4, 1, 'Teleport to checkpoint.'),
(6, 'cibu (4)', 'AdmBot (-1)', '19/08/2022 - 22:12:00', 4, 1, 'Teleport to checkpoint.'),
(7, 'cibu (1)', 'AdmBot (-1)', '19/08/2022 - 23:26:17', 1, 1, 'Teleport to checkpoint.'),
(8, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 18:20:21', 1, 1, 'Teleport to checkpoint.'),
(9, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 18:22:34', 1, 1, 'Teleport to checkpoint.'),
(10, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 18:25:10', 1, 1, 'Teleport to checkpoint.'),
(11, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 18:36:34', 1, 1, 'Teleport to checkpoint.'),
(12, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 18:38:50', 1, 1, 'Teleport to checkpoint.'),
(13, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 18:43:27', 1, 1, 'Teleport to checkpoint.'),
(14, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:10:08', 1, 1, 'Teleport to checkpoint.'),
(15, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:14:05', 1, 1, 'Teleport to checkpoint.'),
(16, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:17:24', 1, 1, 'Teleport to checkpoint.'),
(17, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:21:11', 1, 1, 'Teleport to checkpoint.'),
(18, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:25:44', 1, 1, 'Teleport to checkpoint.'),
(19, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:32:13', 1, 1, 'Teleport to checkpoint.'),
(20, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 19:34:32', 1, 1, 'Teleport to checkpoint.'),
(21, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:02:25', 1, 1, 'Teleport to checkpoint.'),
(22, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:06:44', 1, 1, 'Teleport to checkpoint.'),
(23, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:10:59', 1, 1, 'Teleport to checkpoint.'),
(24, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:14:30', 1, 1, 'Teleport to checkpoint.'),
(25, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:17:53', 1, 1, 'Teleport to checkpoint.'),
(26, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:19:31', 1, 1, 'Teleport to checkpoint.'),
(27, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:24:46', 1, 1, 'Teleport to checkpoint.'),
(28, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:41:45', 1, 1, 'Teleport to checkpoint.'),
(29, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:43:37', 1, 1, 'Teleport to checkpoint.'),
(30, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:49:09', 1, 1, 'Teleport to checkpoint.'),
(31, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:51:05', 1, 1, 'Teleport to checkpoint.'),
(32, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 20:56:33', 1, 1, 'Teleport to checkpoint.'),
(33, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:01:24', 1, 1, 'Teleport to checkpoint.'),
(34, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:02:46', 1, 1, 'Teleport to checkpoint.'),
(35, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:29:59', 1, 1, 'Teleport to checkpoint.'),
(36, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:32:59', 1, 1, 'Teleport to checkpoint.'),
(37, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:34:48', 1, 1, 'Teleport to checkpoint.'),
(38, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:37:54', 1, 1, 'Teleport to checkpoint.'),
(39, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:39:52', 1, 1, 'Teleport to checkpoint.'),
(40, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:42:28', 1, 1, 'Teleport to checkpoint.'),
(41, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:44:11', 1, 1, 'Teleport to checkpoint.'),
(42, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:47:22', 1, 1, 'Teleport to checkpoint.'),
(43, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:49:33', 1, 1, 'Teleport to checkpoint.'),
(44, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:51:29', 1, 1, 'Teleport to checkpoint.'),
(45, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:53:17', 1, 1, 'Teleport to checkpoint.'),
(46, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:54:20', 1, 1, 'Teleport to checkpoint.'),
(47, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:55:29', 1, 1, 'Teleport to checkpoint.'),
(48, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 21:56:39', 1, 1, 'Teleport to checkpoint.'),
(49, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:00:39', 1, 1, 'Teleport to checkpoint.'),
(50, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:02:06', 1, 1, 'Teleport to checkpoint.'),
(51, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:05:25', 1, 1, 'Teleport to checkpoint.'),
(52, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:07:09', 1, 1, 'Teleport to checkpoint.'),
(53, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:12:54', 1, 1, 'Teleport to checkpoint.'),
(54, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:22:00', 1, 1, 'Teleport to checkpoint.'),
(55, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 22:23:22', 1, 1, 'Teleport to checkpoint.'),
(56, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 23:42:39', 1, 1, 'Teleport to checkpoint.'),
(57, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 23:43:56', 1, 1, 'Teleport to checkpoint.'),
(58, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 23:46:12', 1, 1, 'Teleport to checkpoint.'),
(59, 'cibu (1)', 'AdmBot (-1)', '20/08/2022 - 23:47:31', 1, 1, 'Teleport to checkpoint.'),
(60, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 00:08:42', 1, 1, 'Teleport to checkpoint.'),
(61, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 00:25:47', 1, 1, 'Teleport to checkpoint.'),
(62, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 00:29:27', 1, 1, 'Teleport to checkpoint.'),
(63, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 00:31:45', 1, 1, 'Teleport to checkpoint.'),
(64, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 00:34:56', 1, 1, 'Teleport to checkpoint.'),
(65, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 15:56:01', 1, 1, 'Teleport to checkpoint.'),
(66, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 16:07:17', 1, 1, 'Teleport to checkpoint.'),
(67, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 16:09:25', 1, 1, 'Teleport to checkpoint.'),
(68, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 16:44:15', 1, 1, 'Teleport to checkpoint.'),
(69, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 16:45:56', 1, 1, 'Teleport to checkpoint.'),
(70, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 16:57:38', 1, 1, 'Teleport to checkpoint.'),
(71, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 16:58:55', 1, 1, 'Teleport to checkpoint.'),
(72, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:01:02', 1, 1, 'Teleport to checkpoint.'),
(73, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:02:09', 1, 1, 'Teleport to checkpoint.'),
(74, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:04:32', 1, 1, 'Teleport to checkpoint.'),
(75, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:07:53', 1, 1, 'Teleport to checkpoint.'),
(76, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:16:58', 1, 1, 'Teleport to checkpoint.'),
(77, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:18:31', 1, 1, 'Teleport to checkpoint.'),
(78, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:18:55', 1, 1, 'Teleport to checkpoint.'),
(79, 'cibu (1)', 'AdmBot (-1)', '21/08/2022 - 17:21:38', 1, 1, 'Teleport to checkpoint.'),
(80, 'cibu (1)', 'AdmBot (-1)', '23/09/2022 - 17:23:24', 1, 1, 'Teleport to checkpoint.'),
(81, 'cibu (1)', 'AdmBot (-1)', '27/09/2022 - 20:39:32', 1, 1, 'Teleport to checkpoint.'),
(82, 'cibu (1)', 'AdmBot (-1)', '27/09/2022 - 21:44:35', 1, 1, 'Teleport to checkpoint.'),
(83, 'cibu (1)', 'AdmBot (-1)', '28/09/2022 - 21:07:50', 1, 1, 'Teleport to checkpoint.'),
(84, 'cibu (1)', 'AdmBot (-1)', '28/09/2022 - 21:12:27', 1, 1, 'Teleport to checkpoint.'),
(85, 'cibu (1)', 'AdmBot (-1)', '28/09/2022 - 21:16:15', 1, 1, 'Teleport to checkpoint.'),
(86, 'cibu (1)', 'AdmBot (-1)', '28/09/2022 - 21:58:22', 1, 1, 'Teleport to checkpoint.'),
(87, 'cibu (1)', 'AdmBot (-1)', '28/09/2022 - 22:42:48', 1, 1, 'Teleport to checkpoint.'),
(88, 'cibu (1)', 'AdmBot (-1)', '02/10/2022 - 22:47:05', 1, 1, 'Teleport to checkpoint.'),
(89, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 20:46:28', 1, 1, 'Cheats (Dialog-Hider)'),
(90, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 20:47:39', 1, 1, 'Cheats (Dialog-Hider)'),
(91, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:08:10', 1, 1, 'Cheats (Dialog-Hider)'),
(92, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:09:43', 1, 1, 'Cheats (Dialog-Hider)'),
(93, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:13:27', 1, 1, 'Cheats (Dialog-Hider)'),
(94, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:14:46', 1, 1, 'Cheats (Dialog-Hider)'),
(95, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:15:02', 1, 1, 'Cheats (Dialog-Hider)'),
(96, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:23:51', 1, 1, 'Cheats (Dialog-Hider)'),
(97, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:24:56', 1, 1, 'Cheats (Dialog-Hider)'),
(98, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:25:10', 1, 1, 'Cheats (Dialog-Hider)'),
(99, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 21:25:47', 1, 1, 'Cheats (Dialog-Hider)'),
(100, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:51:01', 1, 1, 'Cheats (Dialog-Hider)'),
(101, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:51:15', 1, 1, 'Cheats (Dialog-Hider)'),
(102, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:51:19', 1, 1, 'Cheats (Dialog-Hider)'),
(103, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:51:26', 1, 1, 'Cheats (Dialog-Hider)'),
(104, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:52:14', 1, 1, 'Cheats (Dialog-Hider)'),
(105, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:52:35', 1, 1, 'Cheats (Dialog-Hider)'),
(106, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:54:36', 1, 1, 'Cheats (Dialog-Hider)'),
(107, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:54:42', 1, 1, 'Cheats (Dialog-Hider)'),
(108, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:54:51', 1, 1, 'Cheats (Dialog-Hider)'),
(109, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:58:12', 1, 1, 'Cheats (Dialog-Hider)'),
(110, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 22:58:22', 1, 1, 'Cheats (Dialog-Hider)'),
(111, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:00:14', 1, 1, 'Cheats (Dialog-Hider)'),
(112, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:02:03', 1, 1, 'Cheats (Dialog-Hider)'),
(113, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:02:09', 1, 1, 'Cheats (Dialog-Hider)'),
(114, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:03:32', 1, 1, 'Teleport to checkpoint.'),
(115, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:07:58', 1, 1, 'Cheats (Dialog-Hider)'),
(116, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:10:51', 1, 1, 'Cheats (Dialog-Hider)'),
(117, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:10:59', 1, 1, 'Cheats (Dialog-Hider)'),
(118, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:11:03', 1, 1, 'Cheats (Dialog-Hider)'),
(119, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:11:11', 1, 1, 'Cheats (Dialog-Hider)'),
(120, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:11:19', 1, 1, 'Cheats (Dialog-Hider)'),
(121, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:11:35', 1, 1, 'Cheats (Dialog-Hider)'),
(122, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:11:45', 1, 1, 'Cheats (Dialog-Hider)'),
(123, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:12:28', 1, 1, 'Cheats (Dialog-Hider)'),
(124, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:12:30', 1, 1, 'Cheats (Dialog-Hider)'),
(125, 'cibu (1)', 'AdmBot (-1)', '03/10/2022 - 23:12:48', 1, 1, 'Cheats (Dialog-Hider)'),
(126, 'cibu (1)', 'AdmBot (-1)', '04/10/2022 - 22:03:58', 1, 1, 'Cheats (Dialog-Hider)'),
(127, 'cibu (1)', 'AdmBot (-1)', '04/10/2022 - 22:04:17', 1, 1, 'Cheats (Dialog-Hider)'),
(128, 'cibu (1)', 'AdmBot (-1)', '04/10/2022 - 22:05:06', 1, 1, 'Cheats (Dialog-Hider)'),
(129, 'cibu (1)', 'AdmBot (-1)', '04/10/2022 - 22:05:38', 1, 1, 'Cheats (Dialog-Hider)'),
(130, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 00:16:28', 1, 1, 'Cheats (Dialog-Hider)'),
(131, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 00:16:30', 1, 1, 'Cheats (Dialog-Hider)'),
(132, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 01:46:48', 1, 1, 'Cheats (Dialog-Hider)'),
(133, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 01:48:33', 1, 1, 'Cheats (Dialog-Hider)'),
(134, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 01:49:15', 1, 1, 'Cheats (Dialog-Hider)'),
(135, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 01:49:42', 1, 1, 'Cheats (Dialog-Hider)'),
(136, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 01:51:25', 1, 1, 'Cheats (Dialog-Hider)'),
(137, 'cibu (1)', 'AdmBot (-1)', '05/10/2022 - 01:51:28', 1, 1, 'Cheats (Dialog-Hider)'),
(138, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:08:55', 1, 1, 'Cheats (Dialog-Hider)'),
(139, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:09:00', 1, 1, 'Cheats (Dialog-Hider)'),
(140, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:09:02', 1, 1, 'Cheats (Dialog-Hider)'),
(141, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:09:06', 1, 1, 'Cheats (Dialog-Hider)'),
(142, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:10:16', 1, 1, 'Cheats (Dialog-Hider)'),
(143, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:12:06', 1, 1, 'Cheats (Dialog-Hider)'),
(144, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:12:09', 1, 1, 'Cheats (Dialog-Hider)'),
(145, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:12:29', 1, 1, 'Cheats (Dialog-Hider)'),
(146, 'cibu (1)', 'AdmBot (-1)', '07/10/2022 - 19:13:22', 1, 1, 'Cheats (Dialog-Hider)'),
(147, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:48:07', 1, 1, 'Cheats (Dialog-Hider)'),
(148, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:48:15', 1, 1, 'Cheats (Dialog-Hider)'),
(149, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:48:18', 1, 1, 'Cheats (Dialog-Hider)'),
(150, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:48:23', 1, 1, 'Cheats (Dialog-Hider)'),
(151, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:49:16', 1, 1, 'Cheats (Dialog-Hider)'),
(152, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:49:19', 1, 1, 'Cheats (Dialog-Hider)'),
(153, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:49:22', 1, 1, 'Cheats (Dialog-Hider)'),
(154, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:49:34', 1, 1, 'Cheats (Dialog-Hider)'),
(155, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:49:45', 1, 1, 'Teleport to checkpoint.'),
(156, 'cibu (1)', 'AdmBot (-1)', '08/10/2022 - 14:49:54', 1, 1, 'Teleport to checkpoint.'),
(157, 'cibu (1)', 'AdmBot (-1)', '09/10/2022 - 13:18:07', 1, 1, 'Cheats (Dialog-Hider)'),
(158, 'cibu (1)', 'AdmBot (-1)', '09/10/2022 - 13:49:42', 1, 1, 'Cheats (Dialog-Hider)'),
(159, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 16:21:24', 1, 1, 'Cheats (Dialog-Hider)'),
(160, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:02:29', 1, 1, 'Cheats (Dialog-Hider)'),
(161, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:02:56', 1, 1, 'Cheats (Dialog-Hider)'),
(162, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:12:16', 1, 1, 'Cheats (Dialog-Hider)'),
(163, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:13:00', 1, 1, 'Cheats (Dialog-Hider)'),
(164, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:13:06', 1, 1, 'Cheats (Dialog-Hider)'),
(165, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:20:44', 1, 1, 'Cheats (Dialog-Hider)'),
(166, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:21:00', 1, 1, 'Cheats (Dialog-Hider)'),
(167, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:24:23', 1, 1, 'Cheats (Dialog-Hider)'),
(168, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:24:25', 1, 1, 'Cheats (Dialog-Hider)'),
(169, 'cibu (1)', 'AdmBot (-1)', '16/10/2022 - 19:28:54', 1, 1, 'Cheats (Dialog-Hider)'),
(170, 'cibu (1)', 'AdmBot (-1)', '20/10/2022 - 23:16:40', 1, 1, 'Cheats (Dialog-Hider)'),
(171, 'cibu (1)', 'AdmBot (-1)', '20/10/2022 - 23:16:43', 1, 1, 'Cheats (Dialog-Hider)'),
(172, 'cibu (1)', 'AdmBot (-1)', '20/10/2022 - 23:18:38', 1, 1, 'Cheats (Dialog-Hider)'),
(173, 'cibu (1)', 'AdmBot (-1)', '20/10/2022 - 23:19:19', 1, 1, 'Cheats (Dialog-Hider)'),
(174, 'cibu (1)', 'AdmBot (-1)', '20/10/2022 - 23:19:22', 1, 1, 'Cheats (Dialog-Hider)'),
(175, 'cibu (1)', 'AdmBot (-1)', '21/10/2022 - 23:17:01', 1, 1, 'Teleport to checkpoint.'),
(176, 'cibu (1)', 'AdmBot (-1)', '21/10/2022 - 23:28:11', 1, 1, 'Teleport to checkpoint.'),
(177, 'cibu (1)', 'AdmBot (-1)', '21/10/2022 - 23:28:18', 1, 1, 'Teleport to checkpoint.'),
(178, 'cibu (1)', 'AdmBot (-1)', '21/10/2022 - 23:28:42', 1, 1, 'Teleport to checkpoint.'),
(179, 'cibu (1)', 'AdmBot (-1)', '21/10/2022 - 23:29:08', 1, 1, 'Teleport to checkpoint.'),
(180, 'cibu (1)', 'AdmBot (-1)', '21/10/2022 - 23:29:28', 1, 1, 'Teleport to checkpoint.'),
(181, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:40:02', 1, 1, 'Cheats (Dialog-Hider)'),
(182, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:44:53', 1, 1, 'Teleport to checkpoint.'),
(183, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:48:20', 1, 1, 'Teleport to checkpoint.'),
(184, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:48:40', 1, 1, 'Teleport to checkpoint.'),
(185, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:49:17', 1, 1, 'Teleport to checkpoint.'),
(186, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:52:05', 1, 1, 'Teleport to checkpoint.'),
(187, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:53:19', 1, 1, 'Teleport to checkpoint.'),
(188, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:53:49', 1, 1, 'Teleport to checkpoint.'),
(189, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:55:48', 1, 1, 'Teleport to checkpoint.'),
(190, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:55:48', 1, 1, 'Teleport to checkpoint.'),
(191, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:56:49', 1, 1, 'Teleport to checkpoint.'),
(192, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 01:57:14', 1, 1, 'Teleport to checkpoint.'),
(193, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:11:29', 1, 1, 'Teleport to checkpoint.'),
(194, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:07', 1, 1, 'Cheats (Dialog-Hider)'),
(195, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:23', 1, 1, 'Cheats (Dialog-Hider)'),
(196, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:26', 1, 1, 'Cheats (Dialog-Hider)'),
(197, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:27', 1, 1, 'Cheats (Dialog-Hider)'),
(198, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:30', 1, 1, 'Cheats (Dialog-Hider)'),
(199, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:31', 1, 1, 'Cheats (Dialog-Hider)'),
(200, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:33', 1, 1, 'Cheats (Dialog-Hider)'),
(201, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:39', 1, 1, 'Cheats (Dialog-Hider)'),
(202, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:47', 1, 1, 'Cheats (Dialog-Hider)'),
(203, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:49', 1, 1, 'Cheats (Dialog-Hider)'),
(204, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:56', 1, 1, 'Cheats (Dialog-Hider)'),
(205, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:15:59', 1, 1, 'Cheats (Dialog-Hider)'),
(206, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:16:04', 1, 1, 'Cheats (Dialog-Hider)'),
(207, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:16:06', 1, 1, 'Cheats (Dialog-Hider)'),
(208, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:16:10', 1, 1, 'Cheats (Dialog-Hider)'),
(209, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:16:13', 1, 1, 'Cheats (Dialog-Hider)'),
(210, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 02:16:24', 1, 1, 'Cheats (Dialog-Hider)'),
(211, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:48:16', 1, 1, 'Cheats (Dialog-Hider)'),
(212, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:48:18', 1, 1, 'Cheats (Dialog-Hider)'),
(213, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:59:02', 1, 1, 'Cheats (Dialog-Hider)'),
(214, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:59:21', 1, 1, 'Cheats (Dialog-Hider)'),
(215, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:59:23', 1, 1, 'Cheats (Dialog-Hider)'),
(216, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:59:41', 1, 1, 'Cheats (Dialog-Hider)'),
(217, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 03:59:42', 1, 1, 'Cheats (Dialog-Hider)'),
(218, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:00:00', 1, 1, 'Cheats (Dialog-Hider)'),
(219, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:00:26', 1, 1, 'Cheats (Dialog-Hider)'),
(220, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:00:48', 1, 1, 'Cheats (Dialog-Hider)'),
(221, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:00:51', 1, 1, 'Cheats (Dialog-Hider)'),
(222, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:00:54', 1, 1, 'Cheats (Dialog-Hider)'),
(223, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:05:11', 1, 1, 'Cheats (Dialog-Hider)'),
(224, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:05:14', 1, 1, 'Cheats (Dialog-Hider)'),
(225, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:06:35', 1, 1, 'Cheats (Dialog-Hider)'),
(226, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 04:06:37', 1, 1, 'Cheats (Dialog-Hider)'),
(227, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:54:46', 1, 1, 'Cheats (Dialog-Hider)'),
(228, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:54:48', 1, 1, 'Cheats (Dialog-Hider)'),
(229, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:54:51', 1, 1, 'Cheats (Dialog-Hider)'),
(230, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:54:59', 1, 1, 'Cheats (Dialog-Hider)'),
(231, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:55:03', 1, 1, 'Cheats (Dialog-Hider)'),
(232, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:55:06', 1, 1, 'Cheats (Dialog-Hider)'),
(233, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:55:08', 1, 1, 'Cheats (Dialog-Hider)'),
(234, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:55:10', 1, 1, 'Cheats (Dialog-Hider)'),
(235, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:55:32', 1, 1, 'Cheats (Dialog-Hider)'),
(236, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:56:20', 1, 1, 'Cheats (Dialog-Hider)'),
(237, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:56:24', 1, 1, 'Cheats (Dialog-Hider)'),
(238, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:56:25', 1, 1, 'Cheats (Dialog-Hider)'),
(239, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:57:33', 1, 1, 'Cheats (Dialog-Hider)'),
(240, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 13:58:33', 1, 1, 'Cheats (Dialog-Hider)'),
(241, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:04:08', 1, 1, 'Cheats (Dialog-Hider)'),
(242, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:04:13', 1, 1, 'Cheats (Dialog-Hider)'),
(243, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:04:17', 1, 1, 'Cheats (Dialog-Hider)'),
(244, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:04:49', 1, 1, 'Cheats (Dialog-Hider)'),
(245, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:07:51', 1, 1, 'Cheats (Dialog-Hider)'),
(246, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:07:55', 1, 1, 'Cheats (Dialog-Hider)'),
(247, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:07:57', 1, 1, 'Cheats (Dialog-Hider)'),
(248, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:08:01', 1, 1, 'Cheats (Dialog-Hider)'),
(249, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:08:03', 1, 1, 'Cheats (Dialog-Hider)'),
(250, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:08:05', 1, 1, 'Cheats (Dialog-Hider)'),
(251, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:08:07', 1, 1, 'Cheats (Dialog-Hider)'),
(252, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:09:20', 1, 1, 'Cheats (Dialog-Hider)'),
(253, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:10:41', 1, 1, 'Cheats (Dialog-Hider)'),
(254, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:11:56', 1, 1, 'Cheats (Dialog-Hider)'),
(255, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:15:00', 1, 1, 'Cheats (Dialog-Hider)'),
(256, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:15:04', 1, 1, 'Cheats (Dialog-Hider)'),
(257, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:15:06', 1, 1, 'Cheats (Dialog-Hider)'),
(258, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:22:42', 1, 1, 'Cheats (Dialog-Hider)'),
(259, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:24:16', 1, 1, 'Cheats (Dialog-Hider)'),
(260, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:24:18', 1, 1, 'Cheats (Dialog-Hider)'),
(261, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:24:24', 1, 1, 'Cheats (Dialog-Hider)'),
(262, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:24:28', 1, 1, 'Cheats (Dialog-Hider)'),
(263, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:24:30', 1, 1, 'Cheats (Dialog-Hider)'),
(264, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:25:21', 1, 1, 'Cheats (Dialog-Hider)'),
(265, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:25:25', 1, 1, 'Cheats (Dialog-Hider)'),
(266, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:25:27', 1, 1, 'Cheats (Dialog-Hider)'),
(267, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:25:30', 1, 1, 'Cheats (Dialog-Hider)'),
(268, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:26:38', 1, 1, 'Cheats (Dialog-Hider)'),
(269, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:26:40', 1, 1, 'Cheats (Dialog-Hider)'),
(270, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:27:26', 1, 1, 'Cheats (Dialog-Hider)'),
(271, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:27:33', 1, 1, 'Cheats (Dialog-Hider)'),
(272, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:27:41', 1, 1, 'Cheats (Dialog-Hider)'),
(273, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 14:27:43', 1, 1, 'Cheats (Dialog-Hider)'),
(274, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:00:56', 1, 1, 'Cheats (Dialog-Hider)'),
(275, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:01:19', 1, 1, 'Cheats (Dialog-Hider)'),
(276, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:02:24', 1, 1, 'Cheats (Dialog-Hider)'),
(277, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:02:27', 1, 1, 'Cheats (Dialog-Hider)'),
(278, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:03:22', 1, 1, 'Cheats (Dialog-Hider)'),
(279, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:10:15', 1, 1, 'Cheats (Dialog-Hider)'),
(280, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:10:17', 1, 1, 'Cheats (Dialog-Hider)'),
(281, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:10:27', 1, 1, 'Cheats (Dialog-Hider)'),
(282, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:10:31', 1, 1, 'Cheats (Dialog-Hider)'),
(283, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:12:38', 1, 1, 'Cheats (Dialog-Hider)'),
(284, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:12:39', 1, 1, 'Cheats (Dialog-Hider)'),
(285, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:26:35', 1, 1, 'Cheats (Dialog-Hider)'),
(286, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:26:37', 1, 1, 'Cheats (Dialog-Hider)'),
(287, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:29:56', 1, 1, 'Cheats (Dialog-Hider)'),
(288, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:29:58', 1, 1, 'Cheats (Dialog-Hider)'),
(289, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:31:13', 1, 1, 'Cheats (Dialog-Hider)'),
(290, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:33:45', 1, 1, 'Cheats (Dialog-Hider)'),
(291, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:33:48', 1, 1, 'Cheats (Dialog-Hider)'),
(292, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:33:50', 1, 1, 'Cheats (Dialog-Hider)'),
(293, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:33:51', 1, 1, 'Cheats (Dialog-Hider)'),
(294, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:33:57', 1, 1, 'Cheats (Dialog-Hider)'),
(295, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 15:59:53', 1, 1, 'Teleport to checkpoint.'),
(296, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 17:28:21', 1, 1, 'Teleport to checkpoint.'),
(297, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 17:40:19', 1, 1, 'Teleport to checkpoint.'),
(298, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 17:52:49', 1, 1, 'Teleport to checkpoint.'),
(299, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:02:22', 1, 1, 'Teleport to checkpoint.'),
(300, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:05:34', 1, 1, 'Teleport to checkpoint.'),
(301, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:16:13', 1, 1, 'Teleport to checkpoint.'),
(302, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:33:45', 1, 1, 'Teleport to checkpoint.'),
(303, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:36:32', 1, 1, 'Teleport to checkpoint.'),
(304, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:39:40', 1, 1, 'Teleport to checkpoint.'),
(305, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:46:42', 1, 1, 'Teleport to checkpoint.'),
(306, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:50:29', 1, 1, 'Teleport to checkpoint.'),
(307, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 18:55:12', 1, 1, 'Teleport to checkpoint.'),
(308, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:00:14', 1, 1, 'Teleport to checkpoint.'),
(309, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:04:57', 1, 1, 'Teleport to checkpoint.'),
(310, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:13:07', 1, 1, 'Teleport to checkpoint.'),
(311, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:13:31', 1, 1, 'Teleport to checkpoint.'),
(312, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:13:49', 1, 1, 'Teleport to checkpoint.'),
(313, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:14:39', 1, 1, 'Teleport to checkpoint.'),
(314, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:39:43', 1, 1, 'Teleport to checkpoint.'),
(315, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 19:45:07', 1, 1, 'Teleport to checkpoint.'),
(316, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:04:42', 1, 1, 'Teleport to checkpoint.'),
(317, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:05:11', 1, 1, 'Teleport to checkpoint.'),
(318, 'cibu (1)', 'cibu (1)', '22/10/2022 - 20:05:37', 1, 3, 'a'),
(319, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:07:23', 1, 1, 'Teleport to checkpoint.'),
(320, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:09:49', 1, 1, 'Teleport to checkpoint.'),
(321, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:09:55', 1, 1, 'Teleport to checkpoint.'),
(322, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:17:42', 1, 1, 'Teleport to checkpoint.'),
(323, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:19:38', 1, 1, 'Teleport to checkpoint.'),
(324, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 20:21:38', 1, 1, 'Teleport to checkpoint.'),
(325, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:16:55', 1, 1, 'Teleport to checkpoint.'),
(326, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:18:11', 1, 1, 'Teleport to checkpoint.'),
(327, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:22:01', 1, 1, 'Teleport to checkpoint.'),
(328, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:23:16', 1, 1, 'Teleport to checkpoint.'),
(329, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:24:26', 1, 1, 'Teleport to checkpoint.'),
(330, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:24:33', 1, 1, 'Teleport to checkpoint.'),
(331, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:28:13', 1, 1, 'Teleport to checkpoint.'),
(332, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:29:27', 1, 1, 'Teleport to checkpoint.'),
(333, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:30:38', 1, 1, 'Teleport to checkpoint.'),
(334, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 21:50:41', 1, 1, 'Teleport to checkpoint.'),
(335, 'cibu (1)', 'AdmBot (-1)', '22/10/2022 - 22:01:20', 1, 1, 'Teleport to checkpoint.');

-- --------------------------------------------------------

--
-- Table structure for table `seif`
--

CREATE TABLE `seif` (
  `sID` int(10) NOT NULL,
  `sFactionID` int(10) NOT NULL,
  `sPosX` float NOT NULL,
  `sPosY` float NOT NULL,
  `sPosZ` float NOT NULL,
  `sMoney` int(10) NOT NULL DEFAULT 500000,
  `sDrugs` int(10) NOT NULL DEFAULT 1000,
  `sMaterials` int(10) NOT NULL DEFAULT 100000,
  `sVirtualID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `seif`
--

INSERT INTO `seif` (`sID`, `sFactionID`, `sPosX`, `sPosY`, `sPosZ`, `sMoney`, `sDrugs`, `sMaterials`, `sVirtualID`) VALUES
(1, 1, 240.683, 71.1112, 1005.04, 500000, 1000, 100000, 1),
(2, 2, 228.863, 169.008, 1003.02, 1500122, 0, 0, 2),
(3, 3, 301.576, 187.933, 1007.17, 0, 1000, 90000, 3),
(4, 4, 2550.15, -1287.49, 1054.64, 499022, 1900, 9791090, 4),
(5, 5, 2550.15, -1287.49, 1054.64, 475460, 1000, 650, 5),
(6, 6, 2550.15, -1287.49, 1054.64, 6500005, 1035, 78535, 6),
(7, 7, 1502.14, 1308.88, 1093.29, 5500000, 1000, 108000, 7),
(8, 8, 604.763, -26.5193, 1004.78, 1, 1000, 100000, 8),
(9, 9, -2034.81, -114.67, 1035.17, 500000, 1000, 100000, 9),
(10, 10, 2550.15, -1287.49, 1054.64, 481726, 0, 841580, 10),
(11, 11, -2165.66, 646.313, 1052.38, 500031, 2109, 105000, 11),
(12, 12, 1723.13, -1673.03, 20.2233, 500000, 1000, 100000, 12),
(13, 13, 1501.94, 1309.4, 1093.29, 500000, 1000, 100000, 13),
(14, 14, 240.327, 73.6975, 1005.04, 276453898, 1000, 101650, 14),
(15, 15, 1722.87, -1673.41, 20.2231, 500000, 1000, 100000, 15),
(16, 16, 1502.14, 1308.88, 1093.29, 5500000, 1000, 108000, 16),
(17, 17, 2550.15, -1287.49, 1054.64, 475460, 1000, 28960, 17),
(18, 18, 2550.15, -1287.49, 1054.64, 475460, 1000, 47402, 18),
(19, 19, 240.683, 71.1112, 1005.04, 500000, 1000, 100000, 19),
(20, 20, 1501.94, 1309.4, 1093.29, 500000, 1000, 100000, 20),
(21, 21, 1502.14, 1308.88, 1093.29, 5500000, 1000, 108000, 21),
(22, 22, 604.763, -26.5193, 1004.78, 1, 1000, 100000, 22),
(23, 23, 1722.87, -1673.41, 20.2231, -54271071, 100001000, 100002, 23),
(24, 24, 280.831, 188.109, 1007.17, 500003, 697969, 100000, 24),
(25, 25, 2550.15, -1287.49, 1054.64, 475460, 1000, 9982170, 25),
(26, 26, 2550.15, -1287.49, 1054.64, 475460, 1000, 18780, 26),
(27, 27, 2550.15, -1287.49, 1054.64, 20475460, 1000, 28730, 27);

-- --------------------------------------------------------

--
-- Table structure for table `stuff`
--

CREATE TABLE `stuff` (
  `ID` int(11) NOT NULL,
  `Tax` int(20) NOT NULL,
  `TaxValue` int(20) NOT NULL,
  `ServerStock` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|',
  `goal` bigint(20) NOT NULL,
  `mgoal` int(11) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `password` varchar(32) NOT NULL DEFAULT '0',
  `AdminRaport` int(11) NOT NULL,
  `HelperRaport` int(11) NOT NULL,
  `App` int(11) NOT NULL,
  `AppLeader` int(11) NOT NULL,
  `Payday` int(11) NOT NULL,
  `chapter` int(11) NOT NULL,
  `bpTime` int(11) NOT NULL,
  `lotto_bets` int(1) NOT NULL,
  `ServerBonus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stuff`
--

INSERT INTO `stuff` (`ID`, `Tax`, `TaxValue`, `ServerStock`, `goal`, `mgoal`, `nickname`, `password`, `AdminRaport`, `HelperRaport`, `App`, `AppLeader`, `Payday`, `chapter`, `bpTime`, `lotto_bets`, `ServerBonus`) VALUES
(1, 0, 0, '96 8 0 1 3 0 10 0 10', 35404, 0, 'B-HOOD RPG', '0', 100, 0, 1, 1, 5, 1, 1666013118, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `svehicles`
--

CREATE TABLE `svehicles` (
  `vID` int(11) NOT NULL,
  `vModel` int(10) NOT NULL,
  `LocationX` float NOT NULL,
  `LocationY` float NOT NULL,
  `LocationZ` float NOT NULL,
  `Angle` float NOT NULL,
  `Color1` int(10) NOT NULL,
  `Color2` int(10) NOT NULL,
  `Faction` int(10) NOT NULL,
  `Rank` int(10) NOT NULL,
  `NumberPlate` varchar(64) NOT NULL DEFAULT 'NewCar'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `svehicles`
--

INSERT INTO `svehicles` (`vID`, `vModel`, `LocationX`, `LocationY`, `LocationZ`, `Angle`, `Color1`, `Color2`, `Faction`, `Rank`, `NumberPlate`) VALUES
(8, 521, 2498.72, -1685.79, 13.021, 1.342, 234, 234, 4, 0, 'NewCar'),
(9, 521, 2497, -1685.85, 13.005, 2.478, 234, 234, 4, 0, 'NewCar'),
(10, 521, 2491.37, -1686.05, 13.08, 359.63, 234, 234, 4, 0, 'NewCar'),
(11, 521, 2493.23, -1685.99, 13.08, 0.537, 234, 234, 4, 0, 'NewCar'),
(12, 409, 2473.25, -1694.45, 13.316, 0.469, 234, 234, 4, 0, 'NewCar'),
(13, 487, 2531.51, -1677.05, 19.93, 89.792, 234, 234, 4, 0, 'NewCar'),
(14, 518, 2482.11, -1692.78, 13.191, 354.135, 234, 234, 4, 0, 'NewCar'),
(15, 579, 2501.76, -1655.58, 13.389, 58.75, 234, 234, 4, 0, 'NewCar'),
(16, 579, 2504.07, -1681.12, 13.387, 298.51, 234, 234, 4, 0, 'NewCar'),
(17, 579, 2508.74, -1674.69, 13.356, 343.662, 234, 234, 4, 0, 'NewCar'),
(18, 579, 2509.69, -1666.5, 13.415, 7.776, 234, 234, 4, 0, 'NewCar'),
(19, 551, 2471.61, -1677.58, 13.191, 211.529, 234, 234, 4, 0, 'NewCar'),
(20, 551, 2468.37, -1670.22, 13.193, 194.4, 234, 234, 4, 0, 'NewCar'),
(21, 560, 2486.38, -1653.47, 13.103, 86.734, 234, 234, 4, 0, 'NewCar'),
(22, 560, 2479.78, -1653.79, 13.094, 89.889, 234, 234, 4, 0, 'NewCar'),
(24, 480, 2479.91, -1683.32, 13.18, 249.715, 234, 234, 4, 0, 'NewCar'),
(25, 480, 2471.47, -1653.61, 13.176, 90.528, 234, 234, 4, 0, 'NewCar'),
(26, 521, 2635.23, 2350.97, 10.346, 201.6, 125, 125, 18, 0, 'NewCar'),
(27, 521, 2636.99, 2351.16, 10.346, 202.602, 125, 125, 18, 0, 'NewCar'),
(28, 521, 2629.35, 2349, 10.348, 209.617, 125, 125, 18, 0, 'NewCar'),
(29, 521, 2627.98, 2348.34, 10.348, 210.915, 125, 125, 18, 0, 'NewCar'),
(30, 560, 2611.07, 2279.53, 10.526, 88.034, 125, 125, 18, 0, 'NewCar'),
(31, 560, 2611.25, 2275.3, 10.525, 89.75, 125, 125, 18, 0, 'NewCar'),
(32, 409, 2611, 2271.08, 10.62, 90.889, 125, 125, 18, 0, 'NewCar'),
(33, 518, 2611.33, 2267.02, 10.491, 90.483, 125, 125, 18, 0, 'NewCar'),
(34, 480, 2611.18, 2262.76, 10.594, 89.362, 125, 125, 18, 0, 'NewCar'),
(35, 480, 2611.21, 2258.52, 10.589, 90.945, 125, 125, 18, 0, 'NewCar'),
(36, 579, 2593.08, 2279.04, 10.748, 270.527, 125, 125, 18, 0, 'NewCar'),
(37, 579, 2593.07, 2275.33, 10.752, 269.318, 125, 125, 18, 0, 'NewCar'),
(38, 579, 2593.1, 2271.67, 10.756, 270.725, 125, 125, 18, 0, 'NewCar'),
(39, 579, 2593.11, 2267.86, 10.7531, 269.926, 125, 125, 18, 0, 'NewCar'),
(40, 551, 2594.21, 2250.99, 10.621, 0.777, 125, 125, 18, 0, 'NewCar'),
(41, 551, 2589.98, 2251, 10.621, 359.582, 125, 125, 18, 0, 'NewCar'),
(42, 551, 2585.19, 2250.98, 10.621, 1.458, 125, 125, 18, 0, 'NewCar'),
(43, 551, 2580.47, 2250.81, 10.621, 359.89, 125, 125, 18, 0, 'NewCar'),
(44, 487, 2577.3, 2307.65, 17.98, 256.322, 125, 125, 18, 0, 'NewCar'),
(45, 579, 657.18, -1274.67, 13.5669, 270.422, 228, 228, 6, 0, 'NewCar'),
(46, 579, 657.079, -1262.9, 13.5052, 270.278, 228, 228, 6, 0, 'NewCar'),
(47, 579, 672.779, -1295.38, 13.5661, 88.8371, 228, 228, 6, 0, 'NewCar'),
(48, 579, 672.558, -1291.24, 13.5085, 90.6385, 228, 228, 6, 0, 'NewCar'),
(49, 487, 726.274, -1244.87, 13.6376, 87.5075, 228, 228, 6, 0, 'NewCar'),
(50, 518, 657.172, -1266.95, 13.3188, 268.877, 228, 228, 6, 0, 'NewCar'),
(51, 521, 687.373, -1262.63, 13.0955, 83.7724, 228, 228, 6, 0, 'NewCar'),
(52, 521, 687.223, -1251.96, 13.1993, 89.5486, 228, 228, 6, 0, 'NewCar'),
(53, 521, 687.406, -1258.63, 13.1033, 88.2548, 228, 228, 6, 0, 'NewCar'),
(54, 521, 687.429, -1254.68, 13.1536, 85.8223, 228, 228, 6, 0, 'NewCar'),
(55, 409, 657.231, -1283.66, 13.4353, 0.396389, 228, 228, 6, 0, 'NewCar'),
(56, 560, 672.858, -1262.46, 13.2993, 89.545, 228, 228, 6, 0, 'NewCar'),
(57, 560, 672.98, -1256.58, 13.2969, 90.0246, 228, 228, 6, 0, 'NewCar'),
(58, 480, 672.788, -1286.69, 13.3835, 88.2666, 228, 228, 6, 0, 'NewCar'),
(59, 480, 672.553, -1267.29, 13.3726, 89.6505, 228, 228, 6, 0, 'NewCar'),
(60, 579, 1413.22, 743.065, 10.753, 269.491, 167, 167, 10, 0, 'NewCar'),
(61, 579, 1413.19, 749.366, 10.755, 269.711, 167, 167, 10, 0, 'NewCar'),
(62, 579, 1413.19, 755.97, 10.754, 269.925, 167, 167, 10, 0, 'NewCar'),
(63, 579, 1413.12, 762.375, 10.754, 271.091, 167, 167, 10, 0, 'NewCar'),
(64, 521, 1453.75, 745.125, 10.592, 91.789, 167, 167, 10, 0, 'NewCar'),
(65, 521, 1453.75, 743.451, 10.592, 88.332, 167, 167, 10, 0, 'NewCar'),
(66, 521, 1453.55, 756.663, 10.592, 91.525, 167, 167, 10, 0, 'NewCar'),
(67, 521, 1453.55, 758.185, 10.592, 91.046, 167, 167, 10, 0, 'NewCar'),
(68, 560, 1412.92, 768.592, 10.526, 270.608, 167, 167, 10, 0, 'NewCar'),
(69, 560, 1412.9, 775.013, 10.526, 270.097, 167, 167, 10, 0, 'NewCar'),
(70, 480, 1413.04, 781.519, 10.594, 270.572, 167, 167, 10, 0, 'NewCar'),
(71, 480, 1412.97, 787.853, 10.593, 269.968, 167, 167, 10, 0, 'NewCar'),
(72, 409, 1429.05, 795.801, 10.62, 89.267, 167, 167, 10, 0, 'NewCar'),
(73, 518, 1445.52, 787.53, 10.491, 180.513, 167, 167, 10, 0, 'NewCar'),
(74, 487, 1412.91, 730.831, 11.018, 269.52, 167, 167, 10, 0, 'NewCar'),
(75, 461, 1459.32, 2778.99, 10.4033, 269.106, 155, 155, 5, 0, 'NewCar'),
(76, 461, 1459.33, 2781.1, 10.3988, 270.116, 155, 155, 5, 0, 'NewCar'),
(77, 521, 1459.35, 2783.44, 10.3823, 268.396, 155, 155, 5, 0, 'NewCar'),
(78, 521, 1459.53, 2785.76, 10.3861, 262.024, 155, 155, 5, 0, 'NewCar'),
(79, 560, 1468.45, 2798.29, 10.4471, 312.972, 155, 155, 5, 0, 'NewCar'),
(80, 426, 1479.64, 2843.01, 10.5636, 180.306, 155, 155, 5, 0, 'NewCar'),
(81, 426, 1484.27, 2843.11, 10.5632, 180.781, 155, 155, 5, 0, 'NewCar'),
(82, 426, 1489.48, 2843.25, 10.5635, 181.177, 155, 155, 5, 0, 'NewCar'),
(83, 480, 1494.49, 2843.36, 10.5941, 180.564, 155, 155, 5, 0, 'NewCar'),
(84, 567, 1484.7, 2791.26, 10.689, 269.544, 155, 155, 5, 0, 'NewCar'),
(85, 409, 1505.21, 2793.41, 10.5407, 204.986, 155, 155, 5, 0, 'NewCar'),
(86, 409, 1505.52, 2753.03, 10.5423, 334.401, 155, 155, 5, 0, 'NewCar'),
(87, 567, 1485.26, 2754.4, 10.6918, 269.442, 155, 155, 5, 0, 'NewCar'),
(88, 560, 1472.59, 2745.6, 10.4489, 236.339, 155, 155, 5, 0, 'NewCar'),
(89, 579, 1492.57, 2742.29, 10.6722, 287.2, 155, 155, 5, 0, 'NewCar'),
(90, 487, 1521.54, 2731.9, 10.9945, 88.6134, 155, 155, 5, 0, 'NewCar'),
(91, 521, 1132.77, -2048.26, 68.5737, 267.791, 36, 36, 17, 0, 'NewCar'),
(92, 521, 1132.84, -2050.08, 68.5786, 272.529, 36, 36, 17, 0, 'NewCar'),
(93, 461, 1132.38, -2025.48, 68.583, 271.61, 36, 36, 17, 0, 'NewCar'),
(94, 461, 1132.36, -2023.35, 68.5835, 269.968, 36, 36, 17, 0, 'NewCar'),
(95, 480, 1145.39, -2005.22, 68.7818, 270.55, 36, 36, 17, 0, 'NewCar'),
(96, 487, 1116.09, -2017.79, 74.607, 271.309, 36, 36, 17, 0, 'NewCar'),
(97, 560, 1164.56, -2005.32, 68.7127, 269.756, 36, 36, 17, 0, 'NewCar'),
(98, 426, 1174.99, -2031.06, 68.751, 0.358274, 36, 36, 17, 0, 'NewCar'),
(99, 579, 1167.78, -2036.93, 68.9355, 89.9587, 36, 36, 17, 0, 'NewCar'),
(100, 402, 1181.41, -2037.07, 68.8395, 269.746, 36, 36, 17, 0, 'NewCar'),
(101, 426, 1175.24, -2044.53, 68.7508, 181.482, 36, 36, 17, 0, 'NewCar'),
(102, 480, 1142.43, -2068.79, 68.6994, 271.187, 36, 36, 17, 0, 'NewCar'),
(103, 560, 1166.38, -2068.87, 68.7127, 270.876, 36, 36, 17, 0, 'NewCar'),
(104, 409, 1150.88, -2047.01, 68.8006, 328.206, 36, 36, 17, 0, 'NewCar'),
(105, 409, 1149.22, -2026.93, 68.8042, 226.039, 36, 36, 17, 0, 'NewCar'),
(106, 567, 1274.8, -2010.01, 58.867, 90.0461, 36, 36, 17, 0, 'NewCar'),
(107, 567, 1274.71, -2015.15, 58.8633, 89.299, 36, 36, 17, 0, 'NewCar'),
(108, 412, 1249.33, -2042.08, 59.5671, 269.475, 36, 36, 17, 0, 'NewCar'),
(109, 579, -2641.02, 1329.58, 7.12377, 269.276, 226, 226, 26, 0, 'NewCar'),
(110, 579, -2632.1, 1329.54, 7.12849, 270.012, 226, 226, 26, 0, 'NewCar'),
(111, 567, -2622.94, 1333.78, 7.06296, 315.53, 226, 226, 26, 0, 'NewCar'),
(112, 567, -2614.75, 1348.19, 7.06473, 359.124, 226, 226, 26, 0, 'NewCar'),
(113, 426, -2646.97, 1377.86, 6.91499, 180.131, 226, 226, 26, 0, 'NewCar'),
(114, 426, -2642.47, 1377.83, 6.89713, 179.498, 226, 226, 26, 0, 'NewCar'),
(115, 480, -2637.96, 1378.09, 6.9161, 181.139, 226, 1, 26, 0, 'NewCar'),
(116, 480, -2633.28, 1378.07, 6.91346, 179.36, 226, 1, 26, 0, 'NewCar'),
(117, 409, -2628.9, 1377.87, 6.93828, 180.736, 226, 1, 26, 0, 'NewCar'),
(118, 409, -2624.28, 1377.9, 6.93854, 179.54, 226, 1, 26, 0, 'NewCar'),
(119, 461, -2632.75, 1398.24, 6.67409, 185.786, 226, 226, 26, 0, 'NewCar'),
(120, 461, -2636.94, 1397.06, 6.67789, 191.746, 226, 226, 26, 0, 'NewCar'),
(121, 461, -2639.95, 1396.23, 6.67778, 194.73, 226, 226, 26, 0, 'NewCar'),
(122, 461, -2643.15, 1395.4, 6.67643, 194.266, 226, 226, 26, 0, 'NewCar'),
(123, 461, -2646.66, 1394.39, 6.67849, 197.105, 226, 226, 26, 0, 'NewCar'),
(124, 560, -2620.84, 1378.11, 6.84541, 180, 226, 226, 26, 0, 'NewCar'),
(125, 560, -2617.1, 1378.09, 6.84518, 179.676, 226, 226, 26, 0, 'NewCar'),
(126, 487, -2595, 1377.36, 7.29607, 157.663, 226, 1, 26, 0, 'NewCar'),
(127, 461, -2528.66, -622.714, 132.331, 358.731, 158, 158, 27, 0, 'NewCar'),
(128, 461, -2530.33, -622.713, 132.329, 1.20648, 158, 158, 27, 0, 'NewCar'),
(129, 461, -2532.14, -622.67, 132.321, 2.21691, 158, 158, 27, 0, 'NewCar'),
(130, 461, -2533.83, -622.63, 132.319, 4.15496, 158, 158, 27, 0, 'NewCar'),
(131, 461, -2535.79, -622.639, 132.312, 358.237, 158, 158, 27, 0, 'NewCar'),
(132, 560, -2535.46, -602, 132.267, 180.268, 158, 158, 27, 0, 'NewCar'),
(133, 560, -2531.79, -601.938, 132.268, 181.605, 158, 158, 27, 0, 'NewCar'),
(134, 409, -2528.14, -602.292, 132.362, 179.852, 158, 1, 27, 0, 'NewCar'),
(135, 409, -2524.29, -602.37, 132.362, 180.069, 158, 1, 27, 0, 'NewCar'),
(136, 480, -2520.61, -602.04, 132.336, 180.131, 158, 1, 27, 0, 'NewCar'),
(137, 480, -2516.93, -601.915, 132.335, 179.655, 158, 1, 27, 0, 'NewCar'),
(138, 426, -2513.28, -602.273, 132.306, 180.639, 158, 1, 27, 0, 'NewCar'),
(139, 426, -2509.33, -602.21, 132.306, 180.473, 158, 1, 27, 0, 'NewCar'),
(141, 567, -2505.71, -602.153, 132.433, 179.416, 158, 1, 27, 0, 'NewCar'),
(142, 567, -2501.86, -602.004, 132.43, 180.899, 158, 1, 27, 0, 'NewCar'),
(143, 579, -2498.23, -602.112, 132.494, 180.511, 158, 158, 27, 0, 'NewCar'),
(144, 579, -2494.54, -602.103, 132.493, 179.635, 158, 158, 27, 0, 'NewCar'),
(145, 487, -2466.89, -597.716, 132.589, 96.7495, 158, 1, 27, 0, 'NewCar'),
(146, 560, -2462.87, 156.383, 34.7677, 359.362, 168, 168, 25, 0, 'NewCar'),
(147, 560, -2462.82, 148.355, 34.7698, 0.642166, 168, 168, 25, 0, 'NewCar'),
(148, 480, -2445.21, 142.455, 34.8047, 270.927, 168, 1, 25, 0, 'NewCar'),
(149, 480, -2437.13, 142.491, 34.8044, 270.287, 168, 1, 25, 0, 'NewCar'),
(150, 461, -2449.63, 129.804, 34.7519, 359.406, 168, 1, 25, 0, 'NewCar'),
(151, 461, -2437.57, 129.935, 34.7491, 358.317, 168, 1, 25, 0, 'NewCar'),
(152, 461, -2447.11, 129.692, 34.7555, 359.018, 168, 1, 25, 0, 'NewCar'),
(153, 461, -2440.54, 129.925, 34.7513, 1.23639, 168, 1, 25, 0, 'NewCar'),
(154, 461, -2443.78, 129.694, 34.7523, 1.99344, 168, 1, 25, 0, 'NewCar'),
(155, 409, -2435.36, 174.096, 34.8464, 269.504, 168, 1, 25, 0, 'NewCar'),
(156, 575, -2444.47, 174.021, 34.6339, 269.378, 168, 1, 25, 0, 'NewCar'),
(158, 579, -2462.76, 166.758, 34.9598, 0.262681, 168, 1, 25, 0, 'NewCar'),
(159, 579, -2456.73, 181.601, 34.9659, 314.861, 168, 1, 25, 0, 'NewCar'),
(160, 487, -2395.54, 182.378, 35.4882, 104.948, 168, 1, 25, 0, 'NewCar'),
(161, 426, -2440.73, 185.392, 34.7705, 270.041, 168, 1, 25, 0, 'NewCar'),
(162, 510, 1646.77, -2263.41, 13.1012, 83.2598, -1, -1, 0, 0, 'NewCar'),
(163, 510, 1679.84, -2264.7, 13.1332, 0.621215, -1, -1, 0, 0, 'NewCar'),
(164, 510, 1682.95, -2264.95, 13.1143, 359.152, -1, -1, 0, 0, 'NewCar'),
(165, 510, 1677.79, -2264.54, 13.1456, 356.584, -1, -1, 0, 0, 'NewCar'),
(166, 510, 1643.89, -2263.43, 13.0819, 89.8213, -1, -1, 0, 0, 'NewCar'),
(167, 510, 1685.59, -2264.83, 13.0957, 359.802, -1, -1, 0, 0, 'NewCar'),
(168, 510, 1681.3, -2264.7, 13.1219, 357.165, -1, -1, 0, 0, 'NewCar'),
(169, 510, 1655.26, -2263.43, 13.1156, 89.5489, -1, -1, 0, 0, 'NewCar'),
(170, 510, 1649.6, -2263.43, 13.1056, 89.7473, -1, -1, 0, 0, 'NewCar'),
(171, 510, 1688.07, -2264.74, 13.0839, 359.467, -1, -1, 0, 0, 'NewCar'),
(172, 510, 1684.22, -2264.81, 13.1067, 359.402, -1, -1, 0, 0, 'NewCar'),
(173, 510, 1652.38, -2263.42, 13.1105, 87.6141, -1, -1, 0, 0, 'NewCar'),
(174, 510, 1658.18, -2263.43, 13.1205, 89.216, -1, -1, 0, 0, 'NewCar'),
(175, 510, 1661.04, -2263.41, 13.1253, 83.8248, -1, -1, 0, 0, 'NewCar'),
(176, 510, 1195.73, -1728.44, 13.1758, 180.804, -1, -1, 0, 0, 'NewCar'),
(177, 510, 1207.02, -1728.19, 13.178, 179.303, -1, -1, 0, 0, 'NewCar'),
(178, 510, 1197.64, -1728.32, 13.1757, 179.237, -1, -1, 0, 0, 'NewCar'),
(179, 510, 1204.68, -1728.23, 13.1756, 179.179, -1, -1, 0, 0, 'NewCar'),
(180, 510, 1202.74, -1728.25, 13.1756, 177.481, -1, -1, 0, 0, 'NewCar'),
(181, 510, 1199.7, -1728.31, 13.1757, 180.746, -1, -1, 0, 0, 'NewCar'),
(182, 510, 1201.19, -1728.32, 13.1757, 185.869, -1, -1, 0, 0, 'NewCar'),
(183, 510, -2412.29, 352.244, 34.7795, 232.866, -1, -1, 0, 0, 'NewCar'),
(184, 510, -2413.21, 350.935, 34.7794, 233.27, -1, -1, 0, 0, 'NewCar'),
(185, 510, -2414.12, 349.631, 34.7794, 237.222, -1, -1, 0, 0, 'NewCar'),
(186, 510, -2415.06, 348.406, 34.7794, 232.334, -1, -1, 0, 0, 'NewCar'),
(187, 510, -2415.97, 347.081, 34.7862, 238.674, -1, -1, 0, 0, 'NewCar'),
(188, 510, -2431.28, 318.569, 34.7794, 247.041, -1, -1, 0, 0, 'NewCar'),
(189, 510, -2430.74, 319.804, 34.7794, 243.33, -1, -1, 0, 0, 'NewCar'),
(190, 510, -2430.16, 320.952, 34.7794, 242.732, -1, -1, 0, 0, 'NewCar'),
(191, 510, -2429.61, 322.245, 34.7794, 241.391, -1, -1, 0, 0, 'NewCar'),
(192, 510, -2428.99, 323.606, 34.7794, 240.735, -1, -1, 0, 0, 'NewCar'),
(193, 519, 1288.18, 1361.32, 11.715, 269.125, 6, 6, 0, 0, 'NewCar'),
(194, 520, 534.936, -1526.26, 14.5551, 0, 0, 0, 0, 0, 'NewCar'),
(196, 487, 1337.39, 1686.72, 10.8203, 268.64, 69, 1, 0, 0, 'NewCar'),
(197, 487, 1557.25, 1403.03, 10.8485, 92.1029, 69, 1, 0, 0, 'NewCar'),
(198, 487, 1560.44, 1492.1, 10.9938, 88.59, 69, 1, 0, 0, 'NewCar'),
(199, 487, 1628.59, 1359.39, 10.8038, 135.561, 69, 1, 0, 0, 'NewCar'),
(200, 509, 1689.45, -2263.42, 12.9907, 91.2408, -1, -1, 0, 0, 'NewCar'),
(201, 509, 1692.15, -2263.43, 12.9981, 90.0013, -1, -1, 0, 0, 'NewCar'),
(202, 509, 1697.74, -2263.43, 13.0085, 90.0059, -1, -1, 0, 0, 'NewCar'),
(203, 509, 1700.86, -2263.43, 13.015, 89.9502, -1, -1, 0, 0, 'NewCar'),
(204, 509, 1694.88, -2263.43, 12.9594, 90.3439, -1, -1, 0, 0, 'NewCar'),
(205, 510, 1669.45, -2263.41, 13.1385, 93.8372, -1, -1, 0, 0, 'NewCar'),
(206, 510, 1666.67, -2263.32, 13.1352, 90.3702, -1, -1, 0, 0, 'NewCar'),
(207, 510, 1663.81, -2263.43, 13.1302, 89.1123, -1, -1, 0, 0, 'NewCar'),
(208, 510, 1675.39, -2263.41, 13.1425, 92.1735, -1, -1, 0, 0, 'NewCar'),
(209, 510, 1672.5, -2263.42, 13.1455, 88.2533, -1, -1, 0, 0, 'NewCar'),
(210, 510, 2117.08, 2336.92, 10.428, 269.594, -1, -1, 0, 0, 'NewCar'),
(211, 510, 2125.43, 2336.99, 10.428, 269.594, -1, -1, 0, 0, 'NewCar'),
(212, 510, 2134.81, 2336.99, 10.428, 269.594, -1, -1, 0, 0, 'NewCar'),
(213, 510, 2156.09, 2336.99, 10.428, 269.594, -1, -1, 0, 0, 'NewCar'),
(214, 510, 2168.03, 2336.99, 10.428, 269.594, -1, -1, 0, 0, 'NewCar');

-- --------------------------------------------------------

--
-- Table structure for table `svf`
--

CREATE TABLE `svf` (
  `ID` int(11) NOT NULL,
  `Faction` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Color1` int(11) NOT NULL,
  `Color2` int(11) NOT NULL,
  `Stage` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `svf`
--

INSERT INTO `svf` (`ID`, `Faction`, `Model`, `Rank`, `Stock`, `Color1`, `Color2`, `Stage`) VALUES
(1, 1, 411, 3, 3, 1, 1, 0),
(2, 1, 523, 1, 8, 1, 0, 0),
(3, 1, 522, 3, 3, 1, 0, 0),
(5, 1, 598, 1, 23, 1, 0, 0),
(6, 1, 599, 2, 1, 1, 0, 0),
(8, 1, 427, 2, 1, 1, 0, 0),
(11, 2, 490, 1, 26, 0, 0, 0),
(12, 2, 601, 2, 2, 0, 0, 0),
(13, 2, 541, 2, 3, 0, 0, 0),
(14, 2, 522, 3, 3, 0, 0, 0),
(15, 2, 528, 1, 2, 0, 0, 0),
(16, 2, 497, 3, 1, 0, 0, 0),
(17, 3, 425, 3, 2, 42, 42, 0),
(18, 3, 522, 2, 3, 42, 42, 0),
(19, 3, 598, 1, 17, 42, 42, 0),
(20, 3, 520, 3, 2, 1, 1, 0),
(22, 3, 451, 3, 3, 42, 42, 0),
(23, 3, 470, 1, 20, 42, 42, 0),
(24, 3, 476, 2, 2, 42, 42, 0),
(25, 3, 433, 3, 2, 42, 42, 0),
(26, 7, 551, 1, 5, 128, 128, 0),
(27, 7, 560, 2, 2, 128, 128, 0),
(28, 7, 487, 3, 3, 128, 128, 0),
(29, 8, 525, 1, 12, 1, 102, 0),
(31, 8, 552, 2, 1, 1, 102, 0),
(36, 11, 469, 1, 40, 0, 0, 0),
(37, 11, 402, 1, 3, 0, 0, 0),
(38, 11, 560, 3, 1, 0, 0, 0),
(39, 11, 487, 3, 2, 0, 0, 0),
(40, 11, 521, 3, 2, 0, 0, 0),
(41, 12, 420, 1, 20, 6, 6, 0),
(43, 12, 438, 1, 15, 6, 6, 0),
(44, 12, 560, 3, 5, 6, 6, 0),
(45, 12, 487, 3, 1, 6, 6, 0),
(47, 12, 602, 2, 3, 6, 6, 0),
(48, 12, 506, 2, 3, 6, 6, 0),
(49, 12, 566, 2, 3, 6, 6, 0),
(50, 13, 416, 1, 25, 1, 3, 0),
(51, 13, 599, 2, 3, 1, 3, 0),
(52, 13, 563, 3, 1, 1, 3, 0),
(61, 15, 409, 1, 5, 128, 0, 0),
(62, 15, 411, 4, 3, 128, 0, 0),
(63, 15, 541, 3, 4, 128, 0, 0),
(64, 15, 560, 3, 4, 128, 0, 0),
(65, 15, 415, 2, 3, 128, 0, 0),
(66, 15, 579, 2, 5, 128, 0, 0),
(67, 8, 443, 3, 5, 65, 65, 0),
(68, 16, 551, 1, 8, 128, 128, 0),
(69, 16, 560, 2, 5, 128, 128, 0),
(70, 16, 487, 1, 5, 128, 128, 0),
(76, 19, 599, 1, 2, 1, 0, 0),
(77, 19, 497, 1, 2, 1, 0, 0),
(78, 19, 597, 1, 10, 1, 0, 0),
(79, 19, 523, 1, 10, 1, 0, 0),
(81, 19, 522, 2, 5, 0, 0, 0),
(82, 19, 411, 2, 3, 1, 1, 0),
(83, 19, 411, 3, 3, 1, 1, 0),
(86, 20, 416, 1, 25, 3, 1, 0),
(87, 20, 544, 1, 10, 3, 1, 0),
(88, 20, 505, 3, 5, 3, 1, 0),
(89, 21, 551, 1, 20, 128, 128, 0),
(92, 21, 560, 2, 5, 128, 128, 0),
(93, 21, 487, 1, 10, 128, 128, 0),
(94, 19, 411, 4, 3, 1, 1, 0),
(95, 22, 525, 1, 12, 1, 102, 0),
(96, 22, 552, 1, 1, 1, 102, 0),
(97, 22, 443, 3, 5, 1, 102, 0),
(98, 23, 487, 4, 4, 117, 117, 0),
(99, 23, 411, 3, 3, 117, 117, 0),
(100, 23, 411, 1, 3, 117, 117, 0),
(102, 23, 541, 2, 3, 117, 0, 0),
(103, 23, 522, 1, 8, 117, 117, 0),
(104, 23, 522, 2, 2, 117, 117, 0),
(116, 14, 598, 1, 20, 127, 1, 0),
(117, 14, 523, 1, 20, 127, 1, 0),
(118, 14, 497, 1, 10, 127, 1, 0),
(119, 14, 522, 2, 10, 127, 1, 0),
(120, 14, 411, 3, 10, 1, 127, 0),
(124, 9, 582, 1, 50, 1, 1, 0),
(126, 9, 488, 0, 20, 1, 1, 0),
(127, 9, 487, 3, 20, 0, 0, 0),
(128, 9, 560, 4, 20, 1, 1, 0),
(129, 9, 431, 5, 2, 1, 1, 0),
(130, 24, 579, 1, 4, 0, 0, 0),
(131, 24, 579, 2, 4, 0, 0, 0),
(132, 24, 490, 1, 2, 0, 0, 0),
(133, 24, 490, 2, 4, 0, 0, 0),
(134, 24, 541, 3, 2, 0, 0, 0),
(135, 24, 411, 4, 6, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transferlog`
--

CREATE TABLE `transferlog` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Name2` varchar(64) NOT NULL,
  `psql1` int(11) NOT NULL,
  `psql2` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `time` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `turfs`
--

CREATE TABLE `turfs` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Owned` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `MinX` float NOT NULL,
  `MinY` float NOT NULL,
  `MaxX` float NOT NULL,
  `MaxY` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `turfs`
--

INSERT INTO `turfs` (`ID`, `Name`, `Owned`, `Time`, `MinX`, `MinY`, `MaxX`, `MaxY`) VALUES
(1, '', 4, 0, 90.8647, -1353.89, 516.865, -925.885),
(2, '', 4, 0, 517.875, -1353.89, 943.875, -925.886),
(3, '', 4, 0, 943.865, -1314.89, 1371.86, -925.885),
(4, '', 4, 24, 1370.85, -1353.89, 1796.85, -925.886),
(5, '', 4, 24, 1798.85, -1353.89, 2224.85, -925.886),
(6, '', 4, 24, 2224.84, -1354.89, 2573.84, -925.886),
(7, '', 4, 24, 2573.83, -1298.89, 2923.83, -925.886),
(8, '', 4, 24, 91.8508, -1781.89, 517.851, -1353.89),
(9, '', 4, 0, 517.851, -1781.89, 943.851, -1353.89),
(10, '', 4, 24, 943.865, -1704.89, 1371.86, -1314.89),
(11, '', 18, 24, 1370.84, -1782.88, 1798.84, -1353.88),
(12, '', 4, 24, 1798.85, -1781.89, 2224.85, -1353.89),
(13, '', 4, 24, 2224.84, -1782.89, 2573.84, -1353.89),
(14, '', 4, 24, 2573.83, -1671.89, 2923.83, -1298.89),
(15, '', 4, 24, 943.832, -2133.88, 1370.83, -1704.88),
(16, '', 4, 24, 943.828, -2561.87, 1369.83, -2131.87),
(17, '', 4, 24, 1372.84, -2210.87, 1798.84, -1782.87),
(18, '', 4, 24, 1798.83, -2210.87, 2224.83, -1782.87),
(19, '', 4, 24, 2224.85, -2210.87, 2573.85, -1781.87),
(20, '', 4, 24, 2573.82, -2100.87, 2922.82, -1671.87),
(21, '', 4, 24, 1372.83, -2639.85, 1798.83, -2211.85),
(22, '', 4, 24, 1798.83, -2639.85, 2224.83, -2211.85),
(23, '', 4, 24, 2224.83, -2640.85, 2573.83, -2211.85),
(24, '', 4, 24, 2573.81, -2530.86, 2922.81, -2101.86),
(25, '', 5, 24, 1108.68, 2464.21, 1484.68, 2894.21),
(26, '', 6, 0, 1484.67, 2464.22, 1860.67, 2894.22),
(27, '', 6, 0, 1860.67, 2464.22, 2236.67, 2894.22),
(28, '', 6, 0, 2235.66, 2464.22, 2611.66, 2894.22),
(29, '', 6, 0, 2610.66, 2464.22, 2986.66, 2894.22),
(30, '', 6, 24, 888.793, 2034.22, 1282.79, 2464.22),
(31, '', 6, 24, 1282.79, 2034.22, 1676.79, 2464.22),
(32, '', 4, 24, 1676.77, 2034.22, 2070.77, 2464.22),
(33, '', 4, 24, 2071.76, 2034.22, 2465.76, 2464.22),
(34, '', 18, 24, 2465.66, 2034.22, 2985.66, 2464.22),
(35, '', 4, 24, 888.789, 1604.22, 1282.79, 2034.22),
(36, '', 4, 24, 1282.79, 1604.22, 1676.79, 2034.22),
(37, '', 4, 24, 1676.77, 1604.22, 2070.77, 2034.22),
(38, '', 4, 24, 2071.76, 1604.22, 2465.76, 2034.22),
(39, '', 4, 24, 2466.76, 1604.22, 2986.76, 2034.22),
(40, '', 4, 24, 887.789, 1174.22, 1281.79, 1604.22),
(41, '', 4, 24, 1282.79, 1174.22, 1676.79, 1604.22),
(42, '', 4, 24, 1676.77, 1174.22, 2070.77, 1604.22),
(43, '', 4, 24, 2071.76, 1174.22, 2465.76, 1604.22),
(44, '', 4, 24, 2466.76, 1174.22, 2986.76, 1604.22),
(45, '', 4, 24, 1282.77, 744.219, 1676.77, 1174.22),
(46, '', 4, 24, 1676.77, 744.219, 2070.77, 1174.22),
(47, '', 4, 24, 2071.76, 744.219, 2465.76, 1174.22),
(48, '', 4, 24, 2466.76, 744.219, 2986.76, 1174.22),
(49, '', 4, 24, -2877.02, -521.938, -2561.02, -208.938),
(50, '', 4, 24, -2561.02, -521.938, -2245.02, -208.938),
(51, '', 4, 24, -2245.02, -521.938, -1929.02, -208.938),
(52, '', 4, 24, -1929.02, -521.938, -1613.02, -208.938),
(53, '', 4, 24, -1929.02, -209.938, -1613.02, 103.062),
(54, '', 4, 24, -2245.02, -209.938, -1929.02, 103.062),
(55, '', 4, 24, -2561.02, -209.938, -2245.02, 103.062),
(56, '', 4, 24, -2877.02, -209.938, -2561.02, 103.062),
(57, '', 4, 24, -2877.02, 102.062, -2561.02, 415.062),
(58, '', 25, 24, -2561.02, 102.062, -2245.02, 415.062),
(59, '', 4, 24, -2245.02, 102.062, -1929.02, 415.062),
(60, '', 25, 24, -1929.02, 102.062, -1613.02, 415.062),
(61, '', 25, 0, -2877.02, 414.062, -2561.02, 727.062),
(62, '', 25, 24, -2561.02, 414.062, -2245.02, 727.062),
(63, '', 25, 24, -2245.02, 414.062, -1929.02, 727.062),
(64, '', 25, 0, -1929.02, 414.062, -1613.02, 727.062),
(65, '', 25, 0, -1805.02, 726.062, -1489.02, 1039.06),
(66, '', 25, 0, -2121.02, 726.062, -1805.02, 1039.06),
(67, '', 25, 0, -2437.02, 726.062, -2121.02, 1039.06),
(68, '', 25, 0, -2753.02, 726.062, -2437.02, 1039.06),
(69, '', 25, 24, -2837.02, 1038.06, -2521.02, 1351.06),
(70, '', 25, 24, -2521.02, 1038.06, -2205.02, 1351.06),
(71, '', 25, 24, -2205.02, 1038.06, -1889.02, 1351.06),
(72, '', 25, 24, -1889.02, 1038.06, -1573.02, 1351.06);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `byAdmin` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `password` varchar(256) NOT NULL,
  `IP` varchar(16) NOT NULL DEFAULT 'Not logged',
  `Level` int(3) NOT NULL DEFAULT 1,
  `Admin` int(2) NOT NULL DEFAULT 0,
  `Helper` int(2) NOT NULL DEFAULT 0,
  `Premium` int(2) NOT NULL DEFAULT 0,
  `ConnectedTime` float NOT NULL DEFAULT 0,
  `Registered` int(2) NOT NULL DEFAULT 0,
  `Sex` int(2) NOT NULL DEFAULT 0,
  `Age` int(3) NOT NULL DEFAULT 0,
  `Muted` int(2) NOT NULL DEFAULT 0,
  `MuteTime` int(11) NOT NULL DEFAULT 0,
  `Respect` int(11) NOT NULL DEFAULT 0,
  `Money` bigint(20) NOT NULL DEFAULT 50000,
  `Bank` bigint(20) NOT NULL DEFAULT 40000,
  `Phonebook` int(2) NOT NULL DEFAULT 0,
  `WantedLevel` int(11) NOT NULL DEFAULT 0,
  `Job` int(3) NOT NULL DEFAULT 0,
  `Jailed` int(2) NOT NULL DEFAULT 0,
  `JailTime` int(11) NOT NULL DEFAULT 0,
  `Materials` int(11) NOT NULL DEFAULT 0,
  `Drugs` int(11) NOT NULL DEFAULT 0,
  `Heroin` int(11) NOT NULL DEFAULT 0,
  `Leader` int(3) NOT NULL DEFAULT 0,
  `Member` int(3) NOT NULL DEFAULT 0,
  `Rank` int(2) NOT NULL DEFAULT 0,
  `FWarn` int(2) NOT NULL DEFAULT 0,
  `FPunish` int(4) NOT NULL DEFAULT 0,
  `Model` int(11) NOT NULL,
  `PhoneNr` varchar(15) NOT NULL DEFAULT '0',
  `PhoneCredits` int(4) NOT NULL DEFAULT 0,
  `House` int(11) NOT NULL DEFAULT 999,
  `Bizz` int(11) NOT NULL DEFAULT 255,
  `Rob` int(11) NOT NULL DEFAULT 0,
  `CarLicT` int(11) NOT NULL DEFAULT 0,
  `CarLic` int(2) NOT NULL DEFAULT 0,
  `FlyLicT` int(11) NOT NULL DEFAULT 0,
  `FlyLic` int(2) NOT NULL DEFAULT 0,
  `BoatLicT` int(11) NOT NULL DEFAULT 0,
  `BoatLic` int(2) NOT NULL DEFAULT 0,
  `FishLicT` int(11) NOT NULL DEFAULT 0,
  `FishLic` int(2) NOT NULL DEFAULT 0,
  `GunLicT` int(11) NOT NULL DEFAULT 0,
  `GunLic` int(2) NOT NULL DEFAULT 0,
  `Tutorial` int(2) NOT NULL DEFAULT 0,
  `Warnings` int(2) NOT NULL DEFAULT 0,
  `Rented` int(111) NOT NULL DEFAULT -1,
  `Fuel` int(11) NOT NULL DEFAULT 0,
  `WTalkie` int(2) NOT NULL DEFAULT 0,
  `Lighter` int(2) NOT NULL DEFAULT 0,
  `Cigarettes` int(2) NOT NULL DEFAULT 0,
  `Email` varchar(50) NOT NULL DEFAULT 'email@yahoo.com',
  `RegisterDate` varchar(50) NOT NULL DEFAULT 'Nu exista',
  `lastOn` varchar(50) NOT NULL DEFAULT 'Nu exista',
  `Radio2` int(2) NOT NULL DEFAULT 0,
  `Status` int(11) NOT NULL DEFAULT -1,
  `Phone` int(11) NOT NULL DEFAULT 0,
  `Accused` varchar(64) NOT NULL DEFAULT '********',
  `Crime1` varchar(184) NOT NULL DEFAULT 'Fara',
  `Crime2` varchar(184) NOT NULL DEFAULT 'Fara',
  `Crime3` varchar(184) NOT NULL DEFAULT 'Fara',
  `ShowJob` int(10) NOT NULL,
  `ShowFP` int(10) NOT NULL,
  `ShowLogo` int(10) NOT NULL DEFAULT 1,
  `ShowCeas` int(10) NOT NULL DEFAULT 1,
  `GoldPoints` int(10) NOT NULL,
  `Clan` int(10) NOT NULL,
  `ClanRank` int(10) NOT NULL,
  `Pin` int(10) NOT NULL DEFAULT 0,
  `Seconds` int(10) NOT NULL,
  `GiftPoints` int(10) NOT NULL,
  `NewbieMute` int(10) NOT NULL,
  `HelpedPlayers` int(10) NOT NULL,
  `SpawnChange` int(10) NOT NULL,
  `DailyMission1` int(11) NOT NULL DEFAULT -1,
  `DailyMission2` int(11) NOT NULL DEFAULT -1,
  `Progress1` int(11) NOT NULL,
  `Progress2` int(11) NOT NULL,
  `NeedProgress1` int(10) NOT NULL,
  `NeedProgress2` int(10) NOT NULL,
  `Youtuber` int(10) NOT NULL,
  `ReportTime` int(10) NOT NULL,
  `WTChannel` int(10) NOT NULL,
  `PizzaSkill` int(10) NOT NULL,
  `GasCan` int(10) NOT NULL,
  `ShowGlasses` int(10) NOT NULL,
  `Glasses` int(10) NOT NULL,
  `HelpedPlayersToday` int(10) NOT NULL,
  `Days` int(10) NOT NULL,
  `FarmerSkill` int(10) NOT NULL,
  `PilotSkill` int(10) NOT NULL,
  `ShowHP` int(10) NOT NULL,
  `ShowAP` int(10) NOT NULL,
  `Color` int(10) NOT NULL,
  `Kicks` int(10) NOT NULL,
  `Warns` int(10) NOT NULL,
  `Bans` int(10) NOT NULL,
  `Jails` int(10) NOT NULL,
  `Mutes` int(10) NOT NULL,
  `HoursMonth` int(10) NOT NULL,
  `Vip` int(10) NOT NULL,
  `Mats` int(10) NOT NULL,
  `ClanWarns` int(10) NOT NULL,
  `ClanDays` int(10) NOT NULL,
  `CarLicS` int(10) NOT NULL,
  `FlyLicS` int(10) NOT NULL,
  `BoatLicS` int(10) NOT NULL,
  `GunLicS` int(10) NOT NULL,
  `ShowDMG` int(10) NOT NULL,
  `EscapePoints` int(10) NOT NULL,
  `AJail` int(10) NOT NULL,
  `Hat` int(10) NOT NULL,
  `ShowHat` int(10) NOT NULL,
  `NewbieChat` int(10) NOT NULL,
  `TogLC` int(10) NOT NULL,
  `TogFC` int(10) NOT NULL,
  `TogWT` int(10) NOT NULL,
  `HidePM` int(10) NOT NULL,
  `TogNews` int(10) NOT NULL,
  `TogLicitatie` int(10) NOT NULL,
  `TogClan` int(10) NOT NULL,
  `TogEvent` int(10) NOT NULL,
  `TogDing` int(10) NOT NULL,
  `PhoneOnline` int(10) NOT NULL,
  `DayLogin` int(10) NOT NULL,
  `AW` int(10) NOT NULL,
  `HW` int(10) NOT NULL,
  `LW` int(10) NOT NULL,
  `Tag` int(10) NOT NULL,
  `Referral` int(11) NOT NULL,
  `ReferralMoney` int(11) NOT NULL,
  `ReferralRP` int(11) NOT NULL,
  `SpecialQuest` varchar(300) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `DM` int(10) NOT NULL,
  `WarKills` int(11) NOT NULL,
  `WarDeaths` int(11) NOT NULL,
  `WarTurf` int(11) NOT NULL,
  `TogVip` int(11) NOT NULL,
  `TogSurf` int(11) NOT NULL,
  `TogFind` int(11) NOT NULL,
  `TogRaport` int(11) NOT NULL,
  `TogJob` int(11) NOT NULL,
  `TogAlert` int(11) NOT NULL,
  `ShowCP` int(11) NOT NULL,
  `AchievementStatus` varchar(256) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `WantedTime` int(10) NOT NULL,
  `ShowProgress1` int(11) NOT NULL,
  `ShowProgress2` int(11) NOT NULL,
  `DailyLogin` int(11) NOT NULL,
  `Backpack` int(11) NOT NULL,
  `BackpackLevel` int(11) NOT NULL DEFAULT 0,
  `Voucher` varchar(50) NOT NULL DEFAULT '0 0 0 0 0',
  `Crates` varchar(100) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|',
  `HudGen` int(11) NOT NULL DEFAULT 1,
  `Skin` varchar(256) NOT NULL DEFAULT '250 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1',
  `DailyBonus` int(11) NOT NULL,
  `PetPoints` int(11) NOT NULL,
  `PetLevel` int(11) NOT NULL DEFAULT 1,
  `PetStatus` int(11) NOT NULL,
  `Pet` int(11) NOT NULL,
  `ShowBanca` int(11) NOT NULL,
  `TogRainBow` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `ShowProgress3` int(11) NOT NULL,
  `JobOwner` int(11) NOT NULL,
  `Tickets` varchar(64) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0',
  `Quest` int(11) NOT NULL,
  `Credit` int(11) NOT NULL,
  `Slot` int(11) NOT NULL DEFAULT 3,
  `TogPremium` int(11) NOT NULL,
  `ShowProgress4` int(11) NOT NULL,
  `QuestFinish` int(11) NOT NULL,
  `Guns` varchar(50) NOT NULL DEFAULT '0 0 0 0 0',
  `DailyActivity` int(11) NOT NULL,
  `BPoints` int(11) NOT NULL,
  `job_skills_points` varchar(50) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `job_skills` varchar(50) NOT NULL DEFAULT '1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1',
  `Fireworks` int(11) NOT NULL,
  `FightStyle` int(11) NOT NULL,
  `PanelNoticeEdited` varchar(100) NOT NULL,
  `PanelNotice` varchar(250) NOT NULL,
  `hunger` varchar(50) NOT NULL DEFAULT '0 0 0 0 0',
  `emotes` varchar(50) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0',
  `KeyEmote1` int(11) NOT NULL DEFAULT -1,
  `KeyEmote2` int(11) NOT NULL DEFAULT -1,
  `CaseBattle` int(11) NOT NULL,
  `Raport` varchar(30) DEFAULT '0 0 0',
  `RaportExpire` int(11) NOT NULL DEFAULT -1,
  `TogTransfer` int(11) NOT NULL DEFAULT 1,
  `TogFriend` int(11) NOT NULL DEFAULT 1,
  `TogJobGoal` int(11) NOT NULL DEFAULT 1,
  `goal` int(11) NOT NULL,
  `DailyMission3` int(11) NOT NULL DEFAULT -1,
  `NeedProgress3` int(11) NOT NULL,
  `Progress3` int(11) NOT NULL,
  `ConnectedMonth` float NOT NULL DEFAULT 0,
  `Tester` tinyint(1) NOT NULL,
  `Responsabil` tinyint(1) NOT NULL,
  `name_and_tag` varchar(50) NOT NULL,
  `panelStyle` int(11) NOT NULL,
  `ticketsArhive` int(11) NOT NULL,
  `complaintsArhive` int(11) NOT NULL,
  `ClanMoney` int(11) NOT NULL,
  `ClanPP` int(11) NOT NULL,
  `PetName` varchar(32) NOT NULL,
  `Acceptpoints` int(11) NOT NULL,
  `Reborn` int(11) NOT NULL,
  `Victim` varchar(32) NOT NULL DEFAULT 'None',
  `shards` varchar(50) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0',
  `lasers` varchar(100) NOT NULL DEFAULT '0 0 0 0 0 0',
  `hats` varchar(100) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0',
  `WantedDeaths` int(11) NOT NULL,
  `Rainbows` varchar(32) NOT NULL DEFAULT '0 0 0 0 0',
  `RainbowType` int(11) NOT NULL,
  `CasinoCredit` int(11) NOT NULL,
  `crime` varchar(144) NOT NULL,
  `TogLegend` int(11) NOT NULL,
  `stats_info` varchar(144) NOT NULL DEFAULT '0 0 0 0 0',
  `ChatColor` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `Stucks` int(11) NOT NULL,
  `Cheaters` int(11) NOT NULL,
  `A_DM` int(11) NOT NULL,
  `Complaints` int(11) NOT NULL,
  `acover` varchar(32) NOT NULL,
  `thema` tinyint(1) NOT NULL,
  `ExpHW` int(11) NOT NULL,
  `ExpLW` int(11) NOT NULL,
  `ExpAW` int(11) NOT NULL,
  `ExpFW` int(11) NOT NULL,
  `Progress4` int(11) NOT NULL,
  `Progress5` int(11) NOT NULL,
  `DailyMission4` int(11) NOT NULL DEFAULT -1,
  `DailyMission5` int(11) NOT NULL DEFAULT -1,
  `NeedProgress4` int(11) NOT NULL,
  `NeedProgress5` int(11) NOT NULL,
  `restriction` int(11) NOT NULL,
  `special_quests` varchar(32) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0',
  `Tier` int(11) NOT NULL,
  `BpExp` int(11) NOT NULL,
  `missions_bp` varchar(144) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `bp_claimed` varchar(144) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `GoldPass` int(11) NOT NULL,
  `in_concurs` int(11) NOT NULL,
  `Parkour` int(11) NOT NULL,
  `ActivePaydays` int(11) NOT NULL,
  `NeonTickets` varchar(65) NOT NULL DEFAULT '0 0 0 0 0 0',
  `special_pet` varchar(64) NOT NULL DEFAULT '0 0 0 0 0 0',
  `ClanAccess` varchar(128) NOT NULL DEFAULT '0 0 0',
  `LottoNumbers` varchar(100) NOT NULL DEFAULT '0 0 0 0 0 0',
  `Accessories` varchar(128) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `AccessoriesOn` varchar(128) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `TogHeadText` int(11) NOT NULL DEFAULT 1,
  `TogCrate` int(11) NOT NULL,
  `FactionInactivity` int(11) NOT NULL DEFAULT -1,
  `free_request_inactivity` int(11) NOT NULL DEFAULT -1,
  `delay_yo` int(11) NOT NULL DEFAULT 0,
  `PhoneStatus` int(11) NOT NULL DEFAULT 1,
  `PhoneCalls` int(11) NOT NULL DEFAULT 1,
  `PhoneMessages` int(11) NOT NULL DEFAULT 1,
  `FactionSpawn` int(10) NOT NULL,
  `TogReborn` int(11) NOT NULL,
  `TogBackpack` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `IP`, `Level`, `Admin`, `Helper`, `Premium`, `ConnectedTime`, `Registered`, `Sex`, `Age`, `Muted`, `MuteTime`, `Respect`, `Money`, `Bank`, `Phonebook`, `WantedLevel`, `Job`, `Jailed`, `JailTime`, `Materials`, `Drugs`, `Heroin`, `Leader`, `Member`, `Rank`, `FWarn`, `FPunish`, `Model`, `PhoneNr`, `PhoneCredits`, `House`, `Bizz`, `Rob`, `CarLicT`, `CarLic`, `FlyLicT`, `FlyLic`, `BoatLicT`, `BoatLic`, `FishLicT`, `FishLic`, `GunLicT`, `GunLic`, `Tutorial`, `Warnings`, `Rented`, `Fuel`, `WTalkie`, `Lighter`, `Cigarettes`, `Email`, `RegisterDate`, `lastOn`, `Radio2`, `Status`, `Phone`, `Accused`, `Crime1`, `Crime2`, `Crime3`, `ShowJob`, `ShowFP`, `ShowLogo`, `ShowCeas`, `GoldPoints`, `Clan`, `ClanRank`, `Pin`, `Seconds`, `GiftPoints`, `NewbieMute`, `HelpedPlayers`, `SpawnChange`, `DailyMission1`, `DailyMission2`, `Progress1`, `Progress2`, `NeedProgress1`, `NeedProgress2`, `Youtuber`, `ReportTime`, `WTChannel`, `PizzaSkill`, `GasCan`, `ShowGlasses`, `Glasses`, `HelpedPlayersToday`, `Days`, `FarmerSkill`, `PilotSkill`, `ShowHP`, `ShowAP`, `Color`, `Kicks`, `Warns`, `Bans`, `Jails`, `Mutes`, `HoursMonth`, `Vip`, `Mats`, `ClanWarns`, `ClanDays`, `CarLicS`, `FlyLicS`, `BoatLicS`, `GunLicS`, `ShowDMG`, `EscapePoints`, `AJail`, `Hat`, `ShowHat`, `NewbieChat`, `TogLC`, `TogFC`, `TogWT`, `HidePM`, `TogNews`, `TogLicitatie`, `TogClan`, `TogEvent`, `TogDing`, `PhoneOnline`, `DayLogin`, `AW`, `HW`, `LW`, `Tag`, `Referral`, `ReferralMoney`, `ReferralRP`, `SpecialQuest`, `DM`, `WarKills`, `WarDeaths`, `WarTurf`, `TogVip`, `TogSurf`, `TogFind`, `TogRaport`, `TogJob`, `TogAlert`, `ShowCP`, `AchievementStatus`, `WantedTime`, `ShowProgress1`, `ShowProgress2`, `DailyLogin`, `Backpack`, `BackpackLevel`, `Voucher`, `Crates`, `HudGen`, `Skin`, `DailyBonus`, `PetPoints`, `PetLevel`, `PetStatus`, `Pet`, `ShowBanca`, `TogRainBow`, `Hidden`, `ShowProgress3`, `JobOwner`, `Tickets`, `Quest`, `Credit`, `Slot`, `TogPremium`, `ShowProgress4`, `QuestFinish`, `Guns`, `DailyActivity`, `BPoints`, `job_skills_points`, `job_skills`, `Fireworks`, `FightStyle`, `PanelNoticeEdited`, `PanelNotice`, `hunger`, `emotes`, `KeyEmote1`, `KeyEmote2`, `CaseBattle`, `Raport`, `RaportExpire`, `TogTransfer`, `TogFriend`, `TogJobGoal`, `goal`, `DailyMission3`, `NeedProgress3`, `Progress3`, `ConnectedMonth`, `Tester`, `Responsabil`, `name_and_tag`, `panelStyle`, `ticketsArhive`, `complaintsArhive`, `ClanMoney`, `ClanPP`, `PetName`, `Acceptpoints`, `Reborn`, `Victim`, `shards`, `lasers`, `hats`, `WantedDeaths`, `Rainbows`, `RainbowType`, `CasinoCredit`, `crime`, `TogLegend`, `stats_info`, `ChatColor`, `Stucks`, `Cheaters`, `A_DM`, `Complaints`, `acover`, `thema`, `ExpHW`, `ExpLW`, `ExpAW`, `ExpFW`, `Progress4`, `Progress5`, `DailyMission4`, `DailyMission5`, `NeedProgress4`, `NeedProgress5`, `restriction`, `special_quests`, `Tier`, `BpExp`, `missions_bp`, `bp_claimed`, `GoldPass`, `in_concurs`, `Parkour`, `ActivePaydays`, `NeonTickets`, `special_pet`, `ClanAccess`, `LottoNumbers`, `Accessories`, `AccessoriesOn`, `TogHeadText`, `TogCrate`, `FactionInactivity`, `free_request_inactivity`, `delay_yo`, `PhoneStatus`, `PhoneCalls`, `PhoneMessages`, `FactionSpawn`, `TogReborn`, `TogBackpack`) VALUES
(1, 'cibu', '7D3261AD6FCB68D1AEEADE6430E9D829FB636C21BD67C16A33D9B2398E7AD447', '127.0.0.1', 1, 7, 0, 0, 0, 0, 0, 16, 0, 0, 6, 51137, 753923, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 250, '0', 0, 999, 255, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, -1, 0, 0, 0, 0, 'cibucristi1@gmail.com', '2023-03-23 19:39:53', '23.03.2023 20:17', 0, -1, 0, '********', 'Fara', 'Fara', 'Fara', 0, 0, 1, 1, 49500, 0, 0, 0, 28, 0, 0, 0, 0, 8, 27, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0', 0, 0, 0, 1, 0, 0, '0 0 0 0 0', '0 0 0 0 0 0 0 0 0 0 0', 1, '250 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '0 0 0 0 0 0 0 0 0 0 0 0', 0, 0, 3, 0, 0, 0, '0 0 0 0 0', 1, 0, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0', '1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1', 0, 0, '', '', '0 0 0 0 0', '0 0 0 0 0 0 0 0 0 0 0 0', -1, -1, 0, '0 0 0', -1, 1, 1, 1, 0, 41, 2, 0, 0.004444, 0, 0, 'cibu', 0, 0, 0, 0, 0, '', 0, 0, 'None', '0 0 0 0 0 0 0 0 0 0 0', '0 0 0 0 0 0', '0 0 0 0 0 0 0 0 0 0 0 0 0', 0, '0 0 0 0 0', 0, 0, '', 0, '0 0 0 0 0', 'FFFFFF', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 42, 15, 2, 1, 0, '0 0 0 0 0 0 0 0 0 0', 0, 0, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0', 0, 0, 0, 1, '1 0 0 0 1 0', '0 0 0 0 0 0', '0 0 0', '0 0 0 0 0 0', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0', '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0', 1, 1, -1, -1, 0, 1, 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `war_logs`
--

CREATE TABLE `war_logs` (
  `ID` int(11) NOT NULL,
  `attackers` int(11) NOT NULL,
  `attackers_score` float NOT NULL,
  `defender` int(11) NOT NULL,
  `defender_score` float NOT NULL,
  `Time` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `war_members`
--

CREATE TABLE `war_members` (
  `ID` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `faction` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `TurfTime` int(11) NOT NULL,
  `for_war` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `banlog`
--
ALTER TABLE `banlog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bizz`
--
ALTER TABLE `bizz`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clanhq`
--
ALTER TABLE `clanhq`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clans`
--
ALTER TABLE `clans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clanvehicle`
--
ALTER TABLE `clanvehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dsveh`
--
ALTER TABLE `dsveh`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `eat_stand`
--
ALTER TABLE `eat_stand`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `factionlog`
--
ALTER TABLE `factionlog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `faction_apply`
--
ALTER TABLE `faction_apply`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `faction_logs`
--
ALTER TABLE `faction_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `graffiti`
--
ALTER TABLE `graffiti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `iplogs`
--
ALTER TABLE `iplogs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `money_logs`
--
ALTER TABLE `money_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `panel_queue`
--
ALTER TABLE `panel_queue`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `safezones`
--
ALTER TABLE `safezones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `sanctions`
--
ALTER TABLE `sanctions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `seif`
--
ALTER TABLE `seif`
  ADD PRIMARY KEY (`sID`);

--
-- Indexes for table `stuff`
--
ALTER TABLE `stuff`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `svehicles`
--
ALTER TABLE `svehicles`
  ADD PRIMARY KEY (`vID`);

--
-- Indexes for table `svf`
--
ALTER TABLE `svf`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transferlog`
--
ALTER TABLE `transferlog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `turfs`
--
ALTER TABLE `turfs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `war_logs`
--
ALTER TABLE `war_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `war_members`
--
ALTER TABLE `war_members`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banlog`
--
ALTER TABLE `banlog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bizz`
--
ALTER TABLE `bizz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clanhq`
--
ALTER TABLE `clanhq`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clans`
--
ALTER TABLE `clans`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clanvehicle`
--
ALTER TABLE `clanvehicle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dsveh`
--
ALTER TABLE `dsveh`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `eat_stand`
--
ALTER TABLE `eat_stand`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=535;

--
-- AUTO_INCREMENT for table `factionlog`
--
ALTER TABLE `factionlog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `faction_apply`
--
ALTER TABLE `faction_apply`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faction_logs`
--
ALTER TABLE `faction_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `graffiti`
--
ALTER TABLE `graffiti`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `iplogs`
--
ALTER TABLE `iplogs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `money_logs`
--
ALTER TABLE `money_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_queue`
--
ALTER TABLE `panel_queue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `safezones`
--
ALTER TABLE `safezones`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sanctions`
--
ALTER TABLE `sanctions`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT for table `seif`
--
ALTER TABLE `seif`
  MODIFY `sID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stuff`
--
ALTER TABLE `stuff`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `svehicles`
--
ALTER TABLE `svehicles`
  MODIFY `vID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `svf`
--
ALTER TABLE `svf`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `transferlog`
--
ALTER TABLE `transferlog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turfs`
--
ALTER TABLE `turfs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `war_logs`
--
ALTER TABLE `war_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `war_members`
--
ALTER TABLE `war_members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
