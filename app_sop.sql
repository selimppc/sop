-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2016 at 06:37 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_sop`
--

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(10) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `description` text,
  `value` decimal(10,2) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `title`, `description`, `value`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'US$', 'US Dollars', '7.50', NULL, NULL, '2016-04-20 21:21:36', '2016-10-11 23:23:46'),
(2, 'Euro', 'Euro', '8.30', NULL, NULL, '2016-04-20 22:19:33', '2016-10-11 23:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `slug` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `title`, `description`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Marketing Department', 'Marketing Department', 'marketing-department', 'active', 0, 0, '2016-03-03 14:06:48', '2016-03-03 14:06:48'),
(2, 'Medicine Department', 'Medicine Department', 'medicine-department', 'active', 0, 0, '2016-03-03 14:07:03', '2016-03-03 14:07:03'),
(3, 'Logistic', 'It''s about logistic.', 'logistic', 'active', 0, 0, '2016-03-05 11:41:13', '2016-03-05 11:41:43'),
(4, 'Sales', 'Verkoop afdeling', 'sales', 'active', 0, 0, '2016-04-12 02:41:40', '2016-04-12 02:41:40'),
(42, 'BIT', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'SIB-SB', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'SIB-SALES', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'SIB-DS', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'SIB-PC', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'SIB GROUP', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'FINANCE/ ADMIN/ HR', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'HSEC-Q', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'MAGAZIJN', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'BUSINESS DEVELOPMENT DEP.', NULL, NULL, 'active', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(20) NOT NULL,
  `material` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `qty_owned` varchar(255) DEFAULT NULL,
  `qty_reserved` varchar(255) DEFAULT NULL,
  `qty_on_order` varchar(255) DEFAULT NULL,
  `qty_available` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `total_cost` varchar(255) DEFAULT NULL,
  `unit_price` varchar(255) DEFAULT NULL,
  `total_sales_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `material`, `category`, `qty_owned`, `qty_reserved`, `qty_on_order`, `qty_available`, `cost`, `total_cost`, `unit_price`, `total_sales_value`) VALUES
(1, 'Cirkelzaag 9"', 'Afwerk Materiaal', '1', '0', '0', '1', '$13.00', '$13.00', '$20.80', '$20.80'),
(2, 'Cirkelzaag blade 6 1/2"', 'Afwerk Materiaal', '2', '0', '0', '2', '$10.00', '$20.00', '$16.00', '$32.00'),
(3, 'Exegetical Fallacies #13', 'Afwerk Materiaal', '0', '0', '0', '0', '', '', '$18.64', '$0.00'),
(4, 'Exegetical Fallacies #4', 'Afwerk Materiaal', '0', '0', '0', '0', '', '', '$18.64', '$0.00'),
(5, 'Flapdisk 4.5"', 'Afwerk Materiaal', '27 pcs.', '0 pcs.', '0 pcs.', '27 pcs.', '$1.66', '$44.82', '$2.32', '$62.64'),
(6, 'Snijschijf 12"', 'Afwerk Materiaal', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$5.26', '$15.78', '$8.42', '$25.26'),
(7, 'Snijschijf 14"', 'Afwerk Materiaal', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$6.43', '$32.15', '$10.29', '$51.45'),
(8, 'Snijschijf 4.5"', 'Afwerk Materiaal', '37 pcs.', '0 pcs.', '0 pcs.', '37 pcs.', '$4.66', '$172.42', '$7.46', '$276.02'),
(9, 'Snijschijf 6"', 'Afwerk Materiaal', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$6.78', '$6.78', '$10.85', '$10.85'),
(10, 'Snijschijf 7 1/4"', 'Afwerk Materiaal', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$6.21', '$12.42', '$9.94', '$19.88'),
(11, 'Snijschijf 9"', 'Afwerk Materiaal', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$19.99', '$59.97', '$31.98', '$95.94'),
(12, 'Electric Paper Creasing Machine', 'Apparaat', '0', '0', '0', '0', '', '', '$376.60', '$0.00'),
(13, 'Hole Punch Kit', 'Apparaat', '0', '0', '0', '0', '', '', '$150.67', '$0.00'),
(14, 'Porter Cable 86902 MTR -11AMPS', 'Apparaat', '0', '0', '0', '0', '', '', '$285.59', '$0.00'),
(15, '38" x 50 yd Forward Banner', 'Banner', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$70.38', '$140.76', '$98.53', '$197.06'),
(16, '54" x 50 ft Canvas Sihl', 'Banner', '1', '0', '0', '1', '$231.00', '$231.00', '$323.40', '$323.40'),
(17, '54" x 50 yd Forward Banner Gloss', 'Banner', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$99.99', '$299.97', '$139.99', '$419.97'),
(18, 'Retractable Banner Stand-Bernini', 'Banner', '16 pcs.', '0 pcs.', '0 pcs.', '16 pcs.', '$22.17', '$354.72', '$31.04', '$496.64'),
(19, 'Aluminium Mig Wire', 'Bevestigings Materiaal', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$12.00', '$36.00', '$21.60', '$64.80'),
(20, 'Spacers Aluminium- Medium (22x40)', 'Bevestigings Materiaal', '15 pcs.', '0 pcs.', '0 pcs.', '15 pcs.', '$3.53', '$52.95', '$4.94', '$74.10'),
(21, 'Spacers Aluminium-Large', 'Bevestigings Materiaal', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$4.09', '$36.81', '$5.73', '$51.57'),
(22, 'Zuignappen', 'Bevestigings Materiaal', '14 pcs.', '0 pcs.', '0 pcs.', '14 pcs.', '$1.75', '$24.50', '$2.45', '$34.30'),
(23, '16?Samurai Blade', 'Blades', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$12.00', '$60.00', '$16.80', '$84.00'),
(24, '20?Samurai Blade', 'Blades', '16 pcs.', '0 pcs.', '0 pcs.', '16 pcs.', '$12.00', '$192.00', '$16.80', '$268.80'),
(25, '26?Samurai Blade', 'Blades', '10', '0', '0', '10', '$12.00', '$120.00', '$16.80', '$168.00'),
(26, '39? Samurai Blade', 'Blades', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$16.80', '$0.00'),
(27, 'V-Cut knife Samurai', 'Blades', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$48.30', '$0.00'),
(28, '3.5" x 0.040 Mill Coil-Accubend', 'Coil', '2', '0', '0', '2', '$120.00', '$240.00', '$162.96', '$325.92'),
(29, '3.5" x 0.063 Mill Coil-Accubend', 'Coil', '2 cases', '0 cases', '0 cases', '2 cases', '$145.00', '$290.00', '$203.00', '$406.00'),
(30, '3.5" x 0.40 Gloss White Coil-Accubend', 'Coil', '1', '0', '0', '1', '$116.40', '$116.40', '$162.96', '$162.96'),
(31, '5.3" x 0.040 Blue Coil-Accubend', 'Coil', '2', '0', '0', '2', '$148.41', '$296.82', '$207.77', '$415.54'),
(32, '5.3" x 0.040 Bright Green Coil-Accubend', 'Coil', '1', '0', '0', '1', '$148.41', '$148.41', '$207.77', '$207.77'),
(33, '5.3" x 0.040 Bright Red Coil-Accubend', 'Coil', '1', '0', '0', '1', '$148.41', '$148.41', '$207.77', '$207.77'),
(34, '5.3" x 0.040 Chevron Blue Coil-Accubend', 'Coil', '2 cases', '0 cases', '0 cases', '2 cases', '$148.41', '$296.82', '$207.77', '$415.54'),
(35, '5.3" x 0.040 Gloss Black Coil-Accubend', 'Coil', '1', '0', '0', '1', '$148.41', '$148.41', '$207.77', '$207.77'),
(36, '5.3" x 0.040 Gloss Red Coil-Accubend', 'Coil', '1', '0', '0', '1', '$148.41', '$148.41', '$207.77', '$207.77'),
(37, '5.3" x 0.040 White Coil-Accubend', 'Coil', '1', '0', '0', '1', '$148.41', '$148.41', '$207.77', '$207.77'),
(38, '5.3" x 0.040 Yellow Coil-Accubend', 'Coil', '1', '0', '0', '1', '$148.41', '$148.41', '$207.77', '$207.77'),
(39, '5.3" x 0.063 Mill Coil-Accubend', 'Coil', '2 cases', '0 cases', '0 cases', '2 cases', '$290.00', '$580.00', '$406.00', '$812.00'),
(40, 'Ballast 74465-110V', 'Ballasten', '0', '0', '0', '0', '', '', '$33.56', '$0.00'),
(41, 'Ballast T8 -93868      120V', 'Ballasten', '130 pcs.', '0 pcs.', '0 pcs.', '130 pcs.', '$44.38', '$5,769.40', '$71.01', '$9,231.30'),
(42, 'Floodlight Outdoor Spotlight 65 Watt', 'Led lampen', '8', '0', '0', '8', '$39.99', '$319.92', '$63.98', '$511.84'),
(43, 'LED Blauw 3 dot-AVL', 'Led lampen', '329 pcs.', '0 pcs.', '0 pcs.', '329 pcs.', '$1.20', '$394.80', '$1.68', '$552.72'),
(44, 'LED Blauw1 dot-AVL', 'Led lampen', '150 pcs.', '0 pcs.', '0 pcs.', '150 pcs.', '$0.75', '$112.50', '$1.05', '$157.50'),
(45, 'LED Controller Box with remote', 'Led lampen', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$3.77', '$15.08', '$5.28', '$21.12'),
(46, 'LED RGB -AVL', 'Led lampen', '1,050 pcs.', '0 pcs.', '0 pcs.', '1,050 pcs.', '$1.85', '$1,942.50', '$2.59', '$2,719.50'),
(47, 'LED Rood - Hanley P2072R', 'Led lampen', '100 pcs.', '0 pcs.', '0 pcs.', '100 pcs.', '$1.75', '$175.00', '$2.45', '$245.00'),
(48, 'LED Rood 3 dot (rood)-AVL', 'Led lampen', '500 pcs.', '0 pcs.', '0 pcs.', '500 pcs.', '$1.20', '$600.00', '$1.68', '$840.00'),
(49, 'LED Rood 3 dot( wit)-AVL', 'Led lampen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$1.68', '$0.00'),
(50, 'LED Wit  3 dot -AVL', 'Led lampen', '350 pcs.', '0 pcs.', '0 pcs.', '350 pcs.', '$1.15', '$402.50', '$1.61', '$563.50'),
(51, 'LED Wit 1 dot-AVL', 'Led lampen', '500 pcs.', '0 pcs.', '0 pcs.', '500 pcs.', '$0.65', '$325.00', '$0.91', '$455.00'),
(52, 'LED Wit- Hanley G1270', 'Led lampen', '120 pcs.', '0 pcs.', '0 pcs.', '120 pcs.', '$4.98', '$597.60', '$6.97', '$836.40'),
(53, 'LED Wit- Hanley P2072W', 'Led lampen', '2,854 pcs.', '0 pcs.', '0 pcs.', '2,854 pcs.', '$1.75', '$4,994.50', '$2.45', '$6,992.30'),
(54, 'Replacement Bulb', 'Led lampen', '5', '0', '0', '5', '$29.95', '$149.75', '$47.92', '$239.60'),
(55, 'TL-Buis 18 Watt-Daylight (Phillips)', 'TL-Buizen', '33 pcs.', '0 pcs.', '0 pcs.', '33 pcs.', '$1.25', '$41.25', '$2.00', '$66.00'),
(56, 'TL-Buis 18 Watt-Warmlight', 'TL-Buizen', '3', '0', '0', '3', '$1.56', '$4.68', '$2.50', '$7.50'),
(57, 'TL-Buis 20 Watt', 'TL-Buizen', '19', '0', '0', '19', '$0.27', '$5.13', '$0.43', '$8.17'),
(58, 'TL-Buis 40 Watt(Phillips)', 'TL-Buizen', '13 pcs.', '0 pcs.', '0 pcs.', '13 pcs.', '$0.47', '$6.11', '$0.75', '$9.75'),
(59, 'Powersupply 190 Watt', 'Trafo', '0', '0', '0', '0', '', '', '$259.00', '$0.00'),
(60, 'Powersupply Premium 60W-Hanley', 'Trafo', '82 pcs.', '0 pcs.', '0 pcs.', '82 pcs.', '$32.66341', '$2,678.40', '$55.93', '$4,586.26'),
(61, 'Blikkeschaar', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$61.14', '$0.00'),
(62, 'C- Klemmen 4"', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$14.40', '$0.00'),
(63, 'Compound Miter with Laser', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$681.76', '$0.00'),
(64, 'Conische boorset', 'Gereedschappen', '0', '0', '0', '0', '', '', '$46.08', '$0.00'),
(65, 'Cordless Drill', 'Gereedschappen', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$84.00', '$84.00', '$126.24', '$126.24'),
(66, 'Cordless Grinder', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$200.50', '$0.00'),
(67, 'Electromagnetic Valve-SV110-24V', 'Gereedschappen', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$75.00', '$75.00', '$120.00', '$120.00'),
(68, 'Foot Switch', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$25.90', '$0.00'),
(69, 'Hex key set', 'Gereedschappen', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$25.51', '$51.02', '$40.82', '$81.64'),
(70, 'High Pressure kit', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$189.00', '$0.00'),
(71, 'Hobby Blades', 'Gereedschappen', '100 pcs.', '0 pcs.', '0 pcs.', '100 pcs.', '$0.11', '$11.00', '$0.15', '$15.40'),
(72, 'Hoist Pushbutton Switch', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$12.52', '$0.00'),
(73, 'Jig saw', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$55.95', '$0.00'),
(74, 'Kabel Stripper', 'Gereedschappen', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$19.97', '$19.97', '$30.67', '$30.67'),
(75, 'Locking Sheet Metal tool', 'Gereedschappen', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$15.18', '$45.54', '$24.29', '$72.87'),
(76, 'Long Handle Scraper Blade', 'Gereedschappen', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$3.00', '$6.00', '$4.80', '$9.60'),
(77, 'Long key set', 'Gereedschappen', '0', '0', '0', '0', '', '', '$21.65', '$0.00'),
(78, 'Mig Gun', 'Gereedschappen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$345.16', '$0.00'),
(79, 'Power knife', 'Gereedschappen', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$2.42', '$9.68', '$3.39', '$13.56'),
(80, 'Razor blade Holder', 'Gereedschappen', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$5.00', '$15.00', '$7.00', '$21.00'),
(81, 'Relay', 'Gereedschappen', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$24.20', '$72.60', '$33.88', '$101.64'),
(82, 'Retractable Knife', 'Gereedschappen', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$13.87', '$97.09', '$19.42', '$135.94'),
(83, 'Scraper blade', 'Gereedschappen', '47', '0', '0', '47', '$9.96', '$468.12', '$13.94', '$655.18'),
(84, 'Socket Set', 'Gereedschappen', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$73.82', '$221.46', '$118.11', '$354.33'),
(85, 'Sooper Safety Ruler 28"', 'Gereedschappen', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$59.95', '$59.95', '$83.93', '$83.93'),
(86, 'Sooper Safety Ruler"76', 'Gereedschappen', '1', '0', '0', '1', '$136.87', '$136.87', '$191.62', '$191.62'),
(87, 'Stabilizer 8000W', 'Gereedschappen', '1', '0', '0', '1', '$259.99', '$259.99', '$415.98', '$415.98'),
(88, 'Utility Knife 100 pack', 'Gereedschappen', '389 pcs.', '0 pcs.', '0 pcs.', '389 pcs.', '$12.64', '$4,916.96', '$17.70', '$6,885.30'),
(89, 'Wrench Set', 'Gereedschappen', '0 cases', '0 cases', '0 cases', '0 cases', '', '', '$56.00', '$0.00'),
(90, 'Acrylic Letter Making Tool bender', 'Hulp Materiaal', '1', '0', '0', '1', '$33.71', '$33.71', '$47.19', '$47.19'),
(91, 'Aluminium Cutting Head', 'Hulp Materiaal', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$101.00', '$101.00', '$161.60', '$161.60'),
(92, 'Banner Grip Clamp', 'Hulp Materiaal', '402 pcs.', '0 pcs.', '0 pcs.', '402 pcs.', '$1.25', '$502.50', '$1.75', '$703.50'),
(93, 'Bezem Stok-Hout', 'Hulp Materiaal', '1', '0', '0', '1', '$4.50', '$4.50', '$6.30', '$6.30'),
(94, 'Black Print on White Tape', 'Hulp Materiaal', '1', '0', '0', '1', '$11.00', '$11.00', '$17.60', '$17.60'),
(95, 'Carpenter pencil', 'Hulp Materiaal', '2', '0', '0', '2', '$13.71', '$27.42', '$21.94', '$43.88'),
(96, 'Cementboard Plugs', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$0.34', '$0.00'),
(97, 'China Marker Rood', 'Hulp Materiaal', '2', '0', '0', '2', '$0.75', '$1.50', '$1.20', '$2.40'),
(98, 'China Marker Wit', 'Hulp Materiaal', '13', '0', '0', '13', '$0.75', '$9.75', '$1.20', '$15.60'),
(99, 'Cleaning Swabs Roland', 'Hulp Materiaal', '200 pcs.', '0 pcs.', '0 pcs.', '200 pcs.', '$0.1163', '$23.26', '$0.16', '$32.56'),
(100, 'Duster Ostrich feather', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$17.49', '$0.00'),
(101, 'Fixture Putty-Pad Printing', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$29.40', '$0.00'),
(102, 'Galvaan Meubelbuis 30 x 30', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$12.94', '$0.00'),
(103, 'Galvaanhoek -30 x30', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$18.18', '$0.00'),
(104, 'Grommets', 'Hulp Materiaal', '1,000 pcs.', '0 pcs.', '0 pcs.', '1,000 pcs.', '$15.37', '$15,370.00', '$21.52', '$21,518.00'),
(105, 'Handcleaner Kimberly Clarke', 'Hulp Materiaal', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$62.28', '$124.56', '$87.19', '$174.38'),
(106, 'Hardener-Tampo Print', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$26.60', '$0.00'),
(107, 'H-Shape Profiel White 13mm', 'Hulp Materiaal', '20 pcs.', '0 pcs.', '0 pcs.', '20 pcs.', '$8.75', '$175.00', '$12.25', '$245.00'),
(108, 'Ink Damper Roland Original', 'Hulp Materiaal', '2', '0', '0', '2', '$24.17', '$48.34', '$33.84', '$67.68'),
(109, 'Ink Filter for Teckwin SOlvent', 'Hulp Materiaal', '9', '0', '0', '9', '$9.76', '$87.84', '$13.66', '$122.94'),
(110, 'Ink Pipe', 'Hulp Materiaal', '5', '0', '0', '5', '$6.40', '$32.00', '$8.96', '$44.80'),
(111, 'Kwast verf', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$1.60', '$0.00'),
(112, 'Lasdraad Hilco-K60', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$27.89', '$0.00'),
(113, 'LED Cable Paige Plus-Rip Strip', 'Hulp Materiaal', '2 cases', '0 cases', '0 cases', '2 cases', '$197.33', '$394.66', '$276.26', '$552.52'),
(114, 'Let-R-Edge', 'Hulp Materiaal', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$520.00', '$1,040.00', '$728.00', '$1,456.00'),
(115, 'Migdraad Harris', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$153.60', '$0.00'),
(116, 'Nozzle Dip-Wel-Aid', 'Hulp Materiaal', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$10.36', '$20.72', '$14.50', '$29.00'),
(117, 'Nozzle-Kleen Spray-Weld-Aid', 'Hulp Materiaal', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$5.90', '$23.60', '$8.26', '$33.04'),
(118, 'Plastic Verpakkings Materiaal', 'Hulp Materiaal', '1,750 pcs.', '0 pcs.', '0 pcs.', '1,750 pcs.', '$0.851', '$1,489.25', '$1.36', '$2,380.00'),
(119, 'Pop nagels', 'Hulp Materiaal', '100', '0', '0', '100', '$4.54', '$454.00', '$6.36', '$636.00'),
(120, 'Postbus-Klein', 'Hulp Materiaal', '1', '0', '0', '1', '$5.00', '$5.00', '$8.00', '$8.00'),
(121, 'Pressure Washer Hose', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$121.79', '$0.00'),
(122, 'Propane Benzormatic', 'Hulp Materiaal', '1', '0', '0', '1', '$9.42', '$9.42', '$15.07', '$15.07'),
(123, 'Roland Printhead VP540', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$754.60', '$0.00'),
(124, 'Sandwich Board', 'Hulp Materiaal', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$48.00', '$192.00', '$67.20', '$268.80'),
(125, 'Screen Print-200 LP', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$105.00', '$0.00'),
(126, 'Sealent Sabatack Wit 780', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$15.20', '$0.00'),
(127, 'Self Healing Mat (4" x 8)', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$195.06', '$0.00'),
(128, 'Snap On Jumbo-Clear Female', 'Hulp Materiaal', '240 pcs.', '0 pcs.', '0 pcs.', '240 pcs.', '$0.14', '$33.60', '$0.20', '$48.00'),
(129, 'Snap On Plugs -Jumbo Black Female', 'Hulp Materiaal', '294 pcs.', '0 pcs.', '0 pcs.', '294 pcs.', '$0.12', '$35.28', '$0.17', '$49.98'),
(130, 'Snap On Plugs- Jumbo Clear Male', 'Hulp Materiaal', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$0.14', '$0.98', '$0.20', '$1.40'),
(131, 'Snap On-White Female', 'Hulp Materiaal', '201', '0', '0', '201', '$0.12', '$24.12', '$0.17', '$34.17'),
(132, 'Sooper Safety Ruler 52"', 'Hulp Materiaal', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$117.95', '$117.95', '$165.13', '$165.13'),
(133, 'Spray Bottle', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$4.00', '$0.00'),
(134, 'Sproeier', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$7.20', '$0.00'),
(135, 'Stack-On drawer storage Cabinet', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$34.45', '$0.00'),
(136, 'Terpentine', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$6.40', '$0.00'),
(137, 'Thinner -Tampo Print', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$32.20', '$0.00'),
(138, 'Tie wrap', 'Hulp Materiaal', '100', '0', '0', '100', '$2.00', '$200.00', '$3.20', '$320.00'),
(139, 'Tool Holder', 'Hulp Materiaal', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$10.04', '$20.08', '$14.06', '$28.12'),
(140, 'Ulano QX-1 Emulsion', 'Hulp Materiaal', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$111.99', '$0.00'),
(141, 'UV Resistant Ink Filter 5 micron Capsule', 'Hulp Materiaal', '6', '0', '0', '6', '$9.65', '$57.90', '$13.51', '$81.06'),
(142, 'Veren Afstoffer', 'Hulp Materiaal', '2', '0', '0', '2', '$3.00', '$6.00', '$4.80', '$9.60'),
(143, 'Verf rol', 'Hulp Materiaal', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$6.99', '$20.97', '$11.18', '$33.54'),
(144, 'Verf wit-olie', 'Hulp Materiaal', '3', '0', '0', '3', '$11.99', '$35.97', '$19.18', '$57.54'),
(145, 'Verf Zeef', 'Hulp Materiaal', '0', '0', '0', '0', '', '', '$0.48', '$0.00'),
(146, 'V-Groove Attachment', 'Hulp Materiaal', '1', '0', '0', '1', '$171.00', '$171.00', '$239.40', '$239.40'),
(147, 'WD- 40', 'Hulp Materiaal', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$12.70', '$25.40', '$17.78', '$35.56'),
(148, 'Wiper Original Roland', 'Hulp Materiaal', '6', '0', '0', '6', '$14.38', '$86.28', '$20.13', '$120.78'),
(149, 'Wooden dowel', 'Hulp Materiaal', '36 pcs.', '0 pcs.', '0 pcs.', '36 pcs.', '$2.49', '$89.64', '$3.49', '$125.64'),
(150, 'Black Ink-Tampo Print', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$99.40', '$0.00'),
(151, 'Black Pad Printing -PP 073', 'Ink', '0', '0', '0', '0', '', '', '$140.00', '$0.00'),
(152, 'Cleaning Solution 1 liter', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$99.99', '$99.99', '$139.99', '$139.99'),
(153, 'Eco-Sol Max 2- Black 440 cc', 'Ink', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$118.99', '$237.98', '$166.59', '$333.18'),
(154, 'Eco-Sol Max 2- Cyan 440 cc', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$118.99', '$118.99', '$166.59', '$166.59'),
(155, 'Eco-Sol Max 2 -Light Black 440 cc', 'Ink', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$118.99', '$356.97', '$166.59', '$499.77'),
(156, 'Eco-Sol Max 2-Light Cyan 440 cc', 'Ink', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$118.99', '$237.98', '$166.59', '$333.18'),
(157, 'Eco-Sol Max 2-Light Magenta 440 cc', 'Ink', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$118.99', '$237.98', '$166.59', '$333.18'),
(158, 'Eco-Sol Max 2-Magenta 440 cc', 'Ink', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$118.99', '$237.98', '$166.59', '$333.18'),
(159, 'Eco-Sol Max 2-Metalic Silver 220 cc', 'Ink', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$239.99', '$479.98', '$335.99', '$671.98'),
(160, 'Eco-Sol Max 2-Yellow 440 cc', 'Ink', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$118.99', '$356.97', '$166.59', '$499.77'),
(161, 'Eco-Sol Max ESL3-4 Black 440 cc', 'Ink', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$73.99', '$369.95', '$103.59', '$517.95'),
(162, 'Eco-Sol Max ESL3-4 Cyan      440 cc', 'Ink', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$73.99', '$369.95', '$103.59', '$517.95'),
(163, 'Eco-Sol Max ESL3-4 Magenta 440 cc', 'Ink', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$73.99', '$369.95', '$103.59', '$517.95'),
(164, 'Eco-Sol Max ESL3-4 Yellow 440 cc', 'Ink', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$73.99', '$369.95', '$103.59', '$517.95'),
(165, 'Eco-solvent Black 1 liter', 'Ink', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$112.99', '$564.95', '$158.19', '$790.95'),
(166, 'Eco-solvent Cyan 1 liter', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$158.19', '$0.00'),
(167, 'Eco-solvent Magenta1 liter', 'Ink', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$112.99', '$338.97', '$158.19', '$474.57'),
(168, 'Eco-solvent Yellow1 liter', 'Ink', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$112.99', '$225.98', '$158.19', '$316.38'),
(169, 'Konica Toner TN 314Y Yellow', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$172.78', '$0.00'),
(170, 'Konica Toner TN314 Cyan', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$107.99', '$107.99', '$151.19', '$151.19'),
(171, 'Konica Toner TN314K Black', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$63.11', '$63.11', '$88.35', '$88.35'),
(172, 'Konica Toner TN314M Magenta', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$107.99', '$107.99', '$151.19', '$151.19'),
(173, 'Konica Toner TN321C Cyan', 'Ink', '0', '0', '0', '0', '', '', '$151.19', '$0.00'),
(174, 'Konica Toner TN321K Black', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$125.86', '$0.00'),
(175, 'Konica Toner TN321M Magenta', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$64.39', '$0.00'),
(176, 'Konica Toner TN321Y Yellow', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$176.12', '$0.00'),
(177, 'Medium Blue Ink-Tampo Print', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$107.80', '$0.00'),
(178, 'Pad Printing Ink Thinner', 'Ink', '0', '0', '0', '0', '', '', '$66.50', '$0.00'),
(179, 'Primer Clear for Substrates', 'Ink', '1', '0', '0', '1', '$39.50', '$39.50', '$55.30', '$55.30'),
(180, 'Royal Blue Pad Printing-PP 059', 'Ink', '0', '0', '0', '0', '', '', '$165.20', '$0.00'),
(181, 'UV Ink Black', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$73.25', '$73.25', '$102.55', '$102.55'),
(182, 'UV Ink Cyan', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$73.25', '$73.25', '$102.55', '$102.55'),
(183, 'UV Ink Flush', 'Ink', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$43.50', '$217.50', '$60.90', '$304.50'),
(184, 'UV Ink LT Cyan', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$73.25', '$73.25', '$102.55', '$102.55'),
(185, 'UV Ink LT.Magenta', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$73.25', '$73.25', '$102.55', '$102.55'),
(186, 'UV Ink Magenta', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$73.25', '$73.25', '$102.55', '$102.55'),
(187, 'UV Ink Yellow', 'Ink', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$73.25', '$73.25', '$102.55', '$102.55'),
(188, 'White Ink-Tampo Print', 'Ink', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$109.20', '$0.00'),
(189, 'White Pad Printing-PP 070', 'Ink', '0', '0', '0', '0', '', '', '$140.00', '$0.00'),
(190, 'Insectide', 'Insecticide Spray', '0', '0', '0', '0', '', '', '$7.20', '$0.00'),
(191, 'AA Batterijen', 'Kantoorbenodigheden', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$1.00', '$2.00', '$1.60', '$3.20'),
(192, 'AAA Batterijen', 'Kantoorbenodigheden', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$1.00', '$6.00', '$1.60', '$9.60'),
(193, 'Badge Clips', 'Kantoorbenodigheden', '361', '0', '0', '361', '$0.45', '$162.45', '$0.63', '$227.43'),
(194, 'Bluetooth Speakerphone', 'Kantoorbenodigheden', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$57.58', '$0.00'),
(195, 'Fax film', 'Kantoorbenodigheden', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$6.99', '$6.99', '$11.18', '$11.18'),
(196, 'Film Ribbon', 'Kantoorbenodigheden', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$8.50', '$8.50', '$13.60', '$13.60'),
(197, 'HDMI', 'Kantoorbenodigheden', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$5.49', '$27.45', '$8.78', '$43.90'),
(198, 'Lithium -ion Batterij', 'Kantoorbenodigheden', '0', '0', '0', '0', '', '', '$9.50', '$0.00'),
(199, 'Monitor 23"', 'Kantoorbenodigheden', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$263.70', '$0.00'),
(200, 'Monitor 27"', 'Kantoorbenodigheden', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$204.99', '$204.99', '$327.98', '$327.98'),
(201, 'Paper Tray Pack Thermal Receipt', 'Kantoorbenodigheden', '10 pcs.', '0 pcs.', '0 pcs.', '10 pcs.', '$9.99', '$99.90', '$15.98', '$159.80'),
(202, 'Portable Mini Printer', 'Kantoorbenodigheden', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$87.99', '$87.99', '$140.78', '$140.78'),
(203, 'Schaar', 'Kantoorbenodigheden', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$5.33', '$0.00'),
(204, 'Sharpie stift', 'Kantoorbenodigheden', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$1.90', '$0.00'),
(205, 'SIB Pennen', 'Kantoorbenodigheden', '150 pcs.', '0 pcs.', '0 pcs.', '150 pcs.', '$1.25', '$187.50', '$2.00', '$300.00'),
(206, 'Sleutelringen', 'Kantoorbenodigheden', '2,521 pcs.', '0 pcs.', '0 pcs.', '2,521 pcs.', '$0.0001', '$0.25', '$0.08', '$201.68'),
(207, 'Turntable', 'Kantoorbenodigheden', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$25.13', '$0.00'),
(208, 'UPS', 'Kantoorbenodigheden', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$137.00', '$137.00', '$191.80', '$191.80'),
(209, 'Video Camera Stabilizer', 'Kantoorbenodigheden', '0', '0', '0', '0', '', '', '$99.97', '$0.00'),
(210, 'Voorraad bakken', 'Kantoorbenodigheden', '9', '0', '0', '9', '$2.97', '$26.73', '$4.75', '$42.75'),
(211, 'Wireless Keyboard', 'Kantoorbenodigheden', '1', '0', '0', '1', '$20.00', '$20.00', '$32.00', '$32.00'),
(212, 'Wireless Keyboard Logitech and Mouse', 'Kantoorbenodigheden', '0', '0', '0', '0', '', '', '$33.52', '$0.00'),
(213, 'Wireless Mouse', 'Kantoorbenodigheden', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$69.99', '$0.00'),
(214, '14 x 38 mm  Stamp Brother-Black', 'Stempels', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$7.65', '$53.55', '$10.71', '$74.97'),
(215, '14 x 38 mm  Stamp Brother-Blue', 'Stempels', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$7.65', '$68.85', '$10.71', '$96.39'),
(216, '14 X 38 mm  Stamp Brother-Red', 'Stempels', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$7.65', '$45.90', '$10.71', '$64.26'),
(217, '22 x 60 mm Stamp Brother-Black', 'Stempels', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$11.65', '$81.55', '$16.31', '$114.17'),
(218, '22 x 60 mm Stamp Brother-Blue', 'Stempels', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$11.65', '$23.30', '$16.31', '$32.62'),
(219, '22 x 60 mm Stamp Brother-Red', 'Stempels', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$11.65', '$104.85', '$16.31', '$146.79'),
(220, '27 x 70 mm  Stamp Brother-Black', 'Stempels', '12 pcs.', '0 pcs.', '0 pcs.', '12 pcs.', '$13.32', '$159.84', '$18.65', '$223.80'),
(221, '27 x 70 mm Stamp Brother-Blue', 'Stempels', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$18.65', '$0.00'),
(222, '27 x 70 mm Stamp Brother-Red', 'Stempels', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$13.32', '$79.92', '$18.65', '$111.90'),
(223, '34 x 58 mm  Stamp Brother-Blue', 'Stempels', '12 pcs.', '0 pcs.', '0 pcs.', '12 pcs.', '$2.22', '$26.64', '$3.11', '$37.32'),
(224, '34 x 58 mm  Stamp Brother-Red', 'Stempels', '11 pcs.', '0 pcs.', '0 pcs.', '11 pcs.', '$2.22', '$24.42', '$17.93', '$197.23'),
(225, '34 x 58 mm Stamp Brother-Black', 'Stempels', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$2.22', '$13.32', '$3.11', '$18.66'),
(226, '40 x 40 mm Stamp Brother -Black', 'Stempels', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$12.33', '$49.32', '$17.26', '$69.04'),
(227, '40 x 40 mm Stamp Brother-Blue', 'Stempels', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$12.33', '$61.65', '$17.25', '$86.25'),
(228, '40 x 40 mm Stamp Brother-Red', 'Stempels', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$12.33', '$49.32', '$17.26', '$69.04'),
(229, '40 x 90 mm Stamp Brother- Black', 'Stempels', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$19.34', '$77.36', '$27.08', '$108.32'),
(230, '40 x 90 mm Stamp Brother-Blue', 'Stempels', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$19.34', '$77.36', '$27.08', '$108.32'),
(231, '40 x 90 mm Stamp Brother-Red', 'Stempels', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$19.34', '$116.04', '$27.08', '$162.48'),
(232, '3M Primer 94 Adhesive', 'Lijm', '12 pcs.', '0 pcs.', '0 pcs.', '12 pcs.', '$12.50', '$150.00', '$17.50', '$210.00'),
(233, 'Cyano Adhesive-Illbruck', 'Lijm', '1', '0', '0', '1', '$2.75', '$2.75', '$4.40', '$4.40'),
(234, 'Hercuseal Acryl Superior', 'Lijm', '0', '0', '0', '0', '', '', '$16.00', '$0.00'),
(235, 'Illbruck PU700', 'Lijm', '5', '0', '0', '5', '$11.00', '$55.00', '$17.60', '$88.00'),
(236, 'Illbruck SP350 Wit', 'Lijm', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$1.00', '$5.00', '$16.00', '$80.00'),
(237, 'Quick Snap Glue', 'Lijm', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$19.35', '$0.00'),
(238, 'Snap On-Illbruck', 'Lijm', '8', '0', '0', '8', '$2.66', '$21.28', '$4.26', '$34.08'),
(239, 'Weld On #16-Tube 5oz', 'Lijm', '11', '0', '0', '11', '$5.77', '$63.47', '$8.08', '$88.88'),
(240, 'Weld On Acrylics #16', 'Lijm', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$4.86', '$0.00'),
(241, '24" x16.6 yd Magnetic Sheet', 'Magnetic Roll', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$123.20', '$0.00'),
(242, '36" x 50 yd Clear 3 mil', 'Laminaat', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$89.83', '$538.98', '$124.18', '$745.08'),
(243, '48" x 50 yd Clear 3 mil', 'Laminaat', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$119.99', '$599.95', '$167.99', '$839.95'),
(244, '54" x 50 yd Clear 3 mil', 'Laminaat', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$148.95286', '$893.72', '$205.53', '$1,233.18'),
(245, 'Aluminium Sheet Coated', 'Platen', '88 pcs.', '0 pcs.', '0 pcs.', '88 pcs.', '$37.83', '$3,329.04', '$52.96', '$4,660.48'),
(246, 'Mica Rood', 'Platen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$100.80', '$0.00'),
(247, 'Alucobond 1 sided 3 mm-Max-Metal', 'Aluconbond', '65 pcs.', '0 pcs.', '0 pcs.', '65 pcs.', '$34.00', '$2,210.00', '$47.60', '$3,094.00'),
(248, 'Alucobond 2 sided 3 mm', 'Aluconbond', '10', '0', '0', '10', '$60.95', '$609.50', '$85.33', '$853.30'),
(249, 'Alucobond 2 sided 6 mm-Max-Metal', 'Aluconbond', '9', '0', '0', '9', '$105.95', '$953.55', '$148.33', '$1,334.97'),
(250, 'Alucobond Chrome-Go2', 'Aluconbond', '8 pcs.', '0 pcs.', '0 pcs.', '8 pcs.', '$408.00', '$3,264.00', '$571.20', '$4,569.60'),
(251, 'Alucobond Chrome-Max-Metal', 'Aluconbond', '35 pcs.', '0 pcs.', '0 pcs.', '35 pcs.', '$79.95', '$2,798.25', '$111.93', '$3,917.55'),
(252, 'Alucobond HD-Max-Metal', 'Aluconbond', '41 pcs.', '0 pcs.', '0 pcs.', '41 pcs.', '$92.95', '$3,810.95', '$130.13', '$5,335.33'),
(253, 'Poly Uretheen (Boris plaat)', 'Borisplaat', '14 pcs.', '0 pcs.', '0 pcs.', '14 pcs.', '$25.37', '$355.18', '$35.52', '$497.28'),
(254, 'Karton 1.5 mm', 'Karton', '138 pcs.', '0 pcs.', '0 pcs.', '138 pcs.', '$6.17', '$851.46', '$8.64', '$1,192.32'),
(255, 'Karton 13 mm', 'Karton', '67 pcs.', '0 pcs.', '0 pcs.', '67 pcs.', '$21.45', '$1,437.15', '$30.03', '$2,012.01'),
(256, 'Karton 3 mm', 'Karton', '114 pcs.', '0 pcs.', '0 pcs.', '114 pcs.', '$5.02', '$572.28', '$7.03', '$801.42'),
(257, 'Karton White Flute 3 mm', 'Karton', '20', '0', '0', '20', '$3.50', '$70.00', '$4.90', '$98.00'),
(258, 'Karton White Flute 6 mm', 'Karton', '20', '0', '0', '20', '$3.38', '$67.60', '$4.73', '$94.60'),
(259, 'Mica Blauw 3 mm', 'Mica', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$72.00', '$432.00', '$100.80', '$604.80'),
(260, 'Mica Clear 12 mm', 'Mica', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$240.00', '$720.00', '$336.00', '$1,008.00'),
(261, 'Mica Clear 3 mm', 'Mica', '22 pcs.', '0 pcs.', '0 pcs.', '22 pcs.', '$64.00', '$1,408.00', '$89.60', '$1,971.20'),
(262, 'Mica Clear 5 mm', 'Mica', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$134.40', '$0.00'),
(263, 'Mica Geel 3 mm', 'Mica', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$72.00', '$216.00', '$100.80', '$302.40'),
(264, 'Mica Oranje 3 mm', 'Mica', '6', '0', '0', '6', '$72.00', '$432.00', '$100.80', '$604.80'),
(265, 'Mica Wit 3 mm', 'Mica', '11 pcs.', '0 pcs.', '0 pcs.', '11 pcs.', '$90.69', '$997.59', '$126.97', '$1,396.67'),
(266, 'Mica Wit 5 mm', 'Mica', '26 pcs.', '0 pcs.', '0 pcs.', '26 pcs.', '$112.00', '$2,912.00', '$156.80', '$4,076.80'),
(267, 'Mica Wit Reel', 'Mica', '118.82 ea.', '0 ea.', '0 ea.', '118.82 ea.', '$64.80', '$7,699.54', '$90.72', '$10,779.35'),
(268, '195.82', '0', '0', '195.82', '75.6670718006332', '14817.126', '20744.0204', '', '', ''),
(269, 'PVC', '', '', '', '', '', '', '', '', ''),
(270, 'PVC 1 mm', 'PVC', '149 pcs.', '0 pcs.', '0 pcs.', '149 pcs.', '$17.95', '$2,674.55', '$25.13', '$3,744.37'),
(271, 'PVC 12 mm', 'PVC', '14 pcs.', '0 pcs.', '0 pcs.', '14 pcs.', '$116.95', '$1,637.30', '$163.73', '$2,292.22'),
(272, 'PVC 3 mm', 'PVC', '37 pcs.', '0 pcs.', '0 pcs.', '37 pcs.', '$32.95', '$1,219.15', '$46.13', '$1,706.81'),
(273, 'Harnass Work man', 'PPE', '0', '0', '0', '0', '', '', '$132.80', '$0.00'),
(274, 'Neuskap', 'PPE', '40 pcs.', '0 pcs.', '0 pcs.', '40 pcs.', '$0.12', '$4.80', '$0.17', '$6.80'),
(275, 'Safety Bril-Clear', 'PPE', '13 pcs.', '0 pcs.', '0 pcs.', '13 pcs.', '$7.40', '$96.20', '$10.36', '$134.68'),
(276, 'Safety Bril-Dark', 'PPE', '15 pcs.', '0 pcs.', '0 pcs.', '15 pcs.', '$2.65', '$39.75', '$3.71', '$55.65'),
(277, 'Safety Earplugs', 'PPE', '30 pcs.', '0 pcs.', '0 pcs.', '30 pcs.', '$2.00', '$60.00', '$2.80', '$84.00'),
(278, 'Safety Helmet', 'PPE', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$16.73', '$0.00'),
(279, 'Safety Vest', 'PPE', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$9.72', '$0.00'),
(280, 'Werkhandschoenen', 'PPE', '0 packs', '0 packs', '0 packs', '0 packs', '', '', '$3.70', '$0.00'),
(281, '98', '0', '0', '98', '2.0484693877551', '200.75', '281.13', '', '', ''),
(282, 'Print Transfer', '', '', '', '', '', '', '', '', ''),
(283, '24" x 25 yd Sojar Print Transfer White', 'Print Transfer', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$506.79', '$0.00'),
(284, '36" x 50 yd White 3 mil', 'Print Vinyl', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$84.455', '$760.10', '$117.04', '$1,053.36'),
(285, '48" x 50 yd Refl.White Sheeting', 'Print Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$842.16', '$0.00'),
(286, '48" x 50 yd White 3 mil', 'Print Vinyl', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$112.39111', '$786.74', '$155.58', '$1,089.06'),
(287, '54" Lamination Arlon (Wrap Kit)', 'Print Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$339.99', '$339.99', '$475.99', '$475.99'),
(288, '54" x 100 yd Backlit Film', 'Print Vinyl', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$184.87', '$739.48', '$258.82', '$1,035.28'),
(289, '54" x 100 yd One Way Vision', 'Print Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$330.00', '$330.00', '$462.00', '$462.00'),
(290, '54" x 50 yd Block out', 'Print Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$154.00', '$0.00'),
(291, '54" x 50 yd Bond Paper', 'Print Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$123.95', '$123.95', '$173.53', '$173.53'),
(292, '54" x 50 yd White 3 mil', 'Print Vinyl', '8 pcs.', '0 pcs.', '0 pcs.', '8 pcs.', '$144.61', '$1,156.88', '$202.45', '$1,619.60'),
(293, '54" x 55 yd Backlit Poster', 'Print Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$297.99', '$595.98', '$417.19', '$834.38'),
(294, '54"Arlon Gloss Cast Vinyl (Wrap Kit)', 'Print Vinyl', '1', '0', '0', '1', '$450.00', '$450.00', '$630.00', '$630.00'),
(295, 'Gloss wrap overlaminate (SOL)', 'Print Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$545.95', '$545.95', '$764.33', '$764.33'),
(296, 'Graphic film with comply adhesive(SOL)', 'Print Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$633.33', '$633.33', '$886.66', '$886.66'),
(297, '24" x 10 yd Black Matte', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$21.83', '$0.00'),
(298, '24" x 50 yd  Reflect.Yellow', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$294.00', '$588.00', '$411.60', '$823.20'),
(299, '24" x 50 yd Battleship 2 mil', 'Snij Vinyl', '1', '0', '0', '1', '$163.63', '$163.63', '$229.08', '$229.08'),
(300, '24" x 50 yd Black 3 mil', 'Snij Vinyl', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$60.28', '$180.84', '$84.39', '$253.17'),
(301, '24" x 50 yd Diamond Etch 2 mil', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$166.84', '$166.84', '$233.58', '$233.58'),
(302, '24" x 50 yd Gold 3 mil', 'Snij Vinyl', '1', '0', '0', '1', '$62.36', '$62.36', '$87.30', '$87.30'),
(303, '24" x 50 yd Holographic Mist', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$379.40', '$0.00'),
(304, '24" x 50 yd Lt. Yellow 3 mil', 'Snij Vinyl', '1', '0', '0', '1', '$62.36', '$62.36', '$87.30', '$87.30'),
(305, '24" x 50 yd Medium Green 3 mil', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$62.36', '$124.72', '$87.30', '$174.60'),
(306, '24" x 50 yd Metalized Chrome', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$149.00', '$149.00', '$208.60', '$208.60'),
(307, '24" x 50 yd Purple 3 mil', 'Snij Vinyl', '1', '0', '0', '1', '$62.36', '$62.36', '$87.30', '$87.30'),
(308, '24" x 50 yd Red 3 mil', 'Snij Vinyl', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$62.36', '$311.80', '$87.30', '$436.50'),
(309, '24" x 50 yd Reflect. White', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$294.00', '$294.00', '$411.60', '$411.60'),
(310, '24" x 50 yd Reflect.Red', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$294.00', '$294.00', '$411.60', '$411.60'),
(311, '24" x 50 yd Silver 3 mil', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$87.30', '$0.00'),
(312, '24" x 50 yd Sunflower 3 mil', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$62.36', '$62.36', '$87.30', '$87.30'),
(313, '24" x 50 yd Yellow', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$62.36', '$62.36', '$87.30', '$87.30'),
(314, '24"x 10 yd Metalized Brushed Chrome', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$43.25', '$43.25', '$60.55', '$60.55'),
(315, '24"x 50 yd Forest Green', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$62.36', '$124.72', '$87.30', '$174.60'),
(316, '24"x 50 yd Medium Blue', 'Snij Vinyl', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$62.36', '$311.80', '$87.30', '$436.50'),
(317, '24"x 50 yd Medium Gray', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$62.36', '$124.72', '$87.30', '$174.60'),
(318, '24"x 50 yd Orange 3 Mil', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$62.36', '$62.36', '$87.30', '$87.30'),
(319, '24"x 50 yd Reflect.Blue', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$411.60', '$0.00'),
(320, '24"x 50 yd Tomato Red 3 Mil', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$62.36', '$124.72', '$87.30', '$174.60'),
(321, '24"x 50 yd White 3 Mil', 'Snij Vinyl', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$60.28', '$301.40', '$84.39', '$421.95'),
(322, '48" x 10 yd Burgundy 2 mil', 'Snij Vinyl', '1', '0', '0', '1', '$126.69', '$126.69', '$177.37', '$177.37'),
(323, '48" x 25 yd Olympic Blue', 'Snij Vinyl', '1', '0', '0', '1', '$160.00', '$160.00', '$224.00', '$224.00'),
(324, '48" x 50 yd Bright Tomato', 'Snij Vinyl', '1', '0', '0', '1', '$316.71', '$316.71', '$443.39', '$443.39'),
(325, '48" x 50 yd Diamond Etch 2 mil', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$452.09', '$0.00'),
(326, '48" x 50 yd Holly Green-Arlon 2500 SL', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$684.32', '$1,368.64', '$958.05', '$1,916.10'),
(327, '48" x 50 yd Kiwi Arlon Vinyl Film', 'Snij Vinyl', '1', '0', '0', '1', '$485.60', '$485.60', '$679.84', '$679.84'),
(328, '48" x 50 yd Transluscent Intense Blue', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$284.00', '$284.00', '$397.60', '$397.60'),
(329, '48" x 50 yd Transluscent Orange', 'Snij Vinyl', '0.5', '0', '0', '0.5', '$284.00', '$142.00', '$397.60', '$198.80'),
(330, '48" x 50 yd Transluscent Sunflower', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$284.00', '$284.00', '$397.60', '$397.60'),
(331, '48" x 50 ydTransluscent Red', 'Snij Vinyl', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$684.32', '$1,368.64', '$958.05', '$1,916.10'),
(332, '50" x 50 yd Bright Tomato', 'Snij Vinyl', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$320.00', '$320.00', '$448.00', '$448.00'),
(333, '54" x 50 yd Medium Gray 3 mil', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$209.73', '$0.00'),
(334, '60" x 50 yd White', 'Snij Vinyl', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$202.45', '$0.00'),
(335, 'Adhesive Remover 1Gallon Refill', 'Reinigings Middelen', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$51.69', '$103.38', '$72.37', '$144.74'),
(336, 'Fast Orange hand Cleaner', 'Reinigings Middelen', '8 pcs.', '0 pcs.', '0 pcs.', '8 pcs.', '$37.23', '$297.84', '$59.57', '$476.56'),
(337, 'Handcleaner Kleenex', 'Reinigings Middelen', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$82.21', '$328.84', '$115.09', '$460.36'),
(338, 'Latex handschoenen', 'Reinigings Middelen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$1.44', '$0.00'),
(339, 'Mist Spray Adhesive', 'Reinigings Middelen', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$6.02', '$0.00'),
(340, 'Red Towel', 'Reinigings Middelen', '2 cases', '0 cases', '0 cases', '2 cases', '$19.00', '$38.00', '$30.40', '$60.80'),
(341, 'Textile Trial kit', 'Reinigings Middelen', '0', '0', '0', '0', '', '', '$97.93', '$0.00'),
(342, 'Towel Paper', 'Reinigings Middelen', '8 pcs.', '0 pcs.', '0 pcs.', '8 pcs.', '$11.81', '$94.48', '$18.90', '$151.20'),
(343, 'Vinyl Letter Remover', 'Reinigings Middelen', '0', '0', '0', '0', '', '', '$23.80', '$0.00'),
(344, 'Rolmaat Lufkin 8m', 'Rolmaat', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$22.90', '$91.60', '$36.64', '$146.56'),
(345, 'Rolmaat Stanley', 'Rolmaat', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$18.20', '$0.00'),
(346, 'Aluminium Bit 51402-1/4"diam', 'Router Bits', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$30.88', '$216.16', '$43.23', '$302.61'),
(347, 'Aluminium Bit 51474- 1/8" diam', 'Router Bits', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$29.89', '$89.67', '$41.85', '$125.55'),
(348, 'Carbide Knife -12', 'Router Bits', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$21.24', '$63.72', '$29.74', '$89.22'),
(349, 'Carbide Knife-RCK-70', 'Router Bits', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$5.44', '$10.88', '$7.62', '$15.24'),
(350, 'Honeycomb bit 46308', 'Router Bits', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$77.96', '$155.92', '$109.14', '$218.28'),
(351, 'Keyhole Bit 85608M', 'Router Bits', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$15.19', '$15.19', '$21.27', '$21.27'),
(352, 'Plastic Bit 51404-1/4"diam', 'Router Bits', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$26.96', '$134.80', '$37.74', '$188.70'),
(353, 'Plastic Bit 51446-1/8"diam', 'Router Bits', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$33.53', '$33.53', '$46.94', '$46.94'),
(354, 'Route Bit Carbide 1/2"', 'Router Bits', '0', '0', '0', '0', '', '', '$25.16', '$0.00'),
(355, 'Router Collet 1/4"', 'Router Bits', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$14.36', '$57.44', '$20.10', '$80.40'),
(356, 'Solid Carbide Spiral 46202-1/4"diam', 'Router Bits', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$23.14', '$69.42', '$32.40', '$97.20'),
(357, 'V-Tip ACM Folding', 'Router Bits', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$33.11', '$99.33', '$46.35', '$139.05'),
(358, 'V-Tip acm-45795', 'Router Bits', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$38.29', '$229.74', '$53.61', '$321.66'),
(359, '2" Screws- Black', 'Schroeven', '61 pcs.', '0 pcs.', '0 pcs.', '61 pcs.', '$0.32', '$19.52', '$0.45', '$27.45'),
(360, '2" Screws-White', 'Schroeven', '187 pcs.', '0 pcs.', '0 pcs.', '187 pcs.', '$0.32', '$59.84', '$0.45', '$84.15'),
(361, 'Viking Screws 1"- Clear', 'Schroeven', '899 pcs.', '0 pcs.', '0 pcs.', '899 pcs.', '$0.19', '$170.81', '$0.27', '$242.73'),
(362, 'Zelfboor Dakschroeven -14 x1 1/4', 'Schroeven', '100 pcs.', '0 pcs.', '0 pcs.', '100 pcs.', '$0.12', '$12.00', '$0.19', '$19.00'),
(363, 'Zelfboor Schroeven', 'Schroeven', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$0.06', '$0.00'),
(364, 'Zelftappende Schroeven', 'Schroeven', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$0.10', '$0.00'),
(365, '1247', '0', '0', '1247', '0.210240577385726', '262.17', '373.33', '', '', ''),
(366, 'Schuurdisk', '', '', '', '', '', '', '', '', ''),
(367, 'Schuurdisk 320 Grit- Mirka', 'Schuurdisk', '56 pcs.', '0 pcs.', '0 pcs.', '56 pcs.', '$19.48', '$1,090.88', '$27.27', '$1,527.12'),
(368, 'Schuurdisk 80 Grit-Mirka', 'Schuurdisk', '20 pcs.', '0 pcs.', '0 pcs.', '20 pcs.', '$19.77', '$395.40', '$27.68', '$553.60'),
(369, 'Schuurdisk120 Grit-Mirka', 'Schuurdisk', '57 pcs.', '0 pcs.', '0 pcs.', '57 pcs.', '$19.49', '$1,110.93', '$27.29', '$1,555.53'),
(370, '15" x 10 yd Flexcut Sticky Pacific Blue-Sef', 'Snij Transfer', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$68.04', '$340.20', '$95.26', '$476.30'),
(371, '15" x 30 yd Flex Green', 'Snij Transfer', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$121.64', '$243.28', '$170.30', '$340.60'),
(372, '15"x 10 yd Flexcut Sticky Red-Sef', 'Snij Transfer', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$68.04', '$272.16', '$95.26', '$381.04'),
(373, '19.5" x 25 yd Flexcut Sticky Black-Sef', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$215.90', '$215.90', '$302.26', '$302.26'),
(374, '19.5"x 25 yrd  Flexcut Sticky White-Sef', 'Snij Transfer', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$302.39', '$0.00'),
(375, '20" x 10 yd Flex Gold', 'Snij Transfer', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$75.80', '$0.00'),
(376, '20" x 30 yd Neon Yellow', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$215.00', '$215.00', '$301.00', '$301.00'),
(377, '20"x 10 yd Flex Green', 'Snij Transfer', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$54.14', '$108.28', '$75.80', '$151.60'),
(378, '20"x 10 yd Flex Silver', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$54.14', '$54.14', '$75.80', '$75.80'),
(379, '20"x 10 yd Flex Sky blue', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$54.14', '$54.14', '$75.80', '$75.80'),
(380, '20"x 10 yd Purple', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$54.14', '$54.14', '$75.81', '$75.81'),
(381, '20"x 27 yd Lemon Yellow', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$146.21', '$146.21', '$204.69', '$204.69'),
(382, '20"x 30 yd Flex Orange', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$172.95', '$172.95', '$242.13', '$242.13'),
(383, '20"x 30 yd Neon Pink', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$215.00', '$215.00', '$301.00', '$301.00'),
(384, '20"x 50 yd Reflective Orange', 'Snij Transfer', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$441.00', '$0.00'),
(385, '20"x10 yd Medium Yellow', 'Snij Transfer', '1', '0', '0', '1', '$54.14', '$54.14', '$75.81', '$75.81'),
(386, '60" x 50 yd Trans Ruby Red 2 mil', 'Snij Transfer', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$478.80', '$0.00'),
(387, 'Transluscent Bright Blue', 'Snij Transfer', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$284.00', '$284.00', '$397.60', '$397.60'),
(388, '1 1/2" Spijkers Ramset', 'Spare Parts', '75 pcs.', '0 pcs.', '0 pcs.', '75 pcs.', '$0.17', '$12.75', '$0.27', '$20.25'),
(389, '100 A Plasma Tip', 'Spare Parts', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$3.11', '$6.22', '$4.35', '$8.70'),
(390, '40 A Plasma Tip', 'Spare Parts', '23 pcs.', '0 pcs.', '0 pcs.', '23 pcs.', '$3.00', '$69.00', '$4.20', '$96.60'),
(391, '60 A Plasma Tip', 'Spare Parts', '31 pcs.', '0 pcs.', '0 pcs.', '31 pcs.', '$4.73', '$146.63', '$6.62', '$205.22'),
(392, '80 A Plasma Bit', 'Spare Parts', '27 pcs.', '0 pcs.', '0 pcs.', '27 pcs.', '$3.50', '$94.50', '$4.90', '$132.30'),
(393, 'Bernzomatic Torch', 'Spare Parts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$48.96', '$0.00'),
(394, 'Beugels Aluminium', 'Spare Parts', '823 pcs.', '0 pcs.', '0 pcs.', '823 pcs.', '$0.15', '$123.45', '$0.21', '$172.83'),
(395, 'Cemented Carbide Blade- Black 60 degree', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$43.20', '$43.20', '$60.48', '$60.48'),
(396, 'Cemented Carbide Blade-Blue 45 degree', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$26.00', '$26.00', '$36.40', '$36.40'),
(397, 'Dewalt -DWA6PH2', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$6.00', '$6.00', '$9.60', '$9.60'),
(398, 'Drill Bit Set', 'Spare Parts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$51.02', '$0.00'),
(399, 'Driver board', 'Spare Parts', '3', '0', '0', '3', '$10.96', '$32.88', '$17.54', '$52.62'),
(400, 'Electrode 9-8215 Thermal Dynamics', 'Spare Parts', '24 pcs.', '0 pcs.', '0 pcs.', '24 pcs.', '$8.34', '$200.16', '$11.68', '$280.32'),
(401, 'Fan CNC', 'Spare Parts', '2', '0', '0', '2', '$9.29', '$18.58', '$14.86', '$29.72'),
(402, 'Gas Difuser 169728', 'Spare Parts', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$6.49', '$12.98', '$10.38', '$20.76'),
(403, 'Grinder', 'Spare Parts', '0', '0', '0', '0', '', '', '$126.40', '$0.00'),
(404, 'Gromet Tool/Gun', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$20.42', '$20.42', '$28.59', '$28.59'),
(405, 'Hook blades large', 'Spare Parts', '50', '0', '0', '50', '$1.13', '$56.50', '$1.58', '$79.00'),
(406, 'Hose Klem', 'Spare Parts', '3', '0', '0', '3', '$2.69', '$8.07', '$4.30', '$12.90'),
(407, 'Jig Saw T119B (wood)', 'Spare Parts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$1.78', '$0.00'),
(408, 'Jig Saw T127D', 'Spare Parts', '0', '0', '0', '0', '', '', '$17.78', '$0.00'),
(409, 'Koolstof Borstel', 'Spare Parts', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$10.16', '$20.32', '$14.22', '$28.44'),
(410, 'Lasdoos', 'Spare Parts', '7', '0', '0', '7', '$4.00', '$28.00', '$6.40', '$44.80'),
(411, 'Laskap Plastic Shield', 'Spare Parts', '6', '0', '0', '6', '$5.00', '$30.00', '$5.00', '$30.00'),
(412, 'Mica sheet -visitekaart machine', 'Spare Parts', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$4.35', '$39.15', '$6.09', '$54.81'),
(413, 'Micro Switch Teckwin', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$61.25', '$61.25', '$85.75', '$85.75'),
(414, 'Mig Tip 030"', 'Spare Parts', '8 pcs.', '0 pcs.', '0 pcs.', '8 pcs.', '$1.91', '$15.28', '$2.67', '$21.36'),
(415, 'Mig Tip 035"', 'Spare Parts', '7 pcs.', '0 pcs.', '0 pcs.', '7 pcs.', '$1.91', '$13.37', '$2.67', '$18.69'),
(416, 'Mig Tip -Barbera Lasmachine', 'Spare Parts', '4', '0', '0', '4', '$1.40', '$5.60', '$1.96', '$7.84'),
(417, 'Milwaukee blades', 'Spare Parts', '3', '0', '0', '3', '$12.30', '$36.90', '$17.22', '$51.66'),
(418, 'Montage kit Gun', 'Spare Parts', '0', '0', '0', '0', '', '', '$99.40', '$0.00'),
(419, 'Motor kabel', 'Spare Parts', '3', '0', '0', '3', '$3.69', '$11.07', '$5.17', '$15.51'),
(420, 'Photocell Rockwell', 'Spare Parts', '13', '0', '0', '13', '$13.46', '$174.98', '$18.84', '$244.92'),
(421, 'Porter Cable 690 series 1-3/4 peak HP Routers', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$113.90', '$113.90', '$159.46', '$159.46'),
(422, 'P-Roller TD 21565102-Roland', 'Spare Parts', '1', '0', '0', '1', '$35.00', '$35.00', '$49.00', '$49.00'),
(423, 'Ramset Powder Loads', 'Spare Parts', '4 cases', '0 cases', '0 cases', '4 cases', '$9.99', '$39.96', '$14.00', '$56.00'),
(424, 'Razor Blades Steel back', 'Spare Parts', '1', '0', '0', '1', '$8.29', '$8.29', '$11.61', '$11.61'),
(425, 'Retractible Pin', 'Spare Parts', '10 pcs.', '0 pcs.', '0 pcs.', '10 pcs.', '$8.00', '$80.00', '$11.20', '$112.00');
INSERT INTO `inventory` (`id`, `material`, `category`, `qty_owned`, `qty_reserved`, `qty_on_order`, `qty_available`, `cost`, `total_cost`, `unit_price`, `total_sales_value`) VALUES
(426, 'Rubber Stekker -Zwart', 'Spare Parts', '2', '0', '0', '2', '$7.50', '$15.00', '$12.00', '$24.00'),
(427, 'Self stick floor savers', 'Spare Parts', '8', '0', '0', '8', '$8.99', '$71.92', '$14.38', '$115.04'),
(428, 'Shield Cup 9-8218', 'Spare Parts', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$32.45', '$64.90', '$51.92', '$103.84'),
(429, 'Spuitbus Mat zwart', 'Spare Parts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$7.00', '$0.00'),
(430, 'Squeegee Felt Wrapped', 'Spare Parts', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$2.59', '$15.54', '$3.63', '$21.78'),
(431, 'Staander Poten', 'Spare Parts', '0', '0', '0', '0', '', '', '$0.00', '$0.00'),
(432, 'Stamp Creator Pro-Set', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$142.90', '$142.90', '$200.06', '$200.06'),
(433, 'Start Cartridge 9-8213 Thermal Dyn', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$31.10', '$31.10', '$43.54', '$43.54'),
(434, 'Teckstorm Micro Switch', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$4.66', '$4.66', '$6.52', '$6.52'),
(435, 'Therma Cut-Miller retainer 169-716', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$3.50', '$3.50', '$4.90', '$4.90'),
(436, 'Tinny Cut', 'Spare Parts', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$2.80', '$8.40', '$3.92', '$11.76'),
(437, 'UV Inkjet lamp', 'Spare Parts', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$737.50', '$2,212.50', '$1,180.00', '$3,540.00'),
(438, 'Video card', 'Spare Parts', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$189.99', '$189.99', '$265.99', '$265.99'),
(439, 'Vlaggentouw Nylon', 'Spare Parts', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$14.00', '$28.00', '$19.60', '$39.20'),
(440, 'Welding Nozzle 12.7mm', 'Spare Parts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$7.35', '$0.00'),
(441, 'Welding Nozzle 15.9 mm', 'Spare Parts', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$8.00', '$24.00', '$11.20', '$33.60'),
(442, '1"Banner Tape', 'Tape', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$18.13', '$0.00'),
(443, '1.5"Banner Tape', 'Tape', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$18.95', '$170.55', '$26.53', '$238.77'),
(444, '10" Papieren Tape', 'Tape', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$31.76', '$190.56', '$44.46', '$266.76'),
(445, '12" Doorzichtig Tape', 'Tape', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$36.15', '$36.15', '$50.61', '$50.61'),
(446, '12" Papieren Tape', 'Tape', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$38.74', '$193.70', '$53.79', '$268.95'),
(447, '2" Papieren Tape', 'Tape', '6 pcs.', '0 pcs.', '0 pcs.', '6 pcs.', '$5.98', '$35.88', '$8.37', '$50.22'),
(448, '24" Doorzichtig Tape', 'Tape', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$71.76', '$143.52', '$100.46', '$200.92'),
(449, '24" Papieren Tape', 'Tape', '2 pcs.', '0 pcs.', '0 pcs.', '2 pcs.', '$72.00', '$144.00', '$100.80', '$201.60'),
(450, '4" Papieren Tape', 'Tape', '9 pcs.', '0 pcs.', '0 pcs.', '9 pcs.', '$12.85', '$115.65', '$17.99', '$161.91'),
(451, '6" Papieren Tape', 'Tape', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$19.68', '$78.72', '$27.55', '$110.20'),
(452, '8" Papieren Tape', 'Tape', '10 pcs.', '0 pcs.', '0 pcs.', '10 pcs.', '$25.72', '$257.20', '$36.01', '$360.10'),
(453, 'Blauwe  Tape', 'Tape', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$4.97', '$24.85', '$6.96', '$34.80'),
(454, 'Dubbelzijdig Tape', 'Tape', '13 pcs.', '0 pcs.', '0 pcs.', '13 pcs.', '$6.35', '$82.55', '$8.89', '$115.57'),
(455, 'Isolatie Tape', 'Tape', '5 pcs.', '0 pcs.', '0 pcs.', '5 pcs.', '$4.27', '$21.35', '$6.83', '$34.15'),
(456, 'Knifeless Design line tape', 'Tape', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$29.95', '$89.85', '$41.93', '$125.79'),
(457, 'Rode Tape 1"', 'Tape', '1', '0', '0', '1', '$21.95', '$21.95', '$30.73', '$30.73'),
(458, 'Scotch Tape Clear', 'Tape', '13 pcs.', '0 pcs.', '0 pcs.', '13 pcs.', '$1.83', '$23.79', '$2.93', '$38.09'),
(459, '1" x 150 ft BlackReel Trimming Cap', 'Trimming Cap', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$57.71', '$230.84', '$80.79', '$323.16'),
(460, '1" x 150 ft BlueReel Trimming Cap', 'Trimming Cap', '4 pcs.', '0 pcs.', '0 pcs.', '4 pcs.', '$57.71', '$230.84', '$80.79', '$323.16'),
(461, '1" x 150 ft Brushed Chrome ReelTrimming Cap', 'Trimming Cap', '3 pcs.', '0 pcs.', '0 pcs.', '3 pcs.', '$59.50', '$178.50', '$83.30', '$249.90'),
(462, '1" x 150 ft GoldReel Trimming Cap', 'Trimming Cap', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$57.71', '$57.71', '$80.79', '$80.79'),
(463, '1" x 150 ft GreenReel Trimming Cap', 'Trimming Cap', '1 pcs.', '0 pcs.', '0 pcs.', '1 pcs.', '$57.71', '$57.71', '$80.79', '$80.79'),
(464, '1" x 150 ft Intense BlueReel Trimming Cap', 'Trimming Cap', '4', '0', '0', '4', '$57.71', '$230.84', '$80.79', '$323.16'),
(465, '1" x 150 ft RedReel Trimming Cap', 'Trimming Cap', '4 cases', '0 cases', '0 cases', '4 cases', '$57.71', '$230.84', '$80.79', '$323.16'),
(466, '1" x 150 ft WhiteReel Trimming Cap', 'Trimming Cap', '4 cases', '0 cases', '0 cases', '4 cases', '$57.71', '$230.84', '$80.79', '$323.16'),
(467, 'Heather Cardinal-2XLarge', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$6.90', '$0.00'),
(468, 'Heather Cardinal-Large', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(469, 'Heather Cardinal-Medium', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(470, 'Heather Cardinal-Small', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(471, 'Navy-Medium', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(472, 'Navy-Small', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(473, 'Royal-Large', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(474, 'Royal-Medium', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(475, 'Royal-Small', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00'),
(476, 'Royal-XLarge', 'Werk Uniform-T-Shirts', '0 pcs.', '0 pcs.', '0 pcs.', '0 pcs.', '', '', '$3.61', '$0.00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_detail`
--

CREATE TABLE `leave_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_head_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` enum('open','decline','approved','accepted') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_detail`
--

INSERT INTO `leave_detail` (`id`, `leave_head_id`, `user_id`, `date`, `note`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(13, 25, 16, '2016-09-26 15:39:36', 'leave for tour', 'approved', 16, 0, '2016-09-26 20:39:36', '2016-09-26 20:39:36'),
(14, 24, 16, '2016-09-26 15:39:49', 'leave for personal.', 'decline', 16, 0, '2016-09-26 20:39:49', '2016-09-26 20:39:49'),
(15, 23, 17, '2016-09-26 15:49:42', 'leave for exam.', 'approved', 17, 0, '2016-09-26 20:49:42', '2016-09-26 20:49:42'),
(16, 25, 18, '2016-09-26 15:51:36', 'leave for tour', 'accepted', 18, 0, '2016-09-26 20:51:36', '2016-09-26 20:51:36'),
(17, 26, 16, '2016-09-26 17:50:05', 'tets', 'approved', 16, 0, '2016-09-26 22:50:05', '2016-09-26 22:50:05'),
(18, 26, 18, '2016-09-26 17:51:58', 'tets', 'accepted', 18, 0, '2016-09-26 22:51:58', '2016-09-26 22:51:58'),
(19, 27, 16, '2016-09-27 19:32:27', 'prive', 'approved', 16, 0, '2016-09-28 00:32:27', '2016-09-28 00:32:27'),
(20, 27, 18, '2016-09-27 20:02:46', 'prive', 'accepted', 18, 0, '2016-09-28 01:02:46', '2016-09-28 01:02:46'),
(21, 28, 16, '2016-09-29 22:05:38', 'prive', 'approved', 16, 0, '2016-09-30 03:05:38', '2016-09-30 03:05:38'),
(22, 28, 18, '2016-09-29 22:08:59', 'prive', 'accepted', 18, 0, '2016-09-30 03:08:59', '2016-09-30 03:08:59'),
(23, 29, 16, '2016-09-29 22:40:49', 'prive', 'approved', 16, 0, '2016-09-30 03:40:49', '2016-09-30 03:40:49'),
(24, 29, 18, '2016-09-29 22:54:48', 'prive', 'accepted', 18, 0, '2016-09-30 03:54:48', '2016-09-30 03:54:48'),
(25, 22, 16, '2016-10-05 21:21:14', 'leave for sick', 'approved', 16, 0, '2016-10-06 02:21:14', '2016-10-06 02:21:14'),
(26, 23, 18, '2016-10-05 21:24:09', 'leave for exam.', 'accepted', 18, 0, '2016-10-06 02:24:09', '2016-10-06 02:24:09'),
(27, 30, 16, '2016-10-05 22:14:20', 'ik moet naar school', 'decline', 16, 0, '2016-10-06 03:14:20', '2016-10-06 03:14:20'),
(28, 31, 16, '2016-10-05 22:17:21', 'Ik meot naar huis', 'approved', 16, 0, '2016-10-06 03:17:21', '2016-10-06 03:17:21'),
(29, 32, 16, '2016-10-05 22:41:41', 'mama gaat weg!', 'approved', 16, 0, '2016-10-06 03:41:41', '2016-10-06 03:41:41'),
(30, 33, 16, '2016-10-05 22:47:08', 'Me bril is weg', 'approved', 16, 0, '2016-10-06 03:47:08', '2016-10-06 03:47:08'),
(31, 31, 18, '2016-10-05 22:52:48', 'Ik meot naar huis', 'accepted', 18, 0, '2016-10-06 03:52:48', '2016-10-06 03:52:48'),
(32, 37, 16, '2016-10-05 23:31:06', 'zach', 'approved', 16, 0, '2016-10-06 04:31:06', '2016-10-06 04:31:06'),
(39, 38, 16, '2016-10-05 23:48:33', 'qw', 'approved', 16, 0, '2016-10-06 04:48:33', '2016-10-06 04:48:33'),
(40, 39, 16, '2016-10-05 23:52:09', 'hey ik ben hier', 'approved', 16, 0, '2016-10-06 04:52:09', '2016-10-06 04:52:09'),
(41, 40, 16, '2016-10-05 23:53:06', 'sadasd', 'approved', 16, 0, '2016-10-06 04:53:06', '2016-10-06 04:53:06'),
(45, 41, 16, '2016-10-05 23:59:28', 'i ben boossss', 'approved', 16, 0, '2016-10-06 04:59:28', '2016-10-06 04:59:28'),
(46, 41, 18, '2016-10-06 00:13:40', 'i ben boossss', 'accepted', 18, 0, '2016-10-06 05:13:40', '2016-10-06 05:13:40'),
(48, 40, 18, '2016-10-06 00:15:49', 'sadasd', 'accepted', 18, 0, '2016-10-06 05:15:49', '2016-10-06 05:15:49'),
(49, 39, 18, '2016-10-06 00:30:53', 'hey ik ben hier', 'accepted', 18, 0, '2016-10-06 05:30:53', '2016-10-06 05:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `leave_head`
--

CREATE TABLE `leave_head` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `status` enum('open','decline','approved','accepted','canceled') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_head`
--

INSERT INTO `leave_head` (`id`, `type`, `user_id`, `user_name`, `user_email`, `date`, `from_date`, `to_date`, `reason`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(22, '', 15, 'worker', 'devdhaka408@gmail.com', '2016-09-26 15:24:59', '2016-09-01 00:00:00', '2016-09-03 00:00:00', 'leave for sick', 'approved', 15, 16, '2016-09-26 20:24:59', '2016-10-06 02:21:14'),
(23, '', 15, 'worker', 'devdhaka408@gmail.com', '2016-09-26 15:32:37', '2016-09-05 00:00:00', '2016-09-10 00:00:00', 'leave for exam.', 'accepted', 15, 18, '2016-09-26 20:32:37', '2016-10-06 02:24:09'),
(24, '', 15, 'worker', 'devdhaka408@gmail.com', '2016-09-26 15:36:36', '2016-09-10 00:00:00', '2016-09-15 00:00:00', 'leave for personal.', 'decline', 15, 16, '2016-09-26 20:36:36', '2016-09-26 20:39:49'),
(25, '', 15, 'worker', 'devdhaka408@gmail.com', '2016-09-26 15:37:34', '2016-09-25 00:00:00', '2016-09-30 00:00:00', 'leave for tour', 'accepted', 15, 18, '2016-09-26 20:37:34', '2016-09-26 20:51:36'),
(26, '', 15, 'worker', 'devdhaka408@gmail.com', '2016-09-26 17:18:25', '2016-09-01 00:00:00', '2016-09-09 00:00:00', 'tets', 'accepted', 15, 18, '2016-09-26 22:18:25', '2016-09-26 22:51:58'),
(27, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-09-27 19:30:16', '2016-10-05 00:00:00', '2016-10-05 00:00:00', 'prive', 'accepted', 15, 18, '2016-09-28 00:30:16', '2016-09-28 01:02:46'),
(28, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-09-29 22:02:31', '2016-09-30 00:00:00', '2016-09-30 00:00:00', 'prive', 'accepted', 15, 18, '2016-09-30 03:02:31', '2016-09-30 03:08:59'),
(29, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-09-29 22:36:34', '2016-10-05 00:00:00', '2016-10-05 00:00:00', 'prive', 'accepted', 15, 18, '2016-09-30 03:36:34', '2016-09-30 03:54:48'),
(30, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 19:42:31', '2016-10-28 00:00:00', '2016-10-28 00:00:00', 'ik moet naar school', 'decline', 15, 16, '2016-10-06 00:42:31', '2016-10-06 03:14:20'),
(31, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 22:09:23', '2016-11-01 00:00:00', '2016-12-09 00:00:00', 'Ik meot naar huis', 'accepted', 15, 18, '2016-10-06 03:09:23', '2016-10-06 03:52:48'),
(32, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 22:38:37', '2016-10-14 00:00:00', '2016-10-14 00:00:00', 'mama gaat weg!', 'approved', 15, 16, '2016-10-06 03:38:37', '2016-10-06 03:41:41'),
(33, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 22:46:46', '2016-10-22 00:00:00', '2016-10-15 00:00:00', 'Me bril is weg', 'approved', 15, 16, '2016-10-06 03:46:46', '2016-10-06 03:47:08'),
(37, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 23:20:55', '2016-09-30 00:00:00', '2016-10-01 00:00:00', 'zach', 'approved', 15, 16, '2016-10-06 04:20:55', '2016-10-06 04:31:06'),
(38, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 23:34:21', '2016-10-07 00:00:00', '2016-10-08 00:00:00', 'qw', 'approved', 15, 16, '2016-10-06 04:34:21', '2016-10-06 04:48:33'),
(39, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 23:51:46', '2016-10-15 00:00:00', '2016-10-16 00:00:00', 'hey ik ben hier', 'accepted', 15, 18, '2016-10-06 04:51:46', '2016-10-06 05:30:53'),
(40, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 23:52:55', '2016-10-01 00:00:00', '2016-10-01 00:00:00', 'sadasd', 'accepted', 15, 18, '2016-10-06 04:52:55', '2016-10-06 05:15:49'),
(41, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-10-05 23:54:13', '2016-10-08 00:00:00', '2016-10-14 00:00:00', 'i ben boossss', 'accepted', 15, 18, '2016-10-06 04:54:13', '2016-10-06 05:13:40'),
(42, '', 17, 'hr', 'pawiromitchel@gmail.com', '2016-10-06 17:06:48', '2016-10-06 00:00:00', '2016-10-07 00:00:00', 'ik ben van HR', 'open', 17, 0, '2016-10-06 22:06:48', '2016-10-06 22:06:48'),
(45, '', 17, 'hr', 'pawiromitchel@gmail.com', '2016-10-06 17:12:12', '2016-10-07 00:00:00', '2016-10-08 00:00:00', 'Hi ik ben van HR :D ', 'canceled', 17, 0, '2016-10-06 22:12:12', '2016-10-06 22:12:12'),
(46, '', 16, 'supervisor', 'mitchel@bitdynamics.sr', '2016-10-06 17:35:25', '2016-10-01 00:00:00', '2016-10-01 00:00:00', 'IK BEN SUPERVISOR!!!!', 'open', 16, 0, '2016-10-06 22:35:25', '2016-10-06 22:35:25'),
(47, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 17:40:01', '2016-11-25 00:00:00', '2016-11-26 00:00:00', '2 dagen ziek', 'open', 15, 0, '2016-11-17 20:40:01', '2016-11-17 20:40:01'),
(48, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 17:41:50', '2016-11-25 00:00:00', '2016-11-26 00:00:00', '2 dagen helemaal ziek!!!!', 'open', 15, 0, '2016-11-17 20:41:50', '2016-11-17 20:41:50'),
(49, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 18:25:35', '2016-11-25 00:00:00', '2016-11-25 00:00:00', 'ben ik ziek?', 'open', 15, 0, '2016-11-17 21:25:35', '2016-11-17 21:25:35'),
(50, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 18:26:55', '2016-11-25 00:00:00', '2016-11-25 00:00:00', 'the hell', 'open', 15, 0, '2016-11-17 21:26:55', '2016-11-17 21:26:55'),
(51, '', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 18:33:25', '2016-11-25 00:00:00', '2016-11-25 00:00:00', 'ik ga op vakantie', 'open', 15, 0, '2016-11-17 21:33:25', '2016-11-17 21:33:25'),
(52, 'halve dag', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 18:37:06', '2016-11-26 00:00:00', '2016-11-27 00:00:00', 'ik ga naar Vegas!', 'accepted', 15, 0, '2016-11-17 21:37:06', '2016-11-17 21:37:06'),
(53, 'halve dag', 15, 'worker', 'zachariassamat389@hotmail.com', '2016-11-17 20:24:43', '2016-11-25 00:00:00', '2016-11-25 00:00:00', 'halve dag, ik moet weg!', 'accepted', 15, 0, '2016-11-17 23:24:43', '2016-11-17 23:24:43'),
(54, 'normaal', 17, 'hr', 'pawiromitchel@gmail.com', '2016-11-18 17:46:52', '2016-11-26 00:00:00', '2016-11-26 00:00:00', 'ik ga weg', 'canceled', 17, 0, '2016-11-18 20:46:52', '2016-11-18 20:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `menu_panel`
--

CREATE TABLE `menu_panel` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `menu_type` enum('ROOT','MODU','MENU','SUBM') COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `parent_menu_id` int(10) UNSIGNED DEFAULT NULL,
  `icon_code` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_order` int(10) UNSIGNED NOT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_panel`
--

INSERT INTO `menu_panel` (`id`, `menu_id`, `menu_type`, `menu_name`, `route`, `parent_menu_id`, `icon_code`, `menu_order`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 0, 'ROOT', 'ROOT', '#', 0, NULL, 0, 'active', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'MODU', 'Dashboard', 'dashboard', 1, 'fa fa-tachometer', 1, 'active', NULL, NULL, '2016-04-12 13:14:41', '2016-04-12 17:07:21'),
(3, 1, 'MODU', 'User', '#', 1, 'fa fa-user', 3, 'active', NULL, NULL, '2016-04-12 13:16:47', '2016-04-12 17:07:46'),
(4, 1, 'MENU', 'Permission Role', 'index-permission-role', 3, '111', 0, 'active', NULL, NULL, '2016-04-12 13:18:59', '2016-04-12 13:44:49'),
(5, 1, 'MODU', 'Department', 'department', 1, 'fa fa-align-center', 2, 'active', NULL, NULL, '2016-04-12 13:42:21', '2016-04-12 17:07:34'),
(6, 1, 'MENU', 'Profile', 'user-profile', 3, '11', 0, 'active', NULL, NULL, '2016-04-12 13:46:18', '2016-04-12 13:46:18'),
(7, 1, 'MENU', 'User List', 'user-list', 3, '11', 0, 'active', NULL, NULL, '2016-04-12 13:47:03', '2016-04-12 13:47:03'),
(8, 1, 'MENU', 'Role User', 'index-role-user', 3, '11', 0, 'active', NULL, NULL, '2016-04-12 13:47:53', '2016-04-12 13:47:53'),
(9, 1, 'MENU', 'User Activity', 'user-activity', 3, '11', 0, 'active', NULL, NULL, '2016-04-12 13:48:48', '2016-04-12 13:48:48'),
(10, 1, 'MENU', 'Menu Panel', 'menu-panel', 3, '11', 0, 'active', NULL, NULL, '2016-04-12 13:49:29', '2016-04-12 13:49:29'),
(11, 1, 'MODU', 'Calculators', '#', 1, 'fa fa-calculator', 1, 'active', NULL, NULL, '2016-04-27 00:41:13', '2016-04-27 00:53:16'),
(14, 1, 'MENU', '3D Channel Letters', 'channel', 11, 'fa fa-calculator', 1, 'active', NULL, NULL, '2016-04-30 04:00:47', '2016-05-03 17:22:16'),
(15, 1, 'MODU', 'Currency', '#', 1, 'fa fa-calculator', 1, 'active', NULL, NULL, '2016-05-03 00:37:55', '2016-05-03 00:37:55'),
(16, 1, 'MENU', 'List', 'view-currency', 15, 'fa fa-calculator', 1, 'active', NULL, NULL, '2016-05-03 00:38:19', '2016-05-03 00:38:19'),
(17, 1, 'MENU', '3D Flat', 'flat', 11, 'fa fa-calculator', 3, 'active', NULL, NULL, '2016-05-04 01:00:23', '2016-05-04 01:04:21'),
(18, 1, 'MENU', 'Achtergrond Borden', 'achtergrond', 11, 'fa fa-calculator', 4, 'active', NULL, NULL, '2016-05-04 01:05:08', '2016-05-04 01:05:08'),
(19, 1, 'MENU', 'Lichtbakken', 'lichtbakken', 11, 'fa fa-calculator', 5, 'active', NULL, NULL, '2016-05-04 01:05:36', '2016-05-04 01:05:36'),
(20, 1, 'MENU', 'Print Cut', 'print-cut', 11, 'fa fa-calculator', 6, 'active', NULL, NULL, '2016-05-09 17:50:53', '2016-05-09 18:01:46'),
(22, 1, 'MENU', 'Laser Cards', 'formulier-laser-cards', 11, 'fa fa-calculator', 7, 'active', NULL, NULL, '2016-06-08 01:01:40', '2016-06-08 01:01:40'),
(23, 1, 'MENU', 'Screen Print', 'screen', 11, 'fa fa-calculator', 5, 'active', NULL, NULL, '2016-06-21 14:55:31', '2016-06-21 14:55:31'),
(24, 1, 'MENU', 'Pad Print', 'pad', 11, 'fa fa-calculator', 5, 'active', NULL, NULL, '2016-06-21 14:55:56', '2016-06-21 14:55:56'),
(25, 1, 'MENU', 'Prijslijst', 'price-list', 11, 'fa fa-calculator', 11, 'active', NULL, NULL, '2016-07-19 23:03:45', '2016-07-19 23:06:48'),
(26, 1, 'MODU', 'Verlof', '#', 1, 'fa fa-clipboard', 12, 'active', NULL, NULL, '2016-09-26 20:03:00', '2016-10-13 22:58:49'),
(27, 1, 'MENU', 'Overzicht', 'leave-application', 26, 'fa', 1, 'active', NULL, NULL, '2016-09-26 20:03:49', '2016-10-13 22:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2016_02_08_090952_user_role', 1),
('2016_02_23_084828_create_dump_user_sql_table', 1),
('2016_09_25_105628_create_leave_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `route_url`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'index-permission-role', 'index-permission-role', 'index-permission-role', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'index-permission', 'index-permission', 'index-permission', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'route-in-permission', 'route-in-permission', 'route-in-permission', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'welcome', 'welcome', NULL, 1, 0, '2016-03-03 15:23:56', '2016-03-03 15:23:56'),
(5, 'reset-password/{user_id}', 'reset-password/{user_id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(6, 'update-new-password', 'update-new-password', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(7, 'get-user-login', 'get-user-login', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(8, 'post-user-login', 'post-user-login', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(9, '/', '/', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(10, 'dashboard', 'dashboard', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(11, 'all_routes_uri', 'all_routes_uri', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(12, 'store-permission', 'store-permission', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(13, 'view-permission/{id}', 'view-permission/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(14, 'edit-permission/{id}', 'edit-permission/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(15, 'update-permission/{id}', 'update-permission/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(16, 'delete-permission/{id}', 'delete-permission/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(18, 'view-permission-role/{id}', 'view-permission-role/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(19, 'edit-permission-role/{id}', 'edit-permission-role/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(20, 'update-permission-role/{id}', 'update-permission-role/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(21, 'delete-permission-role/{id}', 'delete-permission-role/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(22, 'search-permission-role', 'search-permission-role', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(23, 'user-activity', 'user-activity', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(24, 'search-user-activity', 'search-user-activity', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(25, 'user-list', 'user-list', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(26, 'add-user', 'add-user', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(27, 'search-user', 'search-user', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(28, 'show-user/{id}', 'show-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(29, 'edit-user/{id}', 'edit-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(30, 'update-user/{id}', 'update-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(31, 'delete-user/{id}', 'delete-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(32, 'create-sign-up', 'create-sign-up', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(33, 'forget-password-view', 'forget-password-view', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(34, 'forget-password', 'forget-password', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(35, 'password-reset-confirm/{reset_password_token}', 'password-reset-confirm/{reset_password_token}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(36, 'user-save-new-password', 'user-save-new-password', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(37, 'signup', 'signup', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(38, 'user-logout', 'user-logout', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(39, 'role', 'role', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(40, 'store-role', 'store-role', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(41, 'view-role/{slug}', 'view-role/{slug}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(42, 'edit-role/{slug}', 'edit-role/{slug}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(43, 'update-role/{slug}', 'update-role/{slug}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(44, 'delete-role/{slug}', 'delete-role/{slug}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(45, 'index-role-user', 'index-role-user', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(46, 'search-role-user', 'search-role-user', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(47, 'store-role-user', 'store-role-user', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(48, 'view-role-user/{id}', 'view-role-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(49, 'edit-role-user/{id}', 'edit-role-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(50, 'update-role-user/{id}', 'update-role-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(51, 'delete-role-user/{id}', 'delete-role-user/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(52, 'user-profile', 'user-profile', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(53, 'user-info/{value}', 'user-info/{value}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(54, 'inactive-user-dashboard', 'inactive-user-dashboard', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(55, 'store-user-profile', 'store-user-profile', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(56, 'edit-user-profile/{id}', 'edit-user-profile/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(57, 'update-user-profile/{id}', 'update-user-profile/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(58, 'store-meta-data', 'store-meta-data', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(59, 'edit-meta-data/{id}', 'edit-meta-data/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(60, 'update-meta-data/{id}', 'update-meta-data/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(61, 'change-password-view', 'change-password-view', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(62, 'update-password', 'update-password', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(63, 'store-profile-image', 'store-profile-image', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(64, 'edit-profile-image/{user_image_id}', 'edit-profile-image/{user_image_id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(65, 'update-profile-image/{user_image_id}', 'update-profile-image/{user_image_id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(66, 'department', 'department', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(67, 'add-department', 'add-department', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(68, 'view-department/{id}', 'view-department/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(69, 'delete-department/{id}', 'delete-department/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(70, 'edit-department/{id}', 'edit-department/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(71, 'update-department/{id}', 'update-department/{id}', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(72, 'search-department', 'search-department', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(73, 'form-elements', 'form-elements', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(74, 'reg-sample', 'reg-sample', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(75, 'admin', 'admin', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(76, 'content-page', 'content-page', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(77, 'validation-page', 'validation-page', NULL, 1, 0, '2016-03-03 15:24:18', '2016-03-03 15:24:18'),
(78, 'store-permission-role', 'store-permission-role', 'store-permission-role', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'homer', 'homer', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(80, 'bord', 'bord', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(81, 'channel', 'channel', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(82, 'store-channel', 'store-channel', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(83, 'flat', 'flat', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(84, 'store-flat', 'store-flat', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(85, 'achtergrond', 'achtergrond', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(86, 'store-achtergrond', 'store-achtergrond', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(87, 'lichtbakken', 'lichtbakken', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(88, 'store-lichtbakken', 'store-lichtbakken', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(89, 'menu-panel', 'menu-panel', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(90, 'store-menu-panel', 'store-menu-panel', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(91, 'search-menu-panel', 'search-menu-panel', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(92, 'view-menu-panel/{id}', 'view-menu-panel/{id}', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(93, 'edit-menu-panel/{id}/{parent_menu_id}', 'edit-menu-panel/{id}/{parent_menu_id}', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(94, 'update-menu-panel/{id}', 'update-menu-panel/{id}', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(95, 'delete-menu-panel/{id}', 'delete-menu-panel/{id}', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(96, 'menu-list', 'menu-list', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(97, 'sidebar-menu', 'sidebar-menu', NULL, 1, 0, '2016-04-26 21:13:36', '2016-04-26 21:13:36'),
(98, 'view-currency', 'view-currency', NULL, 1, 0, '2016-05-03 00:36:35', '2016-05-03 00:36:35'),
(99, 'add-currency', 'add-currency', NULL, 1, 0, '2016-05-03 00:36:35', '2016-05-03 00:36:35'),
(100, 'edit-currency/{id}', 'edit-currency/{id}', NULL, 1, 0, '2016-05-03 00:36:35', '2016-05-03 00:36:35'),
(101, 'update-currency/{id}', 'update-currency/{id}', NULL, 1, 0, '2016-05-03 00:36:35', '2016-05-03 00:36:35'),
(102, 'delete-currency/{id}', 'delete-currency/{id}', NULL, 1, 0, '2016-05-03 00:36:35', '2016-05-03 00:36:35'),
(103, 'print-cut', 'print-cut', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(104, 'formulier-stickers', 'formulier-stickers', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(105, 'formulier-t-shirts', 'formulier-t-shirts', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(106, 'formulier-gr-formaat', 'formulier-gr-formaat', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(107, 'materialen', 'materialen', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(108, 'formulier-laser-cards', 'formulier-laser-cards', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(109, 'formulier-stempels', 'formulier-stempels', NULL, 1, 0, '2016-05-09 17:52:25', '2016-05-09 17:52:25'),
(110, 'view-currency-details/{id}', 'view-currency-details/{id}', NULL, 1, 0, '2016-06-05 22:10:30', '2016-06-05 22:10:30'),
(111, 'screen', 'screen', NULL, 1, 0, '2016-06-16 17:07:56', '2016-06-16 17:07:56'),
(112, 'store-screen', 'store-screen', NULL, 1, 0, '2016-06-16 17:07:56', '2016-06-16 17:07:56'),
(113, 'pad', 'pad', NULL, 1, 0, '2016-06-16 17:07:56', '2016-06-16 17:07:56'),
(114, 'store-pad', 'store-pad', NULL, 1, 0, '2016-06-16 17:07:56', '2016-06-16 17:07:56'),
(115, 'price-list', 'price-list', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(116, 'store-price-list', 'store-price-list', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(117, 'view-price-list/{id}', 'view-price-list/{id}', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(118, 'edit-price-list/{id}', 'edit-price-list/{id}', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(119, 'update-price-list/{id}', 'update-price-list/{id}', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(120, 'search-price-list', 'search-price-list', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(121, 'delete-price-list/{id}', 'delete-price-list/{id}', NULL, 1, 0, '2016-07-19 21:05:53', '2016-07-19 21:05:53'),
(122, 'leave-application', 'leave-application', NULL, 1, 0, '2016-09-26 20:04:19', '2016-09-26 20:04:19'),
(123, 'store-leave-application', 'store-leave-application', NULL, 1, 0, '2016-09-26 20:04:19', '2016-09-26 20:04:19'),
(124, 'leave-approve/{id}', 'leave-approve/{id}', NULL, 1, 0, '2016-09-26 20:04:19', '2016-09-26 20:04:19'),
(125, 'leave-decline/{id}', 'leave-decline/{id}', NULL, 1, 0, '2016-09-26 20:04:19', '2016-09-26 20:04:19'),
(126, 'leave-accept/{id}', 'leave-accept/{id}', NULL, 1, 0, '2016-09-26 20:04:19', '2016-09-26 20:04:19'),
(127, 'search-worker', 'search-worker', NULL, 1, 0, '2016-09-26 20:04:19', '2016-09-26 20:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'active', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 1, 'active', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 1, 'active', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 78, 1, 'active', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 4, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(6, 5, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(7, 6, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(8, 7, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(9, 8, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(10, 9, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(11, 10, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(12, 11, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(13, 12, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(14, 13, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(15, 14, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(16, 15, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(17, 16, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(19, 18, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(20, 19, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(21, 20, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(22, 21, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(23, 22, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(24, 23, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(25, 24, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(26, 25, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(27, 26, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(28, 27, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(29, 28, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(30, 29, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(31, 30, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(32, 31, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(33, 32, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(34, 33, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(35, 34, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(36, 35, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(37, 36, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(38, 37, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(39, 38, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(40, 39, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(41, 40, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(42, 41, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(43, 42, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(44, 43, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(45, 44, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(46, 45, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(47, 46, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(48, 47, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(49, 48, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(50, 49, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(51, 50, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(52, 51, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(53, 52, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(54, 53, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(55, 54, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(56, 55, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(57, 56, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(58, 57, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(59, 58, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(60, 59, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(61, 60, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(62, 61, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(63, 62, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(64, 63, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(65, 64, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(66, 65, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(67, 66, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(68, 67, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(69, 68, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(70, 69, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(71, 70, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(72, 71, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(73, 72, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(74, 73, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(75, 74, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(76, 75, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(77, 76, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(78, 77, 1, 'active', 1, 0, '2016-03-03 15:26:05', '2016-03-03 15:26:05'),
(79, 5, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(80, 6, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(81, 7, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(82, 8, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(83, 9, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(84, 10, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(85, 32, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(86, 33, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(87, 34, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(88, 35, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(89, 36, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(90, 37, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(91, 38, 2, 'active', 1, 0, '2016-03-03 15:28:35', '2016-03-03 15:28:35'),
(92, 52, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(93, 55, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(94, 56, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(95, 57, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(96, 63, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(97, 64, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(98, 65, 2, 'active', 1, 0, '2016-03-03 15:30:57', '2016-03-03 15:30:57'),
(99, 53, 2, 'active', 1, 0, '2016-03-03 15:33:24', '2016-03-03 15:33:24'),
(100, 62, 2, 'active', 1, 0, '2016-03-03 16:05:07', '2016-03-03 16:05:07'),
(101, 79, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(102, 80, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(103, 81, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(104, 82, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(105, 83, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(106, 84, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(107, 85, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(108, 86, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(109, 87, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(110, 88, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(111, 89, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(112, 90, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(113, 91, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(114, 92, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(115, 93, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(116, 94, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(117, 95, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(118, 96, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(119, 97, 1, 'active', 1, 0, '2016-04-26 21:14:26', '2016-04-26 21:14:26'),
(120, 98, 1, 'active', 1, 0, '2016-05-03 00:37:14', '2016-05-03 00:37:14'),
(121, 99, 1, 'active', 1, 0, '2016-05-03 00:37:14', '2016-05-03 00:37:14'),
(122, 100, 1, 'active', 1, 0, '2016-05-03 00:37:14', '2016-05-03 00:37:14'),
(123, 101, 1, 'active', 1, 0, '2016-05-03 00:37:14', '2016-05-03 00:37:14'),
(124, 102, 1, 'active', 1, 0, '2016-05-03 00:37:14', '2016-05-03 00:37:14'),
(125, 103, 1, 'active', 1, 0, '2016-05-09 18:00:44', '2016-05-09 18:00:44'),
(127, 80, 2, 'active', 1, 0, '2016-05-11 00:26:20', '2016-05-11 00:26:20'),
(128, 81, 2, 'active', 1, 0, '2016-05-11 00:28:50', '2016-05-11 00:28:50'),
(129, 83, 2, 'active', 1, 0, '2016-05-11 00:28:50', '2016-05-11 00:28:50'),
(130, 85, 2, 'active', 1, 0, '2016-05-11 00:28:50', '2016-05-11 00:28:50'),
(131, 87, 2, 'active', 1, 0, '2016-05-11 00:28:50', '2016-05-11 00:28:50'),
(132, 103, 2, 'active', 1, 0, '2016-05-11 00:28:50', '2016-05-11 00:28:50'),
(134, 98, 2, 'active', 1, 0, '2016-06-05 20:35:28', '2016-06-05 20:35:28'),
(135, 110, 2, 'active', 1, 0, '2016-06-05 22:11:09', '2016-06-05 22:11:09'),
(136, 82, 2, 'active', 1, 0, '2016-06-08 15:09:22', '2016-06-08 15:09:22'),
(137, 84, 2, 'active', 1, 0, '2016-06-08 15:14:42', '2016-06-08 15:14:42'),
(138, 86, 2, 'active', 1, 0, '2016-06-08 15:59:35', '2016-06-08 15:59:35'),
(139, 88, 2, 'active', 1, 0, '2016-06-08 16:00:44', '2016-06-08 16:00:44'),
(140, 111, 1, 'active', 1, 0, '2016-06-16 17:08:49', '2016-06-16 17:08:49'),
(141, 112, 1, 'active', 1, 0, '2016-06-16 17:08:49', '2016-06-16 17:08:49'),
(142, 113, 1, 'active', 1, 0, '2016-06-16 17:08:49', '2016-06-16 17:08:49'),
(143, 114, 1, 'active', 1, 0, '2016-06-16 17:08:49', '2016-06-16 17:08:49'),
(144, 111, 2, 'active', 1, 0, '2016-06-16 17:09:11', '2016-06-16 17:09:11'),
(145, 112, 2, 'active', 1, 0, '2016-06-16 17:09:11', '2016-06-16 17:09:11'),
(146, 113, 2, 'active', 1, 0, '2016-06-16 17:09:11', '2016-06-16 17:09:11'),
(147, 114, 2, 'active', 1, 0, '2016-06-16 17:09:11', '2016-06-16 17:09:11'),
(148, 104, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(149, 105, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(150, 106, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(151, 107, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(152, 108, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(153, 109, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(154, 110, 1, 'active', 1, 0, '2016-06-26 14:38:26', '2016-06-26 14:38:26'),
(155, 121, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(156, 115, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(157, 116, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(158, 117, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(159, 118, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(160, 119, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(161, 120, 1, 'active', 1, 0, '2016-07-19 21:06:24', '2016-07-19 21:06:24'),
(162, 115, 2, 'active', 1, 0, '2016-07-19 21:06:45', '2016-07-19 21:06:45'),
(164, 117, 2, 'active', 1, 0, '2016-07-19 21:06:45', '2016-07-19 21:06:45'),
(165, 122, 1, 'active', 1, 0, '2016-09-26 20:04:40', '2016-09-26 20:04:40'),
(166, 123, 1, 'active', 1, 0, '2016-09-26 20:04:40', '2016-09-26 20:04:40'),
(167, 124, 1, 'active', 1, 0, '2016-09-26 20:04:40', '2016-09-26 20:04:40'),
(168, 125, 1, 'active', 1, 0, '2016-09-26 20:04:40', '2016-09-26 20:04:40'),
(169, 126, 1, 'active', 1, 0, '2016-09-26 20:04:40', '2016-09-26 20:04:40'),
(170, 127, 1, 'active', 1, 0, '2016-09-26 20:04:40', '2016-09-26 20:04:40'),
(171, 122, 3, 'active', 1, 0, '2016-09-26 20:10:39', '2016-09-26 20:10:39'),
(172, 123, 3, 'active', 1, 0, '2016-09-26 20:10:39', '2016-09-26 20:10:39'),
(173, 124, 3, 'active', 1, 0, '2016-09-26 20:10:39', '2016-09-26 20:10:39'),
(174, 125, 3, 'active', 1, 0, '2016-09-26 20:10:39', '2016-09-26 20:10:39'),
(175, 126, 3, 'active', 1, 0, '2016-09-26 20:10:39', '2016-09-26 20:10:39'),
(176, 122, 4, 'active', 1, 0, '2016-09-26 20:11:04', '2016-09-26 20:11:04'),
(177, 123, 4, 'active', 1, 0, '2016-09-26 20:11:04', '2016-09-26 20:11:04'),
(178, 124, 4, 'active', 1, 0, '2016-09-26 20:11:04', '2016-09-26 20:11:04'),
(179, 125, 4, 'active', 1, 0, '2016-09-26 20:11:04', '2016-09-26 20:11:04'),
(180, 126, 4, 'active', 1, 0, '2016-09-26 20:11:04', '2016-09-26 20:11:04'),
(181, 122, 5, 'active', 1, 0, '2016-09-26 20:11:26', '2016-09-26 20:11:26'),
(182, 123, 5, 'active', 1, 0, '2016-09-26 20:11:26', '2016-09-26 20:11:26'),
(183, 124, 5, 'active', 1, 0, '2016-09-26 20:11:26', '2016-09-26 20:11:26'),
(184, 125, 5, 'active', 1, 0, '2016-09-26 20:11:26', '2016-09-26 20:11:26'),
(185, 126, 5, 'active', 1, 0, '2016-09-26 20:11:26', '2016-09-26 20:11:26'),
(186, 122, 6, 'active', 1, 0, '2016-09-26 20:12:36', '2016-09-26 20:12:36'),
(187, 123, 6, 'active', 1, 0, '2016-09-26 20:12:36', '2016-09-26 20:12:36'),
(188, 124, 6, 'active', 1, 0, '2016-09-26 20:12:36', '2016-09-26 20:12:36'),
(189, 125, 6, 'active', 1, 0, '2016-09-26 20:12:36', '2016-09-26 20:12:36'),
(190, 126, 6, 'active', 1, 0, '2016-09-26 20:12:36', '2016-09-26 20:12:36'),
(191, 127, 3, 'active', 1, 0, '2016-09-26 20:15:35', '2016-09-26 20:15:35'),
(192, 127, 4, 'active', 1, 0, '2016-09-26 20:16:01', '2016-09-26 20:16:01'),
(193, 127, 5, 'active', 1, 0, '2016-09-26 20:16:35', '2016-09-26 20:16:35'),
(194, 127, 6, 'active', 1, 0, '2016-09-26 20:17:12', '2016-09-26 20:17:12'),
(195, 10, 3, 'active', 1, 0, '2016-09-26 20:18:42', '2016-09-26 20:18:42'),
(196, 10, 4, 'active', 1, 0, '2016-09-26 20:18:59', '2016-09-26 20:18:59'),
(197, 10, 5, 'active', 1, 0, '2016-09-26 20:19:16', '2016-09-26 20:19:16'),
(198, 10, 6, 'active', 1, 0, '2016-09-26 20:19:32', '2016-09-26 20:19:32'),
(199, 54, 3, 'active', 1, 0, '2016-09-27 22:12:14', '2016-09-27 22:12:14'),
(200, 54, 4, 'active', 1, 0, '2016-09-27 22:12:35', '2016-09-27 22:12:35'),
(201, 54, 5, 'active', 1, 0, '2016-09-27 22:12:56', '2016-09-27 22:12:56'),
(202, 54, 6, 'active', 1, 0, '2016-09-27 22:13:15', '2016-09-27 22:13:15'),
(203, 80, 3, 'active', 1, 0, '2016-09-27 22:14:56', '2016-09-27 22:14:56'),
(204, 80, 4, 'active', 1, 0, '2016-09-27 22:16:47', '2016-09-27 22:16:47'),
(205, 80, 5, 'active', 1, 0, '2016-09-27 22:17:00', '2016-09-27 22:17:00'),
(206, 80, 6, 'active', 1, 0, '2016-09-27 22:17:13', '2016-09-27 22:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `image` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb_image` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`id`, `code`, `description`, `unit`, `price`, `image`, `thumb_image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'H001', 'Welcome !!', '$', 1200.00, 'uploads/pricelist_image/96297Chrysanthemum.jpg', 'uploads/pricelist_image/thumb_50x50_726_Chrysanthemum.jpg', 'inactive', 1, 1, '2016-07-19 07:54:31', '2016-07-30 01:09:15'),
(2, 'H002', 'Description of Price list', '$', 500.00, 'uploads/pricelist_image/42225carpentry-project-cork-2016.JPG', 'uploads/pricelist_image/thumb_50x50_873_carpentry-project-cork-2016.JPG', 'inactive', 1, 1, '2016-07-19 08:23:02', '2016-07-30 01:09:22'),
(3, 'H003', 'Description from live', '$', 300.00, 'uploads/pricelist_image/584489.jpg', 'uploads/pricelist_image/thumb_50x50_799_9.jpg', 'inactive', 1, 1, '2016-07-19 20:53:20', '2016-07-19 20:58:13'),
(4, 'H004', 'dfdf', 'u', 434.00, 'uploads/pricelist_image/6950511012315_398406690337084_602370860_n.jpg', 'uploads/pricelist_image/thumb_50x50_985_11012315_398406690337084_602370860_n.jpg', 'inactive', 1, 1, '2016-07-19 20:56:40', '2016-07-30 01:09:28'),
(5, '1', 'Personen auto_Small\r\nDUET_VITZ_GLANZA\r\n15 M2', '1', 600.00, 'uploads/pricelist_image/90619small.jpg', 'uploads/pricelist_image/thumb_50x50_469_small.jpg', 'active', 1, 1, '2016-07-30 01:10:43', '2016-07-30 01:11:26'),
(6, '2', 'Personen auto_Small\r\nCORONA_COROLLA_RACTIS\r\n18 M2', '1', 800.00, 'uploads/pricelist_image/73704medium.jpg', 'uploads/pricelist_image/thumb_50x50_358_medium.jpg', 'active', 1, 1, '2016-07-30 01:13:27', '2016-07-30 01:14:06'),
(7, '3', 'Personen auto_Large\r\nSUV_PAJERO_Pickups_Bestelbus\r\n20M2', '1', 900.00, 'uploads/pricelist_image/80601large.jpg', 'uploads/pricelist_image/thumb_50x50_126_large.jpg', 'active', 1, 0, '2016-07-30 01:14:57', '2016-07-30 01:14:57'),
(8, '4', 'Grote Bussen\r\nCOASTER_ROSA_26-30 personen\r\n25M2', '1', 1400.00, 'uploads/pricelist_image/92391grote_bussen.jpg', 'uploads/pricelist_image/thumb_50x50_537_grote_bussen.jpg', 'active', 1, 0, '2016-07-30 01:15:46', '2016-07-30 01:15:46'),
(9, '5', 'Roll Up Banner\r\n- afmeting print: 200cm x 80cm\r\n- anti curl banner\r\n- inclusief print\r\n- inclusief opberg tas\r\n- indoor use', '1', 120.00, 'uploads/pricelist_image/78063rollup_banner.jpg', 'uploads/pricelist_image/thumb_50x50_275_rollup_banner.jpg', 'active', 1, 1, '2016-07-30 01:17:17', '2016-07-30 01:46:44'),
(10, '6', 'Curb Sign_Sandwich Sign_Stoepbord\r\n- afmeting print: 61cm x 91cm\r\n- mogelijkheid te vullen met water, voor meer stabiliteit\r\n- inclusief print op vinyl 2 zijden\r\n- indoor & outdoor use\r\n- water & weather resistant', '1', 130.00, 'uploads/pricelist_image/18102stoepbord.jpg', 'uploads/pricelist_image/thumb_50x50_567_stoepbord.jpg', 'active', 1, 0, '2016-07-30 01:18:44', '2016-07-30 01:18:44'),
(11, '7', 'Bord op staander\r\n- afmeting print:70cm x100cm\r\n- stalen framewerk met Alucobond plaat\r\n- inclusief print op vinyl 2 zijden\r\n- indoor & outdoor use\r\n- water & weather resistant', '1', 160.00, 'uploads/pricelist_image/48209staander_bord.jpg', 'uploads/pricelist_image/thumb_50x50_207_staander_bord.jpg', 'active', 1, 0, '2016-07-30 01:19:47', '2016-07-30 01:19:47'),
(12, '8', 'Spin the Wheel\r\n- afmeting print: Ø75cm\r\n- stalen framewerk met MDF plaat\r\n- inclusief print op vinyl\r\n- indoor use', '1', 370.00, 'uploads/pricelist_image/46374spinthewheel.jpg', 'uploads/pricelist_image/thumb_50x50_545_spinthewheel.jpg', 'active', 1, 0, '2016-07-30 01:20:31', '2016-07-30 01:20:31'),
(14, 'xxx', 'Yeererwer', 'pc', 11.00, 'uploads/pricelist_image/341952000x1250 g.jpg', 'uploads/pricelist_image/thumb_50x50_465_2000x1250 g.jpg', 'inactive', 1, 1, '2016-09-14 04:57:32', '2016-09-14 04:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `title`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'active', 1, 0, '2016-03-03 14:05:24', '2016-03-03 14:05:24'),
(2, 'user', 'user', 'active', 1, 0, '2016-03-03 14:05:29', '2016-03-03 14:05:29'),
(3, 'worker', 'worker', 'active', 1, 0, '2016-09-25 02:44:28', '2016-09-25 02:44:28'),
(4, 'supervisor', 'supervisor', 'active', 1, 0, '2016-09-25 02:44:48', '2016-09-25 02:44:48'),
(5, 'hr', 'hr', 'active', 1, 0, '2016-09-25 02:45:37', '2016-09-25 02:45:37'),
(6, 'manager', 'manager', 'active', 1, 0, '2016-09-25 02:45:49', '2016-09-25 02:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `remember_token`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'active', 1, 0, '2016-03-03 14:05:43', '2016-03-03 14:05:43'),
(2, 2, 2, NULL, 'active', 1, 0, '2016-03-03 14:18:05', '2016-03-03 14:18:05'),
(3, 2, 3, NULL, 'active', 1, 0, '2016-04-12 02:48:36', '2016-04-12 02:48:36'),
(4, 2, 4, NULL, 'active', 1, 0, '2016-04-15 01:13:20', '2016-04-15 01:13:20'),
(5, 2, 5, NULL, 'active', 1, 0, '2016-04-15 01:26:29', '2016-04-15 01:26:29'),
(6, 2, 6, NULL, 'active', 1, 0, '2016-04-15 01:32:31', '2016-04-15 01:32:31'),
(7, 2, 7, NULL, 'active', 1, 0, '2016-04-15 01:33:02', '2016-04-15 01:33:02'),
(8, 2, 8, NULL, 'active', 1, 0, '2016-04-15 01:58:55', '2016-04-15 01:58:55'),
(9, 2, 9, NULL, 'active', 1, 0, '2016-04-24 23:07:30', '2016-04-24 23:07:30'),
(10, 2, 10, NULL, 'active', 1, 0, '2016-06-05 20:07:21', '2016-06-05 20:07:21'),
(11, 1, 11, NULL, 'active', 1, 0, '2016-06-08 06:40:05', '2016-06-08 06:40:05'),
(12, 2, 12, NULL, 'active', 1, 0, '2016-06-22 01:13:03', '2016-06-22 01:13:03'),
(13, 2, 13, NULL, 'active', 1, 0, '2016-07-26 22:27:51', '2016-07-26 22:27:51'),
(14, 2, 14, NULL, 'active', 1, 0, '2016-08-02 06:01:28', '2016-08-02 06:01:28'),
(15, 3, 15, NULL, 'active', 1, 0, '2016-09-26 19:56:44', '2016-09-26 19:56:44'),
(16, 4, 16, NULL, 'active', 1, 0, '2016-09-26 19:57:44', '2016-09-26 19:57:44'),
(17, 5, 17, NULL, 'active', 1, 0, '2016-09-26 19:58:44', '2016-09-26 19:58:44'),
(18, 6, 18, NULL, 'active', 1, 0, '2016-09-26 19:59:35', '2016-09-26 19:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(6) NOT NULL,
  `title` varchar(64) NOT NULL,
  `status` varchar(64) NOT NULL,
  `user_type` varchar(64) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `status`, `user_type`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'r11_screen', '1.2', 'admin', 1, 0, 0, 0),
(2, 'r16_screen', '15', 'admin', 1, 0, 0, 0),
(3, 'r17_screen', '0.1', 'admin', 1, 0, 0, 0),
(4, 'r18_screen', '1.1', 'admin', 1, 0, 0, 0),
(5, 'r19_screen', '0.6', 'admin', 1, 0, 0, 0),
(6, 'r10_screen', '0', 'admin', 1, 0, 0, 0),
(7, 'r22_screen', '0', 'admin', 1, 0, 0, 0),
(8, 'r28_screen', '0.08', 'admin', 1, 0, 0, 0),
(9, 'r11_pad', '1.5', 'admin', 1, 0, 0, 0),
(10, 'r16_pad', '15', 'admin', 1, 0, 0, 0),
(11, 'r17_pad', '0.22', 'admin', 1, 0, 0, 0),
(12, 'r18_pad', '0.30', 'admin', 1, 0, 0, 0),
(13, 'r19_pad', '0.2', 'admin', 1, 0, 0, 0),
(14, 'r22_pad', '0', 'admin', 1, 0, 0, 0),
(15, 'r28_pad', '0.08', 'admin', 1, 0, 0, 0),
(16, 'r10_pad', '0', 'admin', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `residence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` int(11) NOT NULL,
  `employed` date NOT NULL,
  `balance` double NOT NULL,
  `function` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `csrf_token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `remember_token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `number`, `last_name`, `first_name`, `sex`, `id_number`, `birth_date`, `birth_place`, `address`, `residence`, `district`, `telephone`, `employed`, `balance`, `function`, `username`, `email`, `password`, `auth_key`, `access_token`, `csrf_token`, `ip_address`, `role_id`, `department_id`, `last_visit`, `expire_date`, `remember_token`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 0, '', '', '', '0', '2016-09-08', '', '', '', '', 0, '0000-00-00', 24203, '', 'admin', 'admin@admin.com', '$2y$10$C6W5gQDdWKW9JL5ARf0OtOobKeXFV8sXJLzTaFGbse4/nZ2nhflVi', NULL, NULL, '0Zh91UIAxOclPWNxrHk7d3v5xbbGNC', '127.0.1.1', 1, 1, '2016-11-18 09:42:15', '2020-06-04 10:47:37', 'UHeCGv7yDuXZo0nIR1wD9NQgX82L9ndobXvjVNxsXC58ZhdY1nFbBVmp5JrC', 'active', 1, 1, '0000-00-00 00:00:00', '2016-11-18 21:13:22'),
(2, 0, '', '', '', '0', '0000-00-00', '', '', '', '', 0, '0000-00-00', 0, '', 'user', 'user@user.com', '$2y$10$iTWE6WWHQVJkZpde0lkg/egjqOwxtD9tzeB8hBwTTvLGCTjow155i', NULL, NULL, 'zOEuSCM3nhSJHFmKM9Vzu7fx34tol6', '192.185.82.226', 2, 2, '2016-07-22 11:19:39', '2017-01-01 00:00:00', 'nXxrwNKCbmHhGYMFPjANlAT8R6DFPO1Dsx1nOqa1i60sqwT5IrdAKphg4VJ6', 'active', 1, 2, '2016-03-03 14:18:05', '2016-07-19 23:09:11'),
(15, 0, '', '', '', '0', '0000-00-00', '', '', '', '', 0, '2010-10-10', 29.5, '', 'worker', 'zachariassamat389@hotmail.com', '$2y$10$j3szkAjN5hAlKyyNqX3Ec.W3NAnPfJLOoUnEMa6ZdLTNg4/3UM6eu', NULL, NULL, 'IZ2flxxyu8Y8VkPzOHbRSXbUGGx5py', '192.168.80.28', 3, 3, '2016-11-18 05:40:27', '2018-09-26 00:00:00', 'RGKsSHRejQBq1CaKEUa07ZFiaFgXFrSwR92GZuQ9QWW19FGoiN9OZHXrqsFM', 'active', 1, 15, '2016-09-26 19:56:44', '2016-11-18 20:46:13'),
(16, 0, '', '', '', '0', '0000-00-00', '', '', '', '', 0, '0000-00-00', 24203, '', 'supervisor', 'mitchel@bitdynamics.sr', '$2y$10$y4QUNPD8dDRHyVJmvQKbsO5UcErx1JSNBTjl1KwEMZn0ns3l6Ss9i', NULL, NULL, 'HtuXYz4cfOeygkXVKR8MOEOPOoc6lg', '192.168.80.28', 4, 3, '2016-11-18 06:13:27', '2018-09-26 00:00:00', 'ZmTKBTMuBmSdd1IA23s1RSIBxAyRLDaBwNap2tqFiGqx4cS9EfhTtCN79gZ1', 'active', 1, 1, '2016-09-26 19:57:44', '2016-11-18 21:13:20'),
(17, 0, '', '', '', '0', '0000-00-00', '', '', '', '', 0, '2010-12-12', 71, '', 'hr', 'pawiromitchel@gmail.com', '$2y$10$0pKARPPQo5OPAMqhg5nWDe/Ays4l41SHzh2lmnNVD0mq7saTvn.yO', NULL, NULL, 'zHJhNbdbRtLXQkkzoONzBT5o8pVRa9', '192.168.80.28', 5, 3, '2016-11-18 05:46:16', '2018-09-26 00:00:00', 'eeRlX5HapXaeXyx129kUdBCtGPHZEQWFWnnbFNdwb6aNksv6fLfYhEm3S7lX', 'active', 1, 17, '2016-09-26 19:58:44', '2016-11-18 21:12:37'),
(18, 0, '', '', '', '0', '0000-00-00', '', '', '', '', 0, '0000-00-00', 24202, '', 'manager', 'pawiromitchel@hotmail.com', '$2y$10$DAN3AvdK07A7j1pXVp1YYuzhKfladGytjy/VF/KakpPtTHftaOaEy', NULL, NULL, 'IDJMmGMULw902SXxvyzQeENDu7s3DW', '192.168.80.28', 6, 3, '2016-10-13 08:01:50', '2018-09-26 00:00:00', 'ld9eC9kjttjzAEHEZyc2lX3Y43Er1pGGfGMeQP1YjtwWX21pgfMfj54Lr7Yh', 'active', 1, 1, '2016-09-26 19:59:35', '2016-11-17 00:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `action_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_details` text COLLATE utf8_unicode_ci,
  `action_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`id`, `action_name`, `action_url`, `action_details`, `action_table`, `date`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-03 02:05:00', 1, 1, 0, '2016-03-03 14:05:00', '2016-03-03 14:05:00'),
(2, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-03-03 02:20:30', 1, 1, 0, '2016-03-03 14:20:30', '2016-03-03 14:20:30'),
(3, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-03 02:20:32', 1, 1, 0, '2016-03-03 14:20:32', '2016-03-03 14:20:32'),
(4, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-03-03 03:28:41', 1, 1, 0, '2016-03-03 15:28:41', '2016-03-03 15:28:41'),
(5, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-03-03 03:29:14', 2, 2, 0, '2016-03-03 15:29:14', '2016-03-03 15:29:14'),
(6, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-03 03:30:19', 1, 1, 0, '2016-03-03 15:30:19', '2016-03-03 15:30:19'),
(7, 'user-logout', 'user-logout', 'user logged out', 'user', '2016-03-03 04:08:23', 2, 2, 0, '2016-03-03 16:08:23', '2016-03-03 16:08:23'),
(8, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-03 04:08:28', 1, 1, 0, '2016-03-03 16:08:28', '2016-03-03 16:08:28'),
(9, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-04 11:39:53', 1, 1, 0, '2016-03-05 11:39:53', '2016-03-05 11:39:53'),
(10, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-05 12:09:12', 1, 1, 0, '2016-03-05 12:09:12', '2016-03-05 12:09:12'),
(11, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-03-05 12:16:02', 1, 1, 0, '2016-03-05 12:16:02', '2016-03-05 12:16:02'),
(12, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-03-05 12:16:20', 1, 1, 0, '2016-03-05 12:16:20', '2016-03-05 12:16:20'),
(13, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-10 03:11:50', 1, 1, 0, '2016-04-11 00:11:50', '2016-04-11 00:11:50'),
(14, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-10 03:50:33', 1, 1, 0, '2016-04-11 00:50:33', '2016-04-11 00:50:33'),
(15, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-10 04:04:52', 1, 1, 0, '2016-04-11 01:04:52', '2016-04-11 01:04:52'),
(16, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-10 04:05:03', 1, 1, 0, '2016-04-11 01:05:03', '2016-04-11 01:05:03'),
(17, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-11 05:15:15', 1, 1, 0, '2016-04-12 02:15:15', '2016-04-12 02:15:15'),
(18, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-11 05:48:42', 1, 1, 0, '2016-04-12 02:48:42', '2016-04-12 02:48:42'),
(19, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-04-11 05:49:21', 3, 3, 0, '2016-04-12 02:49:21', '2016-04-12 02:49:21'),
(20, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-11 05:56:22', 1, 1, 0, '2016-04-12 02:56:22', '2016-04-12 02:56:22'),
(21, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-04-11 06:33:33', 3, 3, 0, '2016-04-12 01:33:33', '2016-04-12 01:33:33'),
(22, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-14 06:00:39', 1, 1, 0, '2016-04-15 01:00:39', '2016-04-15 01:00:39'),
(23, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-14 06:04:34', 1, 1, 0, '2016-04-15 01:04:34', '2016-04-15 01:04:34'),
(24, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-14 06:05:23', 1, 1, 0, '2016-04-15 01:05:23', '2016-04-15 01:05:23'),
(25, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-14 06:06:33', 1, 1, 0, '2016-04-15 01:06:33', '2016-04-15 01:06:33'),
(26, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-14 06:09:46', 1, 1, 0, '2016-04-15 01:09:46', '2016-04-15 01:09:46'),
(27, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-14 06:11:20', 1, 1, 0, '2016-04-15 01:11:20', '2016-04-15 01:11:20'),
(28, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-04-14 06:11:33', 3, 3, 0, '2016-04-15 01:11:33', '2016-04-15 01:11:33'),
(29, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-04-14 06:12:19', 3, 3, 0, '2016-04-15 01:12:19', '2016-04-15 01:12:19'),
(30, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-14 06:12:23', 1, 1, 0, '2016-04-15 01:12:23', '2016-04-15 01:12:23'),
(31, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-14 06:58:00', 1, 1, 0, '2016-04-15 01:58:00', '2016-04-15 01:58:00'),
(32, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-04-14 07:10:56', 8, 8, 0, '2016-04-15 02:10:56', '2016-04-15 02:10:56'),
(33, 'user-logout', 'user-logout', 'miguell logged out', 'user', '2016-04-14 07:11:33', 8, 8, 0, '2016-04-15 02:11:33', '2016-04-15 02:11:33'),
(34, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-14 07:49:54', 1, 1, 0, '2016-04-15 02:49:54', '2016-04-15 02:49:54'),
(35, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-15 06:04:22', 1, 1, 0, '2016-04-15 13:04:22', '2016-04-15 13:04:22'),
(36, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-19 03:10:56', 1, 1, 0, '2016-04-19 22:10:56', '2016-04-19 22:10:56'),
(37, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-19 05:39:14', 1, 1, 0, '2016-04-20 00:39:14', '2016-04-20 00:39:14'),
(38, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-19 08:47:39', 1, 1, 0, '2016-04-20 03:47:39', '2016-04-20 03:47:39'),
(39, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-19 08:53:42', 1, 1, 0, '2016-04-20 03:53:42', '2016-04-20 03:53:42'),
(40, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-20 09:30:04', 1, 1, 0, '2016-04-20 16:30:04', '2016-04-20 16:30:04'),
(41, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-20 11:09:49', 1, 1, 0, '2016-04-21 06:09:49', '2016-04-21 06:09:49'),
(42, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-20 11:13:43', 1, 1, 0, '2016-04-21 06:13:43', '2016-04-21 06:13:43'),
(43, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-20 11:15:48', 1, 1, 0, '2016-04-21 06:15:48', '2016-04-21 06:15:48'),
(44, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-20 11:17:12', 1, 1, 0, '2016-04-21 06:17:12', '2016-04-21 06:17:12'),
(45, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-20 11:18:55', 1, 1, 0, '2016-04-21 06:18:55', '2016-04-21 06:18:55'),
(46, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-04-22 11:14:05', 6, 6, 0, '2016-04-23 06:14:05', '2016-04-23 06:14:05'),
(47, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-24 03:38:30', 1, 1, 0, '2016-04-24 22:38:30', '2016-04-24 22:38:30'),
(48, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-25 05:16:26', 1, 1, 0, '2016-04-26 00:16:26', '2016-04-26 00:16:26'),
(49, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-04-25 05:44:17', 6, 6, 0, '2016-04-26 00:44:17', '2016-04-26 00:44:17'),
(50, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 02:08:20', 1, 1, 0, '2016-04-26 21:08:20', '2016-04-26 21:08:20'),
(51, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 02:14:43', 1, 1, 0, '2016-04-26 21:14:43', '2016-04-26 21:14:43'),
(52, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 02:14:46', 1, 1, 0, '2016-04-26 21:14:46', '2016-04-26 21:14:46'),
(53, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 02:16:03', 1, 1, 0, '2016-04-26 21:16:03', '2016-04-26 21:16:03'),
(54, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 02:16:06', 1, 1, 0, '2016-04-26 21:16:06', '2016-04-26 21:16:06'),
(55, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 03:58:26', 1, 1, 0, '2016-04-26 22:58:26', '2016-04-26 22:58:26'),
(56, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 03:58:30', 1, 1, 0, '2016-04-26 22:58:30', '2016-04-26 22:58:30'),
(57, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 04:10:28', 1, 1, 0, '2016-04-26 23:10:28', '2016-04-26 23:10:28'),
(58, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 04:13:30', 1, 1, 0, '2016-04-26 23:13:30', '2016-04-26 23:13:30'),
(59, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-04-26 04:42:44', 2, 2, 0, '2016-04-26 23:42:44', '2016-04-26 23:42:44'),
(60, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:14:18', 1, 1, 0, '2016-04-27 00:14:18', '2016-04-27 00:14:18'),
(61, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:31:17', 1, 1, 0, '2016-04-27 00:31:17', '2016-04-27 00:31:17'),
(62, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:31:21', 1, 1, 0, '2016-04-27 00:31:21', '2016-04-27 00:31:21'),
(63, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:42:43', 1, 1, 0, '2016-04-27 00:42:43', '2016-04-27 00:42:43'),
(64, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:42:46', 1, 1, 0, '2016-04-27 00:42:46', '2016-04-27 00:42:46'),
(65, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:43:50', 1, 1, 0, '2016-04-27 00:43:50', '2016-04-27 00:43:50'),
(66, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:43:53', 1, 1, 0, '2016-04-27 00:43:53', '2016-04-27 00:43:53'),
(67, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:45:52', 1, 1, 0, '2016-04-27 00:45:52', '2016-04-27 00:45:52'),
(68, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:45:55', 1, 1, 0, '2016-04-27 00:45:55', '2016-04-27 00:45:55'),
(69, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:47:55', 1, 1, 0, '2016-04-27 00:47:55', '2016-04-27 00:47:55'),
(70, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:48:02', 1, 1, 0, '2016-04-27 00:48:02', '2016-04-27 00:48:02'),
(71, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:52:20', 1, 1, 0, '2016-04-27 00:52:20', '2016-04-27 00:52:20'),
(72, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-26 05:52:24', 1, 1, 0, '2016-04-27 00:52:24', '2016-04-27 00:52:24'),
(73, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-26 05:54:34', 1, 1, 0, '2016-04-27 00:54:34', '2016-04-27 00:54:34'),
(74, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-27 03:42:26', 1, 1, 0, '2016-04-27 22:42:26', '2016-04-27 22:42:26'),
(75, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-27 05:47:34', 1, 1, 0, '2016-04-28 00:47:34', '2016-04-28 00:47:34'),
(76, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-27 08:55:06', 1, 1, 0, '2016-04-28 03:55:06', '2016-04-28 03:55:06'),
(77, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-27 08:58:24', 1, 1, 0, '2016-04-28 03:58:24', '2016-04-28 03:58:24'),
(78, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-28 05:10:49', 1, 1, 0, '2016-04-29 00:10:49', '2016-04-29 00:10:49'),
(79, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-28 05:24:33', 1, 1, 0, '2016-04-29 00:24:33', '2016-04-29 00:24:33'),
(80, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-28 05:27:45', 1, 1, 0, '2016-04-29 00:27:45', '2016-04-29 00:27:45'),
(81, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-28 05:28:07', 1, 1, 0, '2016-04-29 00:28:07', '2016-04-29 00:28:07'),
(82, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-28 05:32:10', 1, 1, 0, '2016-04-29 00:32:10', '2016-04-29 00:32:10'),
(83, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-28 05:42:26', 1, 1, 0, '2016-04-29 00:42:26', '2016-04-29 00:42:26'),
(84, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-28 06:11:17', 1, 1, 0, '2016-04-29 01:11:17', '2016-04-29 01:11:17'),
(85, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-28 08:38:46', 1, 1, 0, '2016-04-29 03:38:46', '2016-04-29 03:38:46'),
(86, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-29 08:58:49', 1, 1, 0, '2016-04-30 03:58:49', '2016-04-30 03:58:49'),
(87, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-29 09:02:56', 1, 1, 0, '2016-04-30 04:02:56', '2016-04-30 04:02:56'),
(88, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-29 09:03:01', 1, 1, 0, '2016-04-30 04:03:01', '2016-04-30 04:03:01'),
(89, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-29 09:06:27', 1, 1, 0, '2016-04-30 04:06:27', '2016-04-30 04:06:27'),
(90, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-29 09:06:34', 1, 1, 0, '2016-04-30 04:06:34', '2016-04-30 04:06:34'),
(91, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-04-29 09:08:57', 1, 1, 0, '2016-04-30 04:08:57', '2016-04-30 04:08:57'),
(92, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-04-29 09:09:01', 1, 1, 0, '2016-04-30 04:09:01', '2016-04-30 04:09:01'),
(93, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 05:08:01', 1, 1, 0, '2016-05-03 00:08:01', '2016-05-03 00:08:01'),
(94, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-02 05:33:50', 1, 1, 0, '2016-05-03 00:33:50', '2016-05-03 00:33:50'),
(95, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 05:33:59', 1, 1, 0, '2016-05-03 00:33:59', '2016-05-03 00:33:59'),
(96, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-02 05:38:24', 1, 1, 0, '2016-05-03 00:38:24', '2016-05-03 00:38:24'),
(97, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 05:38:27', 1, 1, 0, '2016-05-03 00:38:27', '2016-05-03 00:38:27'),
(98, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 06:05:18', 1, 1, 0, '2016-05-03 01:05:18', '2016-05-03 01:05:18'),
(99, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 06:15:41', 1, 1, 0, '2016-05-03 01:15:41', '2016-05-03 01:15:41'),
(100, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-02 06:32:02', 1, 1, 0, '2016-05-03 01:32:02', '2016-05-03 01:32:02'),
(101, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-02 06:33:36', 3, 3, 0, '2016-05-03 01:33:36', '2016-05-03 01:33:36'),
(102, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-02 06:33:52', 3, 3, 0, '2016-05-03 01:33:52', '2016-05-03 01:33:52'),
(103, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 06:33:56', 1, 1, 0, '2016-05-03 01:33:56', '2016-05-03 01:33:56'),
(104, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-02 06:48:24', 1, 1, 0, '2016-05-03 01:48:24', '2016-05-03 01:48:24'),
(105, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 06:52:10', 1, 1, 0, '2016-05-03 01:52:10', '2016-05-03 01:52:10'),
(106, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 07:29:08', 1, 1, 0, '2016-05-03 02:29:08', '2016-05-03 02:29:08'),
(107, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-02 08:02:05', 1, 1, 0, '2016-05-03 03:02:05', '2016-05-03 03:02:05'),
(108, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 09:02:16', 1, 1, 0, '2016-05-03 04:02:16', '2016-05-03 04:02:16'),
(109, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 10:52:06', 1, 1, 0, '2016-05-03 05:52:06', '2016-05-03 05:52:06'),
(110, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-02 10:54:19', 1, 1, 0, '2016-05-03 05:54:19', '2016-05-03 05:54:19'),
(111, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-02 10:54:23', 1, 1, 0, '2016-05-03 05:54:23', '2016-05-03 05:54:23'),
(112, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 10:21:43', 1, 1, 0, '2016-05-03 17:21:43', '2016-05-03 17:21:43'),
(113, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-03 10:22:23', 1, 1, 0, '2016-05-03 17:22:23', '2016-05-03 17:22:23'),
(114, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 10:22:26', 1, 1, 0, '2016-05-03 17:22:27', '2016-05-03 17:22:27'),
(115, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 05:19:27', 1, 1, 0, '2016-05-04 00:19:27', '2016-05-04 00:19:27'),
(116, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 05:25:44', 1, 1, 0, '2016-05-04 00:25:44', '2016-05-04 00:25:44'),
(117, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-03 06:05:42', 1, 1, 0, '2016-05-04 01:05:42', '2016-05-04 01:05:42'),
(118, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 06:05:46', 1, 1, 0, '2016-05-04 01:05:46', '2016-05-04 01:05:46'),
(119, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 06:06:39', 1, 1, 0, '2016-05-04 01:06:39', '2016-05-04 01:06:39'),
(120, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-03 10:37:49', 1, 1, 0, '2016-05-04 05:37:49', '2016-05-04 05:37:49'),
(121, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-05 01:18:25', 1, 1, 0, '2016-05-05 08:18:25', '2016-05-05 08:18:25'),
(122, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-05 01:27:01', 1, 1, 0, '2016-05-05 08:27:01', '2016-05-05 08:27:01'),
(123, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-05 01:27:23', 1, 1, 0, '2016-05-05 08:27:23', '2016-05-05 08:27:23'),
(124, 'user-login', 'get-user-login', 'soelina logged in', 'user', '2016-05-05 05:30:17', 7, 7, 0, '2016-05-06 00:30:17', '2016-05-06 00:30:17'),
(125, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-05 05:36:51', 3, 3, 0, '2016-05-06 00:36:51', '2016-05-06 00:36:51'),
(126, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-05 08:37:34', 3, 3, 0, '2016-05-06 03:37:34', '2016-05-06 03:37:34'),
(127, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-05 10:32:18', 1, 1, 0, '2016-05-06 05:32:18', '2016-05-06 05:32:18'),
(128, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-06 12:14:15', 3, 3, 0, '2016-05-06 07:14:15', '2016-05-06 07:14:15'),
(129, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-06 12:24:46', 1, 1, 0, '2016-05-06 07:24:46', '2016-05-06 07:24:46'),
(130, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-06 12:53:43', 1, 1, 0, '2016-05-06 07:53:43', '2016-05-06 07:53:43'),
(131, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-06 02:06:44', 3, 3, 0, '2016-05-06 09:06:44', '2016-05-06 09:06:44'),
(132, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-07 02:18:16', 1, 1, 0, '2016-05-07 09:18:16', '2016-05-07 09:18:16'),
(133, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-08 12:06:35', 1, 1, 0, '2016-05-08 19:06:35', '2016-05-08 19:06:35'),
(134, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-08 06:06:48', 1, 1, 0, '2016-05-09 01:06:48', '2016-05-09 01:06:48'),
(135, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-08 06:21:40', 1, 1, 0, '2016-05-09 01:21:40', '2016-05-09 01:21:40'),
(136, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-08 06:33:19', 1, 1, 0, '2016-05-09 01:33:19', '2016-05-09 01:33:19'),
(137, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:48:15', 1, 1, 0, '2016-05-09 17:48:15', '2016-05-09 17:48:15'),
(138, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 10:51:13', 1, 1, 0, '2016-05-09 17:51:13', '2016-05-09 17:51:13'),
(139, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:51:16', 1, 1, 0, '2016-05-09 17:51:16', '2016-05-09 17:51:16'),
(140, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 10:52:34', 1, 1, 0, '2016-05-09 17:52:34', '2016-05-09 17:52:34'),
(141, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:52:37', 1, 1, 0, '2016-05-09 17:52:37', '2016-05-09 17:52:37'),
(142, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 10:56:41', 1, 1, 0, '2016-05-09 17:56:41', '2016-05-09 17:56:41'),
(143, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:56:45', 1, 1, 0, '2016-05-09 17:56:45', '2016-05-09 17:56:45'),
(144, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:57:16', 1, 1, 0, '2016-05-09 17:57:16', '2016-05-09 17:57:16'),
(145, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 10:57:52', 1, 1, 0, '2016-05-09 17:57:52', '2016-05-09 17:57:52'),
(146, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:57:58', 1, 1, 0, '2016-05-09 17:57:58', '2016-05-09 17:57:58'),
(147, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 10:58:45', 1, 1, 0, '2016-05-09 17:58:45', '2016-05-09 17:58:45'),
(148, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:58:52', 1, 1, 0, '2016-05-09 17:58:52', '2016-05-09 17:58:52'),
(149, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 10:59:04', 1, 1, 0, '2016-05-09 17:59:04', '2016-05-09 17:59:04'),
(150, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 10:59:07', 1, 1, 0, '2016-05-09 17:59:07', '2016-05-09 17:59:07'),
(151, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:00:49', 1, 1, 0, '2016-05-09 18:00:49', '2016-05-09 18:00:49'),
(152, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:00:52', 1, 1, 0, '2016-05-09 18:00:52', '2016-05-09 18:00:52'),
(153, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:00:52', 1, 1, 0, '2016-05-09 18:00:52', '2016-05-09 18:00:52'),
(154, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:01:08', 1, 1, 0, '2016-05-09 18:01:08', '2016-05-09 18:01:08'),
(155, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:02:49', 1, 1, 0, '2016-05-09 18:02:49', '2016-05-09 18:02:49'),
(156, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:02:56', 1, 1, 0, '2016-05-09 18:02:56', '2016-05-09 18:02:56'),
(157, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:03:05', 1, 1, 0, '2016-05-09 18:03:05', '2016-05-09 18:03:05'),
(158, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:03:08', 1, 1, 0, '2016-05-09 18:03:08', '2016-05-09 18:03:08'),
(159, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:03:26', 1, 1, 0, '2016-05-09 18:03:26', '2016-05-09 18:03:26'),
(160, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:03:34', 1, 1, 0, '2016-05-09 18:03:34', '2016-05-09 18:03:34'),
(161, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:03:34', 1, 1, 0, '2016-05-09 18:03:34', '2016-05-09 18:03:34'),
(162, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:03:38', 1, 1, 0, '2016-05-09 18:03:38', '2016-05-09 18:03:38'),
(163, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:19:07', 1, 1, 0, '2016-05-09 18:19:07', '2016-05-09 18:19:07'),
(164, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:19:10', 1, 1, 0, '2016-05-09 18:19:10', '2016-05-09 18:19:10'),
(165, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:21:35', 1, 1, 0, '2016-05-09 18:21:35', '2016-05-09 18:21:35'),
(166, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 11:22:40', 1, 1, 0, '2016-05-09 18:22:40', '2016-05-09 18:22:40'),
(167, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 11:22:43', 1, 1, 0, '2016-05-09 18:22:43', '2016-05-09 18:22:43'),
(168, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 05:22:24', 1, 1, 0, '2016-05-10 00:22:24', '2016-05-10 00:22:24'),
(169, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 05:26:33', 1, 1, 0, '2016-05-10 00:26:33', '2016-05-10 00:26:33'),
(170, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 05:29:06', 1, 1, 0, '2016-05-10 00:29:06', '2016-05-10 00:29:06'),
(171, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 06:18:48', 1, 1, 0, '2016-05-10 01:18:48', '2016-05-10 01:18:48'),
(172, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-09 06:19:02', 3, 3, 0, '2016-05-10 01:19:02', '2016-05-10 01:19:02'),
(173, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-09 06:19:04', 3, 3, 0, '2016-05-10 01:19:04', '2016-05-10 01:19:04'),
(174, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-09 07:07:55', 3, 3, 0, '2016-05-10 02:07:55', '2016-05-10 02:07:55'),
(175, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 07:08:04', 1, 1, 0, '2016-05-10 02:08:04', '2016-05-10 02:08:04'),
(176, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 07:08:42', 1, 1, 0, '2016-05-10 02:08:42', '2016-05-10 02:08:42'),
(177, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-09 07:08:50', 3, 3, 0, '2016-05-10 02:08:50', '2016-05-10 02:08:50'),
(178, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-09 07:08:59', 3, 3, 0, '2016-05-10 02:08:59', '2016-05-10 02:08:59'),
(179, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 07:09:03', 1, 1, 0, '2016-05-10 02:09:03', '2016-05-10 02:09:03'),
(180, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-09 07:27:02', 3, 3, 0, '2016-05-10 02:27:02', '2016-05-10 02:27:02'),
(181, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-09 07:39:13', 1, 1, 0, '2016-05-10 02:39:13', '2016-05-10 02:39:13'),
(182, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-09 07:39:22', 3, 3, 0, '2016-05-10 02:39:22', '2016-05-10 02:39:22'),
(183, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-09 07:39:27', 3, 3, 0, '2016-05-10 02:39:27', '2016-05-10 02:39:27'),
(184, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-09 07:39:34', 1, 1, 0, '2016-05-10 02:39:34', '2016-05-10 02:39:34'),
(185, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-10 01:54:31', 3, 3, 0, '2016-05-10 08:54:31', '2016-05-10 08:54:31'),
(186, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-10 05:21:25', 1, 1, 0, '2016-05-11 00:21:25', '2016-05-11 00:21:25'),
(187, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-10 05:27:00', 1, 1, 0, '2016-05-11 00:27:00', '2016-05-11 00:27:00'),
(188, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-10 05:27:08', 1, 1, 0, '2016-05-11 00:27:08', '2016-05-11 00:27:08'),
(189, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-10 05:27:16', 3, 3, 0, '2016-05-11 00:27:16', '2016-05-11 00:27:16'),
(190, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-10 05:29:14', 3, 3, 0, '2016-05-11 00:29:14', '2016-05-11 00:29:14'),
(191, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-10 05:29:22', 3, 3, 0, '2016-05-11 00:29:22', '2016-05-11 00:29:22'),
(192, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-10 06:02:55', 3, 3, 0, '2016-05-11 01:02:55', '2016-05-11 01:02:55'),
(193, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-10 08:52:38', 1, 1, 0, '2016-05-11 03:52:38', '2016-05-11 03:52:38'),
(194, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-05-10 08:52:45', 8, 8, 0, '2016-05-11 03:52:45', '2016-05-11 03:52:45'),
(195, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-05-10 08:53:07', 8, 8, 0, '2016-05-11 03:53:07', '2016-05-11 03:53:07'),
(196, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-05-10 08:54:41', 6, 6, 0, '2016-05-11 03:54:41', '2016-05-11 03:54:41'),
(197, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-11 12:23:36', 1, 1, 0, '2016-05-11 07:23:36', '2016-05-11 07:23:36'),
(198, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-05-11 01:17:10', 6, 6, 0, '2016-05-11 08:17:10', '2016-05-11 08:17:10'),
(199, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-11 05:32:51', 3, 3, 0, '2016-05-12 00:32:51', '2016-05-12 00:32:51'),
(200, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-11 05:46:06', 1, 1, 0, '2016-05-12 00:46:06', '2016-05-12 00:46:06'),
(201, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-11 07:15:37', 1, 1, 0, '2016-05-12 02:15:37', '2016-05-12 02:15:37'),
(202, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-11 07:52:55', 3, 3, 0, '2016-05-12 02:52:55', '2016-05-12 02:52:55'),
(203, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-11 09:43:45', 1, 1, 0, '2016-05-12 04:43:45', '2016-05-12 04:43:45'),
(204, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-05-11 11:15:57', 6, 6, 0, '2016-05-12 06:15:57', '2016-05-12 06:15:57'),
(205, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-12 12:10:19', 1, 1, 0, '2016-05-12 07:10:19', '2016-05-12 07:10:19'),
(206, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-12 12:15:12', 1, 1, 0, '2016-05-12 07:15:12', '2016-05-12 07:15:12'),
(207, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-05-12 01:43:59', 6, 6, 0, '2016-05-12 08:43:59', '2016-05-12 08:43:59'),
(208, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-12 06:51:16', 1, 1, 0, '2016-05-13 01:51:16', '2016-05-13 01:51:16'),
(209, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-12 06:54:38', 1, 1, 0, '2016-05-13 01:54:38', '2016-05-13 01:54:38'),
(210, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-12 06:54:52', 3, 3, 0, '2016-05-13 01:54:52', '2016-05-13 01:54:52'),
(211, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-12 08:25:17', 1, 1, 0, '2016-05-13 03:25:17', '2016-05-13 03:25:17'),
(212, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-12 10:42:14', 1, 1, 0, '2016-05-13 05:42:14', '2016-05-13 05:42:14'),
(213, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-14 01:29:33', 3, 3, 0, '2016-05-14 08:29:33', '2016-05-14 08:29:33'),
(214, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-14 02:02:32', 3, 3, 0, '2016-05-14 09:02:32', '2016-05-14 09:02:32'),
(215, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-05-14 05:00:12', 8, 8, 0, '2016-05-14 12:00:12', '2016-05-14 12:00:12'),
(216, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-14 05:08:31', 1, 1, 0, '2016-05-15 00:08:31', '2016-05-15 00:08:31'),
(217, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-15 12:12:23', 1, 1, 0, '2016-05-15 19:12:23', '2016-05-15 19:12:23'),
(218, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-16 09:48:49', 3, 3, 0, '2016-05-17 04:48:49', '2016-05-17 04:48:49'),
(219, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-17 12:28:55', 1, 1, 0, '2016-05-17 07:28:55', '2016-05-17 07:28:55'),
(220, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-17 01:17:27', 1, 1, 0, '2016-05-17 08:17:27', '2016-05-17 08:17:27'),
(221, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-17 07:34:32', 3, 3, 0, '2016-05-17 14:34:32', '2016-05-17 14:34:32'),
(222, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-17 09:01:37', 1, 1, 0, '2016-05-17 16:01:37', '2016-05-17 16:01:37'),
(223, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-17 08:52:53', 3, 3, 0, '2016-05-18 03:52:53', '2016-05-18 03:52:53'),
(224, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-18 12:53:16', 3, 3, 0, '2016-05-18 07:53:16', '2016-05-18 07:53:16'),
(225, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-19 05:19:25', 1, 1, 0, '2016-05-20 00:19:25', '2016-05-20 00:19:25'),
(226, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-19 05:22:28', 1, 1, 0, '2016-05-20 00:22:28', '2016-05-20 00:22:28'),
(227, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-19 05:22:43', 1, 1, 0, '2016-05-20 00:22:43', '2016-05-20 00:22:43'),
(228, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-19 05:23:11', 1, 1, 0, '2016-05-20 00:23:11', '2016-05-20 00:23:11'),
(229, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-05-19 05:23:18', 6, 6, 0, '2016-05-20 00:23:18', '2016-05-20 00:23:18'),
(230, 'user-logout', 'user-logout', 'suzy logged out', 'user', '2016-05-19 05:23:57', 6, 6, 0, '2016-05-20 00:23:57', '2016-05-20 00:23:57'),
(231, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-21 12:11:03', 1, 1, 0, '2016-05-21 07:11:03', '2016-05-21 07:11:03'),
(232, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-05-23 06:04:51', 6, 6, 0, '2016-05-24 01:04:51', '2016-05-24 01:04:51'),
(233, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-23 09:55:31', 3, 3, 0, '2016-05-24 04:55:31', '2016-05-24 04:55:31'),
(234, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-24 07:54:59', 3, 3, 0, '2016-05-25 02:54:59', '2016-05-25 02:54:59'),
(235, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-25 04:19:22', 1, 1, 0, '2016-05-25 23:19:22', '2016-05-25 23:19:22'),
(236, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-25 04:21:04', 1, 1, 0, '2016-05-25 23:21:04', '2016-05-25 23:21:04'),
(237, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-25 04:22:14', 1, 1, 0, '2016-05-25 23:22:14', '2016-05-25 23:22:14'),
(238, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-25 04:22:42', 1, 1, 0, '2016-05-25 23:22:42', '2016-05-25 23:22:42'),
(239, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-25 06:32:10', 3, 3, 0, '2016-05-26 01:32:10', '2016-05-26 01:32:10'),
(240, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-25 08:39:35', 3, 3, 0, '2016-05-26 03:39:35', '2016-05-26 03:39:35'),
(241, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-25 09:29:59', 1, 1, 0, '2016-05-26 04:29:59', '2016-05-26 04:29:59'),
(242, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-27 08:33:33', 3, 3, 0, '2016-05-28 03:33:33', '2016-05-28 03:33:33'),
(243, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-28 09:50:19', 1, 1, 0, '2016-05-29 04:50:19', '2016-05-29 04:50:19'),
(244, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-30 07:29:42', 3, 3, 0, '2016-05-31 02:29:42', '2016-05-31 02:29:42'),
(245, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-30 08:56:54', 1, 1, 0, '2016-05-31 03:56:54', '2016-05-31 03:56:54'),
(246, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-31 03:23:58', 1, 1, 0, '2016-05-31 22:23:58', '2016-05-31 22:23:58'),
(247, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-31 07:03:15', 3, 3, 0, '2016-06-01 02:03:15', '2016-06-01 02:03:15'),
(248, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-31 07:07:20', 1, 1, 0, '2016-06-01 02:07:20', '2016-06-01 02:07:20'),
(249, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-31 07:10:56', 1, 1, 0, '2016-06-01 02:10:56', '2016-06-01 02:10:56'),
(250, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-05-31 07:12:55', 1, 1, 0, '2016-06-01 02:12:55', '2016-06-01 02:12:55'),
(251, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-05-31 07:13:17', 3, 3, 0, '2016-06-01 02:13:17', '2016-06-01 02:13:17'),
(252, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-31 07:18:09', 3, 3, 0, '2016-06-01 02:18:09', '2016-06-01 02:18:09'),
(253, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-31 07:33:08', 1, 1, 0, '2016-06-01 02:33:08', '2016-06-01 02:33:08'),
(254, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-05-31 07:52:48', 3, 3, 0, '2016-06-01 02:52:48', '2016-06-01 02:52:48'),
(255, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-31 09:15:29', 1, 1, 0, '2016-06-01 04:15:29', '2016-06-01 04:15:29'),
(256, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-05-31 10:19:02', 1, 1, 0, '2016-06-01 05:19:02', '2016-06-01 05:19:02'),
(257, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-05-31 10:20:18', 8, 8, 0, '2016-06-01 05:20:18', '2016-06-01 05:20:18'),
(258, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-01 06:07:49', 1, 1, 0, '2016-06-02 01:07:49', '2016-06-02 01:07:49'),
(259, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-01 06:09:28', 1, 1, 0, '2016-06-02 01:09:28', '2016-06-02 01:09:28'),
(260, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-01 08:47:28', 1, 1, 0, '2016-06-02 03:47:28', '2016-06-02 03:47:28'),
(261, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-01 08:50:53', 3, 3, 0, '2016-06-02 03:50:53', '2016-06-02 03:50:53'),
(262, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-01 11:21:05', 1, 1, 0, '2016-06-02 06:21:05', '2016-06-02 06:21:05'),
(263, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-02 12:17:03', 3, 3, 0, '2016-06-02 07:17:03', '2016-06-02 07:17:03'),
(264, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-02 09:09:50', 1, 1, 0, '2016-06-02 16:09:50', '2016-06-02 16:09:50'),
(265, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-02 12:00:00', 1, 1, 0, '2016-06-02 19:00:00', '2016-06-02 19:00:00'),
(266, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-02 05:18:50', 1, 1, 0, '2016-06-03 00:18:50', '2016-06-03 00:18:50'),
(267, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-02 05:33:53', 1, 1, 0, '2016-06-03 00:33:53', '2016-06-03 00:33:53'),
(268, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-02 05:54:42', 3, 3, 0, '2016-06-03 00:54:42', '2016-06-03 00:54:42'),
(269, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-03 01:35:47', 3, 3, 0, '2016-06-03 08:35:47', '2016-06-03 08:35:47'),
(270, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-03 07:07:27', 3, 3, 0, '2016-06-04 02:07:27', '2016-06-04 02:07:27'),
(271, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-03 11:02:27', 1, 1, 0, '2016-06-04 06:02:27', '2016-06-04 06:02:27'),
(272, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-06-03 11:37:01', 6, 6, 0, '2016-06-04 06:37:01', '2016-06-04 06:37:01'),
(273, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-06-03 11:39:12', 6, 6, 0, '2016-06-04 06:39:12', '2016-06-04 06:39:12'),
(274, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-04 06:00:37', 1, 1, 0, '2016-06-04 13:00:37', '2016-06-04 13:00:37'),
(275, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-04 06:03:26', 1, 1, 0, '2016-06-04 13:03:26', '2016-06-04 13:03:26'),
(276, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-04 06:07:58', 1, 1, 0, '2016-06-04 13:07:58', '2016-06-04 13:07:58'),
(277, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-04 06:57:19', 1, 1, 0, '2016-06-04 13:57:19', '2016-06-04 13:57:19'),
(278, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-05 12:45:30', 1, 1, 0, '2016-06-05 07:45:30', '2016-06-05 07:45:30'),
(279, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-05 10:44:23', 1, 1, 0, '2016-06-05 17:44:23', '2016-06-05 17:44:23'),
(280, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-05 11:00:41', 1, 1, 0, '2016-06-05 18:00:41', '2016-06-05 18:00:41'),
(281, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-05 01:04:53', 1, 1, 0, '2016-06-05 20:04:53', '2016-06-05 20:04:53'),
(282, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-05 01:05:00', 1, 1, 0, '2016-06-05 20:05:00', '2016-06-05 20:05:00'),
(283, 'user-login', 'get-user-login', 'ram logged in', 'user', '2016-06-05 01:16:49', 10, 10, 0, '2016-06-05 20:16:49', '2016-06-05 20:16:49'),
(284, 'user-logout', 'user-logout', 'ram logged out', 'user', '2016-06-05 01:19:11', 10, 10, 0, '2016-06-05 20:19:11', '2016-06-05 20:19:11'),
(285, 'user-login', 'get-user-login', 'ram logged in', 'user', '2016-06-05 01:19:19', 10, 10, 0, '2016-06-05 20:19:19', '2016-06-05 20:19:19'),
(286, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-05 01:35:57', 1, 1, 0, '2016-06-05 20:35:57', '2016-06-05 20:35:57'),
(287, 'user-logout', 'user-logout', 'ram logged out', 'user', '2016-06-05 01:53:29', 10, 10, 0, '2016-06-05 20:53:29', '2016-06-05 20:53:29'),
(288, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-05 03:07:45', 1, 1, 0, '2016-06-05 22:07:45', '2016-06-05 22:07:45'),
(289, 'user-login', 'get-user-login', 'ram logged in', 'user', '2016-06-05 03:08:06', 10, 10, 0, '2016-06-05 22:08:06', '2016-06-05 22:08:06'),
(290, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-05 03:33:55', 3, 3, 0, '2016-06-05 22:33:55', '2016-06-05 22:33:55'),
(291, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-06 04:15:10', 1, 1, 0, '2016-06-06 23:15:10', '2016-06-06 23:15:10'),
(292, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-06 08:44:02', 1, 1, 0, '2016-06-07 03:44:02', '2016-06-07 03:44:02'),
(293, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-06 08:47:19', 1, 1, 0, '2016-06-07 03:47:19', '2016-06-07 03:47:19'),
(294, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-06 08:47:27', 3, 3, 0, '2016-06-07 03:47:27', '2016-06-07 03:47:27'),
(295, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-06 09:34:13', 1, 1, 0, '2016-06-07 02:34:13', '2016-06-07 02:34:13'),
(296, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-07 06:42:55', 1, 1, 0, '2016-06-07 23:42:55', '2016-06-07 23:42:55'),
(297, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-07 06:47:28', 1, 1, 0, '2016-06-07 23:47:28', '2016-06-07 23:47:28'),
(298, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-07 07:13:12', 1, 1, 0, '2016-06-08 00:13:12', '2016-06-08 00:13:12'),
(299, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-07 08:00:17', 1, 1, 0, '2016-06-08 01:00:17', '2016-06-08 01:00:17'),
(300, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-07 08:00:19', 1, 1, 0, '2016-06-08 01:00:19', '2016-06-08 01:00:19'),
(301, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-07 08:01:53', 1, 1, 0, '2016-06-08 01:01:53', '2016-06-08 01:01:53'),
(302, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-07 08:01:55', 1, 1, 0, '2016-06-08 01:01:55', '2016-06-08 01:01:55'),
(303, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 12:52:33', 3, 3, 0, '2016-06-08 05:52:33', '2016-06-08 05:52:33'),
(304, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 12:57:40', 3, 3, 0, '2016-06-08 05:57:40', '2016-06-08 05:57:40'),
(305, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 01:07:35', 1, 1, 0, '2016-06-08 06:07:35', '2016-06-08 06:07:35'),
(306, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 01:09:02', 1, 1, 0, '2016-06-08 06:09:02', '2016-06-08 06:09:02'),
(307, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 01:09:18', 3, 3, 0, '2016-06-08 06:09:18', '2016-06-08 06:09:18'),
(308, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-08 01:10:16', 3, 3, 0, '2016-06-08 06:10:16', '2016-06-08 06:10:16'),
(309, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 01:10:44', 1, 1, 0, '2016-06-08 06:10:44', '2016-06-08 06:10:44'),
(310, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 01:13:12', 1, 1, 0, '2016-06-08 06:13:12', '2016-06-08 06:13:12'),
(311, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 01:13:51', 1, 1, 0, '2016-06-08 06:13:51', '2016-06-08 06:13:51'),
(312, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 01:14:24', 1, 1, 0, '2016-06-08 06:14:24', '2016-06-08 06:14:24'),
(313, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 01:14:44', 3, 3, 0, '2016-06-08 06:14:44', '2016-06-08 06:14:44'),
(314, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-08 01:15:13', 3, 3, 0, '2016-06-08 06:15:13', '2016-06-08 06:15:13'),
(315, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-06-08 01:15:57', 6, 6, 0, '2016-06-08 06:15:57', '2016-06-08 06:15:57'),
(316, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 01:16:05', 1, 1, 0, '2016-06-08 06:16:05', '2016-06-08 06:16:05'),
(317, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 01:19:27', 1, 1, 0, '2016-06-08 06:19:27', '2016-06-08 06:19:27'),
(318, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 01:19:42', 3, 3, 0, '2016-06-08 06:19:42', '2016-06-08 06:19:42'),
(319, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 01:37:05', 1, 1, 0, '2016-06-08 06:37:05', '2016-06-08 06:37:05'),
(320, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 01:40:19', 1, 1, 0, '2016-06-08 06:40:19', '2016-06-08 06:40:19'),
(321, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 01:41:32', 1, 1, 0, '2016-06-08 06:41:32', '2016-06-08 06:41:32'),
(322, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 01:42:12', 1, 1, 0, '2016-06-08 06:42:12', '2016-06-08 06:42:12'),
(323, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-08 01:42:24', 11, 11, 0, '2016-06-08 06:42:24', '2016-06-08 06:42:24'),
(324, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 09:45:43', 1, 1, 0, '2016-06-08 14:45:43', '2016-06-08 14:45:43'),
(325, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 09:45:50', 1, 1, 0, '2016-06-08 14:45:50', '2016-06-08 14:45:50'),
(326, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 09:46:36', 1, 1, 0, '2016-06-08 14:46:36', '2016-06-08 14:46:36'),
(327, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 09:46:43', 3, 3, 0, '2016-06-08 14:46:43', '2016-06-08 14:46:43'),
(328, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-08 09:47:08', 3, 3, 0, '2016-06-08 14:47:08', '2016-06-08 14:47:08'),
(329, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 09:47:16', 1, 1, 0, '2016-06-08 14:47:16', '2016-06-08 14:47:16'),
(330, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-08 09:50:48', 1, 1, 0, '2016-06-08 14:50:48', '2016-06-08 14:50:48'),
(331, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 09:51:12', 3, 3, 0, '2016-06-08 14:51:12', '2016-06-08 14:51:12'),
(332, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-08 09:51:21', 3, 3, 0, '2016-06-08 14:51:21', '2016-06-08 14:51:21'),
(333, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 09:51:34', 3, 3, 0, '2016-06-08 14:51:34', '2016-06-08 14:51:34'),
(334, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-08 09:55:22', 3, 3, 0, '2016-06-08 14:55:22', '2016-06-08 14:55:22'),
(335, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 09:55:30', 1, 1, 0, '2016-06-08 14:55:30', '2016-06-08 14:55:30'),
(336, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 09:59:18', 3, 3, 0, '2016-06-08 14:59:18', '2016-06-08 14:59:18'),
(337, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 10:10:14', 3, 3, 0, '2016-06-08 15:10:14', '2016-06-08 15:10:14'),
(338, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-08 12:27:55', 3, 3, 0, '2016-06-08 17:27:55', '2016-06-08 17:27:55'),
(339, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-08 06:13:17', 1, 1, 0, '2016-06-08 23:13:17', '2016-06-08 23:13:17'),
(340, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-09 10:31:35', 1, 1, 0, '2016-06-09 15:31:35', '2016-06-09 15:31:35'),
(341, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-09 11:49:06', 1, 1, 0, '2016-06-09 16:49:06', '2016-06-09 16:49:06'),
(342, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-09 05:29:13', 1, 1, 0, '2016-06-09 22:29:13', '2016-06-09 22:29:13'),
(343, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-09 05:29:41', 1, 1, 0, '2016-06-09 22:29:41', '2016-06-09 22:29:41'),
(344, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-09 05:36:48', 1, 1, 0, '2016-06-09 22:36:48', '2016-06-09 22:36:48'),
(345, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-09 05:51:07', 3, 3, 0, '2016-06-09 22:51:07', '2016-06-09 22:51:07'),
(346, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-09 06:53:00', 3, 3, 0, '2016-06-09 23:53:00', '2016-06-09 23:53:00'),
(347, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-09 09:05:09', 1, 1, 0, '2016-06-10 02:05:09', '2016-06-10 02:05:09'),
(348, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-09 11:23:39', 1, 1, 0, '2016-06-10 04:23:39', '2016-06-10 04:23:39'),
(349, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-10 12:13:12', 11, 11, 0, '2016-06-10 05:13:12', '2016-06-10 05:13:12'),
(350, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-10 01:20:09', 1, 1, 0, '2016-06-10 06:20:09', '2016-06-10 06:20:09'),
(351, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-10 01:26:19', 1, 1, 0, '2016-06-10 06:26:19', '2016-06-10 06:26:19');
INSERT INTO `user_activity` (`id`, `action_name`, `action_url`, `action_details`, `action_table`, `date`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(352, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-10 01:37:35', 1, 1, 0, '2016-06-10 06:37:35', '2016-06-10 06:37:35'),
(353, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-10 01:39:26', 1, 1, 0, '2016-06-10 06:39:26', '2016-06-10 06:39:26'),
(354, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-10 02:02:09', 1, 1, 0, '2016-06-10 07:02:09', '2016-06-10 07:02:09'),
(355, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-11 12:46:10', 11, 11, 0, '2016-06-11 05:46:10', '2016-06-11 05:46:10'),
(356, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-11 12:57:54', 1, 1, 0, '2016-06-11 05:57:54', '2016-06-11 05:57:54'),
(357, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-12 11:13:39', 1, 1, 0, '2016-06-12 16:13:39', '2016-06-12 16:13:39'),
(358, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-12 01:42:37', 1, 1, 0, '2016-06-12 18:42:37', '2016-06-12 18:42:37'),
(359, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-13 05:27:49', 1, 1, 0, '2016-06-13 22:27:49', '2016-06-13 22:27:49'),
(360, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-13 09:34:04', 3, 3, 0, '2016-06-14 02:34:04', '2016-06-14 02:34:04'),
(361, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-14 08:55:08', 3, 3, 0, '2016-06-15 01:55:08', '2016-06-15 01:55:08'),
(362, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-14 09:33:11', 3, 3, 0, '2016-06-15 02:33:11', '2016-06-15 02:33:11'),
(363, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-14 09:58:21', 1, 1, 0, '2016-06-15 02:58:21', '2016-06-15 02:58:21'),
(364, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-15 01:54:15', 3, 3, 0, '2016-06-15 06:54:15', '2016-06-15 06:54:15'),
(365, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-15 01:51:12', 1, 1, 0, '2016-06-15 18:51:12', '2016-06-15 18:51:12'),
(366, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-15 07:30:58', 11, 11, 0, '2016-06-16 00:30:58', '2016-06-16 00:30:58'),
(367, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-15 09:08:13', 1, 1, 0, '2016-06-16 02:08:13', '2016-06-16 02:08:13'),
(368, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 03:02:16', 1, 1, 0, '2016-06-16 08:02:16', '2016-06-16 08:02:16'),
(369, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 05:19:58', 1, 1, 0, '2016-06-16 10:19:58', '2016-06-16 10:19:58'),
(370, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 08:04:36', 1, 1, 0, '2016-06-16 13:04:36', '2016-06-16 13:04:36'),
(371, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 12:05:43', 1, 1, 0, '2016-06-16 17:05:43', '2016-06-16 17:05:43'),
(372, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 03:03:42', 1, 1, 0, '2016-06-16 20:03:42', '2016-06-16 20:03:42'),
(373, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-16 03:06:17', 1, 1, 0, '2016-06-16 20:06:17', '2016-06-16 20:06:17'),
(374, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 05:01:59', 1, 1, 0, '2016-06-16 22:01:59', '2016-06-16 22:01:59'),
(375, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 05:07:47', 1, 1, 0, '2016-06-16 22:07:47', '2016-06-16 22:07:47'),
(376, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 06:03:42', 1, 1, 0, '2016-06-16 23:03:42', '2016-06-16 23:03:42'),
(377, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-16 06:42:51', 1, 1, 0, '2016-06-16 23:42:51', '2016-06-16 23:42:51'),
(378, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-06-17 12:05:21', 6, 6, 0, '2016-06-17 05:05:21', '2016-06-17 05:05:21'),
(379, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-17 01:07:06', 1, 1, 0, '2016-06-17 06:07:06', '2016-06-17 06:07:06'),
(380, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-17 05:14:00', 1, 1, 0, '2016-06-17 10:14:00', '2016-06-17 10:14:00'),
(381, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-17 07:42:44', 3, 3, 0, '2016-06-17 12:42:44', '2016-06-17 12:42:44'),
(382, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-17 09:11:54', 1, 1, 0, '2016-06-18 02:11:54', '2016-06-18 02:11:54'),
(383, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-19 04:25:39', 1, 1, 0, '2016-06-19 21:25:39', '2016-06-19 21:25:39'),
(384, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-19 04:42:51', 1, 1, 0, '2016-06-19 21:42:51', '2016-06-19 21:42:51'),
(385, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-19 04:42:58', 1, 1, 0, '2016-06-19 21:42:58', '2016-06-19 21:42:58'),
(386, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-20 01:03:45', 1, 1, 0, '2016-06-20 18:03:45', '2016-06-20 18:03:45'),
(387, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-20 08:17:53', 3, 3, 0, '2016-06-21 01:17:53', '2016-06-21 01:17:53'),
(388, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-20 09:27:21', 1, 1, 0, '2016-06-21 02:27:21', '2016-06-21 02:27:21'),
(389, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-21 09:49:44', 1, 1, 0, '2016-06-21 14:49:44', '2016-06-21 14:49:44'),
(390, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-21 09:56:12', 1, 1, 0, '2016-06-21 14:56:12', '2016-06-21 14:56:12'),
(391, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-21 09:56:19', 1, 1, 0, '2016-06-21 14:56:19', '2016-06-21 14:56:19'),
(392, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-21 09:58:00', 1, 1, 0, '2016-06-21 14:58:00', '2016-06-21 14:58:00'),
(393, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-21 05:19:26', 3, 3, 0, '2016-06-21 22:19:26', '2016-06-21 22:19:26'),
(394, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-21 05:45:43', 1, 1, 0, '2016-06-21 22:45:43', '2016-06-21 22:45:43'),
(395, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-21 07:28:53', 3, 3, 0, '2016-06-22 00:28:53', '2016-06-22 00:28:53'),
(396, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-21 08:12:00', 1, 1, 0, '2016-06-22 01:12:00', '2016-06-22 01:12:00'),
(397, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-06-21 08:13:08', 1, 1, 0, '2016-06-22 01:13:08', '2016-06-22 01:13:08'),
(398, 'user-login', 'get-user-login', 'bryan logged in', 'user', '2016-06-21 08:13:31', 12, 12, 0, '2016-06-22 01:13:31', '2016-06-22 01:13:31'),
(399, 'user-login', 'get-user-login', 'bryan logged in', 'user', '2016-06-21 08:15:05', 12, 12, 0, '2016-06-22 01:15:05', '2016-06-22 01:15:05'),
(400, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-06-21 09:06:46', 3, 3, 0, '2016-06-22 02:06:46', '2016-06-22 02:06:46'),
(401, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-23 05:42:47', 1, 1, 0, '2016-06-23 22:42:47', '2016-06-23 22:42:47'),
(402, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-23 08:42:57', 1, 1, 0, '2016-06-24 01:42:57', '2016-06-24 01:42:57'),
(403, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-23 09:10:38', 11, 11, 0, '2016-06-24 02:10:38', '2016-06-24 02:10:38'),
(404, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-23 10:14:06', 1, 1, 0, '2016-06-24 03:14:06', '2016-06-24 03:14:06'),
(405, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-23 10:28:41', 1, 1, 0, '2016-06-24 03:28:41', '2016-06-24 03:28:41'),
(406, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-24 12:59:16', 3, 3, 0, '2016-06-24 05:59:16', '2016-06-24 05:59:16'),
(407, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-24 05:47:31', 3, 3, 0, '2016-06-24 22:47:31', '2016-06-24 22:47:31'),
(408, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-25 03:45:36', 1, 1, 0, '2016-06-25 08:45:36', '2016-06-25 08:45:36'),
(409, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-26 09:36:32', 1, 1, 0, '2016-06-26 14:36:32', '2016-06-26 14:36:32'),
(410, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-27 03:29:06', 1, 1, 0, '2016-06-27 08:29:06', '2016-06-27 08:29:06'),
(411, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-27 07:39:47', 1, 1, 0, '2016-06-28 00:39:47', '2016-06-28 00:39:47'),
(412, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-27 08:02:30', 11, 11, 0, '2016-06-28 01:02:30', '2016-06-28 01:02:30'),
(413, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-27 09:53:23', 1, 1, 0, '2016-06-28 02:53:23', '2016-06-28 02:53:23'),
(414, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-28 01:34:33', 3, 3, 0, '2016-06-28 06:34:33', '2016-06-28 06:34:33'),
(415, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-28 06:34:53', 3, 3, 0, '2016-06-28 11:34:53', '2016-06-28 11:34:53'),
(416, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-06-28 06:56:18', 8, 8, 0, '2016-06-28 23:56:18', '2016-06-28 23:56:18'),
(417, 'user-logout', 'user-logout', 'miguell logged out', 'user', '2016-06-28 07:31:16', 8, 8, 0, '2016-06-29 00:31:16', '2016-06-29 00:31:16'),
(418, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-28 08:03:23', 3, 3, 0, '2016-06-29 01:03:23', '2016-06-29 01:03:23'),
(419, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-28 08:39:50', 1, 1, 0, '2016-06-29 01:39:50', '2016-06-29 01:39:50'),
(420, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-06-29 01:05:30', 11, 11, 0, '2016-06-29 06:05:30', '2016-06-29 06:05:30'),
(421, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-29 06:48:25', 1, 1, 0, '2016-06-29 11:48:25', '2016-06-29 11:48:25'),
(422, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-06-29 09:08:54', 3, 3, 0, '2016-06-30 02:08:54', '2016-06-30 02:08:54'),
(423, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-06-30 12:55:06', 1, 1, 0, '2016-06-30 05:55:06', '2016-06-30 05:55:06'),
(424, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-01 12:41:03', 1, 1, 0, '2016-07-01 05:41:03', '2016-07-01 05:41:03'),
(425, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-04 07:37:08', 3, 3, 0, '2016-07-05 00:37:08', '2016-07-05 00:37:08'),
(426, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-05 01:02:14', 1, 1, 0, '2016-07-05 06:02:14', '2016-07-05 06:02:14'),
(427, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-07-05 01:47:24', 11, 11, 0, '2016-07-05 06:47:24', '2016-07-05 06:47:24'),
(428, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-05 06:45:21', 3, 3, 0, '2016-07-05 23:45:21', '2016-07-05 23:45:21'),
(429, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-07-05 07:59:27', 8, 8, 0, '2016-07-06 00:59:27', '2016-07-06 00:59:27'),
(430, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-05 08:17:39', 1, 1, 0, '2016-07-06 01:17:39', '2016-07-06 01:17:39'),
(431, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-05 10:00:29', 3, 3, 0, '2016-07-06 03:00:29', '2016-07-06 03:00:29'),
(432, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-07-05 10:16:54', 3, 3, 0, '2016-07-06 03:16:54', '2016-07-06 03:16:54'),
(433, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-07 09:30:13', 1, 1, 0, '2016-07-08 02:30:13', '2016-07-08 02:30:13'),
(434, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-07 11:10:21', 3, 3, 0, '2016-07-08 04:10:21', '2016-07-08 04:10:21'),
(435, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-07-11 07:49:03', 8, 8, 0, '2016-07-12 00:49:03', '2016-07-12 00:49:03'),
(436, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-11 07:52:53', 3, 3, 0, '2016-07-12 00:52:53', '2016-07-12 00:52:53'),
(437, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-11 08:00:18', 1, 1, 0, '2016-07-12 01:00:18', '2016-07-12 01:00:18'),
(438, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-07-12 12:22:14', 8, 8, 0, '2016-07-12 05:22:14', '2016-07-12 05:22:14'),
(439, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-13 12:01:32', 3, 3, 0, '2016-07-13 05:01:32', '2016-07-13 05:01:32'),
(440, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-13 05:46:00', 3, 3, 0, '2016-07-13 22:46:00', '2016-07-13 22:46:00'),
(441, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-13 08:22:14', 1, 1, 0, '2016-07-14 01:22:14', '2016-07-14 01:22:14'),
(442, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-13 09:59:55', 3, 3, 0, '2016-07-14 02:59:55', '2016-07-14 02:59:55'),
(443, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-07-13 11:59:50', 11, 11, 0, '2016-07-14 04:59:50', '2016-07-14 04:59:50'),
(444, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-14 01:39:43', 3, 3, 0, '2016-07-14 06:39:43', '2016-07-14 06:39:43'),
(445, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-14 10:57:53', 3, 3, 0, '2016-07-15 03:57:53', '2016-07-15 03:57:53'),
(446, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-15 06:49:03', 1, 1, 0, '2016-07-15 23:49:03', '2016-07-15 23:49:03'),
(447, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-15 11:00:32', 1, 1, 0, '2016-07-16 04:00:32', '2016-07-16 04:00:32'),
(448, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-15 11:01:29', 1, 1, 0, '2016-07-16 04:01:29', '2016-07-16 04:01:29'),
(449, 'user-login', 'get-user-login', 'jased logged in', 'user', '2016-07-15 11:01:35', 5, 5, 0, '2016-07-16 04:01:35', '2016-07-16 04:01:35'),
(450, 'user-logout', 'user-logout', 'jased logged out', 'user', '2016-07-15 11:02:03', 5, 5, 0, '2016-07-16 04:02:03', '2016-07-16 04:02:03'),
(451, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-15 11:02:09', 1, 1, 0, '2016-07-16 04:02:09', '2016-07-16 04:02:09'),
(452, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-15 11:05:15', 1, 1, 0, '2016-07-16 04:05:15', '2016-07-16 04:05:15'),
(453, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-15 11:09:09', 1, 1, 0, '2016-07-16 04:09:09', '2016-07-16 04:09:09'),
(454, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-16 09:22:22', 3, 3, 0, '2016-07-17 02:22:22', '2016-07-17 02:22:22'),
(455, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-18 11:23:54', 3, 3, 0, '2016-07-19 04:23:54', '2016-07-19 04:23:54'),
(456, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 03:44:26', 1, 1, 0, '2016-07-19 20:44:26', '2016-07-19 20:44:26'),
(457, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 03:54:16', 1, 1, 0, '2016-07-19 20:54:16', '2016-07-19 20:54:16'),
(458, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-07-19 04:08:18', 2, 2, 0, '2016-07-19 21:08:18', '2016-07-19 21:08:18'),
(459, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 05:16:10', 1, 1, 0, '2016-07-19 22:16:10', '2016-07-19 22:16:10'),
(460, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-19 05:18:45', 1, 1, 0, '2016-07-19 22:18:45', '2016-07-19 22:18:45'),
(461, 'user-login', 'get-user-login', 'jased logged in', 'user', '2016-07-19 05:19:00', 5, 5, 0, '2016-07-19 22:19:00', '2016-07-19 22:19:00'),
(462, 'user-logout', 'user-logout', 'jased logged out', 'user', '2016-07-19 05:22:27', 5, 5, 0, '2016-07-19 22:22:27', '2016-07-19 22:22:27'),
(463, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-19 05:22:28', 3, 3, 0, '2016-07-19 22:22:28', '2016-07-19 22:22:28'),
(464, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 05:22:33', 1, 1, 0, '2016-07-19 22:22:33', '2016-07-19 22:22:33'),
(465, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 05:46:11', 1, 1, 0, '2016-07-19 22:46:11', '2016-07-19 22:46:11'),
(466, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-19 05:58:38', 1, 1, 0, '2016-07-19 22:58:38', '2016-07-19 22:58:38'),
(467, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 05:58:46', 1, 1, 0, '2016-07-19 22:58:46', '2016-07-19 22:58:46'),
(468, 'user-logout', 'user-logout', 'user logged out', 'user', '2016-07-19 05:59:23', 2, 2, 0, '2016-07-19 22:59:23', '2016-07-19 22:59:23'),
(469, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-07-19 05:59:30', 2, 2, 0, '2016-07-19 22:59:30', '2016-07-19 22:59:30'),
(470, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 05:59:32', 1, 1, 0, '2016-07-19 22:59:32', '2016-07-19 22:59:32'),
(471, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-07-19 06:01:21', 2, 2, 0, '2016-07-19 23:01:21', '2016-07-19 23:01:21'),
(472, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-19 06:04:20', 1, 1, 0, '2016-07-19 23:04:20', '2016-07-19 23:04:20'),
(473, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 06:04:28', 1, 1, 0, '2016-07-19 23:04:28', '2016-07-19 23:04:28'),
(474, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-07-19 06:04:53', 2, 2, 0, '2016-07-19 23:04:53', '2016-07-19 23:04:53'),
(475, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-19 06:07:23', 1, 1, 0, '2016-07-19 23:07:23', '2016-07-19 23:07:23'),
(476, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 06:07:30', 1, 1, 0, '2016-07-19 23:07:30', '2016-07-19 23:07:30'),
(477, 'user-logout', 'user-logout', 'user logged out', 'user', '2016-07-19 06:08:46', 2, 2, 0, '2016-07-19 23:08:46', '2016-07-19 23:08:46'),
(478, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-07-19 06:08:55', 2, 2, 0, '2016-07-19 23:08:55', '2016-07-19 23:08:55'),
(479, 'user-logout', 'user-logout', 'user logged out', 'user', '2016-07-19 06:09:11', 2, 2, 0, '2016-07-19 23:09:11', '2016-07-19 23:09:11'),
(480, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 06:09:16', 1, 1, 0, '2016-07-19 23:09:16', '2016-07-19 23:09:16'),
(481, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 06:13:05', 1, 1, 0, '2016-07-19 23:13:05', '2016-07-19 23:13:05'),
(482, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-19 06:14:04', 1, 1, 0, '2016-07-19 23:14:04', '2016-07-19 23:14:04'),
(483, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-19 08:52:03', 3, 3, 0, '2016-07-20 01:52:03', '2016-07-20 01:52:03'),
(484, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-20 12:26:16', 3, 3, 0, '2016-07-20 05:26:16', '2016-07-20 05:26:16'),
(485, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-20 07:05:03', 1, 1, 0, '2016-07-21 00:05:03', '2016-07-21 00:05:03'),
(486, 'user-login', 'get-user-login', 'jased logged in', 'user', '2016-07-20 09:51:49', 5, 5, 0, '2016-07-21 02:51:49', '2016-07-21 02:51:49'),
(487, 'user-logout', 'user-logout', 'jased logged out', 'user', '2016-07-20 09:55:15', 5, 5, 0, '2016-07-21 02:55:15', '2016-07-21 02:55:15'),
(488, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-22 06:25:00', 3, 3, 0, '2016-07-22 23:25:00', '2016-07-22 23:25:00'),
(489, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-22 08:06:53', 1, 1, 0, '2016-07-23 01:06:53', '2016-07-23 01:06:53'),
(490, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-22 10:56:07', 3, 3, 0, '2016-07-23 03:56:07', '2016-07-23 03:56:07'),
(491, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-22 11:04:05', 1, 1, 0, '2016-07-23 04:04:05', '2016-07-23 04:04:05'),
(492, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-22 11:05:36', 1, 1, 0, '2016-07-23 04:05:36', '2016-07-23 04:05:36'),
(493, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-22 11:17:49', 1, 1, 0, '2016-07-23 04:17:49', '2016-07-23 04:17:49'),
(494, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-22 11:19:31', 1, 1, 0, '2016-07-23 04:19:31', '2016-07-23 04:19:31'),
(495, 'user-login', 'get-user-login', 'user logged in', 'user', '2016-07-22 11:19:39', 2, 2, 0, '2016-07-23 04:19:39', '2016-07-23 04:19:39'),
(496, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-07-22 11:51:07', 11, 11, 0, '2016-07-23 04:51:07', '2016-07-23 04:51:07'),
(497, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-25 05:53:42', 3, 3, 0, '2016-07-25 22:53:42', '2016-07-25 22:53:42'),
(498, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-25 05:55:24', 3, 3, 0, '2016-07-25 22:55:24', '2016-07-25 22:55:24'),
(499, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-07-26 01:52:37', 11, 11, 0, '2016-07-26 06:52:37', '2016-07-26 06:52:37'),
(500, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-26 05:26:38', 1, 1, 0, '2016-07-26 22:26:38', '2016-07-26 22:26:38'),
(501, 'user-login', 'get-user-login', 'evie logged in', 'user', '2016-07-26 05:32:03', 13, 13, 0, '2016-07-26 22:32:03', '2016-07-26 22:32:03'),
(502, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-07-26 07:04:23', 11, 11, 0, '2016-07-27 00:04:23', '2016-07-27 00:04:23'),
(503, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-26 08:53:01', 3, 3, 0, '2016-07-27 01:53:01', '2016-07-27 01:53:01'),
(504, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-27 01:33:21', 3, 3, 0, '2016-07-27 06:33:21', '2016-07-27 06:33:21'),
(505, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-07-27 08:15:01', 6, 6, 0, '2016-07-28 01:15:01', '2016-07-28 01:15:01'),
(506, 'user-login', 'get-user-login', 'evie logged in', 'user', '2016-07-27 11:01:56', 13, 13, 0, '2016-07-28 04:01:56', '2016-07-28 04:01:56'),
(507, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-28 06:33:51', 3, 3, 0, '2016-07-28 23:33:51', '2016-07-28 23:33:51'),
(508, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-28 09:09:34', 3, 3, 0, '2016-07-29 02:09:34', '2016-07-29 02:09:34'),
(509, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-07-29 01:31:05', 6, 6, 0, '2016-07-29 06:31:05', '2016-07-29 06:31:05'),
(510, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-29 06:26:38', 3, 3, 0, '2016-07-29 11:26:38', '2016-07-29 11:26:38'),
(511, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-29 06:13:21', 1, 1, 0, '2016-07-29 23:13:21', '2016-07-29 23:13:21'),
(512, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-29 06:16:41', 1, 1, 0, '2016-07-29 23:16:41', '2016-07-29 23:16:41'),
(513, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-29 06:17:09', 3, 3, 0, '2016-07-29 23:17:09', '2016-07-29 23:17:09'),
(514, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-29 06:31:32', 3, 3, 0, '2016-07-29 23:31:32', '2016-07-29 23:31:32'),
(515, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-07-29 06:40:37', 3, 3, 0, '2016-07-29 23:40:37', '2016-07-29 23:40:37'),
(516, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-29 06:40:42', 1, 1, 0, '2016-07-29 23:40:42', '2016-07-29 23:40:42'),
(517, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-07-29 08:20:59', 1, 1, 0, '2016-07-30 01:20:59', '2016-07-30 01:20:59'),
(518, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-07-29 08:21:06', 3, 3, 0, '2016-07-30 01:21:06', '2016-07-30 01:21:06'),
(519, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-07-29 08:45:09', 3, 3, 0, '2016-07-30 01:45:09', '2016-07-30 01:45:09'),
(520, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-07-29 08:45:19', 1, 1, 0, '2016-07-30 01:45:19', '2016-07-30 01:45:19'),
(521, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-07-30 02:28:01', 8, 8, 0, '2016-07-30 07:28:01', '2016-07-30 07:28:01'),
(522, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-08-01 07:06:32', 8, 8, 0, '2016-08-02 00:06:32', '2016-08-02 00:06:32'),
(523, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-01 07:35:40', 1, 1, 0, '2016-08-02 00:35:40', '2016-08-02 00:35:40'),
(524, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-02 01:00:18', 1, 1, 0, '2016-08-02 06:00:18', '2016-08-02 06:00:18'),
(525, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-08-02 01:02:25', 1, 1, 0, '2016-08-02 06:02:25', '2016-08-02 06:02:25'),
(526, 'user-login', 'get-user-login', 'corbin logged in', 'user', '2016-08-02 01:02:49', 14, 14, 0, '2016-08-02 06:02:49', '2016-08-02 06:02:49'),
(527, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-02 01:05:43', 3, 3, 0, '2016-08-02 06:05:43', '2016-08-02 06:05:43'),
(528, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-02 01:32:27', 1, 1, 0, '2016-08-02 06:32:27', '2016-08-02 06:32:27'),
(529, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-02 06:46:02', 3, 3, 0, '2016-08-02 11:46:02', '2016-08-02 11:46:02'),
(530, 'user-login', 'get-user-login', 'corbin logged in', 'user', '2016-08-02 06:29:25', 14, 14, 0, '2016-08-02 23:29:25', '2016-08-02 23:29:25'),
(531, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-08-02 06:34:10', 6, 6, 0, '2016-08-02 23:34:10', '2016-08-02 23:34:10'),
(532, 'user-login', 'get-user-login', 'evie logged in', 'user', '2016-08-02 06:35:02', 13, 13, 0, '2016-08-02 23:35:02', '2016-08-02 23:35:02'),
(533, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-02 06:38:32', 1, 1, 0, '2016-08-02 23:38:32', '2016-08-02 23:38:32'),
(534, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-02 06:45:58', 1, 1, 0, '2016-08-02 23:45:58', '2016-08-02 23:45:58'),
(535, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-02 08:37:55', 3, 3, 0, '2016-08-03 01:37:55', '2016-08-03 01:37:55'),
(536, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-02 10:18:21', 1, 1, 0, '2016-08-03 03:18:21', '2016-08-03 03:18:21'),
(537, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-03 06:26:54', 3, 3, 0, '2016-08-03 23:26:54', '2016-08-03 23:26:54'),
(538, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-03 08:23:09', 1, 1, 0, '2016-08-04 01:23:09', '2016-08-04 01:23:09'),
(539, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-05 06:53:10', 3, 3, 0, '2016-08-05 23:53:10', '2016-08-05 23:53:10'),
(540, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-08-05 07:21:11', 11, 11, 0, '2016-08-06 00:21:11', '2016-08-06 00:21:11'),
(541, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-06 10:30:49', 1, 1, 0, '2016-08-07 03:30:49', '2016-08-07 03:30:49'),
(542, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-08-10 06:15:20', 8, 8, 0, '2016-08-10 23:15:20', '2016-08-10 23:15:20'),
(543, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-10 06:54:18', 3, 3, 0, '2016-08-10 23:54:18', '2016-08-10 23:54:18'),
(544, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-10 07:43:50', 1, 1, 0, '2016-08-11 00:43:50', '2016-08-11 00:43:50'),
(545, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-08-10 08:30:39', 1, 1, 0, '2016-08-11 01:30:39', '2016-08-11 01:30:39'),
(546, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-10 08:31:40', 1, 1, 0, '2016-08-11 01:31:40', '2016-08-11 01:31:40'),
(547, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-08-11 12:12:32', 6, 6, 0, '2016-08-11 05:12:32', '2016-08-11 05:12:32'),
(548, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-11 08:18:07', 3, 3, 0, '2016-08-12 01:18:07', '2016-08-12 01:18:07'),
(549, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-12 01:03:42', 3, 3, 0, '2016-08-12 06:03:42', '2016-08-12 06:03:42'),
(550, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-12 06:50:38', 3, 3, 0, '2016-08-12 11:50:38', '2016-08-12 11:50:38'),
(551, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-12 08:11:39', 1, 1, 0, '2016-08-13 01:11:39', '2016-08-13 01:11:39'),
(552, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-12 09:25:16', 1, 1, 0, '2016-08-13 02:25:16', '2016-08-13 02:25:16'),
(553, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-12 11:08:12', 3, 3, 0, '2016-08-13 04:08:12', '2016-08-13 04:08:12'),
(554, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-15 05:52:43', 1, 1, 0, '2016-08-15 22:52:43', '2016-08-15 22:52:43'),
(555, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-16 07:24:29', 3, 3, 0, '2016-08-17 00:24:29', '2016-08-17 00:24:29'),
(556, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-16 07:30:13', 1, 1, 0, '2016-08-17 00:30:13', '2016-08-17 00:30:13'),
(557, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-16 10:15:04', 3, 3, 0, '2016-08-17 03:15:04', '2016-08-17 03:15:04'),
(558, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-16 10:47:35', 1, 1, 0, '2016-08-17 03:47:35', '2016-08-17 03:47:35'),
(559, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-17 01:34:55', 3, 3, 0, '2016-08-17 06:34:55', '2016-08-17 06:34:55'),
(560, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-17 05:41:48', 1, 1, 0, '2016-08-17 10:41:48', '2016-08-17 10:41:48'),
(561, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-17 08:20:36', 1, 1, 0, '2016-08-18 01:20:36', '2016-08-18 01:20:36'),
(562, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-08-17 08:25:10', 8, 8, 0, '2016-08-18 01:25:10', '2016-08-18 01:25:10'),
(563, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-17 09:11:39', 1, 1, 0, '2016-08-18 02:11:39', '2016-08-18 02:11:39'),
(564, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-17 10:06:41', 3, 3, 0, '2016-08-18 03:06:41', '2016-08-18 03:06:41'),
(565, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-08-18 07:11:07', 8, 8, 0, '2016-08-19 00:11:07', '2016-08-19 00:11:07'),
(566, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-18 09:28:06', 1, 1, 0, '2016-08-19 02:28:06', '2016-08-19 02:28:06'),
(567, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-19 01:37:33', 3, 3, 0, '2016-08-19 06:37:33', '2016-08-19 06:37:33'),
(568, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-19 07:09:07', 3, 3, 0, '2016-08-20 00:09:07', '2016-08-20 00:09:07'),
(569, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-20 06:31:18', 3, 3, 0, '2016-08-20 11:31:18', '2016-08-20 11:31:18'),
(570, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-21 11:32:57', 3, 3, 0, '2016-08-22 04:32:57', '2016-08-22 04:32:57'),
(571, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-22 08:07:43', 1, 1, 0, '2016-08-23 01:07:43', '2016-08-23 01:07:43'),
(572, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-22 08:11:39', 1, 1, 0, '2016-08-23 01:11:39', '2016-08-23 01:11:39'),
(573, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-22 11:03:44', 1, 1, 0, '2016-08-23 04:03:44', '2016-08-23 04:03:44'),
(574, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-24 09:53:55', 3, 3, 0, '2016-08-25 02:53:55', '2016-08-25 02:53:55'),
(575, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-24 10:09:29', 1, 1, 0, '2016-08-25 03:09:29', '2016-08-25 03:09:29'),
(576, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-25 06:59:59', 1, 1, 0, '2016-08-26 00:00:00', '2016-08-26 00:00:00'),
(577, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-30 06:20:52', 1, 1, 0, '2016-08-30 23:20:52', '2016-08-30 23:20:52'),
(578, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-30 07:48:23', 1, 1, 0, '2016-08-31 00:48:23', '2016-08-31 00:48:23'),
(579, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-08-30 09:26:17', 3, 3, 0, '2016-08-31 02:26:17', '2016-08-31 02:26:17'),
(580, 'user-logout', 'user-logout', 'donavon logged out', 'user', '2016-08-30 09:52:33', 3, 3, 0, '2016-08-31 02:52:33', '2016-08-31 02:52:33'),
(581, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-30 10:32:24', 1, 1, 0, '2016-08-31 03:32:24', '2016-08-31 03:32:24'),
(582, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-08-30 10:40:36', 11, 11, 0, '2016-08-31 03:40:36', '2016-08-31 03:40:36'),
(583, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-08-31 12:48:24', 11, 11, 0, '2016-08-31 05:48:24', '2016-08-31 05:48:24'),
(584, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-31 08:39:35', 1, 1, 0, '2016-09-01 01:39:35', '2016-09-01 01:39:35'),
(585, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-31 08:49:45', 1, 1, 0, '2016-09-01 01:49:45', '2016-09-01 01:49:45'),
(586, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-31 09:08:49', 1, 1, 0, '2016-09-01 02:08:49', '2016-09-01 02:08:49'),
(587, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-31 10:36:48', 1, 1, 0, '2016-09-01 03:36:48', '2016-09-01 03:36:48'),
(588, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-08-31 11:22:45', 1, 1, 0, '2016-09-01 04:22:45', '2016-09-01 04:22:45'),
(589, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-01 12:21:00', 3, 3, 0, '2016-09-01 05:21:00', '2016-09-01 05:21:00'),
(590, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-01 05:19:11', 1, 1, 0, '2016-09-01 22:19:11', '2016-09-01 22:19:11'),
(591, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-02 12:17:46', 3, 3, 0, '2016-09-02 05:17:46', '2016-09-02 05:17:46'),
(592, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-02 01:48:57', 1, 1, 0, '2016-09-02 06:48:57', '2016-09-02 06:48:57'),
(593, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-02 05:41:05', 1, 1, 0, '2016-09-02 22:41:05', '2016-09-02 22:41:05'),
(594, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-02 07:54:26', 3, 3, 0, '2016-09-03 00:54:26', '2016-09-03 00:54:26'),
(595, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-05 10:03:32', 1, 1, 0, '2016-09-06 03:03:32', '2016-09-06 03:03:32'),
(596, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-06 07:05:26', 3, 3, 0, '2016-09-07 00:05:26', '2016-09-07 00:05:26'),
(597, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-09-06 08:10:18', 6, 6, 0, '2016-09-07 01:10:18', '2016-09-07 01:10:18'),
(598, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-06 10:50:43', 1, 1, 0, '2016-09-07 03:50:43', '2016-09-07 03:50:43'),
(599, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-07 08:16:13', 1, 1, 0, '2016-09-08 01:16:13', '2016-09-08 01:16:13'),
(600, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-09-07 11:16:17', 6, 6, 0, '2016-09-08 04:16:17', '2016-09-08 04:16:17'),
(601, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-08 12:11:08', 1, 1, 0, '2016-09-08 05:11:08', '2016-09-08 05:11:08'),
(602, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-08 12:57:27', 3, 3, 0, '2016-09-08 05:57:27', '2016-09-08 05:57:27'),
(603, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-08 05:24:56', 3, 3, 0, '2016-09-08 22:24:56', '2016-09-08 22:24:56'),
(604, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-08 09:34:22', 1, 1, 0, '2016-09-09 02:34:22', '2016-09-09 02:34:22'),
(605, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-08 11:32:22', 3, 3, 0, '2016-09-09 04:32:22', '2016-09-09 04:32:22'),
(606, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-13 08:01:32', 3, 3, 0, '2016-09-14 01:01:32', '2016-09-14 01:01:32'),
(607, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-13 10:33:04', 1, 1, 0, '2016-09-14 03:33:04', '2016-09-14 03:33:04'),
(608, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-14 06:05:15', 1, 1, 0, '2016-09-14 23:05:15', '2016-09-14 23:05:15'),
(609, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-15 08:59:22', 3, 3, 0, '2016-09-15 13:59:22', '2016-09-15 13:59:22'),
(610, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-09-15 10:30:49', 6, 6, 0, '2016-09-16 03:30:49', '2016-09-16 03:30:49'),
(611, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-19 08:48:17', 3, 3, 0, '2016-09-20 01:48:17', '2016-09-20 01:48:17'),
(612, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-20 08:11:07', 3, 3, 0, '2016-09-21 01:11:07', '2016-09-21 01:11:07'),
(613, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-21 12:03:28', 3, 3, 0, '2016-09-21 05:03:28', '2016-09-21 05:03:28'),
(614, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-22 07:23:50', 3, 3, 0, '2016-09-23 00:23:50', '2016-09-23 00:23:50'),
(615, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-23 07:44:32', 3, 3, 0, '2016-09-24 00:44:32', '2016-09-24 00:44:32'),
(616, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-24 12:42:04', 3, 3, 0, '2016-09-24 05:42:04', '2016-09-24 05:42:04'),
(617, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 02:44:35', 1, 1, 0, '2016-09-26 19:44:35', '2016-09-26 19:44:35'),
(618, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 02:55:07', 1, 1, 0, '2016-09-26 19:55:07', '2016-09-26 19:55:07'),
(619, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 02:55:11', 1, 1, 0, '2016-09-26 19:55:11', '2016-09-26 19:55:11'),
(620, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:00:46', 1, 1, 0, '2016-09-26 20:00:46', '2016-09-26 20:00:46'),
(621, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 03:00:56', 1, 1, 0, '2016-09-26 20:00:56', '2016-09-26 20:00:56'),
(622, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:04:45', 1, 1, 0, '2016-09-26 20:04:45', '2016-09-26 20:04:45'),
(623, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 03:04:49', 1, 1, 0, '2016-09-26 20:04:49', '2016-09-26 20:04:49'),
(624, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:08:56', 1, 1, 0, '2016-09-26 20:08:56', '2016-09-26 20:08:56'),
(625, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-26 03:09:28', 15, 15, 0, '2016-09-26 20:09:28', '2016-09-26 20:09:28'),
(626, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-26 03:09:39', 15, 15, 0, '2016-09-26 20:09:39', '2016-09-26 20:09:39'),
(627, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 03:09:48', 1, 1, 0, '2016-09-26 20:09:48', '2016-09-26 20:09:48'),
(628, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:13:23', 1, 1, 0, '2016-09-26 20:13:23', '2016-09-26 20:13:23'),
(629, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 03:13:30', 1, 1, 0, '2016-09-26 20:13:30', '2016-09-26 20:13:30'),
(630, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:13:39', 1, 1, 0, '2016-09-26 20:13:39', '2016-09-26 20:13:39'),
(631, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-26 03:13:57', 15, 15, 0, '2016-09-26 20:13:57', '2016-09-26 20:13:57'),
(632, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-26 03:14:25', 15, 15, 0, '2016-09-26 20:14:25', '2016-09-26 20:14:25'),
(633, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 03:14:51', 1, 1, 0, '2016-09-26 20:14:51', '2016-09-26 20:14:51'),
(634, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:17:23', 1, 1, 0, '2016-09-26 20:17:23', '2016-09-26 20:17:23'),
(635, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-26 03:17:34', 15, 15, 0, '2016-09-26 20:17:34', '2016-09-26 20:17:34'),
(636, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-26 03:17:57', 15, 15, 0, '2016-09-26 20:17:57', '2016-09-26 20:17:57'),
(637, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 03:18:00', 1, 1, 0, '2016-09-26 20:18:00', '2016-09-26 20:18:00'),
(638, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 03:19:38', 1, 1, 0, '2016-09-26 20:19:38', '2016-09-26 20:19:38'),
(639, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-26 03:19:46', 15, 15, 0, '2016-09-26 20:19:46', '2016-09-26 20:19:46'),
(640, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-26 03:38:00', 15, 15, 0, '2016-09-26 20:38:00', '2016-09-26 20:38:00'),
(641, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-26 03:38:30', 16, 16, 0, '2016-09-26 20:38:30', '2016-09-26 20:38:30'),
(642, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-26 03:45:55', 16, 16, 0, '2016-09-26 20:45:55', '2016-09-26 20:45:55'),
(643, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-09-26 03:49:17', 17, 17, 0, '2016-09-26 20:49:17', '2016-09-26 20:49:17'),
(644, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-09-26 03:50:48', 17, 17, 0, '2016-09-26 20:50:48', '2016-09-26 20:50:48'),
(645, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-09-26 03:51:13', 18, 18, 0, '2016-09-26 20:51:13', '2016-09-26 20:51:13'),
(646, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-09-26 03:56:14', 18, 18, 0, '2016-09-26 20:56:14', '2016-09-26 20:56:14'),
(647, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 04:02:05', 1, 1, 0, '2016-09-26 21:02:05', '2016-09-26 21:02:05'),
(648, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 05:12:56', 1, 1, 0, '2016-09-26 22:12:56', '2016-09-26 22:12:56'),
(649, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-26 05:17:17', 1, 1, 0, '2016-09-26 22:17:17', '2016-09-26 22:17:17'),
(650, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-26 05:17:40', 15, 15, 0, '2016-09-26 22:17:40', '2016-09-26 22:17:40'),
(651, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-26 05:49:34', 15, 15, 0, '2016-09-26 22:49:34', '2016-09-26 22:49:34'),
(652, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-26 05:49:44', 16, 16, 0, '2016-09-26 22:49:44', '2016-09-26 22:49:44'),
(653, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-26 05:50:23', 16, 16, 0, '2016-09-26 22:50:23', '2016-09-26 22:50:23'),
(654, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-09-26 05:50:28', 17, 17, 0, '2016-09-26 22:50:28', '2016-09-26 22:50:28'),
(655, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-09-26 05:50:44', 17, 17, 0, '2016-09-26 22:50:44', '2016-09-26 22:50:44'),
(656, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-09-26 05:51:44', 18, 18, 0, '2016-09-26 22:51:44', '2016-09-26 22:51:44'),
(657, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-09-26 05:52:03', 18, 18, 0, '2016-09-26 22:52:03', '2016-09-26 22:52:03'),
(658, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-26 05:52:26', 15, 15, 0, '2016-09-26 22:52:26', '2016-09-26 22:52:26'),
(659, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-26 08:26:35', 3, 3, 0, '2016-09-27 01:26:35', '2016-09-27 01:26:35'),
(660, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-26 08:36:58', 1, 1, 0, '2016-09-27 01:36:58', '2016-09-27 01:36:58'),
(661, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-09-27 04:58:56', 8, 8, 0, '2016-09-27 21:58:56', '2016-09-27 21:58:56'),
(662, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-27 05:10:42', 15, 15, 0, '2016-09-27 22:10:42', '2016-09-27 22:10:42'),
(663, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 05:11:29', 1, 1, 0, '2016-09-27 22:11:29', '2016-09-27 22:11:29'),
(664, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 05:13:32', 1, 1, 0, '2016-09-27 22:13:32', '2016-09-27 22:13:32'),
(665, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-27 05:13:44', 15, 15, 0, '2016-09-27 22:13:44', '2016-09-27 22:13:44'),
(666, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-27 05:14:32', 15, 15, 0, '2016-09-27 22:14:32', '2016-09-27 22:14:32'),
(667, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 05:14:35', 1, 1, 0, '2016-09-27 22:14:35', '2016-09-27 22:14:35'),
(668, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 05:15:04', 1, 1, 0, '2016-09-27 22:15:04', '2016-09-27 22:15:04'),
(669, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-27 05:15:14', 15, 15, 0, '2016-09-27 22:15:14', '2016-09-27 22:15:14'),
(670, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-27 05:16:23', 15, 15, 0, '2016-09-27 22:16:23', '2016-09-27 22:16:23'),
(671, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 05:16:29', 1, 1, 0, '2016-09-27 22:16:29', '2016-09-27 22:16:29'),
(672, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 05:17:32', 1, 1, 0, '2016-09-27 22:17:32', '2016-09-27 22:17:32'),
(673, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-27 05:17:41', 15, 15, 0, '2016-09-27 22:17:41', '2016-09-27 22:17:41'),
(674, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-27 05:18:09', 15, 15, 0, '2016-09-27 22:18:09', '2016-09-27 22:18:09'),
(675, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-27 05:18:19', 16, 16, 0, '2016-09-27 22:18:19', '2016-09-27 22:18:19'),
(676, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-27 05:18:37', 16, 16, 0, '2016-09-27 22:18:37', '2016-09-27 22:18:37'),
(677, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-09-27 05:18:52', 17, 17, 0, '2016-09-27 22:18:52', '2016-09-27 22:18:52'),
(678, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-09-27 05:19:13', 17, 17, 0, '2016-09-27 22:19:13', '2016-09-27 22:19:13'),
(679, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-09-27 05:19:23', 18, 18, 0, '2016-09-27 22:19:23', '2016-09-27 22:19:23'),
(680, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-09-27 05:54:59', 18, 18, 0, '2016-09-27 22:54:59', '2016-09-27 22:54:59'),
(681, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 07:17:42', 1, 1, 0, '2016-09-28 00:17:42', '2016-09-28 00:17:42'),
(682, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 07:29:37', 1, 1, 0, '2016-09-28 00:29:37', '2016-09-28 00:29:37'),
(683, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-27 07:29:49', 15, 15, 0, '2016-09-28 00:29:49', '2016-09-28 00:29:49'),
(684, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-27 07:30:46', 15, 15, 0, '2016-09-28 00:30:46', '2016-09-28 00:30:46'),
(685, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 07:30:51', 1, 1, 0, '2016-09-28 00:30:51', '2016-09-28 00:30:51'),
(686, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 07:32:06', 1, 1, 0, '2016-09-28 00:32:06', '2016-09-28 00:32:06'),
(687, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-27 07:32:14', 16, 16, 0, '2016-09-28 00:32:14', '2016-09-28 00:32:14'),
(688, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-27 07:32:34', 16, 16, 0, '2016-09-28 00:32:34', '2016-09-28 00:32:34'),
(689, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 07:32:42', 1, 1, 0, '2016-09-28 00:32:42', '2016-09-28 00:32:42'),
(690, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 07:33:34', 1, 1, 0, '2016-09-28 00:33:34', '2016-09-28 00:33:34'),
(691, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 07:35:05', 1, 1, 0, '2016-09-28 00:35:05', '2016-09-28 00:35:05'),
(692, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-09-27 08:02:04', 1, 1, 0, '2016-09-28 01:02:04', '2016-09-28 01:02:04'),
(693, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-09-27 08:02:11', 17, 17, 0, '2016-09-28 01:02:11', '2016-09-28 01:02:11'),
(694, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-09-27 08:02:25', 17, 17, 0, '2016-09-28 01:02:25', '2016-09-28 01:02:25'),
(695, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-09-27 08:02:30', 18, 18, 0, '2016-09-28 01:02:30', '2016-09-28 01:02:30'),
(696, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-09-27 08:02:53', 18, 18, 0, '2016-09-28 01:02:53', '2016-09-28 01:02:53'),
(697, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-27 08:02:58', 1, 1, 0, '2016-09-28 01:02:58', '2016-09-28 01:02:58'),
(698, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-09-27 09:28:53', 6, 6, 0, '2016-09-28 02:28:53', '2016-09-28 02:28:53'),
(699, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-27 09:56:14', 3, 3, 0, '2016-09-28 02:56:14', '2016-09-28 02:56:14');
INSERT INTO `user_activity` (`id`, `action_name`, `action_url`, `action_details`, `action_table`, `date`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(700, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-29 12:10:27', 1, 1, 0, '2016-09-29 05:10:27', '2016-09-29 05:10:27'),
(701, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-09-29 07:05:37', 3, 3, 0, '2016-09-30 00:05:37', '2016-09-30 00:05:37'),
(702, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-29 07:10:14', 1, 1, 0, '2016-09-30 00:10:14', '2016-09-30 00:10:14'),
(703, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-09-29 08:06:18', 11, 11, 0, '2016-09-30 01:06:18', '2016-09-30 01:06:18'),
(704, 'user-login', 'get-user-login', 'cella logged in', 'user', '2016-09-29 08:07:13', 11, 11, 0, '2016-09-30 01:07:13', '2016-09-30 01:07:13'),
(705, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-29 10:01:41', 15, 15, 0, '2016-09-30 03:01:41', '2016-09-30 03:01:41'),
(706, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-29 10:04:44', 15, 15, 0, '2016-09-30 03:04:44', '2016-09-30 03:04:44'),
(707, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-29 10:04:53', 16, 16, 0, '2016-09-30 03:04:53', '2016-09-30 03:04:53'),
(708, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-29 10:06:44', 16, 16, 0, '2016-09-30 03:06:44', '2016-09-30 03:06:44'),
(709, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-09-29 10:06:49', 17, 17, 0, '2016-09-30 03:06:49', '2016-09-30 03:06:49'),
(710, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-09-29 10:07:44', 17, 17, 0, '2016-09-30 03:07:44', '2016-09-30 03:07:44'),
(711, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-09-29 10:07:56', 18, 18, 0, '2016-09-30 03:07:56', '2016-09-30 03:07:56'),
(712, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-09-29 10:10:30', 18, 18, 0, '2016-09-30 03:10:30', '2016-09-30 03:10:30'),
(713, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-29 10:10:35', 15, 15, 0, '2016-09-30 03:10:35', '2016-09-30 03:10:35'),
(714, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-29 10:16:37', 15, 15, 0, '2016-09-30 03:16:37', '2016-09-30 03:16:37'),
(715, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-29 10:16:43', 16, 16, 0, '2016-09-30 03:16:43', '2016-09-30 03:16:43'),
(716, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-29 10:16:53', 16, 16, 0, '2016-09-30 03:16:53', '2016-09-30 03:16:53'),
(717, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-29 10:17:52', 16, 16, 0, '2016-09-30 03:17:52', '2016-09-30 03:17:52'),
(718, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-29 10:35:12', 16, 16, 0, '2016-09-30 03:35:12', '2016-09-30 03:35:12'),
(719, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-09-29 10:35:17', 15, 15, 0, '2016-09-30 03:35:17', '2016-09-30 03:35:17'),
(720, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-09-29 10:38:35', 15, 15, 0, '2016-09-30 03:38:35', '2016-09-30 03:38:35'),
(721, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-09-29 10:38:43', 16, 16, 0, '2016-09-30 03:38:43', '2016-09-30 03:38:43'),
(722, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-09-29 10:42:14', 16, 16, 0, '2016-09-30 03:42:14', '2016-09-30 03:42:14'),
(723, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-09-29 10:42:29', 17, 17, 0, '2016-09-30 03:42:29', '2016-09-30 03:42:29'),
(724, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-09-29 10:44:36', 17, 17, 0, '2016-09-30 03:44:36', '2016-09-30 03:44:36'),
(725, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-09-29 10:44:46', 18, 18, 0, '2016-09-30 03:44:46', '2016-09-30 03:44:46'),
(726, 'user-login', 'get-user-login', 'suzy logged in', 'user', '2016-09-30 01:01:24', 6, 6, 0, '2016-09-30 06:01:24', '2016-09-30 06:01:24'),
(727, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-09-30 06:50:00', 1, 1, 0, '2016-09-30 23:50:00', '2016-09-30 23:50:00'),
(728, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-10-03 11:59:15', 8, 8, 0, '2016-10-04 04:59:15', '2016-10-04 04:59:15'),
(729, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-10-04 12:21:28', 3, 3, 0, '2016-10-04 05:21:28', '2016-10-04 05:21:28'),
(730, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-10-04 06:12:29', 8, 8, 0, '2016-10-04 11:12:29', '2016-10-04 11:12:29'),
(731, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-04 08:20:19', 1, 1, 0, '2016-10-05 01:20:19', '2016-10-05 01:20:19'),
(732, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-04 08:29:03', 1, 1, 0, '2016-10-05 01:29:03', '2016-10-05 01:29:03'),
(733, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-04 10:05:58', 1, 1, 0, '2016-10-05 03:05:58', '2016-10-05 03:05:58'),
(734, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-04 10:39:00', 1, 1, 0, '2016-10-05 03:39:00', '2016-10-05 03:39:00'),
(735, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-04 10:50:37', 15, 15, 0, '2016-10-05 03:50:37', '2016-10-05 03:50:37'),
(736, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-04 10:51:54', 15, 15, 0, '2016-10-05 03:51:54', '2016-10-05 03:51:54'),
(737, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-04 10:52:02', 16, 16, 0, '2016-10-05 03:52:02', '2016-10-05 03:52:02'),
(738, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 05:23:27', 1, 1, 0, '2016-10-05 22:23:27', '2016-10-05 22:23:27'),
(739, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-05 05:23:55', 1, 1, 0, '2016-10-05 22:23:55', '2016-10-05 22:23:55'),
(740, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 05:24:22', 16, 16, 0, '2016-10-05 22:24:22', '2016-10-05 22:24:22'),
(741, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 05:55:47', 1, 1, 0, '2016-10-05 22:55:47', '2016-10-05 22:55:47'),
(742, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-05 06:06:57', 18, 18, 0, '2016-10-05 23:06:57', '2016-10-05 23:06:57'),
(743, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 06:09:29', 16, 16, 0, '2016-10-05 23:09:29', '2016-10-05 23:09:29'),
(744, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-05 06:09:41', 15, 15, 0, '2016-10-05 23:09:41', '2016-10-05 23:09:41'),
(745, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 06:11:21', 1, 1, 0, '2016-10-05 23:11:21', '2016-10-05 23:11:21'),
(746, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-05 06:23:42', 15, 15, 0, '2016-10-05 23:23:42', '2016-10-05 23:23:42'),
(747, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 06:23:59', 16, 16, 0, '2016-10-05 23:23:59', '2016-10-05 23:23:59'),
(748, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 07:23:30', 16, 16, 0, '2016-10-06 00:23:30', '2016-10-06 00:23:30'),
(749, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 07:23:50', 1, 1, 0, '2016-10-06 00:23:50', '2016-10-06 00:23:50'),
(750, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 07:31:05', 1, 1, 0, '2016-10-06 00:31:05', '2016-10-06 00:31:05'),
(751, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-05 07:41:42', 15, 15, 0, '2016-10-06 00:41:42', '2016-10-06 00:41:42'),
(752, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-05 08:40:01', 1, 1, 0, '2016-10-06 01:40:01', '2016-10-06 01:40:01'),
(753, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 08:40:09', 16, 16, 0, '2016-10-06 01:40:09', '2016-10-06 01:40:09'),
(754, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 09:21:25', 16, 16, 0, '2016-10-06 02:21:25', '2016-10-06 02:21:25'),
(755, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-05 09:21:30', 18, 18, 0, '2016-10-06 02:21:30', '2016-10-06 02:21:30'),
(756, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 09:22:57', 16, 16, 0, '2016-10-06 02:22:57', '2016-10-06 02:22:57'),
(757, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-05 09:35:14', 18, 18, 0, '2016-10-06 02:35:14', '2016-10-06 02:35:14'),
(758, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-10-05 09:37:21', 18, 18, 0, '2016-10-06 02:37:21', '2016-10-06 02:37:21'),
(759, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 09:37:30', 16, 16, 0, '2016-10-06 02:37:30', '2016-10-06 02:37:30'),
(760, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 10:08:15', 16, 16, 0, '2016-10-06 03:08:15', '2016-10-06 03:08:15'),
(761, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-05 10:08:26', 15, 15, 0, '2016-10-06 03:08:26', '2016-10-06 03:08:26'),
(762, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-05 10:11:11', 15, 15, 0, '2016-10-06 03:11:11', '2016-10-06 03:11:11'),
(763, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 10:11:17', 16, 16, 0, '2016-10-06 03:11:17', '2016-10-06 03:11:17'),
(764, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 10:17:46', 16, 16, 0, '2016-10-06 03:17:46', '2016-10-06 03:17:46'),
(765, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 10:18:39', 1, 1, 0, '2016-10-06 03:18:39', '2016-10-06 03:18:39'),
(766, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-05 10:32:35', 1, 1, 0, '2016-10-06 03:32:35', '2016-10-06 03:32:35'),
(767, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-05 10:32:42', 15, 15, 0, '2016-10-06 03:32:42', '2016-10-06 03:32:42'),
(768, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 10:41:23', 16, 16, 0, '2016-10-06 03:41:23', '2016-10-06 03:41:23'),
(769, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 10:42:23', 16, 16, 0, '2016-10-06 03:42:23', '2016-10-06 03:42:23'),
(770, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-05 10:42:28', 18, 18, 0, '2016-10-06 03:42:28', '2016-10-06 03:42:28'),
(771, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-10-05 10:42:39', 18, 18, 0, '2016-10-06 03:42:39', '2016-10-06 03:42:39'),
(772, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-05 10:42:43', 1, 1, 0, '2016-10-06 03:42:43', '2016-10-06 03:42:43'),
(773, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-05 10:44:40', 15, 15, 0, '2016-10-06 03:44:40', '2016-10-06 03:44:40'),
(774, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 10:44:46', 16, 16, 0, '2016-10-06 03:44:46', '2016-10-06 03:44:46'),
(775, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-05 10:45:07', 1, 1, 0, '2016-10-06 03:45:07', '2016-10-06 03:45:07'),
(776, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-05 10:46:22', 15, 15, 0, '2016-10-06 03:46:22', '2016-10-06 03:46:22'),
(777, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-05 10:52:17', 16, 16, 0, '2016-10-06 03:52:17', '2016-10-06 03:52:17'),
(778, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-05 10:52:24', 18, 18, 0, '2016-10-06 03:52:24', '2016-10-06 03:52:24'),
(779, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-10-05 11:10:02', 18, 18, 0, '2016-10-06 04:10:02', '2016-10-06 04:10:02'),
(780, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-05 11:10:10', 15, 15, 0, '2016-10-06 04:10:10', '2016-10-06 04:10:10'),
(781, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-10-05 11:16:50', 8, 8, 0, '2016-10-06 04:16:50', '2016-10-06 04:16:50'),
(782, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-05 11:30:48', 16, 16, 0, '2016-10-06 04:30:48', '2016-10-06 04:30:48'),
(783, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-06 12:10:17', 16, 16, 0, '2016-10-06 05:10:17', '2016-10-06 05:10:17'),
(784, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-06 12:13:30', 18, 18, 0, '2016-10-06 05:13:30', '2016-10-06 05:13:30'),
(785, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-06 12:30:37', 15, 15, 0, '2016-10-06 05:30:37', '2016-10-06 05:30:37'),
(786, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-06 12:30:42', 18, 18, 0, '2016-10-06 05:30:42', '2016-10-06 05:30:42'),
(787, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-10-06 12:53:23', 3, 3, 0, '2016-10-06 05:53:23', '2016-10-06 05:53:23'),
(788, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-10-06 05:01:19', 17, 17, 0, '2016-10-06 22:01:19', '2016-10-06 22:01:19'),
(789, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-06 05:17:19', 1, 1, 0, '2016-10-06 22:17:19', '2016-10-06 22:17:19'),
(790, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-10-06 05:21:04', 17, 17, 0, '2016-10-06 22:21:04', '2016-10-06 22:21:04'),
(791, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-06 05:21:21', 16, 16, 0, '2016-10-06 22:21:21', '2016-10-06 22:21:21'),
(792, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 12:53:11', 1, 1, 0, '2016-10-07 05:53:11', '2016-10-07 05:53:11'),
(793, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 12:54:22', 1, 1, 0, '2016-10-07 05:54:22', '2016-10-07 05:54:22'),
(794, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 06:06:36', 1, 1, 0, '2016-10-07 23:06:36', '2016-10-07 23:06:36'),
(795, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 06:11:08', 1, 1, 0, '2016-10-07 23:11:08', '2016-10-07 23:11:08'),
(796, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 06:20:45', 1, 1, 0, '2016-10-07 23:20:45', '2016-10-07 23:20:45'),
(797, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 06:36:02', 1, 1, 0, '2016-10-07 23:36:02', '2016-10-07 23:36:02'),
(798, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-10-07 06:36:57', 3, 3, 0, '2016-10-07 23:36:57', '2016-10-07 23:36:57'),
(799, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-07 06:43:31', 1, 1, 0, '2016-10-07 23:43:31', '2016-10-07 23:43:31'),
(800, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 06:43:36', 1, 1, 0, '2016-10-07 23:43:36', '2016-10-07 23:43:36'),
(801, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 06:48:36', 1, 1, 0, '2016-10-07 23:48:36', '2016-10-07 23:48:36'),
(802, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 07:18:35', 1, 1, 0, '2016-10-08 00:18:35', '2016-10-08 00:18:35'),
(803, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 07:23:15', 1, 1, 0, '2016-10-08 00:23:15', '2016-10-08 00:23:15'),
(804, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 07:24:16', 1, 1, 0, '2016-10-08 00:24:16', '2016-10-08 00:24:16'),
(805, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 07:26:41', 1, 1, 0, '2016-10-08 00:26:41', '2016-10-08 00:26:41'),
(806, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 07:47:40', 1, 1, 0, '2016-10-08 00:47:40', '2016-10-08 00:47:40'),
(807, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-07 09:11:40', 1, 1, 0, '2016-10-08 02:11:40', '2016-10-08 02:11:40'),
(808, 'user-login', 'get-user-login', 'donavon logged in', 'user', '2016-10-08 01:18:37', 3, 3, 0, '2016-10-08 06:18:37', '2016-10-08 06:18:37'),
(809, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-10-10 10:55:41', 8, 8, 0, '2016-10-11 03:55:41', '2016-10-11 03:55:41'),
(810, 'user-login', 'get-user-login', 'miguell logged in', 'user', '2016-10-10 10:55:53', 8, 8, 0, '2016-10-11 03:55:53', '2016-10-11 03:55:53'),
(811, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-11 06:23:11', 1, 1, 0, '2016-10-11 23:23:11', '2016-10-11 23:23:11'),
(812, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-11 11:27:55', 1, 1, 0, '2016-10-12 04:27:55', '2016-10-12 04:27:55'),
(813, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-13 12:21:42', 1, 1, 0, '2016-10-13 03:21:42', '2016-10-13 03:21:42'),
(814, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-13 12:21:46', 18, 18, 0, '2016-10-13 03:21:46', '2016-10-13 03:21:46'),
(815, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-13 12:26:51', 16, 16, 0, '2016-10-13 03:26:51', '2016-10-13 03:26:51'),
(816, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-13 05:05:43', 18, 18, 0, '2016-10-13 20:05:43', '2016-10-13 20:05:43'),
(817, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-10-13 05:50:30', 18, 18, 0, '2016-10-13 20:50:30', '2016-10-13 20:50:30'),
(818, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 05:52:28', 15, 15, 0, '2016-10-13 20:52:28', '2016-10-13 20:52:28'),
(819, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-13 05:56:37', 18, 18, 0, '2016-10-13 20:56:37', '2016-10-13 20:56:37'),
(820, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 07:56:55', 15, 15, 0, '2016-10-13 22:56:55', '2016-10-13 22:56:55'),
(821, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-10-13 07:56:58', 17, 17, 0, '2016-10-13 22:56:58', '2016-10-13 22:56:58'),
(822, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-10-13 07:57:30', 17, 17, 0, '2016-10-13 22:57:30', '2016-10-13 22:57:30'),
(823, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 07:58:03', 15, 15, 0, '2016-10-13 22:58:03', '2016-10-13 22:58:03'),
(824, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 07:58:20', 15, 15, 0, '2016-10-13 22:58:20', '2016-10-13 22:58:20'),
(825, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-13 07:58:23', 1, 1, 0, '2016-10-13 22:58:23', '2016-10-13 22:58:23'),
(826, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-13 07:59:12', 1, 1, 0, '2016-10-13 22:59:12', '2016-10-13 22:59:12'),
(827, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-13 07:59:19', 1, 1, 0, '2016-10-13 22:59:19', '2016-10-13 22:59:19'),
(828, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-13 07:59:41', 1, 1, 0, '2016-10-13 22:59:41', '2016-10-13 22:59:41'),
(829, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 07:59:45', 15, 15, 0, '2016-10-13 22:59:45', '2016-10-13 22:59:45'),
(830, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 07:59:51', 15, 15, 0, '2016-10-13 22:59:51', '2016-10-13 22:59:51'),
(831, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 07:59:57', 15, 15, 0, '2016-10-13 22:59:57', '2016-10-13 22:59:57'),
(832, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 08:01:09', 15, 15, 0, '2016-10-13 23:01:09', '2016-10-13 23:01:09'),
(833, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-10-13 08:01:26', 16, 16, 0, '2016-10-13 23:01:26', '2016-10-13 23:01:26'),
(834, 'user-logout', 'user-logout', 'supervisor logged out', 'user', '2016-10-13 08:01:40', 16, 16, 0, '2016-10-13 23:01:40', '2016-10-13 23:01:40'),
(835, 'user-login', 'get-user-login', 'manager logged in', 'user', '2016-10-13 08:01:50', 18, 18, 0, '2016-10-13 23:01:50', '2016-10-13 23:01:50'),
(836, 'user-logout', 'user-logout', 'manager logged out', 'user', '2016-10-13 08:02:52', 18, 18, 0, '2016-10-13 23:02:52', '2016-10-13 23:02:52'),
(837, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 08:03:00', 15, 15, 0, '2016-10-13 23:03:00', '2016-10-13 23:03:00'),
(838, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 08:05:01', 15, 15, 0, '2016-10-13 23:05:01', '2016-10-13 23:05:01'),
(839, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 08:05:06', 15, 15, 0, '2016-10-13 23:05:06', '2016-10-13 23:05:06'),
(840, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 09:16:08', 15, 15, 0, '2016-10-14 00:16:08', '2016-10-14 00:16:08'),
(841, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 09:16:13', 15, 15, 0, '2016-10-14 00:16:13', '2016-10-14 00:16:13'),
(842, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 09:35:06', 15, 15, 0, '2016-10-14 00:35:06', '2016-10-14 00:35:06'),
(843, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 09:35:11', 15, 15, 0, '2016-10-14 00:35:11', '2016-10-14 00:35:11'),
(844, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 09:35:32', 15, 15, 0, '2016-10-14 00:35:32', '2016-10-14 00:35:32'),
(845, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 09:35:36', 15, 15, 0, '2016-10-14 00:35:36', '2016-10-14 00:35:36'),
(846, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-10-13 09:45:23', 15, 15, 0, '2016-10-14 00:45:23', '2016-10-14 00:45:23'),
(847, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-13 09:54:50', 15, 15, 0, '2016-10-14 00:54:50', '2016-10-14 00:54:50'),
(848, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-20 09:55:24', 1, 1, 0, '2016-10-21 00:55:24', '2016-10-21 00:55:24'),
(849, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-10-20 10:09:24', 1, 1, 0, '2016-10-21 01:09:24', '2016-10-21 01:09:24'),
(850, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-10-20 10:09:33', 1, 1, 0, '2016-10-21 01:09:33', '2016-10-21 01:09:33'),
(851, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-10-20 10:09:41', 15, 15, 0, '2016-10-21 01:09:41', '2016-10-21 01:09:41'),
(852, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-11-16 08:46:27', 1, 1, 0, '2016-11-16 23:46:27', '2016-11-16 23:46:27'),
(853, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-11-16 09:34:41', 1, 1, 0, '2016-11-17 00:34:41', '2016-11-17 00:34:41'),
(854, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-11-16 09:35:55', 1, 1, 0, '2016-11-17 00:35:55', '2016-11-17 00:35:55'),
(855, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-11-16 09:41:38', 1, 1, 0, '2016-11-17 00:41:38', '2016-11-17 00:41:38'),
(856, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-11-16 09:41:43', 15, 15, 0, '2016-11-17 00:41:43', '2016-11-17 00:41:43'),
(857, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-11-17 05:17:07', 15, 15, 0, '2016-11-17 20:17:07', '2016-11-17 20:17:07'),
(858, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-11-17 05:42:25', 15, 15, 0, '2016-11-17 20:42:25', '2016-11-17 20:42:25'),
(859, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-11-17 05:42:29', 15, 15, 0, '2016-11-17 20:42:29', '2016-11-17 20:42:29'),
(860, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-11-17 08:36:30', 15, 15, 0, '2016-11-17 23:36:30', '2016-11-17 23:36:30'),
(861, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-11-17 08:36:33', 17, 17, 0, '2016-11-17 23:36:33', '2016-11-17 23:36:33'),
(862, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-11-17 09:53:20', 17, 17, 0, '2016-11-18 00:53:20', '2016-11-18 00:53:20'),
(863, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-11-17 09:53:31', 15, 15, 0, '2016-11-18 00:53:31', '2016-11-18 00:53:31'),
(864, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-11-17 10:01:14', 15, 15, 0, '2016-11-18 01:01:14', '2016-11-18 01:01:14'),
(865, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-11-17 10:01:18', 1, 1, 0, '2016-11-18 01:01:18', '2016-11-18 01:01:18'),
(866, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-11-18 05:08:50', 15, 15, 0, '2016-11-18 20:08:50', '2016-11-18 20:08:50'),
(867, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-11-18 05:40:23', 15, 15, 0, '2016-11-18 20:40:23', '2016-11-18 20:40:23'),
(868, 'user-login', 'get-user-login', 'worker logged in', 'user', '2016-11-18 05:40:27', 15, 15, 0, '2016-11-18 20:40:27', '2016-11-18 20:40:27'),
(869, 'user-logout', 'user-logout', 'worker logged out', 'user', '2016-11-18 05:46:13', 15, 15, 0, '2016-11-18 20:46:13', '2016-11-18 20:46:13'),
(870, 'user-login', 'get-user-login', 'hr logged in', 'user', '2016-11-18 05:46:16', 17, 17, 0, '2016-11-18 20:46:16', '2016-11-18 20:46:16'),
(871, 'user-logout', 'user-logout', 'hr logged out', 'user', '2016-11-18 06:12:37', 17, 17, 0, '2016-11-18 21:12:37', '2016-11-18 21:12:37'),
(872, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-11-18 06:13:03', 1, 1, 0, '2016-11-18 21:13:03', '2016-11-18 21:13:03'),
(873, 'user-logout', 'user-logout', 'admin logged out', 'user', '2016-11-18 06:13:22', 1, 1, 0, '2016-11-18 21:13:22', '2016-11-18 21:13:22'),
(874, 'user-login', 'get-user-login', 'supervisor logged in', 'user', '2016-11-18 06:13:27', 16, 16, 0, '2016-11-18 21:13:27', '2016-11-18 21:13:27'),
(875, 'user-login', 'get-user-login', 'admin logged in', 'user', '2016-11-18 09:42:15', 1, 1, 0, '2016-11-19 00:42:15', '2016-11-19 00:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_image`
--

CREATE TABLE `user_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_image`
--

INSERT INTO `user_image` (`id`, `title`, `description`, `image`, `thumbnail`, `status`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'uploads/user_image/91342Beauty-White-Cat-Best-Picture-Background-Wallpaper-ef28f-Free.jpeg', 'uploads/user_image/thumb_50x50_183_Beauty-White-Cat-Best-Picture-Background-Wallpaper-ef28f-Free.jpeg', NULL, 2, 2, 2, '2016-03-03 15:44:08', '2016-03-03 16:05:45'),
(2, NULL, NULL, 'uploads/user_image/833666331aebcb97d0975aff7408408d6a1fe-4.jpg', 'uploads/user_image/thumb_50x50_234_6331aebcb97d0975aff7408408d6a1fe-4.jpg', NULL, 1, 1, 1, '2016-03-03 16:09:00', '2016-03-05 11:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `telephone_number` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `slug` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `first_name`, `last_name`, `address`, `telephone_number`, `date_of_birth`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'fg', 'gf', 'gfvbvcbcfg', 'fg', '2016-03-01', NULL, 2, 2, '2016-03-03 15:44:08', '2016-03-03 16:05:54'),
(2, 1, 'dv', 'ccb', 'hghgjghj', '655757', '2016-03-08', NULL, 1, 0, '2016-03-03 16:08:45', '2016-03-03 16:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_reset_password`
--

CREATE TABLE `user_reset_password` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reset_password_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_expire` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_time` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_reset_password`
--

INSERT INTO `user_reset_password` (`id`, `user_id`, `reset_password_token`, `reset_password_expire`, `reset_password_time`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 6, 'opPER9sF7H0Qb8Ioiwu89wXUPuSXyv', '2016-05-19 12:43:56', '2016-05-19 12:13:56', 0, 0, 0, '2016-05-19 07:13:56', '2016-05-19 07:13:56'),
(2, 6, '4iAyuIvWkJd0fbBx2MK9ClEMn608E2', '2016-05-23 06:33:35', '2016-05-23 06:03:35', 0, 0, 0, '2016-05-24 01:03:35', '2016-05-24 01:03:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_title_unique` (`title`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_detail`
--
ALTER TABLE `leave_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_detail_leave_head_id_foreign` (`leave_head_id`),
  ADD KEY `leave_detail_user_id_foreign` (`user_id`);

--
-- Indexes for table `leave_head`
--
ALTER TABLE `leave_head`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_head_user_id_foreign` (`user_id`);

--
-- Indexes for table `menu_panel`
--
ALTER TABLE `menu_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price_list_code_unique` (`code`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_user_role_id_user_id_unique` (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD KEY `user_role_id_foreign` (`role_id`),
  ADD KEY `user_department_id_foreign` (`department_id`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activity_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_image`
--
ALTER TABLE `user_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_image_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_reset_password`
--
ALTER TABLE `user_reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_reset_password_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;
--
-- AUTO_INCREMENT for table `leave_detail`
--
ALTER TABLE `leave_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `leave_head`
--
ALTER TABLE `leave_head`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `menu_panel`
--
ALTER TABLE `menu_panel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=876;
--
-- AUTO_INCREMENT for table `user_image`
--
ALTER TABLE `user_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_reset_password`
--
ALTER TABLE `user_reset_password`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
