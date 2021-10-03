-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2020 at 10:34 AM
-- Server version: 10.3.26-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `egrocery_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Job Running',
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `is_super` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_management` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `inventory_management` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `order_management` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `offer_management` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `coupon_management` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `bazarlist_management` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `job_status`, `designation`, `is_super`, `name`, `email`, `mobile`, `image`, `password`, `product_management`, `inventory_management`, `order_management`, `offer_management`, `coupon_management`, `bazarlist_management`, `created_at`, `updated_at`) VALUES
(1, '1', 'Admin', '1', 'Super Admin', 'superadmin@gmail.com', '123456789', NULL, '$2y$10$UqZkAXd0Zq8lieuyDexObuwzwfNu9RCKIXYCuH9vV.2SNyb4VcPbW', 'no', 'no', 'no', 'no', 'no', 'no', NULL, NULL),
(6, '1', 'DIG', '0', 'Moktadirul Islam', 'rajureal21@gmail.com', '01609605494', '1603442936fiver2.png', '$2y$10$s08V00hjcjqrnc2NdErhAO4636IpOREJfm23aUS3S3wPdkz/vUOIa', 'no', 'yes', 'yes', 'no', 'yes', 'yes', '2020-10-23 02:48:56', '2020-10-26 06:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `bazarlists`
--

CREATE TABLE `bazarlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bazarlists`
--

INSERT INTO `bazarlists` (`id`, `product_id`, `quantity`, `unit_price`, `total_price`, `size`, `color`, `created_at`, `updated_at`) VALUES
(17, 33, 1, 130.00, 130.00, NULL, NULL, '2020-07-19 01:08:32', '2020-07-20 16:28:28'),
(19, 978, 1, 1920.00, 1920.00, NULL, NULL, '2020-07-19 01:17:49', '2020-07-20 16:28:09'),
(20, 82, 2, 65.00, 130.00, NULL, NULL, '2020-07-19 01:18:08', '2020-07-20 16:27:58'),
(21, 55, 2, 70.00, 140.00, NULL, NULL, '2020-07-19 01:18:32', '2020-07-20 16:27:48'),
(22, 196, 1, 130.00, 130.00, NULL, NULL, '2020-07-19 01:18:57', '2020-07-20 16:27:36'),
(23, 186, 2, 32.00, 64.00, NULL, NULL, '2020-07-19 01:19:18', '2020-07-20 16:27:27'),
(24, 4, 1, 100.00, 100.00, NULL, NULL, '2020-07-19 01:19:33', '2020-07-20 16:27:15'),
(25, 157, 2, 45.00, 90.00, NULL, NULL, '2020-07-19 01:19:54', '2020-07-20 16:32:54'),
(26, 387, 3, 34.00, 102.00, NULL, NULL, '2020-07-19 01:20:11', '2020-07-20 16:26:53'),
(28, 687, 1, 130.00, 130.00, NULL, NULL, '2020-07-19 01:20:51', '2020-07-20 16:26:45'),
(30, 950, 5, 80.00, 400.00, NULL, NULL, '2020-07-19 01:21:21', '2020-07-20 16:26:24'),
(31, 683, 3, 18.00, 54.00, NULL, NULL, '2020-07-19 01:39:23', '2020-07-20 16:26:18'),
(35, 854, 1, 450.00, 450.00, NULL, NULL, '2020-07-19 01:50:41', '2020-07-20 16:25:48'),
(36, 983, 1, 60.00, 60.00, NULL, NULL, '2020-07-19 01:54:12', '2020-07-20 16:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `buynows`
--

CREATE TABLE `buynows` (
  `id` int(191) NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `product_id` int(191) NOT NULL,
  `quantity` int(191) NOT NULL DEFAULT 1,
  `unit_price` double(8,2) NOT NULL,
  `total_price` double(8,2) DEFAULT 0.00,
  `status` int(191) NOT NULL DEFAULT 3,
  `size` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `discount` int(191) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buynows`
--

INSERT INTO `buynows` (`id`, `session_id`, `user_id`, `product_id`, `quantity`, `unit_price`, `total_price`, `status`, `size`, `color`, `discount`, `created_at`, `updated_at`) VALUES
(2, 'dstlLIvPJgGWDrOPCfOozeJ7HDUiP43ztmUHrW21', 65, 1137, 1, 550.00, 550.00, 3, NULL, NULL, 1, '2020-10-30 02:41:31', '2020-10-30 02:41:31'),
(4, 'xoStdXPL8lCo6noTSPIa7FOXMkrnFYZwEwi1TDV6', 65, 8, 1, 50.00, 50.00, 3, NULL, NULL, 1, '2020-10-31 11:43:09', '2020-10-31 11:43:09'),
(5, 'g2sdXqptUwQgBbwsluMYaHJo9mqi7j0FgBfn4bnN', NULL, 143, 2, 280.00, 560.00, 3, NULL, NULL, 1, '2020-11-01 04:55:51', '2020-11-01 04:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `total_price` double(8,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(191) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `session_id`, `user_id`, `product_id`, `unit_price`, `quantity`, `total_price`, `status`, `size`, `color`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'dstlLIvPJgGWDrOPCfOozeJ7HDUiP43ztmUHrW21', NULL, 1139, 650.00, 1, 650.00, 1, NULL, NULL, 1, '2020-10-30 02:35:27', '2020-10-30 02:35:27'),
(2, 'dstlLIvPJgGWDrOPCfOozeJ7HDUiP43ztmUHrW21', 65, 1137, 550.00, 1, 550.00, 1, NULL, NULL, 1, '2020-10-30 02:38:03', '2020-10-30 02:38:03'),
(3, 'dstlLIvPJgGWDrOPCfOozeJ7HDUiP43ztmUHrW21', 65, 10, 50.00, 1, 50.00, 1, NULL, NULL, 1, '2020-10-30 02:42:06', '2020-10-30 02:42:06'),
(4, '9vb5oMaWtAvBjpvbMGSrWSa0zLlwoFxQ66NHj6vO', NULL, 1047, 649.00, 1, 649.00, 1, NULL, NULL, 2, '2020-10-30 13:05:48', '2020-10-30 13:05:48'),
(5, 'f0FKe9E7hz7F1CJ0NpaK3stim4RFfpojMqvJxCUA', 65, 7, 65.00, 1, 65.00, 1, NULL, NULL, 1, '2020-10-31 11:43:00', '2020-10-31 11:43:00'),
(6, NULL, 65, 144, 999.00, 1, 999.00, 1, NULL, NULL, 1, '2020-10-31 11:43:37', '2020-10-31 11:43:37'),
(7, '0HkTcCQChE3JqPoz1AdEvLyUVOCPVAPPruUgrLjY', NULL, 1139, 650.00, 1, 650.00, 1, NULL, NULL, 1, '2020-11-01 04:55:02', '2020-11-01 04:55:02'),
(10, 'c3wGoV1B5dyKMHl5lgL1LHqIcyeRYCe24fjeFPNY', NULL, 1138, 840.00, 1, 840.00, 1, NULL, NULL, 1, '2020-11-04 03:00:11', '2020-11-04 03:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Food', '1594839823food.png', '1581962583tray.png', 'Food', '2020-02-17 12:03:04', '2020-08-21 14:09:04'),
(2, 'Organic Food', '1594839837grocery.png', '1581962626food.png', 'Organic-Food', '2020-02-17 12:03:46', '2020-08-21 14:09:04'),
(3, 'Baby Care', '1594839797newborn.png', '1581962676baby-boy.png', 'Baby-Care', '2020-02-17 12:04:36', '2020-08-21 14:09:04'),
(4, 'Beauty & Health', '1594839705baby.png', '1581962704beauty-saloon.png', 'Beauty-&-Health', '2020-02-17 12:05:04', '2020-08-21 14:09:04'),
(5, 'Home & Cleaning', '1594839672brushing.png', '1581962732clean.png', 'Home-&-Cleaning', '2020-02-17 12:05:32', '2020-08-21 14:09:04'),
(6, 'Home Appliance', '1594839652stay-at-home.png', '1581962769appliance.png', 'Home-Appliance', '2020-02-17 12:06:09', '2020-08-21 14:09:04'),
(7, 'Electronics', '1594839633technology.png', '15819627973d-printer.png', 'Electronics', '2020-02-17 12:06:37', '2020-08-21 14:09:04'),
(8, 'Office & Stationary', '1594839552stationery.png', '1581962830office-supplies.png', 'Office-&-Stationary', '2020-02-17 12:07:10', '2020-08-21 14:09:04'),
(9, 'Medicine', '1594839538medicine.png', '1587750760pharmachy.png', 'Medicine', '2020-04-24 21:52:41', '2020-08-21 14:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `color_products`
--

CREATE TABLE `color_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `address`, `mobile`, `image`, `supplier_name`, `supplier_mobile`, `created_at`, `updated_at`) VALUES
(2, 'Haque', 'Dhaka', '01851939913', '15820026171494671936_comp_dfsd - Copy - Copy - Copy - Copy (8).jpg', 'Rabbi General Store', '01851939913', '2020-02-17 23:10:18', '2020-02-17 23:10:18'),
(3, 'Goldmark', 'Dhaka', '01851939913', '1582003164index.jpg', 'Rabbi General Store', '01851939913', '2020-02-17 23:19:24', '2020-02-17 23:19:24'),
(4, 'Pran', 'Dhaka', '01851939913', '1582004444pran_logo.jpg', 'Rabbi General Store', '01851939913', '2020-02-17 23:40:45', '2020-02-17 23:40:45'),
(5, 'Olympic Industries Limited', 'Dhaka', '01851939913', '15820059891573453908.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:06:29', '2020-02-18 00:06:29'),
(6, 'Dan Cake', 'Dhaka', '01851939913', '1582007460index.png', 'Rabbi General Store', '01851939913', '2020-02-18 00:31:00', '2020-02-18 00:31:00'),
(7, 'Ifad', 'Dhaka', '01851939913', '1582007630images.png', 'Rabbi General Store', '01851939913', '2020-02-18 00:33:50', '2020-02-18 00:33:50'),
(8, 'Complan', 'Dhaka', '01851939913', '1582007750unnamed.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:35:50', '2020-02-18 00:35:50'),
(9, 'Ovaltine', 'Dhaka', '01851939913', '1582007844,.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:37:24', '2020-02-18 00:37:24'),
(10, 'Horlicks', 'Dhaka', '01851939913', '1582007986Horlicks-logo_4.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:39:46', '2020-02-18 00:39:46'),
(11, 'Cadbury', 'Dhaka', '01851939913', '158200806564-640762_cadbury-droplet-cadbury-logo-png.png.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:41:06', '2020-02-18 00:41:06'),
(12, 'Nestle', 'Dhaka', '01851939913', '158200814914865989017_ab4198010d_o.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:42:29', '2020-02-18 00:42:29'),
(13, 'Purnava', 'Dhaka', '01851939913', '1582008390ee0e601662dcde712c23d6dfa983702d.jpeg', 'Rabbi General Store', '01851939913', '2020-02-18 00:46:32', '2020-02-18 00:46:32'),
(14, 'Quaker', 'Dhaka', '01851939913', '15820085175aa8e5bd7603fc558cffbf55.png', 'Rabbi General Store', '01851939913', '2020-02-18 00:48:37', '2020-02-18 00:48:37'),
(15, 'Kellogg\'s', 'Dhaka', '01851939913', '15820086171f9755c89371a5e92ef6f9570ac69ab2.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:50:17', '2020-02-18 00:50:17'),
(16, 'Sajeeb Group', 'Dhaka', '01851939913', '1582008719images.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:51:59', '2020-02-18 00:51:59'),
(17, 'Shezan', 'Dhaka', '01851939913', '1582008830Zjm9NP38.jpeg', 'Rabbi General Store', '01851939913', '2020-02-18 00:53:50', '2020-02-18 00:53:50'),
(18, 'Vitalia', 'Dhaka', '01851939913', '1582008960qGlvXTDl.png', 'Rabbi General Store', '01851939913', '2020-02-18 00:56:01', '2020-02-18 00:56:01'),
(19, 'Premium Grade', 'Dhaka', '01851939913', '1582009198premium-grade-rubber-stamp-vector-12446400.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 00:59:59', '2020-02-18 00:59:59'),
(20, 'IKO', 'Dhaka', '01851939913', '1582009334iko-insulations-vector-logo.png', 'Rabbi General Store', '01851939913', '2020-02-18 01:02:14', '2020-02-18 01:02:14'),
(21, 'Milk Vita', 'Dhaka', '01851939913', '1582009423milkvita.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 01:03:43', '2020-02-18 01:03:43'),
(22, 'Aarong', 'Dhaka', '01851939913', '15820094721200px-Aarong_logo.svg.png', 'Rabbi General Store', '01851939913', '2020-02-18 01:04:33', '2020-02-18 01:04:33'),
(23, 'Harman', 'Dhaka', '01851939913', '1582019644my-deal-lk-herman-mayonnaise-946ml-01.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 03:54:05', '2020-02-18 03:54:05'),
(24, 'Alfa', 'Dhaka', '01851939913', '1582019784alfa_mayonnaise_i.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 03:56:24', '2020-02-18 03:56:24'),
(25, 'Foster clarks', 'Dhaka', '01851939913', '1582019927FCP.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 03:58:47', '2020-02-18 03:58:47'),
(26, 'crown-products', 'Dhaka', '01851939913', '1582020465index,.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 04:07:45', '2020-02-18 04:07:45'),
(27, 'Nocilla', 'Dhaka', '01851939913', '1582020647nocilla01.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:10:47', '2020-02-18 04:10:47'),
(28, 'Nutella', 'Dhaka', '01851939913', '1582020724nutella-vector-logo.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:12:04', '2020-02-18 04:12:04'),
(29, 'Amul', 'Dhaka', '01851939913', '1582020779371-3710945_amul-logo-amul-logo-png-transparent-png.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:12:59', '2020-02-18 04:12:59'),
(30, 'Farm Fresh (Akij group)', 'Dhaka', '01851939913', '1582021048index..jpg', 'Rabbi General Store', '01851939913', '2020-02-18 04:17:28', '2020-02-18 04:17:28'),
(31, 'Ruchi', 'Dhaka', '01851939913', '1582021212images,.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 04:20:12', '2020-02-18 04:20:12'),
(32, 'Ahmed food products', 'Dhaka', '01851939913', '1582021604unnamed..jpg', 'Rabbi General Store', '01851939913', '2020-02-18 04:26:44', '2020-02-18 04:26:44'),
(33, 'BD Food', 'Dhaka', '01851939913', '1582021744large.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:29:05', '2020-02-18 04:29:05'),
(35, 'Unilever', 'Dhaka', '01851939913', '1582021939DD_CdJJXkAAH_U2.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 04:32:22', '2020-02-18 04:32:22'),
(36, 'Khushboo', 'Dhaka', '01851939913', '1582022149unnamed.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:35:50', '2020-02-18 04:35:50'),
(37, 'Alamarai', 'Dhaka', '01851939913', '1582022545almarai-logo.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:42:26', '2020-02-18 04:42:26'),
(38, 'Sundrop', 'Dhaka', '01851939913', '1582023015preview_2006129485_SunDrop.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 04:50:15', '2020-02-18 04:50:15'),
(39, 'Golden Harvest', 'Dhaka', '01851939913', '1582023468images1.png', 'Rabbi General Store', '01851939913', '2020-02-18 04:57:48', '2020-02-18 04:57:48'),
(40, 'cocola foods ltd', 'Dhaka', '01851939913', '1582023703logo.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:01:43', '2020-02-18 05:01:43'),
(42, 'Ispahani foods ltd', 'Dhaka', '01851939913', '1582023779Ispahani-tea-org-fb-banner.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:02:59', '2020-02-18 05:02:59'),
(43, 'Tiffany', 'Dhaka', '01851939913', '15820239121539688184-Tiffany-Crunch N Cream Wafer Sandwich Hazelnut-Logo.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:05:12', '2020-02-18 05:05:12'),
(44, 'Taaza', 'Dhaka', '01851939913', '1582024425index3.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:13:46', '2020-02-18 05:13:46'),
(45, 'Kazi & Kazi', 'Dhaka', '01851939913', '1582024565index2.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:16:05', '2020-02-18 05:16:05'),
(46, 'Finlays', 'Dhaka', '01851939913', '1582024881index4.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:21:22', '2020-02-18 05:21:22'),
(47, 'Tetley tea', 'Dhaka', '01851939913', '15820251655.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:26:05', '2020-02-18 05:26:05'),
(48, 'Tora Bika', 'Dhaka', '01851939913', '1582025257logo-torabika-png-5.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:27:38', '2020-02-18 05:27:38'),
(49, 'Mac coffee', 'Dhaka', '01851939913', '15820253481.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:29:08', '2020-02-18 05:29:08'),
(50, 'BRU', 'Dhaka', '01851939913', '15820254312.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:30:32', '2020-02-18 05:30:32'),
(51, 'Masafi', 'Dhaka', '01851939913', '15820257143.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:35:15', '2020-02-18 05:35:15'),
(52, 'Aloe Vera', 'Dhaka', '01851939913', '1582025861logo-leaf-brand-circle-font-aloe-vera.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:37:41', '2020-02-18 05:37:41'),
(53, 'Ocean Spray', 'Dhaka', '01851939913', '1582026002ocean-spray-cranberries-vector-logo.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:40:02', '2020-02-18 05:40:02'),
(55, 'Hamdard', 'Dhaka', '01851939913', '1582026280Hamdard_New_Logo.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:44:40', '2020-02-18 05:44:40'),
(56, 'Tang', 'Dhaka', '01851939913', '1582026405index6.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:46:45', '2020-02-18 05:46:45'),
(57, 'Square Food & Beverage', 'Dhaka', '01851939913', '1582026556Square-Food-Beverage-Job-.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:49:16', '2020-02-18 05:49:16'),
(59, 'Bashundhara', 'Dhaka', '01851939913', '1582026658Bashundhara-Group-sm20160727181255.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:50:58', '2020-02-18 05:50:58'),
(60, 'Dekko food', 'Dhaka', '01851939913', '1582026731index7.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:52:11', '2020-02-18 05:52:11'),
(61, 'Kolson', 'Dhaka', '01851939913', '1582026902kolson.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:55:03', '2020-02-18 05:55:03'),
(62, 'Pasta hat', 'Dhaka', '01851939913', '15820270234.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 05:57:03', '2020-02-18 05:57:03'),
(63, 'Snikers', 'Dhaka', '01851939913', '158202714474aa83e451445eb85253c6b0fc9a08cb.png', 'Rabbi General Store', '01851939913', '2020-02-18 05:59:04', '2020-02-18 05:59:04'),
(64, 'Kopiko', 'Dhaka', '01851939913', '1582027221index8.png', 'Rabbi General Store', '01851939913', '2020-02-18 06:00:21', '2020-02-18 06:00:21'),
(65, 'Akij Food & Beverage ltd.', 'Dhaka', '01851939913', '1582027424index9.png', 'Rabbi General Store', '01851939913', '2020-02-18 06:03:45', '2020-02-18 06:03:45'),
(66, 'Alpenliebe', 'Dhaka', '01851939913', '1582028065index11.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:14:27', '2020-02-18 06:14:27'),
(67, 'Meghna Group of Industries - Fresh', 'Dhaka', '01851939913', '1582028256index12.png', 'Fresh', '01851939913', '2020-02-18 06:17:37', '2020-02-18 06:17:37'),
(68, 'Red cow', 'Dhaka', '01851939913', '1582028460images2.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:21:01', '2020-02-18 06:21:01'),
(69, 'Kraft', 'Dhaka', '01851939913', '1582028591396-3967574_kraft-foods-logo-png-kraft-foods.png.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:23:11', '2020-02-18 06:23:11'),
(70, 'Dano Arla', 'Dhaka', '01851939913', '1582028684arla-dano.png', 'Rabbi General Store', '01851939913', '2020-02-18 06:24:44', '2020-02-18 06:24:44'),
(71, 'Diploma', 'Dhaka', '01851939913', '1582028759diploma.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:25:59', '2020-02-18 06:25:59'),
(72, 'Abul khair group (Marks)', 'Dhaka', '01851939913', '1582029148akg.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:32:29', '2020-02-18 06:32:29'),
(73, 'City Group (Teer)', 'Dhaka', '01851939913', '1582029588index13.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:39:49', '2020-02-18 06:39:49'),
(74, 'Rupchanda', 'Dhaka', '01851939913', '1582029782index14.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:43:04', '2020-02-18 06:43:04'),
(75, 'Saffola Active', 'Dhaka', '01851939913', '1582029836index15.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 06:43:56', '2020-02-18 06:43:56'),
(76, 'Shaad', 'Dhaka', '01851939913', '1582030882index16.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 07:01:24', '2020-02-18 07:01:24'),
(77, 'Pusti', 'Dhaka', '01851939913', '1582030983index17.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 07:03:03', '2020-02-18 07:03:03'),
(78, 'ACI', 'Dhaka', '01851939913', '1582031080images18.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 07:04:40', '2020-02-18 07:04:40'),
(79, 'Radhuni', 'Dhaka', '01851939913', '1582031145index19.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 07:05:45', '2020-02-18 07:05:45'),
(80, 'Shan kitchen', 'Dhaka', '01851939913', '1582031401index20.jpg', 'Rabbi General Store', '01851939913', '2020-02-18 07:10:04', '2020-02-18 07:10:04'),
(81, 'Banoful', 'Dhaka', '01851939913', '1582031497index21..jpg', 'Rabbi General Store', '01851939913', '2020-02-18 07:11:37', '2020-02-18 07:11:37'),
(82, 'None', 'Dhaka', '01851939919', '1582092237Screenshot_10.png', 'Rabbi General Store', '01851939919', '2020-02-19 00:03:57', '2020-02-19 00:03:57'),
(83, 'Square Toyleties Ltd | SUPERMOM', 'Dhaka', '01853123456', '1582134001QR code egrocery.png', 'Supermon', '01711000000', '2020-02-19 11:40:01', '2020-02-19 11:40:01'),
(84, 'egrocery', '83, Middle Basabo. Sabujbag,Dhaka-1214', '01851939913', '1582647432logo 512_512.png', 'egrocery', '01851939913', '2020-02-25 10:17:12', '2020-02-25 10:17:12'),
(85, 'fay', 'Dhaka', '01851939919', '1582779211fay.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:53:33', '2020-02-26 22:53:33'),
(86, 'godrej', 'Dhaka', '01851939919', '1582779240godrej.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:54:00', '2020-02-26 22:54:00'),
(87, 'odonil', 'Dhaka', '01851939919', '1582779269odonil log.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:54:29', '2020-02-26 22:54:29'),
(88, 'vim', 'Dhaka', '01851939919', '1582779362vim.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:56:02', '2020-02-26 22:56:02'),
(89, 'trix', 'Dhaka', '01851939919', '1582779391trix.jpeg', 'Rabbi General Store', '01851939919', '2020-02-26 22:56:31', '2020-02-26 22:56:31'),
(90, 'harpic', 'Dhaka', '01851939919', '1582779416harpic.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:56:56', '2020-02-26 22:56:56'),
(91, 'Lizol', 'Dhaka', '01851939919', '1582779442lizol.png', 'Rabbi General Store', '01851939919', '2020-02-26 22:57:22', '2020-02-26 22:57:22'),
(92, 'Rok', 'Dhaka', '01851939919', '1582779472Rok.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:57:53', '2020-02-26 22:57:53'),
(93, 'Mr. Brasso', 'Dhaka', '01851939919', '1582779502mr.-brasso.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:58:22', '2020-02-26 22:58:22'),
(94, 'Shakti', 'Dhaka', '01851939919', '1582779534shakti.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:58:54', '2020-02-26 22:58:54'),
(95, 'Finish', 'Dhaka', '01851939919', '1582779556finish.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:59:16', '2020-02-26 22:59:16'),
(96, 'Dettol', 'Dhaka', '01851939919', '1582779580Dettol_logo.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 22:59:40', '2020-02-26 22:59:40'),
(97, 'Lifebuoy', 'Dhaka', '01851939919', '1582779617lifebuoy.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 23:00:17', '2020-02-26 23:00:17'),
(98, 'Wheel', 'Dhaka', '01851939919', '1582779738wheel.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 23:02:18', '2020-02-26 23:02:18'),
(99, 'Rin', 'Dhaka', '01851939919', '1582779771rin.png', 'Rabbi General Store', '01851939919', '2020-02-26 23:02:51', '2020-02-26 23:02:51'),
(100, 'Surf excel', 'Dhaka', '01851939919', '1582779823surf excel.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 23:03:43', '2020-02-26 23:03:43'),
(101, 'chaka', 'Dhaka', '01851939919', '1582779868chaka.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 23:04:28', '2020-02-26 23:04:28'),
(102, 'Keya', 'Dhaka', '01851939919', '1582779903keya.jpg', 'Rabbi General Store', '01851939919', '2020-02-26 23:05:04', '2020-02-26 23:05:04'),
(103, 'Chamak', 'Dhaka', '01851939913', '1583557844Chamak Fabric Brightner.jpg', 'Rabby Genarel Store', '01851939913', '2020-03-06 23:10:44', '2020-03-06 23:10:44'),
(104, 'Tide', 'Dhaka', '01851939913', '1583558589Tide Detergent Powder Jasmine&Rose.jpg', 'Rabby General Store', '01851939913', '2020-03-06 23:23:09', '2020-03-06 23:23:09'),
(105, 'Dabur', 'Dhaka', '01851939919', '1583562022dabur.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 00:20:22', '2020-03-07 00:20:22'),
(106, 'Head & Shoulder', 'Dhaka', '01851939913', '1583564605Head & Shoulders Anti Dandruff Shampoo Sliky Black.jpg', 'Rabby General Store', '01851939913', '2020-03-07 01:03:25', '2020-03-07 01:03:25'),
(107, 'Revlon', 'Dhaka', '01851939919', '1583564733revlon-l.png', 'Rabbi General Store', '01851939919', '2020-03-07 01:05:33', '2020-03-07 01:05:33'),
(108, 'Livon', 'Dhaka', '01851939919', '1583564761Livin.jpeg', 'Rabbi General Store', '01851939919', '2020-03-07 01:06:01', '2020-03-07 01:06:01'),
(109, 'clariss', 'Dhaka', '01851939919', '1583564783clariss.png', 'Rabbi General Store', '01851939919', '2020-03-07 01:06:23', '2020-03-07 01:06:23'),
(110, 'Bajaj', 'Dhaka', '01851939919', '1583564807bajaj.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:06:47', '2020-03-07 01:06:47'),
(111, 'Jui', 'Dhaka', '01851939919', '1583564831jui.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:07:11', '2020-03-07 01:07:11'),
(112, 'well\'s', 'Dhaka', '01851939919', '1583564860well\'s.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:07:40', '2020-03-07 01:07:40'),
(113, 'Lever ayush', 'Dhaka', '01851939919', '1583564886Ayush.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:08:06', '2020-03-07 01:08:06'),
(114, 'Himani', 'Dhaka', '01851939919', '1583564923Himani.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:08:43', '2020-03-07 01:08:43'),
(115, 'Nihar', 'Dhaka', '01851939919', '1583564949Nihar.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:09:09', '2020-03-07 01:09:09'),
(116, 'Emami', 'Dhaka', '01851939919', '1583564994Emami.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:09:54', '2020-03-07 01:09:54'),
(117, 'Loreal', 'Dhaka', '01851939919', '1583565018Loreal.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:10:18', '2020-03-07 01:10:18'),
(118, 'Vasmol', 'Dhaka', '01851939919', '1583565047Vasmol.png', 'Rabbi General Store', '01851939919', '2020-03-07 01:10:47', '2020-03-07 01:10:47'),
(119, 'set wet', 'Dhaka', '01851939919', '1583565072set wet.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:11:12', '2020-03-07 01:11:12'),
(120, 'gatsby', 'Dhaka', '01851939919', '1583565110gatsby.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:11:50', '2020-03-07 01:11:50'),
(121, 'Vaseline', 'Dhaka', '01851939919', '1583565143Vaseline.jpg', 'Rabbi General Store', '01851939919', '2020-03-07 01:12:23', '2020-03-07 01:12:23'),
(122, 'Dove', 'Dhaka', '01851939913', '1583572572Dove Beauty Bar Pink.jpg', 'Rabby General Store', '01851939913', '2020-03-07 03:16:12', '2020-03-07 03:16:12'),
(123, 'Kumarika', 'Dhaka', '01851939913', '1583733291Kumarika Soft & Shine Shampoo.jpg', 'Rabby General Store', '01851939913', '2020-03-08 23:54:51', '2020-03-08 23:54:51'),
(124, 'Pantene', 'Dhaka', '01851939913', '1583733510Pantene Long Black Shampoo.jpg', 'Rabby General Store', '01851939913', '2020-03-08 23:58:30', '2020-03-08 23:58:30'),
(125, 'Clinic Plus', 'Dhaka', '01851939913', '1583734431Clinic Plus Strong & Long Shampoo.jpg', 'Rabby General Store', '01851939913', '2020-03-09 00:13:51', '2020-03-09 00:13:51'),
(126, 'Himalaya', 'Dhaka', '01851939913', '1583734641Himalaya Anti Dandruff Shampoo.jpg', 'Rabby General Store', '01851939913', '2020-03-09 00:17:21', '2020-03-09 00:17:21'),
(127, 'Xpel', 'Dhaka', '01851939913', '1583735059Xpel Hair Care Banana Conditioner.jpg', 'Rabby General Store', '01851939913', '2020-03-09 00:24:19', '2020-03-09 00:24:19'),
(128, 'Nivea', 'Dhaka', '01851939913', '1583748322Nivea Care & Roses Body Wash.jpg', 'Rabby General Store', '01851939913', '2020-03-09 04:05:22', '2020-03-09 04:05:22'),
(129, 'Fresh Start', 'Dhaka', '01851939913', '1583748617Fresh Start Shower Gel Cococut & Lime.jpg', 'Rabby General Store', '01851939913', '2020-03-09 04:10:17', '2020-03-09 04:10:17'),
(130, 'Meril', 'Dhaka', '01851939913', '1583748643Meril Milk & Pomegranate Soap.jpg', 'Rabby General Store', '01851939913', '2020-03-09 04:10:43', '2020-03-09 04:10:43'),
(131, 'Savlon', 'Dhaka', '01851939913', '1583750332ACI Savlon Active Antiseptic Soap.jpg', 'Rabby General Store', '01851939913', '2020-03-09 04:38:52', '2020-03-09 04:38:52'),
(132, 'Sandalina', 'Dhaka', '01851939913', '1583750772Sandalina Sandal & Rose Soap.jpg', 'Rabby General Store', '01851939913', '2020-03-09 04:46:12', '2020-03-09 04:46:12'),
(133, 'Woman\'s World', 'Dhaka', '01851939913', '1583816415Vaseline Intensive Care Cocoa Radiant Gel Oil.jpg', 'Rabby General Store', '01851939913', '2020-03-09 23:00:15', '2020-03-09 23:00:15'),
(134, 'Pond\'s', 'Dhaka', '01851939913', '1583816609Pond\'s Day Cream White Beauty.jpg', 'Rabby General Store', '01851939913', '2020-03-09 23:03:29', '2020-03-09 23:03:29'),
(135, 'Cute', 'Dhaka', '01851939913', '1583816627Cute 27 Cold Cream.jpg', 'Rabby General Store', '01851939913', '2020-03-09 23:03:47', '2020-03-09 23:03:47'),
(136, 'Boro Plus', 'Dhaka', '01851939913', '1583816658Boro Plus Antiseptic Cream.jpg', 'Rabby General Store', '01851939913', '2020-03-09 23:04:18', '2020-03-09 23:04:18'),
(137, 'Oxy', 'Dhaka', '01851939913', '1583820528Oxy Whitening Cream.jpg', 'Rabby General Store', '01851939913', '2020-03-10 00:08:48', '2020-03-10 00:08:48'),
(138, 'Boroline', 'Dhaka', '01851939913', '1583820562Boroline Antiseptic Ayurvedic Cream.jpg', 'Rabby General Store', '01851939913', '2020-03-10 00:09:22', '2020-03-10 00:09:22'),
(139, 'Revive', 'Dhaka', '01851939913', '1583820583Revive Moisturizing Lotion.jpg', 'Rabby General Store', '01851939913', '2020-03-10 00:09:43', '2020-03-10 00:09:43'),
(140, 'Clean & Clear', 'Dhaka', '01851939913', '1583831884Clean & Clear Morning Energy Brightening Berry Face Wash.jpg', 'Rabby General Store', '01851939913', '2020-03-10 03:18:04', '2020-03-10 03:18:04'),
(141, 'Axe', 'Dhaka', '01851939913', '1583836142Axe Body Perfume Signature Intense Body Perfume.jpg', 'Rabby General Store', '01851939913', '2020-03-10 04:29:02', '2020-03-10 04:29:02'),
(142, 'X-men', 'Dhaka', '01851939913', '1583837730X-Men for Boss EDT Perfume Luxury.jpg', 'Rabby General Store', '01851939913', '2020-03-10 04:55:30', '2020-03-10 04:55:30'),
(143, 'Fogg', 'Dhaka', '01851939913', '1583837751Fogg Blue Forest Body Spray.jpg', 'Rabby General Store', '01851939913', '2020-03-10 04:55:51', '2020-03-10 04:55:51'),
(144, 'Denim', 'Dhaka', '01851939913', '1583837774Denim Aqua Body Spray.jpg', 'Rabby General Store', '01851939913', '2020-03-10 04:56:14', '2020-03-10 04:56:14'),
(145, 'Havoc', 'Dhaka', '01851939913', '1583839538Havoc Deodorant Spray.jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:25:38', '2020-03-10 05:25:38'),
(146, 'Yardley', 'Dhaka', '01851939913', '1583839576Yardley English Rose Deodorant Roll On.jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:26:16', '2020-03-10 05:26:16'),
(147, 'Adidas', 'Dhaka', '01851939913', '1583839612Adidas Ice Dive Body Spray.jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:26:52', '2020-03-10 05:26:52'),
(148, 'Wild stone', 'Dhaka', '01851939913', '1583839654Wild Stone Body Perfume Steel.jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:27:34', '2020-03-10 05:27:34'),
(149, 'Engage', 'Dhaka', '01851939913', '1583839688Engage On Man Pocket Perfume (Classic Woody).jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:28:08', '2020-03-10 05:28:08'),
(150, 'Layer Shot', 'Dhaka', '01851939913', '1583839712Layer Shot Bullet Burst.jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:28:32', '2020-03-10 05:28:32'),
(151, 'Ossum', 'Dhaka', '01851939913', '1583839741Ossum Perfumed Body Mist Delight.jpg', 'Rabby General Store', '01851939913', '2020-03-10 05:29:01', '2020-03-10 05:29:01'),
(152, 'Whisper', 'Dhaka', '01851939913', '1583992233B8 Whisper Choice Ultra 6 pads.jpg', 'Rabbi General Store', '01851939913', '2020-03-11 23:50:34', '2020-03-11 23:50:34'),
(153, 'Senora', 'Dhaka', '01851939913', '1583993161C4 Senora Sanitary Napkin (Panty) 15 pcs.jpg', 'Rabi General Store', '01851939913', '2020-03-12 00:06:01', '2020-03-12 00:06:01'),
(154, 'Quality', 'Dhaka', '01851939913', '1584077970Quality brown premium egg.jpg', 'Rabbi General Store', '01851939913', '2020-03-12 23:39:30', '2020-03-12 23:39:30'),
(155, 'American Green', 'Dhaka', '01851939913', '1584099520American Green chunky peanut butter.jpg', 'Rabbi General Store', '01851939913', '2020-03-13 05:38:40', '2020-03-13 05:38:40'),
(156, 'Lamisa', 'Dhaka', '01851939913', '1584264496Lamisa Paratha family pack.jpg', 'Rabbi General Store', '01851939913', '2020-03-15 03:28:17', '2020-03-15 03:28:17'),
(157, 'Fresh', 'Dhaka', '01851939913', '1584340091Fresh Premium Tea (cup free).jpg', 'Rabbi General Store', '01851939913', '2020-03-16 00:28:11', '2020-03-16 00:28:11'),
(158, 'Coca Cola', 'Dhaka', '01851939913', '1584349519cocacola can.jpg', 'Rabbi General Store', '01851939913', '2020-03-16 03:05:19', '2020-03-16 03:05:19'),
(159, 'Gsk', 'Dhaka', '01851939913', '1584351197Glaxos D pack.jpg', 'Rabbi General Store', '01851939913', '2020-03-16 03:33:17', '2020-03-16 03:33:17'),
(160, 'Bondhon corporation Hiya', 'Dhaka', '01851939919', '1584537881hiya.png', 'Bondhon corporation Hiya', '01851939919', '2020-03-18 07:24:41', '2020-03-18 07:24:41'),
(161, 'Marks', 'Dhaka', '01851939913', '1584608664Marks gold high calcium low fat milk powder for 40+ yrs.jpg', 'Rabbi General Store', '01851939913', '2020-03-19 03:04:24', '2020-03-19 03:04:24'),
(162, 'Johnson\'s', 'Dhaka', '01851939913', '1584615234Johnson\'s Baby Original Baby Softness Lotion.jpg', 'Rabbi General Store', '01851939913', '2020-03-19 04:53:54', '2020-03-19 04:53:54'),
(163, 'Parachute', 'Dhaka', '01851939913', '1584616992Parachute Just for Baby - Baby Oil.jpg', 'Rabbi General Store', '01851939913', '2020-03-19 05:23:12', '2020-03-19 05:23:12'),
(164, 'Pampers', 'Dhaka', '01851939913', '1584694086Pampers Baby Dry Pants Diaper Pant - 36 pcs.jpg', 'Rabbi General Store', '01851939913', '2020-03-20 02:48:06', '2020-03-20 02:48:06'),
(165, 'Huggies', 'Dhaka', '01851939913', '1584697950Huggies Baby Diaper Ultra Belt - 40pcs.jpg', 'Rabbi General Store', '01851939913', '2020-03-20 03:52:30', '2020-03-20 03:52:30'),
(166, 'Mamypoko Pants', 'Dhaka', '01851939913', '1584699990MamyPoko Pants Diaper Pant - 36 pcs.jpg', 'Rabbi General Store', '01851939913', '2020-03-20 04:26:30', '2020-03-20 04:26:30'),
(167, 'UiiSii', 'dhaka', '01851939913', '1598090772uiisii.webp', 'uiisii', '01851939913', '2020-08-22 14:06:13', '2020-08-22 14:06:13'),
(168, 'Xiaomi', 'dhaka', '01766450482', '1598092777Xiaomi-Logo.png', 'xiaomi', '01766450482', '2020-08-22 14:39:38', '2020-08-22 14:39:38'),
(169, 'D-Link', 'dhaka', '01851939913', '1598118010D-Link_Logo_Blue_strap.jpg', 'D-Link', '01851939913', '2020-08-22 21:40:10', '2020-08-22 21:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_type` int(11) NOT NULL,
  `user_type` int(11) DEFAULT 1,
  `discount_amount` int(11) NOT NULL,
  `minimum_cost` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_type`, `user_type`, `discount_amount`, `minimum_cost`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(6, 'CHECK', 1, 1, 100, 200, '2020-10-11', '2020-10-26', 1, '2020-10-11 10:51:45', '2020-10-23 11:22:32'),
(7, 'TESTT', 1, 1, 100, 200, '2020-10-22', '2020-10-25', 1, '2020-10-23 11:24:43', '2020-10-23 12:17:42'),
(8, 'TEST2', 1, 1, 100, 200, '2020-10-23', '2020-10-28', 1, '2020-10-23 12:19:09', '2020-10-23 12:19:19'),
(9, 'TEST3', 1, 1, 100, 200, '2020-10-24', '2020-10-25', 1, '2020-10-23 12:30:42', '2020-10-23 12:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_users`
--

CREATE TABLE `coupon_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_users`
--

INSERT INTO `coupon_users` (`id`, `coupon_id`, `user_id`, `created_at`, `updated_at`) VALUES
(18, 2, 2, '2020-09-01 07:36:05', '2020-09-01 07:36:05'),
(19, 6, 6, '2020-10-23 11:22:43', '2020-10-23 11:22:43'),
(20, 7, 6, '2020-10-23 11:25:18', '2020-10-23 11:25:18'),
(21, 8, 6, '2020-10-23 12:19:30', '2020-10-23 12:19:30'),
(22, 9, 6, '2020-10-23 12:32:22', '2020-10-23 12:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `district_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhaka', '2020-02-17 09:14:51', '2020-02-17 09:14:51');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `division_name`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', '2020-02-17 09:14:44', '2020-02-17 09:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 6, 944, '2020-04-25 19:14:27', '2020-04-25 19:14:27'),
(5, 6, 948, '2020-04-25 19:18:24', '2020-04-25 19:18:24'),
(7, 4, 856, '2020-07-04 00:40:00', '2020-07-04 00:40:00'),
(8, 56, 141, '2020-07-07 19:00:10', '2020-07-07 19:00:10'),
(10, 75, 1013, '2020-08-22 08:36:52', '2020-08-22 08:36:52'),
(12, 89, 1017, '2020-09-01 07:48:28', '2020-09-01 07:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `franchies`
--

CREATE TABLE `franchies` (
  `id` int(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `district` varchar(191) DEFAULT NULL,
  `thana` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `current_business` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `franchies`
--

INSERT INTO `franchies` (`id`, `name`, `district`, `thana`, `address`, `mobile`, `email`, `current_business`, `created_at`, `updated_at`) VALUES
(1, 'Bigm Org', 'dhaka', 'dhaka', 'shamoly,dhaka', '01889967514', 'superadmin@gmail.com', 'software', '2020-10-30 03:54:37', '2020-10-30 03:54:37'),
(2, 'Bigm Org', 'dhaka', 'dhaka', 'sss', '01889967514', 'superadmin@gmail.com', 'software', '2020-10-30 03:56:17', '2020-10-30 03:56:17'),
(3, 'Bigm Org', 'dhaka', 'dhaka', 'sssss', '01889967514', 'superadmin@gmail.com', 'software', '2020-10-30 03:58:03', '2020-10-30 03:58:03'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-03 23:40:12', '2020-11-03 23:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `giftaddresses`
--

CREATE TABLE `giftaddresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `upazila_id` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(8,2) NOT NULL DEFAULT 45.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giftaddresses`
--

INSERT INTO `giftaddresses` (`id`, `user_id`, `name`, `mobile`, `division_id`, `district_id`, `upazila_id`, `address`, `delivery_charge`, `created_at`, `updated_at`) VALUES
(1, 8, 'Gift 2', '01548865832', 1, 1, 3, 'Baridhara', 45.00, '2020-06-28 13:10:26', '2020-06-28 13:11:18'),
(2, 6, 'Rakib', '01747473856', 1, 1, 2, 'house#122, Road#07', 45.00, '2020-06-28 15:19:41', '2020-06-28 15:19:41'),
(3, 46, 'Jui', '01306658266', 1, 1, 2, 'test', 45.00, '2020-06-29 00:10:33', '2020-06-29 00:11:07'),
(4, 47, 'gsvaj naba', '0454548764548', 1, 1, 6, 'gCacbauav', 45.00, '2020-06-29 00:25:42', '2020-06-29 00:25:42'),
(5, 65, 'Sumom', '01737717257', 1, 1, 26, 'washpur tower,arsinagor', 45.00, '2020-07-17 20:00:28', '2020-07-22 16:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `homeaddresses`
--

CREATE TABLE `homeaddresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `upazila_id` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(8,2) NOT NULL DEFAULT 45.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeaddresses`
--

INSERT INTO `homeaddresses` (`id`, `user_id`, `division_id`, `district_id`, `upazila_id`, `address`, `delivery_charge`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 14, 'Gulshan2', 45.00, '2020-02-17 23:22:08', '2020-02-17 23:22:08'),
(2, 2, 1, 1, 2, 'house 1, road6,adabor,Dhaka', 45.00, '2020-02-18 05:35:33', '2020-02-18 05:35:33'),
(3, 4, 1, 1, 7, '52, Barontek, Dhaka cantonment, dhaka', 45.00, '2020-02-18 08:38:32', '2020-07-04 00:38:57'),
(4, 6, 1, 1, 2, 'Gulshan', 45.00, '2020-02-19 02:51:30', '2020-06-28 19:48:57'),
(5, 5, 1, 1, 4, 'banani11', 45.00, '2020-02-20 12:28:43', '2020-02-20 12:28:43'),
(6, 8, 1, 1, 26, 'bosila', 45.00, '2020-02-22 23:15:10', '2020-02-22 23:15:10'),
(7, 9, 1, 1, 35, '83, middle bashabo, dhaka 1214', 45.00, '2020-02-23 02:48:07', '2020-02-23 02:48:07'),
(8, 9, 1, 1, 35, '83, middle bashabo, dhaka 1214', 45.00, '2020-02-23 02:48:08', '2020-02-23 02:48:08'),
(9, 19, 1, 1, 2, 'Road 6,House22', 45.00, '2020-03-12 13:08:10', '2020-03-12 13:08:10'),
(10, 6, 1, 1, 4, 'test', 45.00, '2020-03-15 01:10:22', '2020-03-15 01:10:22'),
(11, 4, 1, 1, 7, '52, Barontek, Dhaka Cant. Dhaka-1216', 45.00, '2020-03-15 04:58:03', '2020-03-15 04:58:03'),
(12, 4, 1, 1, 7, '52, Barontek Dhaka Cantonment, Dhaka 1216', 45.00, '2020-03-15 04:58:42', '2020-03-15 04:58:42'),
(13, 20, 1, 1, 35, '7/2 A East Bashaboo. kodomtala main road,5 line', 45.00, '2020-03-15 14:09:52', '2020-03-15 14:09:52'),
(14, 20, 1, 1, 35, '7/2 A East Bashaboo. kodomtala main road,5 line', 45.00, '2020-03-15 14:09:52', '2020-03-15 14:09:52'),
(15, 4, 1, 1, 7, 'H/No: 52, Flat No: 5b, Barontek, Dhaka Cantonment, Dhaka-1216', 45.00, '2020-03-18 12:06:20', '2020-03-18 12:06:20'),
(16, 25, 1, 1, 17, '980/5,East Shewrapara, Mirpur, Dhaka', 45.00, '2020-03-19 12:32:18', '2020-03-19 12:32:18'),
(17, 26, 1, 1, 4, 'Nagod,AF tower, , Banani Dhaka', 45.00, '2020-03-21 02:33:03', '2020-03-21 02:33:03'),
(18, 29, 1, 1, 31, '52/A, Bhumi Office, Purana Palton', 45.00, '2020-04-16 22:11:54', '2020-04-16 22:11:54'),
(19, 6, 1, 1, 26, 'Road #7, House #122, Mohammadia housing ltd, Mohammadpur', 45.00, '2020-05-09 13:30:19', '2020-05-09 13:30:19'),
(20, 6, 1, 1, 26, 'Road #7, House #122, Mohammadia housing ltd, Mohammadpur', 45.00, '2020-05-09 13:30:20', '2020-05-09 13:30:20'),
(21, 4, 1, 1, 7, 'house:45, flat no :3b,Barontek Dhaka cantonment , Dhaka', 45.00, '2020-05-18 01:47:57', '2020-05-18 01:47:57'),
(22, 4, 1, 1, 3, 'badda', 45.00, '2020-05-18 01:48:18', '2020-05-18 01:48:18'),
(23, 39, 1, 1, 25, 'afghn', 45.00, '2020-06-11 20:03:53', '2020-06-11 20:03:53'),
(24, 39, 1, 1, 25, 'afghn', 45.00, '2020-06-11 20:03:54', '2020-06-11 20:03:54'),
(25, 4, 1, 1, 3, 'house 32, road 9', 45.00, '2020-06-20 16:08:40', '2020-06-20 16:08:40'),
(26, 6, 1, 1, 26, 'road 7, house#122, housing LTD,', 45.00, '2020-06-25 15:23:22', '2020-06-25 15:23:22'),
(27, 46, 1, 1, 8, 'housebzn', 45.00, '2020-06-29 00:07:17', '2020-06-29 00:09:26'),
(28, 47, 1, 1, 2, 'test', 45.00, '2020-06-29 00:24:45', '2020-06-29 00:24:45'),
(29, 54, 1, 1, 2, 'test', 45.00, '2020-07-01 19:22:13', '2020-07-01 19:22:13'),
(30, 14, 1, 1, 35, '69/4/C-2, Kadamtala, Basabo, Dhaka-1214', 45.00, '2020-07-02 21:22:49', '2020-07-02 21:22:49'),
(31, 55, 1, 1, 46, 'faidabad', 45.00, '2020-07-07 11:37:24', '2020-07-07 11:37:24'),
(32, 56, 1, 1, 43, 'House:12/4, Flat: 6(B), Tejkunipara Water Pump Lane, West Nakhalpara, Tejgaon,Dhaka-1215', 45.00, '2020-07-07 18:54:37', '2020-07-07 18:54:37'),
(33, 58, 1, 1, 3, 'জ ৯৭, মধ্য বাড্ডা,কুমিল্লা পাড়া,গুলশান-বাড্ডা লিংক রোড, ঢাকা।', 45.00, '2020-07-08 21:11:07', '2020-07-08 21:11:07'),
(34, 60, 1, 1, 24, '666', 45.00, '2020-07-10 20:40:48', '2020-07-10 20:40:48'),
(35, 63, 1, 1, 4, 'gkfh', 45.00, '2020-07-12 14:50:04', '2020-07-12 14:50:04'),
(36, 65, 1, 1, 26, 'Beribadh', 45.00, '2020-07-16 22:04:32', '2020-07-16 22:04:32'),
(37, 67, 1, 1, 3, 'UNIT 5A, H 374, ANANDANAGAR SHAHIDMINAR, MERUL BADDA', 45.00, '2020-07-20 23:16:53', '2020-07-20 23:16:53'),
(38, 68, 1, 1, 12, '1/a, free school street,  kathalbagan, dhaka', 45.00, '2020-08-06 11:06:16', '2020-08-06 11:06:16'),
(39, 69, 1, 1, 3, '1st floor, H-6, R-4, Block-F, Banasree, Dhaka.', 45.00, '2020-08-07 18:18:01', '2020-08-07 18:18:01'),
(40, 72, 1, 1, 46, '1492/1,member bari,4th floor,near majar chourasta,uttarkhan,dhaka', 45.00, '2020-08-15 10:56:59', '2020-08-15 10:56:59'),
(41, 76, 1, 1, 2, 'Adabor 8', 45.00, '2020-08-22 13:16:28', '2020-08-22 13:16:28'),
(42, 77, 1, 1, 20, 'road no(6),goran,shantipur,khilgaon dhaka,1219', 45.00, '2020-08-22 14:11:46', '2020-08-22 14:11:46'),
(43, 81, 1, 1, 19, 'munsurbag', 45.00, '2020-08-25 16:18:45', '2020-08-25 16:18:45'),
(44, 83, 1, 1, 7, 'H-52, Flat-5c, Barontek, Dhaka', 45.00, '2020-08-27 23:47:33', '2020-08-27 23:47:33'),
(45, 84, 1, 1, 25, 'Plot:13-18,block-F,Avenue-5,mirpur-11,dhaka', 45.00, '2020-08-28 21:29:41', '2020-08-28 21:29:41'),
(46, 91, 1, 1, 20, '116/A, Dom Inno Pioggia, Malibagh DIT road', 45.00, '2020-09-04 14:38:47', '2020-09-04 14:38:47'),
(47, 94, 1, 1, 20, 'sipahibag adorsho bag', 45.00, '2020-09-15 23:26:02', '2020-09-15 23:26:02'),
(48, 96, 1, 1, 20, 'House-308,Road-16,Block-K,South Banasree.', 45.00, '2020-10-02 08:08:06', '2020-10-02 08:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `image_products`
--

CREATE TABLE `image_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_products`
--

INSERT INTO `image_products` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(4, 4, '1582000749PicsArt_02-18-10.28.06.jpg', '2020-02-17 22:39:10', '2020-02-17 22:39:10'),
(7, 6, '1582002963856-large_default.jpg', '2020-02-17 23:16:03', '2020-02-17 23:16:03'),
(8, 7, '1582003708Special-chocolate-Cookies.jpg', '2020-02-17 23:28:29', '2020-02-17 23:28:29'),
(9, 8, '1582004017chocolate-chips-cookies.jpg', '2020-02-17 23:33:39', '2020-02-17 23:33:39'),
(10, 9, '1582004640Coconut-Cookies.jpg', '2020-02-17 23:44:01', '2020-02-17 23:44:01'),
(11, 10, '1582004733Original-Butter-Cookies.jpg', '2020-02-17 23:45:33', '2020-02-17 23:45:33'),
(13, 12, '1582005243Milk-Cookies.jpg', '2020-02-17 23:54:03', '2020-02-17 23:54:03'),
(14, 13, '1582006611Salcoti.jpg', '2020-02-18 00:16:52', '2020-02-18 00:16:52'),
(15, 14, '1582006814Hello-Cookies.png', '2020-02-18 00:20:14', '2020-02-18 00:20:14'),
(16, 15, '1582006942Hello-Cookies.png', '2020-02-18 00:22:22', '2020-02-18 00:22:22'),
(28, 27, '1582091277Screenshot_8.png', '2020-02-18 23:47:57', '2020-02-18 23:47:57'),
(31, 29, '1582093130Screenshot_12.png', '2020-02-19 00:18:50', '2020-02-19 00:18:50'),
(34, 31, '1582094303Screenshot_14.png', '2020-02-19 00:38:23', '2020-02-19 00:38:23'),
(37, 34, '1582095311Screenshot_17.png', '2020-02-19 00:55:11', '2020-02-19 00:55:11'),
(39, 36, '1582105147miniket stnd.png', '2020-02-19 03:39:07', '2020-02-19 03:39:07'),
(42, 37, '1582106655rashid min.png', '2020-02-19 04:04:15', '2020-02-19 04:04:15'),
(44, 40, '1582107375nazir prem.png', '2020-02-19 04:16:15', '2020-02-19 04:16:15'),
(65, 18, '1582517595teer. 5 l.jpg', '2020-02-23 22:13:16', '2020-02-23 22:13:16'),
(66, 19, '1582518275fresh oil 5 L.jpg', '2020-02-23 22:24:35', '2020-02-23 22:24:35'),
(67, 20, '1582518372rupchanda 5 L.jpg', '2020-02-23 22:26:12', '2020-02-23 22:26:12'),
(68, 21, '1582518440bashundhara oil 5L.jpg', '2020-02-23 22:27:20', '2020-02-23 22:27:20'),
(69, 25, '1582518614pran-mustard-oil- 1 L.jpg', '2020-02-23 22:30:14', '2020-02-23 22:30:14'),
(70, 26, '1582518777pran-mustard-oil-500ml.jpg', '2020-02-23 22:32:57', '2020-02-23 22:32:57'),
(71, 28, '1582518877Mosur Dal Deshi 1 kg.jpg', '2020-02-23 22:34:37', '2020-02-23 22:34:37'),
(72, 41, '1582536629radhuni chili.jpg', '2020-02-24 03:30:30', '2020-02-24 03:30:30'),
(73, 42, '1582536687radhuni chili.jpg', '2020-02-24 03:31:28', '2020-02-24 03:31:28'),
(74, 43, '1582536727radhuni chili.jpg', '2020-02-24 03:32:07', '2020-02-24 03:32:07'),
(75, 44, '1582536765radhuni chili.jpg', '2020-02-24 03:32:45', '2020-02-24 03:32:45'),
(76, 45, '1582536811RadhuniTurmeric Powder.jpg', '2020-02-24 03:33:31', '2020-02-24 03:33:31'),
(77, 46, '1582536858RadhuniTurmeric Powder.jpg', '2020-02-24 03:34:18', '2020-02-24 03:34:18'),
(78, 47, '1582536892RadhuniTurmeric Powder.jpg', '2020-02-24 03:34:52', '2020-02-24 03:34:52'),
(79, 48, '1582536920RadhuniTurmeric Powder.jpg', '2020-02-24 03:35:20', '2020-02-24 03:35:20'),
(80, 49, '1582537160radhuni jeera powder.jpg', '2020-02-24 03:39:20', '2020-02-24 03:39:20'),
(81, 50, '1582537200radhuni jeera powder.jpg', '2020-02-24 03:40:00', '2020-02-24 03:40:00'),
(82, 51, '1582537272radhuni dhoniya-powder. jpg.jpg', '2020-02-24 03:41:12', '2020-02-24 03:41:12'),
(83, 52, '1582537313radhuni dhoniya-powder. jpg.jpg', '2020-02-24 03:41:53', '2020-02-24 03:41:53'),
(84, 30, '1582537422aci moshur dal. jpeg.png', '2020-02-24 03:43:42', '2020-02-24 03:43:42'),
(85, 23, '1582537497radhuni Mustard Oil 1000ml.jpg', '2020-02-24 03:44:57', '2020-02-24 03:44:57'),
(86, 24, '1582537596radhuni Mustard Oil 500 ml.jpg', '2020-02-24 03:46:36', '2020-02-24 03:46:36'),
(87, 53, '1582538114teer atta 2kg. jpeg.jpg', '2020-02-24 03:55:14', '2020-02-24 03:55:14'),
(88, 54, '1582538222teer maida flour 2kg. jpg.jpg', '2020-02-24 03:57:02', '2020-02-24 03:57:02'),
(90, 56, '1582538432aci pure maida 2 kg.jpg', '2020-02-24 04:00:32', '2020-02-24 04:00:32'),
(94, 61, '1582539751saffola active 5 L.jpg', '2020-02-24 04:22:31', '2020-02-24 04:22:31'),
(95, 57, '1582539813aci brown atta 1 kg.png', '2020-02-24 04:23:33', '2020-02-24 04:23:33'),
(96, 62, '1582539970aci rice bran oil 5 l.jpg', '2020-02-24 04:26:10', '2020-02-24 04:26:10'),
(97, 63, '1582540037ahmed mustard oil 500 ml.jpg', '2020-02-24 04:27:17', '2020-02-24 04:27:17'),
(98, 64, '1582540235aci moong dal 1 kg.png', '2020-02-24 04:30:35', '2020-02-24 04:30:35'),
(99, 65, '1582540391aci chinigura rice 1 kg.jpg', '2020-02-24 04:33:11', '2020-02-24 04:33:11'),
(101, 67, '1582540572aci bashmati 1 kg.jpg', '2020-02-24 04:36:12', '2020-02-24 04:36:12'),
(102, 68, '1582540645aci katarivog  5 kg.png', '2020-02-24 04:37:25', '2020-02-24 04:37:25'),
(103, 69, '1582543997aci pure nazirshail 5 kg.jpg', '2020-02-24 05:33:17', '2020-02-24 05:33:17'),
(104, 70, '1582544075aci pure nazirshail 10 kg.png', '2020-02-24 05:34:35', '2020-02-24 05:34:35'),
(105, 71, '1582544203aci pure miniket 10 kg.png', '2020-02-24 05:36:43', '2020-02-24 05:36:43'),
(106, 72, '1582548696radhuni kashundi. jpg.jpg', '2020-02-24 06:51:36', '2020-02-24 06:51:36'),
(107, 73, '1582548819pran white vinegar 650ml. jpg.jpg', '2020-02-24 06:53:39', '2020-02-24 06:53:39'),
(108, 74, '1582549034pran white vinegar.jpg', '2020-02-24 06:57:14', '2020-02-24 06:57:14'),
(109, 75, '1582549112BD white vinegar.jpg', '2020-02-24 06:58:32', '2020-02-24 06:58:32'),
(110, 76, '1582549178ahmed white-vinegar-500-ml. jpg.jpg', '2020-02-24 06:59:38', '2020-02-24 06:59:38'),
(111, 77, '1582549282radhuni garam masala.jpg', '2020-02-24 07:01:22', '2020-02-24 07:01:22'),
(112, 78, '1582549335radhuni garam masala.jpg', '2020-02-24 07:02:15', '2020-02-24 07:02:15'),
(113, 79, '1582549474Radhuni-Panch-Foran-50-gm.. jpg.jpg', '2020-02-24 07:04:34', '2020-02-24 07:04:34'),
(114, 80, '1582549580fresh salt.jpg', '2020-02-24 07:06:20', '2020-02-24 07:06:20'),
(115, 81, '1582549656akher chini.jpg', '2020-02-24 07:07:36', '2020-02-24 07:07:36'),
(117, 83, '1582550054teer semolina suji 500gm.jpg', '2020-02-24 07:14:14', '2020-02-24 07:14:14'),
(118, 84, '1582550167aci pure shuji 500 gm.jpg', '2020-02-24 07:16:07', '2020-02-24 07:16:07'),
(119, 85, '1582553937aci salt.jpg', '2020-02-24 08:18:57', '2020-02-24 08:18:57'),
(120, 86, '1582555781Aarong Dairy Sour Yogurt.jpg', '2020-02-24 08:49:41', '2020-02-24 08:49:41'),
(121, 87, '1582556025aarong dairy butter.jpg', '2020-02-24 08:53:45', '2020-02-24 08:53:45'),
(122, 88, '1582556246Milk vita butter.jpg', '2020-02-24 08:57:26', '2020-02-24 08:57:26'),
(123, 89, '1582556317Pran Butter (Fresco container).jpg', '2020-02-24 08:58:37', '2020-02-24 08:58:37'),
(124, 90, '1582556394Red cow butter oil.jpg', '2020-02-24 08:59:54', '2020-02-24 08:59:54'),
(125, 91, '1582556496Amul pasteurised butter.jpg', '2020-02-24 09:01:36', '2020-02-24 09:01:36'),
(126, 92, '1582556598farm fresh butter (50gm X4pcs).jpg', '2020-02-24 09:03:18', '2020-02-24 09:03:18'),
(127, 93, '1582556969ruchi mango pickle 1.jpg', '2020-02-24 09:09:29', '2020-02-24 09:09:29'),
(128, 94, '1582557020ruchi mango pickle 1.jpg', '2020-02-24 09:10:20', '2020-02-24 09:10:20'),
(129, 95, '1582557208Ruchi Garlic pickle.jpg', '2020-02-24 09:13:28', '2020-02-24 09:13:28'),
(130, 96, '1582557323Ruchi Olive Pickle 400gm.jpg', '2020-02-24 09:15:23', '2020-02-24 09:15:23'),
(131, 97, '1582557654pran mango pickle 400.jpg', '2020-02-24 09:20:54', '2020-02-24 09:20:54'),
(132, 98, '1582557781pran olive.jpg', '2020-02-24 09:23:01', '2020-02-24 09:23:01'),
(133, 99, '1582557854pran chili pickle.jpg', '2020-02-24 09:24:14', '2020-02-24 09:24:14'),
(134, 100, '1582557967bd olive pickle 400.jpg', '2020-02-24 09:26:07', '2020-02-24 09:26:07'),
(135, 101, '1582558075bd mango.jpg', '2020-02-24 09:27:55', '2020-02-24 09:27:55'),
(136, 102, '1582558227Ifad Suji.jpg', '2020-02-24 09:30:27', '2020-02-24 09:30:27'),
(137, 103, '1582558289banoful laccha shemai.jpg', '2020-02-24 09:31:30', '2020-02-24 09:31:30'),
(138, 104, '1582558357radhuni beef masala.jpg', '2020-02-24 09:32:37', '2020-02-24 09:32:37'),
(139, 35, '1582558460chasi chinigura 1kg.jpg', '2020-02-24 09:34:20', '2020-02-24 09:34:20'),
(140, 105, '1582558630radhuni chicken_masala.jpg', '2020-02-24 09:37:10', '2020-02-24 09:37:10'),
(141, 106, '1582558760radhuni-chatpoti-masala.jpg', '2020-02-24 09:39:20', '2020-02-24 09:39:20'),
(142, 107, '1582558864radhuni Haleem mix.jpg', '2020-02-24 09:41:04', '2020-02-24 09:41:04'),
(143, 108, '1582558920radhuni Firni mix.jpg', '2020-02-24 09:42:01', '2020-02-24 09:42:01'),
(144, 109, '1582559018Radhuni Tehari Mix.jpg', '2020-02-24 09:43:38', '2020-02-24 09:43:38'),
(145, 110, '1582559147Radhuni kachchi biryani masala.jpg', '2020-02-24 09:45:47', '2020-02-24 09:45:47'),
(146, 111, '1582559240Radhuni meat curry masala.jpg', '2020-02-24 09:47:20', '2020-02-24 09:47:20'),
(147, 112, '1582613850Radhuni fish curry masala.jpg', '2020-02-25 00:57:31', '2020-02-25 00:57:31'),
(148, 113, '1582613945Radhuni Falooda mix (Mango).jpg', '2020-02-25 00:59:05', '2020-02-25 00:59:05'),
(149, 114, '1582614006Radhuni Butter chicken masala.png', '2020-02-25 01:00:06', '2020-02-25 01:00:06'),
(150, 115, '1582614064Radhuni Borhani Masala.jpg', '2020-02-25 01:01:04', '2020-02-25 01:01:04'),
(151, 116, '1582614165Radhuni kabab masala.jpg', '2020-02-25 01:02:45', '2020-02-25 01:02:45'),
(152, 117, '1582614298Radhuni kala Bhuna masala.jpg', '2020-02-25 01:04:58', '2020-02-25 01:04:58'),
(153, 118, '1582614353Radhuni hyderabadi Biryani.jpeg', '2020-02-25 01:05:53', '2020-02-25 01:05:53'),
(154, 119, '1582614415Radhuni Jorda mix.jpg', '2020-02-25 01:06:55', '2020-02-25 01:06:55'),
(155, 120, '1582642132Aarong Austogram cheese.png', '2020-02-25 08:48:53', '2020-02-25 08:48:53'),
(156, 121, '1582642211Aarong dairy Shredded mozzarella Cheese.png', '2020-02-25 08:50:11', '2020-02-25 08:50:11'),
(157, 122, '1582642290Aarong Garlic spread cheese.jpg', '2020-02-25 08:51:30', '2020-02-25 08:51:30'),
(158, 123, '1582642408aarong dairy cube cheese.png', '2020-02-25 08:53:28', '2020-02-25 08:53:28'),
(159, 124, '1582642490aarong classic spread cheese.png', '2020-02-25 08:54:50', '2020-02-25 08:54:50'),
(160, 125, '1582642616pran-dhaka-cheese-225gm.jpg', '2020-02-25 08:56:56', '2020-02-25 08:56:56'),
(161, 126, '1582642873kraft-processed-cheddar-cheese-tin-190-gm.png', '2020-02-25 09:01:14', '2020-02-25 09:01:14'),
(162, 127, '1582642979kraft original cheddar cheese spread.jpg', '2020-02-25 09:02:59', '2020-02-25 09:02:59'),
(164, 129, '1582643405Dano power instant full cream milk powder.jpg', '2020-02-25 09:10:05', '2020-02-25 09:10:05'),
(165, 130, '1582643470Dano sterilized cream.jpg', '2020-02-25 09:11:10', '2020-02-25 09:11:10'),
(166, 131, '1582643632dano captain choco.png', '2020-02-25 09:13:52', '2020-02-25 09:13:52'),
(167, 132, '1582643690dano mom.jpg', '2020-02-25 09:14:50', '2020-02-25 09:14:50'),
(168, 133, '1582644010Pran full cream milk powder.webp', '2020-02-25 09:20:10', '2020-02-25 09:20:10'),
(169, 134, '1582644122Nestle Nido fortigrow full cream milk powder BIB.jpg', '2020-02-25 09:22:02', '2020-02-25 09:22:02'),
(170, 135, '1582644193Nestle nido growing up 1+ protection Milk Bib.png', '2020-02-25 09:23:13', '2020-02-25 09:23:13'),
(171, 136, '1582644249nestle coffee mate richer & creamer BIB.jpg', '2020-02-25 09:24:10', '2020-02-25 09:24:10'),
(172, 137, '1582644306Nestle nido fortigrow full cream milk powder Tin.jpg', '2020-02-25 09:25:06', '2020-02-25 09:25:06'),
(173, 138, '1582644352nestle coffee mate creamer.jpg', '2020-02-25 09:25:52', '2020-02-25 09:25:52'),
(174, 139, '1582644407Milk vita full cream powder milk.jpg', '2020-02-25 09:26:47', '2020-02-25 09:26:47'),
(175, 140, '1582644449aarong dairy instant low fat milk powder.jpg', '2020-02-25 09:27:29', '2020-02-25 09:27:29'),
(182, 145, '1582697927spring lemon.jpg', '2020-02-26 00:18:48', '2020-02-26 00:18:48'),
(183, 146, '1582698022spring floral.jpg', '2020-02-26 00:20:22', '2020-02-26 00:20:22'),
(184, 147, '1582698067spring orange.jpg', '2020-02-26 00:21:07', '2020-02-26 00:21:07'),
(185, 148, '1582733597supermom baby diaper Extra Large (12-17kg) 20pcs.jpg', '2020-02-26 10:13:17', '2020-02-26 10:13:17'),
(186, 148, '1582733597supermom baby diaper Extra Large (12-17kg) 20pcs.jpg', '2020-02-26 10:13:17', '2020-02-26 10:13:17'),
(188, 150, '1582744042Cup Noodles.jpg', '2020-02-26 13:07:22', '2020-02-26 13:07:22'),
(189, 151, '1582744397Nestle 2 Minute-8pack.png', '2020-02-26 13:13:17', '2020-02-26 13:13:17'),
(190, 152, '1582744751Nestle Maggie - 4pack.jpg', '2020-02-26 13:19:11', '2020-02-26 13:19:11'),
(191, 153, '1582745040chopstick-deshi-masala-Noodles 8 Pack.png', '2020-02-26 13:24:00', '2020-02-26 13:24:00'),
(192, 154, '1582745827nestle Maggi Healthy Thai Soup.jpg', '2020-02-26 13:37:07', '2020-02-26 13:37:07'),
(193, 155, '1582799899bogurar-doi-special.jpg', '2020-02-27 04:38:20', '2020-02-27 04:38:20'),
(194, 156, '1582815833Wheel Washing Powder 2in1 Clean & Rose1.jpg', '2020-02-27 09:03:54', '2020-02-27 09:03:54'),
(195, 157, '1582816197Wheel Washing Powder 2in1 Clean & Fresh2.jpg', '2020-02-27 09:09:57', '2020-02-27 09:09:57'),
(196, 158, '1582816264Wheel Washing Powder Laundry Bar3.jpg', '2020-02-27 09:11:04', '2020-02-27 09:11:04'),
(197, 159, '1582816331Rin Washing Powder Power Bright4.jpg', '2020-02-27 09:12:11', '2020-02-27 09:12:11'),
(198, 160, '1582816432Rin Washing Powder Bundle Pack5.jpg', '2020-02-27 09:13:52', '2020-02-27 09:13:52'),
(199, 161, '1582816672Rin Washing Powder Antibac6.jpg', '2020-02-27 09:17:52', '2020-02-27 09:17:52'),
(200, 162, '1582816750Rin Liquid Detergent7.jpg', '2020-02-27 09:19:10', '2020-02-27 09:19:10'),
(201, 163, '1582816832Surf Excel Washing Powder8.jpg', '2020-02-27 09:20:32', '2020-02-27 09:20:32'),
(202, 164, '1582816898Surf Excel Washing Powder (With Bucket).jpg', '2020-02-27 09:21:38', '2020-02-27 09:21:38'),
(203, 165, '1582817034Surf Excel Washing Powder Matic Top Load.jpg', '2020-02-27 09:23:54', '2020-02-27 09:23:54'),
(204, 166, '1582817102Surf Excel Matic Liquid Detergent Top Load.jpg', '2020-02-27 09:25:02', '2020-02-27 09:25:02'),
(205, 167, '1582971019fay  anti tobacco.jpg', '2020-02-29 04:10:20', '2020-02-29 04:10:20'),
(206, 168, '1582971078fay orchid.jpg', '2020-02-29 04:11:18', '2020-02-29 04:11:18'),
(207, 169, '1582971120fay airfreshener rose.jpg', '2020-02-29 04:12:00', '2020-02-29 04:12:00'),
(208, 170, '1582971173fay narcissus. jpeg.jpg', '2020-02-29 04:12:53', '2020-02-29 04:12:53'),
(209, 171, '1582971219fay lily.jpg', '2020-02-29 04:13:39', '2020-02-29 04:13:39'),
(210, 172, '1582971294Godrej Aer pocket Bundle.jpg', '2020-02-29 04:14:54', '2020-02-29 04:14:54'),
(211, 173, '1582971390Aer Room Freshener & 2 Aer Pocket Combo.jpg', '2020-02-29 04:16:30', '2020-02-29 04:16:30'),
(212, 174, '1582971449Godrej aer cool room spray.jpg', '2020-02-29 04:17:29', '2020-02-29 04:17:29'),
(213, 175, '1582971511Godrej Aer fresh green room spray.jpg', '2020-02-29 04:18:31', '2020-02-29 04:18:31'),
(214, 176, '1582971634Godrej aer Cool surf Blue click gel AC vent car freshener.jpg', '2020-02-29 04:20:34', '2020-02-29 04:20:34'),
(215, 177, '1582971699Godrej aer Cool Twist  surf Blue 45gm  car dashboard freshener.jpg', '2020-02-29 04:21:39', '2020-02-29 04:21:39'),
(216, 178, '1582971782Odonil natural Air freshener Lavender Meadows.jpg', '2020-02-29 04:23:02', '2020-02-29 04:23:02'),
(217, 179, '1582971829Odonil natural Air freshener jasmine mist.jpg', '2020-02-29 04:23:49', '2020-02-29 04:23:49'),
(219, 182, '1582972717Odonil natural Air freshener Mystic Rose.jpg', '2020-02-29 04:38:37', '2020-02-29 04:38:37'),
(220, 183, '1582972781Odonil natural Air freshener Mystic Rose.jpg', '2020-02-29 04:39:42', '2020-02-29 04:39:42'),
(221, 184, '1582972835Dettol All in one Air freshener jasmin.jpg', '2020-02-29 04:40:35', '2020-02-29 04:40:35'),
(222, 185, '1582972875Dettol All in one Air freshener Spiring.jpg', '2020-02-29 04:41:15', '2020-02-29 04:41:15'),
(223, 186, '1582983673Vim diswashing bar.jpg', '2020-02-29 07:41:13', '2020-02-29 07:41:13'),
(224, 187, '1582983730Vim diswashing bar.jpg', '2020-02-29 07:42:10', '2020-02-29 07:42:10'),
(225, 188, '1582983897Vim Dishwashing Liquid.jpg', '2020-02-29 07:44:57', '2020-02-29 07:44:57'),
(226, 189, '1582983938Vim Dishwashing Liquid.jpg', '2020-02-29 07:45:38', '2020-02-29 07:45:38'),
(227, 190, '1582983996VIM Dishwashing Powder.jpg', '2020-02-29 07:46:36', '2020-02-29 07:46:36'),
(228, 191, '1582984212Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance.jpg', '2020-02-29 07:50:12', '2020-02-29 07:50:12'),
(229, 192, '1582984273Trix Monthly Pack.jpg', '2020-02-29 07:51:13', '2020-02-29 07:51:13'),
(230, 193, '1582984333Trix Lemon Dish Washing Liquid Lemon Refill Pack.jpg', '2020-02-29 07:52:13', '2020-02-29 07:52:13'),
(232, 195, '1583143736harpic toilet.jpg', '2020-03-02 04:08:56', '2020-03-02 04:08:56'),
(233, 196, '1583143790harpic toilet.jpg', '2020-03-02 04:09:50', '2020-03-02 04:09:50'),
(234, 197, '1583143849Harpic Bathroom Cleaning Powder Original.jpg', '2020-03-02 04:10:49', '2020-03-02 04:10:49'),
(235, 198, '1583143895Harpic Toilet Cleaning Powder.jpg', '2020-03-02 04:11:35', '2020-03-02 04:11:35'),
(236, 199, '1583143936Harpic Toilet Cleaning Powder.jpg', '2020-03-02 04:12:16', '2020-03-02 04:12:16'),
(237, 194, '1583144022Rok.jpg', '2020-03-02 04:13:42', '2020-03-02 04:13:42'),
(238, 200, '1583144091Lizol Floor Cleaner Lavender Disinfectant Surface.jpg', '2020-03-02 04:14:51', '2020-03-02 04:14:51'),
(239, 201, '1583144193Lizol Floor Cleaner Floral Disinfectant Surface.jpg', '2020-03-02 04:16:33', '2020-03-02 04:16:33'),
(240, 202, '1583144272Lizol Floor Cleaner Floral Disinfectant Surface.jpg', '2020-03-02 04:17:52', '2020-03-02 04:17:52'),
(241, 203, '1583144370Lizol Floor Cleaner Citrus Disinfectant Surface.jpg', '2020-03-02 04:19:30', '2020-03-02 04:19:30'),
(242, 204, '1583144423Lizol Floor Cleaner Citrus Disinfectant Surface.jpg', '2020-03-02 04:20:23', '2020-03-02 04:20:23'),
(243, 205, '1583144493Lizol Floor Cleaner Lavender Disinfectant Surface.jpg', '2020-03-02 04:21:33', '2020-03-02 04:21:33'),
(244, 206, '1583144568RokSol Tiles & Bathroom Cleaner.jpg', '2020-03-02 04:22:49', '2020-03-02 04:22:49'),
(245, 207, '1583144623Rok Floor Cleaner (Lemon).jpg', '2020-03-02 04:23:43', '2020-03-02 04:23:43'),
(246, 208, '1583144719Rok Citrus Floor Cleaner.jpg', '2020-03-02 04:25:19', '2020-03-02 04:25:19'),
(247, 209, '1583145031Rok Glasso Glass Cleaner.jpg', '2020-03-02 04:30:31', '2020-03-02 04:30:31'),
(248, 210, '1583145090Rok Glasso Glass Cleaner.jpg', '2020-03-02 04:31:30', '2020-03-02 04:31:30'),
(249, 211, '1583146195Rok Glasso Glass Cleaner,.jpg', '2020-03-02 04:49:55', '2020-03-02 04:49:55'),
(250, 212, '1583146238rok bleaching powder,.jpg', '2020-03-02 04:50:38', '2020-03-02 04:50:38'),
(251, 213, '1583146296rok phinayel.jpg', '2020-03-02 04:51:36', '2020-03-02 04:51:36'),
(252, 214, '1583146628Mr.Brasso Glass & Household Cleaner Refill.jpg', '2020-03-02 04:57:08', '2020-03-02 04:57:08'),
(253, 215, '1583146680Mr.Brasso Glass & Household Cleaner Spray.jpg', '2020-03-02 04:58:00', '2020-03-02 04:58:00'),
(254, 216, '1583146739Shakti Liquid Toilet Cleaner.jpg', '2020-03-02 04:58:59', '2020-03-02 04:58:59'),
(255, 217, '1583146800fixol finish.jpeg', '2020-03-02 05:00:00', '2020-03-02 05:00:00'),
(256, 218, '1583146862Dettol Handwash Pump Re-energize.jpg', '2020-03-02 05:01:02', '2020-03-02 05:01:02'),
(257, 219, '1583146924Dettol Handwash Pump Skincare.jpg', '2020-03-02 05:02:04', '2020-03-02 05:02:04'),
(258, 220, '1583146973Dettol Handwash Pump Cool.jpg', '2020-03-02 05:02:53', '2020-03-02 05:02:53'),
(259, 221, '1583147034Dettol Handwash Refill Poly Cool.jpg', '2020-03-02 05:03:54', '2020-03-02 05:03:54'),
(260, 222, '1583147091Dettol Handwash pump Gold.png', '2020-03-02 05:04:51', '2020-03-02 05:04:51'),
(261, 223, '1583147261Dettol Handwash pump gold Refill pack.jpg', '2020-03-02 05:07:41', '2020-03-02 05:07:41'),
(262, 224, '1583147524Dettol Handwash  Refill Sensitive.jpeg', '2020-03-02 05:12:04', '2020-03-02 05:12:04'),
(263, 225, '1583147579Dettol Handwash Refill Poly Re-energize.jpg', '2020-03-02 05:12:59', '2020-03-02 05:12:59'),
(264, 226, '1583147653Dettol Anticeptic Liquid. 50 ml.jpg', '2020-03-02 05:14:13', '2020-03-02 05:14:13'),
(265, 227, '1583147709Dettol Anticeptic Liquid.jpg', '2020-03-02 05:15:09', '2020-03-02 05:15:09'),
(266, 228, '1583147759Dettol Anticeptic Liquid. 50 ml.jpg', '2020-03-02 05:15:59', '2020-03-02 05:15:59'),
(267, 229, '1583147871Dettol Handwash Refill Poly Original.jpg', '2020-03-02 05:17:51', '2020-03-02 05:17:51'),
(268, 230, '1583147934Dettol Handwash Pump Sensitive.jpg', '2020-03-02 05:18:54', '2020-03-02 05:18:54'),
(269, 231, '1583154047Savlon Liquid. 112.jpg', '2020-03-02 07:00:47', '2020-03-02 07:00:47'),
(270, 232, '1583154117Savlon Liquid. 112.jpg', '2020-03-02 07:01:57', '2020-03-02 07:01:57'),
(271, 233, '1583154182Savlon Liquid .500.png', '2020-03-02 07:03:02', '2020-03-02 07:03:02'),
(272, 234, '1583154770Savlon Antiseptic Cream. 30 gm.jpg', '2020-03-02 07:12:50', '2020-03-02 07:12:50'),
(273, 235, '1583154911Savlon Antiseptic Cream. 30 gm.jpg', '2020-03-02 07:15:11', '2020-03-02 07:15:11'),
(274, 236, '1583155098savlon aloe vera.jpeg', '2020-03-02 07:18:18', '2020-03-02 07:18:18'),
(275, 237, '1583155589savlon aloe vera.jpeg', '2020-03-02 07:26:29', '2020-03-02 07:26:29'),
(276, 238, '1583155775Savlon Ocean Blue Antiseptic Handwash.jpg', '2020-03-02 07:29:35', '2020-03-02 07:29:35'),
(277, 239, '1583155912Savlon Ocean Blue Antiseptic Hand Wash (Refill).jpg', '2020-03-02 07:31:53', '2020-03-02 07:31:53'),
(278, 240, '1583155973Savlon Instant Hand Sanitizer.png', '2020-03-02 07:32:53', '2020-03-02 07:32:53'),
(279, 241, '1583156042Savlon Cool Antiseptic Soap.jpg', '2020-03-02 07:34:02', '2020-03-02 07:34:02'),
(280, 242, '1583156324Lifebuoy Handwash Total Refill.jpg', '2020-03-02 07:38:44', '2020-03-02 07:38:44'),
(281, 243, '1583156371Lifebuoy Handwash Care Refill.jpeg', '2020-03-02 07:39:31', '2020-03-02 07:39:31'),
(282, 244, '1583156456Lifebuoy Handwash Total Pump.png', '2020-03-02 07:40:56', '2020-03-02 07:40:56'),
(283, 245, '1583156519Lifebuoy Handwash Lemon Fresh Pump.jpg', '2020-03-02 07:41:59', '2020-03-02 07:41:59'),
(284, 246, '1583156806Lifebuoy Handwash Lemon Fresh Refill.jpg', '2020-03-02 07:46:46', '2020-03-02 07:46:46'),
(285, 247, '1583156867Lifebuoy Handwash Care Pump.jpg', '2020-03-02 07:47:47', '2020-03-02 07:47:47'),
(286, 248, '1583160563Bashundhara Toilet Tissue (17X 4pcs).jpg', '2020-03-02 08:49:23', '2020-03-02 08:49:23'),
(287, 249, '1583160672Bashundhara Gold Toilet Tissue (25X2pcs).jpeg', '2020-03-02 08:51:12', '2020-03-02 08:51:12'),
(288, 250, '1583160744Bashundhara Facial Tissue  150x2.jpg', '2020-03-02 08:52:24', '2020-03-02 08:52:24'),
(289, 251, '1583160883Bashundhara Facial Tissue 120x2.jpg', '2020-03-02 08:54:43', '2020-03-02 08:54:43'),
(290, 252, '1583161066Bashundhara Paper Napkins 13 Unscented.jpg', '2020-03-02 08:57:46', '2020-03-02 08:57:46'),
(291, 253, '1583161125Bashundhara Kitchen Towel 2 Rolls.jpg', '2020-03-02 08:58:46', '2020-03-02 08:58:46'),
(292, 254, '1583161182Bashundhara Hand Towel 1 ply.jpg', '2020-03-02 08:59:42', '2020-03-02 08:59:42'),
(293, 255, '1583214657Fresh Perfumed Facial Tissue (150 X 2) ply Box.jpg', '2020-03-02 23:50:58', '2020-03-02 23:50:58'),
(294, 256, '1583214721Fresh Perfumed Facial Tissue  (120 X 2) ply Box.jpg', '2020-03-02 23:52:01', '2020-03-02 23:52:01'),
(295, 257, '1583214801Fresh Paper Napkins 13 Perfumed (100X1 Ply).jpg', '2020-03-02 23:53:21', '2020-03-02 23:53:21'),
(296, 258, '1583214953Fresh Toilet Tissue (Family Value Pack).jpg', '2020-03-02 23:55:53', '2020-03-02 23:55:53'),
(297, 259, '1583215040Fresh Hand Towel (250X1 Ply).jpg', '2020-03-02 23:57:20', '2020-03-02 23:57:20'),
(298, 260, '1583215133Fresh kitchen Towel Roll 2 rolls.jpeg', '2020-03-02 23:58:53', '2020-03-02 23:58:53'),
(299, 261, '1583215226Fresh White Wallet Tissue (10X2 Ply).jpg', '2020-03-03 00:00:26', '2020-03-03 00:00:26'),
(300, 262, '1583389375Sunsilk Shampoo Hijab Recharge.jpg', '2020-03-05 00:22:57', '2020-03-05 00:22:57'),
(301, 263, '1583557510Surf Excel Powder Matic Front.jpg', '2020-03-06 23:05:11', '2020-03-06 23:05:11'),
(302, 264, '1583557609Surf Excel Matic Liquid Detergent Front Load.jpg', '2020-03-06 23:06:49', '2020-03-06 23:06:49'),
(303, 265, '1583557936Chamak Fabric Brightner.jpg', '2020-03-06 23:12:16', '2020-03-06 23:12:16'),
(304, 266, '1583558114Chaka Advanced Ball soap.jpg', '2020-03-06 23:15:14', '2020-03-06 23:15:14'),
(305, 267, '1583558169Chaka Advanced Lemon washing powder.jpg', '2020-03-06 23:16:09', '2020-03-06 23:16:09'),
(306, 268, '1583558219Godrej Good Knight Power Activ + Cartridge.jpg', '2020-03-06 23:16:59', '2020-03-06 23:16:59'),
(307, 269, '1583558224Chaka Super White Washing Powder.jpg', '2020-03-06 23:17:04', '2020-03-06 23:17:04'),
(308, 270, '1583558293Keya glycerine Laundry soap.jpg', '2020-03-06 23:18:13', '2020-03-06 23:18:13'),
(309, 271, '1583558296Godrej Good Knight Xpress System Liquid Vapouriser Cartridge.png', '2020-03-06 23:18:16', '2020-03-06 23:18:16'),
(310, 272, '1583558367ACI Smart Laundry Soap.jpg', '2020-03-06 23:19:27', '2020-03-06 23:19:27'),
(311, 273, '1583558416ACI Smart Washing Powder.jpg', '2020-03-06 23:20:16', '2020-03-06 23:20:16'),
(312, 274, '1583558441Godrej Good Knight Power Active (Dual Power) Machine + Refill.jpg', '2020-03-06 23:20:41', '2020-03-06 23:20:41'),
(313, 275, '1583558461ACI Smart Supreme Washing Powder.jpg', '2020-03-06 23:21:01', '2020-03-06 23:21:01'),
(314, 276, '1583558546Godrej Good Knight Advanced Xpress Coil.jpg', '2020-03-06 23:22:26', '2020-03-06 23:22:26'),
(315, 277, '1583558654Godrej Hit Lime Mosquitoes & Flies Spray.jpg', '2020-03-06 23:24:14', '2020-03-06 23:24:14'),
(316, 278, '1583558717Godrej New Hit Mosquitoes Spray.jpg', '2020-03-06 23:25:17', '2020-03-06 23:25:17'),
(317, 279, '1583558746Tide Detergent Powder Jasmine&Rose.jpg', '2020-03-06 23:25:46', '2020-03-06 23:25:46'),
(318, 280, '1583558775Godrej New Hit Cockroaches Spray.jpg', '2020-03-06 23:26:15', '2020-03-06 23:26:15'),
(319, 281, '1583558907Godrej Good Knight Xpress Liquid Vapouriser Machine & Refill.jpg', '2020-03-06 23:28:27', '2020-03-06 23:28:27'),
(320, 282, '1583559001Godrej New Hit Anti Roach Gel 45 Days.jpg', '2020-03-06 23:30:01', '2020-03-06 23:30:01'),
(321, 283, '1583559187Godrej Good Knight Mosquito Fabric Roll On.jpg', '2020-03-06 23:33:07', '2020-03-06 23:33:07'),
(322, 284, '1583559980ACI Aerosol Insect Spray Jumbo 800.jpg', '2020-03-06 23:46:20', '2020-03-06 23:46:20'),
(323, 285, '1583560072ACI Aerosol Insect Spray 450, 125 ml.jpg', '2020-03-06 23:47:52', '2020-03-06 23:47:52'),
(324, 286, '1583560182ACI All Out Ultra Mosquito Liquid Vaporizer Refill.jpeg', '2020-03-06 23:49:42', '2020-03-06 23:49:42'),
(325, 287, '1583560308Xpel Aerosol.jpeg', '2020-03-06 23:51:48', '2020-03-06 23:51:48'),
(326, 288, '1583560360Sunsilk Shampoo Hijab Recharge.jpg', '2020-03-06 23:52:40', '2020-03-06 23:52:40'),
(327, 289, '1583560836Sunsilk Shampoo Hijab Anti-Breakage.jpg', '2020-03-07 00:00:36', '2020-03-07 00:00:36'),
(328, 290, '1583560891Sunsilk Shampoo Hijab Anti-Breakage.jpg', '2020-03-07 00:01:31', '2020-03-07 00:01:31'),
(329, 291, '1583561071Sunsilk Shampoo Hijab Anti Dandruff.jpg', '2020-03-07 00:04:31', '2020-03-07 00:04:31'),
(330, 292, '1583561124Sunsilk Shampoo Lusciously Thick & Long.jpg', '2020-03-07 00:05:24', '2020-03-07 00:05:24'),
(331, 293, '1583561163Sunsilk Shampoo Lusciously Thick & Long.jpg', '2020-03-07 00:06:03', '2020-03-07 00:06:03'),
(332, 294, '1583561238Sunsilk Shampoo Perfect Straight.jpg', '2020-03-07 00:07:18', '2020-03-07 00:07:18'),
(333, 295, '1583561276Sunsilk Shampoo Perfect Straight.jpg', '2020-03-07 00:07:56', '2020-03-07 00:07:56'),
(334, 296, '1583561349Sunsilk Conditioner Perfect Straight.jpg', '2020-03-07 00:09:09', '2020-03-07 00:09:09'),
(335, 297, '1583561655Sunsilk Shampoo Stunning Black Shine.jpg', '2020-03-07 00:14:15', '2020-03-07 00:14:15'),
(336, 298, '1583561694Sunsilk Shampoo Stunning Black Shine.jpg', '2020-03-07 00:14:54', '2020-03-07 00:14:54'),
(338, 301, '1583561923Sunsilk Shampoo Hair Fall Solution.jpg', '2020-03-07 00:18:43', '2020-03-07 00:18:43'),
(339, 302, '1583562004Sunsilk Shampoo Hair Fall Solution.jpg', '2020-03-07 00:20:04', '2020-03-07 00:20:04'),
(340, 303, '1583562056Sunsilk Shampoo Healthy Growth.jpg', '2020-03-07 00:20:56', '2020-03-07 00:20:56'),
(341, 304, '1583562094Sunsilk Shampoo Healthy Growth.jpg', '2020-03-07 00:21:34', '2020-03-07 00:21:34'),
(342, 305, '1583562191Sunsilk Co Creations Soft & Smooth Shampoo.jpg', '2020-03-07 00:23:11', '2020-03-07 00:23:11'),
(343, 306, '1583562199Finis Insect Powder.jpeg', '2020-03-07 00:23:19', '2020-03-07 00:23:19'),
(344, 307, '1583562367Sunsilk Co Creations Perfect Straight Shampoo.jpg', '2020-03-07 00:26:07', '2020-03-07 00:26:07'),
(345, 300, '1583562386Odomos Mosquito Repellent Cream.jpg', '2020-03-07 00:26:26', '2020-03-07 00:26:26'),
(346, 299, '1583562445Finis Insect Powder.jpeg', '2020-03-07 00:27:25', '2020-03-07 00:27:25'),
(347, 308, '1583562452Sunsilk Lively Clean & Fresh Shampoo.jpg', '2020-03-07 00:27:32', '2020-03-07 00:27:32'),
(348, 309, '1583562501Tresemme Conditioner Keratin Smooth.jpg', '2020-03-07 00:28:21', '2020-03-07 00:28:21'),
(350, 311, '1583562604TRESemmé Shampoo Botanique Nourish & Replenish.jpg', '2020-03-07 00:30:04', '2020-03-07 00:30:04'),
(351, 312, '1583562622Naphthalene Ball.jpeg', '2020-03-07 00:30:22', '2020-03-07 00:30:22'),
(352, 313, '1583562666Tresemme Hair Fall Defense Shampoo.jpg', '2020-03-07 00:31:06', '2020-03-07 00:31:06'),
(353, 314, '1583562705Tresemme Hair Fall Defense Shampoo.jpg', '2020-03-07 00:31:45', '2020-03-07 00:31:45'),
(354, 315, '1583562846Tresemme Shampoo Keratin Smooth.jpg', '2020-03-07 00:34:06', '2020-03-07 00:34:06'),
(355, 316, '1583562884Tresemme Shampoo Keratin Smooth.jpg', '2020-03-07 00:34:44', '2020-03-07 00:34:44'),
(356, 317, '1583563176Clear Shampoo Anti Hairfall Anti Dandruff.jpg', '2020-03-07 00:39:36', '2020-03-07 00:39:36'),
(357, 318, '1583563211Clear Shampoo Anti Hairfall Anti Dandruff.jpg', '2020-03-07 00:40:12', '2020-03-07 00:40:12'),
(358, 319, '1583563915Clear Men Anti Dandruff Shampoo.jpg', '2020-03-07 00:51:55', '2020-03-07 00:51:55'),
(359, 320, '1583563956Clear Men Anti Dandruff Shampoo.jpg', '2020-03-07 00:52:36', '2020-03-07 00:52:36'),
(360, 321, '1583564040Clear Shampoo Men Cool Sport Menthol Anti  Dandruff.jpg', '2020-03-07 00:54:00', '2020-03-07 00:54:00'),
(361, 322, '1583564278Clear Shampoo Men Cool Sport Menthol Anti  Dandruff.jpg', '2020-03-07 00:57:58', '2020-03-07 00:57:58'),
(362, 323, '1583564393Clear Complete Active Care Shampoo.jpg', '2020-03-07 00:59:53', '2020-03-07 00:59:53'),
(363, 324, '1583564434Clear Complete Active Care Shampoo.jpg', '2020-03-07 01:00:34', '2020-03-07 01:00:34'),
(364, 325, '1583564488Clear Anti Hairfall Shampoo.jpg', '2020-03-07 01:01:28', '2020-03-07 01:01:28'),
(365, 326, '1583564763Head & Shoulders Anti-Hairfall Shampoo.jpg', '2020-03-07 01:06:03', '2020-03-07 01:06:03'),
(366, 327, '1583564810Head & Shoulders Anti-Hairfall Shampoo.jpg', '2020-03-07 01:06:50', '2020-03-07 01:06:50'),
(367, 328, '1583564938Head & Shoulders Smooth & Silky Shampoo.jpg', '2020-03-07 01:08:58', '2020-03-07 01:08:58'),
(368, 329, '1583564994Head & Shoulders Smooth & Silky Shampoo.jpg', '2020-03-07 01:09:54', '2020-03-07 01:09:54'),
(369, 330, '1583565208Head & Shoulders Clean & Balanced Shampoo.jpg', '2020-03-07 01:13:28', '2020-03-07 01:13:28'),
(370, 331, '1583565244Head & Shoulders Clean & Balanced Shampoo.jpg', '2020-03-07 01:14:04', '2020-03-07 01:14:04'),
(371, 332, '1583565316Head & Shoulders Cool Menthol Shampoo.jpg', '2020-03-07 01:15:16', '2020-03-07 01:15:16'),
(372, 333, '1583565363Head & Shoulders Cool Menthol Shampoo.jpg', '2020-03-07 01:16:03', '2020-03-07 01:16:03'),
(373, 334, '1583565422Head & Shoulders Cool Menthol Shampoo.jpg', '2020-03-07 01:17:02', '2020-03-07 01:17:02'),
(374, 335, '1583569445Head & Shoulders Lemon Fresh Shampoo.jpg', '2020-03-07 02:24:05', '2020-03-07 02:24:05'),
(375, 336, '1583569522Head & Shoulders Anti Dandruff Shampoo Sliky Black.jpg', '2020-03-07 02:25:22', '2020-03-07 02:25:22'),
(376, 337, '1583569579Head & Shoulders Smooth & Silky Shampoo.jpg', '2020-03-07 02:26:19', '2020-03-07 02:26:19'),
(377, 338, '1583569636head & Shoulders Smooth & Silky 2in1 Shampoo+Co.jpg', '2020-03-07 02:27:16', '2020-03-07 02:27:16'),
(378, 339, '1583572290Head & Shoulder 2 In 1 Active Protect Shampoo.jpg', '2020-03-07 03:11:30', '2020-03-07 03:11:30'),
(379, 340, '1583572336Head & Shoulder 2 In 1 Active Protect Shampoo.jpg', '2020-03-07 03:12:16', '2020-03-07 03:12:16'),
(380, 341, '1583572385Head & Shoulder Silky Black Shampoo.jpg', '2020-03-07 03:13:05', '2020-03-07 03:13:05'),
(381, 342, '1583572646Dove Beauty Bar White.jpg', '2020-03-07 03:17:27', '2020-03-07 03:17:27'),
(382, 343, '1583572686Dove Beauty Bar White.jpg', '2020-03-07 03:18:06', '2020-03-07 03:18:06'),
(383, 344, '1583572729Dove Beauty Bar Pink.jpg', '2020-03-07 03:18:49', '2020-03-07 03:18:49'),
(384, 345, '1583572766Dove Beauty Bar Pink.jpg', '2020-03-07 03:19:26', '2020-03-07 03:19:26'),
(385, 346, '1583572837Dove Shampoo Hairfall Rescue.jpg', '2020-03-07 03:20:37', '2020-03-07 03:20:37'),
(386, 347, '1583572877Dove Shampoo Hairfall Rescue.jpg', '2020-03-07 03:21:17', '2020-03-07 03:21:17'),
(387, 348, '1583572925Dove Shampoo Hairfall Rescue.jpg', '2020-03-07 03:22:05', '2020-03-07 03:22:05'),
(388, 349, '1583731101Dove Shampoo Oxygen Moisture.jpg', '2020-03-08 23:18:22', '2020-03-08 23:18:22'),
(389, 350, '1583731153Dove Shampoo Environmental Defense.jpg', '2020-03-08 23:19:13', '2020-03-08 23:19:13'),
(390, 351, '1583731203Dove Micellar Water.jpg', '2020-03-08 23:20:03', '2020-03-08 23:20:03'),
(391, 352, '1583731266Dove Conditioner Hairfall Rescue.jpg', '2020-03-08 23:21:06', '2020-03-08 23:21:06'),
(392, 353, '1583731310Dove Conditioner Intense Repair.jpg', '2020-03-08 23:21:50', '2020-03-08 23:21:50'),
(393, 354, '1583731368Dove Shampoo Intense Repair.jpg', '2020-03-08 23:22:48', '2020-03-08 23:22:48'),
(394, 355, '1583731483Dove Shampoo Intense Repair.jpg', '2020-03-08 23:24:43', '2020-03-08 23:24:43'),
(395, 356, '1583731531Dove Shampoo Nourishing Oil Care.jpg', '2020-03-08 23:25:31', '2020-03-08 23:25:31'),
(396, 357, '1583731572Dove Shampoo Nourishing Oil Care.jpg', '2020-03-08 23:26:12', '2020-03-08 23:26:12'),
(397, 358, '1583731620Dove Face Wash Beauty Moisture Facial Cleanser.jpg', '2020-03-08 23:27:01', '2020-03-08 23:27:01'),
(398, 359, '1583731665Dove Face Wash Beauty Moisture.jpg', '2020-03-08 23:27:45', '2020-03-08 23:27:45'),
(399, 360, '1583731740Dove Shampoo Healthy Growth.jpg', '2020-03-08 23:29:00', '2020-03-08 23:29:00'),
(400, 361, '1583731801Dove Shampoo Healthy Growth.jpg', '2020-03-08 23:30:01', '2020-03-08 23:30:01'),
(401, 362, '1583731848Dove Baby Rich Moisture Lotion.jpg', '2020-03-08 23:30:48', '2020-03-08 23:30:48'),
(402, 363, '1583731915Dove Beauty Cream.jpg', '2020-03-08 23:31:55', '2020-03-08 23:31:55'),
(403, 364, '1583731961Dove Baby Sensitive Moisture Lotion.jpg', '2020-03-08 23:32:41', '2020-03-08 23:32:41'),
(404, 365, '1583732020Dove Go Fresh Roll On.jpg', '2020-03-08 23:33:40', '2020-03-08 23:33:40'),
(405, 366, '1583732083Dove Men Shampoo Thick & Strong.jpg', '2020-03-08 23:34:43', '2020-03-08 23:34:43'),
(406, 367, '1583732161Dove Intensive Body Lotion.jpg', '2020-03-08 23:36:01', '2020-03-08 23:36:01'),
(407, 368, '1583732209Dove Caring Cucumber & Green Tea Scent Hand wash.jpg', '2020-03-08 23:36:49', '2020-03-08 23:36:49'),
(408, 369, '1583732341Dove Caring Cucumber & Green Tea Scent Hand wash.jpg', '2020-03-08 23:39:01', '2020-03-08 23:39:01'),
(409, 370, '1583732511Dove Caring Fine Silk Hand wash.jpg', '2020-03-08 23:41:51', '2020-03-08 23:41:51'),
(410, 371, '1583733214Dove Intensive Cream.jpg', '2020-03-08 23:53:34', '2020-03-08 23:53:34'),
(411, 372, '1583733346Kumarika Long & Black Shampoo.jpg', '2020-03-08 23:55:46', '2020-03-08 23:55:46'),
(412, 373, '1583733394Kumarika Soft & Shine Shampoo.jpg', '2020-03-08 23:56:34', '2020-03-08 23:56:34'),
(413, 374, '1583733434Kumarika Thick & Strong Shampoo.jpg', '2020-03-08 23:57:14', '2020-03-08 23:57:14'),
(414, 375, '1583733568Pantene Lively Clean Shampoo.jpg', '2020-03-08 23:59:28', '2020-03-08 23:59:28'),
(415, 376, '1583734190Pantene Long Black Shampoo.jpg', '2020-03-09 00:09:51', '2020-03-09 00:09:51'),
(416, 377, '1583734248Pantene Silky Smooth Care Shampoo.jpg', '2020-03-09 00:10:48', '2020-03-09 00:10:48'),
(417, 378, '1583734503Clinic Plus Strong & Long Shampoo.jpg', '2020-03-09 00:15:03', '2020-03-09 00:15:03'),
(418, 379, '1583734544Clinique Shampoo Strong and Long.jpg', '2020-03-09 00:15:44', '2020-03-09 00:15:44'),
(419, 380, '1583734824Himalaya Anti Dandruff Shampoo.jpg', '2020-03-09 00:20:24', '2020-03-09 00:20:24'),
(420, 381, '1583735100Xpel Hair Care Banana Conditioner.jpg', '2020-03-09 00:25:00', '2020-03-09 00:25:00'),
(421, 382, '1583735489Lever Ayush Shampoo Thick & Long Growth Shikakai.jpg', '2020-03-09 00:31:29', '2020-03-09 00:31:29'),
(422, 383, '1583735840L\'oreal Elvive Total Repair 5 Shampoo.jpg', '2020-03-09 00:37:20', '2020-03-09 00:37:20'),
(423, 384, '1583735886L\'oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner).jpg', '2020-03-09 00:38:06', '2020-03-09 00:38:06'),
(424, 385, '1583746667Lux Soap Bar Soft Touch.jpg', '2020-03-09 03:37:48', '2020-03-09 03:37:48'),
(425, 386, '1583746708Lux Soap Bar Soft Touch.jpg', '2020-03-09 03:38:28', '2020-03-09 03:38:28'),
(426, 387, '1583746753Lux Soap Bar Velvet Touch.jpg', '2020-03-09 03:39:14', '2020-03-09 03:39:14'),
(427, 388, '1583746804Lux Soap Bar Velvet Touch.jpg', '2020-03-09 03:40:04', '2020-03-09 03:40:04'),
(428, 389, '1583746841Lux Soap Bar Velvet Touch.jpg', '2020-03-09 03:40:41', '2020-03-09 03:40:41'),
(429, 390, '1583746886Lux Soap Bar Fresh Splash.jpg', '2020-03-09 03:41:26', '2020-03-09 03:41:26'),
(430, 391, '1583746930Lux Soap Bar Hypnotic Rose.jpg', '2020-03-09 03:42:10', '2020-03-09 03:42:10'),
(431, 392, '1583746974Lux Body Wash White Impress.jpg', '2020-03-09 03:42:54', '2020-03-09 03:42:54'),
(432, 393, '1583747017Lux Soap Bar Sensuous Sandal.jpg', '2020-03-09 03:43:37', '2020-03-09 03:43:37'),
(433, 394, '1583747073Dove Micellar Water.jpg', '2020-03-09 03:44:33', '2020-03-09 03:44:33'),
(434, 395, '1583747275Lifebuoy Soap Silver Shield Formula 100 gm.jpg', '2020-03-09 03:47:55', '2020-03-09 03:47:55'),
(435, 396, '1583747323Lifebuoy Soap Bar Total.jpg', '2020-03-09 03:48:43', '2020-03-09 03:48:43'),
(436, 397, '1583747364Lifebuoy Soap Bar Care.jpg', '2020-03-09 03:49:24', '2020-03-09 03:49:24'),
(437, 398, '1583747397Lifebuoy Soap Bar Care.jpg', '2020-03-09 03:49:57', '2020-03-09 03:49:57'),
(438, 399, '1583747454Lifebuoy Soap Bar Neem.jpg', '2020-03-09 03:50:54', '2020-03-09 03:50:54'),
(439, 400, '1583747591Lifebuoy Bar Soap Attar Protect.jpg', '2020-03-09 03:53:11', '2020-03-09 03:53:11'),
(440, 401, '1583747765Dettol Soap Cool Bathing Bar.jpg', '2020-03-09 03:56:05', '2020-03-09 03:56:05'),
(441, 402, '1583747802Dettol Soap Original Bathing Bar Soap.jpg', '2020-03-09 03:56:42', '2020-03-09 03:56:42'),
(442, 403, '1583747865Dettol Soap Original Bathing Bar Soap.jpg', '2020-03-09 03:57:45', '2020-03-09 03:57:45'),
(443, 404, '1583747908Dettol Bathing Bar Soap Skincare.jpg', '2020-03-09 03:58:28', '2020-03-09 03:58:28'),
(444, 405, '1583748373Nivea Sea Minerals Fresh Shower Gel.jpg', '2020-03-09 04:06:13', '2020-03-09 04:06:13'),
(445, 406, '1583748424Nivea Care & Roses Body Wash.jpg', '2020-03-09 04:07:04', '2020-03-09 04:07:04'),
(446, 407, '1583748472Nivea Care & Coconut Body Wash.jpg', '2020-03-09 04:07:52', '2020-03-09 04:07:52'),
(447, 408, '1583748513Nivea Men Cool Kick Shower Gel.jpg', '2020-03-09 04:08:33', '2020-03-09 04:08:33'),
(448, 409, '1583748689Fresh Start Shower Gel Mint & Cucumber.jpg', '2020-03-09 04:11:29', '2020-03-09 04:11:29'),
(449, 410, '1583748728Fresh Start Shower Gel Cococut & Lime.jpg', '2020-03-09 04:12:08', '2020-03-09 04:12:08'),
(450, 411, '1583748758Xpel Fresh Start Shower Gel Tea Tree & Lemon.jpg', '2020-03-09 04:12:38', '2020-03-09 04:12:38'),
(451, 412, '1583748809Meril Milk & Bely Soap.jpg', '2020-03-09 04:13:29', '2020-03-09 04:13:29'),
(452, 413, '1583749521Meril Milk Soap Bar.jpg', '2020-03-09 04:25:21', '2020-03-09 04:25:21'),
(453, 414, '1583749554Meril Milk & Pomegranate Soap.jpg', '2020-03-09 04:25:54', '2020-03-09 04:25:54'),
(454, 415, '1583749606Meril Baby Mild Honey Soap.jpg', '2020-03-09 04:26:46', '2020-03-09 04:26:46'),
(455, 416, '1583750173ACI Savlon Fresh Soap.jpg', '2020-03-09 04:36:13', '2020-03-09 04:36:13'),
(456, 417, '1583750210ACI Savlon Active Antiseptic Soap.jpg', '2020-03-09 04:36:50', '2020-03-09 04:36:50'),
(457, 418, '1583750242ACI Savlon Mild Antiseptic Soap.jpg', '2020-03-09 04:37:22', '2020-03-09 04:37:22'),
(458, 419, '1583750272ACI Neem Original Honey & Turmeric Soap.jpg', '2020-03-09 04:37:52', '2020-03-09 04:37:52'),
(459, 420, '1583750383Savlon Sensitive Soap.jpg', '2020-03-09 04:39:43', '2020-03-09 04:39:43'),
(460, 421, '1583750417Savlon Cool Soap.jpg', '2020-03-09 04:40:17', '2020-03-09 04:40:17'),
(461, 422, '1583750673Lever Ayush Soap Bar Natural Fair Saffron.jpg', '2020-03-09 04:44:33', '2020-03-09 04:44:33'),
(462, 423, '1583750710Lever Ayush Soap Bar Natural Purifying Turmeric.jpg', '2020-03-09 04:45:10', '2020-03-09 04:45:10'),
(463, 424, '1583750821Sandalina Sandal & Rose Soap.jpg', '2020-03-09 04:47:01', '2020-03-09 04:47:01'),
(464, 425, '1583754293Nivea Intensive Moisture Body Milk.jpg', '2020-03-09 05:44:54', '2020-03-09 05:44:54'),
(465, 426, '1583754336Nivea Soft Crème.jpg', '2020-03-09 05:45:36', '2020-03-09 05:45:36'),
(466, 427, '1583754379Nivea Soft Crème.jpg', '2020-03-09 05:46:19', '2020-03-09 05:46:19'),
(467, 428, '1583754417Nivea Express Hydration Body Lotion.jpg', '2020-03-09 05:46:57', '2020-03-09 05:46:57'),
(468, 429, '1583754457Nivea Light Moisturising & Cleansing Lotion.jpg', '2020-03-09 05:47:37', '2020-03-09 05:47:37'),
(469, 430, '1583754491Nivea Extra Rich Moisturising Lotion.jpg', '2020-03-09 05:48:11', '2020-03-09 05:48:11'),
(470, 431, '1583754540Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf).jpg', '2020-03-09 05:49:00', '2020-03-09 05:49:00'),
(471, 432, '1583754582Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf).jpg', '2020-03-09 05:49:42', '2020-03-09 05:49:42'),
(472, 433, '1583755281Fair And Lovely Advanced Multivitamin Body Fairness Milk.jpg', '2020-03-09 06:01:21', '2020-03-09 06:01:21'),
(473, 434, '1583755324Fair And Lovely Face Cream Blemish Balm.jpg', '2020-03-09 06:02:04', '2020-03-09 06:02:04'),
(474, 435, '1583755361Fair And Lovely Face Cream Blemish Balm.jpg', '2020-03-09 06:02:42', '2020-03-09 06:02:42'),
(475, 436, '1583755586Fair And Lovely Fairness Cream Ayurvedic Care.jpg', '2020-03-09 06:06:26', '2020-03-09 06:06:26'),
(476, 437, '1583755661Fair And Lovely Fairness Cream Winter.jpg', '2020-03-09 06:07:41', '2020-03-09 06:07:41'),
(477, 438, '1583755707Fair & Lovely Multivitamin Cream.jpg', '2020-03-09 06:08:27', '2020-03-09 06:08:27'),
(478, 439, '1583755814Fair And Lovely Advanced Multivitamin Body Fairness Milk.jpg', '2020-03-09 06:10:14', '2020-03-09 06:10:14'),
(479, 440, '1583756298Fair And Lovely Face Cream Blemish Balm.jpg', '2020-03-09 06:18:18', '2020-03-09 06:18:18'),
(480, 441, '1583756363Fair And Lovely Fairness Cream Advanced Multivitamin.jpg', '2020-03-09 06:19:23', '2020-03-09 06:19:23'),
(481, 442, '1583756404Fair And Lovely Fairness Cream Winter.jpg', '2020-03-09 06:20:04', '2020-03-09 06:20:04'),
(482, 443, '1583756482Mens Fair And Lovely Fairness Cream Rapid Action.jpg', '2020-03-09 06:21:22', '2020-03-09 06:21:22'),
(483, 444, '1583756523Mens Fair And Lovely Fairness Cream Rapid Action.jpg', '2020-03-09 06:22:03', '2020-03-09 06:22:03'),
(484, 445, '1583756735Vaseline Lotion Deep Restore.jpg', '2020-03-09 06:25:35', '2020-03-09 06:25:35'),
(485, 446, '1583756770Vaseline Lotion Deep Restore.jpg', '2020-03-09 06:26:10', '2020-03-09 06:26:10'),
(486, 447, '1583756806Vaseline Lotion Deep Restore.jpg', '2020-03-09 06:26:46', '2020-03-09 06:26:46'),
(487, 448, '1583756849Vaseline Lotion Healthy White.jpg', '2020-03-09 06:27:29', '2020-03-09 06:27:29'),
(488, 449, '1583756890Vaseline Lotion Healthy White.jpg', '2020-03-09 06:28:10', '2020-03-09 06:28:10'),
(489, 450, '1583756925Vaseline Lotion Healthy White.jpg', '2020-03-09 06:28:45', '2020-03-09 06:28:45'),
(490, 451, '1583816309Vaseline Intensive Care Cocoa Glow Body Lotion.jpg', '2020-03-09 22:58:30', '2020-03-09 22:58:30'),
(491, 452, '1583816343Vaseline Intensive Care Cocoa Radiant Gel Oil.jpg', '2020-03-09 22:59:03', '2020-03-09 22:59:03'),
(492, 453, '1583816470Woman\'s World Whitening Body Lotion.jpg', '2020-03-09 23:01:10', '2020-03-09 23:01:10'),
(493, 454, '1583816718Pond\'s Day Cream White Beauty.jpg', '2020-03-09 23:05:18', '2020-03-09 23:05:18'),
(494, 455, '1583817966Pond\'s Day Cream White Beauty.jpg', '2020-03-09 23:26:06', '2020-03-09 23:26:06'),
(495, 456, '1583818139Pond\'s Day Cream White Beauty.jpg', '2020-03-09 23:28:59', '2020-03-09 23:28:59'),
(496, 457, '1583819070Pond’s Oil Control Vanishing Cream.jpg', '2020-03-09 23:44:30', '2020-03-09 23:44:30'),
(497, 458, '1583819111Ponds Day Cream Age Miracle.jpg', '2020-03-09 23:45:11', '2020-03-09 23:45:11'),
(498, 459, '1583819203Cute Winter Moisturising Cream.jpg', '2020-03-09 23:46:43', '2020-03-09 23:46:43'),
(499, 460, '1583819379Cute Vanishing Cream.jpg', '2020-03-09 23:49:40', '2020-03-09 23:49:40'),
(500, 461, '1583819601Cute Beauty Milk Body Lotion.jpg', '2020-03-09 23:53:21', '2020-03-09 23:53:21'),
(501, 462, '1583819760Boro Plus Antiseptic Cream.jpg', '2020-03-09 23:56:00', '2020-03-09 23:56:00'),
(502, 463, '1583819843Boro Plus Antiseptic Cream.jpg', '2020-03-09 23:57:23', '2020-03-09 23:57:23'),
(503, 464, '1583819880Boro Plus Antiseptic Cream.jpg', '2020-03-09 23:58:00', '2020-03-09 23:58:00'),
(504, 465, '1583819971Boroplus Moisturising Body Lotion Almond.jpg', '2020-03-09 23:59:31', '2020-03-09 23:59:31'),
(505, 466, '1583820009Boroplus Whitening Body Lotion.jpg', '2020-03-10 00:00:09', '2020-03-10 00:00:09'),
(506, 467, '1583820130Boro Plus Perfect Tauch Moisturising Cream.jpg', '2020-03-10 00:02:10', '2020-03-10 00:02:10'),
(507, 468, '1583820257Boroplus Moiturising Lotion Alovera & Millk.jpg', '2020-03-10 00:04:17', '2020-03-10 00:04:17'),
(508, 469, '1583820633Oxy Whitening Cream.jpg', '2020-03-10 00:10:33', '2020-03-10 00:10:33'),
(509, 470, '1583820675Boroline Antiseptic Ayurvedic Cream.jpg', '2020-03-10 00:11:15', '2020-03-10 00:11:15'),
(510, 471, '1583820720Himalaya Clear Complex Whitening Day Cream.jpg', '2020-03-10 00:12:00', '2020-03-10 00:12:00'),
(511, 472, '1583820753Himalaya Revitalizing Night Cream.jpg', '2020-03-10 00:12:33', '2020-03-10 00:12:33'),
(512, 473, '1583820787Himalaya Anti Wrinkle Cream.jpg', '2020-03-10 00:13:07', '2020-03-10 00:13:07'),
(513, 474, '1583820823Revive Moisturizing Lotion.jpg', '2020-03-10 00:13:43', '2020-03-10 00:13:43'),
(514, 475, '1583824079Pond\'s Face Wash Pure White.jpg', '2020-03-10 01:08:00', '2020-03-10 01:08:00'),
(515, 476, '1583824860Pond\'s Face Wash White Beauty.jpg', '2020-03-10 01:21:00', '2020-03-10 01:21:00'),
(516, 477, '1583824908Pond\'s Face Wash White Beauty.jpg', '2020-03-10 01:21:48', '2020-03-10 01:21:48'),
(517, 478, '1583824947Ponds Face Wash Pimple Clear.jpg', '2020-03-10 01:22:27', '2020-03-10 01:22:27'),
(518, 479, '1583826466Pond\'s Face Wash Daily.jpg', '2020-03-10 01:47:46', '2020-03-10 01:47:46'),
(519, 480, '1583831106Ponds Face Wash Scrub.jpg', '2020-03-10 03:05:07', '2020-03-10 03:05:07'),
(520, 481, '1583831153Ponds Men Facewash Lightning Oil Clear.jpg', '2020-03-10 03:05:53', '2020-03-10 03:05:53'),
(521, 482, '1583831188Ponds Men Facewash Lightning Oil Clear.jpg', '2020-03-10 03:06:28', '2020-03-10 03:06:28'),
(522, 483, '1583831220Ponds Face Wash Daily.jpg', '2020-03-10 03:07:00', '2020-03-10 03:07:00'),
(523, 485, '1583831297Ponds Men Facewash Energy Charge.jpg', '2020-03-10 03:08:17', '2020-03-10 03:08:17'),
(524, 486, '1583831330Ponds Men Facewash Energy Charge.jpg', '2020-03-10 03:08:50', '2020-03-10 03:08:50'),
(525, 487, '1583831369Ponds Men Facewash Acne Solution.jpg', '2020-03-10 03:09:29', '2020-03-10 03:09:29'),
(526, 488, '1583831405Ponds Men Facewash Acne Solution.jpg', '2020-03-10 03:10:05', '2020-03-10 03:10:05'),
(527, 489, '1583831815Ponds Men Facewash Power Clear.jpg', '2020-03-10 03:16:55', '2020-03-10 03:16:55'),
(528, 490, '1583831923Clean & Clear Morning Energy Brightening Berry Face Wash.jpg', '2020-03-10 03:18:43', '2020-03-10 03:18:43'),
(529, 491, '1583831961Clean & Clear Morning Energy Face Wash Lemon.jpg', '2020-03-10 03:19:21', '2020-03-10 03:19:21'),
(530, 492, '1583832008Clean & Clear Morning Energy Face Wash.jpg', '2020-03-10 03:20:08', '2020-03-10 03:20:08'),
(531, 493, '1583832057Clean & Clear Blackhead Daily Scrub Oil Free.jpg', '2020-03-10 03:20:57', '2020-03-10 03:20:57'),
(532, 494, '1583832113Clean & Clear Blackhead Daily Scrub Oil Free.jpg', '2020-03-10 03:21:53', '2020-03-10 03:21:53'),
(533, 495, '1583832501Himalaya Fresh Srart Oil Clear Face Wash Lemon.jpg', '2020-03-10 03:28:21', '2020-03-10 03:28:21'),
(534, 496, '1583832541Himalaya Fresh Srart Oil Clear Face Wash Strawberry.jpg', '2020-03-10 03:29:01', '2020-03-10 03:29:01'),
(535, 497, '1583832596Himalaya Fresh Srart Oil Clear Face Wash Peach.jpg', '2020-03-10 03:29:56', '2020-03-10 03:29:56'),
(536, 498, '1583832631Lever Ayush Face Wash Natural Fairness Saffron.jpg', '2020-03-10 03:30:31', '2020-03-10 03:30:31'),
(537, 499, '1583832666Lever Ayush Face wash Anti Pimple Turmeric.jpg', '2020-03-10 03:31:06', '2020-03-10 03:31:06'),
(538, 500, '1583832698Lever Ayush Face wash Anti Pimple Turmeric.jpg', '2020-03-10 03:31:38', '2020-03-10 03:31:38'),
(539, 501, '1583832781Lever Ayush Face Cream Anti Marks Turmeric.jpg', '2020-03-10 03:33:01', '2020-03-10 03:33:01'),
(540, 502, '1583832810Lever Ayush Face Cream Anti Marks Turmeric.jpg', '2020-03-10 03:33:30', '2020-03-10 03:33:30'),
(541, 503, '1583833102Fair And Lovely Face Wash InstaGlow.jpg', '2020-03-10 03:38:22', '2020-03-10 03:38:22'),
(542, 504, '1583833135Fair And Lovely Face Wash InstaGlow.jpg', '2020-03-10 03:38:55', '2020-03-10 03:38:55'),
(543, 505, '1583833183Mens Fair And Lovely Face Wash Rapid Action.jpg', '2020-03-10 03:39:43', '2020-03-10 03:39:43'),
(544, 506, '1583833214Mens Fair And Lovely Face Wash Rapid Action.jpg', '2020-03-10 03:40:14', '2020-03-10 03:40:14'),
(545, 507, '1583833250Fair And Lovely Face Wash Ayurvedic.jpg', '2020-03-10 03:40:50', '2020-03-10 03:40:50');
INSERT INTO `image_products` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(546, 508, '1583833311Emami Fair And Handsome Fairness Cream.jpg', '2020-03-10 03:41:51', '2020-03-10 03:41:51'),
(547, 509, '1583833363Emami Naturally Fair Face Wash.jpg', '2020-03-10 03:42:43', '2020-03-10 03:42:43'),
(548, 510, '1583833445Emami Naturally Fair Face cream.jpg', '2020-03-10 03:44:05', '2020-03-10 03:44:05'),
(549, 511, '1583835956Nivea Men 48h Cool Kick Deodorent.jpg', '2020-03-10 04:25:56', '2020-03-10 04:25:56'),
(550, 512, '1583836000Nivea Men 48h Fresh Active Deodorent.jpg', '2020-03-10 04:26:40', '2020-03-10 04:26:40'),
(551, 513, '1583836052Nivea Pearl & Beauty 48h Deodorent.jpg', '2020-03-10 04:27:32', '2020-03-10 04:27:32'),
(552, 514, '1583836091Nivea Men Ice Cool Body Deodorizer.jpg', '2020-03-10 04:28:11', '2020-03-10 04:28:11'),
(553, 515, '1583836183Axe Body Perfume Signature Intense Body Perfume.jpg', '2020-03-10 04:29:43', '2020-03-10 04:29:43'),
(554, 516, '1583836218Axe Body Perfume Signature Suave Body Perfume.jpg', '2020-03-10 04:30:18', '2020-03-10 04:30:18'),
(555, 517, '1583836303Axe Deodorant Dark Temptation.jpg', '2020-03-10 04:31:43', '2020-03-10 04:31:43'),
(556, 518, '1583836355Axe Body Perfume Signature Mysterious Body Perfume.jpg', '2020-03-10 04:32:35', '2020-03-10 04:32:35'),
(557, 519, '1583836406Set Wet Go Man Pocket Perfume Rockstar.jpg', '2020-03-10 04:33:26', '2020-03-10 04:33:26'),
(558, 520, '1583836799Set Wet Go Man Pocket Perfume Aviator.jpg', '2020-03-10 04:39:59', '2020-03-10 04:39:59'),
(559, 521, '1583836849Set Wet Body Spray Deodorant Perfume Cool Avatar.jpg', '2020-03-10 04:40:49', '2020-03-10 04:40:49'),
(560, 522, '1583837337Set Wet Body Spray Deodorant Perfume Swag Avatar.jpg', '2020-03-10 04:48:57', '2020-03-10 04:48:57'),
(561, 523, '1583837381Set Wet Hair Styling Gel for Men Value Pack (Wet Look).jpg', '2020-03-10 04:49:41', '2020-03-10 04:49:41'),
(562, 524, '1583837422Set Wet Hair Styling Gel for Men Value Pack (Wet Look).jpg', '2020-03-10 04:50:22', '2020-03-10 04:50:22'),
(563, 525, '1583837816X-Men Perfume Body Spray Gas Free Impact.jpg', '2020-03-10 04:56:56', '2020-03-10 04:56:56'),
(564, 526, '1583838170X-Men Perfume Body Spray Gas Free Focus.jpg', '2020-03-10 05:02:50', '2020-03-10 05:02:50'),
(565, 527, '1583838201X-Men For Boss Perfume Premium Deo Spray Motion.jpg', '2020-03-10 05:03:22', '2020-03-10 05:03:22'),
(566, 528, '1583838239X-Men for Boss EDT Perfume Luxury.jpg', '2020-03-10 05:03:59', '2020-03-10 05:03:59'),
(567, 529, '1583838280Fogg Body Spray Marco.jpg', '2020-03-10 05:04:40', '2020-03-10 05:04:40'),
(568, 530, '1583838320Fogg Body Spray Paradise.jpg', '2020-03-10 05:05:20', '2020-03-10 05:05:20'),
(569, 531, '1583838352Fogg Body spray Victor.jpg', '2020-03-10 05:05:52', '2020-03-10 05:05:52'),
(570, 532, '1583838393Fogg Body Spray Napoleon.jpg', '2020-03-10 05:06:33', '2020-03-10 05:06:33'),
(571, 533, '1583838656Fogg Body spray Blue Ocean.jpg', '2020-03-10 05:10:56', '2020-03-10 05:10:56'),
(572, 534, '1583838690Fogg Fresh Spicy Body Spray.jpg', '2020-03-10 05:11:30', '2020-03-10 05:11:30'),
(573, 535, '1583838751Fogg Scent Men Impressio.jpg', '2020-03-10 05:12:31', '2020-03-10 05:12:31'),
(574, 536, '1583838876Fogg Blue Forest Body Spray.jpg', '2020-03-10 05:14:36', '2020-03-10 05:14:36'),
(575, 537, '1583838919Fogg Fresh Aqua Body Spray.jpg', '2020-03-10 05:15:19', '2020-03-10 05:15:19'),
(576, 538, '1583839004Denim Aqua Body Spray.jpg', '2020-03-10 05:16:44', '2020-03-10 05:16:44'),
(577, 539, '1583839038Denim Musk Body Spray.jpg', '2020-03-10 05:17:18', '2020-03-10 05:17:18'),
(578, 540, '1583839087Denim Black Body Spray.jpg', '2020-03-10 05:18:07', '2020-03-10 05:18:07'),
(579, 541, '1583839788Havoc Gold Deodorant Spray.jpg', '2020-03-10 05:29:48', '2020-03-10 05:29:48'),
(580, 542, '1583839842Havoc Deodorant Spray.jpg', '2020-03-10 05:30:42', '2020-03-10 05:30:42'),
(581, 543, '1583839893Dove Go Fresh Roll On.jpg', '2020-03-10 05:31:33', '2020-03-10 05:31:33'),
(582, 544, '1583840023Yardley English Rose Deodorant Roll On.jpg', '2020-03-10 05:33:43', '2020-03-10 05:33:43'),
(583, 545, '1583840307Adidas Pure Game Body Spray.jpg', '2020-03-10 05:38:27', '2020-03-10 05:38:27'),
(584, 546, '1583840350Adidas Ice Dive Body Spray.jpg', '2020-03-10 05:39:10', '2020-03-10 05:39:10'),
(585, 547, '1583840383Adidas Intense Touch Body Spray.jpg', '2020-03-10 05:39:44', '2020-03-10 05:39:44'),
(586, 548, '1583840421Adidas Victory League.jpg', '2020-03-10 05:40:21', '2020-03-10 05:40:21'),
(587, 549, '1583840509Wild Stone Body Perfume Steel.jpg', '2020-03-10 05:41:49', '2020-03-10 05:41:49'),
(588, 550, '1583840692Wild Stone Hydra Energy Body Spray.jpg', '2020-03-10 05:44:52', '2020-03-10 05:44:52'),
(589, 551, '1583840731Wild Stone Legend Body Deodorant.jpg', '2020-03-10 05:45:31', '2020-03-10 05:45:31'),
(590, 552, '1583840769Wild Stone Body Perfume Titanium.jpg', '2020-03-10 05:46:09', '2020-03-10 05:46:09'),
(591, 553, '1583840860Wild Stone Forest Spice Deodorant.jpg', '2020-03-10 05:47:40', '2020-03-10 05:47:40'),
(592, 554, '1583840916Engage On Man Pocket Perfume (Classic Woody).jpg', '2020-03-10 05:48:36', '2020-03-10 05:48:36'),
(593, 555, '1583841029Engage On Man Pocket Perfume (Cool Marine).jpg', '2020-03-10 05:50:29', '2020-03-10 05:50:29'),
(594, 556, '1583841071Engage Woman Body Spray.jpg', '2020-03-10 05:51:11', '2020-03-10 05:51:11'),
(595, 557, '1583841102Layer Shot Bullet Burst.jpg', '2020-03-10 05:51:42', '2020-03-10 05:51:42'),
(596, 558, '1583841144Ossum Perfumed Body Mist Delight.jpg', '2020-03-10 05:52:24', '2020-03-10 05:52:24'),
(597, 559, '1583992326B8 Whisper Choice Ultra 6 pads.jpg', '2020-03-11 23:52:06', '2020-03-11 23:52:06'),
(598, 560, '1583992368B3 Whisper Maxi Nights Xl Wings 15 Pads.jpg', '2020-03-11 23:52:48', '2020-03-11 23:52:48'),
(599, 561, '1583992751B6 Whisper Ultra Clean XL Wings 15 Pads.jpg', '2020-03-11 23:59:12', '2020-03-11 23:59:12'),
(600, 562, '1583992791B7 Whisper Choice Wings 7 Pads.jpg', '2020-03-11 23:59:51', '2020-03-11 23:59:51'),
(601, 563, '1583992832B4 Whisper Maxi Nights XL Wings 7 Pads.jpg', '2020-03-12 00:00:32', '2020-03-12 00:00:32'),
(602, 564, '1583992869B5 Whisper Ultra 8 Pads.jpg', '2020-03-12 00:01:09', '2020-03-12 00:01:09'),
(603, 565, '1583992907B1 Whisper Maxi Fit 15 Pads.jpg', '2020-03-12 00:01:47', '2020-03-12 00:01:47'),
(604, 566, '1583992943B2 Whisper Maxi Fit 8 Pads.jpg', '2020-03-12 00:02:23', '2020-03-12 00:02:23'),
(605, 567, '1583992993AF4 Whisper Ultra Clean XL Wings 8 Pads.jpg', '2020-03-12 00:03:14', '2020-03-12 00:03:14'),
(606, 568, '1583993214C4 Senora Sanitary Napkin (Panty) 15 pcs.jpg', '2020-03-12 00:06:54', '2020-03-12 00:06:54'),
(607, 569, '1583993258C8 Senora Confidence Regular Flow (Panty System) 16 pcs.jpg', '2020-03-12 00:07:38', '2020-03-12 00:07:38'),
(608, 570, '1583993300C5 Senora Sanitary Napkin (Belt 15 pcs.jpg', '2020-03-12 00:08:20', '2020-03-12 00:08:20'),
(609, 571, '1583993342C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs.jpg', '2020-03-12 00:09:02', '2020-03-12 00:09:02'),
(610, 572, '1583993389C9 Senora Confidence Regular Flow (Panty System) 10 pcs.jpg', '2020-03-12 00:09:49', '2020-03-12 00:09:49'),
(611, 573, '1583993429C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs.jpg', '2020-03-12 00:10:29', '2020-03-12 00:10:29'),
(612, 574, '1583993622C1 Senora Ultra-thin Heavy Flow 8 pcs.jpg', '2020-03-12 00:13:42', '2020-03-12 00:13:42'),
(613, 575, '1583993672A8 ACI Freedom Heavy Flow Wings 16 Pads.jpg', '2020-03-12 00:14:32', '2020-03-12 00:14:32'),
(614, 576, '1583993746A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads.jpg', '2020-03-12 00:15:46', '2020-03-12 00:15:46'),
(615, 577, '1583993795Freedom Pregnancy Test 1 Strip.jpg', '2020-03-12 00:16:35', '2020-03-12 00:16:35'),
(616, 578, '1583993897A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads.jpg', '2020-03-12 00:18:17', '2020-03-12 00:18:17'),
(617, 579, '1583993938Freedom Pregnancy Test Tool Set.jpg', '2020-03-12 00:18:58', '2020-03-12 00:18:58'),
(618, 580, '1583993996Gillette Venus Woman Razor (Buy 1 Get 1 Offe.jpg', '2020-03-12 00:19:56', '2020-03-12 00:19:56'),
(619, 581, '1583994037A3 ACI Freedom Regular Flow Wings 10 pads.jpg', '2020-03-12 00:20:37', '2020-03-12 00:20:37'),
(620, 582, '1583994198A14 Freedom Teens Ultra Chic Soft Sanitary Napkin.jpg', '2020-03-12 00:23:18', '2020-03-12 00:23:18'),
(621, 583, '1583994235A4 ACI Freedom Regular Flow Panty 15 pads.jpg', '2020-03-12 00:23:55', '2020-03-12 00:23:55'),
(622, 584, '1583994273A11 ACI Savlon Freedom Regular Flow Belt System 15 pads.jpg', '2020-03-12 00:24:33', '2020-03-12 00:24:33'),
(623, 585, '1583994309A7 ACI Freedom Regular Flow Belt 10 pads.jpg', '2020-03-12 00:25:09', '2020-03-12 00:25:09'),
(625, 587, '1584076924Complan Chocholate.jpg', '2020-03-12 23:22:04', '2020-03-12 23:22:04'),
(626, 588, '1584077139Complan Chocholate.jpg', '2020-03-12 23:25:39', '2020-03-12 23:25:39'),
(627, 589, '1584077172Complan Chocholate.jpg', '2020-03-12 23:26:13', '2020-03-12 23:26:13'),
(628, 590, '1584077220ovaltine malted chocolate drink jar.jpg', '2020-03-12 23:27:00', '2020-03-12 23:27:00'),
(629, 591, '1584077272Horlicks jar.jpg', '2020-03-12 23:27:52', '2020-03-12 23:27:52'),
(630, 592, '1584077352chokholate Horlicks jar.jpg', '2020-03-12 23:29:12', '2020-03-12 23:29:12'),
(631, 593, '1584077389womens Horlicks jar.jpg', '2020-03-12 23:29:49', '2020-03-12 23:29:49'),
(632, 594, '1584077439Mothers Horlicks Bib.jpg', '2020-03-12 23:30:39', '2020-03-12 23:30:39'),
(633, 595, '1584077481Horlicks refill.jpg', '2020-03-12 23:31:21', '2020-03-12 23:31:21'),
(634, 596, '1584077539Horlicks Grouth plus.jpg', '2020-03-12 23:32:19', '2020-03-12 23:32:19'),
(635, 597, '1584077615cadbury bourn vita.jpg', '2020-03-12 23:33:35', '2020-03-12 23:33:35'),
(636, 598, '1584077671Nestle Nesquik Strawberry powder.jpg', '2020-03-12 23:34:31', '2020-03-12 23:34:31'),
(637, 599, '1584077781Nestle nestum higher in whole grain ceral milk drink.jpg', '2020-03-12 23:36:21', '2020-03-12 23:36:21'),
(638, 600, '1584077856Nestle nestum higher in whole grain ceral milk drink.jpg', '2020-03-12 23:37:36', '2020-03-12 23:37:36'),
(639, 601, '1584078013Quality brown premium egg.jpg', '2020-03-12 23:40:13', '2020-03-12 23:40:13'),
(640, 602, '1584078061Purnava vitamin egg.jpg', '2020-03-12 23:41:01', '2020-03-12 23:41:01'),
(641, 603, '1584078119purnava omega 3 enriched egg.jpg', '2020-03-12 23:41:59', '2020-03-12 23:41:59'),
(642, 604, '1584078305Nestle koko krunch cereals box (FREE maggi 2 min thai soup).jpg', '2020-03-12 23:45:05', '2020-03-12 23:45:05'),
(643, 605, '1584078356nestle corn flakes breakfast cereal box.jpg', '2020-03-12 23:45:56', '2020-03-12 23:45:56'),
(644, 606, '1584078403Nestle koko krunch Duo cereals box.jpg', '2020-03-12 23:46:43', '2020-03-12 23:46:43'),
(645, 607, '1584078510nestle MILO breakfast chocolate cereal box.jpg', '2020-03-12 23:48:30', '2020-03-12 23:48:30'),
(646, 608, '1584078545nestle corn flakes breakfast cereal box (FREE maggi masala noodles).jpg', '2020-03-12 23:49:05', '2020-03-12 23:49:05'),
(647, 609, '1584078583quaker oats poly.jpg', '2020-03-12 23:49:43', '2020-03-12 23:49:43'),
(648, 610, '1584078615quaker oats australia.jpg', '2020-03-12 23:50:15', '2020-03-12 23:50:15'),
(649, 611, '1584078713quaker white oats.jpg', '2020-03-12 23:51:53', '2020-03-12 23:51:53'),
(652, 614, '1584078826Kelloggs chocos fills centre filled pillows.jpg', '2020-03-12 23:53:46', '2020-03-12 23:53:46'),
(653, 615, '1584078872sajeeb corn flakes.jpg', '2020-03-12 23:54:32', '2020-03-12 23:54:32'),
(654, 616, '1584079253shezan choko crunch.jpg', '2020-03-13 00:00:53', '2020-03-13 00:00:53'),
(655, 617, '1584079326vitalia sugar free corn flakes.jpg', '2020-03-13 00:02:06', '2020-03-13 00:02:06'),
(656, 618, '1584079391vitalia fit & active muesli.jpg', '2020-03-13 00:03:11', '2020-03-13 00:03:11'),
(657, 619, '1584079442Premuim grade fruit & nut muesli.jpg', '2020-03-13 00:04:02', '2020-03-13 00:04:02'),
(658, 620, '1584079475Premuim grade blueberry muesli.jpg', '2020-03-13 00:04:35', '2020-03-13 00:04:35'),
(659, 621, '1584079881Premuim grade blueberry muesli.jpg', '2020-03-13 00:11:21', '2020-03-13 00:11:21'),
(660, 622, '1584079957Premuim grade apricot muesli.jpg', '2020-03-13 00:12:37', '2020-03-13 00:12:37'),
(661, 623, '1584080041Premuim grade fig muesli.jpg', '2020-03-13 00:14:01', '2020-03-13 00:14:01'),
(663, 625, '1584091291Milk vita Butter.jpg', '2020-03-13 03:21:33', '2020-03-13 03:21:33'),
(664, 626, '1584091333Pran butter (fresco container).jpg', '2020-03-13 03:22:13', '2020-03-13 03:22:13'),
(665, 627, '1584091373pran mango jam.jpg', '2020-03-13 03:22:53', '2020-03-13 03:22:53'),
(666, 628, '1584091404pran mango jam.jpg', '2020-03-13 03:23:25', '2020-03-13 03:23:25'),
(667, 629, '1584091538alfa mayoannaise.jpg', '2020-03-13 03:25:39', '2020-03-13 03:25:39'),
(668, 630, '1584091794alfa mayoannaise.jpg', '2020-03-13 03:29:54', '2020-03-13 03:29:54'),
(669, 631, '1584092213Harman mayonnaise.jpg', '2020-03-13 03:36:53', '2020-03-13 03:36:53'),
(670, 632, '1584092251Harman mayonnaise.jpg', '2020-03-13 03:37:32', '2020-03-13 03:37:32'),
(671, 633, '1584092449harman peanut butter creamy.jpg', '2020-03-13 03:40:49', '2020-03-13 03:40:49'),
(672, 634, '1584092491calypso mayonnaise.jpg', '2020-03-13 03:41:31', '2020-03-13 03:41:31'),
(673, 635, '1584092529calypso mayonnaise.jpg', '2020-03-13 03:42:09', '2020-03-13 03:42:09'),
(674, 636, '1584092565foster clarks orange jelly.jpg', '2020-03-13 03:42:45', '2020-03-13 03:42:45'),
(675, 637, '1584092601foster clarks jam strawberry.jpg', '2020-03-13 03:43:21', '2020-03-13 03:43:21'),
(676, 638, '1584092644foster clarks cherry jelly.jpg', '2020-03-13 03:44:04', '2020-03-13 03:44:04'),
(677, 639, '1584092679foster clarks mango jelly.jpg', '2020-03-13 03:44:40', '2020-03-13 03:44:40'),
(678, 640, '1584092724foster clarks mixed fruit jam.jpg', '2020-03-13 03:45:24', '2020-03-13 03:45:24'),
(679, 641, '1584097954crown peanut butter chunky.jpg', '2020-03-13 05:12:35', '2020-03-13 05:12:35'),
(680, 642, '1584097999crown peanut butter smoot & creamy.jpg', '2020-03-13 05:13:19', '2020-03-13 05:13:19'),
(681, 643, '1584098087nocilla two colour chocolate.jpg', '2020-03-13 05:14:47', '2020-03-13 05:14:47'),
(682, 644, '1584098224nutella hazelnut cocoa spread.jpg', '2020-03-13 05:17:04', '2020-03-13 05:17:04'),
(683, 645, '1584098276amul pasteurised butter.jpg', '2020-03-13 05:17:56', '2020-03-13 05:17:56'),
(684, 646, '1584098338farm fresh Butter.jpg', '2020-03-13 05:18:58', '2020-03-13 05:18:58'),
(685, 647, '1584098500alamarai processed cream cheese.jpg', '2020-03-13 05:21:40', '2020-03-13 05:21:40'),
(686, 648, '1584098554Ruchi orange jam.jpg', '2020-03-13 05:22:34', '2020-03-13 05:22:34'),
(687, 649, '1584098654Ahmed orange jelly.jpg', '2020-03-13 05:24:14', '2020-03-13 05:24:14'),
(689, 651, '1584098752Ahmed mixed fruit jam.jpg', '2020-03-13 05:25:52', '2020-03-13 05:25:52'),
(690, 652, '1584098789ahmed suger free guava jelly.jpg', '2020-03-13 05:26:29', '2020-03-13 05:26:29'),
(691, 653, '1584098855ahmed mixed fruit jelly.jpg', '2020-03-13 05:27:35', '2020-03-13 05:27:35'),
(692, 654, '1584098890ahmed pineapple jelly.jpg', '2020-03-13 05:28:10', '2020-03-13 05:28:10'),
(693, 655, '1584098936ahmed guava jelly.jpg', '2020-03-13 05:28:56', '2020-03-13 05:28:56'),
(694, 656, '1584098978ahmed apple jam.jpg', '2020-03-13 05:29:38', '2020-03-13 05:29:38'),
(695, 657, '1584099011ahmed mango jam.jpg', '2020-03-13 05:30:11', '2020-03-13 05:30:11'),
(696, 658, '1584099055ahmed pineapple jam.jpg', '2020-03-13 05:30:55', '2020-03-13 05:30:55'),
(697, 659, '1584099119Khushboo premium orange jelly.jpg', '2020-03-13 05:31:59', '2020-03-13 05:31:59'),
(699, 661, '1584099237sundrop peanut butter crunchy.jpg', '2020-03-13 05:33:57', '2020-03-13 05:33:57'),
(700, 662, '1584099278BD orange jelly.jpg', '2020-03-13 05:34:38', '2020-03-13 05:34:38'),
(701, 663, '1584099327shezan orange jelly.jpg', '2020-03-13 05:35:27', '2020-03-13 05:35:27'),
(702, 664, '1584099570American Green chunky peanut butter.jpg', '2020-03-13 05:39:30', '2020-03-13 05:39:30'),
(703, 665, '1584099644Pran puffed rice (MURI).jpg', '2020-03-13 05:40:44', '2020-03-13 05:40:44'),
(704, 666, '1584099725Pran puffed rice (MURI).jpg', '2020-03-13 05:42:05', '2020-03-13 05:42:05'),
(705, 667, '1584099823Pran All time cream roll.jpg', '2020-03-13 05:43:43', '2020-03-13 05:43:43'),
(706, 668, '1584099859Pran fattened rice (chira).jpg', '2020-03-13 05:44:19', '2020-03-13 05:44:19'),
(707, 669, '1584100000Golden Harvest frozen paratha family pack.jpg', '2020-03-13 05:46:40', '2020-03-13 05:46:40'),
(708, 670, '1584261472Golden Harvest aloo paratha.jpg', '2020-03-15 02:37:53', '2020-03-15 02:37:53'),
(709, 671, '1584262888Golden harvest mega deshi paratha.jpg', '2020-03-15 03:01:28', '2020-03-15 03:01:28'),
(710, 672, '1584262951cocola chocolate water roll jar.jpg', '2020-03-15 03:02:31', '2020-03-15 03:02:31'),
(711, 673, '1584263244Dan cake vanilla Muffin.jpg', '2020-03-15 03:07:24', '2020-03-15 03:07:24'),
(712, 674, '1584263293dan cake chocolate muffin.jpg', '2020-03-15 03:08:13', '2020-03-15 03:08:13'),
(713, 675, '1584263364dan cake vanilla muffine.jpg', '2020-03-15 03:09:24', '2020-03-15 03:09:24'),
(714, 676, '1584263915dan cake chocolate layer cake.jpg', '2020-03-15 03:18:35', '2020-03-15 03:18:35'),
(715, 677, '1584263975dan cake lemon pound cake.jpg', '2020-03-15 03:19:35', '2020-03-15 03:19:35'),
(716, 678, '1584264015Tiffany crunch\'N\' cream hazelnut wafers.jpg', '2020-03-15 03:20:15', '2020-03-15 03:20:15'),
(718, 680, '1584264151Ispanahi Bakery Fresh dry cake.jpg', '2020-03-15 03:22:31', '2020-03-15 03:22:31'),
(719, 681, '1584264543Lamisa Paratha family pack.jpg', '2020-03-15 03:29:03', '2020-03-15 03:29:03'),
(720, 682, '1584264628Lamisa premium paratha.jpg', '2020-03-15 03:30:28', '2020-03-15 03:30:28'),
(722, 684, '1584267532cocola junior cup noodles.jpg', '2020-03-15 04:18:52', '2020-03-15 04:18:52'),
(723, 685, '1584267593nestle Maggi 2 minute noodles masala 8 pack.jpg', '2020-03-15 04:19:53', '2020-03-15 04:19:53'),
(724, 686, '1584267634nestle Maggi 2 minute noodles masala 4 pack.jpg', '2020-03-15 04:20:34', '2020-03-15 04:20:34'),
(725, 687, '1584267798Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack.jpg', '2020-03-15 04:23:18', '2020-03-15 04:23:18'),
(726, 688, '1584267893Nestle Maggi Healty thai soup.jpg', '2020-03-15 04:24:53', '2020-03-15 04:24:53'),
(727, 689, '1584267944nestle maggi healty soup corn with chicken Flavour.jpg', '2020-03-15 04:25:44', '2020-03-15 04:25:44'),
(728, 690, '1584267987Nestle maggi shaad e magic seasoning.jpg', '2020-03-15 04:26:28', '2020-03-15 04:26:28'),
(729, 691, '1584268030Nestle maggi healty soup vegetables.jpg', '2020-03-15 04:27:10', '2020-03-15 04:27:10'),
(730, 692, '1584268349kolson Macaroni shell.jpg', '2020-03-15 04:32:29', '2020-03-15 04:32:29'),
(731, 693, '1584268387kolson Bamboo.jpg', '2020-03-15 04:33:07', '2020-03-15 04:33:07'),
(732, 694, '1584268449kolson macaroni screw.jpg', '2020-03-15 04:34:09', '2020-03-15 04:34:09'),
(733, 695, '1584268486kolson macaroni assorted pack.jpg', '2020-03-15 04:34:46', '2020-03-15 04:34:46'),
(734, 696, '1584268530Dekko pasta.jpg', '2020-03-15 04:35:30', '2020-03-15 04:35:30'),
(735, 697, '1584268634Bashundhara sea shell pasta.jpg', '2020-03-15 04:37:14', '2020-03-15 04:37:14'),
(736, 698, '1584268671Pasta hat macaroni (Rigate).jpg', '2020-03-15 04:37:51', '2020-03-15 04:37:51'),
(737, 699, '1584268855Pasta hat macaroni (Medium shell).jpg', '2020-03-15 04:40:55', '2020-03-15 04:40:55'),
(738, 700, '1584268891pasta hat macaroni (screw).jpg', '2020-03-15 04:41:31', '2020-03-15 04:41:31'),
(739, 701, '1584268935pasta hat macaroni (Big Elbow).jpg', '2020-03-15 04:42:15', '2020-03-15 04:42:15'),
(740, 702, '1584269300Nestle Kitkat 4 finger.jpg', '2020-03-15 04:48:20', '2020-03-15 04:48:20'),
(741, 703, '1584269337kitkat 2 finger.jpg', '2020-03-15 04:48:57', '2020-03-15 04:48:57'),
(742, 704, '1584269376Nestle Chocolate Assorted Chocolate.jpg', '2020-03-15 04:49:36', '2020-03-15 04:49:36'),
(743, 706, '1584269458Nestle nesquik chocolate powder.jpg', '2020-03-15 04:50:58', '2020-03-15 04:50:58'),
(744, 707, '1584269883Snikers Chocolate.jpg', '2020-03-15 04:58:03', '2020-03-15 04:58:03'),
(745, 708, '1584269929Snikers Chocolate.jpg', '2020-03-15 04:58:49', '2020-03-15 04:58:49'),
(746, 709, '1584270318snikers family pack chocolate.jpg', '2020-03-15 05:05:18', '2020-03-15 05:05:18'),
(747, 710, '1584270368snikers power pack.jpg', '2020-03-15 05:06:08', '2020-03-15 05:06:08'),
(748, 711, '1584270506Cadbury Dairy Milk silk chocolate.jpg', '2020-03-15 05:08:26', '2020-03-15 05:08:26'),
(749, 712, '1584270547cadbury 5 star chocolate.jpg', '2020-03-15 05:09:07', '2020-03-15 05:09:07'),
(750, 713, '1584272139cadbury choclairs.jpg', '2020-03-15 05:35:39', '2020-03-15 05:35:39'),
(751, 714, '1584272277cadbury dairy millk silk fruit & nut.jpg', '2020-03-15 05:37:57', '2020-03-15 05:37:57'),
(752, 715, '1584272325cadbury bournville rich cocoa dark chocolate.jpg', '2020-03-15 05:38:45', '2020-03-15 05:38:45'),
(753, 716, '1584272584cadbury original drinking chocolate.jpg', '2020-03-15 05:43:04', '2020-03-15 05:43:04'),
(754, 717, '1584272673cadbury gems surprise chocolate ball.jpg', '2020-03-15 05:44:33', '2020-03-15 05:44:33'),
(755, 718, '1584272813cadbury gems surprise chocolate.jpg', '2020-03-15 05:46:53', '2020-03-15 05:46:53'),
(756, 719, '1584273444cadbury dairy milk silk roast almond.jpg', '2020-03-15 05:57:24', '2020-03-15 05:57:24'),
(757, 720, '1584273519cadbury fuse chocolate.jpg', '2020-03-15 05:58:39', '2020-03-15 05:58:39'),
(758, 721, '1584273551cadbury bournville raisin and nusts dark chocolate.jpg', '2020-03-15 05:59:11', '2020-03-15 05:59:11'),
(759, 722, '1584273737cadbury bournville cranberry dark chocolate.jpg', '2020-03-15 06:02:17', '2020-03-15 06:02:17'),
(760, 723, '1584273784cadbury bournville cranberry dark chocolate.jpg', '2020-03-15 06:03:04', '2020-03-15 06:03:04'),
(761, 724, '1584273886cadbury dairy milk lickables.jpg', '2020-03-15 06:04:46', '2020-03-15 06:04:46'),
(762, 725, '1584273930kopiko coffee candy.jpg', '2020-03-15 06:05:30', '2020-03-15 06:05:30'),
(763, 726, '1584274052kopiko coffee cappuccino.jpg', '2020-03-15 06:07:32', '2020-03-15 06:07:32'),
(764, 727, '1584274203olympic tetul candy.jpg', '2020-03-15 06:10:03', '2020-03-15 06:10:03'),
(765, 728, '1584274271olympic juicy litchi candy.jpg', '2020-03-15 06:11:11', '2020-03-15 06:11:11'),
(766, 729, '1584274462olympic mango candy.jpg', '2020-03-15 06:14:22', '2020-03-15 06:14:22'),
(767, 730, '1584274518Alpenliebe original caramel candy pouch.jpg', '2020-03-15 06:15:18', '2020-03-15 06:15:18'),
(768, 731, '1584274631Alpenliebe Creamfills Box.jpg', '2020-03-15 06:17:11', '2020-03-15 06:17:11'),
(769, 732, '1584274670Alpenliebe pop Party Pack Lollipop surprise Gift.jpg', '2020-03-15 06:17:50', '2020-03-15 06:17:50'),
(770, 733, '1584339146Ispahani Mirzapore Best leaf Tea.jpg', '2020-03-16 00:12:27', '2020-03-16 00:12:27'),
(771, 734, '1584339184Ispahani Mirzapore Best leaf Tea.jpg', '2020-03-16 00:13:04', '2020-03-16 00:13:04'),
(772, 735, '1584339227Ispahani Mirzapur Red dust tea.jpg', '2020-03-16 00:13:47', '2020-03-16 00:13:47'),
(773, 736, '1584339254ispahani mirzapore Tea bag.jpg', '2020-03-16 00:14:14', '2020-03-16 00:14:14'),
(774, 737, '1584339298Ispahani blender\'s choice green tea.jpg', '2020-03-16 00:14:58', '2020-03-16 00:14:58'),
(775, 738, '1584339326Ispahani blender\'s choice green tea.jpg', '2020-03-16 00:15:26', '2020-03-16 00:15:26'),
(776, 739, '1584339359Ispahani blender\'s choice green tea.jpg', '2020-03-16 00:15:59', '2020-03-16 00:15:59'),
(777, 740, '1584339387Ispahani blender\'s choice green tea.jpg', '2020-03-16 00:16:27', '2020-03-16 00:16:27'),
(778, 741, '1584339699Ispahani mirzapore PD tea.jpg', '2020-03-16 00:21:39', '2020-03-16 00:21:39'),
(779, 742, '1584339748Ispahani zareen premium tea.jpg', '2020-03-16 00:22:28', '2020-03-16 00:22:28'),
(780, 743, '1584339823Brooke bond Taaza Tea black tea.jpg', '2020-03-16 00:23:43', '2020-03-16 00:23:43'),
(781, 744, '1584339857Brooke bond Taaza Tea black tea.jpg', '2020-03-16 00:24:18', '2020-03-16 00:24:18'),
(782, 745, '1584339906Brooke bond Taaza Tea bag 50pcs.jpg', '2020-03-16 00:25:06', '2020-03-16 00:25:06'),
(783, 746, '1584340176Fresh Premium Tea (cup free).jpg', '2020-03-16 00:29:36', '2020-03-16 00:29:36'),
(784, 747, '1584340213Fresh Premium Tea (spoon free).jpg', '2020-03-16 00:30:13', '2020-03-16 00:30:13'),
(785, 748, '1584340332kazi & kazi Green tea.jpg', '2020-03-16 00:32:12', '2020-03-16 00:32:12'),
(786, 749, '1584340367kazi & kazi Orthodox Green tea.jpg', '2020-03-16 00:32:47', '2020-03-16 00:32:47'),
(787, 750, '1584340398kazi & kazi Ginger tea.jpg', '2020-03-16 00:33:18', '2020-03-16 00:33:18'),
(788, 751, '1584340608kazi & kazi Tulsi tea.jpg', '2020-03-16 00:36:48', '2020-03-16 00:36:48'),
(789, 752, '1584341232kazi & kazi black tea.jpg', '2020-03-16 00:47:12', '2020-03-16 00:47:12'),
(790, 753, '1584341687kazi & kazi Lemongrass tea.jpg', '2020-03-16 00:54:47', '2020-03-16 00:54:47'),
(791, 754, '1584341737kazi & kazi medley tea.jpg', '2020-03-16 00:55:37', '2020-03-16 00:55:37'),
(792, 755, '1584341859kazi & kazi Lemongrass herbal infusion.jpg', '2020-03-16 00:57:39', '2020-03-16 00:57:39'),
(793, 756, '1584341896Finlays pure Green tea bags.jpg', '2020-03-16 00:58:16', '2020-03-16 00:58:16'),
(794, 757, '1584341962Finlays pure green tea box.jpg', '2020-03-16 00:59:22', '2020-03-16 00:59:22'),
(795, 758, '1584342005finlays natural green tea bags.jpg', '2020-03-16 01:00:05', '2020-03-16 01:00:05'),
(796, 759, '1584342072finlays masala cha tea bags.jpg', '2020-03-16 01:01:12', '2020-03-16 01:01:12'),
(797, 760, '1584342129finlay premium tea.jpg', '2020-03-16 01:02:09', '2020-03-16 01:02:09'),
(798, 761, '1584342159finlay gold tea.jpg', '2020-03-16 01:02:39', '2020-03-16 01:02:39'),
(799, 762, '1584342189finlay gold tea.jpg', '2020-03-16 01:03:09', '2020-03-16 01:03:09'),
(800, 763, '1584342541Tetley premium tea bags.jpg', '2020-03-16 01:09:01', '2020-03-16 01:09:01'),
(801, 764, '1584342630tetly green tea (PURE original) tea bags.jpg', '2020-03-16 01:10:30', '2020-03-16 01:10:30'),
(802, 765, '1584346595Nestle Nescafe classic instant coffee jar.jpg', '2020-03-16 02:16:35', '2020-03-16 02:16:35'),
(803, 766, '1584346643Nestle Nescafe classic instant coffee jar.jpg', '2020-03-16 02:17:23', '2020-03-16 02:17:23'),
(804, 767, '1584346677Nestle Nescafe classic instant coffee jar.jpg', '2020-03-16 02:17:57', '2020-03-16 02:17:57'),
(805, 768, '1584346713Nescafe classice pouch pack (container free).jpg', '2020-03-16 02:18:33', '2020-03-16 02:18:33'),
(806, 769, '1584346846nestle coffee mate richer & creamer BIB.jpg', '2020-03-16 02:20:46', '2020-03-16 02:20:46'),
(807, 770, '1584346882nestle coffee mate creamer.jpg', '2020-03-16 02:21:22', '2020-03-16 02:21:22'),
(808, 771, '1584346930nescafe gold jar.jpg', '2020-03-16 02:22:10', '2020-03-16 02:22:10'),
(809, 772, '1584346994nescafe matinal jar.jpg', '2020-03-16 02:23:14', '2020-03-16 02:23:14'),
(810, 773, '1584347036nescafe ipoh original white coffee.jpg', '2020-03-16 02:23:56', '2020-03-16 02:23:56'),
(811, 774, '1584347118nescafe singapore kopi C.jpg', '2020-03-16 02:25:18', '2020-03-16 02:25:18'),
(812, 775, '1584347157nestle nescafe creamy latte.jpg', '2020-03-16 02:25:57', '2020-03-16 02:25:57'),
(813, 776, '1584347229Nestea iced tea lemon.jpg', '2020-03-16 02:27:09', '2020-03-16 02:27:09'),
(814, 777, '1584347329Tora bika cappuccino.jpg', '2020-03-16 02:28:49', '2020-03-16 02:28:49'),
(815, 778, '1584347368Tora bika creamy latte.jpg', '2020-03-16 02:29:29', '2020-03-16 02:29:29'),
(816, 779, '1584347401Kopico white mocca mocha coffee.jpg', '2020-03-16 02:30:01', '2020-03-16 02:30:01'),
(817, 780, '1584347487Mac coffee gold jar.jpg', '2020-03-16 02:31:27', '2020-03-16 02:31:27'),
(818, 781, '1584347536Mac coffee gold jar.jpg', '2020-03-16 02:32:16', '2020-03-16 02:32:16'),
(819, 782, '1584347569Mac coffee original jar.jpg', '2020-03-16 02:32:49', '2020-03-16 02:32:49'),
(820, 783, '1584347606mac coffee coffee & creamer 2 in 1.jpg', '2020-03-16 02:33:26', '2020-03-16 02:33:26'),
(821, 784, '1584347729Bru pure instant coffee jar.jpg', '2020-03-16 02:35:29', '2020-03-16 02:35:29'),
(822, 785, '1584347839Bru pure instant coffee jar.jpg', '2020-03-16 02:37:19', '2020-03-16 02:37:19'),
(823, 786, '1584347877Bru original coffee jar.jpg', '2020-03-16 02:37:57', '2020-03-16 02:37:57'),
(824, 787, '1584347908Bru original rich aromatic coffee jar.jpg', '2020-03-16 02:38:28', '2020-03-16 02:38:28'),
(825, 788, '1584347989Latina 100% Juich (Apple).jpg', '2020-03-16 02:39:49', '2020-03-16 02:39:49'),
(826, 789, '1584348080Latina 100% Juich (Orange).jpg', '2020-03-16 02:41:20', '2020-03-16 02:41:20'),
(827, 790, '1584348157Pran Drinko Litchi Juice.jpg', '2020-03-16 02:42:37', '2020-03-16 02:42:37'),
(828, 791, '1584348219pran apple fruit drink.jpg', '2020-03-16 02:43:39', '2020-03-16 02:43:39'),
(829, 792, '1584348262pran frooto mango fruit drink.jpg', '2020-03-16 02:44:22', '2020-03-16 02:44:22'),
(830, 793, '1584348291pran frooto mango fruit drink.jpg', '2020-03-16 02:44:51', '2020-03-16 02:44:51'),
(831, 794, '1584348323pran frooto mango fruit drink.jpg', '2020-03-16 02:45:23', '2020-03-16 02:45:23'),
(832, 795, '1584348416shezan mango fruit drinks.jpg', '2020-03-16 02:46:56', '2020-03-16 02:46:56'),
(833, 796, '1584348448shezan mango juice.jpg', '2020-03-16 02:47:28', '2020-03-16 02:47:28'),
(834, 797, '1584348487sajeeb lichi flavored drink.jpg', '2020-03-16 02:48:07', '2020-03-16 02:48:07'),
(835, 798, '1584348537sajeeb orange flavored drink.jpg', '2020-03-16 02:48:58', '2020-03-16 02:48:58'),
(836, 799, '1584348587Masafi mango nectar juice.jpg', '2020-03-16 02:49:47', '2020-03-16 02:49:47'),
(837, 800, '1584348624Masafi apple juice.jpg', '2020-03-16 02:50:24', '2020-03-16 02:50:24'),
(838, 801, '1584348668Masafi Tropical Fruits Necter.jpg', '2020-03-16 02:51:08', '2020-03-16 02:51:08'),
(839, 802, '1584348713Aloe vera mango drink.jpg', '2020-03-16 02:51:53', '2020-03-16 02:51:53'),
(840, 803, '1584348748Aloe vera prome drink.jpg', '2020-03-16 02:52:28', '2020-03-16 02:52:28'),
(841, 804, '1584348788Ocean spray cranberry classic juice.jpg', '2020-03-16 02:53:08', '2020-03-16 02:53:08'),
(845, 808, '1584349666cocacola can.jpg', '2020-03-16 03:07:46', '2020-03-16 03:07:46'),
(846, 809, '1584349706cocacola classic.jpg', '2020-03-16 03:08:26', '2020-03-16 03:08:26'),
(847, 810, '1584349979Sprite.jpg', '2020-03-16 03:12:59', '2020-03-16 03:12:59'),
(848, 811, '1584350032Sprite.jpg', '2020-03-16 03:13:52', '2020-03-16 03:13:52'),
(849, 812, '1584350067Sprite.jpg', '2020-03-16 03:14:27', '2020-03-16 03:14:27'),
(850, 813, '1584350102sprite can.jpg', '2020-03-16 03:15:02', '2020-03-16 03:15:02'),
(851, 814, '15843501357up pet.jpg', '2020-03-16 03:15:35', '2020-03-16 03:15:35'),
(852, 815, '15843501657up pet.jpg', '2020-03-16 03:16:05', '2020-03-16 03:16:05'),
(853, 816, '15843502037up can.jpg', '2020-03-16 03:16:43', '2020-03-16 03:16:43'),
(854, 817, '1584350248pepsi can.jpg', '2020-03-16 03:17:28', '2020-03-16 03:17:28'),
(855, 818, '1584350307clemon pet.jpg', '2020-03-16 03:18:27', '2020-03-16 03:18:27'),
(856, 819, '1584350432clemon pet.jpg', '2020-03-16 03:20:32', '2020-03-16 03:20:32'),
(857, 820, '1584350470pran up.jpg', '2020-03-16 03:21:10', '2020-03-16 03:21:10'),
(858, 821, '1584350507pran up.jpg', '2020-03-16 03:21:47', '2020-03-16 03:21:47'),
(859, 822, '1584350541Frutica mango juice.jpg', '2020-03-16 03:22:21', '2020-03-16 03:22:21'),
(860, 823, '1584350578Rooh Afza.jpg', '2020-03-16 03:22:58', '2020-03-16 03:22:58'),
(861, 824, '1584350612Rooh Afza.jpg', '2020-03-16 03:23:32', '2020-03-16 03:23:32'),
(862, 825, '1584351254Glaxos D pack.jpg', '2020-03-16 03:34:14', '2020-03-16 03:34:14'),
(863, 826, '1584351306Glaxos D orange.jpg', '2020-03-16 03:35:06', '2020-03-16 03:35:06'),
(864, 827, '1584351365Tang Mango powder.jpg', '2020-03-16 03:36:05', '2020-03-16 03:36:05'),
(865, 828, '1584351570Tang Lemon Powder.jpg', '2020-03-16 03:39:30', '2020-03-16 03:39:30'),
(866, 829, '1584351605Tang orange pack.jpg', '2020-03-16 03:40:05', '2020-03-16 03:40:05'),
(867, 830, '1584351775Tang mango jar.jpg', '2020-03-16 03:42:55', '2020-03-16 03:42:55'),
(868, 831, '1584351857Tang pineapple powder.jpg', '2020-03-16 03:44:17', '2020-03-16 03:44:17'),
(869, 832, '1584351958Tang Tropical Coctail Powder.jpg', '2020-03-16 03:45:58', '2020-03-16 03:45:58'),
(870, 833, '1584352060Foster clarks Drink orange.jpg', '2020-03-16 03:47:40', '2020-03-16 03:47:40'),
(871, 834, '1584352101Foster clarks mandarin jar.jpg', '2020-03-16 03:48:21', '2020-03-16 03:48:21'),
(872, 835, '1584352282Foster clarks pineapple jar.jpg', '2020-03-16 03:51:22', '2020-03-16 03:51:22'),
(873, 836, '1584352328forter clarks lemon instant flavoured drink.jpg', '2020-03-16 03:52:09', '2020-03-16 03:52:09'),
(874, 837, '1584352867Ispi Instant Powder drink (orange).jpg', '2020-03-16 04:01:07', '2020-03-16 04:01:07'),
(875, 838, '1584352906Ispi Instant Powder drink (orange).jpg', '2020-03-16 04:01:46', '2020-03-16 04:01:46'),
(876, 839, '1584352940Ispi soft Powder drink (mango).jpg', '2020-03-16 04:02:20', '2020-03-16 04:02:20'),
(877, 840, '1584352977ispi instant powder drink jar (orange).jpg', '2020-03-16 04:02:57', '2020-03-16 04:02:57'),
(878, 841, '1584470635almer-hand-sanitizer-50-ml.jpg', '2020-03-17 12:43:56', '2020-03-17 12:43:56'),
(879, 842, '1584470801lifebuoy-handwash-total-pump-200-ml.jpg', '2020-03-17 12:46:41', '2020-03-17 12:46:41'),
(880, 843, '1584470897lifebuoy-handwash-lemon-fresh-refill-170-ml.jpg', '2020-03-17 12:48:17', '2020-03-17 12:48:17'),
(881, 844, '1584471011aci-savlon-active-handwash-bottle-250-ml.jpg', '2020-03-17 12:50:11', '2020-03-17 12:50:11'),
(882, 845, '1584471076aci-savlon-antiseptic-handwash-ocean-blue-pump-300-ml.jpg', '2020-03-17 12:51:16', '2020-03-17 12:51:16'),
(885, 846, '1584538057ad0cf987-73ec-492e-9316-63e5e01d5482.jpg', '2020-03-18 07:27:37', '2020-03-18 07:27:37'),
(888, 849, '1584539417edee90c5-6fc1-4a5d-ab1f-d311c6588cac.jpg', '2020-03-18 07:50:17', '2020-03-18 07:50:17'),
(889, 850, '15845398432adbda95-8fbf-4e57-8d35-5865dccc9cc4.jpg', '2020-03-18 07:57:23', '2020-03-18 07:57:23'),
(890, 851, '1584540051a0bcf037-e227-4971-910e-58de015f9806.jpg', '2020-03-18 08:00:51', '2020-03-18 08:00:51'),
(891, 852, '1584540330e9600291-ef79-47f6-8912-508289c4f3f4.jpg', '2020-03-18 08:05:30', '2020-03-18 08:05:30'),
(892, 853, '1584540421b9a0c967-9c0b-4812-8b01-7586aa931a14.jpg', '2020-03-18 08:07:01', '2020-03-18 08:07:01'),
(893, 854, '1584554474arla-dano-daily-pusti-milk-powder-1-kg.jpg', '2020-03-18 12:01:14', '2020-03-18 12:01:14'),
(896, 857, '1584608710Marks gold high calcium low fat milk powder for 40+ yrs.jpg', '2020-03-19 03:05:11', '2020-03-19 03:05:11'),
(897, 858, '1584608747marks milk based diabetic diet.jpg', '2020-03-19 03:05:47', '2020-03-19 03:05:47'),
(898, 859, '1584608779marks active school milk powder.jpg', '2020-03-19 03:06:19', '2020-03-19 03:06:19'),
(899, 860, '1584608811Marks active school 2 in 1 chocolate milk powder.jpg', '2020-03-19 03:06:51', '2020-03-19 03:06:51'),
(900, 861, '1584608888Marks full cream milk powder.jpg', '2020-03-19 03:08:08', '2020-03-19 03:08:08'),
(901, 862, '1584608923Marks diet low fat milk powder.jpg', '2020-03-19 03:08:43', '2020-03-19 03:08:43'),
(902, 863, '1584608973Pran full cream milk powder.jpg', '2020-03-19 03:09:33', '2020-03-19 03:09:33'),
(903, 864, '1584615006Meril Baby Shampoo.jpg', '2020-03-19 04:50:06', '2020-03-19 04:50:06'),
(904, 865, '1584615039Meril Baby Olive Oil.jpg', '2020-03-19 04:50:39', '2020-03-19 04:50:39'),
(905, 866, '1584615082Meril Baby Lotion.jpg', '2020-03-19 04:51:22', '2020-03-19 04:51:22'),
(906, 867, '1584615133Meril Baby Mild Honey Soap.jpg', '2020-03-19 04:52:13', '2020-03-19 04:52:13'),
(907, 868, '1584615267Johnson\'s Baby Original Baby Softness Lotion.jpg', '2020-03-19 04:54:27', '2020-03-19 04:54:27'),
(908, 869, '1584615297Johnson\'s Baby Shampoo.jpg', '2020-03-19 04:54:57', '2020-03-19 04:54:57'),
(909, 870, '1584615327Johnson\'s Baby Blossoms Soap.jpg', '2020-03-19 04:55:27', '2020-03-19 04:55:27'),
(910, 871, '1584615356Johnson\'s Baby Oil.jpg', '2020-03-19 04:55:56', '2020-03-19 04:55:56'),
(911, 872, '1584615786Johnson\'s Baby Soap.png', '2020-03-19 05:03:06', '2020-03-19 05:03:06'),
(912, 873, '1584615817Johnson\'s Baby 24 Hour Moisture Lotion.jpg', '2020-03-19 05:03:37', '2020-03-19 05:03:37'),
(913, 874, '1584615845Johnson\'s Baby Milk + Rice Cream.jpg', '2020-03-19 05:04:06', '2020-03-19 05:04:06'),
(914, 875, '1584615878Johnson\'s Baby Bath Milk + Rice.jpg', '2020-03-19 05:04:38', '2020-03-19 05:04:38'),
(915, 876, '1584615910Johnson\'s Baby Powder.jpg', '2020-03-19 05:05:10', '2020-03-19 05:05:10'),
(916, 877, '1584615940Johnson\'s Baby Hair Oil.jpg', '2020-03-19 05:05:40', '2020-03-19 05:05:40'),
(917, 878, '1584615974Johnson\'s Baby Jelly Lightly Fragranced.jpg', '2020-03-19 05:06:14', '2020-03-19 05:06:14'),
(918, 879, '1584616003Johnson\'s Blossoms Baby Powder.jpg', '2020-03-19 05:06:43', '2020-03-19 05:06:43'),
(919, 880, '1584616038Johnson\'s Baby Jelly Lightly Fragranced.jpg', '2020-03-19 05:07:18', '2020-03-19 05:07:18'),
(920, 881, '1584616079Johnson\'s Top To Toe Baby Wash.jpg', '2020-03-19 05:07:59', '2020-03-19 05:07:59'),
(921, 882, '1584616670Dove Baby Rich Moisture Lotion.jpg', '2020-03-19 05:17:50', '2020-03-19 05:17:50'),
(922, 883, '1584616709Dove Baby Sensitive Moisture Lotion.jpg', '2020-03-19 05:18:29', '2020-03-19 05:18:29'),
(923, 884, '1584616913Parachute Just for Baby - Baby Lotion.jpg', '2020-03-19 05:21:53', '2020-03-19 05:21:53'),
(924, 885, '1584617026Parachute Just for Baby - Baby Oil.jpg', '2020-03-19 05:23:46', '2020-03-19 05:23:46'),
(925, 886, '1584617115Parachute Just for Baby - Baby Powder.jpg', '2020-03-19 05:25:15', '2020-03-19 05:25:15'),
(926, 887, '1584617253Parachute Just for Baby - Baby Soap.jpg', '2020-03-19 05:27:33', '2020-03-19 05:27:33'),
(927, 888, '1584617288Parachute Just for Baby Baby Soap Combo.jpg', '2020-03-19 05:28:08', '2020-03-19 05:28:08'),
(929, 889, '1584694143Pampers Baby Dry Pants Diaper Pant - 36 pcs.jpg', '2020-03-20 02:49:03', '2020-03-20 02:49:03'),
(930, 890, '1584694351Pampers Baby Dry Pants Diaper Pant - 44 pcs.jpg', '2020-03-20 02:52:31', '2020-03-20 02:52:31'),
(931, 891, '1584694433Pampers Baby Dry Pants Diaper Pant  - 54 pcs.jpg', '2020-03-20 02:53:53', '2020-03-20 02:53:53'),
(932, 892, '1584694519Pampers Baby Dry Pants Diaper Pant - 28 pcs.jpg', '2020-03-20 02:55:19', '2020-03-20 02:55:19'),
(933, 893, '1584694623Pampers Baby Dry Diaper Belt -38 pcs.jpg', '2020-03-20 02:57:03', '2020-03-20 02:57:03'),
(934, 894, '1584694695Pampers Baby Diaper Belt - 40 pcs.jpg', '2020-03-20 02:58:15', '2020-03-20 02:58:15'),
(935, 895, '1584694988Pampers Baby Dry Size 4 Jumbo Plus Pack Pants - 72 pcs.jpg', '2020-03-20 03:03:08', '2020-03-20 03:03:08'),
(936, 896, '1584695061Pampers Baby Dry Pants Diaper Pant New born - 60 pcs.jpg', '2020-03-20 03:04:21', '2020-03-20 03:04:21'),
(937, 897, '1584695147ampers Baby Dry Size 6 Jumbo Plus Pack Pants- 52 pcs.jpg', '2020-03-20 03:05:47', '2020-03-20 03:05:47'),
(938, 898, '1584695208Pampers Baby Dry Pants Diaper Pant - 23 pcs.jpg', '2020-03-20 03:06:48', '2020-03-20 03:06:48'),
(939, 899, '1584696223Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs.jpg', '2020-03-20 03:23:43', '2020-03-20 03:23:43'),
(940, 900, '1584696700Pampers Baby Dry Size 2 Jumbo Plus Pack Belt - 68 pcs.jpg', '2020-03-20 03:31:40', '2020-03-20 03:31:40'),
(941, 901, '1584697173Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs.jpg', '2020-03-20 03:39:33', '2020-03-20 03:39:33'),
(942, 902, '1584697272Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs.jpg', '2020-03-20 03:41:12', '2020-03-20 03:41:12'),
(943, 903, '1584697364Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs.jpg', '2020-03-20 03:42:44', '2020-03-20 03:42:44'),
(944, 904, '1584697532Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs.jpg', '2020-03-20 03:45:32', '2020-03-20 03:45:32'),
(945, 905, '1584697573Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs.jpg', '2020-03-20 03:46:13', '2020-03-20 03:46:13'),
(946, 906, '1584697609Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs.jpg', '2020-03-20 03:46:49', '2020-03-20 03:46:49'),
(947, 907, '1584697658Pampers Baby Dry Pants Diaper Pant - 76 pcs.jpg', '2020-03-20 03:47:38', '2020-03-20 03:47:38'),
(948, 908, '1584697754Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs.jpg', '2020-03-20 03:49:14', '2020-03-20 03:49:14'),
(949, 909, '1584697983Huggies Baby Diaper Ultra Belt - 40pcs.jpg', '2020-03-20 03:53:03', '2020-03-20 03:53:03'),
(950, 910, '1584698020Huggies Baby Diaper Ultra Belt - 34 pcs.jpg', '2020-03-20 03:53:40', '2020-03-20 03:53:40'),
(951, 911, '1584698055Huggies Baby Diaper Ultra Belt - 44 pcs.jpg', '2020-03-20 03:54:15', '2020-03-20 03:54:15'),
(952, 912, '1584698084Huggies Dry Baby Diaper Belt - 30 pcs.jpg', '2020-03-20 03:54:44', '2020-03-20 03:54:44'),
(953, 913, '1584698114Huggies Dry Baby Diaper Belt  - 30 pcs.jpg', '2020-03-20 03:55:14', '2020-03-20 03:55:14'),
(954, 914, '1584698148Huggies Baby Diaper Dry Belt - 36 pcs.jpg', '2020-03-20 03:55:48', '2020-03-20 03:55:48'),
(955, 915, '1584698190Huggies Baby Diaper WonderPants Pant - 42 pcs.jpg', '2020-03-20 03:56:30', '2020-03-20 03:56:30'),
(956, 916, '1584698224Huggies Baby Diaper WonderPants Pant - 24 pcs.jpg', '2020-03-20 03:57:04', '2020-03-20 03:57:04'),
(957, 917, '1584698258Huggies Baby Diaper WonderPants Pant - 46 pcs.jpg', '2020-03-20 03:57:38', '2020-03-20 03:57:38'),
(958, 918, '1584698289Huggies Baby Diaper WonderPants Pant - 38 pcs.jpg', '2020-03-20 03:58:09', '2020-03-20 03:58:09'),
(959, 919, '1584698611Huggies Baby Diaper WonderPants Pant - 54 pcs.jpg', '2020-03-20 04:03:32', '2020-03-20 04:03:32'),
(960, 920, '1584698645Huggies Baby Diaper WonderPants Pant - 38 pcs.jpg', '2020-03-20 04:04:05', '2020-03-20 04:04:05'),
(961, 921, '1584698687Huggies Baby Diaper WonderPants Pant  - 28 pcs.jpg', '2020-03-20 04:04:47', '2020-03-20 04:04:47'),
(962, 922, '1584698718Huggies Dry Baby Belt Diaper - 60 pcs.jpg', '2020-03-20 04:05:18', '2020-03-20 04:05:18'),
(963, 923, '1584698750Huggies Dry Baby Diaper Belt - 60 pcs.jpg', '2020-03-20 04:05:50', '2020-03-20 04:05:50'),
(964, 924, '1584698996Huggies Dry Baby Diaper Belt - 72 pcs.jpg', '2020-03-20 04:09:56', '2020-03-20 04:09:56'),
(965, 925, '1584699031Huggies Dry Pants Baby Diaper Pant - 50 pcs.jpg', '2020-03-20 04:10:31', '2020-03-20 04:10:31'),
(966, 926, '1584699062Huggies Dry Pants Baby Diaper Pant - 42 pcs.jpg', '2020-03-20 04:11:02', '2020-03-20 04:11:02'),
(967, 927, '1584699092Huggies Dry Pants Baby Diaper Pant  - 60 pcs.jpg', '2020-03-20 04:11:32', '2020-03-20 04:11:32'),
(968, 928, '1584699123Huggies Dry Baby Diaper Belt - 48 pcs.jpg', '2020-03-20 04:12:03', '2020-03-20 04:12:03'),
(969, 929, '1584699658Huggies Dry Pants Baby Diaper Pant - 66 pcs.jpg', '2020-03-20 04:20:59', '2020-03-20 04:20:59'),
(970, 930, '1584699689Huggies Gold Diaper Ultra Pants Boys & Girls - 38 pcs.jpg', '2020-03-20 04:21:29', '2020-03-20 04:21:29'),
(971, 931, '1584699721Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs.jpg', '2020-03-20 04:22:01', '2020-03-20 04:22:01'),
(972, 932, '1584699771Huggies Dry Baby Diaper New Born Belt - 64 pcs.jpg', '2020-03-20 04:22:51', '2020-03-20 04:22:51'),
(973, 933, '1584699804Huggies Baby Diaper Ultra New Born Belt - 48 pcs.jpg', '2020-03-20 04:23:24', '2020-03-20 04:23:24'),
(974, 934, '1584699877Huggies Dry Pants Baby Diaper Belt - 40 pcs.jpg', '2020-03-20 04:24:37', '2020-03-20 04:24:37'),
(975, 935, '1584699924Huggies Baby Diaper Ultra Belt - 30 pcs.jpg', '2020-03-20 04:25:24', '2020-03-20 04:25:24'),
(976, 936, '1584700023MamyPoko Pants Diaper Pant - 36 pcs.jpg', '2020-03-20 04:27:03', '2020-03-20 04:27:03'),
(977, 937, '1584700058MamyPoko Pants Diaper Pant - 42 pcs.jpg', '2020-03-20 04:27:38', '2020-03-20 04:27:38'),
(978, 938, '1584700093MamyPoko Pants Diaper Pant - 52 pcs.jpg', '2020-03-20 04:28:13', '2020-03-20 04:28:13'),
(979, 939, '1584700357MamyPoko Pants Diaper Pant - 44 pcs.jpg', '2020-03-20 04:32:37', '2020-03-20 04:32:37'),
(980, 940, '1584700442MamyPoko Pants Diaper Pant - 32 pcs.jpg', '2020-03-20 04:34:02', '2020-03-20 04:34:02'),
(981, 941, '1584702899MamyPoko Pants Diaper (Pant) - 22 pcs.jpg', '2020-03-20 05:14:59', '2020-03-20 05:14:59'),
(982, 942, '1584702937MamyPoko Pants Diaper Boys Pant - 64 pcs.jpg', '2020-03-20 05:15:37', '2020-03-20 05:15:37'),
(983, 943, '1584702970MamyPoko Pants Diaper Pant Boys - 52 pcs.jpg', '2020-03-20 05:16:10', '2020-03-20 05:16:10'),
(985, 945, '1584703117MamyPoko Pants Boys Diaper Pant - 46 pcs.jpg', '2020-03-20 05:18:37', '2020-03-20 05:18:37'),
(986, 946, '1584703155MamyPoko Pants Baby Diaper Pant Girls - 38 pcs.jpg', '2020-03-20 05:19:15', '2020-03-20 05:19:15'),
(987, 947, '1584703189MamyPoko Pants Baby Diaper Pant Girls - 52 pcs.jpg', '2020-03-20 05:19:49', '2020-03-20 05:19:49'),
(988, 948, '1584703224MamyPoko Pants Diaper Pant - 36 pcs.jpg', '2020-03-20 05:20:24', '2020-03-20 05:20:24'),
(991, 951, '1584812427onion red.jpg', '2020-03-21 11:40:27', '2020-03-21 11:40:27'),
(992, 952, '158876581232_t.jpg', '2020-05-06 15:50:13', '2020-05-06 15:50:13'),
(993, 952, '1588765813image.jpg', '2020-05-06 15:50:13', '2020-05-06 15:50:13'),
(998, 955, '1588766729AamRupali.jpg', '2020-05-06 16:05:29', '2020-05-06 16:05:29'),
(999, 956, '1588766786gopalvog.webp', '2020-05-06 16:06:26', '2020-05-06 16:06:26'),
(1000, 956, '1588766786gopalvog2.jpg', '2020-05-06 16:06:26', '2020-05-06 16:06:26'),
(1002, 957, '1588767401langra-mango-rajshahi.jpeg', '2020-05-06 16:16:41', '2020-05-06 16:16:41'),
(1003, 141, '1589489495milk2.jpg', '2020-05-15 00:51:36', '2020-05-15 00:51:36'),
(1004, 958, '1590891931Lychee-Fruit.jpg', '2020-05-31 06:25:32', '2020-05-31 06:25:32'),
(1005, 856, '1593963617organic-mustard-oil.jpeg', '2020-07-05 19:40:18', '2020-07-05 19:40:18'),
(1006, 855, '1593963999chicken-egg-layer.png', '2020-07-05 19:46:39', '2020-07-05 19:46:39'),
(1007, 949, '1594152926onion imported.png', '2020-07-08 00:15:28', '2020-07-08 00:15:28'),
(1008, 950, '1594153115onion deshi.webp', '2020-07-08 00:18:35', '2020-07-08 00:18:35'),
(1009, 39, '1594193303nazirshail rice.webp', '2020-07-08 11:28:24', '2020-07-08 11:28:24'),
(1010, 807, '1594194826coca cola.jpg', '2020-07-08 11:53:46', '2020-07-08 11:53:46'),
(1011, 806, '1594194998coca-cola-225-ltr.jpg', '2020-07-08 11:56:38', '2020-07-08 11:56:38'),
(1012, 805, '1594195069coca-cola-225-ltr.jpg', '2020-07-08 11:57:49', '2020-07-08 11:57:49'),
(1013, 32, '1594195494mugdal.jpg', '2020-07-08 12:04:54', '2020-07-08 12:04:54'),
(1014, 679, '1594195871Tiffany crunch\'N\' cream orange wafers.jpg', '2020-07-08 12:11:11', '2020-07-08 12:11:11'),
(1015, 660, '1594202311sundrop.jpg', '2020-07-08 13:58:32', '2020-07-08 13:58:32'),
(1016, 650, '1594202460ahmed sugar.jpg', '2020-07-08 14:01:00', '2020-07-08 14:01:00'),
(1017, 612, '1594202652dfgghhkjgf.jpg', '2020-07-08 14:04:12', '2020-07-08 14:04:12'),
(1018, 613, '1594202776dfgghhkjgf.jpg', '2020-07-08 14:06:16', '2020-07-08 14:06:16'),
(1019, 586, '1594202927complan boy.jpg', '2020-07-08 14:08:47', '2020-07-08 14:08:47'),
(1020, 624, '1594203063image1.jpg', '2020-07-08 14:11:03', '2020-07-08 14:11:03'),
(1022, 962, '1594285098cow.jpg', '2020-07-09 12:58:19', '2020-07-09 12:58:19'),
(1023, 962, '1594285099055249c2b1e70167c805522c00e552c0.jpg_80x80q90.jpg', '2020-07-09 12:58:19', '2020-07-09 12:58:19'),
(1024, 963, '1594285294013a31eff3e581df8e3279dd1e0349ca.jpg_80x80q90.jpg', '2020-07-09 13:01:34', '2020-07-09 13:01:34'),
(1025, 963, '15942852944eafaa13dcdca31d74605081932b2961.jpg_80x80q90.jpg', '2020-07-09 13:01:34', '2020-07-09 13:01:34'),
(1026, 964, '159428559077ac698a2ac853fb86f2b00e2d0f6710.jpg_80x80q90.jpg', '2020-07-09 13:06:30', '2020-07-09 13:06:30'),
(1027, 964, '159428559057f2f5c54cbe5c975d02d224ed9b8ce3.jpg_80x80q90.jpg', '2020-07-09 13:06:30', '2020-07-09 13:06:30'),
(1028, 965, '1594285791cow1.jpg', '2020-07-09 13:09:51', '2020-07-09 13:09:51'),
(1029, 965, '1594285791cow2.jpg', '2020-07-09 13:09:51', '2020-07-09 13:09:51'),
(1030, 966, '1594285963cow3.jpg', '2020-07-09 13:12:43', '2020-07-09 13:12:43'),
(1031, 966, '1594285963cow4.jpg', '2020-07-09 13:12:43', '2020-07-09 13:12:43'),
(1032, 944, '1594363611mamy.jpg', '2020-07-10 10:46:53', '2020-07-10 10:46:53'),
(1033, 58, '1594363918super.jpg', '2020-07-10 10:51:58', '2020-07-10 10:51:58'),
(1034, 142, '1594852843patali gur.png', '2020-07-16 02:40:45', '2020-07-16 02:40:45'),
(1036, 144, '1594853260sundarbon honey websize 1000gm.jpg', '2020-07-16 02:47:40', '2020-07-16 02:47:40'),
(1037, 967, '1594853370sundarbon honey websize 500gm.jpg', '2020-07-16 02:49:30', '2020-07-16 02:49:30'),
(1038, 143, '1594853438Jhola Gur.png', '2020-07-16 02:50:38', '2020-07-16 02:50:38'),
(1039, 968, '1594938009fozli-mango.png', '2020-07-17 02:20:11', '2020-07-17 02:20:11'),
(1040, 38, '1595104682mozammal miniket rice 10 kg.jpg', '2020-07-19 00:38:04', '2020-07-19 00:38:04'),
(1041, 969, '1595104796mozammal miniket 20kg.jpg', '2020-07-19 00:39:57', '2020-07-19 00:39:57'),
(1042, 970, '1595104946mozammal chinigura 1kg.jpg', '2020-07-19 00:42:26', '2020-07-19 00:42:26'),
(1043, 971, '1595105252nazirshail-rice-premium-5-kg.jpg', '2020-07-19 00:47:32', '2020-07-19 00:47:32'),
(1044, 972, '1595105337chinigura-rice-1-kg.jpg', '2020-07-19 00:48:57', '2020-07-19 00:48:57'),
(1045, 973, '1595105570pran-chinigura-rice-2_1-kg.jpg', '2020-07-19 00:52:50', '2020-07-19 00:52:50'),
(1046, 974, '1595105634atop-rice-1-kg.jpg', '2020-07-19 00:53:54', '2020-07-19 00:53:54'),
(1047, 975, '1595105684katarivog-rice-1-kg.jpg', '2020-07-19 00:54:44', '2020-07-19 00:54:44'),
(1048, 976, '1595105750rupchanda-chinigura-premium-aromatic-rice-1-kg.jpg', '2020-07-19 00:55:50', '2020-07-19 00:55:50'),
(1049, 66, '1595106722858c7360cc3d-84.jpg', '2020-07-19 01:12:03', '2020-07-19 01:12:03'),
(1050, 33, '1595106843a801b7dfe1f3-2.jpg', '2020-07-19 01:14:03', '2020-07-19 01:14:03'),
(1051, 977, '15951069779301a98b7ac7-nazirshail-rice-premium-5-kg.jpg', '2020-07-19 01:16:17', '2020-07-19 01:16:17'),
(1052, 978, '1595107052bddb100058f9-0289979_rashid-miniket-rice-25kg.jpeg', '2020-07-19 01:17:32', '2020-07-19 01:17:32'),
(1053, 979, '1595107435ed69e1f6495b-ginger-local-500x500.jpg', '2020-07-19 01:23:56', '2020-07-19 01:23:56'),
(1054, 980, '1595107565ce3f94e2ffa0-download.jpg', '2020-07-19 01:26:05', '2020-07-19 01:26:05'),
(1055, 981, '1595107630bed55ee4c8be-roshun.jpg', '2020-07-19 01:27:10', '2020-07-19 01:27:10');
INSERT INTO `image_products` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1056, 683, '15951077862018-04-06_221313.522794cocolaeggnoodles180gm_5ab381498dfe5-.3446.jpg', '2020-07-19 01:29:46', '2020-07-19 01:29:46'),
(1057, 55, '1595108619aci-pure-atta-2-kg.jpg', '2020-07-19 01:43:40', '2020-07-19 01:43:40'),
(1058, 82, '1595108705fresh-refined-sugar-1-kg.jpg', '2020-07-19 01:45:06', '2020-07-19 01:45:06'),
(1059, 982, '1595108929rice-flour-500x500-416x416.jpg', '2020-07-19 01:48:49', '2020-07-19 01:48:49'),
(1060, 983, '15951092082019-07-24_052822.754956Thumbnail_5.jpg', '2020-07-19 01:53:28', '2020-07-19 01:53:28'),
(1061, 128, '15951093123732318ce193-11e84172b1c3-5.jpg', '2020-07-19 01:55:12', '2020-07-19 01:55:12'),
(1062, 984, '1595262599EGC001.jpeg', '2020-07-20 20:30:00', '2020-07-20 20:30:00'),
(1063, 984, '1595262600EGC001_1.jpeg', '2020-07-20 20:30:00', '2020-07-20 20:30:00'),
(1064, 985, '1595262801EGC002.jpeg', '2020-07-20 20:33:21', '2020-07-20 20:33:21'),
(1065, 985, '1595262801EGC002_2.jpeg', '2020-07-20 20:33:22', '2020-07-20 20:33:22'),
(1066, 986, '1595262872EGC003.jpeg', '2020-07-20 20:34:32', '2020-07-20 20:34:32'),
(1067, 987, '1595262970EGC004.jpeg', '2020-07-20 20:36:10', '2020-07-20 20:36:10'),
(1068, 987, '1595262970EGC004_1.jpeg', '2020-07-20 20:36:10', '2020-07-20 20:36:10'),
(1069, 988, '1595263205EGC005.jpeg', '2020-07-20 20:40:05', '2020-07-20 20:40:05'),
(1070, 988, '1595263205EGC005_1.jpeg', '2020-07-20 20:40:05', '2020-07-20 20:40:05'),
(1071, 989, '1595263313EGC006.jpeg', '2020-07-20 20:41:53', '2020-07-20 20:41:53'),
(1072, 989, '1595263313EGC006_1.jpeg', '2020-07-20 20:41:54', '2020-07-20 20:41:54'),
(1073, 990, '1595263383EGC007.jpeg', '2020-07-20 20:43:03', '2020-07-20 20:43:03'),
(1074, 991, '1595263465EGC008.jpeg', '2020-07-20 20:44:25', '2020-07-20 20:44:25'),
(1075, 991, '1595263465EGC008_1.jpeg', '2020-07-20 20:44:25', '2020-07-20 20:44:25'),
(1076, 992, '1595263634EGC009.jpeg', '2020-07-20 20:47:14', '2020-07-20 20:47:14'),
(1077, 992, '1595263634EGC009_1.jpeg', '2020-07-20 20:47:14', '2020-07-20 20:47:14'),
(1078, 993, '1595264017EGM-001.jpg', '2020-07-20 20:53:37', '2020-07-20 20:53:37'),
(1079, 993, '1595264017EGM-001_1.jpg', '2020-07-20 20:53:37', '2020-07-20 20:53:37'),
(1080, 994, '1595264146EGM-002.jpg', '2020-07-20 20:55:46', '2020-07-20 20:55:46'),
(1081, 995, '1595264226EGM-003.jpg', '2020-07-20 20:57:07', '2020-07-20 20:57:07'),
(1082, 995, '1595264227EGM-003_1.jpg', '2020-07-20 20:57:07', '2020-07-20 20:57:07'),
(1083, 996, '1595264303EGM-004.jpg', '2020-07-20 20:58:23', '2020-07-20 20:58:23'),
(1084, 997, '1595264485EGM-005.jpg', '2020-07-20 21:01:25', '2020-07-20 21:01:25'),
(1085, 997, '1595264485EGM-005_1.jpg', '2020-07-20 21:01:25', '2020-07-20 21:01:25'),
(1086, 998, '1595440627EGS001_220kg.jpg', '2020-07-22 21:57:08', '2020-07-22 21:57:08'),
(1087, 998, '1595440628EGS001_1.jpg', '2020-07-22 21:57:09', '2020-07-22 21:57:09'),
(1088, 999, '1595441343EGS002_250.jpg', '2020-07-22 22:09:05', '2020-07-22 22:09:05'),
(1089, 1000, '1595441577EGS003_160.jpg', '2020-07-22 22:12:57', '2020-07-22 22:12:57'),
(1090, 1000, '1595441577EGS003_1.jpg', '2020-07-22 22:12:58', '2020-07-22 22:12:58'),
(1091, 1001, '1595441837EGS004_1.jpg', '2020-07-22 22:17:18', '2020-07-22 22:17:18'),
(1092, 1001, '1595441838EGS005_1.jpg', '2020-07-22 22:17:19', '2020-07-22 22:17:19'),
(1093, 1002, '1595442252EGS005_210.jpg', '2020-07-22 22:24:13', '2020-07-22 22:24:13'),
(1094, 1003, '1596820980ilish Fish.png', '2020-08-07 21:23:01', '2020-08-07 21:23:01'),
(1095, 1003, '1596820981ilish Fish2.png', '2020-08-07 21:23:01', '2020-08-07 21:23:01'),
(1096, 1004, '1596821243ilish Fish.png', '2020-08-07 21:27:23', '2020-08-07 21:27:23'),
(1097, 1004, '1596821243ilish Fish2.png', '2020-08-07 21:27:23', '2020-08-07 21:27:23'),
(1098, 1005, '1596821422ilish Fish.png', '2020-08-07 21:30:22', '2020-08-07 21:30:22'),
(1099, 1005, '1596821422ilish Fish2.png', '2020-08-07 21:30:22', '2020-08-07 21:30:22'),
(1100, 1006, '1597508213ilish Fish.png', '2020-08-15 20:16:54', '2020-08-15 20:16:54'),
(1101, 1007, '1597865952WR841N.jpg', '2020-08-19 23:39:13', '2020-08-19 23:39:13'),
(1102, 1008, '1597866110WR850N.jpg', '2020-08-19 23:41:50', '2020-08-19 23:41:50'),
(1103, 1008, '15978661101_WR850N.jpg', '2020-08-19 23:41:50', '2020-08-19 23:41:50'),
(1104, 1009, '15978662611_C20.jpg', '2020-08-19 23:44:21', '2020-08-19 23:44:21'),
(1105, 1009, '1597866261C20.jpg', '2020-08-19 23:44:21', '2020-08-19 23:44:21'),
(1106, 1010, '1597866445WR820N.jpg', '2020-08-19 23:47:25', '2020-08-19 23:47:25'),
(1107, 1011, '1597866641C5 2.png', '2020-08-19 23:50:41', '2020-08-19 23:50:41'),
(1108, 1011, '1597866641C5 3.png', '2020-08-19 23:50:41', '2020-08-19 23:50:41'),
(1109, 1012, '1597866921C60.jpg', '2020-08-19 23:55:21', '2020-08-19 23:55:21'),
(1110, 1012, '1597866921C60 2.jpg', '2020-08-19 23:55:21', '2020-08-19 23:55:21'),
(1111, 1013, '1597867081WR940N.jpg', '2020-08-19 23:58:01', '2020-08-19 23:58:01'),
(1112, 1013, '1597867081WR940N 2.jpg', '2020-08-19 23:58:02', '2020-08-19 23:58:02'),
(1113, 1013, '1597867082WR940N 3.jpg', '2020-08-19 23:58:02', '2020-08-19 23:58:02'),
(1114, 1014, '1597867252WR840N.jpg', '2020-08-20 00:00:52', '2020-08-20 00:00:52'),
(1115, 1014, '1597867252WR840N 2.jpg', '2020-08-20 00:00:52', '2020-08-20 00:00:52'),
(1116, 1015, '1597867616A9.jpg', '2020-08-20 00:06:56', '2020-08-20 00:06:56'),
(1117, 1016, '1597867707WR845N.jpg', '2020-08-20 00:08:27', '2020-08-20 00:08:27'),
(1118, 1017, '1597867806W8961ND.jpg', '2020-08-20 00:10:06', '2020-08-20 00:10:06'),
(1119, 1017, '1597867806W8961ND 2.jpg', '2020-08-20 00:10:06', '2020-08-20 00:10:06'),
(1120, 1018, '1597867892tl-wr840n-2-500x500.jpg', '2020-08-20 00:11:32', '2020-08-20 00:11:32'),
(1121, 1018, '1597867892tl-wr840n-3-500x500.jpg', '2020-08-20 00:11:33', '2020-08-20 00:11:33'),
(1122, 1019, '1597867982archer-ax10-500x500.jpg', '2020-08-20 00:13:02', '2020-08-20 00:13:02'),
(1123, 1019, '1597867982archer-ax10-2-500x500.jpg', '2020-08-20 00:13:02', '2020-08-20 00:13:02'),
(1124, 1020, '1597868062hyu-500x500 (1).jpg', '2020-08-20 00:14:22', '2020-08-20 00:14:22'),
(1125, 1021, '1597868280Tenda F3-1-500x500.jpg', '2020-08-20 00:18:00', '2020-08-20 00:18:00'),
(1126, 1021, '1597868280Tenda F3-2-500x500.jpg', '2020-08-20 00:18:01', '2020-08-20 00:18:01'),
(1127, 1022, '1597868351Tenda N301-1-500x500.jpg', '2020-08-20 00:19:11', '2020-08-20 00:19:11'),
(1128, 1022, '1597868351Tenda N301-2-500x500.jpg', '2020-08-20 00:19:11', '2020-08-20 00:19:11'),
(1129, 1023, '15978684352-500x500.jpg', '2020-08-20 00:20:36', '2020-08-20 00:20:36'),
(1130, 1024, '1597868507f9-1-500x500.jpg', '2020-08-20 00:21:47', '2020-08-20 00:21:47'),
(1131, 1024, '1597868507f9-3-500x500.jpg', '2020-08-20 00:21:47', '2020-08-20 00:21:47'),
(1132, 1025, '1597868561ac5-500x500.jpg', '2020-08-20 00:22:41', '2020-08-20 00:22:41'),
(1133, 1025, '1597868561ac5-1-500x500.jpg', '2020-08-20 00:22:41', '2020-08-20 00:22:41'),
(1134, 1026, '1597868634ac15-2-500x500.jpg', '2020-08-20 00:23:54', '2020-08-20 00:23:54'),
(1135, 1026, '1597868634ac15-3-500x500.jpg', '2020-08-20 00:23:54', '2020-08-20 00:23:54'),
(1136, 1027, '15978686984g630-1-500x500.jpg', '2020-08-20 00:24:58', '2020-08-20 00:24:58'),
(1137, 1027, '15978686984g630-500x500.jpg', '2020-08-20 00:24:58', '2020-08-20 00:24:58'),
(1138, 1028, '1597868830ac6-1-500x500.jpg', '2020-08-20 00:27:10', '2020-08-20 00:27:10'),
(1139, 1028, '1597868830ac6-2-500x500.jpg', '2020-08-20 00:27:10', '2020-08-20 00:27:10'),
(1140, 1029, '1597868893Tenda FH1202-1-500x500.jpg', '2020-08-20 00:28:13', '2020-08-20 00:28:13'),
(1141, 1029, '1597868893Tenda FH1202-2-500x500.jpg', '2020-08-20 00:28:13', '2020-08-20 00:28:13'),
(1142, 1030, '1597868964f6-1-500x500.jpg', '2020-08-20 00:29:24', '2020-08-20 00:29:24'),
(1143, 1030, '1597868964f6-4-500x500.jpg', '2020-08-20 00:29:24', '2020-08-20 00:29:24'),
(1144, 1031, '1597870032mw301r-1-500x500.jpg', '2020-08-20 00:47:12', '2020-08-20 00:47:12'),
(1145, 1031, '1597870032mw301r-3-500x500.jpg', '2020-08-20 00:47:12', '2020-08-20 00:47:12'),
(1146, 1032, '1597870094mw302r-1-500x500.jpg', '2020-08-20 00:48:14', '2020-08-20 00:48:14'),
(1147, 1032, '1597870094mw302r-2-500x500.jpg', '2020-08-20 00:48:14', '2020-08-20 00:48:14'),
(1148, 1033, '1597870160mw305r-1-500x500.jpg', '2020-08-20 00:49:20', '2020-08-20 00:49:20'),
(1149, 1033, '1597870160mw305r-3-500x500.jpg', '2020-08-20 00:49:20', '2020-08-20 00:49:20'),
(1150, 1033, '1597870160mw305r-2-500x500.jpg', '2020-08-20 00:49:20', '2020-08-20 00:49:20'),
(1151, 1034, '1597870351MW325R.jpg', '2020-08-20 00:52:31', '2020-08-20 00:52:31'),
(1152, 1034, '1597870351MW325R 2.jpg', '2020-08-20 00:52:31', '2020-08-20 00:52:31'),
(1153, 1034, '1597870351MW325R 3.jpg', '2020-08-20 00:52:31', '2020-08-20 00:52:31'),
(1154, 1035, '1597870414ac12-2-500x500.jpg', '2020-08-20 00:53:35', '2020-08-20 00:53:35'),
(1155, 1035, '1597870415ac12-3-500x500.jpg', '2020-08-20 00:53:35', '2020-08-20 00:53:35'),
(1156, 1036, '159787048024-500x500.jpg', '2020-08-20 00:54:40', '2020-08-20 00:54:40'),
(1157, 1036, '159787048023-500x500.jpg', '2020-08-20 00:54:40', '2020-08-20 00:54:40'),
(1158, 1037, '1597870672mi-4c-1-500x500.jpg', '2020-08-20 00:57:52', '2020-08-20 00:57:52'),
(1159, 1037, '1597870672mi-4c-router-1-500x500.jpg', '2020-08-20 00:57:52', '2020-08-20 00:57:52'),
(1160, 1038, '1597870751mi-4c-1-500x500.jpg', '2020-08-20 00:59:11', '2020-08-20 00:59:11'),
(1161, 1038, '1597870751mi-4c-router-1-500x500.jpg', '2020-08-20 00:59:11', '2020-08-20 00:59:11'),
(1162, 1039, '1597870951-font-b-Xiaomi-b-font-font-b-WiFi-b-font-font-b-Amplifier-b-font.jpg', '2020-08-20 01:02:31', '2020-08-20 01:02:31'),
(1163, 1039, '1597870951ffaf0cb1ce89ec4a4c8f044a99a36f25_tn.jpg', '2020-08-20 01:02:31', '2020-08-20 01:02:31'),
(1164, 1040, '1597871090u1-500x500.jpg', '2020-08-20 01:04:50', '2020-08-20 01:04:50'),
(1165, 1040, '1597871090u2-500x500.jpg', '2020-08-20 01:04:50', '2020-08-20 01:04:50'),
(1166, 1041, '1598091110UiiSii HM13.jpg', '2020-08-22 14:11:50', '2020-08-22 14:11:50'),
(1167, 1041, '1598091110UiiSii HM13 2.jpg', '2020-08-22 14:11:50', '2020-08-22 14:11:50'),
(1168, 1042, '1598091458UiiSii HM12.jpg', '2020-08-22 14:17:39', '2020-08-22 14:17:39'),
(1169, 1043, '1598091684UiiSii C100.jpg', '2020-08-22 14:21:24', '2020-08-22 14:21:24'),
(1170, 1043, '1598091684UiiSii C100 2.jpg', '2020-08-22 14:21:24', '2020-08-22 14:21:24'),
(1171, 1044, '1598092300UiiSii T8.jpg', '2020-08-22 14:31:40', '2020-08-22 14:31:40'),
(1172, 1044, '1598092300UiiSii T8 2.jpg', '2020-08-22 14:31:40', '2020-08-22 14:31:40'),
(1173, 1044, '1598092300UiiSii T8 3.jpg', '2020-08-22 14:31:40', '2020-08-22 14:31:40'),
(1175, 1046, '1598092695UiiSii BT119.jpg', '2020-08-22 14:38:16', '2020-08-22 14:38:16'),
(1176, 1046, '1598092696UiiSii BT119 2.jpg', '2020-08-22 14:38:16', '2020-08-22 14:38:16'),
(1177, 1047, '1598093079UiiSii HM8.jpg', '2020-08-22 14:44:39', '2020-08-22 14:44:39'),
(1178, 1048, '1598093359UiiSii UX B.jpg', '2020-08-22 14:49:19', '2020-08-22 14:49:19'),
(1179, 1048, '1598093359UiiSii UX W.jpg', '2020-08-22 14:49:19', '2020-08-22 14:49:19'),
(1180, 1049, '1598093433UiiSii UX W.jpg', '2020-08-22 14:50:33', '2020-08-22 14:50:33'),
(1182, 1050, '1598093961UiiSii BN19 2.png', '2020-08-22 14:59:21', '2020-08-22 14:59:21'),
(1185, 1052, '1598103050rem 301.jpg', '2020-08-22 17:30:50', '2020-08-22 17:30:50'),
(1186, 1052, '1598103050rem 301..jpg', '2020-08-22 17:30:50', '2020-08-22 17:30:50'),
(1187, 1053, '1598103198501i rem.jpg', '2020-08-22 17:33:18', '2020-08-22 17:33:18'),
(1188, 1054, '1598103308rem 105.jpg', '2020-08-22 17:35:08', '2020-08-22 17:35:08'),
(1189, 1055, '1598103396rem 510.jpg', '2020-08-22 17:36:36', '2020-08-22 17:36:36'),
(1190, 1055, '1598103396rem 510..jpg', '2020-08-22 17:36:36', '2020-08-22 17:36:36'),
(1191, 1056, '1598103471rem 303.jpg', '2020-08-22 17:37:51', '2020-08-22 17:37:51'),
(1192, 1057, '1598103582rem 510.jpg', '2020-08-22 17:39:42', '2020-08-22 17:39:42'),
(1193, 1057, '1598103582rem 510..jpg', '2020-08-22 17:39:42', '2020-08-22 17:39:42'),
(1194, 1058, '1598103931rem 512.jpg', '2020-08-22 17:45:31', '2020-08-22 17:45:31'),
(1195, 1059, '1598104131rem 610d.jpg', '2020-08-22 17:48:51', '2020-08-22 17:48:51'),
(1196, 1060, '1598104297s28.jpg', '2020-08-22 17:51:37', '2020-08-22 17:51:37'),
(1197, 1061, '1598104375s2..jpg', '2020-08-22 17:52:55', '2020-08-22 17:52:55'),
(1198, 1061, '1598104375s2.jpg', '2020-08-22 17:52:55', '2020-08-22 17:52:55'),
(1199, 1062, '1598104899711.jpg', '2020-08-22 18:01:39', '2020-08-22 18:01:39'),
(1200, 1062, '1598104899711..jpg', '2020-08-22 18:01:39', '2020-08-22 18:01:39'),
(1201, 1063, '1598105096rpp 139..jpg', '2020-08-22 18:04:56', '2020-08-22 18:04:56'),
(1202, 1063, '1598105096rpp 139.jpg', '2020-08-22 18:04:56', '2020-08-22 18:04:56'),
(1203, 1064, '1598105271rpp 147.jpg', '2020-08-22 18:07:51', '2020-08-22 18:07:51'),
(1204, 1065, '1598105534rrp 141.jpg', '2020-08-22 18:12:15', '2020-08-22 18:12:15'),
(1205, 1066, '1598105641123.jpg', '2020-08-22 18:14:01', '2020-08-22 18:14:01'),
(1206, 1067, '1598105759rrp 73.jpg', '2020-08-22 18:15:59', '2020-08-22 18:15:59'),
(1207, 1068, '1598105894119.jpg', '2020-08-22 18:18:14', '2020-08-22 18:18:14'),
(1208, 1069, '1598106059leader 2.jpg', '2020-08-22 18:20:59', '2020-08-22 18:20:59'),
(1209, 1070, '1598106175rpp 153.jpg', '2020-08-22 18:22:55', '2020-08-22 18:22:55'),
(1210, 1071, '1598106284106.jpg', '2020-08-22 18:24:45', '2020-08-22 18:24:45'),
(1211, 1072, '1598106438n3.jpg', '2020-08-22 18:27:18', '2020-08-22 18:27:18'),
(1212, 1073, '1598106638piston basic.jpg', '2020-08-22 18:30:38', '2020-08-22 18:30:38'),
(1213, 1074, '1598106812sports youth.jpg', '2020-08-22 18:33:32', '2020-08-22 18:33:32'),
(1214, 1075, '1598106981airdots pro,.jpg', '2020-08-22 18:36:21', '2020-08-22 18:36:21'),
(1215, 1075, '1598106981airdots pro.jpg', '2020-08-22 18:36:21', '2020-08-22 18:36:21'),
(1216, 1076, '1598107076type c.jpg', '2020-08-22 18:37:56', '2020-08-22 18:37:56'),
(1217, 1077, '1598108623redmi.jpg', '2020-08-22 19:03:43', '2020-08-22 19:03:43'),
(1218, 1078, '1598109453xiaomi 2.jpg', '2020-08-22 19:17:33', '2020-08-22 19:17:33'),
(1219, 1079, '1598109658xiaomi v3.jpg', '2020-08-22 19:20:58', '2020-08-22 19:20:58'),
(1220, 1080, '1598109835redmi  c30.jpg', '2020-08-22 19:23:55', '2020-08-22 19:23:55'),
(1221, 1081, '1598109996mi 12.jpg', '2020-08-22 19:26:36', '2020-08-22 19:26:36'),
(1222, 1082, '1598110256Mi In-Ear Pro HD Headphones.jpg', '2020-08-22 19:30:57', '2020-08-22 19:30:57'),
(1223, 1082, '1598110257,,.jpg', '2020-08-22 19:30:57', '2020-08-22 19:30:57'),
(1224, 1083, '1598110388Mi In-Ear Pro HD Headphones.jpg', '2020-08-22 19:33:08', '2020-08-22 19:33:08'),
(1225, 1083, '1598110388max.jpg', '2020-08-22 19:33:08', '2020-08-22 19:33:08'),
(1226, 1084, '1598110568buds2.jpg', '2020-08-22 19:36:09', '2020-08-22 19:36:09'),
(1227, 1084, '1598110569realme buds 2.jpg', '2020-08-22 19:36:09', '2020-08-22 19:36:09'),
(1228, 1085, '1598110677r20.jpg', '2020-08-22 19:37:57', '2020-08-22 19:37:57'),
(1229, 1086, '1598110953realme buds.jpg', '2020-08-22 19:42:33', '2020-08-22 19:42:33'),
(1230, 1086, '1598110953realme buds..jpg', '2020-08-22 19:42:33', '2020-08-22 19:42:33'),
(1231, 1087, '1598111152realmi airbuds.jpg', '2020-08-22 19:45:52', '2020-08-22 19:45:52'),
(1232, 1088, '1598111310airbuds 4.jpg', '2020-08-22 19:48:30', '2020-08-22 19:48:30'),
(1233, 1089, '1598111497airdots.jpg', '2020-08-22 19:51:37', '2020-08-22 19:51:37'),
(1234, 1090, '1598111649105 ipx4.jpg', '2020-08-22 19:54:09', '2020-08-22 19:54:09'),
(1235, 1091, '1598118091650IN.jpg', '2020-08-22 21:41:32', '2020-08-22 21:41:32'),
(1236, 1092, '1598119908806in-ac750-1-500x500.jpg', '2020-08-22 22:11:48', '2020-08-22 22:11:48'),
(1237, 1093, '1598119967819 AC750.jpg', '2020-08-22 22:12:47', '2020-08-22 22:12:47'),
(1238, 1094, '1598120191841 AC1200.jpg', '2020-08-22 22:16:31', '2020-08-22 22:16:31'),
(1239, 1095, '1598120306DIR-1360 EXO AC1300.jpg', '2020-08-22 22:18:26', '2020-08-22 22:18:26'),
(1240, 1096, '1598120557DIR-600M.jpeg', '2020-08-22 22:22:37', '2020-08-22 22:22:37'),
(1241, 1097, '1598120712DIR-816 Wireless AC750.jpg', '2020-08-22 22:25:12', '2020-08-22 22:25:12'),
(1242, 1098, '1598120907DWR‑921 4G.jpg', '2020-08-22 22:28:27', '2020-08-22 22:28:27'),
(1243, 1099, '1598121151DWR-910 4G.jpg', '2020-08-22 22:32:31', '2020-08-22 22:32:31'),
(1244, 1100, '1598123282HM9.jpg', '2020-08-22 23:08:03', '2020-08-22 23:08:03'),
(1245, 1101, '1598123744morich-gura.jpg', '2020-08-22 23:15:44', '2020-08-22 23:15:44'),
(1246, 1102, '1598123796morich-gura.jpg', '2020-08-22 23:16:36', '2020-08-22 23:16:36'),
(1247, 1103, '1598123833morich-gura.jpg', '2020-08-22 23:17:14', '2020-08-22 23:17:14'),
(1248, 1104, '1598123971holud-gura.jpg', '2020-08-22 23:19:31', '2020-08-22 23:19:31'),
(1249, 1105, '1598124091holud-gura.jpg', '2020-08-22 23:21:31', '2020-08-22 23:21:31'),
(1250, 1106, '1598124275dhoniya-gura.jpg', '2020-08-22 23:24:35', '2020-08-22 23:24:35'),
(1251, 1107, '1598124341dhoniya-gura.jpg', '2020-08-22 23:25:41', '2020-08-22 23:25:41'),
(1252, 1108, '1598193980118118259_308850877044085_9163016870802367596_n.jpg', '2020-08-23 18:46:21', '2020-08-23 18:46:21'),
(1253, 1109, '1598194100118118259_308850877044085_9163016870802367596_n.jpg', '2020-08-23 18:48:20', '2020-08-23 18:48:20'),
(1254, 1110, '1598194177118118259_308850877044085_9163016870802367596_n.jpg', '2020-08-23 18:49:37', '2020-08-23 18:49:37'),
(1255, 1111, '15982788291129e9b2cc5273175b278534afe2a325.jpg_720x720q75.jpg', '2020-08-24 18:20:31', '2020-08-24 18:20:31'),
(1256, 1111, '15982788316f6660561692798348bc71a2c599ffea.jpg_720x720q75.jpg', '2020-08-24 18:20:31', '2020-08-24 18:20:31'),
(1257, 1111, '15982788318f90c3b746ef0f2f143d50060cbe653d.jpg_720x720q75.jpg', '2020-08-24 18:20:31', '2020-08-24 18:20:31'),
(1258, 1112, '1598736118malta.jpg', '2020-08-30 01:21:59', '2020-08-30 01:21:59'),
(1259, 1112, '1598736119malta 2.jpg', '2020-08-30 01:21:59', '2020-08-30 01:21:59'),
(1260, 1113, '15987361960002370_guava-thai-500-gm_360.png', '2020-08-30 01:23:16', '2020-08-30 01:23:16'),
(1261, 1114, '1598736375green apple.png', '2020-08-30 01:26:15', '2020-08-30 01:26:15'),
(1262, 1115, '15987364820003021_hog-plum-amra-500-gm_360.png', '2020-08-30 01:28:02', '2020-08-30 01:28:02'),
(1266, 1117, '1598737174jambura.jpg', '2020-08-30 01:39:34', '2020-08-30 01:39:34'),
(1267, 1117, '159873717451eSK3PFBKL.png', '2020-08-30 01:39:34', '2020-08-30 01:39:34'),
(1268, 1118, '1598737536amla 22.JPG', '2020-08-30 01:45:36', '2020-08-30 01:45:36'),
(1269, 1118, '1598737536amla-hair.jpg', '2020-08-30 01:45:36', '2020-08-30 01:45:36'),
(1271, 1116, '1598737946deshi peyara.jpg', '2020-08-30 01:52:26', '2020-08-30 01:52:26'),
(1272, 1119, '1598996377Discovery Peanut Butter chunky.jpg', '2020-09-02 01:39:37', '2020-09-02 01:39:37'),
(1273, 1120, '1598996529Peanut Butter Smooth Creamy.jpg', '2020-09-02 01:42:09', '2020-09-02 01:42:09'),
(1274, 1121, '1598996645Discovery Peanut Butter- Smooth n Creamy 510G.jpg', '2020-09-02 01:44:05', '2020-09-02 01:44:05'),
(1275, 1122, '1598996815Discovery Peanut Butter-340gm.jpg', '2020-09-02 01:46:55', '2020-09-02 01:46:55'),
(1276, 1123, '1598996977Organic Apple Cider Vinegar with mother.jpg', '2020-09-02 01:49:37', '2020-09-02 01:49:37'),
(1277, 1124, '1598997126Organic Unfiltered Apple Cider Virgin 1Ltr.jpg', '2020-09-02 01:52:06', '2020-09-02 01:52:06'),
(1278, 1125, '1598997281Discovery Apple Cider Vinegar 473ml.jpg', '2020-09-02 01:54:41', '2020-09-02 01:54:41'),
(1279, 1126, '1598997431Organic Apple Cider Vinegar with mother 250ml.jpg', '2020-09-02 01:57:11', '2020-09-02 01:57:11'),
(1281, 1128, '1598997724Discovery Mustard Sauce- 227gm.jpg', '2020-09-02 02:02:04', '2020-09-02 02:02:04'),
(1282, 1129, '1599071768Pasta Hut Macaroni 500 gm.jpg', '2020-09-02 22:36:08', '2020-09-02 22:36:08'),
(1283, 1130, '1599071896Pasta Hat Spaghetti Pasta 500 gm - Imported Food.jpg', '2020-09-02 22:38:16', '2020-09-02 22:38:16'),
(1284, 1130, '1599071896Spaghetti Pasta 500gm--Pasta Hat.jpg', '2020-09-02 22:38:16', '2020-09-02 22:38:16'),
(1285, 1131, '1599072092Pasta Hat Spirali pasta 500 gm Imported Food.jpg', '2020-09-02 22:41:32', '2020-09-02 22:41:32'),
(1286, 1132, '1599072461Luglio Olive pomace Oil-5litre(Cooking Oil)- Made in Italy.jpg', '2020-09-02 22:47:42', '2020-09-02 22:47:42'),
(1287, 1133, '1599072520pasta_hat_vermicelli_fine_500g.png', '2020-09-02 22:48:40', '2020-09-02 22:48:40'),
(1288, 1134, '1599072774_mpimage0.jpg', '2020-09-02 22:52:54', '2020-09-02 22:52:54'),
(1289, 1135, '1599072869Pasta Hat Elbow Pasta , 500gm.jpg', '2020-09-02 22:54:30', '2020-09-02 22:54:30'),
(1290, 59, '15995036964ca0e44c6064-13.jpg', '2020-09-07 22:34:58', '2020-09-07 22:34:58'),
(1291, 60, '1599503787spm.jpg', '2020-09-07 22:36:27', '2020-09-07 22:36:27'),
(1292, 1136, '1599509679spm wipes.jpg', '2020-09-08 00:14:39', '2020-09-08 00:14:39'),
(1293, 1137, '1599763693kaju badam.jpg', '2020-09-10 22:48:14', '2020-09-10 22:48:14'),
(1294, 1137, '1599763694kaju badam 2.jpg', '2020-09-10 22:48:14', '2020-09-10 22:48:14'),
(1295, 1138, '1599764142kath badam 2.png', '2020-09-10 22:55:42', '2020-09-10 22:55:42'),
(1296, 1138, '1599764142kath badam.jpg', '2020-09-10 22:55:42', '2020-09-10 22:55:42'),
(1297, 1139, '1599764493pista badam.jpg', '2020-09-10 23:01:33', '2020-09-10 23:01:33'),
(1298, 1140, '1599764978china badam.jpg', '2020-09-10 23:09:38', '2020-09-10 23:09:38'),
(1301, 1141, '1601132971dry fuits nuts final.jpg', '2020-09-26 19:09:31', '2020-09-26 19:09:31'),
(1302, 1127, '1601133246discovery bbq sauce.jpg', '2020-09-26 19:14:06', '2020-09-26 19:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` int(191) NOT NULL,
  `create_date` date NOT NULL,
  `admin_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `quantity` int(191) NOT NULL DEFAULT 1,
  `buying_price` double(8,2) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `buying_unit_price` double(8,2) NOT NULL,
  `selling_unit_price` double(8,2) NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `create_date`, `admin_id`, `product_id`, `quantity`, `buying_price`, `currency`, `buying_unit_price`, `selling_unit_price`, `selling_price`, `created_at`, `updated_at`) VALUES
(1, '2020-08-04', 1, 856, 20, 115.00, 'BDT', 5.75, 220.00, 4400.00, '2020-08-04 00:32:04', '2020-08-04 00:32:04'),
(2, '2020-08-04', 1, 144, 20, 565.00, 'BDT', 28.25, 1150.00, 23000.00, '2020-08-04 00:32:49', '2020-08-04 00:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `status` int(191) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `mobile`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mike Nelson', 'New: DA50 for egrocery.com.bd', '84717815476', 'Hi there \r\n \r\nIf you want to get ahead of your competition, have a higher Domain Authority score. Its just simple as that. \r\nWith our service you get Domain Authority above 50 points in just 30 days. \r\n \r\nThis service is guaranteed \r\n \r\nFor more information, check our service here \r\nhttps://www.monkeydigital.co/Get-Guaranteed-Domain-Authority-50/ \r\n \r\nN E W : \r\nDA60 is now available here \r\nhttps://www.monkeydigital.co/product/moz-da60-seo-plan/ \r\n \r\n \r\nthank you \r\nMike Nelson\r\n \r\nMonkey Digital \r\nsupport@monkeydigital.co', 0, '2020-09-28 18:33:45', '2020-09-28 18:33:45'),
(2, 'Maike Reine-Berg', 'We Can Help.', '81283775279', 'My name is Maike Reine-Berg, Customer Service Representative for AAA Structured Finance Ltd, thank you for your time, my company offers project financing and lending services, do you have any project that requires funding at the moment? You need a business or personal loan? We are ready to work with you on a more transparent approach. Contact Us for more information via email:  Reine.berg@outlook.com.', 0, '2020-09-30 13:14:26', '2020-09-30 13:14:26'),
(3, 'James Phillips', 'cheap monthly SEO plans', '89241183983', 'Hi! \r\nI have just checked egrocery.com.bd for the ranking keywords and seen that your SEO metrics could use a boost. \r\n \r\nWe will improve your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart increasing your sales and leads with us, today! \r\n \r\nregards \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', 0, '2020-10-02 17:35:17', '2020-10-02 17:35:17'),
(4, 'MarquisJes', 'ARE YOU WINING IN THIS  COVID-19 NEW ECONOMY?', '86787981379', 'HAVE YOU EVER WANTED TO LEARN HOW TO CLOSE 100% OF YOUR CONSULTATIONS & HELP YOUR COMPANY  WIN IN OUR NEW  COVID-19  ECONOMY? \r\n \r\nSEE THE OFFICIAL TRAILER:@ \r\nThe Author site https://www.tonydeoleo.com \r\n \r\n \r\nDownload your E-book Copy Now @ The Author official site: \r\nhttps://www.tonydeoleo.com \r\nAmazon : https://www.amazon.com/dp/195226359X \r\nBarns&Nobles : https://m.barnesandnoble.com/w/closing-100-of-your-fitness-consultations-tony-deoleo/1137240205', 0, '2020-10-03 00:45:54', '2020-10-03 00:45:54'),
(5, 'Daniel', 'Get a new website and improve your business', '87893525695', 'Hi there, \r\n \r\nMy name is Daniel Todercan, and I’ll keep this quick. I’m the founder of New Light Digital, and we help people like you generate new business from their own websites (as opposed to having a brochure-type website). \r\n \r\nWould you be interested in learning more? I’d be happy to talk to you about the things we do differently. You can learn more about our services here: https://bit.ly/3l0sCqQ \r\n \r\nI am also including a valuable PDF guide for you below. \r\n \r\n25 Point Website Usability Checklist --  use it to see if your current website meets the minimum user experience requirements to show up in Google search results. Download for free here: https://bit.ly/30kVDWs \r\n \r\nLastly, if you’re not interested in a website overhaul, would you like an SEO audit for your website? It would show you how you are ranking on Google, and what issues you might have that are preventing you from ranking better. It’s free of charge, and zero strings attached. Just request it here: https://bit.ly/33iHw5R \r\n \r\nThank you for your time. \r\n \r\nDaniel Todercan \r\nFounder and Owner \r\nNew Light Digital', 0, '2020-10-08 09:16:37', '2020-10-08 09:16:37'),
(6, 'Dave Stills', 'Sanka, You Dead Mon?', '84792848987', 'Hey egrocery.com.bd, \r\n \r\nCan I get you on the horn to discuss relaunching marketing? \r\n \r\nGet started on a conversion focused landing page, an automated Linkedin marketing tool, or add explainer videos to your marketing portfolio and boost your ROI. \r\n \r\nWe also provide graphic design and call center services to handle all those new leads you\'ll be getting. \r\n \r\n \r\nd.stills@starkwoodmarketing.com \r\n \r\nMy website is http://StarkwoodMarketing.com', 0, '2020-10-11 09:34:06', '2020-10-11 09:34:06'),
(7, 'James Hancock', 'cheap monthly SEO plans', '85855625744', 'Hi! \r\nI have just checked egrocery.com.bd for the ranking keywords and seen that your SEO metrics could use a boost. \r\n \r\nWe will improve your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart increasing your sales and leads with us, today! \r\n \r\nregards \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', 0, '2020-10-13 18:40:28', '2020-10-13 18:40:28'),
(8, 'Mike Durham', 'New: DA50 for egrocery.com.bd', '85162786573', 'Hi there \r\n \r\nIf you want to get ahead of your competition, have a higher Domain Authority score. Its just simple as that. \r\nWith our service you get Domain Authority above 50 points in just 30 days. \r\n \r\nThis service is guaranteed \r\n \r\nFor more information, check our service here \r\nhttps://www.monkeydigital.co/Get-Guaranteed-Domain-Authority-50/ \r\n \r\nN E W : \r\nDA60 is now available here \r\nhttps://www.monkeydigital.co/product/moz-da60-seo-plan/ \r\n \r\n \r\nthank you \r\nMike Durham\r\n \r\nMonkey Digital \r\nsupport@monkeydigital.co', 0, '2020-10-20 18:26:44', '2020-10-20 18:26:44'),
(9, 'Linda Ray', 'Google Remarketing Not Running?', '88181625226', 'I noticed that you are not running Google Remarketing on your website. \r\n \r\nThe most affordable advertising is marketing to previous web viewers who didn\'t convert. \r\n \r\nRemarketing via Google & Facebook ads means tracking and engaging these \'lost\' customers. \r\nThey were on your site once and may only need a reminder of your services and business. \r\n \r\nCan I help you grab these low hanging fruits? \r\n \r\nLinda Ray \r\nEmail - linda@theremarketingguys.com \r\nWebsite - http://www.theremarketingguys.com', 0, '2020-10-24 22:25:20', '2020-10-24 22:25:20'),
(10, 'Adam Right', 'Do you need Facebook likes?', '86445268158', 'Looking for likes or followers for Facebook or Instagram \r\nWe can help you. Please visit https://1000-likes.com/ to place your order.', 0, '2020-11-02 21:18:27', '2020-11-02 21:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_15_070135_create_admins_table', 1),
(10, '2019_12_17_054722_create_categories_table', 1),
(11, '2019_12_17_054812_create_subcategories_table', 1),
(12, '2019_12_17_085911_create_products_table', 1),
(13, '2019_12_18_073207_create_image_products_table', 1),
(14, '2019_12_20_100222_create_sizes_table', 1),
(15, '2019_12_20_100232_create_colors_table', 1),
(16, '2019_12_20_100259_create_units_table', 1),
(17, '2019_12_20_164749_create_product_sizes_table', 1),
(18, '2019_12_20_164819_create_product_units_table', 1),
(19, '2019_12_20_164830_create_color_products_table', 1),
(20, '2019_12_22_083044_create_tests_table', 1),
(21, '2020_02_04_161241_create_sliders_table', 1),
(22, '2020_02_04_161553_create_carts_table', 1),
(24, '2020_02_10_061516_create_orders_table', 1),
(25, '2020_02_10_100000_create_order_users_table', 1),
(26, '2020_02_10_145354_create_order_products_table', 1),
(27, '2020_02_11_190113_create_companies_table', 1),
(28, '2020_02_12_062747_create_homeaddresses_table', 1),
(29, '2020_02_12_062826_create_officeaddresses_table', 1),
(30, '2020_02_12_062843_create_giftaddresses_table', 1),
(31, '2020_02_12_063407_create_divisions_table', 1),
(32, '2020_02_12_063426_create_districts_table', 1),
(33, '2020_02_12_063448_create_upazilas_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modifylists`
--

CREATE TABLE `modifylists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `total_price` double NOT NULL,
  `status` int(191) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `officeaddresses`
--

CREATE TABLE `officeaddresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `upazila_id` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(8,2) NOT NULL DEFAULT 45.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `officeaddresses`
--

INSERT INTO `officeaddresses` (`id`, `user_id`, `name`, `mobile`, `division_id`, `district_id`, `upazila_id`, `address`, `delivery_charge`, `created_at`, `updated_at`) VALUES
(1, 8, 'Office 2', '01548865832', 1, 1, 3, 'Dhanmondi', 45.00, '2020-06-28 13:08:12', '2020-06-28 13:09:19'),
(2, 6, 'Arman', '01401592610', 1, 1, 2, 'house#122, Road#07', 45.00, '2020-06-28 16:18:53', '2020-06-28 16:18:53'),
(3, 46, 'Arman', '01747473856', 1, 1, 5, 'vVsiabs', 45.00, '2020-06-29 00:10:11', '2020-06-29 00:10:11'),
(4, 47, 'hello Test', '017548648438', 1, 1, 6, 'testv hahav ja', 45.00, '2020-06-29 00:25:20', '2020-06-29 00:25:20'),
(5, 65, 'Bigm Resource Limited', '01609605494', 1, 1, 40, 'Babor road', 45.00, '2020-07-19 17:36:42', '2020-09-21 13:11:57'),
(6, 59, 'Nayeef Quadir', '01670818626', 1, 1, 35, '83, Middle Madartek,', 45.00, '2020-08-20 17:09:44', '2020-08-20 17:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `invoice`, `user_id`, `payment`, `total_price`, `address`, `status`, `created_at`, `updated_at`) VALUES
(630, '0001', 'EG-61214488', 83, 'Cash on Delivery', 555.00, 'Hajifur Rahman \n01711082551\nH-52, Flat-5c, Barontek, Dhaka\nDhaka, Dhaka', 3, '2020-09-09 19:47:14', '2020-09-10 22:12:15'),
(631, '0002', 'EG-60038228', 94, 'Cash on Delivery', 125.00, 'rimi \n01875220618\nsipahibag adorsho bag\nDhaka, Dhaka', 5, '2020-09-15 23:26:40', '2020-09-15 23:27:00'),
(634, '00005', 'EG-49324209', 65, 'Cash On Delevery', 595.00, 'Raju Real,\r\n                                                01609605494,\r\n                                                Dhaka,\r\n                                                Dhaka,\r\n                                                Mohammadpur,\r\n                                                Beribadh', 1, '2020-09-22 20:02:19', '2020-09-22 20:02:19'),
(635, '0006', 'EG-63195138', 6, 'Cash on Delivery', 2825.00, 'Arman Rakib \n01401592610\nGulshan\nDhaka, Dhaka', 4, '2020-09-27 07:54:33', '2020-09-28 09:23:51'),
(636, '0007', 'EG-90017384', 6, 'Cash on Delivery', 3065.00, 'Arman Rakib \n01401592610\nGulshan\nDhaka, Dhaka', 1, '2020-09-28 10:32:22', '2020-09-28 10:32:22'),
(637, '0008', 'EG-49041885', 6, 'Cash on Delivery', 2075.00, 'Arman Rakib \n01401592610\nGulshan\nDhaka, Dhaka', 1, '2020-10-23 12:32:49', '2020-10-23 12:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `total_price` double(8,2) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `total_price`, `status`, `size`, `color`, `created_at`, `updated_at`) VALUES
(328, 630, 1126, 1, 500.00, 500.00, 1, NULL, NULL, '2020-09-09 19:47:14', '2020-09-09 19:47:14'),
(329, 630, 14, 1, 10.00, 10.00, 1, NULL, NULL, '2020-09-09 19:47:14', '2020-09-09 19:47:14'),
(330, 631, 141, 1, 80.00, 80.00, 1, NULL, NULL, '2020-09-15 23:26:40', '2020-09-15 23:26:40'),
(332, 634, 1137, 1, 550.00, 550.00, 1, NULL, NULL, '2020-09-22 20:02:19', '2020-09-22 20:02:19'),
(333, 635, 1141, 1, 550.00, 550.00, 1, NULL, NULL, '2020-09-27 07:54:33', '2020-09-27 07:54:33'),
(334, 635, 1138, 1, 840.00, 840.00, 1, NULL, NULL, '2020-09-27 07:54:33', '2020-09-27 07:54:33'),
(335, 636, 1117, 3, 80.00, 240.00, 1, NULL, NULL, '2020-09-28 10:32:22', '2020-09-28 10:32:22'),
(336, 636, 1141, 2, 550.00, 1100.00, 1, NULL, NULL, '2020-09-28 10:32:22', '2020-09-28 10:32:22'),
(337, 636, 1138, 2, 840.00, 1680.00, 1, NULL, NULL, '2020-09-28 10:32:22', '2020-09-28 10:32:22'),
(338, 637, 1141, 1, 550.00, 550.00, 1, NULL, NULL, '2020-10-23 12:32:49', '2020-10-23 12:32:49'),
(339, 637, 1138, 1, 840.00, 840.00, 1, NULL, NULL, '2020-10-23 12:32:49', '2020-10-23 12:32:49'),
(340, 637, 1117, 1, 80.00, 80.00, 1, NULL, NULL, '2020-10-23 12:32:49', '2020-10-23 12:32:49'),
(341, 637, 1116, 1, 160.00, 160.00, 1, NULL, NULL, '2020-10-23 12:32:49', '2020-10-23 12:32:49'),
(342, 637, 1114, 1, 360.00, 360.00, 1, NULL, NULL, '2020-10-23 12:32:49', '2020-10-23 12:32:49'),
(343, 637, 1113, 1, 140.00, 140.00, 1, NULL, NULL, '2020-10-23 12:32:49', '2020-10-23 12:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_users`
--

CREATE TABLE `order_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `populars`
--

CREATE TABLE `populars` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `populars`
--

INSERT INTO `populars` (`id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 36, '2020-04-21 05:42:42', '2020-04-21 05:42:42'),
(4, 29, '2020-05-08 09:55:01', '2020-05-08 09:55:01'),
(11, 152, '2020-05-08 09:59:58', '2020-05-08 09:59:58'),
(13, 832, '2020-05-08 10:02:25', '2020-05-08 10:02:25'),
(14, 40, '2020-05-08 10:02:51', '2020-05-08 10:02:51'),
(21, 950, '2020-07-07 23:46:26', '2020-07-07 23:46:26'),
(22, 949, '2020-07-07 23:46:37', '2020-07-07 23:46:37'),
(24, 258, '2020-07-07 23:47:20', '2020-07-07 23:47:20'),
(25, 186, '2020-07-07 23:48:37', '2020-07-07 23:48:37'),
(28, 687, '2020-07-07 23:49:28', '2020-07-07 23:49:28'),
(29, 249, '2020-07-07 23:50:01', '2020-07-07 23:50:01'),
(30, 250, '2020-07-07 23:50:17', '2020-07-07 23:50:17'),
(33, 733, '2020-07-07 23:51:24', '2020-07-07 23:51:24'),
(35, 861, '2020-07-07 23:52:16', '2020-07-07 23:52:16'),
(38, 805, '2020-07-07 23:57:06', '2020-07-07 23:57:06'),
(39, 564, '2020-07-07 23:57:38', '2020-07-07 23:57:38'),
(45, 10, '2020-07-08 00:01:27', '2020-07-08 00:01:27'),
(47, 230, '2020-07-08 00:05:39', '2020-07-08 00:05:39'),
(48, 191, '2020-07-08 00:06:00', '2020-07-08 00:06:00'),
(49, 196, '2020-07-08 00:06:25', '2020-07-08 00:06:25'),
(50, 141, '2020-08-07 21:27:18', '2020-08-07 21:27:18'),
(54, 856, '2020-10-30 13:53:25', '2020-10-30 13:53:25'),
(55, 1109, '2020-10-30 13:53:42', '2020-10-30 13:53:42'),
(56, 1102, '2020-10-30 13:54:01', '2020-10-30 13:54:01'),
(57, 1104, '2020-10-30 13:54:22', '2020-10-30 13:54:22'),
(58, 1124, '2020-10-30 13:54:47', '2020-10-30 13:54:47'),
(59, 1129, '2020-10-30 13:55:10', '2020-10-30 13:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(191) DEFAULT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `unit_weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `discount_price` double(8,2) DEFAULT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `is_favorite` tinyint(191) DEFAULT 0,
  `user_quantity` int(191) DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(4, 1, 88, 5, 16, NULL, '0004', 'Vim Dishwashing Liquid (500ml)', 'Vim-Dishwashing-Liquid-(500ml)', '<p>Vim Liquid is created with real lime juice and has superior degreasing abilities leaving dishes sparkling and shiny.</p>\r\n\r\n<p>Take a drop of Vim Liquid on a wet sponge. Squeeze the sponge to work up a rich lather. Apply to utensils. Rinse thoroughly for a sparkling, scratch free clean.</p>\r\n\r\n<p>OR</p>\r\n\r\n<p>Pour a tea spoonful of Vim liquid into a small bowl of water and stir to mix. Take a sponge/scrubber and soak it in that mix and rinse utensils thoroughly for sparkling and scratch free dishes.</p>\r\n\r\n<p>Turbo degreasing lime: Each drop of Vim Liquid contains enough cleaning power to remove tough stains and grease easily.</p>', 100.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582000749PicsArt_02-18-10.28.06.jpg', NULL, NULL, '2020-02-17 22:39:08', '2020-08-27 10:22:51'),
(6, 1, 2, 1, 7, NULL, '0005', 'Mr. cookie butter coconut biscuits', 'Mr.-cookie-butter-coconut-biscuits', '<p>#mr.cookie, #cookies #Haque</p>', 50.00, '250 gm', NULL, NULL, 'In Stock', 50, NULL, 0, '1582002963856-large_default.jpg', NULL, NULL, '2020-02-17 23:16:03', '2020-08-27 10:22:51'),
(7, 1, 3, 1, 7, NULL, '0006', 'Goldmark chocolate cookies', 'Goldmark-chocolate-cookies', '<p>#goldmark #cookie #Biscuite</p>', 65.00, '270 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582003708Special-chocolate-Cookies.jpg', NULL, NULL, '2020-02-17 23:28:28', '2020-08-27 10:22:51'),
(8, 1, 3, 1, 7, NULL, '0007', 'Goldmark chocolate chips cookies', 'Goldmark-chocolate-chips-cookies', '<p>Cookies Enriched With Chocolate Chips</p>', 50.00, '140 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582004017chocolate-chips-cookies.jpg', NULL, NULL, '2020-02-17 23:33:37', '2020-08-27 10:22:51'),
(9, 1, 3, 1, NULL, NULL, '0008', 'Goldmark coconut cookies', 'Goldmark-coconut-cookies', '<p>Flour, Sugar, Vegetable Fat, Butter, Salt, Baking Agent, Coconut Powder, Milk Powder, Coconut Flavor.</p>', 30.00, '145 gm', NULL, NULL, 'In Stock', 50, NULL, 0, '1582004640Coconut-Cookies.jpg', NULL, NULL, '2020-02-17 23:44:00', '2020-08-27 10:22:51'),
(10, 1, 3, 1, 7, NULL, '0009', 'Goldmark butter cookies', 'Goldmark-butter-cookies', '<p>Flour, Sugar, Vegetable Fat, Butter, Margarine, Edible Oil, Milk Powder, salt, Baking Agent, Permitted Flavor.</p>', 50.00, '140 gm', NULL, NULL, 'In Stock', 50, NULL, 0, '1582004733Original-Butter-Cookies.jpg', NULL, NULL, '2020-02-17 23:45:33', '2020-08-27 10:22:51'),
(12, 1, 3, 1, 7, NULL, '0011', 'Goldmark milk cookies', 'Goldmark-milk-cookies', '<p>ingredients: Flour, Sugar, Vegetable Fat, Salt, Baking Agent, Egg, Milk Powder and Permitted Flavor.</p>', 50.00, '250 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582005243Milk-Cookies.jpg', NULL, NULL, '2020-02-17 23:54:03', '2020-08-27 10:22:51'),
(13, 1, 5, 1, 7, NULL, '0012', 'olympic salcoti cookies', 'olympic-salcoti-cookies', '<p>#salcoti #olympic #cookie</p>', 50.00, '240gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582006611Salcoti.jpg', NULL, NULL, '2020-02-18 00:16:51', '2020-08-27 10:22:51'),
(14, 1, 5, 1, NULL, NULL, '0013', 'olympic hello cookies biscuits', 'olympic-hello-cookies-biscuits', '<p>#hello_cookie #olympic</p>', 10.00, '55 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 00:20:14', '2020-08-27 10:22:51'),
(15, 1, 5, 1, 7, NULL, '0014', 'olympic hello cookies biscuits', 'olympic-hello-cookies-biscuits', '<p>#hellocookie #olympic #biscuite #cookies</p>', 50.00, '250 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582006942Hello-Cookies.png', NULL, NULL, '2020-02-18 00:22:22', '2020-08-27 10:22:51'),
(18, 1, 73, 1, NULL, NULL, '0016', 'Teer Soyabean Oil', 'Teer-Soyabean-Oil', '<p>*** Teer soyabean oil</p>\r\n\r\n<p>*** Teer</p>', 530.00, '5 ltr', 500.00, '6%', 'In Stock', 100, NULL, 0, '1582517595teer. 5 l.jpg', NULL, NULL, '2020-02-18 22:37:00', '2020-08-27 10:22:51'),
(19, 1, 67, 1, 8, NULL, '0017', 'Fresh soyabean oil', 'Fresh-soyabean-oil', '<p>*** Fresh soyabean oil</p>\r\n\r\n<p>*** soyabean oil</p>', 530.00, '5 ltr', 500.00, '6%', 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 22:43:07', '2020-08-27 10:22:51'),
(20, 1, 74, 1, 8, NULL, '0018', 'Rupchanda soyabean oil', 'Rupchanda-soyabean-oil', '<p>***Rupchanda soyabean oil</p>\r\n\r\n<p>***soyabean oil</p>', 550.00, '5 ltr', 515.00, '6%', 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 22:59:37', '2020-08-27 10:22:51'),
(21, 1, 59, 1, 8, NULL, '0019', 'Bashundhara Fortified soyabean oil', 'Bashundhara-Fortified-soyabean-oil', '<p>*** Bashundhara soyabean oil</p>\r\n\r\n<p>*** soyabeanoil</p>', 530.00, '5 ltr', 500.00, '6%', 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 23:02:49', '2020-08-27 10:22:51'),
(23, 1, 79, 1, 8, NULL, '0021', 'Radhuni pure Mustard oil (shorisha)', 'Radhuni-pure-Mustard-oil-(shorisha)', '<p>***Mustard oil</p>\r\n\r\n<p>***shorisha oil</p>', 235.00, '1 ltr', 230.00, '2%', 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 23:07:55', '2020-08-27 10:22:51'),
(24, 1, 79, 1, 8, NULL, '0022', 'Radhuni pure Mustard oil (shorisha)', 'Radhuni-pure-Mustard-oil-(shorisha)', '<p>*** Mustardoil</p>\r\n\r\n<p>*** shorishaoil</p>', 125.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 23:10:03', '2020-08-27 10:22:51'),
(25, 1, 4, 1, 8, NULL, '0023', 'Pran mustard oil', 'Pran-mustard-oil', '<p>*** mustard oil</p>\r\n\r\n<p>*** pranfoods</p>', 235.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 23:29:39', '2020-08-27 10:22:51'),
(26, 1, 4, 1, 8, NULL, '0024', 'Pran mustard oil', 'Pran-mustard-oil', '<p>*** pran foods</p>\r\n\r\n<p>*** mustard oil</p>', 120.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 23:32:56', '2020-08-27 10:22:51'),
(27, 1, 32, 1, 8, NULL, '0025', 'Ahmed mustard oil', 'Ahmed-mustard-oil', '<p>#ahmed</p>\r\n\r\n<p>#mustardoil</p>', 120.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582091277Screenshot_8.png', NULL, NULL, '2020-02-18 23:47:57', '2020-08-27 10:22:51'),
(28, 1, 82, 1, 8, NULL, '30', 'Moshur dal (Deshi), Packed', 'Moshur-dal-(Deshi),-Packed', '<p>***Deshi_moshur_dal</p>\r\n\r\n<p>***chikon_moshur_dal</p>', 120.00, '1 kg', 115.00, '4%', 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-18 23:55:52', '2020-08-27 10:22:51'),
(29, 1, 67, 1, 8, NULL, '0028', 'Fresh moshur dal', 'Fresh-moshur-dal', '<p>**Moshur dal</p>\r\n\r\n<p>**Deshi moshur dal</p>', 122.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582093130Screenshot_12.png', NULL, NULL, '2020-02-19 00:18:50', '2020-08-27 10:22:51'),
(30, 1, 78, 1, 8, NULL, '0029', 'ACI pure Moshur dal', 'ACI-pure-Moshur-dal', '<p>**ACI Pure Deshi Moshur Dal</p>', 125.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 00:27:49', '2020-08-27 10:22:51'),
(31, 1, 82, 1, 8, NULL, '0030', 'Boot dal (packed)', 'Boot-dal-(packed)', '<p>***Boot er dal</p>', 90.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582094303Screenshot_14.png', NULL, NULL, '2020-02-19 00:38:23', '2020-08-27 10:22:51'),
(32, 1, 82, 1, 8, NULL, '0031', 'Mug dal (packed)', 'Mug-dal-(packed)', '<p>***Mug dal</p>\r\n\r\n<p>*** no. 1 Mug dal</p>', 140.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1594195494mugdal.jpg', NULL, NULL, '2020-02-19 00:41:04', '2020-08-27 10:22:51'),
(33, 1, 4, 1, 8, NULL, '0032', 'Pran Chinigura Rice | 1 kg', 'Pran-Chinigura-Rice-|-1-kg', '<p>**chinigura polaw rice</p>', 130.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1595106843a801b7dfe1f3-2.jpg', NULL, NULL, '2020-02-19 00:50:51', '2020-08-27 10:22:51'),
(34, 1, 67, 1, 8, NULL, '0033', 'fresh chinigura', 'fresh-chinigura', '<p>***Fresh chinigura polaw rice</p>', 125.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582095311Screenshot_17.png', NULL, NULL, '2020-02-19 00:55:11', '2020-08-27 10:22:51'),
(35, 1, 57, 1, 8, NULL, '0034', 'Aromatic Chinigura Rice - 2Kg', 'Aromatic-Chinigura-Rice---2Kg', '<ul>\r\n	<li>Aromatic&nbsp;Chinigura Polaw rice</li>\r\n	<li>Brand: Chashi</li>\r\n</ul>', 240.00, '2 kg', 235.00, '2%', 'In Stock', 100, NULL, 0, '1582558460chasi chinigura 1kg.jpg', NULL, NULL, '2020-02-19 00:59:44', '2020-08-27 10:22:51'),
(36, 1, 82, 1, 8, NULL, '0035', 'Miniket rice standard | 5kg', 'Miniket-rice-standard-|-5kg', '<p>***Deshi Miniket Rice standard</p>', 260.00, '5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582105147miniket stnd.png', NULL, NULL, '2020-02-19 03:39:07', '2020-08-27 10:22:51'),
(37, 1, 82, 1, 8, NULL, '38', 'Rashid Premium  Miniket Rice (Packed)', 'Rashid-Premium-Miniket-Rice-(Packed)', '<p>***Rashid premium Miniket</p>', 1500.00, '25 kg', 1400.00, '7%', 'In Stock', 100, NULL, 0, '1582106655rashid min.png', NULL, NULL, '2020-02-19 03:50:53', '2020-08-27 10:22:51'),
(38, 1, 82, 1, 8, NULL, '0037', 'Mozammel Special Miniket Rice| 10kg', 'Mozammel-Special-Miniket-Rice|-10kg', '<ul>\r\n	<li>Mozammel Special Miniket Rice</li>\r\n	<li>weight 10kg</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 675.00, '10kg', 650.00, '4%', 'In Stock', 100, NULL, 0, '1595104682mozammal miniket rice 10 kg.jpg', NULL, NULL, '2020-02-19 03:57:12', '2020-08-27 10:22:51'),
(39, 1, 82, 1, 8, NULL, '0038', 'Nazirshail Rice Standard | 5 kg', 'Nazirshail-Rice-Standard-|-5-kg', '<p>***Nazirshail Rice Standard</p>', 270.00, '5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1594193303nazirshail rice.webp', NULL, NULL, '2020-02-19 04:09:55', '2020-08-27 10:22:51'),
(40, 1, 82, 1, 8, NULL, '0039', 'Nazirshail Rice Primium | 5 kg', 'Nazirshail-Rice-Primium-|-5-kg', '<p>*** Nazirshail Rice Premium</p>', 280.00, '5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582107375nazir prem.png', NULL, NULL, '2020-02-19 04:16:15', '2020-08-27 10:22:51'),
(41, 1, 79, 1, 8, NULL, '0040', 'Radhuni Chili powder', 'Radhuni-Chili-powder', '<p>*** Radhuni chili powder</p>', 28.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:27:22', '2020-08-27 10:22:51'),
(42, 1, 79, 1, 8, NULL, '0041', 'Radhuni Chili powder', 'Radhuni-Chili-powder', '<p>***&nbsp;Radhuni Chili powder</p>', 50.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:28:05', '2020-08-27 10:22:51'),
(43, 1, 79, 1, 8, NULL, '0042', 'Radhuni Chili powder', 'Radhuni-Chili-powder', '<p>****&nbsp;Radhuni Chili powder</p>', 95.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:29:05', '2020-08-27 10:22:51'),
(44, 1, 79, 1, 8, NULL, '0043', 'Radhuni Chili powder', 'Radhuni-Chili-powder', '<p>***&nbsp;Radhuni Chili powder</p>', 225.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:30:36', '2020-08-27 10:22:51'),
(45, 1, 79, 1, 8, NULL, '0044', 'Radhuni Turmeric Powder (Holud)', 'Radhuni-Turmeric-Powder-(Holud)', '<p>***&nbsp;Radhuni Turmeric Powder</p>', 26.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:35:34', '2020-08-27 10:22:51'),
(46, 1, 79, 1, 8, NULL, '0045', 'Radhuni Turmeric Powder (Holud)', 'Radhuni-Turmeric-Powder-(Holud)', '<p>***&nbsp;Radhuni Turmeric Powder (Holud)</p>', 45.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:36:47', '2020-08-27 10:22:51'),
(47, 1, 79, 1, 8, NULL, '0046', 'Radhuni Turmeric Powder (Holud)', 'Radhuni-Turmeric-Powder-(Holud)', '<p>***&nbsp;Radhuni Turmeric Powder (Holud)</p>', 90.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:42:35', '2020-08-27 10:22:51'),
(48, 1, 79, 1, 8, NULL, '0047', 'Radhuni Turmeric Powder (Holud)', 'Radhuni-Turmeric-Powder-(Holud)', '<p>****&nbsp;Radhuni Turmeric Powder (Holud)</p>', 200.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 04:43:46', '2020-08-27 10:22:51'),
(49, 1, 79, 1, 8, NULL, '0048', 'Radhuni cumin powder (jeera)', 'Radhuni-cumin-powder-(jeera)', '<p>***&nbsp;Radhuni cumin powder (jeera)</p>', 43.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 05:59:55', '2020-08-27 10:22:51'),
(50, 1, 79, 1, 8, NULL, '0049', 'Radhuni cumin powder (jeera)', 'Radhuni-cumin-powder-(jeera)', '<p>***&nbsp;Radhuni cumin powder (jeera)</p>', 80.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 06:03:42', '2020-08-27 10:22:51'),
(51, 1, 79, 1, 8, NULL, '0050', 'Radhuni coriander power (Dhoniya)', 'Radhuni-coriander-power-(Dhoniya)', '<p>*** Radhuni Dhoniya Powder</p>', 63.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 06:38:10', '2020-08-27 10:22:51'),
(52, 1, 79, 1, 8, NULL, '0051', 'Radhuni coriander power (Dhoniya)', 'Radhuni-coriander-power-(Dhoniya)', '<p>*** Radhuni Dhonia powder</p>', 145.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 06:39:04', '2020-08-27 10:22:51'),
(53, 1, 73, 1, 8, NULL, '0052', 'Teer Atta', 'Teer-Atta', '<p>*** Teer atta</p>', 70.00, '2 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 07:28:30', '2020-08-27 10:22:51'),
(54, 1, 73, 1, 8, NULL, '0053', 'Teer Flour ( Maida)', 'Teer-Flour-(-Maida)', '<p>*** Teer Maida</p>', 92.00, '2 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 07:31:23', '2020-08-27 10:22:51'),
(55, 1, 78, 1, 8, NULL, '0054', 'ACI Pure Atta - 2kg', 'ACI-Pure-Atta---2kg', '<p>*** Aci pure Atta</p>', 70.00, '2 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1595108619aci-pure-atta-2-kg.jpg', NULL, NULL, '2020-02-19 07:46:57', '2020-08-27 10:22:51'),
(56, 1, 78, 1, 8, NULL, '0055', 'ACI Pure Maida (Flour)', 'ACI-Pure-Maida-(Flour)', '<p>*** ACI Pure maida</p>', 92.00, '2 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 07:50:38', '2020-08-27 10:22:51'),
(57, 1, 78, 1, 8, NULL, '0056', 'ACI Pure Brown Atta', 'ACI-Pure-Brown-Atta', '<p>****&nbsp;ACI Pure Brown Atta</p>', 42.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-19 07:56:16', '2020-08-27 10:22:51'),
(58, 1, 83, 3, 9, NULL, '0057', 'SUPERMOM Baby Diaper | Belt Small | 0-8 kg | 28 PCs', 'SUPERMOM-Baby-Diaper-|-Belt-Small-|-0-8-kg-|-28-PCs', '<ul>\r\n	<li>Product Type: Diaper</li>\r\n	<li>Brand: Supermom</li>\r\n	<li>Capacity: 28pcs</li>\r\n	<li>For Baby</li>\r\n	<li>The best quality diaper in the market!</li>\r\n	<li>It has 80% more absorbent than other diapers.</li>\r\n	<li>Gives comfort to both babies and parents.</li>\r\n	<li>Ensures zero leakage as it has hydrophobic leg cuff.</li>\r\n	<li>Its cottony top sheet ensures that children can sleep comfortably the whole night.</li>\r\n	<li>It has &ldquo;PU Foam Waistband&rdquo; which fits the waist perfectly.</li>\r\n</ul>', 675.00, '28 PCs', NULL, NULL, 'In Stock', 100, NULL, 0, '1594363918super.jpg', NULL, NULL, '2020-02-19 11:52:16', '2020-08-27 10:22:51'),
(59, 1, 83, 3, 9, NULL, '0058', 'SUPERMOM Baby Diaper Belt XL | 12-17 kg | 20 PCs', 'eyJpdiI6InRFS2RuZlcrSDNPanVPUjNPQW5FTlE9PSIsInZhbHVlIjoiaDk3MGNIdThSN1F6UHZuSjV0dUFBelY4MmF2cEhIeVg5MjQ5bDltT0NyeTQ5MXVpZTg2RVRBS1p4XC9ObnYreWlIa04zQUs3RW8yczlXamF6cjVZSFpnPT0iLCJtYWMiOiJlMjJjZWNlNGU0NzA5NDkyOWIyMTM5MDM2NDg4YzU4ODY4YWJjYjgyMTFmM2MwMDAyOGU5ODFjZWFjNzcxYmRkIn0=', '<ul>\r\n	<li>Product Type: Diaper</li>\r\n	<li>Brand: Supermom</li>\r\n	<li>Capacity: 20pcs</li>\r\n	<li>For Baby</li>\r\n	<li>Size: 12 - 17 Kg | XL</li>\r\n	<li>Type: Belt</li>\r\n</ul>', 750.00, '20', NULL, NULL, 'In Stock', 100, NULL, 0, '15995036964ca0e44c6064-13.jpg', NULL, NULL, '2020-02-19 11:56:37', '2020-09-07 22:34:58'),
(60, 1, 83, 3, 9, NULL, '0059', 'SUPERMOM Baby Diaper Belt L 9-14 kg | 22 PCs', 'eyJpdiI6ImlBdnNYT0E5b1hFQ29Ob1wvVUx2d1Z3PT0iLCJ2YWx1ZSI6IlwvckUwb1hEcTU4c08xais5bDBkZVlRSkxKOXBFY29mQXVkZ0dCMEdzT0RsbUtwSkxyNlUxWkNDZmxMN2ZvWm5nNnplckVFVnBsNXhIdWRHTElyY3pWZz09IiwibWFjIjoiNjBhYmI4NjYzYTdmZGEwNDliOWMwZjE5ZGMxM2ZlNWNjMmU0NWEzOWZkNzQ5ODcwZTc2N2QyMzhiMWE5NmI1ZSJ9', '<ul>\r\n	<li>Product Type: Diaper<br />\r\n	Brand: Supermom<br />\r\n	Capacity: 22pcs<br />\r\n	For Baby<br />\r\n	Size: 09 - 14 Kg | L<br />\r\n	Type: Belt</li>\r\n</ul>', 750.00, '22', NULL, NULL, 'In Stock', 100, NULL, 0, '1599503787spm.jpg', NULL, NULL, '2020-02-19 12:03:46', '2020-09-07 22:36:27'),
(61, 1, 75, 1, 8, NULL, '0060', 'saffola active oil (Blended Edible Vegetable oil)', 'saffola-active-oil-(Blended-Edible-Vegetable-oil)', '<p>*** Blended edible vegitable oil</p>', 940.00, '5 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 04:22:31', '2020-08-27 10:22:51'),
(62, 1, 78, 1, 8, NULL, '0061', 'Aci Nutrified rice bran oil', 'Aci-Nutrified-rice-bran-oil', '<p>*** Nutrified rice bran oil</p>', 775.00, '5 ltr', 710.00, '8%', 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 04:26:10', '2020-08-27 10:22:51'),
(63, 1, 32, 1, 8, NULL, '0062', 'Ahmed mustard oil', 'Ahmed-mustard-oil', '<p>*** Mustard oil</p>', 120.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 04:27:17', '2020-08-27 10:22:51'),
(64, 1, 78, 1, 8, NULL, '0063', 'aci pure moong dal (mug dal)', 'aci-pure-moong-dal-(mug-dal)', '<p>*** Moong dal</p>', 170.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 04:30:35', '2020-08-27 10:22:51'),
(65, 1, 78, 1, 8, NULL, '0064', 'ACI Aromatic chinigura rice', 'ACI-Aromatic-chinigura-rice', '<p>*** chinigura rice (polaw)</p>', 125.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 04:33:11', '2020-08-27 10:22:51'),
(66, 1, 78, 1, 8, NULL, '0065', 'ACI Aromatic chinigura rice | 5 kg', 'ACI-Aromatic-chinigura-rice-|-5-kg', '<p>*** chinigura rice (polaw)</p>', 570.00, '5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1595106722858c7360cc3d-84.jpg', NULL, NULL, '2020-02-24 04:35:14', '2020-08-27 10:22:51'),
(67, 1, 78, 1, 8, NULL, '0066', 'ACI Bashmati Rice | 1 kg', 'ACI-Bashmati-Rice-|-1-kg', '<p>*** Banshmati rice</p>', 265.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582540572aci bashmati 1 kg.jpg', NULL, NULL, '2020-02-24 04:36:12', '2020-08-27 10:22:51'),
(68, 1, 78, 1, 8, NULL, '0067', 'ACI Shugondhi Katarivog Rice - 5kg', 'ACI-Shugondhi-Katarivog-Rice---5kg', '<p>*** Katarivog rice</p>', 525.00, '5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582540645aci katarivog  5 kg.png', NULL, NULL, '2020-02-24 04:37:25', '2020-08-27 10:22:51'),
(69, 1, 78, 1, 8, NULL, '0068', 'ACI Pure Premium Nazirshail Rice | 5kg', 'ACI-Pure-Premium-Nazirshail-Rice-|-5kg', '<p>*** premium nazirshail rice</p>', 420.00, '5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582543997aci pure nazirshail 5 kg.jpg', NULL, NULL, '2020-02-24 05:33:17', '2020-08-27 10:22:51'),
(70, 1, 78, 1, 8, NULL, '0069', 'ACI Pure Premium Nazirshail Rice | 10kg', 'ACI-Pure-Premium-Nazirshail-Rice-|-10kg', '<p>***&nbsp;premium nazirshail rice</p>', 780.00, '10 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582544075aci pure nazirshail 10 kg.png', NULL, NULL, '2020-02-24 05:34:35', '2020-08-27 10:22:51'),
(71, 1, 78, 1, 8, NULL, '0070', 'Aci Pure Premium Miniket - 10kg', 'Aci-Pure-Premium-Miniket---10kg', '<p>***&nbsp;&nbsp;premium miniket rice</p>', 700.00, '10 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582544203aci pure miniket 10 kg.png', NULL, NULL, '2020-02-24 05:36:43', '2020-08-27 10:22:51'),
(72, 1, 79, 1, 8, NULL, '0071', 'Radhuni kashundi', 'Radhuni-kashundi', '<p>***&nbsp;Radhuni kashundi</p>', 45.00, '285 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 06:51:36', '2020-08-27 10:22:51'),
(73, 1, 4, 1, 8, NULL, '0072', 'pran white vinegar', 'pran-white-vinegar', '<p>***&nbsp;</p>', 55.00, '650 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 06:53:39', '2020-08-27 10:22:51'),
(74, 1, 4, 1, 8, NULL, '0073', 'pran white vinegar', 'pran-white-vinegar', '<p>***&nbsp;pran white vinegar</p>', 40.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 06:57:14', '2020-08-27 10:22:51'),
(75, 1, 33, 1, 8, NULL, '0074', 'BD White vinegar', 'BD-White-vinegar', '<p>***&nbsp;BD White vinegar</p>', 55.00, '650 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 06:58:32', '2020-08-27 10:22:51'),
(76, 1, 32, 1, 8, NULL, '0075', 'Ahmed white vinegar', 'Ahmed-white-vinegar', '<p>***&nbsp;Ahmed white vinegar</p>', 65.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 06:59:38', '2020-08-27 10:22:51'),
(77, 1, 79, 1, 8, NULL, '0076', 'Radhuni Garam masala', 'Radhuni-Garam-masala', '<p>***&nbsp;Radhuni Garam masala</p>', 60.00, '40 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:01:22', '2020-08-27 10:22:51'),
(78, 1, 79, 1, 8, NULL, '0077', 'Radhuni Garam masala', 'Radhuni-Garam-masala', '<p>***&nbsp;Radhuni Garam masala</p>', 26.00, '15 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:02:15', '2020-08-27 10:22:51'),
(79, 1, 79, 1, 8, NULL, '0078', 'Radhuni panch Foran', 'Radhuni-panch-Foran', '<p>***&nbsp;Radhuni panch Foran</p>', 22.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:04:34', '2020-08-27 10:22:51'),
(80, 1, 67, 1, 8, NULL, '0079', 'Fresh super permium salt', 'Fresh-super-permium-salt', '<p>***&nbsp;Fresh super permium salt</p>', 35.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:06:20', '2020-08-27 10:22:51'),
(81, 1, 82, 1, 8, NULL, '0080', 'Akher Sugar (chini)', 'Akher-Sugar-(chini)', '<p>***&nbsp;Akher Sugar (chini)</p>', 70.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:07:36', '2020-08-27 10:22:51'),
(82, 1, 67, 1, 8, NULL, '0081', 'Fresh Refined Sugar - 1kg', 'Fresh-Refined-Sugar---1kg', '<p>***&nbsp;Fresh refined sugar</p>', 65.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1595108705fresh-refined-sugar-1-kg.jpg', NULL, NULL, '2020-02-24 07:08:43', '2020-08-27 10:22:51'),
(83, 1, 73, 1, 8, NULL, '0082', 'Teer semolina suni', 'Teer-semolina-suni', '<p>***&nbsp;semolina suni</p>', 30.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:14:14', '2020-08-27 10:22:51'),
(84, 1, 78, 1, 8, NULL, '0083', 'Aci pure suji', 'Aci-pure-suji', '<p>***&nbsp;Aci pure suji</p>', 30.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 07:16:07', '2020-08-27 10:22:51'),
(85, 1, 78, 1, 8, NULL, '0084', 'aci pure salt', 'aci-pure-salt', '<p>***&nbsp;&nbsp;aci pure salt</p>', 35.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 08:18:57', '2020-08-27 10:22:51'),
(86, 1, 22, 1, 6, NULL, '0085', 'Aarong Dairy Sour Yogurt', 'Aarong-Dairy-Sour-Yogurt', '<p>Aarong Dairy Sour Yogurt</p>\r\n\r\n<p>&nbsp;</p>', 80.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 08:49:41', '2020-08-27 10:22:51'),
(87, 1, 22, 1, 6, NULL, '0086', 'Aarong dairy butter', 'Aarong-dairy-butter', '<p>Aarong dairy butter</p>', 95.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 08:53:45', '2020-08-27 10:22:51'),
(88, 1, 21, 1, 6, NULL, '0087', 'Milk vita butter', 'Milk-vita-butter', '<p>Milk vita butter</p>', 176.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 08:57:26', '2020-08-27 10:22:51'),
(89, 1, 4, 1, 6, NULL, '0088', 'Pran Butter (Fresco container)', 'Pran-Butter-(Fresco-container)', '<p>Pran Butter (Fresco container)</p>', 180.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 08:58:37', '2020-08-27 10:22:51'),
(90, 1, 68, 1, 6, NULL, '0089', 'Red cow butter oil', 'Red-cow-butter-oil', '<p>Red cow butter oil</p>', 500.00, 'gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582556394Red cow butter oil.jpg', NULL, NULL, '2020-02-24 08:59:54', '2020-08-27 10:22:51'),
(91, 1, 29, 1, 6, NULL, '0090', 'Amul pasteurised butter', 'Amul-pasteurised-butter', '<p>Amul pasteurized butter</p>', 355.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:01:36', '2020-08-27 10:22:51'),
(92, 1, 30, 1, 6, NULL, '0091', 'farm fresh butter (50gm X4pcs)', 'farm-fresh-butter-(50gm-X4pcs)', '<p>farm-fresh butter (50gm X4pcs)</p>', 184.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:03:18', '2020-08-27 10:22:51'),
(93, 1, 31, 1, 8, NULL, '0092', 'Ruchi mango pickle', 'Ruchi-mango-pickle', '<p>****&nbsp;Ruchi mango pickle</p>', 130.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582556969ruchi mango pickle 1.jpg', NULL, NULL, '2020-02-24 09:09:29', '2020-08-27 10:22:51'),
(94, 1, 31, 1, 8, NULL, '0093', 'Ruchi mango pickle', 'Ruchi-mango-pickle', '<p>Ruchi mango pickle</p>', 70.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:10:20', '2020-08-27 10:22:51'),
(95, 1, 31, 1, 8, NULL, '0094', 'Ruchi garlic pickle', 'Ruchi-garlic-pickle', '<p>Ruchi garlic pickle</p>', 130.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:13:28', '2020-08-27 10:22:51'),
(96, 1, 31, 1, 8, NULL, '0095', 'Ruchi olive pickle', 'Ruchi-olive-pickle', '<p>*** Ruchi olive pickle</p>', 130.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:15:23', '2020-08-27 10:22:51'),
(97, 1, 4, 1, 8, NULL, '0096', 'Pran mango pickle', 'Pran-mango-pickle', '<p>Pran mango pickle</p>', 135.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:20:54', '2020-08-27 10:22:51'),
(98, 1, 4, 1, 8, NULL, '0097', 'pran olive pickle', 'pran-olive-pickle', '<p>pran olive pickle</p>', 135.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:23:01', '2020-08-27 10:22:51'),
(99, 1, 2, 1, 8, NULL, '0098', 'pran hot chili pickle', 'pran-hot-chili-pickle', '<p>pran hot chili pickle</p>', 125.00, '270 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:24:14', '2020-08-27 10:22:51'),
(100, 1, 33, 1, 8, NULL, '0099', 'BD olive pickle', 'BD-olive-pickle', '<p>BD olive pickle</p>', 125.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:26:07', '2020-08-27 10:22:51'),
(101, 1, 2, 1, 8, NULL, '0100', 'BD mango pickle', 'BD-mango-pickle', '<p>BD mango pickle</p>', 125.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:27:55', '2020-08-27 10:22:51'),
(102, 1, 7, 1, 8, NULL, '0101', 'Ifad suji', 'Ifad-suji', '<p>Ifad suji</p>', 28.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:30:27', '2020-08-27 10:22:51'),
(103, 1, 81, 1, 8, NULL, '0102', 'Banoful laccha shemai', 'Banoful-laccha-shemai', '<p>Banoful laccha shemai</p>', 35.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:31:29', '2020-08-27 10:22:51'),
(104, 1, 79, 1, 8, NULL, '0103', 'Radhuni Beef masala', 'Radhuni-Beef-masala', '<p>Radhuni Beef masala</p>', 18.00, '25 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:32:37', '2020-08-27 10:22:51'),
(105, 1, 79, 1, 8, NULL, '0104', 'Radhuni chicken masala', 'Radhuni-chicken-masala', '<p>Radhuni chicken masala</p>', 15.00, '20 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:37:10', '2020-08-27 10:22:51'),
(106, 1, 79, 1, 8, NULL, '0105', 'radhuni Chatpoti masala', 'radhuni-Chatpoti-masala', '<p>radhuni Chatpoti masala</p>', 40.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:39:20', '2020-08-27 10:22:51'),
(107, 1, 79, 1, 8, NULL, '0106', 'radhuni Haleem mix', 'radhuni-Haleem-mix', '<p>radhuni Haleem mix</p>', 45.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:41:04', '2020-08-27 10:22:51'),
(108, 1, 79, 1, 8, NULL, '0107', 'radhuni Firni mix', 'radhuni-Firni-mix', '<p>radhuni Firni mix</p>', 40.00, '150 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:42:00', '2020-08-27 10:22:51'),
(109, 1, 79, 1, 8, NULL, '0108', 'Radhuni Tehari Mix', 'Radhuni-Tehari-Mix', '<p>Radhuni Tehari Mix</p>', 45.00, '40 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:43:38', '2020-08-27 10:22:51'),
(110, 1, 79, 1, 8, NULL, '0109', 'Radhuni kachchi biryani masala', 'Radhuni-kachchi-biryani-masala', '<p>Radhuni kachchi biryani masala</p>', 60.00, '40 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:45:47', '2020-08-27 10:22:51'),
(111, 1, 79, 1, 8, NULL, '0110', 'Radhuni meat curry masala', 'Radhuni-meat-curry-masala', '<p>Radhuni meat curry masala</p>', 65.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-24 09:47:20', '2020-08-27 10:22:51'),
(112, 1, 79, 1, 8, NULL, '0111', 'Radhuni fish curry masala', 'Radhuni-fish-curry-masala', '<p>Radhuni fish curry masala</p>', 55.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 00:57:30', '2020-08-27 10:22:51'),
(113, 1, 79, 1, 8, NULL, '0112', 'Radhuni Falooda mix (Mango)', 'Radhuni-Falooda-mix-(Mango)', '<p>Radhuni Falooda mix (Mango)</p>', 65.00, '250 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 00:59:05', '2020-08-27 10:22:51'),
(114, 1, 79, 1, 8, NULL, '0113', 'Radhuni Butter chicken masala', 'Radhuni-Butter-chicken-masala', '<p>Radhuni Butter chicken masala</p>', 50.00, '45 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 01:00:06', '2020-08-27 10:22:51'),
(115, 1, 79, 1, 8, NULL, '0114', 'Radhuni Borhani Masala', 'Radhuni-Borhani-Masala', '<p>Radhuni Borhani Masala</p>', 35.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 01:01:04', '2020-08-27 10:22:51'),
(116, 1, 79, 1, 8, NULL, '0115', 'Radhuni kabab masala', 'Radhuni-kabab-masala', '<p>Radhuni kabab masala</p>', 90.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 01:02:45', '2020-08-27 10:22:51'),
(117, 1, 79, 1, 8, NULL, '0116', 'Radhuni kala Bhuna masala', 'Radhuni-kala-Bhuna-masala', '<p>Radhuni kala Bhuna masala</p>', 70.00, '80 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 01:04:58', '2020-08-27 10:22:51'),
(118, 1, 79, 1, 8, NULL, '0117', 'Radhuni hyderabadi Biryani', 'Radhuni-hyderabadi-Biryani', '<p>Radhuni hyderabadi Biryani</p>', 80.00, '45 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 01:05:53', '2020-08-27 10:22:51'),
(119, 1, 79, 1, 8, NULL, '0118', 'Radhuni Jorda mix', 'Radhuni-Jorda-mix', '<p>Radhuni Jorda mix</p>', 110.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 01:06:55', '2020-08-27 10:22:51'),
(120, 1, 22, 1, 6, NULL, '0119', 'Aarong Austogram cheese', 'Aarong-Austogram-cheese', '<p>Aarong Austogram cheese</p>', 150.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 08:48:52', '2020-08-27 10:22:51'),
(121, 1, 22, 1, 6, NULL, '0120', 'Aarong dairy Shredded mozzarella Cheese', 'Aarong-dairy-Shredded-mozzarella-Cheese', '<p>Aarong dairy Shredded mozzarella Cheese</p>', 220.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 08:50:11', '2020-08-27 10:22:51'),
(122, 1, 22, 1, 6, NULL, '0121', 'Aarong Garlic spread cheese', 'Aarong-Garlic-spread-cheese', '<p>Aarong Garlic spread cheese</p>', 230.00, '180gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 08:51:30', '2020-08-27 10:22:51'),
(123, 1, 22, 1, 6, NULL, '0122', 'aarong dairy cube cheese', 'aarong-dairy-cube-cheese', '<p>Aarong dairy cube cheese</p>', 160.00, '120gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 08:53:28', '2020-08-27 10:22:51'),
(124, 1, 22, 1, 6, NULL, '0123', 'aarong classic spread cheese', 'aarong-classic-spread-cheese', '<p>Aarong classic spread cheese</p>', 220.00, '180gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 08:54:50', '2020-08-27 10:22:51'),
(125, 1, 4, 1, 6, NULL, '0124', 'Pran Dhaka cheese', 'Pran-Dhaka-cheese', '<p>Pran Dhaka cheese</p>', 150.00, '225gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 08:56:56', '2020-08-27 10:22:51'),
(126, 1, 69, 1, 6, NULL, '0125', 'kraft processed cheddar cheese', 'kraft-processed-cheddar-cheese', '<p>kraft processed cheddar cheese</p>', 293.00, '190 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:01:13', '2020-08-27 10:22:51'),
(127, 1, 69, 1, 6, NULL, '0126', 'kraft original cheddar cheese spread', 'kraft-original-cheddar-cheese-spread', '<p>kraft original cheddar cheese spread</p>', 380.00, '230 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:02:59', '2020-08-27 10:22:51'),
(128, 1, 71, 1, 6, NULL, '0127', 'Diploma full cream milk powder', 'Diploma-full-cream-milk-powder', '<p>Diploma full cream milk powder</p>', 320.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '15951093123732318ce193-11e84172b1c3-5.jpg', NULL, NULL, '2020-02-25 09:08:36', '2020-08-27 10:22:51'),
(129, 1, 70, 1, 6, NULL, '0128', 'Dano power instant full cream milk powder', 'Dano-power-instant-full-cream-milk-powder', '<p>Dano power instant full cream milk powder</p>', 320.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:10:05', '2020-08-27 10:22:51'),
(130, 1, 70, 1, 6, NULL, '0129', 'Dano sterilized cream', 'Dano-sterilized-cream', '<p>Dano sterilized cream</p>', 150.00, '170 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:11:10', '2020-08-27 10:22:51'),
(131, 1, 70, 1, 6, NULL, '0130', 'dano captain choco', 'dano-captain-choco', '<p>dano captain choco</p>', 250.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:13:52', '2020-08-27 10:22:51'),
(132, 1, 70, 1, 6, NULL, '0131', 'dano mom', 'dano-mom', '<p>dano mom</p>', 450.00, '360 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:14:50', '2020-08-27 10:22:51'),
(133, 1, 4, 1, 6, NULL, '0132', 'Pran full cream milk powder', 'Pran-full-cream-milk-powder', '<p>Pran full cream milk powder</p>', 520.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:20:10', '2020-08-27 10:22:51'),
(134, 1, 12, 1, 6, NULL, '0133', 'Nestle Nido fortigrow full cream milk powder BIB', 'Nestle-Nido-fortigrow-full-cream-milk-powder-BIB', '<p>Nestle Nido fortigrow full cream milk powder BIB</p>', 530.00, '700 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:22:02', '2020-08-27 10:22:51'),
(135, 1, 12, 1, 6, NULL, '0134', 'Nestle nido growing up 1+ protection Milk Bib', 'Nestle-nido-growing-up-1+-protection-Milk-Bib', '<p>Nestle nido growing up 1+ protection Milk Bib</p>', 360.00, '350 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:23:13', '2020-08-27 10:22:51'),
(136, 1, 12, 1, 6, NULL, '0135', 'nestle coffee mate richer & creamer BIB', 'nestle-coffee-mate-richer-&-creamer-BIB', '<p>nestle coffee mate richer &amp; creamer BIB</p>', 270.00, '450 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:24:09', '2020-08-27 10:22:51'),
(137, 1, 12, 1, 6, NULL, '0136', 'Nestle nido fortigrow full cream milk powder Tin', 'Nestle-nido-fortigrow-full-cream-milk-powder-Tin', '<p>Nestle nido fortigrow full cream milk powder Tin</p>', 2290.00, '2.5 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:25:06', '2020-08-27 10:22:51'),
(138, 1, 12, 1, 6, NULL, '0137', 'nestle coffee mate creamer', 'nestle-coffee-mate-creamer', '<p>nestle coffee mate creamer</p>', 535.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:25:52', '2020-08-27 10:22:51'),
(139, 1, 21, 1, 6, NULL, '0138', 'Milk vita full cream powder milk', 'Milk-vita-full-cream-powder-milk', '<p>Milk vita full cream powder milk</p>', 290.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:26:47', '2020-08-27 10:22:51'),
(140, 1, 22, 1, 6, NULL, '0139', 'aarong dairy instant low fat milk powder', 'aarong-dairy-instant-low-fat-milk-powder', '<p>aarong dairy instant low fat milk powder</p>', 320.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-25 09:27:29', '2020-08-27 10:22:51'),
(141, 1, 84, 2, NULL, NULL, '0140', 'Milk | 100% Pure Milk', 'eyJpdiI6InM5eUlrMFJCSnllSGFHUWhsMmsrV0E9PSIsInZhbHVlIjoiMXNrWUdcL1EzWENZbzZDMWxpSnlHNkFBQlhmUjVONjc4RCtOcnRBZVk1NGM9IiwibWFjIjoiOWJlYTNiMmE3MTgzZjhjMDMwNDU1MWNiMGM2NmY2Yjc3NjdkNTFhYzFhZTRkYTkzZDE5YTM2MmY0ZTA5MGIwOSJ9', '<ul>\r\n	<li>\r\n	<p>100% pure and fresh</p>\r\n	</li>\r\n	<li>\r\n	<p>&nbsp;Adulteration Free.</p>\r\n	</li>\r\n	<li>\r\n	<p>&nbsp;Collected from farmers directly</p>\r\n	</li>\r\n	<li>\r\n	<p>Collected and stored with direct supervision.</p>\r\n	</li>\r\n	<li>\r\n	<p>No compromise with quality and service.</p>\r\n	</li>\r\n</ul>', 90.00, '1 Ltr', 80.00, '11%', 'In Stock', 1000, NULL, 0, '1589489495milk2.jpg', NULL, NULL, '2020-02-25 10:34:25', '2020-09-03 23:45:45'),
(142, 1, 84, 2, NULL, NULL, '0141', 'পাটালি গুড় | Patali Gur', 'পাটালি-গুড়-|-Patali-Gur', '<ul>\r\n	<li>100% pure and Chemical free</li>\r\n	<li>Direct collected from &quot;Gachi&quot;</li>\r\n	<li>Process &quot;Ros&quot; with care and make Patali</li>\r\n	<li>100% Organic</li>\r\n	<li>Good for health&nbsp;</li>\r\n</ul>', 280.00, '1 Kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1594852843patali gur.png', NULL, NULL, '2020-02-25 10:52:28', '2020-08-27 10:22:51'),
(143, 1, 84, 2, NULL, NULL, '0142', 'ঝোলা গুড় | Jhola Gur', 'ঝোলা-গুড়-|-Jhola-Gur', '<ul>\r\n	<li>100% pure and Chemical free</li>\r\n	<li>Direct collected from &quot;Gachi&quot;</li>\r\n	<li>Process &quot;Ros&quot; with care and make Patali</li>\r\n	<li>100% Organic</li>\r\n	<li>Good for health&nbsp;</li>\r\n</ul>', 280.00, '1 Kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1594853438Jhola Gur.png', NULL, NULL, '2020-02-25 10:57:12', '2020-08-27 10:22:51'),
(144, 1, 84, 2, NULL, NULL, '0143', 'Pure Honey | Sundarban  1 kg', 'Pure-Honey-|-Sundarban-1-kg', '<ul>\r\n	<li>Sundarban Er Pure Honey</li>\r\n	<li>Kholisha Fuler Modhu</li>\r\n	<li>100% Pure and Natural</li>\r\n	<li>No Chamical No Sugar</li>\r\n	<li>100% Organic</li>\r\n</ul>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 12px; top: -8px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 1050.00, '1 Kg', 999.00, '5%', 'In Stock', 100, NULL, 0, '1594853260sundarbon honey websize 1000gm.jpg', NULL, NULL, '2020-02-25 11:07:09', '2020-08-27 10:22:51'),
(145, 1, 78, 5, 15, NULL, '0144', 'Spring air freshener Lemon fresh', 'Spring-air-freshener-Lemon-fresh', '<p>Spring air freshener Lemon fresh</p>', 215.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-26 00:18:47', '2020-08-27 10:22:51'),
(146, 1, 78, 5, 15, NULL, '0145', 'Spring air freshener Floral fresh', 'Spring-air-freshener-Floral-fresh', '<p>Spring air freshener Floral fresh</p>', 215.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-26 00:20:22', '2020-08-27 10:22:51'),
(147, 1, 78, 5, 15, NULL, '0146', 'spring air freshener orange fresh', 'spring-air-freshener-orange-fresh', '<p>spring air freshener orange fresh</p>', 215.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-26 00:21:07', '2020-08-27 10:22:51'),
(148, 1, 83, 3, 9, NULL, '0147', 'Supermom baby diaper Extra Large (12-17kg) 20pcs Small | 0-8 kg | 28 PCs', 'eyJpdiI6IkNuV0ZPekNZNERQM0RGMms4aFBneVE9PSIsInZhbHVlIjoiaFwvRzVmVzVucGROZE16NERhZGp1V3htb0M2bVwveDJ5UlpQOE5ja3RpbmVpZlducG51V2FMWjl4Ym9NcGloV3lFMHNcLzAwYjFDcFV4emJVakJ0VFBQbjUrdHl1cnl4Q1lGaTExdEhmaDFEM2pNNm1mTEozeFFhRHpJdmU3NHhaUmYiLCJtYWMiOiI0MTJiMWM3NzdlMzJlYmFmZjBkNWVjYzQ4MTAzODgyM2ZhZjUwYmIzYmMzMDdlMzcwNmNjMWI3YjkzNGIxYzdiIn0=', '<ul>\r\n	<li>Product Type: Diaper</li>\r\n	<li>Brand: Supermom</li>\r\n	<li>Capacity: 26pcs</li>\r\n	<li>For Baby</li>\r\n</ul>', 750.00, '20 PCs', NULL, '100%', 'In Stock', 50, NULL, 0, '1582733597supermom baby diaper Extra Large (12-17kg) 20pcs.jpg', NULL, NULL, '2020-02-26 10:13:17', '2020-09-07 22:42:18'),
(150, 1, 2, 1, 5, NULL, '0149', 'Cocola Junipr Cup Noodles', 'Cocola-Junipr-Cup-Noodles', '<p>Cocola Junior Cup Noodles 40gm</p>', 25.00, '40', NULL, NULL, 'In Stock', 1, NULL, 0, '1582744042Cup Noodles.jpg', NULL, NULL, '2020-02-26 13:07:22', '2020-08-27 10:22:51'),
(151, 1, 2, 1, 5, NULL, '0150', 'Nestle Maggie 2 Minute', 'Nestle-Maggie-2-Minute', '<p>Nestle Maggie 2 Minute Noodles Masala 8 Pack</p>', 135.00, '496', NULL, NULL, 'In Stock', 8, NULL, 0, '1582744397Nestle 2 Minute-8pack.png', NULL, NULL, '2020-02-26 13:13:17', '2020-08-27 10:22:51'),
(152, 1, 2, 1, 5, NULL, '0151', 'Nestle Maggie 2 Minute', 'Nestle-Maggie-2-Minute', '<p>Nestle Maggie 2 Minute Masala 4Pack</p>', 66.00, '248', NULL, NULL, 'In Stock', 4, NULL, 0, '1582744750Nestle Maggie - 4pack.jpg', NULL, NULL, '2020-02-26 13:19:11', '2020-08-27 10:22:51'),
(153, 1, 2, 1, 5, NULL, '0152', 'Chopstick Deshi Masala Noodles', 'Chopstick-Deshi-Masala-Noodles', '<p>Chopstick Deshi Masala Noodles 8 Pack ( Free Suprise Gift)</p>', 130.00, '496', NULL, NULL, 'In Stock', 8, NULL, 0, '1582745039chopstick-deshi-masala-Noodles 8 Pack.png', NULL, NULL, '2020-02-26 13:24:00', '2020-08-27 10:22:51'),
(154, 1, 2, 1, 5, NULL, '0153', 'Nestle Maggie Healthy Thai Soup', 'Nestle-Maggie-Healthy-Thai-Soup', '<p>Nestle Maggie Healthy Thai Soup 4Pcs</p>', 140.00, '140', NULL, NULL, 'In Stock', 4, NULL, 0, '1582745827nestle Maggi Healthy Thai Soup.jpg', NULL, NULL, '2020-02-26 13:37:07', '2020-08-27 10:22:51'),
(155, 1, 84, 2, NULL, NULL, '0154', 'Bogurar Special Premium Doi | বগুড়ার স্পেশাল দই', 'Bogurar-Special-Premium-Doi-|-বগুড়ার-স্পেশাল-দই', '<ul>\r\n	<li>Bagurar Special Traditional Doi</li>\r\n	<li>Premium Quality SWEETENED DOI&nbsp;</li>\r\n	<li>Size; Large</li>\r\n	<li>Weight: 700 gm +/-</li>\r\n	<li>Quantity: 1 Pcs ( ১ বাটি)&nbsp;</li>\r\n</ul>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 172px; top: 14px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 320.00, '1 Pcs', 290.00, '9%', 'In Stock', 100, NULL, 0, '1582799899bogurar-doi-special.jpg', NULL, NULL, '2020-02-27 04:38:19', '2020-08-27 10:22:51'),
(156, 1, 98, 5, 19, NULL, '0155', 'Wheel Washing Powder 2in1 Clean & Rose', 'Wheel-Washing-Powder-2in1-Clean-&-Rose', '<p>Wheel Washing Powder 2in1 Clean &amp; Rose</p>', 42.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582815833Wheel Washing Powder 2in1 Clean & Rose1.jpg', NULL, NULL, '2020-02-27 09:03:53', '2020-08-27 10:22:51'),
(157, 1, 98, 5, 19, NULL, '0156', 'Wheel Washing Powder 2in1 Clean & Fresh', 'Wheel-Washing-Powder-2in1-Clean-&-Fresh', '<p>Wheel Washing Powder 2in1 Clean &amp; Fresh</p>', 45.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816197Wheel Washing Powder 2in1 Clean & Fresh2.jpg', NULL, NULL, '2020-02-27 09:09:57', '2020-08-27 10:22:51'),
(158, 1, 98, 5, 19, NULL, '0157', 'Wheel Washing Powder Laundry Bar', 'Wheel-Washing-Powder-Laundry-Bar', '<p>Wheel Washing Powder Laundry Bar</p>', 20.00, '130 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816264Wheel Washing Powder Laundry Bar3.jpg', NULL, NULL, '2020-02-27 09:11:04', '2020-08-27 10:22:51'),
(159, 1, 99, 5, 19, NULL, '0158', 'Rin Washing Powder Power Bright', 'Rin-Washing-Powder-Power-Bright', '<p>Rin Washing Powder Power Bright</p>', 60.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816331Rin Washing Powder Power Bright4.jpg', NULL, NULL, '2020-02-27 09:12:11', '2020-08-27 10:22:51'),
(160, 1, 99, 5, 19, NULL, '0159', 'Rin Washing Powder Bundle Pack', 'Rin-Washing-Powder-Bundle-Pack', '<p>Rin Washing Powder Bundle Pack</p>', 240.00, '2 kg', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816432Rin Washing Powder Bundle Pack5.jpg', NULL, NULL, '2020-02-27 09:13:52', '2020-08-27 10:22:51'),
(161, 1, 99, 5, 19, NULL, '0160', 'Rin Washing Powder Antibac', 'Rin-Washing-Powder-Antibac', '<p>Rin Washing Powder Antibac</p>', 120.00, '1 kg', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816672Rin Washing Powder Antibac6.jpg', NULL, NULL, '2020-02-27 09:17:52', '2020-08-27 10:22:51'),
(162, 1, 99, 5, 19, NULL, '0161', 'Rin Liquid Detergent', 'Rin-Liquid-Detergent', '<p>Rin Liquid Detergent</p>', 195.00, '800 ml', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816750Rin Liquid Detergent7.jpg', NULL, NULL, '2020-02-27 09:19:10', '2020-08-27 10:22:51'),
(163, 1, 100, 5, 19, NULL, '0162', 'Surf Excel Washing Powder', 'Surf-Excel-Washing-Powder', '<p>Surf Excel Washing Powder</p>', 99.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816832Surf Excel Washing Powder8.jpg', NULL, NULL, '2020-02-27 09:20:32', '2020-08-27 10:22:51'),
(164, 1, 100, 5, 19, NULL, '0163', 'Surf Excel Washing Powder (With Bucket)', 'Surf-Excel-Washing-Powder-(With-Bucket)', '<p>Surf Excel Washing Powder (With Bucket)</p>', 240.00, '1 kg', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582816898Surf Excel Washing Powder (With Bucket).jpg', NULL, NULL, '2020-02-27 09:21:38', '2020-08-27 10:22:51'),
(165, 1, 100, 5, 19, NULL, '0164', 'Surf Excel Washing Powder Matic Top Load', 'Surf-Excel-Washing-Powder-Matic-Top-Load', '<p>Surf Excel Washing Powder Matic Top Load</p>', 260.00, '1 kg', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582817034Surf Excel Washing Powder Matic Top Load.jpg', NULL, NULL, '2020-02-27 09:23:54', '2020-08-27 10:22:51'),
(166, 1, 100, 5, 19, NULL, '0165', 'Surf Excel Matic Liquid Detergent Top Load', 'Surf-Excel-Matic-Liquid-Detergent-Top-Load', '<p>Surf Excel Matic Liquid Detergent Top Load</p>', 210.00, '500ml', NULL, NULL, 'In Stock', 1000, NULL, 0, '1582817102Surf Excel Matic Liquid Detergent Top Load.jpg', NULL, NULL, '2020-02-27 09:25:02', '2020-08-27 10:22:51'),
(167, 1, 85, 5, 15, NULL, '0166', 'Fay air freshener anti tobacco 3 in 1', 'Fay-air-freshener-anti-tobacco-3-in-1', '<p>Fay air freshener anti tobacco 3 in 1</p>', 220.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971019fay  anti tobacco.jpg', NULL, NULL, '2020-02-29 04:10:19', '2020-08-27 10:22:51'),
(168, 1, 85, 5, 15, NULL, '0167', 'Fay orchid air freshener 3 in 1', 'Fay-orchid-air-freshener-3-in-1', '<p>Fay orchid air freshener 3 in 1</p>', 220.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971078fay orchid.jpg', NULL, NULL, '2020-02-29 04:11:18', '2020-08-27 10:22:51'),
(169, 1, 85, 5, 15, NULL, '0168', 'Fay air Freshener rose', 'Fay-air-Freshener-rose', '<p>Fay air Freshener rose</p>', 220.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971120fay airfreshener rose.jpg', NULL, NULL, '2020-02-29 04:12:00', '2020-08-27 10:22:51'),
(170, 1, 85, 5, 15, NULL, '0169', 'Fay air Freshener Narcissus 3 in 1', 'Fay-air-Freshener-Narcissus-3-in-1', '<p>Fay air Freshener Narcissus 3 in 1</p>', 220.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971173fay narcissus. jpeg.jpg', NULL, NULL, '2020-02-29 04:12:53', '2020-08-27 10:22:51'),
(171, 1, 85, 5, 15, NULL, '0170', 'Fay lily air Freshener', 'Fay-lily-air-Freshener', '<p>Fay lily air Freshener</p>', 220.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971219fay lily.jpg', NULL, NULL, '2020-02-29 04:13:39', '2020-08-27 10:22:51'),
(172, 1, 86, 5, 15, NULL, '0171', 'Godrej Aer pocket Bundle', 'Godrej-Aer-pocket-Bundle', '<p>Godrej Aer pocket Bundle</p>', 180.00, '3 pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971294Godrej Aer pocket Bundle.jpg', NULL, NULL, '2020-02-29 04:14:54', '2020-08-27 10:22:51'),
(173, 1, 86, 5, 15, NULL, '0172', 'Aer Room Freshener & 2 Aer Pocket Combo', 'Aer-Room-Freshener-&-2-Aer-Pocket-Combo', '<p>Aer Room Freshener &amp; 2 Aer Pocket Combo</p>', 318.00, '300 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971390Aer Room Freshener & 2 Aer Pocket Combo.jpg', NULL, NULL, '2020-02-29 04:16:30', '2020-08-27 10:22:51'),
(174, 1, 86, 5, 15, NULL, '0173', 'Godrej aer cool room spray', 'Godrej-aer-cool-room-spray', '<p>Godrej aer cool room spray&nbsp;</p>', 200.00, '270 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971449Godrej aer cool room spray.jpg', NULL, NULL, '2020-02-29 04:17:29', '2020-08-27 10:22:51'),
(175, 1, 86, 5, 15, NULL, '0174', 'Godrej Aer fresh green room spray', 'Godrej-Aer-fresh-green-room-spray', '<p>Godrej Aer fresh green room spray</p>', 200.00, '270 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971511Godrej Aer fresh green room spray.jpg', NULL, NULL, '2020-02-29 04:18:31', '2020-08-27 10:22:51'),
(176, 1, 86, 5, 15, NULL, '0175', 'Godrej aer Cool surf Blue click gel AC vent car freshener', 'Godrej-aer-Cool-surf-Blue-click-gel-AC-vent-car-freshener', '<p>Godrej aer Cool surf Blue click gel AC vent car freshener</p>', 299.00, 'each', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971634Godrej aer Cool surf Blue click gel AC vent car freshener.jpg', NULL, NULL, '2020-02-29 04:20:34', '2020-08-27 10:22:51'),
(177, 1, 86, 5, 15, NULL, '0176', 'Godrej aer Cool Twist  surf Blue 45gm  car dashboard freshener', 'Godrej-aer-Cool-Twist-surf-Blue-45gm-car-dashboard-freshener', '<p>Godrej aer Cool Twist &nbsp;surf Blue 45gm &nbsp;car dashboard freshener</p>', 399.00, '45 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971699Godrej aer Cool Twist  surf Blue 45gm  car dashboard freshener.jpg', NULL, NULL, '2020-02-29 04:21:39', '2020-08-27 10:22:51'),
(178, 1, 87, 5, 15, NULL, '0177', 'Odonil natural Air freshener Lavender Meadows', 'Odonil-natural-Air-freshener-Lavender-Meadows', '<p>Odonil natural Air freshener Lavender Meadows</p>', 45.00, '50 mg', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971782Odonil natural Air freshener Lavender Meadows.jpg', NULL, NULL, '2020-02-29 04:23:02', '2020-08-27 10:22:51'),
(179, 1, 87, 5, 15, NULL, '0178', 'Odonil natural Air freshener jasmine mist', 'Odonil-natural-Air-freshener-jasmine-mist', '<p>Odonil natural Air freshener jasmine mist</p>', 45.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582971829Odonil natural Air freshener jasmine mist.jpg', NULL, NULL, '2020-02-29 04:23:49', '2020-08-27 10:22:51');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(180, 1, 87, 5, 15, NULL, '0179', 'Odonil natural Air freshener Orchid Dew', 'Odonil-natural-Air-freshener-Orchid-Dew', '<p>Odonil natural Air freshener Orchid Dew</p>', 45.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-02-29 04:24:52', '2020-08-27 10:22:51'),
(182, 1, 87, 5, 15, NULL, '0180', 'Odonil natural Air freshener Mystic Rose', 'Odonil-natural-Air-freshener-Mystic-Rose', '<p>Odonil natural Air freshener Mystic Rose</p>', 45.00, '50 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582972717Odonil natural Air freshener Mystic Rose.jpg', NULL, NULL, '2020-02-29 04:38:37', '2020-08-27 10:22:51'),
(183, 1, 87, 5, 15, NULL, '0181', 'Odonil natural Air freshener Mystic Rose', 'Odonil-natural-Air-freshener-Mystic-Rose', '<p>Odonil natural Air freshener Mystic Rose</p>', 60.00, '75 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582972781Odonil natural Air freshener Mystic Rose.jpg', NULL, NULL, '2020-02-29 04:39:41', '2020-08-27 10:22:51'),
(184, 1, 96, 5, 15, NULL, '0182', 'Dettol All in one Air freshener jasmin', 'Dettol-All-in-one-Air-freshener-jasmin', '<p>Dettol All in one Air freshener jasmin</p>', 450.00, '400 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582972835Dettol All in one Air freshener jasmin.jpg', NULL, NULL, '2020-02-29 04:40:35', '2020-08-27 10:22:51'),
(185, 1, 96, 5, 15, NULL, '0183', 'Dettol All in one Air freshener Spiring', 'Dettol-All-in-one-Air-freshener-Spiring', '<p>Dettol All in one Air freshener Spiring</p>', 450.00, '400 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582972875Dettol All in one Air freshener Spiring.jpg', NULL, NULL, '2020-02-29 04:41:15', '2020-08-27 10:22:51'),
(186, 1, 88, 5, 16, NULL, '0184', 'Vim dishwashing bar', 'Vim-dishwashing-bar', '<p>Vim dishwashing bar</p>', 32.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582983673Vim diswashing bar.jpg', NULL, NULL, '2020-02-29 07:41:13', '2020-08-27 10:22:51'),
(187, 1, 88, 5, 16, NULL, '0185', 'Vim dishwashing bar', 'Vim-dishwashing-bar', '<p>Vim dishwashing bar</p>', 48.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582983730Vim diswashing bar.jpg', NULL, NULL, '2020-02-29 07:42:10', '2020-08-27 10:22:51'),
(188, 1, 88, 5, 16, NULL, '0186', 'Vim Dishwashing Liquid', 'Vim-Dishwashing-Liquid', '<p>Vim Dishwashing Liquid</p>', 180.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1582983897Vim Dishwashing Liquid.jpg', NULL, NULL, '2020-02-29 07:44:57', '2020-08-27 10:22:51'),
(189, 1, 88, 5, 16, NULL, '0187', 'Vim Dishwashing Liquid', 'Vim-Dishwashing-Liquid', '<p>Vim Dishwashing Liquid</p>', 45.00, '250 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582983938Vim Dishwashing Liquid.jpg', NULL, NULL, '2020-02-29 07:45:38', '2020-08-27 10:22:51'),
(190, 1, 88, 5, 16, NULL, '0188', 'VIM Dishwashing Powder', 'VIM-Dishwashing-Powder', '<p>VIM Dishwashing Powder</p>', 35.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1582983996VIM Dishwashing Powder.jpg', NULL, NULL, '2020-02-29 07:46:36', '2020-08-27 10:22:51'),
(191, 1, 89, 5, 16, NULL, '0189', 'Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance', 'Trix-Dishwashing-Liquid-Refill-Sparkling-Clean-with-Lemon-Fragrance', '<p>Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance</p>', 55.00, '250 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582984212Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance.jpg', NULL, NULL, '2020-02-29 07:50:12', '2020-08-27 10:22:51'),
(192, 1, 89, 5, 16, NULL, '0190', 'Trix Monthly Pack', 'Trix-Monthly-Pack', '<p>Trix Monthly Pack</p>', 179.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1582984273Trix Monthly Pack.jpg', NULL, NULL, '2020-02-29 07:51:13', '2020-08-27 10:22:51'),
(193, 1, 89, 5, 16, NULL, '0191', 'Trix Lemon Dish Washing Liquid Lemon Refill Pack', 'Trix-Lemon-Dish-Washing-Liquid-Lemon-Refill-Pack', '<p>Trix Lemon Dish Washing Liquid Lemon Refill Pack</p>', 105.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1582984333Trix Lemon Dish Washing Liquid Lemon Refill Pack.jpg', NULL, NULL, '2020-02-29 07:52:13', '2020-08-27 10:22:51'),
(194, 1, 92, 5, 16, NULL, '0192', 'Rok Lemon Dish Washing Liquid', 'Rok-Lemon-Dish-Washing-Liquid', '<p>Rok Lemon Dish Washing Liquid&nbsp;</p>', 90.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144022Rok.jpg', NULL, NULL, '2020-03-02 02:40:43', '2020-08-27 10:22:51'),
(195, 1, 90, 5, 17, NULL, '0193', 'Harpic Toilet Cleaning Liquid Original', 'Harpic-Toilet-Cleaning-Liquid-Original', '<p>Harpic Toilet Cleaning Liquid Original</p>', 160.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1583143736harpic toilet.jpg', NULL, NULL, '2020-03-02 04:08:56', '2020-08-27 10:22:51'),
(196, 1, 90, 5, 17, NULL, '0194', 'Harpic Toilet Cleaning Liquid Original', 'Harpic-Toilet-Cleaning-Liquid-Original', '<p>Harpic Toilet Cleaning Liquid Original</p>', 130.00, '750 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583143790harpic toilet.jpg', NULL, NULL, '2020-03-02 04:09:50', '2020-08-27 10:22:51'),
(197, 1, 90, 5, 17, NULL, '0195', 'Harpic Bathroom Cleaning Powder Original', 'Harpic-Bathroom-Cleaning-Powder-Original', '<p>Harpic Bathroom Cleaning Powder Original</p>', 75.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583143849Harpic Bathroom Cleaning Powder Original.jpg', NULL, NULL, '2020-03-02 04:10:49', '2020-08-27 10:22:51'),
(198, 1, 90, 5, 17, NULL, '0196', 'Harpic Toilet Cleaning Powder', 'Harpic-Toilet-Cleaning-Powder', '<p>Harpic Toilet Cleaning Powder</p>', 70.00, '400 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583143895Harpic Toilet Cleaning Powder.jpg', NULL, NULL, '2020-03-02 04:11:35', '2020-08-27 10:22:51'),
(199, 1, 90, 5, 17, NULL, '0197', 'Harpic Toilet Cleaning Powder', 'Harpic-Toilet-Cleaning-Powder', '<p>Harpic Toilet Cleaning Powder</p>', 40.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583143936Harpic Toilet Cleaning Powder.jpg', NULL, NULL, '2020-03-02 04:12:16', '2020-08-27 10:22:51'),
(200, 1, 91, 5, 17, NULL, '0198', 'Lizol Floor Cleaner Lavender Disinfectant Surface', 'Lizol-Floor-Cleaner-Lavender-Disinfectant-Surface', '<p>Lizol Floor Cleaner Lavender Disinfectant Surface</p>', 140.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144091Lizol Floor Cleaner Lavender Disinfectant Surface.jpg', NULL, NULL, '2020-03-02 04:14:51', '2020-08-27 10:22:51'),
(201, 1, 91, 5, 17, NULL, '0199', 'Lizol Floor Cleaner Floral Disinfectant Surface', 'Lizol-Floor-Cleaner-Floral-Disinfectant-Surface', '<p>Lizol Floor Cleaner Floral Disinfectant Surface</p>', 245.00, '900 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144193Lizol Floor Cleaner Floral Disinfectant Surface.jpg', NULL, NULL, '2020-03-02 04:16:33', '2020-08-27 10:22:51'),
(202, 1, 91, 5, 17, NULL, '0200', 'Lizol Floor Cleaner Floral Disinfectant Surface', 'Lizol-Floor-Cleaner-Floral-Disinfectant-Surface', '<p>Lizol Floor Cleaner Floral Disinfectant Surface</p>', 140.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144272Lizol Floor Cleaner Floral Disinfectant Surface.jpg', NULL, NULL, '2020-03-02 04:17:52', '2020-08-27 10:22:51'),
(203, 1, 91, 5, 17, NULL, '0201', 'Lizol Floor Cleaner Citrus Disinfectant Surface', 'Lizol-Floor-Cleaner-Citrus-Disinfectant-Surface', '<p>Lizol Floor Cleaner Citrus Disinfectant Surface</p>', 245.00, '975 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144370Lizol Floor Cleaner Citrus Disinfectant Surface.jpg', NULL, NULL, '2020-03-02 04:19:30', '2020-08-27 10:22:51'),
(204, 1, 91, 5, 17, NULL, '0202', 'Lizol Floor Cleaner Citrus Disinfectant Surface', 'Lizol-Floor-Cleaner-Citrus-Disinfectant-Surface', '<p>Lizol Floor Cleaner Citrus Disinfectant Surface</p>', 140.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144423Lizol Floor Cleaner Citrus Disinfectant Surface.jpg', NULL, NULL, '2020-03-02 04:20:23', '2020-08-27 10:22:51'),
(205, 1, 91, 5, 17, NULL, '0203', 'Lizol Floor Cleaner Lavender Disinfectant Surface', 'Lizol-Floor-Cleaner-Lavender-Disinfectant-Surface', '<p>Lizol Floor Cleaner Lavender Disinfectant Surface</p>', 245.00, '975 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144493Lizol Floor Cleaner Lavender Disinfectant Surface.jpg', NULL, NULL, '2020-03-02 04:21:33', '2020-08-27 10:22:51'),
(206, 1, 92, 5, 17, NULL, '0204', 'RokSol Tiles & Bathroom Cleaner', 'RokSol-Tiles-&-Bathroom-Cleaner', '<p>Rok Sol Tiles &amp; Bathroom Cleaner</p>', 85.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144568RokSol Tiles & Bathroom Cleaner.jpg', NULL, NULL, '2020-03-02 04:22:48', '2020-08-27 10:22:51'),
(207, 1, 92, 5, 17, NULL, '0205', 'Rok Floor Cleaner (Lemon)', 'Rok-Floor-Cleaner-(Lemon)', '<p>Rok Floor Cleaner (Lemon)</p>', 230.00, '900 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144623Rok Floor Cleaner (Lemon).jpg', NULL, NULL, '2020-03-02 04:23:43', '2020-08-27 10:22:51'),
(208, 1, 92, 5, 17, NULL, '0206', 'Rok Citrus Floor Cleaner', 'Rok-Citrus-Floor-Cleaner', '<p>Rok Citrus Floor Cleaner</p>', 235.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1583144719Rok Citrus Floor Cleaner.jpg', NULL, NULL, '2020-03-02 04:25:19', '2020-08-27 10:22:51'),
(209, 1, 92, 5, 17, NULL, '0207', 'Rok Glass Cleaner Refill', 'Rok-Glass-Cleaner-Refill', '<p>Rok Glass Cleaner Refill</p>', 95.00, '350 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583145031Rok Glasso Glass Cleaner.jpg', NULL, NULL, '2020-03-02 04:30:31', '2020-08-27 10:22:51'),
(210, 1, 92, 5, 17, NULL, '0208', 'Rok Glasso Glass Cleaner', 'Rok-Glasso-Glass-Cleaner', '<p>Rok Glasso Glass Cleaner</p>', 130.00, '350 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583145090Rok Glasso Glass Cleaner.jpg', NULL, NULL, '2020-03-02 04:31:30', '2020-08-27 10:22:51'),
(211, 1, 92, 5, 17, NULL, '0209', 'Rok Glass Cleaner Spray', 'Rok-Glass-Cleaner-Spray', '<p>Rok Glass Cleaner Spray</p>', 130.00, '350 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146195Rok Glasso Glass Cleaner,.jpg', NULL, NULL, '2020-03-02 04:49:55', '2020-08-27 10:22:51'),
(212, 1, 92, 5, 17, NULL, '0210', 'Rok Bleaching Powder', 'Rok-Bleaching-Powder', '<p>Rok Bleaching Powder</p>', 50.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146238rok bleaching powder,.jpg', NULL, NULL, '2020-03-02 04:50:38', '2020-08-27 10:22:51'),
(213, 1, 92, 5, 17, NULL, '0211', 'Rok Perfume Phenyle', 'Rok-Perfume-Phenyle', '<p>Rok Perfume Phenyl</p>', 165.00, '1.5 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146296rok phinayel.jpg', NULL, NULL, '2020-03-02 04:51:36', '2020-08-27 10:22:51'),
(214, 1, 93, 5, 17, NULL, '0212', 'Mr.Brasso Glass & Household Cleaner Refill', 'Mr.Brasso-Glass-&-Household-Cleaner-Refill', '<p>Mr.Brasso Glass &amp; Household Cleaner Refill</p>', 110.00, '350 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146628Mr.Brasso Glass & Household Cleaner Refill.jpg', NULL, NULL, '2020-03-02 04:57:08', '2020-08-27 10:22:51'),
(215, 1, 93, 5, 17, NULL, '0213', 'Mr.Brasso Glass & Household Cleaner Spray', 'Mr.Brasso-Glass-&-Household-Cleaner-Spray', '<p>Mr.Brasso Glass &amp; Household Cleaner Spray</p>', 135.00, '350 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146680Mr.Brasso Glass & Household Cleaner Spray.jpg', NULL, NULL, '2020-03-02 04:58:00', '2020-08-27 10:22:51'),
(216, 1, 94, 5, 17, NULL, '0214', 'Shakti Liquid Toilet Cleaner', 'Shakti-Liquid-Toilet-Cleaner', '<p>Shakti Liquid Toilet Cleaner&nbsp;</p>', 120.00, '750 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146739Shakti Liquid Toilet Cleaner.jpg', NULL, NULL, '2020-03-02 04:58:59', '2020-08-27 10:22:51'),
(217, 1, 95, 5, 17, NULL, '0215', 'Finis Fixol Toilet & Tiles Cleaner', 'Finis-Fixol-Toilet-&-Tiles-Cleaner', '<p>Finis Fixol Toilet &amp; Tiles Cleaner&nbsp;</p>', 80.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146800fixol finish.jpeg', NULL, NULL, '2020-03-02 05:00:00', '2020-08-27 10:22:51'),
(218, 1, 96, 5, 17, NULL, '0216', 'Dettol Handwash Pump Re-energize', 'Dettol-Handwash-Pump-Re-energize', '<p>Dettol Handwash Pump Re-energize</p>', 100.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146862Dettol Handwash Pump Re-energize.jpg', NULL, NULL, '2020-03-02 05:01:02', '2020-08-27 10:22:51'),
(219, 1, 96, 5, 17, NULL, '0217', 'Dettol Handwash Pump Skincare', 'Dettol-Handwash-Pump-Skincare', '<p>Dettol Handwash Pump Skincare&nbsp;</p>', 95.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146924Dettol Handwash Pump Skincare.jpg', NULL, NULL, '2020-03-02 05:02:04', '2020-08-27 10:22:51'),
(220, 1, 96, 5, 17, NULL, '0218', 'Dettol Handwash Pump Cool', 'Dettol-Handwash-Pump-Cool', '<p>Dettol Handwash Pump Cool</p>', 100.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583146973Dettol Handwash Pump Cool.jpg', NULL, NULL, '2020-03-02 05:02:53', '2020-08-27 10:22:51'),
(221, 1, 96, 5, 17, NULL, '0219', 'Dettol Handwash Refill Poly Cool', 'Dettol-Handwash-Refill-Poly-Cool', '<p>Dettol Handwash Refill Poly Cool</p>', 65.00, '170 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147034Dettol Handwash Refill Poly Cool.jpg', NULL, NULL, '2020-03-02 05:03:54', '2020-08-27 10:22:51'),
(222, 1, 96, 5, 17, NULL, '0220', 'Dettol Handwash pump Gold', 'Dettol-Handwash-pump-Gold', '<p>Dettol Handwash pump Gold</p>', 100.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147091Dettol Handwash pump Gold.png', NULL, NULL, '2020-03-02 05:04:51', '2020-08-27 10:22:51'),
(223, 1, 96, 5, 17, NULL, '0221', 'Dettol Handwash pump gold Refill pack', 'Dettol-Handwash-pump-gold-Refill-pack', '<p>Dettol Handwash pump gold Refill pack</p>', 65.00, '170 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147261Dettol Handwash pump gold Refill pack.jpg', NULL, NULL, '2020-03-02 05:07:41', '2020-08-27 10:22:51'),
(224, 1, 96, 5, 17, NULL, '0222', 'Dettol Handwash  Refill Sensitive', 'Dettol-Handwash-Refill-Sensitive', '<p>Dettol Handwash &nbsp;Refill Sensitive</p>', 220.00, '750 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147524Dettol Handwash  Refill Sensitive.jpeg', NULL, NULL, '2020-03-02 05:12:04', '2020-08-27 10:22:51'),
(225, 1, 96, 5, 17, NULL, '0223', 'Dettol Handwash Refill Poly Re-energize', 'Dettol-Handwash-Refill-Poly-Re-energize', '<p>Dettol Handwash Refill Poly Re-energize</p>', 65.00, '170 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147579Dettol Handwash Refill Poly Re-energize.jpg', NULL, NULL, '2020-03-02 05:12:59', '2020-08-27 10:22:51'),
(226, 1, 96, 5, 17, NULL, '0224', 'Dettol Anticeptic Liquid', 'Dettol-Anticeptic-Liquid', '<p>Dettol Anticeptic Liquid</p>', 35.00, '50 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147653Dettol Anticeptic Liquid. 50 ml.jpg', NULL, NULL, '2020-03-02 05:14:13', '2020-08-27 10:22:51'),
(227, 1, 96, 5, 17, NULL, '0225', 'Dettol Anticeptic Liquid', 'Dettol-Anticeptic-Liquid', '<p>Dettol Anticeptic Liquid</p>', 155.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147709Dettol Anticeptic Liquid.jpg', NULL, NULL, '2020-03-02 05:15:09', '2020-08-27 10:22:51'),
(228, 1, 96, 5, 17, NULL, '0226', 'Dettol Anticeptic Liquid', 'Dettol-Anticeptic-Liquid', '<p>Dettol Anticeptic Liquid</p>', 48.00, '100 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147759Dettol Anticeptic Liquid. 50 ml.jpg', NULL, NULL, '2020-03-02 05:15:59', '2020-08-27 10:22:51'),
(229, 1, 96, 5, 17, NULL, '0227', 'Dettol Handwash Refill Poly Original', 'Dettol-Handwash-Refill-Poly-Original', '<p>Dettol Handwash Refill Poly Original</p>', 60.00, '170 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147871Dettol Handwash Refill Poly Original.jpg', NULL, NULL, '2020-03-02 05:17:51', '2020-08-27 10:22:51'),
(230, 1, 96, 5, 17, NULL, '0228', 'Dettol Handwash Pump Sensitive', 'Dettol-Handwash-Pump-Sensitive', '<p>Dettol Handwash Pump Sensitive</p>', 95.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583147934Dettol Handwash Pump Sensitive.jpg', NULL, NULL, '2020-03-02 05:18:54', '2020-08-27 10:22:51'),
(231, 1, 78, 5, 17, NULL, '0229', 'Savlon Liquid', 'Savlon-Liquid', '<p>Savlon Liquid anti septic</p>', 44.00, '112 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583154047Savlon Liquid. 112.jpg', NULL, NULL, '2020-03-02 07:00:47', '2020-08-27 10:22:51'),
(232, 1, 78, 5, 17, NULL, '0230', 'Savlon Liquid antiseptic', 'Savlon-Liquid-antiseptic', '<p>Savlon Liquid antiseptic</p>', 32.00, '56 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583154117Savlon Liquid. 112.jpg', NULL, NULL, '2020-03-02 07:01:57', '2020-08-27 10:22:51'),
(233, 1, 78, 5, 17, NULL, '0231', 'Savlon Liquid antiseptic', 'Savlon-Liquid-antiseptic', '<p>Savlon Liquid antiseptic</p>', 125.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583154182Savlon Liquid .500.png', NULL, NULL, '2020-03-02 07:03:02', '2020-08-27 10:22:51'),
(234, 1, 78, 5, 17, NULL, '0232', 'Savlon Antiseptic Cream', 'Savlon-Antiseptic-Cream', '<p>Savlon Antiseptic Cream</p>', 25.00, '30 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583154770Savlon Antiseptic Cream. 30 gm.jpg', NULL, NULL, '2020-03-02 07:12:50', '2020-08-27 10:22:51'),
(235, 1, 78, 5, 17, NULL, '0233', 'Savlon Antiseptic Cream', 'Savlon-Antiseptic-Cream', '<p>Savlon Antiseptic Cream</p>', 34.00, '60 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583154911Savlon Antiseptic Cream. 30 gm.jpg', NULL, NULL, '2020-03-02 07:15:11', '2020-08-27 10:22:51'),
(236, 1, 78, 5, 17, NULL, '0234', 'Savlon Hand Wash Aloe Vera', 'Savlon-Hand-Wash-Aloe-Vera', '<p>Savlon Hand Wash Aloe Vera&nbsp;</p>', 90.00, '250 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583155098savlon aloe vera.jpeg', NULL, NULL, '2020-03-02 07:18:18', '2020-08-27 10:22:51'),
(237, 1, 78, 5, 17, NULL, '0235', 'Savlon Hand Wash Aloe Vera', 'Savlon-Hand-Wash-Aloe-Vera', '<p>Savlon Hand Wash Aloe Vera&nbsp;</p>', 150.00, '500 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583155589savlon aloe vera.jpeg', NULL, NULL, '2020-03-02 07:26:29', '2020-08-27 10:22:51'),
(238, 1, 78, 5, 17, NULL, '0236', 'Savlon Ocean Blue Antiseptic Handwash', 'Savlon-Ocean-Blue-Antiseptic-Handwash', '<p>Savlon Ocean Blue Antiseptic Handwash&nbsp;</p>', 90.00, '250 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583155775Savlon Ocean Blue Antiseptic Handwash.jpg', NULL, NULL, '2020-03-02 07:29:35', '2020-08-27 10:22:51'),
(239, 1, 78, 5, 17, NULL, '0237', 'Savlon Ocean Blue Antiseptic Hand Wash (Refill)', 'Savlon-Ocean-Blue-Antiseptic-Hand-Wash-(Refill)', '<p>Savlon Ocean Blue Antiseptic Hand Wash (Refill)&nbsp;</p>', 55.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583155912Savlon Ocean Blue Antiseptic Hand Wash (Refill).jpg', NULL, NULL, '2020-03-02 07:31:52', '2020-08-27 10:22:51'),
(240, 1, 78, 5, 17, NULL, '0238', 'Savlon Instant Hand Sanitizer', 'Savlon-Instant-Hand-Sanitizer', '<p>Savlon Instant Hand Sanitizer&nbsp;</p>', 80.00, '50 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583155973Savlon Instant Hand Sanitizer.png', NULL, NULL, '2020-03-02 07:32:53', '2020-08-27 10:22:51'),
(241, 1, 78, 5, 17, NULL, '0239', 'Savlon Cool Antiseptic Soap', 'Savlon-Cool-Antiseptic-Soap', '<p>Savlon Cool Antiseptic Soap&nbsp;</p>', 45.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156042Savlon Cool Antiseptic Soap.jpg', NULL, NULL, '2020-03-02 07:34:02', '2020-08-27 10:22:51'),
(242, 1, 97, 5, 17, NULL, '0240', 'Lifebuoy Handwash Total Refill', 'Lifebuoy-Handwash-Total-Refill', '<p>Lifebuoy Handwash Total Refill&nbsp;</p>', 55.00, '180 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156324Lifebuoy Handwash Total Refill.jpg', NULL, NULL, '2020-03-02 07:38:44', '2020-08-27 10:22:51'),
(243, 1, 97, 5, 17, NULL, '0241', 'Lifebuoy Handwash Care Refill', 'Lifebuoy-Handwash-Care-Refill', '<p>Lifebuoy Handwash Care Refill&nbsp;</p>', 55.00, '180 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156371Lifebuoy Handwash Care Refill.jpeg', NULL, NULL, '2020-03-02 07:39:31', '2020-08-27 10:22:51'),
(244, 1, 97, 5, 17, NULL, '0242', 'Lifebuoy Handwash Total Pump', 'Lifebuoy-Handwash-Total-Pump', '<p>Lifebuoy Handwash Total Pump&nbsp;</p>', 90.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156456Lifebuoy Handwash Total Pump.png', NULL, NULL, '2020-03-02 07:40:56', '2020-08-27 10:22:51'),
(245, 1, 97, 5, 17, NULL, '0243', 'Lifebuoy Handwash Lemon Fresh Pump', 'Lifebuoy-Handwash-Lemon-Fresh-Pump', '<p>Lifebuoy Handwash Lemon Fresh Pump</p>', 95.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156519Lifebuoy Handwash Lemon Fresh Pump.jpg', NULL, NULL, '2020-03-02 07:41:59', '2020-08-27 10:22:51'),
(246, 1, 97, 5, 17, NULL, '0244', 'Lifebuoy Handwash Lemon Fresh Refill', 'Lifebuoy-Handwash-Lemon-Fresh-Refill', '<p>Lifebuoy Handwash Lemon Fresh Refill&nbsp;</p>', 60.00, '180 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156806Lifebuoy Handwash Lemon Fresh Refill.jpg', NULL, NULL, '2020-03-02 07:46:46', '2020-08-27 10:22:51'),
(247, 1, 97, 5, 17, NULL, '0245', 'Lifebuoy Handwash Care Pump', 'Lifebuoy-Handwash-Care-Pump', '<p>Lifebuoy Handwash Care Pump&nbsp;</p>', 90.00, '200 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583156867Lifebuoy Handwash Care Pump.jpg', NULL, NULL, '2020-03-02 07:47:47', '2020-08-27 10:22:51'),
(248, 1, 59, 5, 20, NULL, '0246', 'Bashundhara Toilet Tissue (17X 4pcs)', 'Bashundhara-Toilet-Tissue-(17X-4pcs)', '<p>Bashundhara Toilet Tissue (17X 4pcs)</p>', 17.00, '4 pcs', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583160563Bashundhara Toilet Tissue (17X 4pcs).jpg', NULL, NULL, '2020-03-02 08:49:23', '2020-08-27 10:22:51'),
(249, 1, 59, 5, 20, NULL, '0247', 'Bashundhara Gold Toilet Tissue', 'Bashundhara-Gold-Toilet-Tissue', '<p>Bashundhara Gold Toilet Tissue</p>', 50.00, '2 pcs', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583160672Bashundhara Gold Toilet Tissue (25X2pcs).jpeg', NULL, NULL, '2020-03-02 08:51:12', '2020-08-27 10:22:51'),
(250, 1, 59, 5, 20, NULL, '0248', 'Bashundhara Facial Tissue', 'Bashundhara-Facial-Tissue', '<p>Bashundhara Facial Tissue&nbsp;150 X 2 ply</p>', 80.00, '150 X 2 ply', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583160744Bashundhara Facial Tissue  150x2.jpg', NULL, NULL, '2020-03-02 08:52:24', '2020-08-27 10:22:51'),
(251, 1, 59, 5, 17, NULL, '0249', 'Bashundhara Facial Tissue', 'Bashundhara-Facial-Tissue', '<p>Bashundhara Facial Tissue&nbsp;120 x 2 ply</p>', 62.00, '120 x 2 ply', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583160883Bashundhara Facial Tissue 120x2.jpg', NULL, NULL, '2020-03-02 08:54:43', '2020-08-27 10:22:51'),
(252, 1, 59, 5, 20, NULL, '0250', 'Bashundhara Paper Napkins 13\" Unscented (100 pcs)', 'Bashundhara-Paper-Napkins-13\"-Unscented-(100-pcs)', '<p>Bashundhara Paper Napkins 13&quot; Unscented (100 pcs)</p>', 55.00, '100 pcs', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583161066Bashundhara Paper Napkins 13 Unscented.jpg', NULL, NULL, '2020-03-02 08:57:46', '2020-08-27 10:22:51'),
(253, 1, 59, 5, 20, NULL, '0251', 'Bashundhara Kitchen Towel 2 Rolls', 'Bashundhara-Kitchen-Towel-2-Rolls', '<p>Bashundhara Kitchen Towel 2 Rolls&nbsp;</p>', 114.00, '2 rolls', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583161125Bashundhara Kitchen Towel 2 Rolls.jpg', NULL, NULL, '2020-03-02 08:58:45', '2020-08-27 10:22:51'),
(254, 1, 59, 5, 20, NULL, '0252', 'Bashundhara Hand Towel 1 ply', 'Bashundhara-Hand-Towel-1-ply', '<p>Bashundhara Hand Towel 1 ply</p>', 78.00, '250 pcs', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583161182Bashundhara Hand Towel 1 ply.jpg', NULL, NULL, '2020-03-02 08:59:42', '2020-08-27 10:22:51'),
(255, 1, 67, 5, 17, NULL, '0253', 'Fresh Perfumed Facial Tissue (150 X 2) ply Box', 'Fresh-Perfumed-Facial-Tissue-(150-X-2)-ply-Box', '<p>Fresh Perfumed Facial Tissue (150 X 2) ply Box</p>', 80.00, '150 X 2 ply', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583214657Fresh Perfumed Facial Tissue (150 X 2) ply Box.jpg', NULL, NULL, '2020-03-02 23:50:57', '2020-08-27 10:22:51'),
(256, 1, 67, 5, 17, NULL, '0254', 'Fresh Perfumed Facial Tissue (120 X 2) ply Box', 'Fresh-Perfumed-Facial-Tissue-(120-X-2)-ply-Box', '<p>Fresh Perfumed Facial Tissue (120 X 2) ply Box</p>', 62.00, '120 X 2 ply', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583214721Fresh Perfumed Facial Tissue  (120 X 2) ply Box.jpg', NULL, NULL, '2020-03-02 23:52:01', '2020-08-27 10:22:51'),
(257, 1, 67, 5, 17, NULL, '0255', 'Fresh Paper Napkins 13\" Perfumed (100X1 Ply)', 'Fresh-Paper-Napkins-13\"-Perfumed-(100X1-Ply)', '<p>Fresh Paper Napkins 13&quot; Perfumed (100X1 Ply)</p>', 55.00, '100X1 Ply', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583214801Fresh Paper Napkins 13 Perfumed (100X1 Ply).jpg', NULL, NULL, '2020-03-02 23:53:21', '2020-08-27 10:22:51'),
(258, 1, 67, 5, 17, NULL, '0256', 'Fresh Toilet Tissue (Family Value Pack)', 'Fresh-Toilet-Tissue-(Family-Value-Pack)', '<p>Fresh Toilet Tissue (Family Value Pack)</p>', 65.00, '4 pcs', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583214953Fresh Toilet Tissue (Family Value Pack).jpg', NULL, NULL, '2020-03-02 23:55:53', '2020-08-27 10:22:51'),
(259, 1, 67, 5, 17, NULL, '0257', 'Fresh Hand Towel (250X1 Ply)', 'Fresh-Hand-Towel-(250X1-Ply)', '<p>Fresh Hand Towel (250X1 Ply)</p>', 78.00, '(250X1 Ply). each', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583215040Fresh Hand Towel (250X1 Ply).jpg', NULL, NULL, '2020-03-02 23:57:20', '2020-08-27 10:22:51'),
(260, 1, 67, 5, 17, NULL, '0258', 'Fresh kitchen Towel Roll 2 roll', 'Fresh-kitchen-Towel-Roll-2-roll', '<p>Fresh kitchen Towel Roll</p>', 120.00, '2 rolls', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583215133Fresh kitchen Towel Roll 2 rolls.jpeg', NULL, NULL, '2020-03-02 23:58:53', '2020-08-27 10:22:51'),
(261, 1, 67, 5, 17, NULL, '0259', 'Fresh White Wallet Tissue (10X2 Ply)', 'Fresh-White-Wallet-Tissue-(10X2-Ply)', '<p>Fresh White Wallet Tissue (10X2 Ply)</p>', 10.00, 'each', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583215226Fresh White Wallet Tissue (10X2 Ply).jpg', NULL, NULL, '2020-03-03 00:00:26', '2020-08-27 10:22:51'),
(262, 1, 35, 4, 30, NULL, '0260', 'Sunsilk Shampoo Hijab Recharge', 'Sunsilk-Shampoo-Hijab-Recharge', '<p>Sunsilk Shampoo Hijab Recharge</p>', 180.00, '180 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583389375Sunsilk Shampoo Hijab Recharge.jpg', NULL, NULL, '2020-03-05 00:22:55', '2020-08-27 10:22:51'),
(263, 1, 100, 5, 19, NULL, '0261', 'Surf Excel Powder Matic Front', 'Surf-Excel-Powder-Matic-Front', '<p>Surf Excel Powder Matic Front</p>', 275.00, '1 kg', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583557510Surf Excel Powder Matic Front.jpg', NULL, NULL, '2020-03-06 23:05:10', '2020-08-27 10:22:51'),
(264, 1, 100, 5, 19, NULL, '0262', 'Surf Excel Matic Liquid Detergent Front Load', 'Surf-Excel-Matic-Liquid-Detergent-Front-Load', '<p>Surf Excel Matic Liquid Detergent Front Load</p>', 210.00, '500ml', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583557609Surf Excel Matic Liquid Detergent Front Load.jpg', NULL, NULL, '2020-03-06 23:06:49', '2020-08-27 10:22:51'),
(265, 1, 103, 5, 19, NULL, '0263', 'Chamak Fabric Brightner', 'Chamak-Fabric-Brightner', '<p>Chamak Fabric Brightner</p>', 30.00, '100ml', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583557936Chamak Fabric Brightner.jpg', NULL, NULL, '2020-03-06 23:12:16', '2020-08-27 10:22:51'),
(266, 1, 101, 5, 19, NULL, '0264', 'Chaka Advanced Ball soap', 'Chaka-Advanced-Ball-soap', '<p>Chaka Advanced Ball soap</p>', 16.00, '130 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583558114Chaka Advanced Ball soap.jpg', NULL, NULL, '2020-03-06 23:15:14', '2020-08-27 10:22:51'),
(267, 1, 101, 5, 19, NULL, '0265', 'Chaka Advanced Lemon washing powder', 'Chaka-Advanced-Lemon-washing-powder', '<p>Chaka Advanced Lemon washing powder</p>', 42.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583558169Chaka Advanced Lemon washing powder.jpg', NULL, NULL, '2020-03-06 23:16:09', '2020-08-27 10:22:51'),
(268, 1, 86, 5, 37, NULL, '0266', 'Godrej Good Knight Power Activ + Cartridge', 'Godrej-Good-Knight-Power-Activ-+-Cartridge', '<p>Godrej Good Knight Power Activ + Cartridge</p>', 120.00, '45 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558219Godrej Good Knight Power Activ + Cartridge.jpg', NULL, NULL, '2020-03-06 23:16:59', '2020-08-27 10:22:51'),
(269, 1, 101, 5, 19, NULL, '0267', 'Chaka Super White Washing Powder', 'Chaka-Super-White-Washing-Powder', '<p>Chaka Super White Washing Powder</p>', 60.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583558224Chaka Super White Washing Powder.jpg', NULL, NULL, '2020-03-06 23:17:04', '2020-08-27 10:22:51'),
(270, 1, 102, 5, 19, NULL, '0268', 'Keya glycerine Laundry soap', 'Keya-glycerine-Laundry-soap', '<p>Keya glycerine Laundry soap</p>', 20.00, '130 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583558293Keya glycerine Laundry soap.jpg', NULL, NULL, '2020-03-06 23:18:13', '2020-08-27 10:22:51'),
(271, 1, 86, 5, 37, NULL, '0269', 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge', 'Godrej-Good-Knight-Xpress-System-Liquid-Vapouriser-Cartridge', '<p>Godrej Good Knight Xpress System Liquid Vapouriser Cartridge</p>', 135.00, '35 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558296Godrej Good Knight Xpress System Liquid Vapouriser Cartridge.png', NULL, NULL, '2020-03-06 23:18:16', '2020-08-27 10:22:51'),
(272, 1, 78, 5, 16, NULL, '0270', 'ACI Smart Laundry Soap', 'ACI-Smart-Laundry-Soap', '<p>ACI Smart Laundry Soap</p>', 20.00, '130 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558367ACI Smart Laundry Soap.jpg', NULL, NULL, '2020-03-06 23:19:27', '2020-08-27 10:22:51'),
(273, 1, 78, 5, 16, NULL, '0271', 'ACI Smart Washing Powder', 'ACI-Smart-Washing-Powder', '<p>ACI Smart Washing Powder</p>', 80.00, '1kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558416ACI Smart Washing Powder.jpg', NULL, NULL, '2020-03-06 23:20:16', '2020-08-27 10:22:51'),
(274, 1, 86, 5, 37, NULL, '0272', 'Godrej Good Knight Power Active (Dual Power) Machine + Refill', 'Godrej-Good-Knight-Power-Active-(Dual-Power)-Machine-+-Refill', '<p>Godrej Good Knight Power Active (Dual Power) Machine + Refill</p>', 149.00, 'each', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558441Godrej Good Knight Power Active (Dual Power) Machine + Refill.jpg', NULL, NULL, '2020-03-06 23:20:41', '2020-08-27 10:22:51'),
(275, 1, 78, 5, 16, NULL, '0273', 'ACI Smart Supreme Washing Powder', 'ACI-Smart-Supreme-Washing-Powder', '<p>ACI Smart Supreme Washing Powder</p>', 60.00, '500 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558461ACI Smart Supreme Washing Powder.jpg', NULL, NULL, '2020-03-06 23:21:01', '2020-08-27 10:22:51'),
(276, 1, 86, 5, 37, NULL, '0274', 'Godrej Good Knight Advanced Xpress Coil', 'Godrej-Good-Knight-Advanced-Xpress-Coil', '<p>Godrej Good Knight Advanced Xpress Coil</p>', 80.00, '10 pcs pack', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558546Godrej Good Knight Advanced Xpress Coil.jpg', NULL, NULL, '2020-03-06 23:22:26', '2020-08-27 10:22:51'),
(277, 1, 86, 5, 37, NULL, '0275', 'Godrej Hit Lime Mosquitoes & Flies Spray', 'Godrej-Hit-Lime-Mosquitoes-&-Flies-Spray', '<p>Godrej Hit Lime Mosquitoes &amp; Flies Spray</p>', 301.00, '400 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558654Godrej Hit Lime Mosquitoes & Flies Spray.jpg', NULL, NULL, '2020-03-06 23:24:14', '2020-08-27 10:22:51'),
(278, 1, 86, 5, 37, NULL, '0276', 'Godrej New Hit Mosquitoes Spray', 'Godrej-New-Hit-Mosquitoes-Spray', '<p>Godrej New Hit Mosquitoes Spray</p>', 301.00, '400 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558717Godrej New Hit Mosquitoes Spray.jpg', NULL, NULL, '2020-03-06 23:25:17', '2020-08-27 10:22:51'),
(279, 1, 104, 5, 19, NULL, '0277', 'Tide Detergent Powder Jasmine&Rose', 'Tide-Detergent-Powder-Jasmine&Rose', '<p>Tide Detergent Powder Jasmine&amp;Rose</p>', 140.00, '500 gm', NULL, NULL, 'In Stock', 1000, NULL, 0, '1583558746Tide Detergent Powder Jasmine&Rose.jpg', NULL, NULL, '2020-03-06 23:25:46', '2020-08-27 10:22:51'),
(280, 1, 86, 5, 37, NULL, '0278', 'Godrej New Hit Cockroaches Spray', 'Godrej-New-Hit-Cockroaches-Spray', '<p>Godrej New Hit Cockroaches Spray</p>', 301.00, '400 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558775Godrej New Hit Cockroaches Spray.jpg', NULL, NULL, '2020-03-06 23:26:15', '2020-08-27 10:22:51'),
(281, 1, 86, 5, 37, NULL, '0279', 'Godrej Good Knight Xpress Liquid Vapouriser Machine & Refill', 'Godrej-Good-Knight-Xpress-Liquid-Vapouriser-Machine-&-Refill', '<p>Godrej Good Knight Xpress Liquid Vapouriser Machine &amp; Refill</p>', 225.00, 'each', NULL, NULL, 'In Stock', 100, NULL, 0, '1583558907Godrej Good Knight Xpress Liquid Vapouriser Machine & Refill.jpg', NULL, NULL, '2020-03-06 23:28:27', '2020-08-27 10:22:51'),
(282, 1, 86, 5, 37, NULL, '0280', 'Godrej New Hit Anti Roach Gel 45 Days', 'Godrej-New-Hit-Anti-Roach-Gel-45-Days', '<p>Godrej New Hit Anti Roach Gel 45 Days</p>', 199.00, 'each', NULL, NULL, 'In Stock', 100, NULL, 0, '1583559001Godrej New Hit Anti Roach Gel 45 Days.jpg', NULL, NULL, '2020-03-06 23:30:01', '2020-08-27 10:22:51'),
(283, 1, 86, 5, 37, NULL, '0281', 'Godrej Good Knight Mosquito Fabric Roll On', 'Godrej-Good-Knight-Mosquito-Fabric-Roll-On', '<p>Godrej Good Knight Mosquito Fabric Roll-On</p>', 93.00, '8 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583559187Godrej Good Knight Mosquito Fabric Roll On.jpg', NULL, NULL, '2020-03-06 23:33:07', '2020-08-27 10:22:51'),
(284, 1, 78, 5, 37, NULL, '0282', 'ACI Aerosol Insect Spray Jumbo', 'ACI-Aerosol-Insect-Spray-Jumbo', '<p>ACI Aerosol Insect Spray Jumbo</p>', 450.00, '800 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583559980ACI Aerosol Insect Spray Jumbo 800.jpg', NULL, NULL, '2020-03-06 23:46:20', '2020-08-27 10:22:51'),
(285, 1, 78, 5, 37, NULL, '0283', 'ACI Aerosol Insect Spray', 'ACI-Aerosol-Insect-Spray', '<p>ACI Aerosol Insect Spray</p>', 305.00, '475 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583560072ACI Aerosol Insect Spray 450, 125 ml.jpg', NULL, NULL, '2020-03-06 23:47:52', '2020-08-27 10:22:51'),
(286, 1, 78, 5, 37, NULL, '0284', 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill', 'ACI-All-Out-Ultra-Mosquito-Liquid-Vaporizer-Refill', '<p>ACI All Out Ultra Mosquito Liquid Vaporizer Refill</p>', 100.00, '45 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583560182ACI All Out Ultra Mosquito Liquid Vaporizer Refill.jpeg', NULL, NULL, '2020-03-06 23:49:42', '2020-08-27 10:22:51'),
(287, 1, 78, 5, 37, NULL, '0285', 'Xpel Aerosol', 'Xpel-Aerosol', '<p>Xpel Aerosol</p>', 305.00, '475 ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583560308Xpel Aerosol.jpeg', NULL, NULL, '2020-03-06 23:51:48', '2020-08-27 10:22:51'),
(288, 1, 35, 4, 30, NULL, '0286', 'Sunsilk Shampoo Hijab Recharge', 'Sunsilk-Shampoo-Hijab-Recharge', '<p>Sunsilk Shampoo Hijab Recharge</p>', 315.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583560360Sunsilk Shampoo Hijab Recharge.jpg', NULL, NULL, '2020-03-06 23:52:40', '2020-08-27 10:22:51'),
(289, 1, 35, 4, 30, NULL, '0287', 'Sunsilk Shampoo Hijab Anti-Breakage', 'Sunsilk-Shampoo-Hijab-Anti-Breakage', '<p>Sunsilk Shampoo Hijab Anti-Breakage</p>', 315.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583560836Sunsilk Shampoo Hijab Anti-Breakage.jpg', NULL, NULL, '2020-03-07 00:00:36', '2020-08-27 10:22:51'),
(290, 1, 35, 4, 30, NULL, '0288', 'Sunsilk Shampoo Hijab Anti-Breakage', 'Sunsilk-Shampoo-Hijab-Anti-Breakage', '<p>Sunsilk Shampoo Hijab Anti-Breakage</p>', 180.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583560891Sunsilk Shampoo Hijab Anti-Breakage.jpg', NULL, NULL, '2020-03-07 00:01:31', '2020-08-27 10:22:51'),
(291, 1, 35, 4, 30, NULL, '0289', 'Sunsilk Shampoo Hijab Anti Dandruff', 'Sunsilk-Shampoo-Hijab-Anti-Dandruff', '<p>Sunsilk Shampoo Hijab Anti Dandruff&nbsp;</p>', 315.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561071Sunsilk Shampoo Hijab Anti Dandruff.jpg', NULL, NULL, '2020-03-07 00:04:31', '2020-08-27 10:22:51'),
(292, 1, 35, 4, 30, NULL, '0290', 'Sunsilk Shampoo Lusciously Thick & Long', 'Sunsilk-Shampoo-Lusciously-Thick-&-Long', '<p>Sunsilk Shampoo Lusciously Thick &amp; Long</p>', 305.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561124Sunsilk Shampoo Lusciously Thick & Long.jpg', NULL, NULL, '2020-03-07 00:05:24', '2020-08-27 10:22:51'),
(293, 1, 35, 4, 30, NULL, '0291', 'Sunsilk Shampoo Lusciously Thick & Long', 'Sunsilk-Shampoo-Lusciously-Thick-&-Long', '<p>Sunsilk Shampoo Lusciously Thick &amp; Long</p>', 175.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561163Sunsilk Shampoo Lusciously Thick & Long.jpg', NULL, NULL, '2020-03-07 00:06:03', '2020-08-27 10:22:51'),
(294, 1, 35, 4, 30, NULL, '0292', 'Sunsilk Shampoo Perfect Straight', 'Sunsilk-Shampoo-Perfect-Straight', '<p>Sunsilk Shampoo Perfect Straight</p>', 180.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561238Sunsilk Shampoo Perfect Straight.jpg', NULL, NULL, '2020-03-07 00:07:18', '2020-08-27 10:22:51'),
(295, 1, 35, 4, 30, NULL, '0293', 'Sunsilk Shampoo Perfect Straight', 'Sunsilk-Shampoo-Perfect-Straight', '<p>Sunsilk Shampoo Perfect Straight</p>', 315.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561276Sunsilk Shampoo Perfect Straight.jpg', NULL, NULL, '2020-03-07 00:07:56', '2020-08-27 10:22:51'),
(296, 1, 35, 4, 30, NULL, '0294', 'Sunsilk Conditioner Perfect Straight', 'Sunsilk-Conditioner-Perfect-Straight', '<p>Sunsilk Conditioner Perfect Straight</p>', 65.00, '80ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561349Sunsilk Conditioner Perfect Straight.jpg', NULL, NULL, '2020-03-07 00:09:09', '2020-08-27 10:22:51'),
(297, 1, 35, 4, 30, NULL, '0295', 'Sunsilk Shampoo Stunning Black Shine', 'Sunsilk-Shampoo-Stunning-Black-Shine', '<p>Sunsilk Shampoo Stunning Black Shine</p>', 305.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561655Sunsilk Shampoo Stunning Black Shine.jpg', NULL, NULL, '2020-03-07 00:14:15', '2020-08-27 10:22:51'),
(298, 1, 35, 4, 30, NULL, '0296', 'Sunsilk Shampoo Stunning Black Shine', 'Sunsilk-Shampoo-Stunning-Black-Shine', '<p>Sunsilk Shampoo Stunning Black Shine</p>', 175.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561694Sunsilk Shampoo Stunning Black Shine.jpg', NULL, NULL, '2020-03-07 00:14:54', '2020-08-27 10:22:51'),
(299, 1, 95, 5, 37, NULL, '0297', 'Finis Insect Powder', 'Finis-Insect-Powder', '<p>Finis Insect Powder</p>', 30.00, '40 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562445Finis Insect Powder.jpeg', NULL, NULL, '2020-03-07 00:16:33', '2020-08-27 10:22:51'),
(300, 1, 105, 5, 37, NULL, '0298', 'Odomos Mosquito Repellent Cream', 'Odomos-Mosquito-Repellent-Cream', '<p>Odomos Mosquito Repellent Cream</p>', 250.00, '100 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562386Odomos Mosquito Repellent Cream.jpg', NULL, NULL, '2020-03-07 00:18:28', '2020-08-27 10:22:51'),
(301, 1, 35, 4, 30, NULL, '0299', 'Sunsilk Shampoo Hair Fall Solution', 'Sunsilk-Shampoo-Hair-Fall-Solution', '<p>Sunsilk Shampoo Hair Fall Solution&nbsp;</p>', 305.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583561923Sunsilk Shampoo Hair Fall Solution.jpg', NULL, NULL, '2020-03-07 00:18:43', '2020-08-27 10:22:51'),
(302, 1, 35, 4, 30, NULL, '0300', 'Sunsilk Shampoo Hair Fall Solution', 'Sunsilk-Shampoo-Hair-Fall-Solution', '<p>Sunsilk Shampoo Hair Fall Solution&nbsp;</p>', 165.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562004Sunsilk Shampoo Hair Fall Solution.jpg', NULL, NULL, '2020-03-07 00:20:04', '2020-08-27 10:22:51'),
(303, 1, 35, 4, 30, NULL, '0301', 'Sunsilk Shampoo Healthy Growth', 'Sunsilk-Shampoo-Healthy-Growth', '<p>Sunsilk Shampoo Healthy Growth</p>', 300.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562056Sunsilk Shampoo Healthy Growth.jpg', NULL, NULL, '2020-03-07 00:20:56', '2020-08-27 10:22:51'),
(304, 1, 35, 4, 30, NULL, '0302', 'Sunsilk Shampoo Healthy Growth', 'Sunsilk-Shampoo-Healthy-Growth', '<p>Sunsilk Shampoo Healthy Growth</p>', 180.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562094Sunsilk Shampoo Healthy Growth.jpg', NULL, NULL, '2020-03-07 00:21:34', '2020-08-27 10:22:51'),
(305, 1, 35, 4, 30, NULL, '0303', 'Sunsilk Co Creations Soft & Smooth Shampoo', 'Sunsilk-Co-Creations-Soft-&-Smooth-Shampoo', '<p>Sunsilk Co-Creations Soft &amp; Smooth Shampoo</p>', 380.00, '320ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562191Sunsilk Co Creations Soft & Smooth Shampoo.jpg', NULL, NULL, '2020-03-07 00:23:11', '2020-08-27 10:22:51'),
(306, 1, 95, 5, 37, NULL, '0304', 'Finis Insect Powder', 'Finis-Insect-Powder', '<p>Finis Insect Powder</p>', 40.00, '80 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562199Finis Insect Powder.jpeg', NULL, NULL, '2020-03-07 00:23:19', '2020-08-27 10:22:51'),
(307, 1, 35, 4, 30, NULL, '0305', 'Sunsilk Co Creations Perfect Straight Shampoo', 'Sunsilk-Co-Creations-Perfect-Straight-Shampoo', '<p>Sunsilk Co-Creations Perfect Straight Shampoo</p>', 380.00, '320ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562367Sunsilk Co Creations Perfect Straight Shampoo.jpg', NULL, NULL, '2020-03-07 00:26:07', '2020-08-27 10:22:51'),
(308, 1, 35, 4, 30, NULL, '0306', 'Sunsilk Lively Clean & Fresh Shampoo', 'Sunsilk-Lively-Clean-&-Fresh-Shampoo', '<p>Sunsilk Lively Clean &amp; Fresh Shampoo</p>', 430.00, '320ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562452Sunsilk Lively Clean & Fresh Shampoo.jpg', NULL, NULL, '2020-03-07 00:27:32', '2020-08-27 10:22:51'),
(309, 1, 35, 4, 29, NULL, '0307', 'Tresemme Conditioner Keratin Smooth', 'Tresemme-Conditioner-Keratin-Smooth', '<p>Tresemme Conditioner Keratin Smooth</p>', 280.00, '190ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562501Tresemme Conditioner Keratin Smooth.jpg', NULL, NULL, '2020-03-07 00:28:21', '2020-08-27 10:22:51'),
(312, 1, 82, 5, 37, NULL, '0310', 'Naphthalene Ball', 'Naphthalene-Ball', '<p>Naphthalene Ball</p>', 70.00, '250 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562622Naphthalene Ball.jpeg', NULL, NULL, '2020-03-07 00:30:22', '2020-08-27 10:22:51'),
(313, 1, 35, 4, 30, NULL, '0311', 'Tresemme Hair Fall Defense Shampoo', 'Tresemme-Hair-Fall-Defense-Shampoo', '<p>Tresemme Hair Fall Defense Shampoo&nbsp;</p>', 240.00, '185ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562666Tresemme Hair Fall Defense Shampoo.jpg', NULL, NULL, '2020-03-07 00:31:06', '2020-08-27 10:22:51'),
(314, 1, 35, 4, 30, NULL, '0312', 'Tresemme Hair Fall Defense Shampoo', 'Tresemme-Hair-Fall-Defense-Shampoo', '<p>Tresemme Hair Fall Defense Shampoo&nbsp;</p>', 630.00, '580ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562705Tresemme Hair Fall Defense Shampoo.jpg', NULL, NULL, '2020-03-07 00:31:45', '2020-08-27 10:22:51'),
(315, 1, 35, 4, 30, NULL, '0313', 'Tresemme Shampoo Keratin Smooth', 'Tresemme-Shampoo-Keratin-Smooth', '<p>Tresemme Shampoo Keratin Smooth</p>', 630.00, '580ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562846Tresemme Shampoo Keratin Smooth.jpg', NULL, NULL, '2020-03-07 00:34:06', '2020-08-27 10:22:51'),
(316, 1, 35, 4, 30, NULL, '0314', 'Tresemme Shampoo Keratin Smooth', 'Tresemme-Shampoo-Keratin-Smooth', '<p>Tresemme Shampoo Keratin Smooth</p>', 240.00, '185ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583562884Tresemme Shampoo Keratin Smooth.jpg', NULL, NULL, '2020-03-07 00:34:44', '2020-08-27 10:22:51'),
(317, 1, 35, 4, 30, NULL, '0315', 'Clear Shampoo Anti Hairfall Anti Dandruff', 'Clear-Shampoo-Anti-Hairfall-Anti-Dandruff', '<p>Clear Shampoo Anti Hairfall Anti Dandruff</p>', 200.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583563176Clear Shampoo Anti Hairfall Anti Dandruff.jpg', NULL, NULL, '2020-03-07 00:39:36', '2020-08-27 10:22:51'),
(318, 1, 35, 4, 30, NULL, '0316', 'Clear Shampoo Anti Hairfall Anti Dandruff', 'Clear-Shampoo-Anti-Hairfall-Anti-Dandruff', '<p>Clear Shampoo Anti Hairfall Anti Dandruff</p>', 340.00, '375ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583563211Clear Shampoo Anti Hairfall Anti Dandruff.jpg', NULL, NULL, '2020-03-07 00:40:11', '2020-08-27 10:22:51'),
(319, 1, 35, 4, 30, NULL, '0317', 'Clear Men Anti Dandruff Shampoo', 'Clear-Men-Anti-Dandruff-Shampoo', '<p>Clear Men Anti Dandruff Shampoo</p>', 215.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583563915Clear Men Anti Dandruff Shampoo.jpg', NULL, NULL, '2020-03-07 00:51:55', '2020-08-27 10:22:51'),
(320, 1, 35, 4, 30, NULL, '0318', 'Clear Men Anti Dandruff Shampoo', 'Clear-Men-Anti-Dandruff-Shampoo', '<p>Clear Men Anti Dandruff Shampoo</p>', 340.00, '350ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583563956Clear Men Anti Dandruff Shampoo.jpg', NULL, NULL, '2020-03-07 00:52:36', '2020-08-27 10:22:51'),
(321, 1, 35, 4, 30, NULL, '0319', 'Clear Shampoo Men Cool Sport Menthol Anti  Dandruff', 'Clear-Shampoo-Men-Cool-Sport-Menthol-Anti-Dandruff', '<p>Clear Shampoo Men Cool Sport Menthol Anti &nbsp;Dandruff</p>', 215.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564040Clear Shampoo Men Cool Sport Menthol Anti  Dandruff.jpg', NULL, NULL, '2020-03-07 00:54:00', '2020-08-27 10:22:51'),
(322, 1, 35, 4, 30, NULL, '0320', 'Clear Shampoo Men Cool Sport Menthol Anti  Dandruff', 'Clear-Shampoo-Men-Cool-Sport-Menthol-Anti-Dandruff', '<p>Clear Shampoo Men Cool Sport Menthol Anti &nbsp;Dandruff</p>', 340.00, '350ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564278Clear Shampoo Men Cool Sport Menthol Anti  Dandruff.jpg', NULL, NULL, '2020-03-07 00:57:58', '2020-08-27 10:22:51'),
(323, 1, 35, 4, 30, NULL, '0321', 'Clear Complete Active Care Shampoo', 'Clear-Complete-Active-Care-Shampoo', '<p>Clear Complete Active Care Shampoo</p>', 200.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564393Clear Complete Active Care Shampoo.jpg', NULL, NULL, '2020-03-07 00:59:53', '2020-08-27 10:22:51'),
(324, 1, 35, 4, 30, NULL, '0322', 'Clear Complete Active Care Shampoo', 'Clear-Complete-Active-Care-Shampoo', '<p>Clear Complete Active Care Shampoo</p>', 330.00, '350ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564434Clear Complete Active Care Shampoo.jpg', NULL, NULL, '2020-03-07 01:00:34', '2020-08-27 10:22:51'),
(325, 1, 35, 4, 30, NULL, '0323', 'Clear Anti Hairfall Shampoo', 'Clear-Anti-Hairfall-Shampoo', '<p>Clear Anti Hairfall Shampoo</p>', 340.00, '350ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564488Clear Anti Hairfall Shampoo.jpg', NULL, NULL, '2020-03-07 01:01:28', '2020-08-27 10:22:51'),
(326, 1, 106, 4, 29, NULL, '0324', 'Head & Shoulders Anti-Hairfall Shampoo', 'Head-&-Shoulders-Anti-Hairfall-Shampoo', '<p>Head &amp; Shoulders Anti-Hairfall Shampoo</p>', 360.00, '330ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564763Head & Shoulders Anti-Hairfall Shampoo.jpg', NULL, NULL, '2020-03-07 01:06:03', '2020-08-27 10:22:51'),
(327, 1, 106, 4, 30, NULL, '0325', 'Head & Shoulders Anti-Hairfall Shampoo', 'Head-&-Shoulders-Anti-Hairfall-Shampoo', '<p>Head &amp; Shoulders Anti-Hairfall Shampoo</p>', 856.00, '650ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564810Head & Shoulders Anti-Hairfall Shampoo.jpg', NULL, NULL, '2020-03-07 01:06:50', '2020-08-27 10:22:51'),
(328, 1, 106, 4, 29, NULL, '0326', 'Head & Shoulders Smooth & Silky Shampoo', 'Head-&-Shoulders-Smooth-&-Silky-Shampoo', '<p>Head &amp; Shoulders Smooth &amp; Silky Shampoo</p>', 360.00, '350ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564938Head & Shoulders Smooth & Silky Shampoo.jpg', NULL, NULL, '2020-03-07 01:08:58', '2020-08-27 10:22:51'),
(329, 1, 106, 4, 30, NULL, '0327', 'Head & Shoulders Smooth & Silky Shampoo', 'Head-&-Shoulders-Smooth-&-Silky-Shampoo', '<p>Head &amp; Shoulders Smooth &amp; Silky Shampoo</p>', 215.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583564994Head & Shoulders Smooth & Silky Shampoo.jpg', NULL, NULL, '2020-03-07 01:09:54', '2020-08-27 10:22:51'),
(330, 1, 106, 4, 30, NULL, '0328', 'Head & Shoulders Clean & Balanced Shampoo', 'Head-&-Shoulders-Clean-&-Balanced-Shampoo', '<p>Head &amp; Shoulders Clean &amp; Balanced Shampoo</p>', 360.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583565208Head & Shoulders Clean & Balanced Shampoo.jpg', NULL, NULL, '2020-03-07 01:13:28', '2020-08-27 10:22:51'),
(331, 1, 106, 4, 30, NULL, '0329', 'Head & Shoulders Clean & Balanced Shampoo', 'Head-&-Shoulders-Clean-&-Balanced-Shampoo', '<p>Head &amp; Shoulders Clean &amp; Balanced Shampoo</p>', 215.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583565244Head & Shoulders Clean & Balanced Shampoo.jpg', NULL, NULL, '2020-03-07 01:14:04', '2020-08-27 10:22:51'),
(332, 1, 106, 4, 30, NULL, '0330', 'Head & Shoulders Cool Menthol Shampoo', 'Head-&-Shoulders-Cool-Menthol-Shampoo', '<p>Head &amp; Shoulders Cool Menthol Shampoo&nbsp;</p>', 215.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583565316Head & Shoulders Cool Menthol Shampoo.jpg', NULL, NULL, '2020-03-07 01:15:16', '2020-08-27 10:22:51'),
(333, 1, 106, 4, 30, NULL, '0331', 'Head & Shoulders Cool Menthol Shampoo', 'Head-&-Shoulders-Cool-Menthol-Shampoo', '<p>Head &amp; Shoulders Cool Menthol Shampoo&nbsp;</p>', 399.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583565363Head & Shoulders Cool Menthol Shampoo.jpg', NULL, NULL, '2020-03-07 01:16:03', '2020-08-27 10:22:51'),
(334, 1, 106, 4, 30, NULL, '0332', 'Head & Shoulders Cool Menthol Shampoo', 'Head-&-Shoulders-Cool-Menthol-Shampoo', '<p>Head &amp; Shoulders Cool Menthol Shampoo&nbsp;</p>', 856.00, '650ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583565422Head & Shoulders Cool Menthol Shampoo.jpg', NULL, NULL, '2020-03-07 01:17:02', '2020-08-27 10:22:51'),
(335, 1, 106, 4, 30, NULL, '0333', 'Head & Shoulders Lemon Fresh Shampoo', 'Head-&-Shoulders-Lemon-Fresh-Shampoo', '<p>Head &amp; Shoulders Lemon Fresh Shampoo</p>', 399.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583569445Head & Shoulders Lemon Fresh Shampoo.jpg', NULL, NULL, '2020-03-07 02:24:05', '2020-08-27 10:22:51'),
(336, 1, 106, 4, 30, NULL, '0334', 'Head & Shoulders Anti Dandruff Shampoo Sliky Black', 'Head-&-Shoulders-Anti-Dandruff-Shampoo-Sliky-Black', '<p>Head &amp; Shoulders Anti Dandruff Shampoo Silky Black</p>', 399.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583569522Head & Shoulders Anti Dandruff Shampoo Sliky Black.jpg', NULL, NULL, '2020-03-07 02:25:22', '2020-08-27 10:22:51'),
(337, 1, 106, 4, 30, NULL, '0335', 'Head & Shoulders Smooth & Silky Shampoo', 'Head-&-Shoulders-Smooth-&-Silky-Shampoo', '<p>Head &amp; Shoulders Smooth &amp; Silky Shampoo</p>', 856.00, '650ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583569579Head & Shoulders Smooth & Silky Shampoo.jpg', NULL, NULL, '2020-03-07 02:26:19', '2020-08-27 10:22:51');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(338, 1, 106, 4, 30, NULL, '0336', 'head & Shoulders Smooth & Silky 2in1 Shampoo+Co', 'head-&-Shoulders-Smooth-&-Silky-2in1-Shampoo+Co', '<p>head &amp; Shoulders Smooth &amp; Silky 2in1 Shampoo+Co</p>', 1010.00, '650ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583569636head & Shoulders Smooth & Silky 2in1 Shampoo+Co.jpg', NULL, NULL, '2020-03-07 02:27:16', '2020-08-27 10:22:51'),
(339, 1, 106, 4, 30, NULL, '0337', 'Head & Shoulder 2 In 1 Active Protect Shampoo', 'Head-&-Shoulder-2-In-1-Active-Protect-Shampoo', '<p>Head &amp; Shoulder 2 In 1 Active Protect Shampoo</p>', 280.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572290Head & Shoulder 2 In 1 Active Protect Shampoo.jpg', NULL, NULL, '2020-03-07 03:11:30', '2020-08-27 10:22:51'),
(340, 1, 106, 4, 30, NULL, '0338', 'Head & Shoulder 2 In 1 Active Protect Shampoo', 'Head-&-Shoulder-2-In-1-Active-Protect-Shampoo', '<p>Head &amp; Shoulder 2 In 1 Active Protect Shampoo</p>', 480.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572336Head & Shoulder 2 In 1 Active Protect Shampoo.jpg', NULL, NULL, '2020-03-07 03:12:16', '2020-08-27 10:22:51'),
(341, 1, 106, 4, 30, NULL, '0339', 'Head & Shoulder Silky Black Shampoo', 'Head-&-Shoulder-Silky-Black-Shampoo', '<p>Head &amp; Shoulder Silky Black Shampoo</p>', 240.00, '180ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572385Head & Shoulder Silky Black Shampoo.jpg', NULL, NULL, '2020-03-07 03:13:05', '2020-08-27 10:22:51'),
(342, 1, 122, 4, 30, NULL, '0340', 'Dove Beauty Bar White', 'Dove-Beauty-Bar-White', '<p>Dove Beauty Bar White</p>', 75.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572646Dove Beauty Bar White.jpg', NULL, NULL, '2020-03-07 03:17:26', '2020-08-27 10:22:51'),
(343, 1, 122, 4, 30, NULL, '0341', 'Dove Beauty Bar White', 'Dove-Beauty-Bar-White', '<p>Dove Beauty Bar White</p>', 90.00, '135gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572686Dove Beauty Bar White.jpg', NULL, NULL, '2020-03-07 03:18:06', '2020-08-27 10:22:51'),
(344, 1, 122, 4, 30, NULL, '0342', 'Dove Beauty Bar Pink', 'Dove-Beauty-Bar-Pink', '<p>Dove Beauty Bar Pink</p>', 75.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572729Dove Beauty Bar Pink.jpg', NULL, NULL, '2020-03-07 03:18:49', '2020-08-27 10:22:51'),
(345, 1, 122, 4, 30, NULL, '0343', 'Dove Beauty Bar Pink', 'Dove-Beauty-Bar-Pink', '<p>Dove Beauty Bar Pink</p>', 90.00, '135gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572766Dove Beauty Bar Pink.jpg', NULL, NULL, '2020-03-07 03:19:26', '2020-08-27 10:22:51'),
(346, 1, 122, 4, 30, NULL, '0344', 'Dove Shampoo Hairfall Rescue', 'Dove-Shampoo-Hairfall-Rescue', '<p>Dove Shampoo Hairfall Rescue</p>', 200.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572837Dove Shampoo Hairfall Rescue.jpg', NULL, NULL, '2020-03-07 03:20:37', '2020-08-27 10:22:51'),
(347, 1, 122, 4, 30, NULL, '0345', 'Dove Shampoo Hairfall Rescue', 'Dove-Shampoo-Hairfall-Rescue', '<p>Dove Shampoo Hairfall Rescue</p>', 600.00, '650ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572877Dove Shampoo Hairfall Rescue.jpg', NULL, NULL, '2020-03-07 03:21:17', '2020-08-27 10:22:51'),
(348, 1, 122, 4, 30, NULL, '0346', 'Dove Shampoo Hairfall Rescue', 'Dove-Shampoo-Hairfall-Rescue', '<p>Dove Shampoo Hairfall Rescue</p>', 350.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583572925Dove Shampoo Hairfall Rescue.jpg', NULL, NULL, '2020-03-07 03:22:05', '2020-08-27 10:22:51'),
(349, 1, 122, 4, 30, NULL, '0347', 'Dove Shampoo Oxygen Moisture', 'Dove-Shampoo-Oxygen-Moisture', '<p>Dove Shampoo Oxygen Moisture</p>', 350.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731101Dove Shampoo Oxygen Moisture.jpg', NULL, NULL, '2020-03-08 23:18:21', '2020-08-27 10:22:51'),
(350, 1, 122, 4, 30, NULL, '0348', 'Dove Shampoo Environmental Defense', 'Dove-Shampoo-Environmental-Defense', '<p>Dove Shampoo Environmental Defense</p>', 200.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731153Dove Shampoo Environmental Defense.jpg', NULL, NULL, '2020-03-08 23:19:13', '2020-08-27 10:22:51'),
(351, 1, 122, 4, 30, NULL, '0349', 'Dove Micellar Water', 'Dove-Micellar-Water', '<p>Dove Micellar Water&nbsp;</p>', 250.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731203Dove Micellar Water.jpg', NULL, NULL, '2020-03-08 23:20:03', '2020-08-27 10:22:51'),
(352, 1, 122, 4, 30, NULL, '0350', 'Dove Conditioner Hairfall Rescue', 'Dove-Conditioner-Hairfall-Rescue', '<p>Dove Conditioner Hairfall Rescue&nbsp;</p>', 270.00, '190ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731266Dove Conditioner Hairfall Rescue.jpg', NULL, NULL, '2020-03-08 23:21:06', '2020-08-27 10:22:51'),
(353, 1, 122, 4, 30, NULL, '0351', 'Dove Conditioner Intense Repair', 'Dove-Conditioner-Intense-Repair', '<p>Dove Conditioner Intense Repair&nbsp;</p>', 270.00, '190ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731310Dove Conditioner Intense Repair.jpg', NULL, NULL, '2020-03-08 23:21:50', '2020-08-27 10:22:51'),
(354, 1, 122, 4, 30, NULL, '0352', 'Dove Shampoo Intense Repair', 'Dove-Shampoo-Intense-Repair', '<p>Dove Shampoo Intense Repair&nbsp;</p>', 350.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731368Dove Shampoo Intense Repair.jpg', NULL, NULL, '2020-03-08 23:22:48', '2020-08-27 10:22:51'),
(355, 1, 122, 4, 30, NULL, '0353', 'Dove Shampoo Intense Repair', 'Dove-Shampoo-Intense-Repair', '<p>Dove Shampoo Intense Repair&nbsp;</p>', 650.00, '650ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731483Dove Shampoo Intense Repair.jpg', NULL, NULL, '2020-03-08 23:24:43', '2020-08-27 10:22:51'),
(356, 1, 122, 4, 30, NULL, '0354', 'Dove Shampoo Nourishing Oil Care', 'Dove-Shampoo-Nourishing-Oil-Care', '<p>Dove Shampoo Nourishing Oil Care</p>', 200.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731531Dove Shampoo Nourishing Oil Care.jpg', NULL, NULL, '2020-03-08 23:25:31', '2020-08-27 10:22:51'),
(357, 1, 122, 4, 30, NULL, '0355', 'Dove Shampoo Nourishing Oil Care', 'Dove-Shampoo-Nourishing-Oil-Care', '<p>Dove Shampoo Nourishing Oil Care</p>', 350.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731572Dove Shampoo Nourishing Oil Care.jpg', NULL, NULL, '2020-03-08 23:26:12', '2020-08-27 10:22:51'),
(358, 1, 122, 4, 30, NULL, '0356', 'Dove Face Wash Beauty Moisture Facial Cleanser', 'Dove-Face-Wash-Beauty-Moisture-Facial-Cleanser', '<p>Dove Face Wash Beauty Moisture Facial Cleanser</p>', 250.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731620Dove Face Wash Beauty Moisture Facial Cleanser.jpg', NULL, NULL, '2020-03-08 23:27:00', '2020-08-27 10:22:51'),
(359, 1, 122, 4, 30, NULL, '0357', 'Dove Face Wash Beauty Moisture', 'Dove-Face-Wash-Beauty-Moisture', '<p>Dove Face Wash Beauty Moisture</p>', 150.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731665Dove Face Wash Beauty Moisture.jpg', NULL, NULL, '2020-03-08 23:27:45', '2020-08-27 10:22:51'),
(360, 1, 122, 4, 30, NULL, '0358', 'Dove Shampoo Healthy Growth', 'Dove-Shampoo-Healthy-Growth', '<p>Dove Shampoo Healthy Growth</p>', 200.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731740Dove Shampoo Healthy Growth.jpg', NULL, NULL, '2020-03-08 23:29:00', '2020-08-27 10:22:51'),
(361, 1, 122, 4, 30, NULL, '0359', 'Dove Shampoo Healthy Growth', 'Dove-Shampoo-Healthy-Growth', '<p>Dove Shampoo Healthy Growth</p>', 350.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731801Dove Shampoo Healthy Growth.jpg', NULL, NULL, '2020-03-08 23:30:01', '2020-08-27 10:22:51'),
(362, 1, 122, 4, 30, NULL, '0360', 'Dove Baby Rich Moisture Lotion', 'Dove-Baby-Rich-Moisture-Lotion', '<p>Dove Baby Rich Moisture Lotion</p>', 350.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731848Dove Baby Rich Moisture Lotion.jpg', NULL, NULL, '2020-03-08 23:30:48', '2020-08-27 10:22:51'),
(363, 1, 122, 4, 30, NULL, '0361', 'Dove Beauty Cream', 'Dove-Beauty-Cream', '<p>Dove Beauty Cream</p>', 195.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731915Dove Beauty Cream.jpg', NULL, NULL, '2020-03-08 23:31:55', '2020-08-27 10:22:51'),
(364, 1, 122, 4, 30, NULL, '0362', 'Dove Baby Sensitive Moisture Lotion', 'Dove-Baby-Sensitive-Moisture-Lotion', '<p>Dove Baby Sensitive Moisture Lotion</p>', 350.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583731961Dove Baby Sensitive Moisture Lotion.jpg', NULL, NULL, '2020-03-08 23:32:41', '2020-08-27 10:22:51'),
(365, 1, 122, 4, 30, NULL, '0363', 'Dove Go Fresh Roll On', 'Dove-Go-Fresh-Roll-On', '<p>Dove Go Fresh Roll-On</p>', 220.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583732020Dove Go Fresh Roll On.jpg', NULL, NULL, '2020-03-08 23:33:40', '2020-08-27 10:22:51'),
(366, 1, 122, 4, 30, NULL, '0364', 'Dove Men Shampoo Thick & Strong', 'Dove-Men-Shampoo-Thick-&-Strong', '<p>Dove Men Shampoo Thick &amp; Strong</p>', 520.00, '355ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583732083Dove Men Shampoo Thick & Strong.jpg', NULL, NULL, '2020-03-08 23:34:43', '2020-08-27 10:22:51'),
(367, 1, 122, 4, 30, NULL, '0365', 'Dove Intensive Body Lotion', 'Dove-Intensive-Body-Lotion', '<p>Dove Intensive Body Lotion</p>', 480.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583732161Dove Intensive Body Lotion.jpg', NULL, NULL, '2020-03-08 23:36:00', '2020-08-27 10:22:51'),
(368, 1, 122, 4, 30, NULL, '0366', 'Dove Caring Cucumber & Green Tea Scent Hand wash', 'Dove-Caring-Cucumber-&-Green-Tea-Scent-Hand-wash', '<p>Dove Caring Cucumber &amp; Green Tea Scent Handwash</p>', 350.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583732209Dove Caring Cucumber & Green Tea Scent Hand wash.jpg', NULL, NULL, '2020-03-08 23:36:49', '2020-08-27 10:22:51'),
(369, 1, 122, 4, 30, NULL, '0367', 'Dove Caring Cucumber & Green Tea Scent Hand wash', 'Dove-Caring-Cucumber-&-Green-Tea-Scent-Hand-wash', '<p>Dove Caring Cucumber &amp; Green Tea Scent Handwash</p>', 350.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583732341Dove Caring Cucumber & Green Tea Scent Hand wash.jpg', NULL, NULL, '2020-03-08 23:39:01', '2020-08-27 10:22:51'),
(370, 1, 122, 4, 30, NULL, '0368', 'Dove Caring Fine Silk Hand wash', 'Dove-Caring-Fine-Silk-Hand-wash', '<p>Dove Caring Fine Silk Hand wash</p>', 350.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583732511Dove Caring Fine Silk Hand wash.jpg', NULL, NULL, '2020-03-08 23:41:51', '2020-08-27 10:22:51'),
(371, 1, 122, 4, 30, NULL, '0369', 'Dove Intensive Cream', 'Dove-Intensive-Cream', '<p>Dove Intensive Cream</p>', 275.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583733214Dove Intensive Cream.jpg', NULL, NULL, '2020-03-08 23:53:34', '2020-08-27 10:22:51'),
(372, 1, 123, 4, 30, NULL, '0370', 'Kumarika Long & Black Shampoo', 'Kumarika-Long-&-Black-Shampoo', '<p>Kumarika Long &amp; Black Shampoo</p>', 180.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583733346Kumarika Long & Black Shampoo.jpg', NULL, NULL, '2020-03-08 23:55:46', '2020-08-27 10:22:51'),
(373, 1, 123, 4, 30, NULL, '0371', 'Kumarika Soft & Shine Shampoo', 'Kumarika-Soft-&-Shine-Shampoo', '<p>Kumarika Soft &amp; Shine Shampoo</p>', 180.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583733394Kumarika Soft & Shine Shampoo.jpg', NULL, NULL, '2020-03-08 23:56:34', '2020-08-27 10:22:51'),
(374, 1, 123, 4, 30, NULL, '0372', 'Kumarika Thick & Strong Shampoo', 'Kumarika-Thick-&-Strong-Shampoo', '<p>Kumarika Thick &amp; Strong Shampoo</p>', 180.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583733434Kumarika Thick & Strong Shampoo.jpg', NULL, NULL, '2020-03-08 23:57:14', '2020-08-27 10:22:51'),
(375, 1, 124, 4, 30, NULL, '0373', 'Pantene Lively Clean Shampoo', 'Pantene-Lively-Clean-Shampoo', '<p>Pantene Lively Clean Shampoo</p>', 370.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583733568Pantene Lively Clean Shampoo.jpg', NULL, NULL, '2020-03-08 23:59:28', '2020-08-27 10:22:51'),
(376, 1, 124, 4, 30, NULL, '0374', 'Pantene Long Black Shampoo', 'Pantene-Long-Black-Shampoo', '<p>Pantene Long Black Shampoo</p>', 370.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583734190Pantene Long Black Shampoo.jpg', NULL, NULL, '2020-03-09 00:09:50', '2020-08-27 10:22:51'),
(377, 1, 124, 4, 30, NULL, '0375', 'Pantene Silky Smooth Care Shampoo', 'Pantene-Silky-Smooth-Care-Shampoo', '<p>Pantene Silky Smooth Care Shampoo</p>', 370.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583734248Pantene Silky Smooth Care Shampoo.jpg', NULL, NULL, '2020-03-09 00:10:48', '2020-08-27 10:22:51'),
(378, 1, 125, 4, 30, NULL, '0376', 'Clinic Plus Strong & Long Shampoo', 'Clinic-Plus-Strong-&-Long-Shampoo', '<p>Clinic Plus Strong &amp; Long Shampoo</p>', 260.00, '340ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583734503Clinic Plus Strong & Long Shampoo.jpg', NULL, NULL, '2020-03-09 00:15:03', '2020-08-27 10:22:51'),
(379, 1, 125, 4, 30, NULL, '0377', 'Clinique Shampoo Strong and Long', 'Clinique-Shampoo-Strong-and-Long', '<p>Clinique Shampoo Strong and Long</p>', 150.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583734544Clinique Shampoo Strong and Long.jpg', NULL, NULL, '2020-03-09 00:15:44', '2020-08-27 10:22:51'),
(380, 1, 126, 4, 30, NULL, '0378', 'Himalaya Anti Dandruff Shampoo', 'Himalaya-Anti-Dandruff-Shampoo', '<p>Himalaya Anti Dandruff Shampoo</p>', 500.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583734824Himalaya Anti Dandruff Shampoo.jpg', NULL, NULL, '2020-03-09 00:20:24', '2020-08-27 10:22:51'),
(381, 1, 127, 4, 30, NULL, '0379', 'Xpel Hair Care Banana Conditioner', 'Xpel-Hair-Care-Banana-Conditioner', '<p>Xpel Hair Care Banana Conditioner</p>', 500.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583735100Xpel Hair Care Banana Conditioner.jpg', NULL, NULL, '2020-03-09 00:25:00', '2020-08-27 10:22:51'),
(382, 1, 113, 4, 30, NULL, '0380', 'Lever Ayush Shampoo Thick & Long Growth Shikakai', 'Lever-Ayush-Shampoo-Thick-&-Long-Growth-Shikakai', '<p>Lever Ayush Shampoo Thick &amp; Long Growth Shikakai</p>', 195.00, '175ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583735489Lever Ayush Shampoo Thick & Long Growth Shikakai.jpg', NULL, NULL, '2020-03-09 00:31:29', '2020-08-27 10:22:51'),
(383, 1, 117, 4, 30, NULL, '0381', 'L\'oreal Elvive Total Repair 5 Shampoo', 'L\'oreal-Elvive-Total-Repair-5-Shampoo', '<p>L&#39;oreal Elvive Total Repair 5 Shampoo&nbsp;</p>', 570.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583735840L\'oreal Elvive Total Repair 5 Shampoo.jpg', NULL, NULL, '2020-03-09 00:37:20', '2020-08-27 10:22:51'),
(384, 1, 117, 4, 30, NULL, '0382', 'L\'oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner)', 'L\'oreal-Men-Anti-Dandruff-2-in-1-(Shampoo-+-Conditioner)', '<p>L&#39;oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner)</p>', 640.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583735886L\'oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner).jpg', NULL, NULL, '2020-03-09 00:38:06', '2020-08-27 10:22:51'),
(385, 1, 35, 4, 30, NULL, '0383', 'Lux Soap Bar Soft Touch', 'Lux-Soap-Bar-Soft-Touch', '<p>Lux Soap Bar Soft Touch</p>', 50.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746667Lux Soap Bar Soft Touch.jpg', NULL, NULL, '2020-03-09 03:37:47', '2020-08-27 10:22:51'),
(386, 1, 35, 4, 30, NULL, '0384', 'Lux Soap Bar Soft Touch', 'Lux-Soap-Bar-Soft-Touch', '<p>Lux Soap Bar Soft Touch</p>', 25.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746708Lux Soap Bar Soft Touch.jpg', NULL, NULL, '2020-03-09 03:38:28', '2020-08-27 10:22:51'),
(387, 1, 35, 4, 30, NULL, '0385', 'Lux Soap Bar Velvet Touch', 'Lux-Soap-Bar-Velvet-Touch', '<p>Lux Soap Bar Velvet Touch</p>', 34.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746753Lux Soap Bar Velvet Touch.jpg', NULL, NULL, '2020-03-09 03:39:13', '2020-08-27 10:22:51'),
(388, 1, 35, 4, 30, NULL, '0386', 'Lux Soap Bar Velvet Touch', 'Lux-Soap-Bar-Velvet-Touch', '<p>Lux Soap Bar Velvet Touch</p>', 25.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746804Lux Soap Bar Velvet Touch.jpg', NULL, NULL, '2020-03-09 03:40:04', '2020-08-27 10:22:51'),
(389, 1, 35, 4, 30, NULL, '0387', 'Lux Soap Bar Velvet Touch', 'Lux-Soap-Bar-Velvet-Touch', '<p>Lux Soap Bar Velvet Touch</p>', 48.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746841Lux Soap Bar Velvet Touch.jpg', NULL, NULL, '2020-03-09 03:40:41', '2020-08-27 10:22:51'),
(390, 1, 35, 4, 30, NULL, '0388', 'Lux Soap Bar Fresh Splash', 'Lux-Soap-Bar-Fresh-Splash', '<p>Lux Soap Bar Fresh Splash</p>', 34.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746886Lux Soap Bar Fresh Splash.jpg', NULL, NULL, '2020-03-09 03:41:26', '2020-08-27 10:22:51'),
(391, 1, 35, 4, 30, NULL, '0389', 'Lux Soap Bar Hypnotic Rose', 'Lux-Soap-Bar-Hypnotic-Rose', '<p>Lux Soap Bar Hypnotic Rose</p>', 45.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746930Lux Soap Bar Hypnotic Rose.jpg', NULL, NULL, '2020-03-09 03:42:10', '2020-08-27 10:22:51'),
(392, 1, 35, 4, 30, NULL, '0390', 'Lux Body Wash White Impress', 'Lux-Body-Wash-White-Impress', '<p>Lux Body Wash White Impress</p>', 200.00, '220ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583746974Lux Body Wash White Impress.jpg', NULL, NULL, '2020-03-09 03:42:54', '2020-08-27 10:22:51'),
(393, 1, 35, 4, 30, NULL, '0391', 'Lux Soap Bar Sensuous Sandal', 'Lux-Soap-Bar-Sensuous-Sandal', '<p>Lux Soap Bar Sensuous Sandal</p>', 45.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747017Lux Soap Bar Sensuous Sandal.jpg', NULL, NULL, '2020-03-09 03:43:37', '2020-08-27 10:22:51'),
(394, 1, 122, 4, 30, NULL, '0392', 'Dove Micellar Water', 'Dove-Micellar-Water', '<p>Dove Micellar Water</p>', 250.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747073Dove Micellar Water.jpg', NULL, NULL, '2020-03-09 03:44:32', '2020-08-27 10:22:51'),
(395, 1, 97, 4, 30, NULL, '0393', 'Lifebuoy Soap Silver Shield Formula 100 gm', 'Lifebuoy-Soap-Silver-Shield-Formula-100-gm', '<p>Lifebuoy Soap Silver Shield Formula 100 gm</p>', 85.00, '100gm(3 pices)', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747275Lifebuoy Soap Silver Shield Formula 100 gm.jpg', NULL, NULL, '2020-03-09 03:47:55', '2020-08-27 10:22:51'),
(396, 1, 97, 4, 30, NULL, '0394', 'Lifebuoy Soap Bar Total', 'Lifebuoy-Soap-Bar-Total', '<p>Lifebuoy Soap Bar Total</p>', 42.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747323Lifebuoy Soap Bar Total.jpg', NULL, NULL, '2020-03-09 03:48:43', '2020-08-27 10:22:51'),
(397, 1, 97, 4, 30, NULL, '0395', 'Lifebuoy Soap Bar Care', 'Lifebuoy-Soap-Bar-Care', '<p>Lifebuoy Soap Bar Care</p>', 42.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747364Lifebuoy Soap Bar Care.jpg', NULL, NULL, '2020-03-09 03:49:24', '2020-08-27 10:22:51'),
(398, 1, 97, 4, 30, NULL, '0396', 'Lifebuoy Soap Bar Care', 'Lifebuoy-Soap-Bar-Care', '<p>Lifebuoy Soap Bar Care</p>', 30.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747397Lifebuoy Soap Bar Care.jpg', NULL, NULL, '2020-03-09 03:49:57', '2020-08-27 10:22:51'),
(399, 1, 97, 4, 30, NULL, '0397', 'Lifebuoy Soap Bar Neem', 'Lifebuoy-Soap-Bar-Neem', '<p>Lifebuoy Soap Bar Neem</p>', 35.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747454Lifebuoy Soap Bar Neem.jpg', NULL, NULL, '2020-03-09 03:50:54', '2020-08-27 10:22:51'),
(400, 1, 97, 4, 30, NULL, '0398', 'Lifebuoy Bar Soap Attar Protect', 'Lifebuoy-Bar-Soap-Attar-Protect', '<p>Lifebuoy Bar Soap Attar Protect</p>', 34.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747591Lifebuoy Bar Soap Attar Protect.jpg', NULL, NULL, '2020-03-09 03:53:11', '2020-08-27 10:22:51'),
(401, 1, 96, 4, 30, NULL, '0399', 'Dettol Soap Cool Bathing Bar', 'Dettol-Soap-Cool-Bathing-Bar', '<p>Dettol Soap Cool Bathing Bar</p>', 38.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747765Dettol Soap Cool Bathing Bar.jpg', NULL, NULL, '2020-03-09 03:56:05', '2020-08-27 10:22:51'),
(402, 1, 96, 4, 30, NULL, '0400', 'Dettol Soap Original Bathing Bar Soap', 'Dettol-Soap-Original-Bathing-Bar-Soap', '<p>Dettol Soap Original Bathing Bar Soap</p>', 58.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747802Dettol Soap Original Bathing Bar Soap.jpg', NULL, NULL, '2020-03-09 03:56:42', '2020-08-27 10:22:51'),
(403, 1, 96, 4, 30, NULL, '0401', 'Dettol Soap Original Bathing Bar Soap', 'Dettol-Soap-Original-Bathing-Bar-Soap', '<p>Dettol Soap Original Bathing Bar Soap</p>', 40.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747865Dettol Soap Original Bathing Bar Soap.jpg', NULL, NULL, '2020-03-09 03:57:45', '2020-08-27 10:22:51'),
(404, 1, 96, 4, 30, NULL, '0402', 'Dettol Bathing Bar Soap Skincare', 'Dettol-Bathing-Bar-Soap-Skincare', '<p>Dettol Bathing Bar Soap Skincare</p>', 40.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583747908Dettol Bathing Bar Soap Skincare.jpg', NULL, NULL, '2020-03-09 03:58:28', '2020-08-27 10:22:51'),
(405, 1, 128, 4, 30, NULL, '0403', 'Nivea Sea Minerals Fresh Shower Gel', 'Nivea-Sea-Minerals-Fresh-Shower-Gel', '<p>Nivea Sea Minerals Fresh Shower Gel</p>', 700.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748373Nivea Sea Minerals Fresh Shower Gel.jpg', NULL, NULL, '2020-03-09 04:06:13', '2020-08-27 10:22:51'),
(406, 1, 128, 4, 30, NULL, '0404', 'Nivea Care & Roses Body Wash', 'Nivea-Care-&-Roses-Body-Wash', '<p>Nivea Care &amp; Roses Body Wash</p>', 650.00, '750ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748424Nivea Care & Roses Body Wash.jpg', NULL, NULL, '2020-03-09 04:07:04', '2020-08-27 10:22:51'),
(407, 1, 128, 4, 30, NULL, '0405', 'Nivea Care & Coconut Body Wash', 'Nivea-Care-&-Coconut-Body-Wash', '<p>Nivea Care &amp; Coconut Body Wash</p>', 650.00, '750ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748472Nivea Care & Coconut Body Wash.jpg', NULL, NULL, '2020-03-09 04:07:52', '2020-08-27 10:22:51'),
(408, 1, 128, 4, 30, NULL, '0406', 'Nivea Men Cool Kick Shower Gel', 'Nivea-Men-Cool-Kick-Shower-Gel', '<p>Nivea Men Cool Kick Shower Gel</p>', 350.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748513Nivea Men Cool Kick Shower Gel.jpg', NULL, NULL, '2020-03-09 04:08:33', '2020-08-27 10:22:51'),
(409, 1, 129, 4, 30, NULL, '0407', 'Fresh Start Shower Gel Mint & Cucumber', 'Fresh-Start-Shower-Gel-Mint-&-Cucumber', '<p>Fresh Start Shower Gel Mint &amp; Cucumber</p>', 400.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748689Fresh Start Shower Gel Mint & Cucumber.jpg', NULL, NULL, '2020-03-09 04:11:29', '2020-08-27 10:22:51'),
(410, 1, 129, 4, 30, NULL, '0408', 'Fresh Start Shower Gel Cococut & Lime', 'Fresh-Start-Shower-Gel-Cococut-&-Lime', '<p>Fresh Start Shower Gel Coconut &amp; Lime</p>', 400.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748728Fresh Start Shower Gel Cococut & Lime.jpg', NULL, NULL, '2020-03-09 04:12:08', '2020-08-27 10:22:51'),
(411, 1, 129, 4, 30, NULL, '0409', 'Xpel Fresh Start Shower Gel Tea Tree & Lemon', 'Xpel-Fresh-Start-Shower-Gel-Tea-Tree-&-Lemon', '<p>Xpel Fresh Start Shower Gel Tea Tree &amp; Lemon</p>', 400.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748758Xpel Fresh Start Shower Gel Tea Tree & Lemon.jpg', NULL, NULL, '2020-03-09 04:12:38', '2020-08-27 10:22:51'),
(412, 1, 130, 4, 30, NULL, '0410', 'Meril Milk & Bely Soap', 'Meril-Milk-&-Bely-Soap', '<p>Meril&nbsp;Milk &amp; Bely Soap</p>', 34.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583748809Meril Milk & Bely Soap.jpg', NULL, NULL, '2020-03-09 04:13:29', '2020-08-27 10:22:51'),
(413, 1, 130, 4, 30, NULL, '0411', 'Meril Milk Soap Bar', 'Meril-Milk-Soap-Bar', '<p>Meril Milk Soap Bar</p>', 34.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583749521Meril Milk Soap Bar.jpg', NULL, NULL, '2020-03-09 04:25:21', '2020-08-27 10:22:51'),
(414, 1, 130, 4, 30, NULL, '0412', 'Meril Milk & Pomegranate Soap', 'Meril-Milk-&-Pomegranate-Soap', '<p>Meril Milk &amp; Pomegranate Soap</p>', 34.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583749554Meril Milk & Pomegranate Soap.jpg', NULL, NULL, '2020-03-09 04:25:54', '2020-08-27 10:22:51'),
(415, 1, 130, 4, 30, NULL, '0413', 'Meril Baby Mild Honey Soap', 'Meril-Baby-Mild-Honey-Soap', '<p>Meril Baby Mild Honey Soap</p>', 45.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583749606Meril Baby Mild Honey Soap.jpg', NULL, NULL, '2020-03-09 04:26:46', '2020-08-27 10:22:51'),
(416, 1, 78, 4, 30, NULL, '0414', 'ACI Savlon Fresh Soap', 'ACI-Savlon-Fresh-Soap', '<p>ACI Savlon Fresh Soap</p>', 45.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750173ACI Savlon Fresh Soap.jpg', NULL, NULL, '2020-03-09 04:36:13', '2020-08-27 10:22:52'),
(417, 1, 78, 4, 30, NULL, '0415', 'ACI Savlon Active Antiseptic Soap', 'ACI-Savlon-Active-Antiseptic-Soap', '<p>ACI Savlon Active Antiseptic Soap</p>', 45.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750210ACI Savlon Active Antiseptic Soap.jpg', NULL, NULL, '2020-03-09 04:36:50', '2020-08-27 10:22:52'),
(418, 1, 78, 4, 30, NULL, '0416', 'ACI Savlon Mild Antiseptic Soap', 'ACI-Savlon-Mild-Antiseptic-Soap', '<p>ACI Savlon Mild Antiseptic Soap</p>', 45.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750242ACI Savlon Mild Antiseptic Soap.jpg', NULL, NULL, '2020-03-09 04:37:22', '2020-08-27 10:22:52'),
(419, 1, 78, 4, 30, NULL, '0417', 'ACI Neem Original Honey & Turmeric Soap', 'ACI-Neem-Original-Honey-&-Turmeric-Soap', '<p>ACI Neem Original Honey &amp; Turmeric Soap</p>', 42.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750272ACI Neem Original Honey & Turmeric Soap.jpg', NULL, NULL, '2020-03-09 04:37:52', '2020-08-27 10:22:52'),
(420, 1, 131, 4, 30, NULL, '0418', 'Savlon Sensitive Soap', 'Savlon-Sensitive-Soap', '<p>Savlon Sensitive Soap</p>', 45.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750383Savlon Sensitive Soap.jpg', NULL, NULL, '2020-03-09 04:39:43', '2020-08-27 10:22:52'),
(421, 1, 131, 4, 30, NULL, '0419', 'Savlon Cool Soap', 'Savlon-Cool-Soap', '<p>Savlon Cool Soap</p>', 45.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750417Savlon Cool Soap.jpg', NULL, NULL, '2020-03-09 04:40:17', '2020-08-27 10:22:52'),
(422, 1, 113, 4, 30, NULL, '0420', 'Lever Ayush Soap Bar Natural Fair Saffron', 'Lever-Ayush-Soap-Bar-Natural-Fair-Saffron', '<p>Lever Ayush Soap Bar Natural Fair Saffron</p>', 38.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750673Lever Ayush Soap Bar Natural Fair Saffron.jpg', NULL, NULL, '2020-03-09 04:44:33', '2020-08-27 10:22:52'),
(423, 1, 113, 4, 30, NULL, '0421', 'Lever Ayush Soap Bar Natural Purifying Turmeric', 'Lever-Ayush-Soap-Bar-Natural-Purifying-Turmeric', '<p>Lever Ayush Soap Bar Natural Purifying Turmeric</p>', 38.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750710Lever Ayush Soap Bar Natural Purifying Turmeric.jpg', NULL, NULL, '2020-03-09 04:45:10', '2020-08-27 10:22:52'),
(424, 1, 132, 4, 30, NULL, '0422', 'Sandalina Sandal & Rose Soap', 'Sandalina-Sandal-&-Rose-Soap', '<p>Sandalina Sandal &amp; Rose Soap</p>', 36.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583750821Sandalina Sandal & Rose Soap.jpg', NULL, NULL, '2020-03-09 04:47:01', '2020-08-27 10:22:52'),
(425, 1, 128, 4, 30, NULL, '0423', 'Nivea Intensive Moisture Body Milk', 'Nivea-Intensive-Moisture-Body-Milk', '<p>Nivea Intensive Moisture Body Milk</p>', 600.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754293Nivea Intensive Moisture Body Milk.jpg', NULL, NULL, '2020-03-09 05:44:53', '2020-08-27 10:22:52'),
(426, 1, 128, 4, 30, NULL, '0424', 'Nivea Soft Crème', 'Nivea-Soft-Crème', '<p>Nivea Soft Cr&egrave;me</p>', 175.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754336Nivea Soft Crème.jpg', NULL, NULL, '2020-03-09 05:45:36', '2020-08-27 10:22:52'),
(427, 1, 128, 4, 30, NULL, '0425', 'Nivea Soft Crème', 'Nivea-Soft-Crème', '<p>Nivea Soft Cr&egrave;me</p>', 300.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754379Nivea Soft Crème.jpg', NULL, NULL, '2020-03-09 05:46:19', '2020-08-27 10:22:52'),
(428, 1, 128, 4, 30, NULL, '0426', 'Nivea Express Hydration Body Lotion', 'Nivea-Express-Hydration-Body-Lotion', '<p>Nivea Express Hydration Body Lotion</p>', 950.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754417Nivea Express Hydration Body Lotion.jpg', NULL, NULL, '2020-03-09 05:46:57', '2020-08-27 10:22:52'),
(429, 1, 128, 4, 30, NULL, '0427', 'Nivea Light Moisturising & Cleansing Lotion', 'Nivea-Light-Moisturising-&-Cleansing-Lotion', '<p>Nivea Light Moisturising &amp; Cleansing Lotion</p>', 520.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754457Nivea Light Moisturising & Cleansing Lotion.jpg', NULL, NULL, '2020-03-09 05:47:37', '2020-08-27 10:22:52'),
(430, 1, 128, 4, 30, NULL, '0428', 'Nivea Extra Rich Moisturising Lotion', 'Nivea-Extra-Rich-Moisturising-Lotion', '<p>Nivea Extra Rich Moisturising Lotion</p>', 520.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754491Nivea Extra Rich Moisturising Lotion.jpg', NULL, NULL, '2020-03-09 05:48:11', '2020-08-27 10:22:52'),
(431, 1, 35, 4, 30, NULL, '0429', 'Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf)', 'Fair-And-Lovely-Fairness-Cream-Advanced-Multivitamin-(Free-Scarf)', '<p>Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf)</p>', 210.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754540Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf).jpg', NULL, NULL, '2020-03-09 05:49:00', '2020-08-27 10:22:52'),
(432, 1, 35, 4, 30, NULL, '0430', 'Fair And Lovely Fairness Cream Advanced Multivitamin', 'Fair-And-Lovely-Fairness-Cream-Advanced-Multivitamin', '<p>Fair And Lovely Fairness Cream Advanced Multivitamin</p>', 115.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583754582Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf).jpg', NULL, NULL, '2020-03-09 05:49:42', '2020-08-27 10:22:52'),
(433, 1, 35, 4, 30, NULL, '0431', 'Fair And Lovely Advanced Multivitamin Body Fairness Milk', 'Fair-And-Lovely-Advanced-Multivitamin-Body-Fairness-Milk', '<p>Fair And Lovely Advanced Multivitamin Body Fairness Milk</p>', 155.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755281Fair And Lovely Advanced Multivitamin Body Fairness Milk.jpg', NULL, NULL, '2020-03-09 06:01:21', '2020-08-27 10:22:52'),
(434, 1, 35, 4, 30, NULL, '0432', 'Fair And Lovely Face Cream Blemish Balm', 'Fair-And-Lovely-Face-Cream-Blemish-Balm', '<p>Fair And Lovely Face Cream Blemish Balm</p>', 195.00, '40gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755324Fair And Lovely Face Cream Blemish Balm.jpg', NULL, NULL, '2020-03-09 06:02:04', '2020-08-27 10:22:52'),
(435, 1, 35, 4, 30, NULL, '0433', 'Fair And Lovely Face Cream Blemish Balm', 'Fair-And-Lovely-Face-Cream-Blemish-Balm', '<p>Fair And Lovely Face Cream Blemish Balm</p>', 60.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755361Fair And Lovely Face Cream Blemish Balm.jpg', NULL, NULL, '2020-03-09 06:02:41', '2020-08-27 10:22:52'),
(436, 1, 35, 4, 30, NULL, '0434', 'Fair And Lovely Fairness Cream Ayurvedic Care', 'Fair-And-Lovely-Fairness-Cream-Ayurvedic-Care', '<p>Fair And Lovely Fairness Cream Ayurvedic Care</p>', 120.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755586Fair And Lovely Fairness Cream Ayurvedic Care.jpg', NULL, NULL, '2020-03-09 06:06:26', '2020-08-27 10:22:52'),
(437, 1, 35, 4, 30, NULL, '0435', 'Fair And Lovely Fairness Cream Winter', 'Fair-And-Lovely-Fairness-Cream-Winter', '<p>Fair And Lovely Fairness Cream Winter</p>', 120.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755661Fair And Lovely Fairness Cream Winter.jpg', NULL, NULL, '2020-03-09 06:07:41', '2020-08-27 10:22:52'),
(438, 1, 35, 4, 30, NULL, '0436', 'Fair & Lovely Multivitamin Cream', 'Fair-&-Lovely-Multivitamin-Cream', '<p>Fair &amp; Lovely Multivitamin Cream</p>', 115.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755707Fair & Lovely Multivitamin Cream.jpg', NULL, NULL, '2020-03-09 06:08:27', '2020-08-27 10:22:52'),
(439, 1, 35, 4, 30, NULL, '0437', 'Fair And Lovely Advanced Multivitamin Body Fairness Milk', 'Fair-And-Lovely-Advanced-Multivitamin-Body-Fairness-Milk', '<p>Fair And Lovely Advanced Multivitamin Body Fairness Milk</p>', 210.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583755814Fair And Lovely Advanced Multivitamin Body Fairness Milk.jpg', NULL, NULL, '2020-03-09 06:10:14', '2020-08-27 10:22:52'),
(440, 1, 35, 4, 30, NULL, '0438', 'Fair and Lovely Face Cream Blemish Balm', 'Fair-and-Lovely-Face-Cream-Blemish-Balm', '<p>Fair and Lovely Face Cream Blemish Balm</p>', 110.00, '18gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756298Fair And Lovely Face Cream Blemish Balm.jpg', NULL, NULL, '2020-03-09 06:18:18', '2020-08-27 10:22:52'),
(441, 1, 35, 4, 30, NULL, '0439', 'Fair And Lovely Fairness Cream Advanced Multivitamin', 'Fair-And-Lovely-Fairness-Cream-Advanced-Multivitamin', '<p>Fair And Lovely Fairness Cream Advanced Multivitamin</p>', 210.00, '80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756363Fair And Lovely Fairness Cream Advanced Multivitamin.jpg', NULL, NULL, '2020-03-09 06:19:23', '2020-08-27 10:22:52'),
(442, 1, 35, 4, 30, NULL, '0440', 'Fair And Lovely Fairness Cream Winter', 'Fair-And-Lovely-Fairness-Cream-Winter', '<p>Fair And Lovely Fairness Cream Winter</p>', 65.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756404Fair And Lovely Fairness Cream Winter.jpg', NULL, NULL, '2020-03-09 06:20:04', '2020-08-27 10:22:52'),
(443, 1, 35, 4, 30, NULL, '0441', 'Mens Fair And Lovely Fairness Cream Rapid Action', 'Mens-Fair-And-Lovely-Fairness-Cream-Rapid-Action', '<p>Men&#39;s Fair And Lovely Fairness Cream Rapid Action</p>', 125.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756482Mens Fair And Lovely Fairness Cream Rapid Action.jpg', NULL, NULL, '2020-03-09 06:21:22', '2020-08-27 10:22:52'),
(444, 1, 35, 4, 30, NULL, '0442', 'Mens Fair And Lovely Fairness Cream Rapid Action', 'Mens-Fair-And-Lovely-Fairness-Cream-Rapid-Action', '<p>Men&#39;s Fair And Lovely Fairness Cream Rapid Action</p>', 70.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756523Mens Fair And Lovely Fairness Cream Rapid Action.jpg', NULL, NULL, '2020-03-09 06:22:03', '2020-08-27 10:22:52'),
(445, 1, 121, 4, 30, NULL, '0443', 'Vaseline Lotion Deep Restore', 'Vaseline-Lotion-Deep-Restore', '<p>Vaseline Lotion Deep Restore</p>', 180.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756735Vaseline Lotion Deep Restore.jpg', NULL, NULL, '2020-03-09 06:25:35', '2020-08-27 10:22:52'),
(446, 1, 121, 4, 30, NULL, '0444', 'Vaseline Lotion Deep Restore', 'Vaseline-Lotion-Deep-Restore', '<p>Vaseline Lotion Deep Restore</p>', 110.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756770Vaseline Lotion Deep Restore.jpg', NULL, NULL, '2020-03-09 06:26:10', '2020-08-27 10:22:52'),
(447, 1, 121, 4, 30, NULL, '0445', 'Vaseline Lotion Deep Restore', 'Vaseline-Lotion-Deep-Restore', '<p>Vaseline Lotion Deep Restore</p>', 260.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756806Vaseline Lotion Deep Restore.jpg', NULL, NULL, '2020-03-09 06:26:46', '2020-08-27 10:22:52'),
(448, 1, 121, 4, 30, NULL, '0446', 'Vaseline Lotion Healthy White', 'Vaseline-Lotion-Healthy-White', '<p>Vaseline Lotion Healthy White</p>', 115.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756849Vaseline Lotion Healthy White.jpg', NULL, NULL, '2020-03-09 06:27:29', '2020-08-27 10:22:52'),
(449, 1, 121, 4, 30, NULL, '0447', 'Vaseline Lotion Healthy White', 'Vaseline-Lotion-Healthy-White', '<p>Vaseline Lotion Healthy White</p>', 190.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756890Vaseline Lotion Healthy White.jpg', NULL, NULL, '2020-03-09 06:28:10', '2020-08-27 10:22:52'),
(450, 1, 121, 4, 30, NULL, '0448', 'Vaseline Lotion Healthy White', 'Vaseline-Lotion-Healthy-White', '<p>Vaseline Lotion Healthy White</p>', 270.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583756925Vaseline Lotion Healthy White.jpg', NULL, NULL, '2020-03-09 06:28:45', '2020-08-27 10:22:52'),
(451, 1, 121, 4, 30, NULL, '0449', 'Vaseline Intensive Care Cocoa Glow Body Lotion', 'Vaseline-Intensive-Care-Cocoa-Glow-Body-Lotion', '<p>Vaseline Intensive Care Cocoa Glow Body Lotion</p>', 450.00, '400ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583816309Vaseline Intensive Care Cocoa Glow Body Lotion.jpg', NULL, NULL, '2020-03-09 22:58:29', '2020-08-27 10:22:52'),
(452, 1, 121, 4, 30, NULL, '0450', 'Vaseline Intensive Care Cocoa Radiant Gel Oil', 'Vaseline-Intensive-Care-Cocoa-Radiant-Gel-Oil', '<p>Vaseline Intensive Care Cocoa Radiant Gel Oil</p>', 780.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583816343Vaseline Intensive Care Cocoa Radiant Gel Oil.jpg', NULL, NULL, '2020-03-09 22:59:03', '2020-08-27 10:22:52'),
(453, 1, 133, 4, 30, NULL, '0451', 'Woman\'s World Whitening Body Lotion', 'Woman\'s-World-Whitening-Body-Lotion', '<p>Woman&#39;s World Whitening Body Lotion</p>', 660.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583816470Woman\'s World Whitening Body Lotion.jpg', NULL, NULL, '2020-03-09 23:01:10', '2020-08-27 10:22:52'),
(454, 1, 134, 4, 30, NULL, '0452', 'Pond\'s Day Cream White Beauty', 'Pond\'s-Day-Cream-White-Beauty', '<p>Pond&#39;s Day Cream White Beauty</p>', 80.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583816718Pond\'s Day Cream White Beauty.jpg', NULL, NULL, '2020-03-09 23:05:18', '2020-08-27 10:22:52'),
(455, 1, 134, 4, 30, NULL, '0453', 'Pond\'s Day Cream White Beauty', 'Pond\'s-Day-Cream-White-Beauty', '<p>Pond&#39;s Day Cream White Beauty</p>', 130.00, '35gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583817966Pond\'s Day Cream White Beauty.jpg', NULL, NULL, '2020-03-09 23:26:06', '2020-08-27 10:22:52'),
(456, 1, 134, 4, 30, NULL, '0454', 'Pond\'s Day Cream White Beauty', 'Pond\'s-Day-Cream-White-Beauty', '<p>Pond&#39;s Day Cream White Beauty</p>', 350.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583818139Pond\'s Day Cream White Beauty.jpg', NULL, NULL, '2020-03-09 23:28:59', '2020-08-27 10:22:52'),
(457, 1, 134, 4, 30, NULL, '0455', 'Pond’s Oil Control Vanishing Cream', 'Pond’s-Oil-Control-Vanishing-Cream', '<p>Pond&rsquo;s Oil Control Vanishing Cream</p>', 40.00, '28gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819070Pond’s Oil Control Vanishing Cream.jpg', NULL, NULL, '2020-03-09 23:44:30', '2020-08-27 10:22:52'),
(458, 1, 134, 4, 30, NULL, '0456', 'Ponds Day Cream Age Miracle', 'Ponds-Day-Cream-Age-Miracle', '<p>Ponds Day Cream Age Miracle</p>', 1150.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819111Ponds Day Cream Age Miracle.jpg', NULL, NULL, '2020-03-09 23:45:11', '2020-08-27 10:22:52'),
(459, 1, 135, 4, 30, NULL, '0457', 'Cute Winter Moisturising Cream', 'Cute-Winter-Moisturising-Cream', '<p>Cute Winter Moisturising Cream</p>', 125.00, '120gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819203Cute Winter Moisturising Cream.jpg', NULL, NULL, '2020-03-09 23:46:43', '2020-08-27 10:22:52'),
(460, 1, 135, 4, 30, NULL, '0458', 'Cute Vanishing Cream', 'Cute-Vanishing-Cream', '<p>Cute Vanishing Cream</p>', 70.00, '130gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819379Cute Vanishing Cream.jpg', NULL, NULL, '2020-03-09 23:49:39', '2020-08-27 10:22:52'),
(461, 1, 135, 4, 30, NULL, '0459', 'Cute Beauty Milk Body Lotion', 'Cute-Beauty-Milk-Body-Lotion', '<p>Cute Beauty Milk Body Lotion</p>', 150.00, '275ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819601Cute Beauty Milk Body Lotion.jpg', NULL, NULL, '2020-03-09 23:53:21', '2020-08-27 10:22:52'),
(462, 1, 135, 4, 30, NULL, '0460', 'Cute 27 Cold Cream', 'Cute-27-Cold-Cream', '<p>Boro Plus Antiseptic Cream</p>', 90.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819760Boro Plus Antiseptic Cream.jpg', NULL, NULL, '2020-03-09 23:56:00', '2020-08-27 10:22:52'),
(463, 1, 136, 4, 30, NULL, '0461', 'Boro Plus Antiseptic Cream', 'Boro-Plus-Antiseptic-Cream', '<p>Boro Plus Antiseptic Cream</p>', 75.00, '40ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819843Boro Plus Antiseptic Cream.jpg', NULL, NULL, '2020-03-09 23:57:23', '2020-08-27 10:22:52'),
(464, 1, 136, 4, 30, NULL, '0462', 'Boro Plus Antiseptic Cream', 'Boro-Plus-Antiseptic-Cream', '<p>Boro Plus Antiseptic Cream</p>', 260.00, '80ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819880Boro Plus Antiseptic Cream.jpg', NULL, NULL, '2020-03-09 23:58:00', '2020-08-27 10:22:52'),
(465, 1, 136, 4, 30, NULL, '0463', 'Boroplus Moisturising Body Lotion Almond', 'Boroplus-Moisturising-Body-Lotion-Almond', '<p>Boroplus Moisturising Body Lotion Almond</p>', 275.00, '300gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583819971Boroplus Moisturising Body Lotion Almond.jpg', NULL, NULL, '2020-03-09 23:59:31', '2020-08-27 10:22:52'),
(466, 1, 136, 4, 30, NULL, '0464', 'Boroplus Whitening Body Lotion', 'Boroplus-Whitening-Body-Lotion', '<p>Boroplus Whitening Body Lotion</p>', 330.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820009Boroplus Whitening Body Lotion.jpg', NULL, NULL, '2020-03-10 00:00:09', '2020-08-27 10:22:52'),
(467, 1, 136, 4, 30, NULL, '0465', 'Boro Plus Perfect Tauch Moisturising Cream', 'Boro-Plus-Perfect-Tauch-Moisturising-Cream', '<p>Boro Plus Perfect Tauch Moisturising Cream</p>', 40.00, '20ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820130Boro Plus Perfect Tauch Moisturising Cream.jpg', NULL, NULL, '2020-03-10 00:02:10', '2020-08-27 10:22:52'),
(468, 1, 136, 4, 30, NULL, '0466', 'Boroplus Moiturising Lotion Alovera & Millk', 'Boroplus-Moiturising-Lotion-Alovera-&-Millk', '<p>Boroplus Moiturising Lotion Alovera &amp; Millk</p>', 275.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820257Boroplus Moiturising Lotion Alovera & Millk.jpg', NULL, NULL, '2020-03-10 00:04:17', '2020-08-27 10:22:52'),
(469, 1, 137, 4, 30, NULL, '0467', 'Oxy Whitening Cream', 'Oxy-Whitening-Cream', '<p>Oxy Whitening Cream</p>', 295.00, '40gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820633Oxy Whitening Cream.jpg', NULL, NULL, '2020-03-10 00:10:33', '2020-08-27 10:22:52'),
(470, 1, 138, 4, 30, NULL, '0468', 'Boroline Antiseptic Ayurvedic Cream', 'Boroline-Antiseptic-Ayurvedic-Cream', '<p>Boroline Antiseptic Ayurvedic Cream</p>', 85.00, '20gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820675Boroline Antiseptic Ayurvedic Cream.jpg', NULL, NULL, '2020-03-10 00:11:15', '2020-08-27 10:22:52'),
(471, 1, 126, 4, 30, NULL, '0469', 'Himalaya Clear Complex Whitening Day Cream', 'Himalaya-Clear-Complex-Whitening-Day-Cream', '<p>Himalaya Clear Complex Whitening Day Cream</p>', 450.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820720Himalaya Clear Complex Whitening Day Cream.jpg', NULL, NULL, '2020-03-10 00:12:00', '2020-08-27 10:22:52'),
(472, 1, 126, 4, 30, NULL, '0470', 'Himalaya Revitalizing Night Cream', 'Himalaya-Revitalizing-Night-Cream', '<p>Himalaya Revitalizing Night Cream</p>', 450.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820753Himalaya Revitalizing Night Cream.jpg', NULL, NULL, '2020-03-10 00:12:33', '2020-08-27 10:22:52'),
(473, 1, 126, 4, 30, NULL, '0471', 'Himalaya Anti Wrinkle Cream', 'Himalaya-Anti-Wrinkle-Cream', '<p>Himalaya Anti Wrinkle Cream</p>', 450.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820787Himalaya Anti Wrinkle Cream.jpg', NULL, NULL, '2020-03-10 00:13:07', '2020-08-27 10:22:52'),
(474, 1, 139, 4, 30, NULL, '0472', 'Revive Moisturizing Lotion', 'Revive-Moisturizing-Lotion', '<p>Revive Moisturizing Lotion</p>', 170.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583820823Revive Moisturizing Lotion.jpg', NULL, NULL, '2020-03-10 00:13:43', '2020-08-27 10:22:52'),
(475, 1, 134, 4, 30, NULL, '0473', 'Pond\'s Face Wash Pure White', 'Pond\'s-Face-Wash-Pure-White', '<p>Pond&#39;s Face Wash Pure White</p>', 220.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583824079Pond\'s Face Wash Pure White.jpg', NULL, NULL, '2020-03-10 01:07:59', '2020-08-27 10:22:52'),
(476, 1, 134, 4, 30, NULL, '0474', 'Pond\'s Face Wash White Beauty', 'Pond\'s-Face-Wash-White-Beauty', '<p>Pond&#39;s Face Wash White Beauty</p>', 99.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583824860Pond\'s Face Wash White Beauty.jpg', NULL, NULL, '2020-03-10 01:21:00', '2020-08-27 10:22:52'),
(477, 1, 134, 4, 30, NULL, '0475', 'Pond\'s Face Wash White Beauty', 'Pond\'s-Face-Wash-White-Beauty', '<p>Pond&#39;s Face Wash White Beauty</p>', 180.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583824908Pond\'s Face Wash White Beauty.jpg', NULL, NULL, '2020-03-10 01:21:48', '2020-08-27 10:22:52'),
(478, 1, 134, 4, 30, NULL, '0476', 'Ponds Face Wash Pimple Clear', 'Ponds-Face-Wash-Pimple-Clear', '<p>Ponds Face Wash Pimple Clear</p>', 99.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583824947Ponds Face Wash Pimple Clear.jpg', NULL, NULL, '2020-03-10 01:22:27', '2020-08-27 10:22:52'),
(479, 1, 134, 4, 30, NULL, '0477', 'Pond\'s Face Wash Daily', 'Pond\'s-Face-Wash-Daily', '<p>Pond&#39;s Face Wash Daily</p>', 85.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583826466Pond\'s Face Wash Daily.jpg', NULL, NULL, '2020-03-10 01:47:46', '2020-08-27 10:22:52'),
(480, 1, 134, 4, 30, NULL, '0478', 'Ponds Face Wash Scrub', 'Ponds-Face-Wash-Scrub', '<p>Ponds Face Wash Scrub</p>', 155.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831106Ponds Face Wash Scrub.jpg', NULL, NULL, '2020-03-10 03:05:06', '2020-08-27 10:22:52'),
(481, 1, 134, 4, 30, NULL, '0479', 'Ponds Men Facewash Lightning Oil Clear', 'Ponds-Men-Facewash-Lightning-Oil-Clear', '<p>Ponds Men Facewash Lightning Oil Clear</p>', 125.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831153Ponds Men Facewash Lightning Oil Clear.jpg', NULL, NULL, '2020-03-10 03:05:53', '2020-08-27 10:22:52'),
(482, 1, 134, 4, 30, NULL, '0480', 'Ponds Men Facewash Lightning Oil Clear', 'Ponds-Men-Facewash-Lightning-Oil-Clear', '<p>Ponds Men Facewash Lightning Oil Clear</p>', 225.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831188Ponds Men Facewash Lightning Oil Clear.jpg', NULL, NULL, '2020-03-10 03:06:28', '2020-08-27 10:22:52'),
(483, 1, 134, 4, 30, NULL, '0481', 'Ponds Face Wash Daily', 'Ponds-Face-Wash-Daily', '<p>Ponds Face Wash Daily</p>', 125.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831220Ponds Face Wash Daily.jpg', NULL, NULL, '2020-03-10 03:07:00', '2020-08-27 10:22:52'),
(484, 1, 134, 4, NULL, NULL, '0482', 'Ponds Face Wash Daily', 'Ponds-Face-Wash-Daily', '<p>Ponds Face Wash Daily</p>', 225.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-03-10 03:07:26', '2020-08-27 10:22:52'),
(485, 1, 134, 4, 30, NULL, '0483', 'Ponds Men Facewash Energy Charge', 'Ponds-Men-Facewash-Energy-Charge', '<p>Ponds Men Facewash Energy Charge</p>', 125.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831297Ponds Men Facewash Energy Charge.jpg', NULL, NULL, '2020-03-10 03:08:17', '2020-08-27 10:22:52'),
(486, 1, 134, 4, 30, NULL, '0484', 'Ponds Men Facewash Energy Charge', 'Ponds-Men-Facewash-Energy-Charge', '<p>Ponds Men Facewash Energy Charge</p>', 225.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831330Ponds Men Facewash Energy Charge.jpg', NULL, NULL, '2020-03-10 03:08:50', '2020-08-27 10:22:52'),
(487, 1, 134, 4, 30, NULL, '0485', 'Ponds Men Facewash Acne Solution', 'Ponds-Men-Facewash-Acne-Solution', '<p>Ponds Men Facewash Acne Solution</p>', 125.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831369Ponds Men Facewash Acne Solution.jpg', NULL, NULL, '2020-03-10 03:09:29', '2020-08-27 10:22:52'),
(488, 1, 134, 4, 30, NULL, '0486', 'Ponds Men Facewash Acne Solution', 'Ponds-Men-Facewash-Acne-Solution', '<p>Ponds Men Facewash Acne Solution</p>', 225.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831405Ponds Men Facewash Acne Solution.jpg', NULL, NULL, '2020-03-10 03:10:05', '2020-08-27 10:22:52'),
(489, 1, 134, 4, 30, NULL, '0487', 'Ponds Men Facewash Power Clear', 'Ponds-Men-Facewash-Power-Clear', '<p>Ponds Men Facewash Power Clear</p>', 225.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831815Ponds Men Facewash Power Clear.jpg', NULL, NULL, '2020-03-10 03:16:55', '2020-08-27 10:22:52'),
(490, 1, 140, 4, 30, NULL, '0488', 'Clean & Clear Morning Energy Brightening Berry Face Wash', 'Clean-&-Clear-Morning-Energy-Brightening-Berry-Face-Wash', '<p>Clean &amp; Clear Morning Energy Brightening Berry Face Wash</p>', 140.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831923Clean & Clear Morning Energy Brightening Berry Face Wash.jpg', NULL, NULL, '2020-03-10 03:18:43', '2020-08-27 10:22:52'),
(491, 1, 140, 4, 30, NULL, '0489', 'Clean & Clear Morning Energy Face Wash Lemon', 'Clean-&-Clear-Morning-Energy-Face-Wash-Lemon', '<p>Clean &amp; Clear Morning Energy Face Wash Lemon</p>', 140.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583831961Clean & Clear Morning Energy Face Wash Lemon.jpg', NULL, NULL, '2020-03-10 03:19:21', '2020-08-27 10:22:52'),
(492, 1, 140, 4, 30, NULL, '0490', 'Clean & Clear Morning Energy Face Wash', 'Clean-&-Clear-Morning-Energy-Face-Wash', '<p>Clean &amp; Clear Morning Energy Face Wash</p>', 140.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832008Clean & Clear Morning Energy Face Wash.jpg', NULL, NULL, '2020-03-10 03:20:08', '2020-08-27 10:22:52'),
(493, 1, 140, 4, 30, NULL, '0491', 'Clean & Clear Blackhead Daily Scrub Oil Free', 'Clean-&-Clear-Blackhead-Daily-Scrub-Oil-Free', '<p>Clean &amp; Clear Blackhead Daily Scrub Oil-Free</p>', 450.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832057Clean & Clear Blackhead Daily Scrub Oil Free.jpg', NULL, NULL, '2020-03-10 03:20:57', '2020-08-27 10:22:52'),
(494, 1, 140, 4, 30, NULL, '0492', 'Clean & Clear Blackhead Daily Scrub Oil Free', 'Clean-&-Clear-Blackhead-Daily-Scrub-Oil-Free', '<p>Clean &amp; Clear Blackhead Daily Scrub Oil-Free</p>', 150.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832113Clean & Clear Blackhead Daily Scrub Oil Free.jpg', NULL, NULL, '2020-03-10 03:21:53', '2020-08-27 10:22:52'),
(495, 1, 126, 4, 30, NULL, '0493', 'Himalaya Fresh Srart Oil Clear Face Wash Lemon', 'Himalaya-Fresh-Srart-Oil-Clear-Face-Wash-Lemon', '<p>Himalaya Fresh Start Oil Clear Face Wash Lemon</p>', 150.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832501Himalaya Fresh Srart Oil Clear Face Wash Lemon.jpg', NULL, NULL, '2020-03-10 03:28:21', '2020-08-27 10:22:52');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(496, 1, 126, 4, 30, NULL, '0494', 'Himalaya Fresh Srart Oil Clear Face Wash Strawberry', 'Himalaya-Fresh-Srart-Oil-Clear-Face-Wash-Strawberry', '<p>Himalaya Fresh Start Oil Clear Face Wash Strawberry</p>', 150.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832541Himalaya Fresh Srart Oil Clear Face Wash Strawberry.jpg', NULL, NULL, '2020-03-10 03:29:01', '2020-08-27 10:22:52'),
(497, 1, 126, 4, 30, NULL, '0495', 'Himalaya Fresh Start Oil Clear Face Wash Peach', 'Himalaya-Fresh-Start-Oil-Clear-Face-Wash-Peach', '<p>Himalaya Fresh Start Oil Clear Face Wash Peach</p>', 150.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832596Himalaya Fresh Srart Oil Clear Face Wash Peach.jpg', NULL, NULL, '2020-03-10 03:29:56', '2020-08-27 10:22:52'),
(498, 1, 113, 4, 30, NULL, '0496', 'Lever Ayush Face Wash Natural Fairness Saffron', 'Lever-Ayush-Face-Wash-Natural-Fairness-Saffron', '<p>Lever Ayush Face Wash Natural Fairness Saffron</p>', 160.00, '80ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832631Lever Ayush Face Wash Natural Fairness Saffron.jpg', NULL, NULL, '2020-03-10 03:30:31', '2020-08-27 10:22:52'),
(499, 1, 113, 4, 30, NULL, '0497', 'Lever Ayush Face wash Anti Pimple Turmeric', 'Lever-Ayush-Face-wash-Anti-Pimple-Turmeric', '<p>Lever Ayush Face wash Anti Pimple Turmeric</p>', 160.00, '80ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832666Lever Ayush Face wash Anti Pimple Turmeric.jpg', NULL, NULL, '2020-03-10 03:31:06', '2020-08-27 10:22:52'),
(500, 1, 113, 4, 30, NULL, '0498', 'Lever Ayush Face wash Anti Pimple Turmeric', 'Lever-Ayush-Face-wash-Anti-Pimple-Turmeric', '<p>Lever Ayush Face wash Anti Pimple Turmeric</p>', 90.00, '40ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832698Lever Ayush Face wash Anti Pimple Turmeric.jpg', NULL, NULL, '2020-03-10 03:31:38', '2020-08-27 10:22:52'),
(501, 1, 113, 4, 30, NULL, '0499', 'Lever Ayush Face Cream Anti Marks Turmeric', 'Lever-Ayush-Face-Cream-Anti-Marks-Turmeric', '<p>Lever Ayush Face Cream Anti Marks Turmeric</p>', 150.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832781Lever Ayush Face Cream Anti Marks Turmeric.jpg', NULL, NULL, '2020-03-10 03:33:01', '2020-08-27 10:22:52'),
(502, 1, 113, 4, 30, NULL, '0500', 'Lever Ayush Face Cream Anti Marks Turmeric', 'Lever-Ayush-Face-Cream-Anti-Marks-Turmeric', '<p>Lever Ayush Face Cream Anti Marks Turmeric</p>', 80.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583832810Lever Ayush Face Cream Anti Marks Turmeric.jpg', NULL, NULL, '2020-03-10 03:33:30', '2020-08-27 10:22:52'),
(503, 1, 35, 4, 30, NULL, '0501', 'Fair And Lovely Face Wash InstaGlow', 'Fair-And-Lovely-Face-Wash-InstaGlow', '<p>Fair And Lovely Face Wash InstaGlow</p>', 140.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833102Fair And Lovely Face Wash InstaGlow.jpg', NULL, NULL, '2020-03-10 03:38:22', '2020-08-27 10:22:52'),
(504, 1, 35, 4, 30, NULL, '0502', 'Fair And Lovely Face Wash InstaGlow', 'Fair-And-Lovely-Face-Wash-InstaGlow', '<p>Fair And Lovely Face Wash InstaGlow</p>', 75.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833135Fair And Lovely Face Wash InstaGlow.jpg', NULL, NULL, '2020-03-10 03:38:55', '2020-08-27 10:22:52'),
(505, 1, 35, 4, 30, NULL, '0503', 'Mens Fair And Lovely Face Wash Rapid Action', 'Mens-Fair-And-Lovely-Face-Wash-Rapid-Action', '<p>Men&#39;s Fair And Lovely Face Wash Rapid Action</p>', 150.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833183Mens Fair And Lovely Face Wash Rapid Action.jpg', NULL, NULL, '2020-03-10 03:39:43', '2020-08-27 10:22:52'),
(506, 1, 35, 4, 30, NULL, '0504', 'Mens Fair And Lovely Face Wash Rapid Action', 'Mens-Fair-And-Lovely-Face-Wash-Rapid-Action', '<p>Mens Fair And Lovely Face Wash Rapid Action</p>', 80.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833214Mens Fair And Lovely Face Wash Rapid Action.jpg', NULL, NULL, '2020-03-10 03:40:14', '2020-08-27 10:22:52'),
(507, 1, 35, 4, 30, NULL, '0505', 'Fair And Lovely Face Wash Ayurvedic', 'Fair-And-Lovely-Face-Wash-Ayurvedic', '<p>Fair And Lovely Face Wash Ayurvedic</p>', 150.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833250Fair And Lovely Face Wash Ayurvedic.jpg', NULL, NULL, '2020-03-10 03:40:50', '2020-08-27 10:22:52'),
(508, 1, 116, 4, 30, NULL, '0506', 'Emami Fair And Handsome Fairness Cream', 'Emami-Fair-And-Handsome-Fairness-Cream', '<p>Emami Fair And Handsome Fairness Cream</p>', 160.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833311Emami Fair And Handsome Fairness Cream.jpg', NULL, NULL, '2020-03-10 03:41:51', '2020-08-27 10:22:52'),
(509, 1, 116, 4, 30, NULL, '0507', 'Emami Naturally Fair Face Wash', 'Emami-Naturally-Fair-Face-Wash', '<p>Emami Naturally Fair Face Wash</p>', 100.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833363Emami Naturally Fair Face Wash.jpg', NULL, NULL, '2020-03-10 03:42:43', '2020-08-27 10:22:52'),
(510, 1, 116, 4, 30, NULL, '0508', 'Emami Naturally Fair Face cream', 'Emami-Naturally-Fair-Face-cream', '<p>Emami Naturally Fair Face cream</p>', 100.00, '120gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1583833445Emami Naturally Fair Face cream.jpg', NULL, NULL, '2020-03-10 03:44:05', '2020-08-27 10:22:52'),
(511, 1, 128, 4, 30, NULL, '0509', 'Nivea Men 48h Cool Kick Deodorent', 'Nivea-Men-48h-Cool-Kick-Deodorent', '<p>Nivea Men 48h Cool Kick Deodorant</p>', 280.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583835956Nivea Men 48h Cool Kick Deodorent.jpg', NULL, NULL, '2020-03-10 04:25:56', '2020-08-27 10:22:52'),
(512, 1, 128, 4, 30, NULL, '0510', 'Nivea Men 48h Fresh Active Deodorent', 'Nivea-Men-48h-Fresh-Active-Deodorent', '<p>Nivea Men 48h Fresh Active Deodorant</p>', 280.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836000Nivea Men 48h Fresh Active Deodorent.jpg', NULL, NULL, '2020-03-10 04:26:40', '2020-08-27 10:22:52'),
(513, 1, 128, 4, 30, NULL, '0511', 'Nivea Pearl & Beauty 48h Deodorent', 'Nivea-Pearl-&-Beauty-48h-Deodorent', '<p>Nivea Pearl &amp; Beauty 48h Deodorant</p>', 280.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836052Nivea Pearl & Beauty 48h Deodorent.jpg', NULL, NULL, '2020-03-10 04:27:32', '2020-08-27 10:22:52'),
(514, 1, 128, 4, 30, NULL, '0512', 'Nivea Men Ice Cool Body Deodorizer', 'Nivea-Men-Ice-Cool-Body-Deodorizer', '<p>Nivea Men Ice Cool Body Deodorizer</p>', 400.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836091Nivea Men Ice Cool Body Deodorizer.jpg', NULL, NULL, '2020-03-10 04:28:11', '2020-08-27 10:22:52'),
(515, 1, 141, 4, 30, NULL, '0513', 'Axe Body Perfume Signature Intense Body Perfume', 'Axe-Body-Perfume-Signature-Intense-Body-Perfume', '<p>Axe Body Perfume Signature Intense Body Perfume</p>', 350.00, '122ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836183Axe Body Perfume Signature Intense Body Perfume.jpg', NULL, NULL, '2020-03-10 04:29:43', '2020-08-27 10:22:52'),
(516, 1, 141, 4, 30, NULL, '0514', 'Axe Body Perfume Signature Suave Body Perfume', 'Axe-Body-Perfume-Signature-Suave-Body-Perfume', '<p>Axe Body Perfume Signature Suave Body Perfume</p>', 350.00, '122ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836218Axe Body Perfume Signature Suave Body Perfume.jpg', NULL, NULL, '2020-03-10 04:30:18', '2020-08-27 10:22:52'),
(517, 1, 141, 4, 30, NULL, '0515', 'Axe Deodorant Dark Temptation', 'Axe-Deodorant-Dark-Temptation', '<p>Axe Deodorant Dark Temptation</p>', 225.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836303Axe Deodorant Dark Temptation.jpg', NULL, NULL, '2020-03-10 04:31:43', '2020-08-27 10:22:52'),
(518, 1, 141, 4, 30, NULL, '0516', 'Axe Body Perfume Signature Mysterious Body Perfume', 'Axe-Body-Perfume-Signature-Mysterious-Body-Perfume', '<p>Axe Body Perfume Signature Mysterious Body Perfume</p>', 380.00, '122ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836355Axe Body Perfume Signature Mysterious Body Perfume.jpg', NULL, NULL, '2020-03-10 04:32:35', '2020-08-27 10:22:52'),
(519, 1, 119, 4, 30, NULL, '0517', 'Set Wet Go Man Pocket Perfume Rockstar', 'Set-Wet-Go-Man-Pocket-Perfume-Rockstar', '<p>Set Wet Go Man Pocket Perfume Rockstar</p>', 110.00, '17ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836406Set Wet Go Man Pocket Perfume Rockstar.jpg', NULL, NULL, '2020-03-10 04:33:26', '2020-08-27 10:22:52'),
(520, 1, 119, 4, 30, NULL, '0518', 'Set Wet Go Man Pocket Perfume Aviator', 'Set-Wet-Go-Man-Pocket-Perfume-Aviator', '<p>Set Wet Go Man Pocket Perfume Aviator</p>', 100.00, '17ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836799Set Wet Go Man Pocket Perfume Aviator.jpg', NULL, NULL, '2020-03-10 04:39:59', '2020-08-27 10:22:52'),
(521, 1, 119, 4, 30, NULL, '0519', 'Set Wet Body Spray Deodorant Perfume Cool Avatar', 'Set-Wet-Body-Spray-Deodorant-Perfume-Cool-Avatar', '<p>Set Wet Body Spray Deodorant Perfume Cool Avatar</p>', 250.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583836849Set Wet Body Spray Deodorant Perfume Cool Avatar.jpg', NULL, NULL, '2020-03-10 04:40:49', '2020-08-27 10:22:52'),
(522, 1, 119, 4, 30, NULL, '0520', 'Set Wet Body Spray Deodorant Perfume Swag Avatar', 'Set-Wet-Body-Spray-Deodorant-Perfume-Swag-Avatar', '<p>Set Wet Body Spray Deodorant Perfume Swag Avatar</p>', 250.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583837337Set Wet Body Spray Deodorant Perfume Swag Avatar.jpg', NULL, NULL, '2020-03-10 04:48:57', '2020-08-27 10:22:52'),
(523, 1, 119, 4, 30, NULL, '0521', 'Set Wet Hair Styling Gel for Men Value Pack (Wet Look)', 'Set-Wet-Hair-Styling-Gel-for-Men-Value-Pack-(Wet-Look)', '<p>Set Wet Hair Styling Gel for Men Value Pack (Wet Look)</p>', 280.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583837381Set Wet Hair Styling Gel for Men Value Pack (Wet Look).jpg', NULL, NULL, '2020-03-10 04:49:41', '2020-08-27 10:22:52'),
(524, 1, 119, 4, 30, NULL, '0522', 'Set Wet Hair Styling Gel for Men Value Pack (Wet Look)', 'Set-Wet-Hair-Styling-Gel-for-Men-Value-Pack-(Wet-Look)', '<p>Set Wet Hair Styling Gel for Men Value Pack (Wet Look)</p>', 300.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583837422Set Wet Hair Styling Gel for Men Value Pack (Wet Look).jpg', NULL, NULL, '2020-03-10 04:50:22', '2020-08-27 10:22:52'),
(525, 1, 142, 4, 30, NULL, '0523', 'X-Men Perfume Body Spray Gas Free Impact', 'X-Men-Perfume-Body-Spray-Gas-Free-Impact', '<p>X-Men Perfumed Body Spray Gas Free Impact</p>', 350.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583837816X-Men Perfume Body Spray Gas Free Impact.jpg', NULL, NULL, '2020-03-10 04:56:56', '2020-08-27 10:22:52'),
(526, 1, 142, 4, 30, NULL, '0524', 'X-Men Perfume Body Spray Gas Free Focus', 'X-Men-Perfume-Body-Spray-Gas-Free-Focus', '<p>X-Men Perfumed Body Spray Gas Free Focus</p>', 350.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838170X-Men Perfume Body Spray Gas Free Focus.jpg', NULL, NULL, '2020-03-10 05:02:50', '2020-08-27 10:22:52'),
(527, 1, 142, 4, 30, NULL, '0525', 'X-Men For Boss Perfume Premium Deo Spray Motion', 'X-Men-For-Boss-Perfume-Premium-Deo-Spray-Motion', '<p>X-Men For Boss Perfume Premium Deo Spray Motion</p>', 320.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838201X-Men For Boss Perfume Premium Deo Spray Motion.jpg', NULL, NULL, '2020-03-10 05:03:21', '2020-08-27 10:22:52'),
(528, 1, 142, 4, 30, NULL, '0526', 'X-Men for Boss EDT Perfume Luxury', 'X-Men-for-Boss-EDT-Perfume-Luxury', '<p>X-Men for Boss EDT Perfume Luxury</p>', 850.00, '49ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838239X-Men for Boss EDT Perfume Luxury.jpg', NULL, NULL, '2020-03-10 05:03:59', '2020-08-27 10:22:52'),
(529, 1, 143, 4, 30, NULL, '0527', 'Fogg Body Spray Marco', 'Fogg-Body-Spray-Marco', '<p>Fogg Body Spray Marco</p>', 305.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838280Fogg Body Spray Marco.jpg', NULL, NULL, '2020-03-10 05:04:40', '2020-08-27 10:22:52'),
(530, 1, 143, 4, 30, NULL, '0528', 'Fogg Body Spray Paradise', 'Fogg-Body-Spray-Paradise', '<p>Fogg Body Spray Paradise</p>', 305.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838320Fogg Body Spray Paradise.jpg', NULL, NULL, '2020-03-10 05:05:20', '2020-08-27 10:22:52'),
(531, 1, 143, 4, 30, NULL, '0529', 'Fogg Body spray Victor', 'Fogg-Body-spray-Victor', '<p>Fogg Body spray Victor</p>', 305.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838352Fogg Body spray Victor.jpg', NULL, NULL, '2020-03-10 05:05:52', '2020-08-27 10:22:52'),
(532, 1, 143, 4, 30, NULL, '0530', 'Fogg Body Spray Napoleon', 'Fogg-Body-Spray-Napoleon', '<p>Fogg Body Spray Napoleon</p>', 305.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838393Fogg Body Spray Napoleon.jpg', NULL, NULL, '2020-03-10 05:06:33', '2020-08-27 10:22:52'),
(533, 1, 143, 4, 30, NULL, '0531', 'Fogg Body spray Blue Ocean', 'Fogg-Body-spray-Blue-Ocean', '<p>Fogg Body spray Blue Ocean</p>', 435.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838656Fogg Body spray Blue Ocean.jpg', NULL, NULL, '2020-03-10 05:10:56', '2020-08-27 10:22:52'),
(534, 1, 143, 4, 30, NULL, '0532', 'Fogg Fresh Spicy Body Spray', 'Fogg-Fresh-Spicy-Body-Spray', '<p>Fogg Fresh Spicy Body Spray</p>', 385.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838690Fogg Fresh Spicy Body Spray.jpg', NULL, NULL, '2020-03-10 05:11:30', '2020-08-27 10:22:52'),
(535, 1, 143, 4, 30, NULL, '0533', 'Fogg Scent Men Impressio', 'Fogg-Scent-Men-Impressio', '<p>Fogg Scent Men Impressio</p>', 815.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838751Fogg Scent Men Impressio.jpg', NULL, NULL, '2020-03-10 05:12:31', '2020-08-27 10:22:52'),
(536, 1, 143, 4, 30, NULL, '0534', 'Fogg Blue Forest Body Spray', 'Fogg-Blue-Forest-Body-Spray', '<p>Fogg Blue Forest Body Spray</p>', 435.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838876Fogg Blue Forest Body Spray.jpg', NULL, NULL, '2020-03-10 05:14:36', '2020-08-27 10:22:52'),
(537, 1, 143, 4, 30, NULL, '0535', 'Fogg Fresh Aqua Body Spray', 'Fogg-Fresh-Aqua-Body-Spray', '<p>Fogg Fresh Aqua Body Spray</p>', 385.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583838919Fogg Fresh Aqua Body Spray.jpg', NULL, NULL, '2020-03-10 05:15:19', '2020-08-27 10:22:52'),
(538, 1, 144, 4, 30, NULL, '0536', 'Denim Aqua Body Spray', 'Denim-Aqua-Body-Spray', '<p>Denim Aqua Body Spray</p>', 250.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583839004Denim Aqua Body Spray.jpg', NULL, NULL, '2020-03-10 05:16:44', '2020-08-27 10:22:52'),
(539, 1, 144, 4, 30, NULL, '0537', 'Denim Musk Body Spray', 'Denim-Musk-Body-Spray', '<p>Denim Musk Body Spray</p>', 250.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583839038Denim Musk Body Spray.jpg', NULL, NULL, '2020-03-10 05:17:18', '2020-08-27 10:22:52'),
(540, 1, 144, 4, 30, NULL, '0538', 'Denim Black Body Spray', 'Denim-Black-Body-Spray', '<p>Denim Black Body Spray</p>', 260.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583839087Denim Black Body Spray.jpg', NULL, NULL, '2020-03-10 05:18:07', '2020-08-27 10:22:52'),
(541, 1, 145, 4, 30, NULL, '0539', 'Havoc Gold Deodorant Spray', 'Havoc-Gold-Deodorant-Spray', '<p>Havoc Gold Deodorant Spray</p>', 290.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583839788Havoc Gold Deodorant Spray.jpg', NULL, NULL, '2020-03-10 05:29:48', '2020-08-27 10:22:52'),
(542, 1, 145, 4, 30, NULL, '0540', 'Havoc Deodorant Spray', 'Havoc-Deodorant-Spray', '<p>Havoc Deodorant Spray</p>', 290.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583839842Havoc Deodorant Spray.jpg', NULL, NULL, '2020-03-10 05:30:42', '2020-08-27 10:22:52'),
(543, 1, 122, 4, 30, NULL, '0541', 'Dove Go Fresh Roll On', 'Dove-Go-Fresh-Roll-On', '<p>Dove Go Fresh Roll-On</p>', 220.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583839893Dove Go Fresh Roll On.jpg', NULL, NULL, '2020-03-10 05:31:33', '2020-08-27 10:22:52'),
(544, 1, 146, 4, 30, NULL, '0542', 'Yardley English Rose Deodorant Roll On', 'Yardley-English-Rose-Deodorant-Roll-On', '<p>Yardley English Rose Deodorant Roll On</p>', 195.00, '50ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840023Yardley English Rose Deodorant Roll On.jpg', NULL, NULL, '2020-03-10 05:33:43', '2020-08-27 10:22:52'),
(545, 1, 147, 4, 30, NULL, '0543', 'Adidas Pure Game Body Spray', 'Adidas-Pure-Game-Body-Spray', '<p>Adidas Pure Game Body Spray</p>', 270.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840307Adidas Pure Game Body Spray.jpg', NULL, NULL, '2020-03-10 05:38:27', '2020-08-27 10:22:52'),
(546, 1, 147, 4, 30, NULL, '0544', 'Adidas Ice Dive Body Spray', 'Adidas-Ice-Dive-Body-Spray', '<p>Adidas Ice Dive Body Spray</p>', 270.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840350Adidas Ice Dive Body Spray.jpg', NULL, NULL, '2020-03-10 05:39:10', '2020-08-27 10:22:52'),
(547, 1, 147, 4, 30, NULL, '0545', 'Adidas Intense Touch Body Spray', 'Adidas-Intense-Touch-Body-Spray', '<p>Adidas Intense Touch Body Spray</p>', 270.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840383Adidas Intense Touch Body Spray.jpg', NULL, NULL, '2020-03-10 05:39:43', '2020-08-27 10:22:52'),
(548, 1, 147, 4, 30, NULL, '0546', 'Adidas Victory League', 'Adidas-Victory-League', '<p>Adidas Victory League</p>', 260.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840421Adidas Victory League.jpg', NULL, NULL, '2020-03-10 05:40:21', '2020-08-27 10:22:52'),
(549, 1, 148, 4, 30, NULL, '0547', 'Wild Stone Body Perfume Steel', 'Wild-Stone-Body-Perfume-Steel', '<p>Wild Stone Body Perfume Steel</p>', 395.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840509Wild Stone Body Perfume Steel.jpg', NULL, NULL, '2020-03-10 05:41:49', '2020-08-27 10:22:52'),
(550, 1, 148, 4, 30, NULL, '0548', 'Wild Stone Hydra Energy Body Spray', 'Wild-Stone-Hydra-Energy-Body-Spray', '<p>Wild Stone Hydra Energy Body Spray</p>', 290.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840692Wild Stone Hydra Energy Body Spray.jpg', NULL, NULL, '2020-03-10 05:44:52', '2020-08-27 10:22:52'),
(551, 1, 148, 4, 30, NULL, '0549', 'Wild Stone Legend Body Deodorant', 'Wild-Stone-Legend-Body-Deodorant', '<p>Wild Stone Legend Body Deodorant</p>', 290.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840731Wild Stone Legend Body Deodorant.jpg', NULL, NULL, '2020-03-10 05:45:31', '2020-08-27 10:22:52'),
(552, 1, 148, 4, 30, NULL, '0550', 'Wild Stone Body Perfume Titanium', 'Wild-Stone-Body-Perfume-Titanium', '<p>Wild Stone Body Perfume Titanium</p>', 395.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840769Wild Stone Body Perfume Titanium.jpg', NULL, NULL, '2020-03-10 05:46:09', '2020-08-27 10:22:52'),
(553, 1, 148, 4, 30, NULL, '0551', 'Wild Stone Forest Spice Deodorant', 'Wild-Stone-Forest-Spice-Deodorant', '<p>Wild Stone Forest Spice Deodorant</p>', 290.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840860Wild Stone Forest Spice Deodorant.jpg', NULL, NULL, '2020-03-10 05:47:40', '2020-08-27 10:22:52'),
(554, 1, 149, 4, 30, NULL, '0552', 'Engage On Man Pocket Perfume (Classic Woody)', 'Engage-On-Man-Pocket-Perfume-(Classic-Woody)', '<p>Engage On Man Pocket Perfume (Classic Woody)</p>', 120.00, '18ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583840916Engage On Man Pocket Perfume (Classic Woody).jpg', NULL, NULL, '2020-03-10 05:48:36', '2020-08-27 10:22:52'),
(555, 1, 149, 4, 30, NULL, '0553', 'Engage On Man Pocket Perfume (Cool Marine)', 'Engage-On-Man-Pocket-Perfume-(Cool-Marine)', '<p>Engage On Man Pocket Perfume (Cool Marine)</p>', 120.00, '18ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583841029Engage On Man Pocket Perfume (Cool Marine).jpg', NULL, NULL, '2020-03-10 05:50:29', '2020-08-27 10:22:52'),
(556, 1, 149, 4, 30, NULL, '0554', 'Engage Woman Body Spray', 'Engage-Woman-Body-Spray', '<p>Engage Woman Body Spray</p>', 260.00, '150ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583841071Engage Woman Body Spray.jpg', NULL, NULL, '2020-03-10 05:51:11', '2020-08-27 10:22:52'),
(557, 1, 149, 4, 30, NULL, '0555', 'Layer Shot Bullet Burst', 'Layer-Shot-Bullet-Burst', '<p>Layer Shot Bullet Burst</p>', 320.00, '120ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583841102Layer Shot Bullet Burst.jpg', NULL, NULL, '2020-03-10 05:51:42', '2020-08-27 10:22:52'),
(558, 1, 151, 4, 30, NULL, '0556', 'Ossum Perfumed Body Mist Delight', 'Ossum-Perfumed-Body-Mist-Delight', '<p>Ossum Perfumed Body Mist Delight</p>', 345.00, '115ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1583841144Ossum Perfumed Body Mist Delight.jpg', NULL, NULL, '2020-03-10 05:52:24', '2020-08-27 10:22:52'),
(559, 1, 152, 4, 30, NULL, '0557', 'B8 Whisper Choice Ultra 6 pads', 'B8-Whisper-Choice-Ultra-6-pads', '<p>B8 Whisper Choice Ultra 6 pads</p>', 90.00, '6 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992326B8 Whisper Choice Ultra 6 pads.jpg', NULL, NULL, '2020-03-11 23:52:06', '2020-08-27 10:22:52'),
(560, 1, 152, 4, 30, NULL, '0558', 'B3 Whisper Maxi Nights Xl Wings 15 Pads', 'B3-Whisper-Maxi-Nights-Xl-Wings-15-Pads', '<p>B3 Whisper Maxi Nights Xl Wings 15 Pads</p>', 253.00, '15 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992368B3 Whisper Maxi Nights Xl Wings 15 Pads.jpg', NULL, NULL, '2020-03-11 23:52:48', '2020-08-27 10:22:52'),
(561, 1, 152, 4, 30, NULL, '0559', 'B6 Whisper Ultra Clean XL Wings 15 Pads', 'B6-Whisper-Ultra-Clean-XL-Wings-15-Pads', '<p>B6 Whisper Ultra Clean XL Wings 15 Pads</p>', 253.00, '15 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992751B6 Whisper Ultra Clean XL Wings 15 Pads.jpg', NULL, NULL, '2020-03-11 23:59:11', '2020-08-27 10:22:52'),
(562, 1, 152, 4, 30, NULL, '0560', 'B7 Whisper Choice Wings 7 Pads', 'B7-Whisper-Choice-Wings-7-Pads', '<p>B7 Whisper Choice Wings 7 Pads</p>', 75.00, '7 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992791B7 Whisper Choice Wings 7 Pads.jpg', NULL, NULL, '2020-03-11 23:59:51', '2020-08-27 10:22:52'),
(563, 1, 152, 4, 30, NULL, '0561', 'B4 Whisper Maxi Nights XL Wings 7 Pads', 'B4-Whisper-Maxi-Nights-XL-Wings-7-Pads', '<p>B4 Whisper Maxi Nights XL Wings 7 Pads</p>', 133.00, '7 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992832B4 Whisper Maxi Nights XL Wings 7 Pads.jpg', NULL, NULL, '2020-03-12 00:00:32', '2020-08-27 10:22:52'),
(564, 1, 152, 4, 30, NULL, '0562', 'B5 Whisper Ultra 8 Pads', 'B5-Whisper-Ultra-8-Pads', '<p>B5 Whisper Ultra 8 Pads</p>', 141.00, '8 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992869B5 Whisper Ultra 8 Pads.jpg', NULL, NULL, '2020-03-12 00:01:09', '2020-08-27 10:22:52'),
(565, 1, 152, 4, 30, NULL, '0563', 'B1 Whisper Maxi Fit 15 Pads', 'B1-Whisper-Maxi-Fit-15-Pads', '<p>B1 Whisper Maxi Fit 15 Pads</p>', 253.00, '5 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992907B1 Whisper Maxi Fit 15 Pads.jpg', NULL, NULL, '2020-03-12 00:01:47', '2020-08-27 10:22:52'),
(566, 1, 152, 4, 30, NULL, '0564', 'B2 Whisper Maxi Fit 8 Pads', 'B2-Whisper-Maxi-Fit-8-Pads', '<p>B2 Whisper Maxi Fit 8 Pads</p>', 133.00, '8 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992943B2 Whisper Maxi Fit 8 Pads.jpg', NULL, NULL, '2020-03-12 00:02:23', '2020-08-27 10:22:52'),
(567, 1, 152, 4, 30, NULL, '0565', 'AF4 Whisper Ultra Clean XL Wings 8 Pads', 'AF4-Whisper-Ultra-Clean-XL-Wings-8-Pads', '<p>AF4 Whisper Ultra Clean XL Wings 8 Pads</p>', 141.00, '8 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583992993AF4 Whisper Ultra Clean XL Wings 8 Pads.jpg', NULL, NULL, '2020-03-12 00:03:13', '2020-08-27 10:22:52'),
(568, 1, 153, 4, 30, NULL, '0566', 'C4 Senora Sanitary Napkin (Panty) 15 pcs', 'C4-Senora-Sanitary-Napkin-(Panty)-15-pcs', '<p>C4 Senora Sanitary Napkin (Panty) 15 pcs</p>', 130.00, '15 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993214C4 Senora Sanitary Napkin (Panty) 15 pcs.jpg', NULL, NULL, '2020-03-12 00:06:54', '2020-08-27 10:22:52'),
(569, 1, 153, 4, 30, NULL, '0567', 'C8 Senora Confidence Regular Flow (Panty System) 16 pcs', 'C8-Senora-Confidence-Regular-Flow-(Panty-System)-16-pcs', '<p>C8 Senora Confidence Regular Flow (Panty System) 16 pcs</p>', 160.00, '16 Ps', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993258C8 Senora Confidence Regular Flow (Panty System) 16 pcs.jpg', NULL, NULL, '2020-03-12 00:07:38', '2020-08-27 10:22:52'),
(570, 1, 153, 4, 30, NULL, '0568', 'C5 Senora Sanitary Napkin (Belt 15 pcs', 'C5-Senora-Sanitary-Napkin-(Belt-15-pcs', '<p>C5 Senora Sanitary Napkin (Belt 15 pcs</p>', 130.00, '15 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993300C5 Senora Sanitary Napkin (Belt 15 pcs.jpg', NULL, NULL, '2020-03-12 00:08:20', '2020-08-27 10:22:52'),
(571, 1, 153, 4, 30, NULL, '0569', 'C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs', 'C3-Senora-Sanitary-Napkin-Regular-Flow-(Belt)-10-pcs', '<p>C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs</p>', 100.00, '10 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993342C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs.jpg', NULL, NULL, '2020-03-12 00:09:02', '2020-08-27 10:22:52'),
(572, 1, 153, 4, 30, NULL, '0570', 'C9 Senora Confidence Regular Flow (Panty System) 10 pcs', 'C9-Senora-Confidence-Regular-Flow-(Panty-System)-10-pcs', '<p>C9 Senora Confidence Regular Flow (Panty System) 10 pcs</p>', 120.00, '10 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993389C9 Senora Confidence Regular Flow (Panty System) 10 pcs.jpg', NULL, NULL, '2020-03-12 00:09:49', '2020-08-27 10:22:52'),
(573, 1, 153, 4, 30, NULL, '0571', 'C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs', 'C2-Senora-Sanitary-Napkin-Regular-Flow-(Panty)-10-pcs', '<p>C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs</p>', 100.00, '10 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993429C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs.jpg', NULL, NULL, '2020-03-12 00:10:29', '2020-08-27 10:22:52'),
(574, 1, 153, 4, 30, NULL, '0572', 'C1 Senora Ultra-thin Heavy Flow 8 pcs', 'C1-Senora-Ultra-thin-Heavy-Flow-8-pcs', '<p>C1 Senora Ultra-thin Heavy Flow 8 pcs</p>', 110.00, '8 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993622C1 Senora Ultra-thin Heavy Flow 8 pcs.jpg', NULL, NULL, '2020-03-12 00:13:42', '2020-08-27 10:22:52'),
(575, 1, 78, 4, 30, NULL, '0573', 'A8 ACI Freedom Heavy Flow Wings 16 Pads', 'A8-ACI-Freedom-Heavy-Flow-Wings-16-Pads', '<p>A8 ACI Freedom Heavy Flow Wings 16 Pads</p>', 200.00, '16 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993672A8 ACI Freedom Heavy Flow Wings 16 Pads.jpg', NULL, NULL, '2020-03-12 00:14:32', '2020-08-27 10:22:52'),
(576, 1, 78, 4, 30, NULL, '0574', 'A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads', 'A10-ACI-Freedom-Heavy-Flow-Sanitary-Napkin-8-Pads', '<p>A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads</p>', 110.00, '8 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993746A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads.jpg', NULL, NULL, '2020-03-12 00:15:46', '2020-08-27 10:22:52'),
(577, 1, 78, 4, 30, NULL, '0575', 'Freedom Pregnancy Test 1 Strip', 'Freedom-Pregnancy-Test-1-Strip', '<p>Freedom Pregnancy Test 1 Strip</p>', 18.00, '1 Strip', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993795Freedom Pregnancy Test 1 Strip.jpg', NULL, NULL, '2020-03-12 00:16:35', '2020-08-27 10:22:52'),
(578, 1, 78, 4, 30, NULL, '0576', 'A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads', 'A6-ACI-Freedom-Regular-Flow-Non-Wing-Popular-8-pads', '<p>A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads</p>', 40.00, '8 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993897A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads.jpg', NULL, NULL, '2020-03-12 00:18:17', '2020-08-27 10:22:52'),
(579, 1, 78, 4, 30, NULL, '0577', 'Freedom Pregnancy Test Tool Set', 'Freedom-Pregnancy-Test-Tool-Set', '<p>Freedom Pregnancy Test Tool Set</p>', 65.00, '1Set', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993938Freedom Pregnancy Test Tool Set.jpg', NULL, NULL, '2020-03-12 00:18:58', '2020-08-27 10:22:52'),
(580, 1, 78, 4, 30, NULL, '0578', 'Gillette Venus Woman Razor (Buy 1 Get 1 Offer)', 'Gillette-Venus-Woman-Razor-(Buy-1-Get-1-Offer)', '<p>Gillette Venus Woman Razor (Buy 1 Get 1 Offer)</p>', 140.00, '1 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583993996Gillette Venus Woman Razor (Buy 1 Get 1 Offe.jpg', NULL, NULL, '2020-03-12 00:19:56', '2020-08-27 10:22:52'),
(581, 1, 78, 4, 30, NULL, '0579', 'A3 ACI Freedom Regular Flow Wings 10 pads', 'A3-ACI-Freedom-Regular-Flow-Wings-10-pads', '<p>A3 ACI Freedom Regular Flow Wings 10 pads</p>', 110.00, '10 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583994037A3 ACI Freedom Regular Flow Wings 10 pads.jpg', NULL, NULL, '2020-03-12 00:20:37', '2020-08-27 10:22:52'),
(582, 1, 78, 4, 30, NULL, '0580', 'A14 Freedom Teens Ultra Chic Soft Sanitary Napkin', 'A14-Freedom-Teens-Ultra-Chic-Soft-Sanitary-Napkin', '<p>A14 Freedom Teens Ultra Chic Soft Sanitary Napkin</p>', 55.00, '1 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1583994198A14 Freedom Teens Ultra Chic Soft Sanitary Napkin.jpg', NULL, NULL, '2020-03-12 00:23:18', '2020-08-27 10:22:52'),
(583, 1, 78, 4, 30, NULL, '0581', 'A4 ACI Freedom Regular Flow Panty 15 pads', 'A4-ACI-Freedom-Regular-Flow-Panty-15-pads', '<p>A4 ACI Freedom Regular Flow Panty 15 pads</p>', 115.00, '15 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583994235A4 ACI Freedom Regular Flow Panty 15 pads.jpg', NULL, NULL, '2020-03-12 00:23:55', '2020-08-27 10:22:52'),
(584, 1, 78, 4, 30, NULL, '0582', 'A11 ACI Savlon Freedom Regular Flow Belt System 15 pads', 'A11-ACI-Savlon-Freedom-Regular-Flow-Belt-System-15-pads', '<p>A11 ACI Savlon Freedom Regular Flow Belt System 15 pads</p>', 115.00, '15 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583994273A11 ACI Savlon Freedom Regular Flow Belt System 15 pads.jpg', NULL, NULL, '2020-03-12 00:24:33', '2020-08-27 10:22:52'),
(585, 1, 78, 4, 30, NULL, '0583', 'A7 ACI Freedom Regular Flow Belt 10 pads', 'A7-ACI-Freedom-Regular-Flow-Belt-10-pads', '<p>A7 ACI Freedom Regular Flow Belt 10 pads</p>', 90.00, '10 Pads', NULL, NULL, 'In Stock', 100, NULL, 0, '1583994309A7 ACI Freedom Regular Flow Belt 10 pads.jpg', NULL, NULL, '2020-03-12 00:25:09', '2020-08-27 10:22:52'),
(586, 1, 8, 1, 2, NULL, '0584', 'complan creamy classic plain Bib', 'complan-creamy-classic-plain-Bib', '<p>complan creamy classic plain Bib</p>', 360.00, '350gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1594202927complan boy.jpg', NULL, NULL, '2020-03-12 23:20:50', '2020-08-27 10:22:52'),
(587, 1, 8, 1, 2, NULL, '0585', 'Complan Chocholate', 'Complan-Chocholate', '<p>Complan Chocholate</p>', 540.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584076924Complan Chocholate.jpg', NULL, NULL, '2020-03-12 23:22:04', '2020-08-27 10:22:52'),
(588, 1, 8, 1, 2, NULL, '0586', 'Complan Chocholate', 'Complan-Chocholate', '<p>Complan Chocholate</p>', 385.00, '350gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077139Complan Chocholate.jpg', NULL, NULL, '2020-03-12 23:25:39', '2020-08-27 10:22:52'),
(589, 1, 8, 1, 2, NULL, '0587', 'Complan Chocholate', 'Complan-Chocholate', '<p>Complan Chocholate</p>', 250.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077172Complan Chocholate.jpg', NULL, NULL, '2020-03-12 23:26:12', '2020-08-27 10:22:52'),
(590, 1, 9, 1, 2, NULL, '0588', 'ovaltine malted chocolate drink jar', 'ovaltine-malted-chocolate-drink-jar', '<p>ovaltine malted chocolate drink jar</p>', 325.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077220ovaltine malted chocolate drink jar.jpg', NULL, NULL, '2020-03-12 23:27:00', '2020-08-27 10:22:52'),
(591, 1, 10, 1, 2, NULL, '0589', 'Horlicks jar', 'Horlicks-jar', '<p>Horlicks jar</p>', 395.00, '550gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077272Horlicks jar.jpg', NULL, NULL, '2020-03-12 23:27:52', '2020-08-27 10:22:52'),
(592, 1, 10, 1, 2, NULL, '0590', 'chokholate Horlicks jar', 'chokholate-Horlicks-jar', '<p>chokholate Horlicks jar</p>', 395.00, '550gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077352chokholate Horlicks jar.jpg', NULL, NULL, '2020-03-12 23:29:12', '2020-08-27 10:22:52'),
(593, 1, 10, 1, 2, NULL, '0591', 'womens Horlicks jar', 'womens-Horlicks-jar', '<p>womens Horlicks jar</p>', 480.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077389womens Horlicks jar.jpg', NULL, NULL, '2020-03-12 23:29:49', '2020-08-27 10:22:52'),
(594, 1, 10, 1, 2, NULL, '0592', 'Mothers Horlicks Bib', 'Mothers-Horlicks-Bib', '<p>Mothers Horlicks Bib</p>', 490.00, '350gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077439Mothers Horlicks Bib.jpg', NULL, NULL, '2020-03-12 23:30:39', '2020-08-27 10:22:52'),
(595, 1, 10, 1, 2, NULL, '0593', 'Horlicks refill', 'Horlicks-refill', '<p>Horlicks refill</p>', 375.00, '550gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077481Horlicks refill.jpg', NULL, NULL, '2020-03-12 23:31:21', '2020-08-27 10:22:52'),
(596, 1, 10, 1, 2, NULL, '0594', 'Horlicks Grouth plus', 'Horlicks-Grouth-plus', '<p>Horlicks Grouth plus</p>', 840.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077539Horlicks Grouth plus.jpg', NULL, NULL, '2020-03-12 23:32:19', '2020-08-27 10:22:52'),
(597, 1, 11, 1, 2, NULL, '0595', 'cadbury bourn vita', 'cadbury-bourn-vita', '<p>cadbury bourn vita</p>', 450.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077615cadbury bourn vita.jpg', NULL, NULL, '2020-03-12 23:33:35', '2020-08-27 10:22:52'),
(598, 1, 12, 1, 2, NULL, '0596', 'Nestle Nesquik Strawberry powder', 'Nestle-Nesquik-Strawberry-powder', '<p>Nestle Nesquik Strawberry powder</p>', 305.00, '300gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077671Nestle Nesquik Strawberry powder.jpg', NULL, NULL, '2020-03-12 23:34:31', '2020-08-27 10:22:52'),
(599, 1, 12, 1, 2, NULL, '0597', 'Nestle nestum higher in whole grain ceral milk drink', 'Nestle-nestum-higher-in-whole-grain-ceral-milk-drink', '<p>Nestle nestum higher in whole grain ceral milk drink</p>', 850.00, '504gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077781Nestle nestum higher in whole grain ceral milk drink.jpg', NULL, NULL, '2020-03-12 23:36:21', '2020-08-27 10:22:52'),
(600, 1, 12, 1, 2, NULL, '0598', 'Nestle nestum higher in whole grain ceral milk drink', 'Nestle-nestum-higher-in-whole-grain-ceral-milk-drink', '<p>Nestle nestum higher in whole grain ceral milk drink</p>', 815.00, '405gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584077856Nestle nestum higher in whole grain ceral milk drink.jpg', NULL, NULL, '2020-03-12 23:37:36', '2020-08-27 10:22:52'),
(601, 1, 154, 1, 2, NULL, '0599', 'Quality brown premium egg', 'Quality-brown-premium-egg', '<p>Quality brown premium egg</p>', 145.00, '12 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078013Quality brown premium egg.jpg', NULL, NULL, '2020-03-12 23:40:13', '2020-08-27 10:22:52'),
(602, 1, 13, 1, 2, NULL, '0600', 'Purnava vitamin egg', 'Purnava-vitamin-egg', '<p>Purnava vitamin egg</p>', 162.00, '12 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078061Purnava vitamin egg.jpg', NULL, NULL, '2020-03-12 23:41:01', '2020-08-27 10:22:52'),
(603, 1, 13, 1, 2, NULL, '0601', 'purnava omega 3 enriched egg', 'purnava-omega-3-enriched-egg', '<p>purnava omega 3 enriched egg</p>', 221.00, '12 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078119purnava omega 3 enriched egg.jpg', NULL, NULL, '2020-03-12 23:41:59', '2020-08-27 10:22:52'),
(604, 1, 12, 1, 2, NULL, '0602', 'Nestle koko krunch cereals box (FREE maggi 2 min thai soup)', 'Nestle-koko-krunch-cereals-box-(FREE-maggi-2-min-thai-soup)', '<p>Nestle koko krunch cereals box (FREE maggi 2 min thai soup)</p>', 350.00, '330gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078305Nestle koko krunch cereals box (FREE maggi 2 min thai soup).jpg', NULL, NULL, '2020-03-12 23:45:05', '2020-08-27 10:22:52'),
(605, 1, 12, 1, 2, NULL, '0603', 'nestle corn flakes breakfast cereal box', 'nestle-corn-flakes-breakfast-cereal-box', '<p>nestle corn flakes breakfast cereal box</p>', 330.00, '275gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078356nestle corn flakes breakfast cereal box.jpg', NULL, NULL, '2020-03-12 23:45:56', '2020-08-27 10:22:52'),
(606, 1, 12, 1, 2, NULL, '0604', 'Nestle koko krunch Duo cereals box', 'Nestle-koko-krunch-Duo-cereals-box', '<p>Nestle koko krunch Duo cereals box</p>', 350.00, '330gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078403Nestle koko krunch Duo cereals box.jpg', NULL, NULL, '2020-03-12 23:46:43', '2020-08-27 10:22:52'),
(607, 1, 12, 1, 2, NULL, '0605', 'nestle MILO breakfast chocolate cereal box', 'nestle-MILO-breakfast-chocolate-cereal-box', '<p>nestle MILO breakfast chocolate cereal box</p>', 450.00, '330gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078510nestle MILO breakfast chocolate cereal box.jpg', NULL, NULL, '2020-03-12 23:48:30', '2020-08-27 10:22:52'),
(608, 1, 12, 1, 2, NULL, '0606', 'nestle corn flakes breakfast cereal box (FREE maggi masala noodles)', 'nestle-corn-flakes-breakfast-cereal-box-(FREE-maggi-masala-noodles)', '<p>nestle corn flakes breakfast cereal box (FREE maggi masala noodles)</p>', 330.00, '275gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078545nestle corn flakes breakfast cereal box (FREE maggi masala noodles).jpg', NULL, NULL, '2020-03-12 23:49:05', '2020-08-27 10:22:52'),
(609, 1, 14, 1, 2, NULL, '0607', 'quaker oats poly', 'quaker-oats-poly', '<p>quaker oats poly</p>', 265.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078583quaker oats poly.jpg', NULL, NULL, '2020-03-12 23:49:43', '2020-08-27 10:22:52'),
(610, 1, 14, 1, 2, NULL, '0608', 'quaker oats australia', 'quaker-oats-australia', '<p>quaker oats australia</p>', 575.00, '1kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078615quaker oats australia.jpg', NULL, NULL, '2020-03-12 23:50:15', '2020-08-27 10:22:52'),
(611, 1, 14, 1, 2, NULL, '0609', 'quaker white oats', 'quaker-white-oats', '<p>quaker white oats</p>', 320.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078713quaker white oats.jpg', NULL, NULL, '2020-03-12 23:51:53', '2020-08-27 10:22:52'),
(612, 1, 14, 1, 2, NULL, '0610', 'quaker instant oatmeal jar', 'quaker-instant-oatmeal-jar', '<p>quaker instant oatmeal jar</p>', 650.00, '1kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1594202652dfgghhkjgf.jpg', NULL, NULL, '2020-03-12 23:52:26', '2020-08-27 10:22:52'),
(613, 1, 15, 1, 2, NULL, '0611', 'quaker instant oatmeal jar', 'quaker-instant-oatmeal-jar', '<p>quaker instant oatmeal jar</p>', 199.00, '180gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1594202776dfgghhkjgf.jpg', NULL, NULL, '2020-03-12 23:53:10', '2020-08-27 10:22:52'),
(614, 1, 15, 1, 2, NULL, '0612', 'Kelloggs chocos fills centre filled pillows', 'Kelloggs-chocos-fills-centre-filled-pillows', '<p>Kelloggs chocos fills centre filled pillows</p>', 199.00, '180gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078826Kelloggs chocos fills centre filled pillows.jpg', NULL, NULL, '2020-03-12 23:53:46', '2020-08-27 10:22:52'),
(615, 1, 16, 1, 2, NULL, '0613', 'sajeeb corn flakes', 'sajeeb-corn-flakes', '<p>sajeeb corn flakes</p>', 155.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584078872sajeeb corn flakes.jpg', NULL, NULL, '2020-03-12 23:54:32', '2020-08-27 10:22:52'),
(616, 1, 17, 1, 2, NULL, '0614', 'shezan choko crunch', 'shezan-choko-crunch', '<p>shezan choko crunch</p>', 190.00, '170gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079253shezan choko crunch.jpg', NULL, NULL, '2020-03-13 00:00:53', '2020-08-27 10:22:52'),
(617, 1, 18, 1, 2, NULL, '0615', 'vitalia sugar free corn flakes', 'vitalia-sugar-free-corn-flakes', '<p>vitalia sugar free corn flakes</p>', 465.00, '300gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079326vitalia sugar free corn flakes.jpg', NULL, NULL, '2020-03-13 00:02:06', '2020-08-27 10:22:52'),
(618, 1, 18, 1, 2, NULL, '0616', 'vitalia fit & active muesli', 'vitalia-fit-&-active-muesli', '<p>vitalia fit &amp; active muesli</p>', 636.00, '650gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079391vitalia fit & active muesli.jpg', NULL, NULL, '2020-03-13 00:03:11', '2020-08-27 10:22:52'),
(619, 1, 19, 1, 2, NULL, '0617', 'Premuim grade fruit & nut muesli', 'Premuim-grade-fruit-&-nut-muesli', '<p>Premuim grade fruit &amp; nut muesli</p>', 650.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079442Premuim grade fruit & nut muesli.jpg', NULL, NULL, '2020-03-13 00:04:02', '2020-08-27 10:22:52'),
(620, 1, 19, 1, 2, NULL, '0618', 'Premuim grade blueberry muesli', 'Premuim-grade-blueberry-muesli', '<p>Premuim grade blueberry muesli</p>', 650.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079475Premuim grade blueberry muesli.jpg', NULL, NULL, '2020-03-13 00:04:35', '2020-08-27 10:22:52'),
(621, 1, 19, 1, 2, NULL, '0619', 'Premuim grade canberry muesli', 'Premuim-grade-canberry-muesli', '<p>Premuim grade canberry muesli</p>', 650.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079881Premuim grade blueberry muesli.jpg', NULL, NULL, '2020-03-13 00:11:21', '2020-08-27 10:22:52'),
(622, 1, 19, 1, 2, NULL, '0620', 'Premuim grade apricot muesli', 'Premuim-grade-apricot-muesli', '<p>Premuim grade apricot muesli</p>', 650.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584079957Premuim grade apricot muesli.jpg', NULL, NULL, '2020-03-13 00:12:37', '2020-08-27 10:22:52'),
(623, 1, 19, 1, 2, NULL, '0621', 'Premuim grade fig muesli', 'Premuim-grade-fig-muesli', '<p>Premuim grade fig muesli</p>', 650.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584080041Premuim grade fig muesli.jpg', NULL, NULL, '2020-03-13 00:14:01', '2020-08-27 10:22:52'),
(624, 1, 20, 1, 2, NULL, '0622', 'IKO premium sugar free oatmeal crackers original', 'IKO-premium-sugar-free-oatmeal-crackers-original', '<p>IKO premium sugar free oatmeal crackers original</p>', 345.00, '178gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1594203063image1.jpg', NULL, NULL, '2020-03-13 00:14:37', '2020-08-27 10:22:52'),
(625, 1, 21, 1, 2, NULL, '0623', 'Milk vita Butter', 'Milk-vita-Butter', '<p>Milk vita Butter</p>', 176.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584091291Milk vita Butter.jpg', NULL, NULL, '2020-03-13 03:21:31', '2020-08-27 10:22:52'),
(626, 1, 4, 1, 2, NULL, '0624', 'Pran butter (fresco container)', 'Pran-butter-(fresco-container)', '<p>Pran butter (fresco container)</p>', 180.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584091333Pran butter (fresco container).jpg', NULL, NULL, '2020-03-13 03:22:13', '2020-08-27 10:22:52'),
(627, 1, 4, 1, 2, NULL, '0625', 'pran mango jam', 'pran-mango-jam', '<p>pran mango jam</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584091373pran mango jam.jpg', NULL, NULL, '2020-03-13 03:22:53', '2020-08-27 10:22:52'),
(628, 1, 4, 1, 2, NULL, '0626', 'pran mango jam', 'pran-mango-jam', '<p>pran mango jam</p>', 110.00, '375gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584091404pran mango jam.jpg', NULL, NULL, '2020-03-13 03:23:24', '2020-08-27 10:22:52'),
(629, 1, 24, 1, 2, NULL, '0627', 'alfa mayoannaise', 'alfa-mayoannaise', '<p>alfa mayoannaise</p>', 125.00, '236gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584091538alfa mayoannaise.jpg', NULL, NULL, '2020-03-13 03:25:38', '2020-08-27 10:22:52'),
(630, 1, 24, 1, 2, NULL, '0628', 'alfa mayoannaise', 'alfa-mayoannaise', '<p>alfa mayoannaise</p>', 215.00, '473ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584091794alfa mayoannaise.jpg', NULL, NULL, '2020-03-13 03:29:54', '2020-08-27 10:22:52'),
(631, 1, 23, 1, 2, NULL, '0629', 'Harman mayonnaise', 'Harman-mayonnaise', '<p>Harman mayonnaise</p>', 135.00, '236ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092213Harman mayonnaise.jpg', NULL, NULL, '2020-03-13 03:36:53', '2020-08-27 10:22:52'),
(632, 1, 23, 1, 2, NULL, '0630', 'Harman mayonnaise', 'Harman-mayonnaise', '<p>Harman mayonnaise</p>', 245.00, '473ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092251Harman mayonnaise.jpg', NULL, NULL, '2020-03-13 03:37:31', '2020-08-27 10:22:52'),
(633, 1, 23, 1, 2, NULL, '0631', 'harman peanut butter creamy', 'harman-peanut-butter-creamy', '<p>harman peanut butter creamy</p>', 325.00, '340gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092449harman peanut butter creamy.jpg', NULL, NULL, '2020-03-13 03:40:49', '2020-08-27 10:22:52'),
(634, 1, 25, 1, 2, NULL, '0632', 'calypso mayonnaise', 'calypso-mayonnaise', '<p>calypso mayonnaise</p>', 200.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092491calypso mayonnaise.jpg', NULL, NULL, '2020-03-13 03:41:31', '2020-08-27 10:22:52'),
(635, 1, 25, 1, 2, NULL, '0633', 'calypso mayonnaise', 'calypso-mayonnaise', '<p>calypso mayonnaise</p>', 375.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092529calypso mayonnaise.jpg', NULL, NULL, '2020-03-13 03:42:09', '2020-08-27 10:22:52'),
(636, 1, 25, 1, 2, NULL, '0634', 'foster clarks orange jelly', 'foster-clarks-orange-jelly', '<p>foster clarks orange jelly</p>', 75.00, '85gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092565foster clarks orange jelly.jpg', NULL, NULL, '2020-03-13 03:42:45', '2020-08-27 10:22:52'),
(637, 1, 25, 1, 2, NULL, '0635', 'foster clarks jam strawberry', 'foster-clarks-jam-strawberry', '<p>foster clarks jam strawberry</p>', 490.00, '450gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092601foster clarks jam strawberry.jpg', NULL, NULL, '2020-03-13 03:43:21', '2020-08-27 10:22:52'),
(638, 1, 25, 1, 2, NULL, '0636', 'foster clarks cherry jelly', 'foster-clarks-cherry-jelly', '<p>foster clarks cherry jelly</p>', 75.00, '85gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092644foster clarks cherry jelly.jpg', NULL, NULL, '2020-03-13 03:44:04', '2020-08-27 10:22:52'),
(639, 1, 25, 1, 2, NULL, '0637', 'foster clarks mango jelly', 'foster-clarks-mango-jelly', '<p>foster clarks mango jelly</p>', 75.00, '85gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092679foster clarks mango jelly.jpg', NULL, NULL, '2020-03-13 03:44:39', '2020-08-27 10:22:52'),
(640, 1, 25, 1, 2, NULL, '0638', 'foster clarks mixed fruit jam', 'foster-clarks-mixed-fruit-jam', '<p>foster clarks mixed fruit jam</p>', 490.00, '450gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584092724foster clarks mixed fruit jam.jpg', NULL, NULL, '2020-03-13 03:45:24', '2020-08-27 10:22:52'),
(641, 1, 26, 1, 2, NULL, '0639', 'crown peanut butter chunky', 'crown-peanut-butter-chunky', '<p>crown peanut butter chunky</p>', 480.00, '510gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584097954crown peanut butter chunky.jpg', NULL, NULL, '2020-03-13 05:12:34', '2020-08-27 10:22:52'),
(642, 1, 26, 1, 2, NULL, '0640', 'crown peanut butter smoot & creamy', 'crown-peanut-butter-smoot-&-creamy', '<p>crown peanut butter smoot &amp; creamy</p>', 480.00, '510gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584097999crown peanut butter smoot & creamy.jpg', NULL, NULL, '2020-03-13 05:13:19', '2020-08-27 10:22:52'),
(643, 1, 27, 1, 2, NULL, '0641', 'nocilla two colour chocolate', 'nocilla-two-colour-chocolate', '<p>nocilla two colour chocolate</p>', 250.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098087nocilla two colour chocolate.jpg', NULL, NULL, '2020-03-13 05:14:47', '2020-08-27 10:22:52'),
(644, 1, 28, 1, 2, NULL, '0642', 'nutella hazelnut cocoa spread', 'nutella-hazelnut-cocoa-spread', '<p>nutella hazelnut cocoa spread</p>', 950.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098224nutella hazelnut cocoa spread.jpg', NULL, NULL, '2020-03-13 05:17:04', '2020-08-27 10:22:52'),
(645, 1, 29, 1, 2, NULL, '0643', 'amul pasteurised butter', 'amul-pasteurised-butter', '<p>amul pasteurised butter</p>', 355.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098276amul pasteurised butter.jpg', NULL, NULL, '2020-03-13 05:17:56', '2020-08-27 10:22:52'),
(646, 1, 30, 1, 2, NULL, '0644', 'farm fresh Butter (50gm*4)', 'farm-fresh-Butter-(50gm*4)', '<p>farm fresh Butter (50gm*4)</p>', 184.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098338farm fresh Butter.jpg', NULL, NULL, '2020-03-13 05:18:58', '2020-08-27 10:22:52'),
(647, 1, 37, 1, 2, NULL, '0645', 'alamarai processed cream cheese', 'alamarai-processed-cream-cheese', '<p>alamarai processed cream cheese</p>', 700.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098500alamarai processed cream cheese.jpg', NULL, NULL, '2020-03-13 05:21:40', '2020-08-27 10:22:52'),
(648, 1, 31, 1, 2, NULL, '0646', 'Ruchi orange jam', 'Ruchi-orange-jam', '<p>Ruchi orange jam</p>', 130.00, '480gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098554Ruchi orange jam.jpg', NULL, NULL, '2020-03-13 05:22:34', '2020-08-27 10:22:52'),
(649, 1, 32, 1, 2, NULL, '0647', 'Ahmed orange jelly', 'Ahmed-orange-jelly', '<p>Ahmed orange jelly</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098654Ahmed orange jelly.jpg', NULL, NULL, '2020-03-13 05:24:14', '2020-08-27 10:22:52'),
(650, 1, 32, 1, 2, NULL, '0648', 'ahmed suger free apple jelly', 'ahmed-suger-free-apple-jelly', '<p>ahmed suger free apple jelly</p>', 160.00, '375gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1594202460ahmed sugar.jpg', NULL, NULL, '2020-03-13 05:25:12', '2020-08-27 10:22:52'),
(651, 1, 32, 1, 2, NULL, '0649', 'Ahmed mixed fruit jam', 'Ahmed-mixed-fruit-jam', '<p>Ahmed mixed fruit jam</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098752Ahmed mixed fruit jam.jpg', NULL, NULL, '2020-03-13 05:25:52', '2020-08-27 10:22:52'),
(652, 1, 32, 1, 2, NULL, '0650', 'ahmed suger free guava jelly', 'ahmed-suger-free-guava-jelly', '<p>ahmed suger free guava jelly</p>', 160.00, '375gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098789ahmed suger free guava jelly.jpg', NULL, NULL, '2020-03-13 05:26:29', '2020-08-27 10:22:52'),
(653, 1, 32, 1, 2, NULL, '0651', 'ahmed mixed fruit jelly', 'ahmed-mixed-fruit-jelly', '<p>ahmed mixed fruit jelly</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098855ahmed mixed fruit jelly.jpg', NULL, NULL, '2020-03-13 05:27:35', '2020-08-27 10:22:52'),
(654, 1, 32, 1, 2, NULL, '0652', 'ahmed pineapple jelly', 'ahmed-pineapple-jelly', '<p>ahmed pineapple jelly</p>', 125.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098890ahmed pineapple jelly.jpg', NULL, NULL, '2020-03-13 05:28:10', '2020-08-27 10:22:52'),
(655, 1, 32, 1, 2, NULL, '0653', 'ahmed guava jelly', 'ahmed-guava-jelly', '<p>ahmed guava jelly</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098936ahmed guava jelly.jpg', NULL, NULL, '2020-03-13 05:28:56', '2020-08-27 10:22:52');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(656, 1, 32, 1, 2, NULL, '0654', 'ahmed apple jam', 'ahmed-apple-jam', '<p>ahmed apple jam</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584098978ahmed apple jam.jpg', NULL, NULL, '2020-03-13 05:29:38', '2020-08-27 10:22:52'),
(657, 1, 32, 1, 2, NULL, '0655', 'ahmed mango jam', 'ahmed-mango-jam', '<p>ahmed mango jam</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099011ahmed mango jam.jpg', NULL, NULL, '2020-03-13 05:30:11', '2020-08-27 10:22:52'),
(658, 1, 32, 1, 2, NULL, '0656', 'ahmed pineapple jam', 'ahmed-pineapple-jam', '<p>ahmed pineapple jam</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099055ahmed pineapple jam.jpg', NULL, NULL, '2020-03-13 05:30:55', '2020-08-27 10:22:52'),
(659, 1, 36, 1, 2, NULL, '0657', 'Khushboo premium orange jelly', 'Khushboo-premium-orange-jelly', '<p>Khushboo premium orange jelly</p>', 125.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099119Khushboo premium orange jelly.jpg', NULL, NULL, '2020-03-13 05:31:59', '2020-08-27 10:22:52'),
(660, 1, 38, 1, 2, NULL, '0658', 'sundrop peanut butter jelly (GRAPe)', 'sundrop-peanut-butter-jelly-(GRAPe)', '<p>sundrop peanut butter jelly (GRAPe)</p>', 360.00, '340gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1594202311sundrop.jpg', NULL, NULL, '2020-03-13 05:32:47', '2020-08-27 10:22:52'),
(661, 1, 38, 1, 2, NULL, '0659', 'sundrop peanut butter crunchy', 'sundrop-peanut-butter-crunchy', '<p>sundrop peanut butter crunchy</p>', 390.00, '462gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099237sundrop peanut butter crunchy.jpg', NULL, NULL, '2020-03-13 05:33:57', '2020-08-27 10:22:52'),
(662, 1, 33, 1, 2, NULL, '0660', 'BD orange jelly', 'BD-orange-jelly', '<p>BD orange jelly</p>', 120.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099278BD orange jelly.jpg', NULL, NULL, '2020-03-13 05:34:38', '2020-08-27 10:22:52'),
(663, 1, 17, 1, 2, NULL, '0661', 'shezan orange jelly', 'shezan-orange-jelly', '<p>shezan orange jelly</p>', 120.00, '440gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099327shezan orange jelly.jpg', NULL, NULL, '2020-03-13 05:35:27', '2020-08-27 10:22:52'),
(664, 1, 155, 1, 2, NULL, '0662', 'American Green chunky peanut butter', 'American-Green-chunky-peanut-butter', '<p>American Green chunky peanut butter</p>', 455.00, '510gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099570American Green chunky peanut butter.jpg', NULL, NULL, '2020-03-13 05:39:30', '2020-08-27 10:22:52'),
(665, 1, 4, 1, 2, NULL, '0663', 'Pran puffed rice (MURI)', 'Pran-puffed-rice-(MURI)', '<p>Pran puffed rice (MURI)</p>', 60.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099644Pran puffed rice (MURI).jpg', NULL, NULL, '2020-03-13 05:40:44', '2020-08-27 10:22:52'),
(666, 1, 4, 1, 2, NULL, '0664', 'Pran puffed rice (MURI)', 'Pran-puffed-rice-(MURI)', '<p>Pran puffed rice (MURI)</p>', 32.00, '250gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099725Pran puffed rice (MURI).jpg', NULL, NULL, '2020-03-13 05:42:05', '2020-08-27 10:22:52'),
(667, 1, 4, 1, 2, NULL, '0665', 'Pran All time cream roll', 'Pran-All-time-cream-roll', '<p>Pran All time cream roll</p>', 70.00, '6 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099823Pran All time cream roll.jpg', NULL, NULL, '2020-03-13 05:43:43', '2020-08-27 10:22:52'),
(668, 1, 4, 1, 2, NULL, '0666', 'Pran fattened rice (chira)', 'Pran-fattened-rice-(chira)', '<p>Pran fattened rice (chira)</p>', 50.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584099859Pran fattened rice (chira).jpg', NULL, NULL, '2020-03-13 05:44:19', '2020-08-27 10:22:52'),
(669, 1, 39, 1, 2, NULL, '0667', 'Golden Harvest frozen paratha family pack', 'Golden-Harvest-frozen-paratha-family-pack', '<p>Golden Harvest frozen paratha family pack</p>', 250.00, '20 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584100000Golden Harvest frozen paratha family pack.jpg', NULL, NULL, '2020-03-13 05:46:40', '2020-08-27 10:22:52'),
(670, 1, 39, 1, 2, NULL, '0668', 'Golden Harvest aloo paratha', 'Golden-Harvest-aloo-paratha', '<p>Golden Harvest aloo paratha</p>', 70.00, '250gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584261472Golden Harvest aloo paratha.jpg', NULL, NULL, '2020-03-15 02:37:52', '2020-08-27 10:22:52'),
(671, 1, 39, 1, 2, NULL, '0669', 'Golden harvest mega deshi paratha', 'Golden-harvest-mega-deshi-paratha', '<p>Golden harvest mega deshi paratha</p>', 300.00, '20 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584262888Golden harvest mega deshi paratha.jpg', NULL, NULL, '2020-03-15 03:01:28', '2020-08-27 10:22:52'),
(672, 1, 40, 1, 2, NULL, '0670', 'cocola chocolate water roll jar', 'cocola-chocolate-water-roll-jar', '<p>cocola chocolate water roll jar</p>', 60.00, '280gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584262951cocola chocolate water roll jar.jpg', NULL, NULL, '2020-03-15 03:02:31', '2020-08-27 10:22:52'),
(673, 1, 6, 1, 2, NULL, '0671', 'Dan cake vanilla Muffin', 'Dan-cake-vanilla-Muffin', '<p>Dan cake vanilla Muffin</p>', 15.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584263244Dan cake vanilla Muffin.jpg', NULL, NULL, '2020-03-15 03:07:24', '2020-08-27 10:22:52'),
(674, 1, 6, 1, 2, NULL, '0672', 'dan cake chocolate muffin', 'dan-cake-chocolate-muffin', '<p>dan cake chocolate muffin</p>', 180.00, '300gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584263293dan cake chocolate muffin.jpg', NULL, NULL, '2020-03-15 03:08:13', '2020-08-27 10:22:52'),
(675, 1, 6, 1, 2, NULL, '0673', 'dan cake vanilla muffine', 'dan-cake-vanilla-muffine', '<p>dan cake vanilla muffine</p>', 180.00, '300gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584263364dan cake vanilla muffine.jpg', NULL, NULL, '2020-03-15 03:09:24', '2020-08-27 10:22:52'),
(676, 1, 6, 1, 2, NULL, '0674', 'dan cake chocolate layer cake', 'dan-cake-chocolate-layer-cake', '<p>dan cake chocolate layer cake</p>', 240.00, '360gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584263915dan cake chocolate layer cake.jpg', NULL, NULL, '2020-03-15 03:18:35', '2020-08-27 10:22:52'),
(677, 1, 6, 1, 2, NULL, '0675', 'dan cake lemon pound cake', 'dan-cake-lemon-pound-cake', '<p>dan cake lemon pound cake</p>', 100.00, '350gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584263975dan cake lemon pound cake.jpg', NULL, NULL, '2020-03-15 03:19:35', '2020-08-27 10:22:52'),
(678, 1, 43, 1, 2, NULL, '0676', 'Tiffany crunch\'N\' cream hazelnut wafers', 'Tiffany-crunch\'N\'-cream-hazelnut-wafers', '<p>Tiffany crunch&#39;N&#39; cream hazelnut wafers</p>', 100.00, '76gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584264015Tiffany crunch\'N\' cream hazelnut wafers.jpg', NULL, NULL, '2020-03-15 03:20:15', '2020-08-27 10:22:52'),
(679, 1, 43, 1, 2, NULL, '0677', 'Tiffany crunch\'N\' cream orange wafers', 'Tiffany-crunch\'N\'-cream-orange-wafers', '<p>Tiffany crunch&#39;N&#39; cream orange wafers</p>', 110.00, '76gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1594195871Tiffany crunch\'N\' cream orange wafers.jpg', NULL, NULL, '2020-03-15 03:20:53', '2020-08-27 10:22:52'),
(680, 1, 42, 1, 2, NULL, '0678', 'Ispahani Bakery Fresh dry cake', 'Ispahani-Bakery-Fresh-dry-cake', '<p>Ispanahi Bakery Fresh dry cake</p>', 120.00, '350gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584264151Ispanahi Bakery Fresh dry cake.jpg', NULL, NULL, '2020-03-15 03:22:31', '2020-08-27 10:22:52'),
(681, 1, 156, 1, 2, NULL, '0679', 'Lamisa Paratha family pack', 'Lamisa-Paratha-family-pack', '<p>Lamisa Paratha family pack</p>', 250.00, '350gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584264543Lamisa Paratha family pack.jpg', NULL, NULL, '2020-03-15 03:29:03', '2020-08-27 10:22:52'),
(682, 1, 156, 1, 2, NULL, '0680', 'Lamisa premium paratha', 'Lamisa-premium-paratha', '<p>Lamisa premium paratha</p>', 300.00, '1600gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584264628Lamisa premium paratha.jpg', NULL, NULL, '2020-03-15 03:30:28', '2020-08-27 10:22:52'),
(683, 1, 40, 1, 5, NULL, '0681', 'Cocola Egg Noodles - 180 gm', 'Cocola-Egg-Noodles---180-gm', '<p>cocola Egg Noodles</p>', 18.00, '180gm', NULL, NULL, 'In Stock', 100, NULL, 0, '15951077862018-04-06_221313.522794cocolaeggnoodles180gm_5ab381498dfe5-.3446.jpg', NULL, NULL, '2020-03-15 04:18:06', '2020-08-27 10:22:52'),
(684, 1, 40, 1, 5, NULL, '0682', 'cocola junior cup noodles', 'cocola-junior-cup-noodles', '<p>cocola junior cup noodles</p>', 25.00, '40gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267532cocola junior cup noodles.jpg', NULL, NULL, '2020-03-15 04:18:52', '2020-08-27 10:22:52'),
(685, 1, 12, 1, 5, NULL, '0683', 'nestle Maggi 2 minute noodles masala 8 pack', 'nestle-Maggi-2-minute-noodles-masala-8-pack', '<p>nestle Maggi 2 minute noodles masala 8 pack</p>', 135.00, '496gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267593nestle Maggi 2 minute noodles masala 8 pack.jpg', NULL, NULL, '2020-03-15 04:19:53', '2020-08-27 10:22:52'),
(686, 1, 12, 1, 5, NULL, '0684', 'nestle Maggi 2 minute noodles masala 4 pack', 'nestle-Maggi-2-minute-noodles-masala-4-pack', '<p>nestle Maggi 2 minute noodles masala 4 pack</p>', 66.00, '248gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267634nestle Maggi 2 minute noodles masala 4 pack.jpg', NULL, NULL, '2020-03-15 04:20:34', '2020-08-27 10:22:52'),
(687, 1, 57, 1, 5, NULL, '0685', 'Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack', 'Chopstick-deshi-masala-instant-noodles-(Free-surprise-Gift)-8-pack', '<p>Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack</p>', 130.00, '496gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267798Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack.jpg', NULL, NULL, '2020-03-15 04:23:18', '2020-08-27 10:22:52'),
(688, 1, 12, 1, 5, NULL, '0686', 'Nestle Maggi Healty thai soup', 'Nestle-Maggi-Healty-thai-soup', '<p>Nestle Maggi Healty thai soup</p>', 140.00, '35gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267893Nestle Maggi Healty thai soup.jpg', NULL, NULL, '2020-03-15 04:24:53', '2020-08-27 10:22:52'),
(689, 1, 12, 1, 5, NULL, '0687', 'nestle maggi healty soup corn with chicken Flavour', 'nestle-maggi-healty-soup-corn-with-chicken-Flavour', '<p>nestle maggi healty soup corn with chicken Flavour</p>', 140.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267944nestle maggi healty soup corn with chicken Flavour.jpg', NULL, NULL, '2020-03-15 04:25:44', '2020-08-27 10:22:52'),
(690, 1, 12, 1, 5, NULL, '0688', 'Nestle maggi shaad e magic seasoning', 'Nestle-maggi-shaad-e-magic-seasoning', '<p>Nestle maggi shaad e magic seasoning</p>', 5.00, '4gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584267987Nestle maggi shaad e magic seasoning.jpg', NULL, NULL, '2020-03-15 04:26:27', '2020-08-27 10:22:52'),
(691, 1, 12, 1, 5, NULL, '0689', 'Nestle maggi healty soup vegetables', 'Nestle-maggi-healty-soup-vegetables', '<p>Nestle maggi healty soup vegetables</p>', 140.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268030Nestle maggi healty soup vegetables.jpg', NULL, NULL, '2020-03-15 04:27:10', '2020-08-27 10:22:52'),
(692, 1, 61, 1, 5, NULL, '0690', 'kolson Macaroni shell', 'kolson-Macaroni-shell', '<p>kolson Macaroni shell</p>', 65.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268349kolson Macaroni shell.jpg', NULL, NULL, '2020-03-15 04:32:29', '2020-08-27 10:22:52'),
(693, 1, 61, 1, 5, NULL, '0691', 'kolson Bamboo', 'kolson-Bamboo', '<p>kolson Bamboo</p>', 65.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268387kolson Bamboo.jpg', NULL, NULL, '2020-03-15 04:33:07', '2020-08-27 10:22:52'),
(694, 1, 61, 1, 5, NULL, '0692', 'kolson macaroni screw', 'kolson-macaroni-screw', '<p>kolson macaroni screw</p>', 65.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268449kolson macaroni screw.jpg', NULL, NULL, '2020-03-15 04:34:09', '2020-08-27 10:22:52'),
(695, 1, 61, 1, 5, NULL, '0693', 'kolson macaroni assorted pack', 'kolson-macaroni-assorted-pack', '<p>kolson macaroni assorted pack</p>', 100.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268486kolson macaroni assorted pack.jpg', NULL, NULL, '2020-03-15 04:34:46', '2020-08-27 10:22:52'),
(696, 1, 60, 1, 5, NULL, '0694', 'Dekko pasta', 'Dekko-pasta', '<p>Dekko pasta</p>', 70.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268530Dekko pasta.jpg', NULL, NULL, '2020-03-15 04:35:30', '2020-08-27 10:22:52'),
(697, 1, 59, 1, 5, NULL, '0695', 'Bashundhara sea shell pasta', 'Bashundhara-sea-shell-pasta', '<p>Bashundhara sea shell pasta</p>', 80.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268634Bashundhara sea shell pasta.jpg', NULL, NULL, '2020-03-15 04:37:14', '2020-08-27 10:22:52'),
(698, 1, 62, 1, 5, NULL, '0696', 'Pasta hat macaroni (Rigate)', 'Pasta-hat-macaroni-(Rigate)', '<p>Pasta hat macaroni (Rigate)</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268671Pasta hat macaroni (Rigate).jpg', NULL, NULL, '2020-03-15 04:37:51', '2020-08-27 10:22:52'),
(699, 1, 62, 1, 5, NULL, '0697', 'Pasta hat macaroni (Medium shell)', 'Pasta-hat-macaroni-(Medium-shell)', '<p>Pasta hat macaroni (Medium shell)</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268855Pasta hat macaroni (Medium shell).jpg', NULL, NULL, '2020-03-15 04:40:55', '2020-08-27 10:22:52'),
(700, 1, 62, 1, 5, NULL, '0698', 'pasta hat macaroni (screw)', 'pasta-hat-macaroni-(screw)', '<p>pasta hat macaroni (screw)</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268891pasta hat macaroni (screw).jpg', NULL, NULL, '2020-03-15 04:41:31', '2020-08-27 10:22:52'),
(701, 1, 62, 1, 5, NULL, '0699', 'pasta hat macaroni (Big Elbow)', 'pasta-hat-macaroni-(Big-Elbow)', '<p>pasta hat macaroni (Big Elbow)</p>', 130.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584268935pasta hat macaroni (Big Elbow).jpg', NULL, NULL, '2020-03-15 04:42:15', '2020-08-27 10:22:52'),
(702, 1, 12, 1, 5, NULL, '0700', 'Nestle Kitkat 4 finger', 'Nestle-Kitkat-4-finger', '<p>Nestle Kitkat 4 finger</p>', 50.00, '37.3gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584269300Nestle Kitkat 4 finger.jpg', NULL, NULL, '2020-03-15 04:48:20', '2020-08-27 10:22:52'),
(703, 1, 12, 1, 5, NULL, '0701', 'kitkat 2 finger', 'kitkat-2-finger', '<p>kitkat 2 finger</p>', 30.00, '20gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584269337kitkat 2 finger.jpg', NULL, NULL, '2020-03-15 04:48:57', '2020-08-27 10:22:52'),
(704, 1, 12, 1, 5, NULL, '0702', 'Nestle Chocolate Assorted Chocolate', 'Nestle-Chocolate-Assorted-Chocolate', '<p>Nestle Chocolate Assorted Chocolate</p>', 300.00, '1 Box', NULL, NULL, 'In Stock', 100, NULL, 0, '1584269376Nestle Chocolate Assorted Chocolate.jpg', NULL, NULL, '2020-03-15 04:49:36', '2020-08-27 10:22:52'),
(705, 1, 12, 1, NULL, NULL, '0703', 'Nestle Chocolate Assorted Chocolate', 'Nestle-Chocolate-Assorted-Chocolate', '<p>Nestle Chocolate Assorted Chocolate</p>', 360.00, '1 Box', NULL, NULL, 'In Stock', 100, NULL, 0, NULL, NULL, NULL, '2020-03-15 04:50:04', '2020-08-27 10:22:52'),
(706, 1, 12, 1, 5, NULL, '0704', 'Nestle nesquik chocolate powder', 'Nestle-nesquik-chocolate-powder', '<p>Nestle nesquik chocolate powder</p>', 435.00, '300gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584269458Nestle nesquik chocolate powder.jpg', NULL, NULL, '2020-03-15 04:50:58', '2020-08-27 10:22:52'),
(707, 1, 63, 1, 5, NULL, '0705', 'Snikers Chocolate', 'Snikers-Chocolate', '<p>Snikers Chocolate</p>', 20.00, '18gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584269883Snikers Chocolate.jpg', NULL, NULL, '2020-03-15 04:58:03', '2020-08-27 10:22:52'),
(708, 1, 63, 1, 5, NULL, '0706', 'Snikers Chocolate', 'Snikers-Chocolate', '<p>Snikers Chocolate</p>', 55.00, '55gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584269929Snikers Chocolate.jpg', NULL, NULL, '2020-03-15 04:58:49', '2020-08-27 10:22:52'),
(709, 1, 63, 1, 5, NULL, '0707', 'snikers family pack chocolate', 'snikers-family-pack-chocolate', '<p>snikers family pack chocolate</p>', 225.00, '180gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584270318snikers family pack chocolate.jpg', NULL, NULL, '2020-03-15 05:05:18', '2020-08-27 10:22:52'),
(710, 1, 63, 1, 5, NULL, '0708', 'snikers power pack', 'snikers-power-pack', '<p>snikers power pack</p>', 285.00, '250gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584270368snikers power pack.jpg', NULL, NULL, '2020-03-15 05:06:08', '2020-08-27 10:22:52'),
(711, 1, 11, 1, 5, NULL, '0709', 'Cadbury Dairy Milk silk chocolate', 'Cadbury-Dairy-Milk-silk-chocolate', '<p>Cadbury Dairy Milk silk chocolate</p>', 130.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584270506Cadbury Dairy Milk silk chocolate.jpg', NULL, NULL, '2020-03-15 05:08:26', '2020-08-27 10:22:52'),
(712, 1, 11, 1, 5, NULL, '0710', 'cadbury 5 star chocolate', 'cadbury-5-star-chocolate', '<p>cadbury 5 star chocolate</p>', 30.00, '21.5gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584270547cadbury 5 star chocolate.jpg', NULL, NULL, '2020-03-15 05:09:07', '2020-08-27 10:22:52'),
(713, 1, 11, 1, 5, NULL, '0711', 'cadbury choclairs', 'cadbury-choclairs', '<p>cadbury choclairs</p>', 160.00, '196gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584272139cadbury choclairs.jpg', NULL, NULL, '2020-03-15 05:35:39', '2020-08-27 10:22:52'),
(714, 1, 11, 1, 5, NULL, '0712', 'cadbury dairy millk silk fruit & nut', 'cadbury-dairy-millk-silk-fruit-&-nut', '<p>cadbury dairy millk silk fruit &amp; nut</p>', 150.00, '55gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584272277cadbury dairy millk silk fruit & nut.jpg', NULL, NULL, '2020-03-15 05:37:57', '2020-08-27 10:22:52'),
(715, 1, 11, 1, 5, NULL, '0713', 'cadbury bournville rich cocoa dark chocolate', 'cadbury-bournville-rich-cocoa-dark-chocolate', '<p>cadbury bournville rich cocoa dark chocolate</p>', 230.00, '80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584272325cadbury bournville rich cocoa dark chocolate.jpg', NULL, NULL, '2020-03-15 05:38:45', '2020-08-27 10:22:52'),
(716, 1, 11, 1, 5, NULL, '0714', 'cadbury original drinking chocolate', 'cadbury-original-drinking-chocolate', '<p>cadbury original drinking chocolate</p>', 300.00, '250gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584272584cadbury original drinking chocolate.jpg', NULL, NULL, '2020-03-15 05:43:04', '2020-08-27 10:22:52'),
(717, 1, 11, 1, 5, NULL, '0715', 'cadbury gems surprise chocolate ball', 'cadbury-gems-surprise-chocolate-ball', '<p>cadbury gems surprise chocolate ball</p>', 100.00, '17.80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584272673cadbury gems surprise chocolate ball.jpg', NULL, NULL, '2020-03-15 05:44:33', '2020-08-27 10:22:52'),
(718, 1, 11, 1, 5, NULL, '0716', 'cadbury gems surprise chocolate', 'cadbury-gems-surprise-chocolate', '<p>cadbury gems surprise chocolate</p>', 90.00, '17.80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584272813cadbury gems surprise chocolate.jpg', NULL, NULL, '2020-03-15 05:46:53', '2020-08-27 10:22:52'),
(719, 1, 11, 1, 5, NULL, '0717', 'cadbury dairy milk silk roast almond', 'cadbury-dairy-milk-silk-roast-almond', '<p>cadbury dairy milk silk roast almond</p>', 300.00, '137gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273444cadbury dairy milk silk roast almond.jpg', NULL, NULL, '2020-03-15 05:57:24', '2020-08-27 10:22:52'),
(720, 1, 11, 1, 5, NULL, '0718', 'cadbury fuse chocolate', 'cadbury-fuse-chocolate', '<p>cadbury fuse chocolate</p>', 90.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273519cadbury fuse chocolate.jpg', NULL, NULL, '2020-03-15 05:58:39', '2020-08-27 10:22:52'),
(721, 1, 11, 1, 5, NULL, '0719', 'cadbury bournville raisin and nusts dark chocolate', 'cadbury-bournville-raisin-and-nusts-dark-chocolate', '<p>cadbury bournville raisin and nusts dark chocolate</p>', 230.00, '80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273551cadbury bournville raisin and nusts dark chocolate.jpg', NULL, NULL, '2020-03-15 05:59:11', '2020-08-27 10:22:52'),
(722, 1, 11, 1, 5, NULL, '0720', 'cadbury bournville cranberry dark chocolate', 'cadbury-bournville-cranberry-dark-chocolate', '<p>cadbury bournville cranberry dark chocolate</p>', 230.00, '80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273737cadbury bournville cranberry dark chocolate.jpg', NULL, NULL, '2020-03-15 06:02:17', '2020-08-27 10:22:52'),
(723, 1, 11, 1, 5, NULL, '0721', 'cadbury bournville cranberry dark chocolate', 'cadbury-bournville-cranberry-dark-chocolate', '<p>cadbury bournville cranberry dark chocolate</p>', 230.00, '80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273784cadbury bournville cranberry dark chocolate.jpg', NULL, NULL, '2020-03-15 06:03:04', '2020-08-27 10:22:52'),
(724, 1, 11, 1, 5, NULL, '0722', 'cadbury dairy milk lickables', 'cadbury-dairy-milk-lickables', '<p>cadbury dairy milk lickables</p>', 100.00, '20gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273886cadbury dairy milk lickables.jpg', NULL, NULL, '2020-03-15 06:04:46', '2020-08-27 10:22:52'),
(725, 1, 64, 1, 5, NULL, '0723', 'kopiko coffee candy', 'kopiko-coffee-candy', '<p>kopiko coffee candy</p>', 125.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584273930kopiko coffee candy.jpg', NULL, NULL, '2020-03-15 06:05:30', '2020-08-27 10:22:52'),
(726, 1, 64, 1, 5, NULL, '0724', 'kopiko coffee cappuccino', 'kopiko-coffee-cappuccino', '<p>kopiko coffee cappuccino</p>', 125.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274052kopiko coffee cappuccino.jpg', NULL, NULL, '2020-03-15 06:07:32', '2020-08-27 10:22:52'),
(727, 1, 5, 1, 5, NULL, '0725', 'olympic tetul candy', 'olympic-tetul-candy', '<p>olympic tetul candy</p>', 50.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274203olympic tetul candy.jpg', NULL, NULL, '2020-03-15 06:10:03', '2020-08-27 10:22:52'),
(728, 1, 5, 1, 5, NULL, '0726', 'olympic juicy litchi candy', 'olympic-juicy-litchi-candy', '<p>olympic juicy litchi candy</p>', 50.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274271olympic juicy litchi candy.jpg', NULL, NULL, '2020-03-15 06:11:11', '2020-08-27 10:22:52'),
(729, 1, 5, 1, 5, NULL, '0727', 'olympic mango candy', 'olympic-mango-candy', '<p>olympic mango candy</p>', 50.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274462olympic mango candy.jpg', NULL, NULL, '2020-03-15 06:14:22', '2020-08-27 10:22:52'),
(730, 1, 66, 1, 5, NULL, '0728', 'Alpenliebe original caramel candy pouch', 'Alpenliebe-original-caramel-candy-pouch', '<p>Alpenliebe original caramel candy pouch</p>', 90.00, '90 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274518Alpenliebe original caramel candy pouch.jpg', NULL, NULL, '2020-03-15 06:15:18', '2020-08-27 10:22:52'),
(731, 1, 66, 1, 5, NULL, '0729', 'Alpenliebe Creamfills Box', 'Alpenliebe-Creamfills-Box', '<p>Alpenliebe Creamfills Box</p>', 150.00, '75 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274631Alpenliebe Creamfills Box.jpg', NULL, NULL, '2020-03-15 06:17:11', '2020-08-27 10:22:52'),
(732, 1, 66, 1, 5, NULL, '0730', 'Alpenliebe pop Party Pack Lollipop surprise Gift', 'Alpenliebe-pop-Party-Pack-Lollipop-surprise-Gift', '<p>Alpenliebe pop Party Pack Lollipop surprise Gift</p>', 50.00, '9 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584274670Alpenliebe pop Party Pack Lollipop surprise Gift.jpg', NULL, NULL, '2020-03-15 06:17:50', '2020-08-27 10:22:52'),
(733, 1, 42, 1, 3, NULL, '0731', 'Ispahani Mirzapore Best leaf Tea', 'Ispahani-Mirzapore-Best-leaf-Tea', '<p>Ispahani Mirzapore Best leaf Tea</p>', 210.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339146Ispahani Mirzapore Best leaf Tea.jpg', NULL, NULL, '2020-03-16 00:12:26', '2020-08-27 10:22:52'),
(734, 1, 42, 1, 3, NULL, '0732', 'Ispahani Mirzapore Best leaf Tea', 'Ispahani-Mirzapore-Best-leaf-Tea', '<p>Ispahani Mirzapore Best leaf Tea</p>', 110.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339184Ispahani Mirzapore Best leaf Tea.jpg', NULL, NULL, '2020-03-16 00:13:04', '2020-08-27 10:22:52'),
(735, 1, 42, 1, 3, NULL, '0733', 'Ispahani Mirzapur Red dust tea', 'Ispahani-Mirzapur-Red-dust-tea', '<p>Ispahani Mirzapur Red dust tea</p>', 180.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339227Ispahani Mirzapur Red dust tea.jpg', NULL, NULL, '2020-03-16 00:13:47', '2020-08-27 10:22:52'),
(736, 1, 42, 1, 3, NULL, '0734', 'ispahani mirzapore Tea bag', 'ispahani-mirzapore-Tea-bag', '<p>ispahani mirzapore Tea bag</p>', 90.00, '50 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339254ispahani mirzapore Tea bag.jpg', NULL, NULL, '2020-03-16 00:14:14', '2020-08-27 10:22:52'),
(737, 1, 42, 1, 3, NULL, '0735', 'Ispahani blender\'s choice green tea', 'Ispahani-blender\'s-choice-green-tea', '<p>Ispahani blender&#39;s choice green tea</p>', 110.00, '25 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339298Ispahani blender\'s choice green tea.jpg', NULL, NULL, '2020-03-16 00:14:58', '2020-08-27 10:22:52'),
(738, 1, 42, 1, 3, NULL, '0736', 'Ispahani blender\'s choice green tea', 'Ispahani-blender\'s-choice-green-tea', '<p>Ispahani blender&#39;s choice green tea</p>', 145.00, '50 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339326Ispahani blender\'s choice green tea.jpg', NULL, NULL, '2020-03-16 00:15:26', '2020-08-27 10:22:52'),
(739, 1, 42, 1, 3, NULL, '0737', 'Ispahani blender\'s choice green tea', 'Ispahani-blender\'s-choice-green-tea', '<p>Ispahani blender&#39;s choice green tea</p>', 160.00, '200 gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339359Ispahani blender\'s choice green tea.jpg', NULL, NULL, '2020-03-16 00:15:59', '2020-08-27 10:22:52'),
(740, 1, 42, 1, 3, NULL, '0738', 'Ispahani blender\'s choice green tea', 'Ispahani-blender\'s-choice-green-tea', '<p>Ispahani blender&#39;s choice green tea</p>', 310.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339387Ispahani blender\'s choice green tea.jpg', NULL, NULL, '2020-03-16 00:16:27', '2020-08-27 10:22:52'),
(741, 1, 42, 1, 3, NULL, '0739', 'Ispahani mirzapore PD tea', 'Ispahani-mirzapore-PD-tea', '<p>Ispahani mirzapore PD tea</p>', 232.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339699Ispahani mirzapore PD tea.jpg', NULL, NULL, '2020-03-16 00:21:39', '2020-08-27 10:22:52'),
(742, 1, 42, 1, 3, NULL, '0740', 'Ispahani zareen premium tea', 'Ispahani-zareen-premium-tea', '<p>Ispahani zareen premium tea</p>', 130.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339748Ispahani zareen premium tea.jpg', NULL, NULL, '2020-03-16 00:22:28', '2020-08-27 10:22:52'),
(743, 1, 44, 1, 3, NULL, '0741', 'Brooke bond Taaza Tea black tea', 'Brooke-bond-Taaza-Tea-black-tea', '<p>Brooke bond Taaza Tea black tea</p>', 199.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339823Brooke bond Taaza Tea black tea.jpg', NULL, NULL, '2020-03-16 00:23:43', '2020-08-27 10:22:52'),
(744, 1, 44, 1, 3, NULL, '0742', 'Brooke bond Taaza Tea black tea', 'Brooke-bond-Taaza-Tea-black-tea', '<p>Brooke bond Taaza Tea black tea</p>', 100.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339857Brooke bond Taaza Tea black tea.jpg', NULL, NULL, '2020-03-16 00:24:17', '2020-08-27 10:22:52'),
(745, 1, 44, 1, 3, NULL, '0743', 'Brooke bond Taaza Tea bag', 'Brooke-bond-Taaza-Tea-bag', '<p>Brooke bond Taaza Tea bag</p>', 90.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584339906Brooke bond Taaza Tea bag 50pcs.jpg', NULL, NULL, '2020-03-16 00:25:06', '2020-08-27 10:22:52'),
(746, 1, 157, 1, 3, NULL, '0744', 'Fresh Premium Tea (cup free)', 'Fresh-Premium-Tea-(cup-free)', '<p>Fresh Premium Tea (cup free)</p>', 200.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584340176Fresh Premium Tea (cup free).jpg', NULL, NULL, '2020-03-16 00:29:36', '2020-08-27 10:22:52'),
(747, 1, 157, 1, 3, NULL, '0745', 'Fresh Premium Tea (spoon free)', 'Fresh-Premium-Tea-(spoon-free)', '<p>Fresh Premium Tea (spoon free)</p>', 100.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584340213Fresh Premium Tea (spoon free).jpg', NULL, NULL, '2020-03-16 00:30:13', '2020-08-27 10:22:52'),
(748, 1, 45, 1, 3, NULL, '0746', 'kazi & kazi Green tea', 'kazi-&-kazi-Green-tea', '<p>kazi &amp; kazi Green tea</p>', 160.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584340332kazi & kazi Green tea.jpg', NULL, NULL, '2020-03-16 00:32:12', '2020-08-27 10:22:52'),
(749, 1, 45, 1, 3, NULL, '0747', 'kazi & kazi Orthodox Green tea', 'kazi-&-kazi-Orthodox-Green-tea', '<p>kazi &amp; kazi Orthodox Green tea</p>', 180.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584340367kazi & kazi Orthodox Green tea.jpg', NULL, NULL, '2020-03-16 00:32:47', '2020-08-27 10:22:52'),
(750, 1, 45, 1, 3, NULL, '0748', 'kazi & kazi Ginger tea', 'kazi-&-kazi-Ginger-tea', '<p>kazi &amp; kazi Ginger tea</p>', 150.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584340398kazi & kazi Ginger tea.jpg', NULL, NULL, '2020-03-16 00:33:18', '2020-08-27 10:22:52'),
(751, 1, 45, 1, 3, NULL, '0749', 'kazi & kazi Tulsi tea', 'kazi-&-kazi-Tulsi-tea', '<p>kazi &amp; kazi Tulsi tea</p>', 150.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584340608kazi & kazi Tulsi tea.jpg', NULL, NULL, '2020-03-16 00:36:48', '2020-08-27 10:22:52'),
(752, 1, 45, 1, 3, NULL, '0750', 'kazi & kazi black tea', 'kazi-&-kazi-black-tea', '<p>kazi &amp; kazi black tea</p>', 125.00, '80gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584341232kazi & kazi black tea.jpg', NULL, NULL, '2020-03-16 00:47:12', '2020-08-27 10:22:52'),
(753, 1, 45, 1, 3, NULL, '0751', 'kazi & kazi Lemongrass tea', 'kazi-&-kazi-Lemongrass-tea', '<p>kazi &amp; kazi Lemongrass tea</p>', 160.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584341687kazi & kazi Lemongrass tea.jpg', NULL, NULL, '2020-03-16 00:54:47', '2020-08-27 10:22:52'),
(754, 1, 45, 1, 3, NULL, '0752', 'kazi & kazi medley tea', 'kazi-&-kazi-medley-tea', '<p>kazi &amp; kazi medley tea</p>', 150.00, '60gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584341737kazi & kazi medley tea.jpg', NULL, NULL, '2020-03-16 00:55:37', '2020-08-27 10:22:52'),
(755, 1, 45, 1, 3, NULL, '0753', 'kazi & kazi Lemongrass herbal infusion', 'kazi-&-kazi-Lemongrass-herbal-infusion', '<p>kazi &amp; kazi Lemongrass herbal infusion</p>', 150.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584341859kazi & kazi Lemongrass herbal infusion.jpg', NULL, NULL, '2020-03-16 00:57:39', '2020-08-27 10:22:52'),
(756, 1, 46, 1, 3, NULL, '0754', 'Finlays pure Green tea bags', 'Finlays-pure-Green-tea-bags', '<p>Finlays pure Green tea bags</p>', 95.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584341896Finlays pure Green tea bags.jpg', NULL, NULL, '2020-03-16 00:58:16', '2020-08-27 10:22:52'),
(757, 1, 46, 1, 3, NULL, '0755', 'Finlays pure green tea box', 'Finlays-pure-green-tea-box', '<p>Finlays pure green tea box</p>', 85.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584341962Finlays pure green tea box.jpg', NULL, NULL, '2020-03-16 00:59:22', '2020-08-27 10:22:52'),
(758, 1, 46, 1, 3, NULL, '0756', 'finlays natural green tea bags', 'finlays-natural-green-tea-bags', '<p>finlays natural green tea bags</p>', 110.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342005finlays natural green tea bags.jpg', NULL, NULL, '2020-03-16 01:00:05', '2020-08-27 10:22:52'),
(759, 1, 46, 1, 3, NULL, '0757', 'finlays masala cha tea bags', 'finlays-masala-cha-tea-bags', '<p>finlays masala cha tea bags</p>', 95.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342072finlays masala cha tea bags.jpg', NULL, NULL, '2020-03-16 01:01:12', '2020-08-27 10:22:52'),
(760, 1, 46, 1, 3, NULL, '0758', 'finlay premium tea', 'finlay-premium-tea', '<p>finlay premium tea</p>', 115.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342129finlay premium tea.jpg', NULL, NULL, '2020-03-16 01:02:09', '2020-08-27 10:22:52'),
(761, 1, 46, 1, 3, NULL, '0759', 'finlay gold tea', 'finlay-gold-tea', '<p>finlay gold tea</p>', 110.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342159finlay gold tea.jpg', NULL, NULL, '2020-03-16 01:02:39', '2020-08-27 10:22:52'),
(762, 1, 46, 1, 3, NULL, '0760', 'finlay gold tea', 'finlay-gold-tea', '<p>finlay gold tea</p>', 210.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342189finlay gold tea.jpg', NULL, NULL, '2020-03-16 01:03:09', '2020-08-27 10:22:52'),
(763, 1, 47, 1, 3, NULL, '0761', 'Tetley premium tea bags', 'Tetley-premium-tea-bags', '<p>Tetley premium tea bags</p>', 90.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342541Tetley premium tea bags.jpg', NULL, NULL, '2020-03-16 01:09:01', '2020-08-27 10:22:52'),
(764, 1, 47, 1, 3, NULL, '0762', 'tetly green tea (PURE original) tea bags', 'tetly-green-tea-(PURE-original)-tea-bags', '<p>tetly green tea (PURE original) tea bags</p>', 150.00, '25 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584342630tetly green tea (PURE original) tea bags.jpg', NULL, NULL, '2020-03-16 01:10:30', '2020-08-27 10:22:52'),
(765, 1, 12, 1, 3, NULL, '0763', 'Nestle Nescafe classic instant coffee jar', 'Nestle-Nescafe-classic-instant-coffee-jar', '<p>Nestle Nescafe classic instant coffee jar</p>', 495.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346595Nestle Nescafe classic instant coffee jar.jpg', NULL, NULL, '2020-03-16 02:16:35', '2020-08-27 10:22:52'),
(766, 1, 12, 1, 3, NULL, '0764', 'Nestle Nescafe classic instant coffee jar', 'Nestle-Nescafe-classic-instant-coffee-jar', '<p>Nestle Nescafe classic instant coffee jar</p>', 300.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346643Nestle Nescafe classic instant coffee jar.jpg', NULL, NULL, '2020-03-16 02:17:23', '2020-08-27 10:22:52'),
(767, 1, 12, 1, 3, NULL, '0765', 'Nestle Nescafe classic instant coffee jar', 'Nestle-Nescafe-classic-instant-coffee-jar', '<p>Nestle Nescafe classic instant coffee jar</p>', 165.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346677Nestle Nescafe classic instant coffee jar.jpg', NULL, NULL, '2020-03-16 02:17:56', '2020-08-27 10:22:52'),
(768, 1, 12, 1, 3, NULL, '0766', 'Nescafe classice pouch pack (container free)', 'Nescafe-classice-pouch-pack-(container-free)', '<p>Nescafe classice pouch pack (container free)</p>', 350.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346713Nescafe classice pouch pack (container free).jpg', NULL, NULL, '2020-03-16 02:18:33', '2020-08-27 10:22:52'),
(769, 1, 12, 1, 3, NULL, '0767', 'nestle coffee mate richer & creamer BIB', 'nestle-coffee-mate-richer-&-creamer-BIB', '<p>nestle coffee mate richer &amp; creamer BIB</p>', 270.00, '450gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346846nestle coffee mate richer & creamer BIB.jpg', NULL, NULL, '2020-03-16 02:20:46', '2020-08-27 10:22:52'),
(770, 1, 12, 1, 3, NULL, '0768', 'nestle coffee mate creamer', 'nestle-coffee-mate-creamer', '<p>nestle coffee mate creamer</p>', 535.00, '1 kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346882nestle coffee mate creamer.jpg', NULL, NULL, '2020-03-16 02:21:22', '2020-08-27 10:22:52'),
(771, 1, 12, 1, 3, NULL, '0769', 'nescafe gold jar', 'nescafe-gold-jar', '<p>nescafe gold jar</p>', 845.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346930nescafe gold jar.jpg', NULL, NULL, '2020-03-16 02:22:10', '2020-08-27 10:22:52'),
(772, 1, 12, 1, 3, NULL, '0770', 'nescafe matinal jar', 'nescafe-matinal-jar', '<p>nescafe matinal jar</p>', 455.00, '230gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584346994nescafe matinal jar.jpg', NULL, NULL, '2020-03-16 02:23:14', '2020-08-27 10:22:52'),
(773, 1, 12, 1, 3, NULL, '0771', 'nescafe ipoh original white coffee', 'nescafe-ipoh-original-white-coffee', '<p>nescafe ipoh original white coffee</p>', 625.00, '540gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347036nescafe ipoh original white coffee.jpg', NULL, NULL, '2020-03-16 02:23:56', '2020-08-27 10:22:52'),
(774, 1, 12, 1, 3, NULL, '0772', 'nescafe singapore kopi C', 'nescafe-singapore-kopi-C', '<p>nescafe singapore kopi C</p>', 560.00, '390gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347118nescafe singapore kopi C.jpg', NULL, NULL, '2020-03-16 02:25:18', '2020-08-27 10:22:52'),
(775, 1, 12, 1, 3, NULL, '0773', 'nestle nescafe creamy latte', 'nestle-nescafe-creamy-latte', '<p>nestle nescafe creamy latte</p>', 12.00, '15gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347157nestle nescafe creamy latte.jpg', NULL, NULL, '2020-03-16 02:25:57', '2020-08-27 10:22:52'),
(776, 1, 12, 1, 3, NULL, '0774', 'Nestea iced tea lemon', 'Nestea-iced-tea-lemon', '<p>Nestea iced tea lemon</p>', 300.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347229Nestea iced tea lemon.jpg', NULL, NULL, '2020-03-16 02:27:09', '2020-08-27 10:22:52'),
(777, 1, 48, 1, 3, NULL, '0775', 'Tora bika cappuccino', 'Tora-bika-cappuccino', '<p>Tora bika cappuccino</p>', 120.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347329Tora bika cappuccino.jpg', NULL, NULL, '2020-03-16 02:28:49', '2020-08-27 10:22:52'),
(778, 1, 48, 1, 3, NULL, '0776', 'Tora bika creamy latte', 'Tora-bika-creamy-latte', '<p>Tora bika creamy latte</p>', 120.00, '25gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347368Tora bika creamy latte.jpg', NULL, NULL, '2020-03-16 02:29:28', '2020-08-27 10:22:52'),
(779, 1, 48, 1, 3, NULL, '0777', 'Kopico white mocca mocha coffee', 'Kopico-white-mocca-mocha-coffee', '<p>Kopico white mocca mocha coffee</p>', 90.00, '20gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347401Kopico white mocca mocha coffee.jpg', NULL, NULL, '2020-03-16 02:30:01', '2020-08-27 10:22:52'),
(780, 1, 49, 1, 3, NULL, '0778', 'Mac coffee gold jar', 'Mac-coffee-gold-jar', '<p>Mac coffee gold jar</p>', 295.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347487Mac coffee gold jar.jpg', NULL, NULL, '2020-03-16 02:31:27', '2020-08-27 10:22:52'),
(781, 1, 49, 1, 3, NULL, '0779', 'Mac coffee gold jar', 'Mac-coffee-gold-jar', '<p>Mac coffee gold jar</p>', 490.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347536Mac coffee gold jar.jpg', NULL, NULL, '2020-03-16 02:32:16', '2020-08-27 10:22:52'),
(782, 1, 49, 1, 3, NULL, '0780', 'Mac coffee original jar', 'Mac-coffee-original-jar', '<p>Mac coffee original jar</p>', 230.00, '50gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347569Mac coffee original jar.jpg', NULL, NULL, '2020-03-16 02:32:49', '2020-08-27 10:22:52'),
(783, 1, 49, 1, 3, NULL, '0781', 'mac coffee coffee & creamer 2 in 1', 'mac-coffee-coffee-&-creamer-2-in-1', '<p>mac coffee coffee &amp; creamer 2 in 1</p>', 350.00, '20 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347606mac coffee coffee & creamer 2 in 1.jpg', NULL, NULL, '2020-03-16 02:33:26', '2020-08-27 10:22:52'),
(784, 1, 50, 1, 3, NULL, '0782', 'Bru pure instant coffee jar', 'Bru-pure-instant-coffee-jar', '<p>Bru pure instant coffee jar</p>', 440.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347729Bru pure instant coffee jar.jpg', NULL, NULL, '2020-03-16 02:35:29', '2020-08-27 10:22:52'),
(785, 1, 50, 1, 3, NULL, '0783', 'Bru pure instant coffee jar', 'Bru-pure-instant-coffee-jar', '<p>Bru pure instant coffee jar</p>', 754.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347839Bru pure instant coffee jar.jpg', NULL, NULL, '2020-03-16 02:37:19', '2020-08-27 10:22:52'),
(786, 1, 50, 1, 3, NULL, '0784', 'Bru original coffee jar', 'Bru-original-coffee-jar', '<p>Bru original coffee jar</p>', 754.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347877Bru original coffee jar.jpg', NULL, NULL, '2020-03-16 02:37:57', '2020-08-27 10:22:52'),
(787, 1, 50, 1, 3, NULL, '0785', 'Bru original rich aromatic coffee jar', 'Bru-original-rich-aromatic-coffee-jar', '<p>Bru original rich aromatic coffee jar</p>', 440.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347908Bru original rich aromatic coffee jar.jpg', NULL, NULL, '2020-03-16 02:38:28', '2020-08-27 10:22:52'),
(788, 1, 4, 1, 3, NULL, '0786', 'Latina 100% Juich (Apple)', 'Latina-100%-Juich-(Apple)', '<p>Latina 100% Juich (Apple)</p>', 200.00, '1 Ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584347989Latina 100% Juich (Apple).jpg', NULL, NULL, '2020-03-16 02:39:49', '2020-08-27 10:22:52'),
(789, 1, 4, 1, 3, NULL, '0787', 'Latina 100% Juich (Orange)', 'Latina-100%-Juich-(Orange)', '<p>Latina 100% Juich (Orange)</p>', 200.00, '1 Ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348080Latina 100% Juich (Orange).jpg', NULL, NULL, '2020-03-16 02:41:20', '2020-08-27 10:22:52'),
(790, 1, 4, 1, 3, NULL, '0788', 'Pran Drinko Litchi Juice', 'Pran-Drinko-Litchi-Juice', '<p>Pran Drinko Litchi Juice</p>', 30.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348157Pran Drinko Litchi Juice.jpg', NULL, NULL, '2020-03-16 02:42:37', '2020-08-27 10:22:52'),
(791, 1, 4, 1, 3, NULL, '0789', 'pran apple fruit drink', 'pran-apple-fruit-drink', '<p>pran apple fruit drink</p>', 30.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348219pran apple fruit drink.jpg', NULL, NULL, '2020-03-16 02:43:39', '2020-08-27 10:22:52'),
(792, 1, 4, 1, 3, NULL, '0790', 'pran frooto mango fruit drink', 'pran-frooto-mango-fruit-drink', '<p>pran frooto mango fruit drink</p>', 25.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348262pran frooto mango fruit drink.jpg', NULL, NULL, '2020-03-16 02:44:22', '2020-08-27 10:22:52'),
(793, 1, 4, 1, 3, NULL, '0791', 'pran frooto mango fruit drink', 'pran-frooto-mango-fruit-drink', '<p>pran frooto mango fruit drink</p>', 45.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348291pran frooto mango fruit drink.jpg', NULL, NULL, '2020-03-16 02:44:51', '2020-08-27 10:22:52'),
(794, 1, 4, 1, 3, NULL, '0792', 'pran frooto mango fruit drink', 'pran-frooto-mango-fruit-drink', '<p>pran frooto mango fruit drink</p>', 80.00, '1 Ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348323pran frooto mango fruit drink.jpg', NULL, NULL, '2020-03-16 02:45:23', '2020-08-27 10:22:52'),
(795, 1, 17, 1, 3, NULL, '0793', 'shezan mango fruit drinks', 'shezan-mango-fruit-drinks', '<p>shezan mango fruit drinks</p>', 80.00, '1 Ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348416shezan mango fruit drinks.jpg', NULL, NULL, '2020-03-16 02:46:56', '2020-08-27 10:22:52'),
(796, 1, 17, 1, 3, NULL, '0794', 'shezan mango juice', 'shezan-mango-juice', '<p>shezan mango juice</p>', 22.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348448shezan mango juice.jpg', NULL, NULL, '2020-03-16 02:47:28', '2020-08-27 10:22:52'),
(797, 1, 16, 1, 3, NULL, '0795', 'sajeeb lichi flavored drink', 'sajeeb-lichi-flavored-drink', '<p>sajeeb lichi flavored drink</p>', 12.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348487sajeeb lichi flavored drink.jpg', NULL, NULL, '2020-03-16 02:48:07', '2020-08-27 10:22:52'),
(798, 1, 16, 1, 3, NULL, '0796', 'sajeeb orange flavored drink', 'sajeeb-orange-flavored-drink', '<p>sajeeb orange flavored drink</p>', 12.00, '170ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348537sajeeb orange flavored drink.jpg', NULL, NULL, '2020-03-16 02:48:57', '2020-08-27 10:22:52'),
(799, 1, 51, 1, 3, NULL, '0797', 'Masafi mango nectar juice', 'Masafi-mango-nectar-juice', '<p>Masafi mango nectar juice</p>', 650.00, '2 Ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348587Masafi mango nectar juice.jpg', NULL, NULL, '2020-03-16 02:49:47', '2020-08-27 10:22:52'),
(800, 1, 51, 1, 3, NULL, '0798', 'Masafi apple juice', 'Masafi-apple-juice', '<p>Masafi apple juice</p>', 650.00, '2 Ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348624Masafi apple juice.jpg', NULL, NULL, '2020-03-16 02:50:24', '2020-08-27 10:22:52'),
(801, 1, 51, 1, 3, NULL, '0799', 'Masafi Tropical Fruits Necter', 'Masafi-Tropical-Fruits-Necter', '<p>Masafi Tropical Fruits Necter</p>', 650.00, '2 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348668Masafi Tropical Fruits Necter.jpg', NULL, NULL, '2020-03-16 02:51:08', '2020-08-27 10:22:52'),
(802, 1, 52, 1, 3, NULL, '0800', 'Aloe vera mango drink', 'Aloe-vera-mango-drink', '<p>Aloe vera mango drink</p>', 235.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348713Aloe vera mango drink.jpg', NULL, NULL, '2020-03-16 02:51:53', '2020-08-27 10:22:52'),
(803, 1, 52, 1, 3, NULL, '0801', 'Aloe vera prome drink', 'Aloe-vera-prome-drink', '<p>Aloe vera prome drink</p>', 235.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348748Aloe vera prome drink.jpg', NULL, NULL, '2020-03-16 02:52:28', '2020-08-27 10:22:52'),
(804, 1, 53, 1, 3, NULL, '0802', 'Ocean spray cranberry classic juice', 'Ocean-spray-cranberry-classic-juice', '<p>Ocean spray cranberry classic juice</p>', 810.00, '1.5 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584348788Ocean spray cranberry classic juice.jpg', NULL, NULL, '2020-03-16 02:53:08', '2020-08-27 10:22:52'),
(805, 1, 158, 1, 3, NULL, '0803', 'cocacola', 'cocacola', '<p>cocacola</p>', 110.00, '2.25ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1594195069coca-cola-225-ltr.jpg', NULL, NULL, '2020-03-16 03:06:03', '2020-08-27 10:22:52'),
(806, 1, 158, 1, 3, NULL, '0804', 'cocacola', 'cocacola', '<p>cocacola</p>', 70.00, '1.25ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1594194998coca-cola-225-ltr.jpg', NULL, NULL, '2020-03-16 03:06:38', '2020-08-27 10:22:52'),
(807, 1, 158, 1, 3, NULL, '0805', 'cocacola', 'cocacola', '<p>cocacola</p>', 40.00, '600ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1594194826coca cola.jpg', NULL, NULL, '2020-03-16 03:07:10', '2020-08-27 10:22:52'),
(808, 1, 158, 1, 3, NULL, '0806', 'cocacola can', 'cocacola-can', '<p>cocacola can</p>', 40.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584349666cocacola can.jpg', NULL, NULL, '2020-03-16 03:07:46', '2020-08-27 10:22:52'),
(809, 1, 158, 1, 3, NULL, '0807', 'cocacola classic', 'cocacola-classic', '<p>cocacola classic</p>', 140.00, '320ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584349706cocacola classic.jpg', NULL, NULL, '2020-03-16 03:08:26', '2020-08-27 10:22:52'),
(810, 1, 158, 1, 3, NULL, '0808', 'Sprite', 'Sprite', '<p>Sprite</p>', 110.00, '2.25 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584349979Sprite.jpg', NULL, NULL, '2020-03-16 03:12:59', '2020-08-27 10:22:52'),
(811, 1, 158, 1, 3, NULL, '0809', 'Sprite', 'Sprite', '<p>Sprite</p>', 65.00, '1.25 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350032Sprite.jpg', NULL, NULL, '2020-03-16 03:13:52', '2020-08-27 10:22:52'),
(812, 1, 158, 1, 3, NULL, '0810', 'Sprite', 'Sprite', '<p>Sprite</p>', 35.00, '600ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350067Sprite.jpg', NULL, NULL, '2020-03-16 03:14:27', '2020-08-27 10:22:52'),
(813, 1, 158, 1, 3, NULL, '0811', 'sprite can', 'sprite-can', '<p>sprite can</p>', 40.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350102sprite can.jpg', NULL, NULL, '2020-03-16 03:15:02', '2020-08-27 10:22:52'),
(814, 1, 158, 1, 3, NULL, '0812', '7up pet', '7up-pet', '<p>7up pet</p>', 100.00, '2 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '15843501357up pet.jpg', NULL, NULL, '2020-03-16 03:15:35', '2020-08-27 10:22:52'),
(815, 1, 158, 1, 3, NULL, '0813', '7up pet', '7up-pet', '<p>7up pet</p>', 60.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '15843501657up pet.jpg', NULL, NULL, '2020-03-16 03:16:05', '2020-08-27 10:22:52'),
(816, 1, 158, 1, 3, NULL, '0814', '7up can', '7up-can', '<p>7up can</p>', 40.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '15843502037up can.jpg', NULL, NULL, '2020-03-16 03:16:43', '2020-08-27 10:22:52'),
(817, 1, 158, 1, 3, NULL, '0815', 'pepsi can', 'pepsi-can', '<p>pepsi can</p>', 40.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350248pepsi can.jpg', NULL, NULL, '2020-03-16 03:17:28', '2020-08-27 10:22:52'),
(818, 1, 65, 1, 3, NULL, '0816', 'clemon pet', 'clemon-pet', '<p>clemon pet</p>', 28.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350307clemon pet.jpg', NULL, NULL, '2020-03-16 03:18:27', '2020-08-27 10:22:52'),
(819, 1, 65, 1, 3, NULL, '0817', 'clemon pet', 'clemon-pet', '<p>clemon pet</p>', 90.00, '2 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350432clemon pet.jpg', NULL, NULL, '2020-03-16 03:20:32', '2020-08-27 10:22:52'),
(820, 1, 4, 1, 3, NULL, '0818', 'pran up', 'pran-up', '<p>pran up</p>', 30.00, '500ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350470pran up.jpg', NULL, NULL, '2020-03-16 03:21:10', '2020-08-27 10:22:52'),
(821, 1, 4, 1, 3, NULL, '0819', 'pran up', 'pran-up', '<p>pran up</p>', 50.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350507pran up.jpg', NULL, NULL, '2020-03-16 03:21:47', '2020-08-27 10:22:52'),
(822, 1, 65, 1, 3, NULL, '0820', 'Frutica mango juice', 'Frutica-mango-juice', '<p>Frutica mango juice</p>', 80.00, '1 ltr', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350541Frutica mango juice.jpg', NULL, NULL, '2020-03-16 03:22:21', '2020-08-27 10:22:52'),
(823, 1, 55, 1, 3, NULL, '0821', 'Rooh Afza', 'Rooh-Afza', '<p>Rooh Afza</p>', 150.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350578Rooh Afza.jpg', NULL, NULL, '2020-03-16 03:22:58', '2020-08-27 10:22:52'),
(824, 1, 55, 1, 3, NULL, '0822', 'Rooh Afza', 'Rooh-Afza', '<p>Rooh Afza</p>', 250.00, '750ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584350612Rooh Afza.jpg', NULL, NULL, '2020-03-16 03:23:32', '2020-08-27 10:22:52'),
(825, 1, 159, 1, 3, NULL, '0823', 'Glaxos D pack', 'Glaxos-D-pack', '<p>Glaxos D pack</p>', 145.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351254Glaxos D pack.jpg', NULL, NULL, '2020-03-16 03:34:14', '2020-08-27 10:22:52'),
(826, 1, 159, 1, 3, NULL, '0824', 'Glaxos D orange', 'Glaxos-D-orange', '<p>Glaxos D orange</p>', 155.00, '250gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351306Glaxos D orange.jpg', NULL, NULL, '2020-03-16 03:35:06', '2020-08-27 10:22:52'),
(827, 1, 56, 1, 3, NULL, '0825', 'Tang Mango powder', 'Tang-Mango-powder', '<p>Tang Mango powder</p>', 400.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351365Tang Mango powder.jpg', NULL, NULL, '2020-03-16 03:36:05', '2020-08-27 10:22:52'),
(828, 1, 56, 1, 3, NULL, '0826', 'Tang Lemon Powder', 'Tang-Lemon-Powder', '<p>Tang Lemon Powder</p>', 400.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351570Tang Lemon Powder.jpg', NULL, NULL, '2020-03-16 03:39:30', '2020-08-27 10:22:52'),
(829, 1, 56, 1, 3, NULL, '0827', 'Tang orange pack', 'Tang-orange-pack', '<p>Tang orange pack</p>', 470.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351605Tang orange pack.jpg', NULL, NULL, '2020-03-16 03:40:05', '2020-08-27 10:22:52');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(830, 1, 56, 1, 3, NULL, '0828', 'Tang mango jar', 'Tang-mango-jar', '<p>Tang mango jar</p>', 615.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351775Tang mango jar.jpg', NULL, NULL, '2020-03-16 03:42:55', '2020-08-27 10:22:52'),
(831, 1, 56, 1, 3, NULL, '0829', 'Tang pineapple powder', 'Tang-pineapple-powder', '<p>Tang pineapple powder</p>', 400.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351857Tang pineapple powder.jpg', NULL, NULL, '2020-03-16 03:44:17', '2020-08-27 10:22:52'),
(832, 1, 56, 1, 3, NULL, '0830', 'Tang Tropical Coctail Powder', 'Tang-Tropical-Coctail-Powder', '<p>Tang Tropical Coctail Powder</p>', 400.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584351958Tang Tropical Coctail Powder.jpg', NULL, NULL, '2020-03-16 03:45:58', '2020-08-27 10:22:52'),
(833, 1, 25, 1, 3, NULL, '0831', 'Foster clarks Drink orange', 'Foster-clarks-Drink-orange', '<p>Foster clarks Drink orange</p>', 530.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352060Foster clarks Drink orange.jpg', NULL, NULL, '2020-03-16 03:47:40', '2020-08-27 10:22:52'),
(834, 1, 25, 1, 3, NULL, '0832', 'Foster clarks mandarin jar', 'Foster-clarks-mandarin-jar', '<p>Foster clarks mandarin jar</p>', 617.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352101Foster clarks mandarin jar.jpg', NULL, NULL, '2020-03-16 03:48:21', '2020-08-27 10:22:52'),
(835, 1, 25, 1, 3, NULL, '0833', 'Foster clarks pineapple jar', 'Foster-clarks-pineapple-jar', '<p>Foster clarks pineapple jar</p>', 530.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352282Foster clarks pineapple jar.jpg', NULL, NULL, '2020-03-16 03:51:22', '2020-08-27 10:22:52'),
(836, 1, 25, 1, 3, NULL, '0834', 'forter clarks lemon instant flavoured drink', 'forter-clarks-lemon-instant-flavoured-drink', '<p>forter clarks lemon instant flavoured drink</p>', 530.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352328forter clarks lemon instant flavoured drink.jpg', NULL, NULL, '2020-03-16 03:52:08', '2020-08-27 10:22:52'),
(837, 1, 42, 1, 3, NULL, '0835', 'Ispi Instant Powder drink (orange)', 'Ispi-Instant-Powder-drink-(orange)', '<p>Ispi Instant Powder drink (orange)</p>', 190.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352867Ispi Instant Powder drink (orange).jpg', NULL, NULL, '2020-03-16 04:01:07', '2020-08-27 10:22:52'),
(838, 1, 42, 1, 3, NULL, '0836', 'Ispi Instant Powder drink (orange)', 'Ispi-Instant-Powder-drink-(orange)', '<p>Ispi Instant Powder drink (orange)</p>', 105.00, '250gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352906Ispi Instant Powder drink (orange).jpg', NULL, NULL, '2020-03-16 04:01:46', '2020-08-27 10:22:52'),
(839, 1, 42, 1, 3, NULL, '0837', 'Ispi soft Powder drink (mango)', 'Ispi-soft-Powder-drink-(mango)', '<p>Ispi soft Powder drink (mango)</p>', 190.00, '500gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352940Ispi soft Powder drink (mango).jpg', NULL, NULL, '2020-03-16 04:02:20', '2020-08-27 10:22:52'),
(840, 1, 42, 1, 3, NULL, '0838', 'ispi instant powder drink jar (orange)', 'ispi-instant-powder-drink-jar-(orange)', '<p>ispi instant powder drink jar (orange)</p>', 380.00, '750gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584352977ispi instant powder drink jar (orange).jpg', NULL, NULL, '2020-03-16 04:02:57', '2020-08-27 10:22:52'),
(841, 1, 84, 4, 38, NULL, '0839', 'Almer Hand Sanitizer | 50ml', 'Almer-Hand-Sanitizer-|-50ml', '<ul>\r\n	<li>Almer Hand Sanitizer</li>\r\n	<li>kill 99% germ</li>\r\n	<li>protect from illness</li>\r\n</ul>', 160.00, '50 ml', NULL, NULL, 'In Stock', 10, NULL, 0, '1584470635almer-hand-sanitizer-50-ml.jpg', NULL, NULL, '2020-03-17 12:43:55', '2020-08-27 10:22:52'),
(842, 1, 97, 4, 38, NULL, '0840', 'Lifebuoy Handwash Total Pump | 200 ml', 'Lifebuoy-Handwash-Total-Pump-|-200-ml', '<ul>\r\n	<li>Product Type: Handwash</li>\r\n	<li>Brand: Lifebuoy</li>\r\n	<li>Capacity: 200ml</li>\r\n	<li>kill 99% gerrm in just 10 seconds</li>\r\n</ul>', 90.00, '200 ml', NULL, NULL, 'In Stock', 50, NULL, 0, '1584470801lifebuoy-handwash-total-pump-200-ml.jpg', NULL, NULL, '2020-03-17 12:46:41', '2020-08-27 10:22:52'),
(843, 1, 97, 4, 38, NULL, '0841', 'Lifebuoy Handwash Lemon Fresh Refill | 170 ml', 'Lifebuoy-Handwash-Lemon-Fresh-Refill-|-170-ml', '<ul>\r\n	<li>Product Type: Handwash Refeil Pack</li>\r\n	<li>Brand: Lifebuoy</li>\r\n	<li>Capacity: 200ml</li>\r\n</ul>', 60.00, '170 ml', NULL, NULL, 'In Stock', 50, NULL, 0, '1584470897lifebuoy-handwash-lemon-fresh-refill-170-ml.jpg', NULL, NULL, '2020-03-17 12:48:17', '2020-08-27 10:22:52'),
(844, 1, 131, 4, 38, NULL, '0842', 'ACI Savlon Active Handwash | 250 ml', 'ACI-Savlon-Active-Handwash-|-250-ml', '<ul>\r\n	<li>Product Type: Handwash</li>\r\n	<li>Brand: Savlon</li>\r\n	<li>Capacity: 250 ml</li>\r\n</ul>', 90.00, '250 ml', NULL, NULL, 'In Stock', 50, NULL, 0, '1584471011aci-savlon-active-handwash-bottle-250-ml.jpg', NULL, NULL, '2020-03-17 12:50:11', '2020-08-27 10:22:52'),
(845, 1, 131, 4, 38, NULL, '0843', 'ACI Savlon Antiseptic Handwash Ocean Blue Pump', 'ACI-Savlon-Antiseptic-Handwash-Ocean-Blue-Pump', '<ul>\r\n	<li>Product Type: Handwash</li>\r\n	<li>Brand: Savlon</li>\r\n	<li>Capacity: 200ml</li>\r\n</ul>', 100.00, '300 ml', NULL, NULL, 'In Stock', 50, NULL, 0, '1584471076aci-savlon-antiseptic-handwash-ocean-blue-pump-300-ml.jpg', NULL, NULL, '2020-03-17 12:51:16', '2020-08-27 10:22:52'),
(846, 1, 160, 4, 38, NULL, '0844', 'Hand Sanitizing Wipes |', 'Hand-Sanitizing-Wipes-|', '<ul>\r\n	<li>Help your family and those you care for kill germs on their hands with HIYAHand Sanitizing Wipes Using HIYA wipes is a convenient and gentle way to kill germs</li>\r\n	<li>HIYA hand sanitizing wipes are proven to kill 99.99 percent of most common germs that may cause illness, without damaging skin</li>\r\n	<li>Perfect for frequent use. HIYA wipes are formulated to be gentle on skin containing no harsh chemicals. Free of harsh preservatives, and does not contain dye, triclosan, parabens or phthalates</li>\r\n	<li>The 80Count travel pack fits just about anywhere making it convenient to take with you throughout the day while you are on-the-go</li>\r\n	<li>Case includes: 6 - 20 count HIYA Hand Sanitizing Wipes</li>\r\n</ul>', 280.00, '80 PCs', 265.00, '5%', 'In Stock', 100, NULL, 0, '1584538057ad0cf987-73ec-492e-9316-63e5e01d5482.jpg', NULL, NULL, '2020-03-17 13:01:39', '2020-08-27 10:22:52'),
(847, 1, 160, 3, 9, NULL, '0845', 'Bondhon Baby Wet Wipes (60 Pcs)', 'Bondhon-Baby-Wet-Wipes-(60-Pcs)', '<p>***&nbsp;Bondhon Baby Wet Wipes</p>\r\n\r\n<p>&nbsp;</p>', 110.00, '60 Pcs', 100.00, '9%', 'In Stock', 100, NULL, 0, '15845390584f375ec9-3121-4919-8ba2-164c675794fa.jpg', NULL, NULL, '2020-03-18 07:44:18', '2020-08-27 10:22:52'),
(848, 1, 160, 3, 9, NULL, '0846', 'Bondhon Baby Wet Wipes (120 pcs)', 'Bondhon-Baby-Wet-Wipes-(120-pcs)', '<p>***&nbsp;Bondhon Baby Wet Wipes (120 pcs)</p>', 175.00, '120 pcs', 160.00, '9%', 'Out Of Stock', 100, NULL, 0, '15845391525c9dac41-c6a2-4dd6-bcc4-10d6eb68fb85.jpg', NULL, NULL, '2020-03-18 07:45:52', '2020-08-27 10:22:52'),
(849, 1, 160, 3, 9, NULL, '0847', 'Bondhon Baby Wet Wipes (160 pcs)', 'Bondhon-Baby-Wet-Wipes-(160-pcs)', '<p>***&nbsp;Bondhon Baby Wet Wipes (160 pcs)</p>', 220.00, '160 pcs', 199.00, '10%', 'Out Of Stock', 100, NULL, 0, '1584539417edee90c5-6fc1-4a5d-ab1f-d311c6588cac.jpg', NULL, NULL, '2020-03-18 07:50:17', '2020-08-27 10:22:52'),
(850, 1, 2, 4, 30, NULL, '0848', 'Hiya cotton Buds (240 pcs)', 'Hiya-cotton-Buds-(240-pcs)', '<p>Hiya cotton Bud (240 pcs)</p>\r\n\r\n<p>Best Quality cotton</p>\r\n\r\n<p>100% Pure cotton</p>', 75.00, '240 pcs', 70.00, '7%', 'In Stock', 100, NULL, 0, '15845398432adbda95-8fbf-4e57-8d35-5865dccc9cc4.jpg', NULL, NULL, '2020-03-18 07:57:23', '2020-08-27 10:22:52'),
(851, 1, 160, 3, 13, NULL, '0849', 'Hiya Baby cotton Bud (100 pcs)', 'Hiya-Baby-cotton-Bud-(100-pcs)', '<p>soft &amp; secure cotton buds</p>\r\n\r\n<p>100% pure cotton</p>', 15.00, '100 pcs', 13.00, '13%', 'Out Of Stock', 100, NULL, 0, '1584540051a0bcf037-e227-4971-910e-58de015f9806.jpg', NULL, NULL, '2020-03-18 08:00:51', '2020-08-27 10:22:52'),
(852, 1, 160, 3, 13, NULL, '0850', 'Baby cotton buds | 100 Pcs', 'Baby-cotton-buds-|-100-Pcs', '<p>100 % pure cotton</p>\r\n\r\n<p>safe &amp; secure for baby</p>\r\n\r\n<p>&nbsp;</p>', 35.00, '100 pcs', 32.00, '9%', 'Out Of Stock', 100, NULL, 0, '1584540330e9600291-ef79-47f6-8912-508289c4f3f4.jpg', NULL, NULL, '2020-03-18 08:05:30', '2020-08-27 10:22:52'),
(853, 1, 160, 3, 14, NULL, '0851', 'Bondhon Baby Nipple', 'Bondhon-Baby-Nipple', '<p>Best quality Nipples</p>', 35.00, '32', NULL, NULL, 'Out Of Stock', 100, NULL, 0, '1584540421b9a0c967-9c0b-4812-8b01-7586aa931a14.jpg', NULL, NULL, '2020-03-18 08:07:01', '2020-08-27 10:22:52'),
(854, 1, 70, 1, 6, NULL, '0852', 'Arla Dano Daily Pusti Milk Powder | 1 Kg', 'Arla-Dano-Daily-Pusti-Milk-Powder-|-1-Kg', '<ul>\r\n	<li>Product Type: Full Cream Milk Powder</li>\r\n	<li>Capacity: 1 Kg</li>\r\n	<li>Instant Full Cream Milk Powder</li>\r\n	<li>Premium Quality</li>\r\n	<li>No need to refrigerate</li>\r\n	<li>Simple, easy to use</li>\r\n	<li>Add water for instant use</li>\r\n	<li>Provides all the benefits of fresh full cream milk in convenient powder form</li>\r\n	<li>Useful for baking, ice-cream, desserts, etc</li>\r\n	<li>Creamy flavor</li>\r\n	<li>Packed with essential vitamins, minerals</li>\r\n	<li>Calcium</li>\r\n	<li>Vitamin D</li>\r\n	<li>Phosphorous</li>\r\n	<li>Potassium</li>\r\n	<li>Vitamin A &amp; B</li>\r\n	<li>Iodine</li>\r\n</ul>', 450.00, '1 Kg', NULL, NULL, 'In Stock', 50, NULL, 0, '1584554474arla-dano-daily-pusti-milk-powder-1-kg.jpg', NULL, NULL, '2020-03-18 12:01:14', '2020-08-27 10:22:52'),
(855, 1, 84, 1, 6, NULL, '0853', 'Chicken Egg (Layer) | 12 Pcs', 'Chicken-Egg-(Layer)-|-12-Pcs', '<p>Chicken egg (Layer)</p>\r\n\r\n<p>*Big size egg</p>', 100.00, '12 pcs', 90.00, '10%', 'In Stock', 1000, NULL, 0, '1593963999chicken-egg-layer.png', NULL, NULL, '2020-03-18 23:53:42', '2020-08-27 10:22:52'),
(856, 1, 84, 2, NULL, NULL, '0854', 'Mustard oil | organic 1 Ltr', 'Mustard-oil-|-organic-1-Ltr', '<p>Mustard oil&nbsp;</p>\r\n\r\n<p>100% pure and organic</p>', 240.00, '1 ltr', 210.00, '13%', 'In Stock', 100, NULL, 0, '1593963617organic-mustard-oil.jpeg', NULL, NULL, '2020-03-19 00:21:57', '2020-08-27 10:22:52'),
(857, 1, 161, 1, 6, NULL, '0855', 'Marks gold high calcium low fat milk powder for 40+ yrs', 'Marks-gold-high-calcium-low-fat-milk-powder-for-40+-yrs', '<p>Marks gold high calcium low fat milk powder for 40+ yrs</p>', 350.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608710Marks gold high calcium low fat milk powder for 40+ yrs.jpg', NULL, NULL, '2020-03-19 03:05:10', '2020-08-27 10:22:52'),
(858, 1, 161, 1, 6, NULL, '0856', 'marks milk based diabetic diet', 'marks-milk-based-diabetic-diet', '<p>marks milk based diabetic diet</p>', 600.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608747marks milk based diabetic diet.jpg', NULL, NULL, '2020-03-19 03:05:47', '2020-08-27 10:22:52'),
(859, 1, 161, 1, 6, NULL, '0857', 'marks active school milk powder', 'marks-active-school-milk-powder', '<p>marks active school milk powder</p>', 330.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608779marks active school milk powder.jpg', NULL, NULL, '2020-03-19 03:06:19', '2020-08-27 10:22:52'),
(860, 1, 161, 1, 6, NULL, '0858', 'Marks active school 2 in 1 chocolate milk powder', 'Marks-active-school-2-in-1-chocolate-milk-powder', '<p>Marks active school 2 in 1 chocolate milk powder</p>', 350.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608811Marks active school 2 in 1 chocolate milk powder.jpg', NULL, NULL, '2020-03-19 03:06:51', '2020-08-27 10:22:52'),
(861, 1, 161, 1, 6, NULL, '0859', 'Marks full cream milk powder', 'Marks-full-cream-milk-powder', '<p>Marks full cream milk powder</p>', 580.00, '1kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608888Marks full cream milk powder.jpg', NULL, NULL, '2020-03-19 03:08:08', '2020-08-27 10:22:52'),
(862, 1, 161, 1, 6, NULL, '0860', 'Marks diet low fat milk powder', 'Marks-diet-low-fat-milk-powder', '<p>Marks diet low fat milk powder</p>', 350.00, '400gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608923Marks diet low fat milk powder.jpg', NULL, NULL, '2020-03-19 03:08:43', '2020-08-27 10:22:52'),
(863, 1, 4, 1, 6, NULL, '0861', 'Pran full cream milk powder', 'Pran-full-cream-milk-powder', '<p>Pran full cream milk powder</p>', 520.00, '1kg', NULL, NULL, 'In Stock', 100, NULL, 0, '1584608973Pran full cream milk powder.jpg', NULL, NULL, '2020-03-19 03:09:33', '2020-08-27 10:22:52'),
(864, 1, 130, 3, 12, NULL, '0862', 'Meril Baby Shampoo', 'Meril-Baby-Shampoo', '<p>Meril Baby Shampoo</p>', 100.00, '110ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615006Meril Baby Shampoo.jpg', NULL, NULL, '2020-03-19 04:50:06', '2020-08-27 10:22:52'),
(865, 1, 130, 3, 12, NULL, '0863', 'Meril Baby Olive Oil', 'Meril-Baby-Olive-Oil', '<p>Meril Baby Olive Oil</p>', 210.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615039Meril Baby Olive Oil.jpg', NULL, NULL, '2020-03-19 04:50:39', '2020-08-27 10:22:52'),
(866, 1, 130, 3, 12, NULL, '0864', 'Meril Baby Lotion', 'Meril-Baby-Lotion', '<p>Meril Baby Lotion</p>', 230.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615082Meril Baby Lotion.jpg', NULL, NULL, '2020-03-19 04:51:22', '2020-08-27 10:22:52'),
(867, 1, 130, 3, 12, NULL, '0865', 'Meril Baby Mild Honey Soap', 'Meril-Baby-Mild-Honey-Soap', '<p>Meril Baby Mild Honey Soap</p>', 45.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615133Meril Baby Mild Honey Soap.jpg', NULL, NULL, '2020-03-19 04:52:13', '2020-08-27 10:22:52'),
(868, 1, 162, 3, 12, NULL, '0866', 'Johnson\'s Baby Original Baby Softness Lotion', 'Johnson\'s-Baby-Original-Baby-Softness-Lotion', '<p>Johnson&#39;s Baby Original Baby Softness Lotion</p>', 330.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615267Johnson\'s Baby Original Baby Softness Lotion.jpg', NULL, NULL, '2020-03-19 04:54:27', '2020-08-27 10:22:52'),
(869, 1, 162, 3, 12, NULL, '0867', 'Johnson\'s Baby Shampoo', 'Johnson\'s-Baby-Shampoo', '<p>Johnson&#39;s Baby Shampoo</p>', 325.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615297Johnson\'s Baby Shampoo.jpg', NULL, NULL, '2020-03-19 04:54:57', '2020-08-27 10:22:52'),
(870, 1, 162, 3, 12, NULL, '0868', 'Johnson\'s Baby Blossoms Soap', 'Johnson\'s-Baby-Blossoms-Soap', '<p>Johnson&#39;s Baby Blossoms Soap</p>', 100.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615327Johnson\'s Baby Blossoms Soap.jpg', NULL, NULL, '2020-03-19 04:55:27', '2020-08-27 10:22:52'),
(871, 1, 162, 3, 12, NULL, '0869', 'Johnson\'s Baby Oil', 'Johnson\'s-Baby-Oil', '<p>Johnson&#39;s Baby Oil</p>', 325.00, '300ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615356Johnson\'s Baby Oil.jpg', NULL, NULL, '2020-03-19 04:55:56', '2020-08-27 10:22:52'),
(872, 1, 162, 3, 12, NULL, '0870', 'Johnson\'s Baby Soap', 'Johnson\'s-Baby-Soap', '<p>Johnson&#39;s Baby Soap</p>', 150.00, '150gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615786Johnson\'s Baby Soap.png', NULL, NULL, '2020-03-19 05:03:06', '2020-08-27 10:22:52'),
(873, 1, 162, 3, 12, NULL, '0871', 'Johnson\'s Baby 24 Hour Moisture Lotion', 'Johnson\'s-Baby-24-Hour-Moisture-Lotion', '<p>Johnson&#39;s Baby 24 Hour Moisture Lotion</p>', 300.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615817Johnson\'s Baby 24 Hour Moisture Lotion.jpg', NULL, NULL, '2020-03-19 05:03:37', '2020-08-27 10:22:52'),
(874, 1, 162, 3, 12, NULL, '0872', 'Johnson\'s Baby Milk + Rice Cream', 'Johnson\'s-Baby-Milk-+-Rice-Cream', '<p>Johnson&#39;s Baby Milk + Rice Cream</p>', 320.00, '100gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615845Johnson\'s Baby Milk + Rice Cream.jpg', NULL, NULL, '2020-03-19 05:04:05', '2020-08-27 10:22:52'),
(875, 1, 162, 3, 12, NULL, '0873', 'Johnson\'s Baby Bath Milk + Rice', 'Johnson\'s-Baby-Bath-Milk-+-Rice', '<p>Johnson&#39;s Baby Bath Milk + Rice</p>', 350.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615878Johnson\'s Baby Bath Milk + Rice.jpg', NULL, NULL, '2020-03-19 05:04:38', '2020-08-27 10:22:52'),
(876, 1, 162, 3, 12, NULL, '0874', 'Johnson\'s Baby Powder', 'Johnson\'s-Baby-Powder', '<p>Johnson&#39;s Baby Powder</p>', 350.00, '380gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615910Johnson\'s Baby Powder.jpg', NULL, NULL, '2020-03-19 05:05:10', '2020-08-27 10:22:52'),
(877, 1, 162, 3, 12, NULL, '0875', 'Johnson\'s Baby Hair Oil', 'Johnson\'s-Baby-Hair-Oil', '<p>Johnson&#39;s Baby Hair Oil</p>', 325.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615940Johnson\'s Baby Hair Oil.jpg', NULL, NULL, '2020-03-19 05:05:40', '2020-08-27 10:22:52'),
(878, 1, 162, 3, 12, NULL, '0876', 'Johnson\'s Baby Jelly Lightly Fragranced', 'Johnson\'s-Baby-Jelly-Lightly-Fragranced', '<p>Johnson&#39;s Baby Jelly Lightly Fragranced</p>', 495.00, '250ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584615974Johnson\'s Baby Jelly Lightly Fragranced.jpg', NULL, NULL, '2020-03-19 05:06:14', '2020-08-27 10:22:52'),
(879, 1, 162, 3, 12, NULL, '0877', 'Johnson\'s Blossoms Baby Powder', 'Johnson\'s-Blossoms-Baby-Powder', '<p>Johnson&#39;s Blossoms Baby Powder</p>', 350.00, '380gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584616003Johnson\'s Blossoms Baby Powder.jpg', NULL, NULL, '2020-03-19 05:06:43', '2020-08-27 10:22:52'),
(880, 1, 162, 3, 12, NULL, '0878', 'Johnson\'s Baby Jelly Lightly Fragranced', 'Johnson\'s-Baby-Jelly-Lightly-Fragranced', '<p>Johnson&#39;s Baby Jelly Lightly Fragranced</p>', 335.00, '100ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584616038Johnson\'s Baby Jelly Lightly Fragranced.jpg', NULL, NULL, '2020-03-19 05:07:18', '2020-08-27 10:22:52'),
(881, 1, 162, 3, 12, NULL, '0879', 'Johnson\'s Top To Toe Baby Wash', 'Johnson\'s-Top-To-Toe-Baby-Wash', '<p>Johnson&#39;s Top To Toe Baby Wash</p>', 240.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584616079Johnson\'s Top To Toe Baby Wash.jpg', NULL, NULL, '2020-03-19 05:07:59', '2020-08-27 10:22:52'),
(882, 1, 122, 3, 12, NULL, '0880', 'Dove Baby Rich Moisture Lotion', 'Dove-Baby-Rich-Moisture-Lotion', '<p>Dove Baby Rich Moisture Lotion</p>', 350.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584616670Dove Baby Rich Moisture Lotion.jpg', NULL, NULL, '2020-03-19 05:17:50', '2020-08-27 10:22:52'),
(883, 1, 122, 3, 12, NULL, '0881', 'Dove Baby Sensitive Moisture Lotion', 'Dove-Baby-Sensitive-Moisture-Lotion', '<p>Dove Baby Sensitive Moisture Lotion</p>', 350.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584616709Dove Baby Sensitive Moisture Lotion.jpg', NULL, NULL, '2020-03-19 05:18:29', '2020-08-27 10:22:52'),
(884, 1, 163, 3, 12, NULL, '0882', 'Parachute Just for Baby - Baby Lotion', 'Parachute-Just-for-Baby---Baby-Lotion', '<p>Parachute Just for Baby - Baby Lotion</p>', 250.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584616913Parachute Just for Baby - Baby Lotion.jpg', NULL, NULL, '2020-03-19 05:21:53', '2020-08-27 10:22:52'),
(885, 1, 163, 3, 12, NULL, '0883', 'Parachute Just for Baby - Baby Oil', 'Parachute-Just-for-Baby---Baby-Oil', '<p>Parachute Just for Baby - Baby Oil</p>', 320.00, '200ml', NULL, NULL, 'In Stock', 100, NULL, 0, '1584617026Parachute Just for Baby - Baby Oil.jpg', NULL, NULL, '2020-03-19 05:23:46', '2020-08-27 10:22:52'),
(886, 1, 163, 3, 12, NULL, '0884', 'Parachute Just for Baby - Baby Powder', 'Parachute-Just-for-Baby---Baby-Powder', '<p>Parachute Just for Baby - Baby Powder</p>', 180.00, '200gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584617115Parachute Just for Baby - Baby Powder.jpg', NULL, NULL, '2020-03-19 05:25:15', '2020-08-27 10:22:52'),
(887, 1, 163, 3, 12, NULL, '0885', 'Parachute Just for Baby - Baby Soap', 'Parachute-Just-for-Baby---Baby-Soap', '<p>Parachute Just for Baby - Baby Soap</p>', 115.00, '125gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584617253Parachute Just for Baby - Baby Soap.jpg', NULL, NULL, '2020-03-19 05:27:33', '2020-08-27 10:22:52'),
(888, 1, 163, 3, 12, NULL, '0886', 'Parachute Just for Baby Baby Soap Combo', 'Parachute-Just-for-Baby-Baby-Soap-Combo', '<p>Parachute Just for Baby Baby Soap Combo</p>', 225.00, '75gm', NULL, NULL, 'In Stock', 100, NULL, 0, '1584617288Parachute Just for Baby Baby Soap Combo.jpg', NULL, NULL, '2020-03-19 05:28:08', '2020-08-27 10:22:52'),
(889, 1, 164, 3, 9, NULL, '0887', 'Pampers Baby Dry Pants Diaper Pant - 36 pcs', 'Pampers-Baby-Dry-Pants-Diaper-Pant---36-pcs', '<p>Pampers Baby Dry Pants Diaper Pant - 36 pcs</p>', 1499.00, '36 pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694143Pampers Baby Dry Pants Diaper Pant - 36 pcs.jpg', NULL, NULL, '2020-03-20 02:49:03', '2020-08-27 10:22:52'),
(890, 1, 164, 3, 9, NULL, '0888', 'Pampers Baby Dry Pants Diaper Pant  L 9-14 kg', 'Pampers-Baby-Dry-Pants-Diaper-Pant-L-9-14-kg', '<p>Pampers Baby Dry Pants Diaper Pant L 9-14 kg</p>', 1499.00, '44 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694351Pampers Baby Dry Pants Diaper Pant - 44 pcs.jpg', NULL, NULL, '2020-03-20 02:52:31', '2020-08-27 10:22:52'),
(891, 1, 164, 3, 9, NULL, '0889', 'Pampers Baby Dry Pants Diaper Pant M 7-12 kg', 'Pampers-Baby-Dry-Pants-Diaper-Pant-M-7-12-kg', '<p>Pampers Baby Dry Pants Diaper Pant M 7-12 kg</p>', 1499.00, '54 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694433Pampers Baby Dry Pants Diaper Pant  - 54 pcs.jpg', NULL, NULL, '2020-03-20 02:53:53', '2020-08-27 10:22:52'),
(892, 1, 164, 3, 9, NULL, '0890', 'Pampers Baby Dry Pants Diaper Pant XXL 15-25 kg', 'Pampers-Baby-Dry-Pants-Diaper-Pant-XXL-15-25-kg', '<p>Pampers Baby Dry Pants Diaper Pant XXL 15-25 kg</p>', 1400.00, '28 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694519Pampers Baby Dry Pants Diaper Pant - 28 pcs.jpg', NULL, NULL, '2020-03-20 02:55:19', '2020-08-27 10:22:52'),
(893, 1, 164, 3, 9, NULL, '0891', 'Pampers Baby Dry Diaper Belt XL 11-16 kg', 'Pampers-Baby-Dry-Diaper-Belt-XL-11-16-kg', '<p>Pampers Baby Dry Diaper Belt XL 11-16 kg</p>', 1500.00, '38 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694623Pampers Baby Dry Diaper Belt -38 pcs.jpg', NULL, NULL, '2020-03-20 02:57:03', '2020-08-27 10:22:52'),
(894, 1, 164, 3, 9, NULL, '0892', 'Pampers Baby Diaper Belt L 10-15 kg', 'Pampers-Baby-Diaper-Belt-L-10-15-kg', '<p>Pampers Baby Diaper Belt L 10-15 kg</p>', 1600.00, '40 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694695Pampers Baby Diaper Belt - 40 pcs.jpg', NULL, NULL, '2020-03-20 02:58:15', '2020-08-27 10:22:52'),
(895, 1, 164, 3, 9, NULL, '0893', 'Pampers Baby Dry Size 4 Jumbo Plus Pack Pants 9-15 kg', 'Pampers-Baby-Dry-Size-4-Jumbo-Plus-Pack-Pants-9-15-kg', '<p>Pampers Baby Dry Size 4 Jumbo Plus Pack Pants 9-15 kg</p>', 2500.00, '72 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584694988Pampers Baby Dry Size 4 Jumbo Plus Pack Pants - 72 pcs.jpg', NULL, NULL, '2020-03-20 03:03:08', '2020-08-27 10:22:52'),
(896, 1, 164, 3, 9, NULL, '0894', 'Pampers Baby Dry Pants Diaper Pant New born upto 5 kg', 'Pampers-Baby-Dry-Pants-Diaper-Pant-New-born-upto-5-kg', '<p>Pampers Baby Dry Pants Diaper Pant New born upto 5 kg</p>', 1500.00, '60 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584695061Pampers Baby Dry Pants Diaper Pant New born - 60 pcs.jpg', NULL, NULL, '2020-03-20 03:04:21', '2020-08-27 10:22:52'),
(897, 1, 164, 3, 9, NULL, '0895', 'ampers Baby Dry Size 6 Jumbo Plus Pack Pants 15+ kg', 'ampers-Baby-Dry-Size-6-Jumbo-Plus-Pack-Pants-15+-kg', '<p>ampers Baby Dry Size 6 Jumbo Plus Pack Pants 15+ kg</p>', 2500.00, '52 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584695147ampers Baby Dry Size 6 Jumbo Plus Pack Pants- 52 pcs.jpg', NULL, NULL, '2020-03-20 03:05:47', '2020-08-27 10:22:52'),
(898, 1, 164, 3, 9, NULL, '0896', 'Pampers Baby Dry Pants Diaper Pant 17+ kg', 'Pampers-Baby-Dry-Pants-Diaper-Pant-17+-kg', '<p>Pampers Baby Dry Pants Diaper Pant 17+ kg</p>', 2000.00, '23 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584695208Pampers Baby Dry Pants Diaper Pant - 23 pcs.jpg', NULL, NULL, '2020-03-20 03:06:48', '2020-08-27 10:22:52'),
(899, 1, 164, 3, 9, NULL, '0897', 'Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs', 'Pampers-Baby-Dry-Size-5-Essential-Pack-Pants---33-pcs', '<p>Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs</p>', 1600.00, '33 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584696223Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs.jpg', NULL, NULL, '2020-03-20 03:23:43', '2020-08-27 10:22:52'),
(900, 1, 164, 3, 9, NULL, '0898', 'Pampers Baby Dry Size 2 Jumbo Plus Pack Belt 4-8 kg', 'Pampers-Baby-Dry-Size-2-Jumbo-Plus-Pack-Belt-4-8-kg', '<p>Pampers Baby Dry Size 2 Jumbo Plus Pack Belt 4-8 kg</p>', 2100.00, '68 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584696700Pampers Baby Dry Size 2 Jumbo Plus Pack Belt - 68 pcs.jpg', NULL, NULL, '2020-03-20 03:31:40', '2020-08-27 10:22:52'),
(901, 1, 164, 3, 9, NULL, '0899', 'Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs', 'Pampers-Baby-Dry-Size-5-Jumbo-Plus-Pack-Belt---72-pcs', '<p>Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs</p>', 2500.00, '72 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697173Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs.jpg', NULL, NULL, '2020-03-20 03:39:33', '2020-08-27 10:22:52'),
(902, 1, 164, 3, 9, NULL, '0900', 'Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs', 'Pampers-Baby-Dry-Size-8-Jumbo-Plus-Pack-Belt---52pcs', '<p>Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs</p>', 2500.00, '52 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697272Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs.jpg', NULL, NULL, '2020-03-20 03:41:12', '2020-08-27 10:22:52'),
(903, 1, 164, 3, 9, NULL, '0901', 'Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs', 'Pampers-Baby-Dry-Size-1-Jumbo-Plus-Pack-Belt---72-pcs', '<p>Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs</p>', 2100.00, '72 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697364Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs.jpg', NULL, NULL, '2020-03-20 03:42:44', '2020-08-27 10:22:53'),
(904, 1, 164, 3, 9, NULL, '0902', 'Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs', 'Pampers-Baby-Dry-Size-4-Essential-Pack-Pants---38-pcs', '<p>Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs</p>', 1600.00, '38 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697532Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs.jpg', NULL, NULL, '2020-03-20 03:45:32', '2020-08-27 10:22:53'),
(905, 1, 164, 3, 9, NULL, '0903', 'Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs', 'Pampers-Baby-Dry-Size-3-Essential-Pack-Pants---44-pcs', '<p>Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs</p>', 1600.00, '44 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697573Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs.jpg', NULL, NULL, '2020-03-20 03:46:13', '2020-08-27 10:22:53'),
(906, 1, 164, 3, 9, NULL, '0904', 'Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs', 'Pampers-Baby-Dry-Size-3-Jumbo-Plus-Pack-Pants---80-pcs', '<p>Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs</p>', 2500.00, '80 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697609Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs.jpg', NULL, NULL, '2020-03-20 03:46:49', '2020-08-27 10:22:53'),
(907, 1, 164, 3, 9, NULL, '0905', 'Pampers Baby Dry Pants Diaper Pant - 76 pcs', 'Pampers-Baby-Dry-Pants-Diaper-Pant---76-pcs', '<p>Pampers Baby Dry Pants Diaper Pant - 76 pcs</p>', 2100.00, '76 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697658Pampers Baby Dry Pants Diaper Pant - 76 pcs.jpg', NULL, NULL, '2020-03-20 03:47:38', '2020-08-27 10:22:53'),
(908, 1, 164, 3, 9, NULL, '0906', 'Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs', 'Pampers-Baby-Dry-Size-6-Jumbo-Plus-Pack-Belt---62-pcs', '<p>Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs</p>', 2500.00, '62 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697754Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs.jpg', NULL, NULL, '2020-03-20 03:49:14', '2020-08-27 10:22:53'),
(909, 1, 165, 3, 9, NULL, '0907', 'Huggies Baby Diaper Ultra Belt - 40pcs', 'Huggies-Baby-Diaper-Ultra-Belt---40pcs', '<p>Huggies Baby Diaper Ultra Belt - 40pcs</p>', 1700.00, '40 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584697983Huggies Baby Diaper Ultra Belt - 40pcs.jpg', NULL, NULL, '2020-03-20 03:53:03', '2020-08-27 10:22:53'),
(910, 1, 165, 3, 9, NULL, '0908', 'Huggies Baby Diaper Ultra Belt - 34 pcs', 'Huggies-Baby-Diaper-Ultra-Belt---34-pcs', '<p>Huggies Baby Diaper Ultra Belt - 34 pcs</p>', 1660.00, '34 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698020Huggies Baby Diaper Ultra Belt - 34 pcs.jpg', NULL, NULL, '2020-03-20 03:53:40', '2020-08-27 10:22:53'),
(911, 1, 165, 3, 9, NULL, '0909', 'Huggies Baby Diaper Ultra Belt - 44 pcs', 'Huggies-Baby-Diaper-Ultra-Belt---44-pcs', '<p>Huggies Baby Diaper Ultra Belt - 44 pcs</p>', 1600.00, '44 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698055Huggies Baby Diaper Ultra Belt - 44 pcs.jpg', NULL, NULL, '2020-03-20 03:54:15', '2020-08-27 10:22:53'),
(912, 1, 165, 3, 9, NULL, '0910', 'Huggies Dry Baby Diaper Belt - 30 pcs', 'Huggies-Dry-Baby-Diaper-Belt---30-pcs', '<p>Huggies Dry Baby Diaper Belt - 30 pcs</p>', 850.00, '30 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698084Huggies Dry Baby Diaper Belt - 30 pcs.jpg', NULL, NULL, '2020-03-20 03:54:44', '2020-08-27 10:22:53'),
(913, 1, 165, 3, 9, NULL, '0911', 'Huggies Dry Baby Diaper Belt  - 30 pcs', 'Huggies-Dry-Baby-Diaper-Belt---30-pcs', '<p>Huggies Dry Baby Diaper Belt &nbsp;- 30 pcs</p>', 880.00, '30 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698114Huggies Dry Baby Diaper Belt  - 30 pcs.jpg', NULL, NULL, '2020-03-20 03:55:14', '2020-08-27 10:22:53'),
(914, 1, 165, 3, 9, NULL, '0912', 'Huggies Baby Diaper Dry Belt - 36 pcs', 'Huggies-Baby-Diaper-Dry-Belt---36-pcs', '<p>Huggies Baby Diaper Dry Belt - 36 pcs&nbsp;</p>', 850.00, '36 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698148Huggies Baby Diaper Dry Belt - 36 pcs.jpg', NULL, NULL, '2020-03-20 03:55:48', '2020-08-27 10:22:53'),
(915, 1, 165, 3, 9, NULL, '0913', 'Huggies Baby Diaper WonderPants Pant - 42 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---42-pcs', '<p>Huggies Baby Diaper WonderPants Pant - 42 pcs</p>', 1120.00, '42 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698190Huggies Baby Diaper WonderPants Pant - 42 pcs.jpg', NULL, NULL, '2020-03-20 03:56:30', '2020-08-27 10:22:53'),
(916, 1, 165, 3, 9, NULL, '0914', 'Huggies Baby Diaper WonderPants Pant - 24 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---24-pcs', '<p>Huggies Baby Diaper WonderPants Pant - 24 pcs</p>', 1160.00, '24 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698224Huggies Baby Diaper WonderPants Pant - 24 pcs.jpg', NULL, NULL, '2020-03-20 03:57:04', '2020-08-27 10:22:53'),
(917, 1, 165, 3, 9, NULL, '0915', 'Huggies Baby Diaper WonderPants Pant - 46 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---46-pcs', '<p>Huggies Baby Diaper WonderPants Pant - 46 pcs</p>', 1520.00, '46 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698258Huggies Baby Diaper WonderPants Pant - 46 pcs.jpg', NULL, NULL, '2020-03-20 03:57:38', '2020-08-27 10:22:53'),
(918, 1, 165, 3, 9, NULL, '0916', 'Huggies Baby Diaper WonderPants Pant - 38 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---38-pcs', '<p>Huggies Baby Diaper WonderPants Pant - 38 pcs</p>', 1380.00, '38 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698289Huggies Baby Diaper WonderPants Pant - 38 pcs.jpg', NULL, NULL, '2020-03-20 03:58:09', '2020-08-27 10:22:53'),
(919, 1, 165, 3, 9, NULL, '0917', 'Huggies Baby Diaper WonderPants Pant - 54 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---54-pcs', '<p>Huggies Baby Diaper WonderPants Pant - 54 pcs</p>', 1595.00, '54 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698611Huggies Baby Diaper WonderPants Pant - 54 pcs.jpg', NULL, NULL, '2020-03-20 04:03:31', '2020-08-27 10:22:53'),
(920, 1, 165, 3, 9, NULL, '0918', 'Huggies Baby Diaper WonderPants Pant - 38 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---38-pcs', '<p>Huggies Baby Diaper WonderPants Pant - 38 pcs</p>', 1120.00, '38 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698645Huggies Baby Diaper WonderPants Pant - 38 pcs.jpg', NULL, NULL, '2020-03-20 04:04:05', '2020-08-27 10:22:53'),
(921, 1, 165, 3, 9, NULL, '0919', 'Huggies Baby Diaper WonderPants Pant  - 28 pcs', 'Huggies-Baby-Diaper-WonderPants-Pant---28-pcs', '<p>Huggies Baby Diaper WonderPants Pant &nbsp;- 28 pcs</p>', 1030.00, '28 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698687Huggies Baby Diaper WonderPants Pant  - 28 pcs.jpg', NULL, NULL, '2020-03-20 04:04:47', '2020-08-27 10:22:53'),
(922, 1, 165, 3, 9, NULL, '0920', 'Huggies Dry Baby Belt Diaper - 60 pcs', 'Huggies-Dry-Baby-Belt-Diaper---60-pcs', '<p>Huggies Dry Baby Belt Diaper - 60 pcs</p>', 1500.00, '60 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698718Huggies Dry Baby Belt Diaper - 60 pcs.jpg', NULL, NULL, '2020-03-20 04:05:18', '2020-08-27 10:22:53'),
(923, 1, 165, 3, 9, NULL, '0921', 'Huggies Dry Baby Diaper Belt - 60 pcs', 'Huggies-Dry-Baby-Diaper-Belt---60-pcs', '<p>Huggies Dry Baby Diaper Belt - 60 pcs</p>', 1570.00, '60 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698750Huggies Dry Baby Diaper Belt - 60 pcs.jpg', NULL, NULL, '2020-03-20 04:05:50', '2020-08-27 10:22:53'),
(924, 1, 165, 3, 9, NULL, '0922', 'Huggies Dry Baby Diaper Belt - 72 pcs', 'Huggies-Dry-Baby-Diaper-Belt---72-pcs', '<p>Huggies Dry Baby Diaper Belt - 72 pcs</p>', 1500.00, '72 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584698996Huggies Dry Baby Diaper Belt - 72 pcs.jpg', NULL, NULL, '2020-03-20 04:09:56', '2020-08-27 10:22:53'),
(925, 1, 165, 3, 9, NULL, '0923', 'Huggies Dry Pants Baby Diaper Pant - 50 pcs', 'Huggies-Dry-Pants-Baby-Diaper-Pant---50-pcs', '<p>Huggies Dry Pants Baby Diaper Pant - 50 pcs</p>', 1400.00, '50 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699031Huggies Dry Pants Baby Diaper Pant - 50 pcs.jpg', NULL, NULL, '2020-03-20 04:10:31', '2020-08-27 10:22:53'),
(926, 1, 165, 3, 9, NULL, '0924', 'Huggies Dry Pants Baby Diaper Pant - 42 pcs', 'Huggies-Dry-Pants-Baby-Diaper-Pant---42-pcs', '<p>Huggies Dry Pants Baby Diaper Pant - 42 pcs</p>', 1400.00, '42 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699062Huggies Dry Pants Baby Diaper Pant - 42 pcs.jpg', NULL, NULL, '2020-03-20 04:11:02', '2020-08-27 10:22:53'),
(927, 1, 165, 3, 9, NULL, '0925', 'Huggies Dry Pants Baby Diaper Pant  - 60 pcs', 'Huggies-Dry-Pants-Baby-Diaper-Pant---60-pcs', '<p>Huggies Dry Pants Baby Diaper Pant &nbsp;- 60 pcs</p>', 1400.00, '60 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699092Huggies Dry Pants Baby Diaper Pant  - 60 pcs.jpg', NULL, NULL, '2020-03-20 04:11:32', '2020-08-27 10:22:53'),
(928, 1, 165, 3, 9, NULL, '0926', 'Huggies Dry Baby Diaper Belt - 48 pcs', 'Huggies-Dry-Baby-Diaper-Belt---48-pcs', '<p>Huggies Dry Baby Diaper Belt - 48 pcs</p>', 1500.00, '48 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699123Huggies Dry Baby Diaper Belt - 48 pcs.jpg', NULL, NULL, '2020-03-20 04:12:03', '2020-08-27 10:22:53'),
(929, 1, 165, 3, 9, NULL, '0927', 'Huggies Dry Pants Baby Diaper Pant - 66 pcs', 'Huggies-Dry-Pants-Baby-Diaper-Pant---66-pcs', '<p>Huggies Dry Pants Baby Diaper Pant - 66 pcs</p>', 1400.00, '66 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699658Huggies Dry Pants Baby Diaper Pant - 66 pcs.jpg', NULL, NULL, '2020-03-20 04:20:58', '2020-08-27 10:22:53'),
(930, 1, 165, 3, 9, NULL, '0928', 'Huggies Gold Diaper Ultra Pants Boys & Girls - 38 pcs', 'Huggies-Gold-Diaper-Ultra-Pants-Boys-&-Girls---38-pcs', '<p>Huggies Gold Diaper Ultra Pants Boys &amp; Girls - 38 pcs</p>', 1800.00, '38 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699689Huggies Gold Diaper Ultra Pants Boys & Girls - 38 pcs.jpg', NULL, NULL, '2020-03-20 04:21:29', '2020-08-27 10:22:53'),
(931, 1, 165, 3, 9, NULL, '0929', 'Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs', 'Huggies-Dry-Pants-Baby-Diaper-(Pant-)---32-pcs', '<p>Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs</p>', 1400.00, '32 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699721Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs.jpg', NULL, NULL, '2020-03-20 04:22:01', '2020-08-27 10:22:53'),
(932, 1, 165, 3, 9, NULL, '0930', 'Huggies Dry Baby Diaper New Born Belt - 64 pcs', 'Huggies-Dry-Baby-Diaper-New-Born-Belt---64-pcs', '<p>Huggies Dry Baby Diaper New Born Belt - 64 pcs</p>', 1400.00, '64 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699771Huggies Dry Baby Diaper New Born Belt - 64 pcs.jpg', NULL, NULL, '2020-03-20 04:22:51', '2020-08-27 10:22:53'),
(933, 1, 165, 3, 9, NULL, '0931', 'Huggies Baby Diaper Ultra New Born Belt - 48 pcs', 'Huggies-Baby-Diaper-Ultra-New-Born-Belt---48-pcs', '<p>Huggies Baby Diaper Ultra New Born Belt - 48 pcs</p>', 1600.00, '48 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699804Huggies Baby Diaper Ultra New Born Belt - 48 pcs.jpg', NULL, NULL, '2020-03-20 04:23:24', '2020-08-27 10:22:53'),
(934, 1, 165, 3, 9, NULL, '0932', 'Huggies Dry Pants Baby Diaper Belt - 40 pcs', 'Huggies-Dry-Pants-Baby-Diaper-Belt---40-pcs', '<p>Huggies Dry Pants Baby Diaper Belt - 40 pcs</p>', 1600.00, '40 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699877Huggies Dry Pants Baby Diaper Belt - 40 pcs.jpg', NULL, NULL, '2020-03-20 04:24:37', '2020-08-27 10:22:53'),
(935, 1, 165, 3, 9, NULL, '0933', 'Huggies Baby Diaper Ultra Belt - 30 pcs', 'Huggies-Baby-Diaper-Ultra-Belt---30-pcs', '<p>Huggies Baby Diaper Ultra Belt - 30 pcs</p>', 1400.00, '30 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584699924Huggies Baby Diaper Ultra Belt - 30 pcs.jpg', NULL, NULL, '2020-03-20 04:25:24', '2020-08-27 10:22:53'),
(936, 1, 166, 3, 9, NULL, '0934', 'MamyPoko Pants Diaper Pant - 36 pcs', 'MamyPoko-Pants-Diaper-Pant---36-pcs', '<p>MamyPoko Pants Diaper Pant - 36 pcs</p>', 1200.00, '36 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584700023MamyPoko Pants Diaper Pant - 36 pcs.jpg', NULL, NULL, '2020-03-20 04:27:03', '2020-08-27 10:22:53'),
(937, 1, 166, 3, 9, NULL, '0935', 'MamyPoko Pants Diaper Pant - 42 pcs', 'MamyPoko-Pants-Diaper-Pant---42-pcs', '<p>MamyPoko Pants Diaper Pant - 42 pcs</p>', 1200.00, '42 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584700058MamyPoko Pants Diaper Pant - 42 pcs.jpg', NULL, NULL, '2020-03-20 04:27:38', '2020-08-27 10:22:53'),
(938, 1, 166, 3, 9, NULL, '0936', 'MamyPoko Pants Diaper Pant - 52 pcs', 'MamyPoko-Pants-Diaper-Pant---52-pcs', '<p>MamyPoko Pants Diaper Pant - 52 pcs</p>', 1200.00, '52 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584700093MamyPoko Pants Diaper Pant - 52 pcs.jpg', NULL, NULL, '2020-03-20 04:28:13', '2020-08-27 10:22:53'),
(939, 1, 166, 3, 9, NULL, '0937', 'MamyPoko Pants Diaper Pant - 44 pcs', 'MamyPoko-Pants-Diaper-Pant---44-pcs', '<p>MamyPoko Pants Diaper Pant - 44 pcs</p>', 1400.00, '44 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584700357MamyPoko Pants Diaper Pant - 44 pcs.jpg', NULL, NULL, '2020-03-20 04:32:37', '2020-08-27 10:22:53'),
(940, 1, 166, 3, 9, NULL, '0938', 'MamyPoko Pants Diaper Pant - 32 pcs', 'MamyPoko-Pants-Diaper-Pant---32-pcs', '<p>MamyPoko Pants Diaper Pant - 32 pcs</p>', 1100.00, '32 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584700442MamyPoko Pants Diaper Pant - 32 pcs.jpg', NULL, NULL, '2020-03-20 04:34:02', '2020-08-27 10:22:53'),
(941, 1, 166, 3, 9, NULL, '0939', 'MamyPoko Pants Diaper (Pant) - 22 pcs', 'MamyPoko-Pants-Diaper-(Pant)---22-pcs', '<p>MamyPoko Pants Diaper (Pant) - 22 pcs</p>', 1080.00, '22 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584702899MamyPoko Pants Diaper (Pant) - 22 pcs.jpg', NULL, NULL, '2020-03-20 05:14:59', '2020-08-27 10:22:53'),
(942, 1, 166, 3, 9, NULL, '0940', 'MamyPoko Pants Diaper Boys Pant - 64 pcs', 'MamyPoko-Pants-Diaper-Boys-Pant---64-pcs', '<p>MamyPoko Pants Diaper Boys Pant - 64 pcs</p>', 2500.00, '64 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584702937MamyPoko Pants Diaper Boys Pant - 64 pcs.jpg', NULL, NULL, '2020-03-20 05:15:37', '2020-08-27 10:22:53'),
(943, 1, 166, 3, 9, NULL, '0941', 'MamyPoko Pants Diaper Pant Boys - 52 pcs', 'MamyPoko-Pants-Diaper-Pant-Boys---52-pcs', '<p>MamyPoko Pants Diaper Pant Boys - 52 pcs</p>', 2500.00, '52 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584702970MamyPoko Pants Diaper Pant Boys - 52 pcs.jpg', NULL, NULL, '2020-03-20 05:16:10', '2020-08-27 10:22:53'),
(944, 1, 166, 3, 9, NULL, '0942', 'MamyPoko Pants Diaper Pant - 58 pcs', 'MamyPoko-Pants-Diaper-Pant---58-pcs', '<p>MamyPoko Pants Diaper Pant - 58 pcs</p>', 1400.00, '58 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1594363611mamy.jpg', NULL, NULL, '2020-03-20 05:18:04', '2020-08-27 10:22:53'),
(945, 1, 166, 3, 9, NULL, '0943', 'MamyPoko Pants Boys Diaper Pant - 46 pcs', 'MamyPoko-Pants-Boys-Diaper-Pant---46-pcs', '<p>MamyPoko Pants Boys Diaper Pant - 46 pcs</p>', 2500.00, '46 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584703117MamyPoko Pants Boys Diaper Pant - 46 pcs.jpg', NULL, NULL, '2020-03-20 05:18:37', '2020-08-27 10:22:53'),
(946, 1, 166, 3, 9, NULL, '0944', 'MamyPoko Pants Baby Diaper Pant Girls - 38 pcs', 'MamyPoko-Pants-Baby-Diaper-Pant-Girls---38-pcs', '<p>MamyPoko Pants Baby Diaper Pant Girls - 38 pcs</p>', 2500.00, '38 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584703155MamyPoko Pants Baby Diaper Pant Girls - 38 pcs.jpg', NULL, NULL, '2020-03-20 05:19:15', '2020-08-27 10:22:53'),
(947, 1, 166, 3, 9, NULL, '0945', 'MamyPoko Pants Baby Diaper Pant Girls - 52 pcs', 'MamyPoko-Pants-Baby-Diaper-Pant-Girls---52-pcs', '<p>MamyPoko Pants Baby Diaper Pant Girls - 52 pcs</p>', 2500.00, '52 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584703189MamyPoko Pants Baby Diaper Pant Girls - 52 pcs.jpg', NULL, NULL, '2020-03-20 05:19:49', '2020-08-27 10:22:53'),
(948, 1, 166, 3, 9, NULL, '0946', 'MamyPoko Pants Diaper Pant - 36 pcs', 'MamyPoko-Pants-Diaper-Pant---36-pcs', '<p>MamyPoko Pants Diaper Pant - 36 pcs</p>', 1500.00, '36 Pcs', NULL, NULL, 'In Stock', 100, NULL, 0, '1584703224MamyPoko Pants Diaper Pant - 36 pcs.jpg', NULL, NULL, '2020-03-20 05:20:24', '2020-08-27 10:22:53'),
(949, 1, 84, 1, 8, NULL, '0947', 'Onion (Imported)', 'Onion-(Imported)', '<ul>\r\n	<li>Importted Onion&nbsp;</li>\r\n	<li>Orgin:&nbsp;Turkey</li>\r\n</ul>', 40.00, '1', NULL, NULL, 'In Stock', 100, NULL, 0, '1594152926onion imported.png', NULL, NULL, '2020-03-21 11:35:20', '2020-08-27 10:22:53'),
(950, 1, 84, 1, 8, NULL, '0948', 'Onion | Deshi Piyaj Big Size', 'Onion-|-Deshi-Piyaj-Big-Size', '<ul>\r\n	<li>Desi Onion</li>\r\n	<li>Big size</li>\r\n</ul>', 80.00, '1', NULL, NULL, 'In Stock', 100, NULL, 0, '1594153115onion deshi.webp', NULL, NULL, '2020-03-21 11:37:30', '2020-08-27 10:22:53'),
(951, 1, 84, 1, 8, NULL, '0949', 'Onion Red', 'Onion-Red', '<p>Red onions have a slightly sweeter and milder flavor than brown onions. Also known as Spanish onions, they are used both raw and cooked. They&#39;re great in salsas, salads and dips, as well as in pasta sauces and cooked vegetable dishes. Red onions are available all year round.</p>', 85.00, '1', NULL, NULL, 'In Stock', 100, NULL, 0, '1584812427onion red.jpg', NULL, NULL, '2020-03-21 11:40:27', '2020-08-27 10:22:53'),
(952, 1, 84, 1, 1, NULL, '0950', 'হিমসাগর আম । রাজশাহী', 'eyJpdiI6IjZ4M3R6aXRKOGpJMTBcL1pydkthSmJRPT0iLCJ2YWx1ZSI6IjRxd0tjcmJxbUNBYnc4T3ozaTlPNkR6SkVZYnJpZ0NEUTMxY0lPUEJmMGFvWTVjeXByMm83ZlhhajVmUWRXdjVyU1QycGN2NldjMExpUFNla0xNdm9RPT0iLCJtYWMiOiIzZWZhZDE5MWQ2ODk5NWMwYjI2NjM4YzM3M2ViMTE2ZmMzODY5YjViNjliMzViZGVlM2NkOTVhZDM1NDBkMmUzIn0=', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত ।</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আম।&nbsp;</li>\r\n</ul>', 0.00, '1 Kg', NULL, NULL, 'In Stock', 1000, NULL, 0, '158876581232_t.jpg', NULL, NULL, '2020-05-06 15:50:12', '2020-10-30 13:48:53'),
(955, 1, 2, 1, 1, NULL, '0953', 'আম রুপালি । রাজশাহী', 'eyJpdiI6IitXeENtdVRsZFlFVUlIdzZPQm9YYUE9PSIsInZhbHVlIjoiM0VZZEhOTmt6Qm9GRHZKSitmdDFZSlwvTTFlQ1ZpOFdrXC82c0dPckhZN210VWJtNGtvUnZhaWhDOWxKamJ1bW5OdVwvRHhLd2h0VTB6VFJwVkc2Z3YwRGc9PSIsIm1hYyI6IjNiMDczY2E3NGJlMjBmNDdhYTI0OWZlNDY2NGIwOThjYWZjMWQyZTg0ZWI0MTViOWNhMWEzMTk4ZDUyNDBiNjcifQ==', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত&nbsp;</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আমের নিশ্চয়তা।</li>\r\n	<li>কোন প্রকার ভেজাল যেমন ক্ষতিকারক ক্যমিক্যাল বা ফরমালিন প্রমান করতে পারলেই নগদ টাকা পুরস্কার।</li>\r\n</ul>', 90.00, '1 Kg', NULL, NULL, 'Out Of Stock', 1000, NULL, 0, '1588766729AamRupali.jpg', NULL, NULL, '2020-05-06 16:05:29', '2020-10-30 13:46:21'),
(956, 1, 2, 1, 1, NULL, '0954', 'গোপালভোগ আম | রাজশাহী', 'eyJpdiI6IjVPeWJ0WFVnR1wvc2VyN2prdVU3Nnd3PT0iLCJ2YWx1ZSI6InNMbnVhVzI1V01tZHN3XC9ISXpGS1FNczlOMFlYRUxUVGN4R1FraXNHT1NzcGc0cUVXbldLQm1LREZZRTI5T2NIanR6MmxQbTNiZDd3ZGxoM0Y3ZGwzQT09IiwibWFjIjoiOGM1NTMxYmEzYmVjMDMwNTM2NjM5N2U4NjM3ZmJjYmZiZWYxZjhiOThlMmEwMWRjODBlOGY3NzNmZDEyZTc5MyJ9', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত&nbsp;</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আমের নিশ্চয়তা।</li>\r\n	<li>কোন প্রকার ভেজাল যেমন ক্ষতিকারক ক্যমিক্যাল বা ফরমালিন প্রমান করতে পারলেই নগদ টাকা পুরস্কার।</li>\r\n</ul>', 85.00, '1 Kg', NULL, NULL, 'Out Of Stock', 1000, NULL, 0, '1588766786gopalvog.webp', NULL, NULL, '2020-05-06 16:06:26', '2020-10-30 13:46:31'),
(957, 1, 2, 1, 1, NULL, '0955', 'ল্যাংড়া আম | রাজশাহী', 'eyJpdiI6InRPbnF6R2RnZ3NTcFwvMW84ZHpBNlZ3PT0iLCJ2YWx1ZSI6ImVWYnNlT3BNUHBaa3NJV3U5ZzFsS0lBWVhJVlwvUDJzVEsrYnR5MFowSjgxTkplZVk4eEJsKzMwSHMwT2ZhNnUrVXBsMXJodUNmVVV3TUpFTmcyQTlZQT09IiwibWFjIjoiZjJjMjM4Yzk3OWQ1OTY0OTgyZjE4YjU0NTI1OTNmMTY4ZDI4MDVlZTk4YzU3M2ZiNmYzN2RlYjIyMDZiNzBjOSJ9', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত&nbsp;</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আমের নিশ্চয়তা।</li>\r\n	<li>কোন প্রকার ভেজাল যেমন ক্ষতিকারক ক্যমিক্যাল বা ফরমালিন প্রমান করতে পারলেই নগদ টাকা পুরস্কার।</li>\r\n</ul>', 0.00, '1 Kg', NULL, NULL, 'Out Of Stock', 1000, NULL, 0, '1588767401langra-mango-rajshahi.jpeg', NULL, NULL, '2020-05-06 16:07:23', '2020-10-30 13:46:47'),
(958, 1, 84, 1, 1, NULL, '0956', 'রাজশাহী বোম্বে লিচু । ১০০ পিস', 'রাজশাহী-বোম্বে-লিচু-।-১০০-পিস', '<ul>\r\n	<li>100% Chemical free Lychee</li>\r\n	<li>Rajshahi Bombe Lychee</li>\r\n</ul>', 450.00, '100 pcs', NULL, NULL, 'Out Of Stock', 10000, NULL, 0, '1590891931Lychee-Fruit.jpg', NULL, NULL, '2020-05-31 06:25:31', '2020-08-27 10:22:53'),
(962, 1, 2, 10, NULL, NULL, '0960', 'Native Breed White and Gray Cow', 'Native-Breed-White-and-Gray-Cow', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: White and Gray</li>\r\n	<li>Meat weight (Approx): 90-110 kg</li>\r\n	<li>Live weight (Approx): 190-210 kg</li>\r\n	<li>Teeth: 2</li>\r\n	<li>Age: 24 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 46 Inch</li>\r\n</ul>', 70500.00, '200kg', NULL, NULL, 'Out Of Stock', 100, NULL, 0, '1594285098cow.jpg', NULL, NULL, '2020-07-09 12:58:18', '2020-08-27 10:22:53'),
(963, 1, 2, 10, NULL, NULL, '0961', 'Native Breed Black and White Cow', 'Native-Breed-Black-and-White-Cow', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Black and White</li>\r\n	<li>Meat weight (Approx): 120-140 kg</li>\r\n	<li>Live weight (Approx): 180-220 kg</li>\r\n	<li>Teeth: 2</li>\r\n	<li>Age: 30 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 45 Inch</li>\r\n</ul>', 118200.00, '220kg', NULL, NULL, 'Out Of Stock', 100, NULL, 0, '1594285294013a31eff3e581df8e3279dd1e0349ca.jpg_80x80q90.jpg', NULL, NULL, '2020-07-09 13:01:34', '2020-08-27 10:22:53'),
(964, 1, 2, 10, NULL, NULL, '0962', 'Native Breed Black Mete Cow', 'Native-Breed-Black-Mete-Cow', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Black Mete</li>\r\n	<li>Meat weight (Approx): 240-260 kg</li>\r\n	<li>Live weight (Approx): 427&nbsp;kg</li>\r\n	<li>Teeth: 6</li>\r\n	<li>Age: 30 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 58 Inch</li>\r\n</ul>', 185300.00, '260kg', NULL, NULL, 'Out Of Stock', 100, NULL, 0, '159428559077ac698a2ac853fb86f2b00e2d0f6710.jpg_80x80q90.jpg', NULL, NULL, '2020-07-09 13:06:30', '2020-08-27 10:22:53'),
(965, 1, 2, 10, NULL, NULL, '0963', 'Native Breed Red Cow', 'Native-Breed-Red-Cow', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Red</li>\r\n	<li>Meat weight (Approx):210-240 kg</li>\r\n	<li>Live weight (Approx): 370-390</li>\r\n	<li>Teeth:2</li>\r\n	<li>Age:22 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 42 Inch</li>\r\n</ul>', 173100.00, '390kg', NULL, NULL, 'Out Of Stock', 100, NULL, 0, '1594285791cow1.jpg', NULL, NULL, '2020-07-09 13:09:51', '2020-08-27 10:22:53'),
(966, 1, 2, 10, NULL, NULL, '0964', 'Native Breed Red and Black Cow', 'Native-Breed-Red-and-Black-Cow', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Red and Black</li>\r\n	<li>Meat weight (Approx): 220-245&nbsp;kg</li>\r\n	<li>Live weight (Approx): 360-370 kg</li>\r\n	<li>Teeth: 4</li>\r\n	<li>Age: 38 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 55 Inch</li>\r\n</ul>', 159000.00, '245kg', NULL, NULL, 'Out Of Stock', 100, NULL, 0, '1594285963cow3.jpg', NULL, NULL, '2020-07-09 13:12:43', '2020-08-27 10:22:53'),
(967, 1, 84, 2, NULL, NULL, '0965', 'Pure Honey | Sundarban  500 gm', 'Pure-Honey-|-Sundarban-500-gm', '<ul>\r\n	<li>Sundarban Er Pure Honey</li>\r\n	<li>Kholisha Fuler Modhu</li>\r\n	<li>100% Pure and Natural</li>\r\n	<li>No Chamical No Sugar</li>\r\n	<li>100% Organic</li>\r\n</ul>', 525.00, '500 gm', 499.00, '5%', 'In Stock', 1000, 0, 0, '1594853370sundarbon honey websize 500gm.jpg', NULL, NULL, '2020-07-16 02:49:30', '2020-08-27 10:22:53'),
(968, 1, 84, 1, 1, NULL, '0966', 'Fozli Mango | 3kg', 'eyJpdiI6Ikt0TDhmeUJDMUFPWU1sVzRRWGkxSHc9PSIsInZhbHVlIjoiN3FGUzZPdFF0YlBnTU1QNW84REVvSzhYZThMZFZLNUtyb0k5VzlEK1RsND0iLCJtYWMiOiI2ZGFkNjI4Mzk1OGU4NmE0NjNmNWNmZDJjNTYxZmM5OTBmMTkwMDA4YmMzZmFkNGZkY2MxNjRmMTAxOTFjMTBmIn0=', '<ul>\r\n	<li>Rajshahi Pemium Fozli</li>\r\n	<li>Average weught 600-800gm per mango</li>\r\n</ul>', 85.00, '1 Kg', NULL, NULL, 'Out Of Stock', 1000, 0, 0, '1594938009fozli-mango.png', NULL, NULL, '2020-07-17 02:20:09', '2020-10-30 13:49:17');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(969, 1, 2, 1, 8, NULL, '0967', 'Mozammel Special Miniket Rice| 20kg', 'Mozammel-Special-Miniket-Rice|-20kg', '<ul>\r\n	<li>Mozammel Special Miniket Rice</li>\r\n	<li>Weight&nbsp;&nbsp;20kg</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 1350.00, '20 kg', 1275.00, '6%', 'In Stock', 100, 0, 0, '1595104796mozammal miniket 20kg.jpg', NULL, NULL, '2020-07-19 00:39:56', '2020-08-27 10:22:53'),
(970, 1, 2, 1, 8, NULL, '0968', 'Mozammel Special Chinigura Rice – 1Kg', 'Mozammel-Special-Chinigura-Rice-–-1Kg', '<ul>\r\n	<li>Mozammel Special Chinigura Rice &ndash; 1Kg</li>\r\n</ul>', 125.00, '1 Kg', 115.00, '8%', 'In Stock', 100, 0, 0, '1595104946mozammal chinigura 1kg.jpg', NULL, NULL, '2020-07-19 00:42:26', '2020-08-27 10:22:53'),
(971, 1, 84, 1, 8, NULL, '0969', 'Nazirshail Rice Premium | 5 kg', 'Nazirshail-Rice-Premium-|-5-kg', '<ul>\r\n	<li>Nazirshail Rice Premium</li>\r\n	<li>Best Quality Rice</li>\r\n</ul>', 295.00, '5kg', 285.00, '3%', 'In Stock', 100, 0, 0, '1595105252nazirshail-rice-premium-5-kg.jpg', NULL, NULL, '2020-07-19 00:47:32', '2020-08-27 10:22:53'),
(972, 1, 2, 1, 8, NULL, '0970', 'Chinigura Rice | 1 kg', 'Chinigura-Rice-|-1-kg', '<ul>\r\n	<li>Chinigura Rice | 1 kg</li>\r\n	<li>Loose chinigura</li>\r\n</ul>', 90.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595105337chinigura-rice-1-kg.jpg', NULL, NULL, '2020-07-19 00:48:57', '2020-08-27 10:22:53'),
(973, 1, 4, 1, 8, NULL, '0971', 'Pran Chinigura Rice | 2 kg', 'Pran-Chinigura-Rice-|-2-kg', '<ul>\r\n	<li>Pran Chinigura Rice&nbsp; 2 kg</li>\r\n</ul>', 250.00, '2 kg', 235.00, '6%', 'In Stock', 100, 0, 0, '1595105570pran-chinigura-rice-2_1-kg.jpg', NULL, NULL, '2020-07-19 00:52:50', '2020-08-27 10:22:53'),
(974, 1, 2, 1, 8, NULL, '0972', 'Atop Rice | 1 kg', 'Atop-Rice-|-1-kg', '<ul>\r\n	<li>Atop Rice | 1 kg</li>\r\n</ul>', 45.00, '1 Kg', 40.00, '11%', 'In Stock', 100, 0, 0, '1595105634atop-rice-1-kg.jpg', NULL, NULL, '2020-07-19 00:53:54', '2020-08-27 10:22:53'),
(975, 1, 2, 1, 8, NULL, '0973', 'Katarivog Rice | 1 kg', 'Katarivog-Rice-|-1-kg', '<ul>\r\n	<li>Katarivog Rice | 1 kg</li>\r\n</ul>', 90.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595105684katarivog-rice-1-kg.jpg', NULL, NULL, '2020-07-19 00:54:44', '2020-08-27 10:22:53'),
(976, 1, 2, 1, 8, NULL, '0974', 'Rupchanda Chinigura Premium Aromatic Rice | 1kg', 'Rupchanda-Chinigura-Premium-Aromatic-Rice-|-1kg', '<ul>\r\n	<li>Rupchanda Chinigura Premium Aromatic Rice</li>\r\n</ul>', 135.00, '1 Kg', 125.00, '7%', 'In Stock', 100, 0, 0, '1595105750rupchanda-chinigura-premium-aromatic-rice-1-kg.jpg', NULL, NULL, '2020-07-19 00:55:50', '2020-08-27 10:22:53'),
(977, 1, 2, 1, 8, NULL, '0975', 'Rashid Miniket - 10kg', 'Rashid-Miniket---10kg', '<ul>\r\n	<li>Rashid Miniket - 10kg</li>\r\n</ul>', 680.00, '10 kg', NULL, NULL, 'In Stock', 100, 0, 0, '15951069779301a98b7ac7-nazirshail-rice-premium-5-kg.jpg', NULL, NULL, '2020-07-19 01:16:17', '2020-08-27 10:22:53'),
(978, 1, 2, 1, 8, NULL, '0976', 'Rashid Miniket Rice - 25kg', 'Rashid-Miniket-Rice---25kg', '<ul>\r\n	<li>Rashid Miniket Rice</li>\r\n</ul>', 1920.00, '25 kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595107052bddb100058f9-0289979_rashid-miniket-rice-25kg.jpeg', NULL, NULL, '2020-07-19 01:17:32', '2020-08-27 10:22:53'),
(979, 1, 2, 1, 8, NULL, '0977', 'Ginger Local ( Deshi Ada ) 1kg', 'Ginger-Local-(-Deshi-Ada-)-1kg', '<ul>\r\n	<li>Ginger Local</li>\r\n	<li>Big SIze</li>\r\n	<li>Fresh&nbsp;</li>\r\n</ul>', 230.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595107435ed69e1f6495b-ginger-local-500x500.jpg', NULL, NULL, '2020-07-19 01:23:55', '2020-08-27 10:22:53'),
(980, 1, 2, 1, 8, NULL, '0978', 'Garlic Premium (Big) - 1KG', 'Garlic-Premium-(Big)---1KG', '<ul>\r\n	<li>Garlic Premium</li>\r\n	<li>Big Size&nbsp;</li>\r\n</ul>', 130.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595107565ce3f94e2ffa0-download.jpg', NULL, NULL, '2020-07-19 01:26:05', '2020-08-27 10:22:53'),
(981, 1, 2, 1, 8, NULL, '0979', 'Garlic Deshi Roshun - 1kg', 'Garlic-Deshi-Roshun---1kg', '<ul>\r\n	<li>Garlic Deshi Roshun</li>\r\n</ul>', 260.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595107630bed55ee4c8be-roshun.jpg', NULL, NULL, '2020-07-19 01:27:10', '2020-08-27 10:22:53'),
(982, 1, 2, 1, 8, NULL, '0980', 'Chalar Gura ( চালের গুঁড়া) -1kg', 'Chalar-Gura-(-চালের-গুঁড়া)--1kg', '<p>চালের গুড়াঃ<br />\r\n(পরিষ্কার, বাছাইকৃত এবং অতি যত্নসহকারে রোদে শুকানো)</p>\r\n\r\n<p>চিতই পিঠা, দুধ চিতই, ভাপা পিঠা, খোলা পিঠা, পুলী পিঠা, পোয়া পিঠা, নকশী পিঠা&hellip;. চালের গুড়ার কোনো পিঠাই এখন আর মিস হবেনা। সব রকমের চালের গুড়ার পিঠা তৈরি করতে পারবেন এখন খুব সহজে।</p>', 65.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1595108929rice-flour-500x500-416x416.jpg', NULL, NULL, '2020-07-19 01:48:49', '2020-08-27 10:22:53'),
(983, 1, 42, 1, 3, NULL, '0981', 'Ispahani Mirzapur Tea - 100 gm', 'Ispahani-Mirzapur-Tea---100-gm', '<ul>\r\n	<li>Ispahani Mirzapur Tea - 100 gm</li>\r\n	<li>Best Quality Tea</li>\r\n</ul>', 60.00, '100 gm', NULL, NULL, 'In Stock', 100, 0, 0, '15951092082019-07-24_052822.754956Thumbnail_5.jpg', NULL, NULL, '2020-07-19 01:53:28', '2020-08-27 10:22:53'),
(984, 1, 2, 10, NULL, NULL, '0982', 'Deshi Goru | EGC001', 'Deshi-Goru-|-EGC001', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা</li>\r\n</ul>', 190000.00, '500 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595262599EGC001.jpeg', NULL, NULL, '2020-07-20 20:29:59', '2020-08-27 10:22:53'),
(985, 1, 2, 10, NULL, NULL, '0983', 'Deshi Goru Big | EGC002', 'Deshi-Goru-Big-|-EGC002', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট ৪৫৮ কেজি&nbsp;</li>\r\n</ul>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -17px; top: -8px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 174000.00, '458 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595262801EGC002.jpeg', NULL, NULL, '2020-07-20 20:33:21', '2020-08-27 10:22:53'),
(986, 1, 2, 10, NULL, NULL, '0984', 'Deshi Goru Big | EGC003', 'Deshi-Goru-Big-|-EGC003', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 400&nbsp;কেজি&nbsp;</li>\r\n</ul>', 152000.00, '400 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595262872EGC003.jpeg', NULL, NULL, '2020-07-20 20:34:32', '2020-08-27 10:22:53'),
(987, 1, 2, 10, NULL, NULL, '0985', 'Deshi Goru Big | EGC004', 'Deshi-Goru-Big-|-EGC004', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 435&nbsp;কেজি&nbsp;</li>\r\n</ul>', 165300.00, '435 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595262970EGC004.jpeg', NULL, NULL, '2020-07-20 20:36:10', '2020-08-27 10:22:53'),
(988, 1, 2, 10, NULL, NULL, '0986', 'Deshi Goru Big | EGC005', 'Deshi-Goru-Big-|-EGC005', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 440&nbsp;কেজি&nbsp;</li>\r\n</ul>', 169400.00, '440 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595263205EGC005.jpeg', NULL, NULL, '2020-07-20 20:40:05', '2020-08-27 10:22:53'),
(989, 1, 2, 10, NULL, NULL, '0987', 'Deshi Goru Big | EGC006', 'Deshi-Goru-Big-|-EGC006', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 520&nbsp;কেজি&nbsp;</li>\r\n</ul>', 199000.00, '520 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595263313EGC006.jpeg', NULL, NULL, '2020-07-20 20:41:53', '2020-08-27 10:22:53'),
(990, 1, 2, 10, NULL, NULL, '0988', 'Deshi Goru Big | EGC007', 'Deshi-Goru-Big-|-EGC007', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 522&nbsp;কেজি&nbsp;</li>\r\n</ul>', 200970.00, '522 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595263383EGC007.jpeg', NULL, NULL, '2020-07-20 20:43:03', '2020-08-27 10:22:53'),
(991, 1, 2, 10, NULL, NULL, '0989', 'Deshi Goru Big | EGC008', 'Deshi-Goru-Big-|-EGC008', '<p>দেশী গরু<br />\r\nসরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;<br />\r\nলাইভ ওয়েট 520&nbsp;কেজি&nbsp;</p>', 199000.00, '520 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595263465EGC008.jpeg', NULL, NULL, '2020-07-20 20:44:25', '2020-08-27 10:22:53'),
(992, 1, 2, 10, NULL, NULL, '0990', 'Deshi Goru Big | EGC009', 'Deshi-Goru-Big-|-EGC009', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 439&nbsp;কেজি&nbsp;</li>\r\n</ul>', 169000.00, '439 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595263634EGC009.jpeg', NULL, NULL, '2020-07-20 20:47:14', '2020-08-27 10:22:53'),
(993, 1, 2, 10, NULL, NULL, '0991', 'Deshi Goru Medium | EGM-001', 'Deshi-Goru-Medium-|-EGM-001', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 170&nbsp;কেজি&nbsp;</li>\r\n</ul>', 71400.00, '170 KG', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595264017EGM-001.jpg', NULL, NULL, '2020-07-20 20:53:37', '2020-08-27 10:22:53'),
(994, 1, 2, 10, NULL, NULL, '0992', 'Deshi Goru Medium | EGM-002', 'Deshi-Goru-Medium-|-EGM-002', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 150&nbsp;কেজি&nbsp;</li>\r\n</ul>', 62500.00, '150 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595264146EGM-002.jpg', NULL, NULL, '2020-07-20 20:55:46', '2020-08-27 10:22:53'),
(995, 1, 2, 10, NULL, NULL, '0993', 'Deshi Goru Medium | EGM-003', 'Deshi-Goru-Medium-|-EGM-003', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 185&nbsp;কেজি&nbsp;</li>\r\n</ul>', 176775.00, '185 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595264226EGM-003.jpg', NULL, NULL, '2020-07-20 20:57:06', '2020-08-27 10:22:53'),
(996, 1, 2, 10, NULL, NULL, '0994', 'Deshi Goru Medium | EGM-004', 'Deshi-Goru-Medium-|-EGM-004', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 170&nbsp;কেজি&nbsp;</li>\r\n</ul>', 70550.00, '170 KG', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595264303EGM-004.jpg', NULL, NULL, '2020-07-20 20:58:23', '2020-08-27 10:22:53'),
(997, 1, 2, 10, NULL, NULL, '0995', 'Deshi Goru Medium | EGM-005', 'Deshi-Goru-Medium-|-EGM-005', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 176&nbsp;কেজি&nbsp;</li>\r\n</ul>', 73500.00, '176 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595264485EGM-005.jpg', NULL, NULL, '2020-07-20 21:01:25', '2020-08-27 10:22:53'),
(998, 1, 2, 10, NULL, NULL, '0996', 'Deshi Goru Medium | EGS001', 'Deshi-Goru-Medium-|-EGS001', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 220 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', 81500.00, '220 kg', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595440627EGS001_220kg.jpg', NULL, NULL, '2020-07-22 21:57:07', '2020-08-27 10:22:53'),
(999, 1, 2, 10, NULL, NULL, '0997', 'Deshi Goru Medium | EGS002', 'Deshi-Goru-Medium-|-EGS002', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 260 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', 99000.00, '275', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595441343EGS002_250.jpg', NULL, NULL, '2020-07-22 22:09:03', '2020-08-27 10:22:53'),
(1000, 1, 2, 10, NULL, NULL, '0998', 'Deshi Goru Medium | EGS003', 'Deshi-Goru-Medium-|-EGS003', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 170</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', 62500.00, '170 KG', NULL, NULL, 'Out Of Stock', 1, 0, 0, '1595441577EGS003_160.jpg', NULL, NULL, '2020-07-22 22:12:57', '2020-08-27 10:22:53'),
(1001, 1, 2, 10, NULL, NULL, '0999', 'Deshi Goru Medium | EGS004', 'Deshi-Goru-Medium-|-EGS004', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 225 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', 83250.00, '225 kg', NULL, NULL, 'Out Of Stock', 11, 0, 0, '1595441837EGS004_1.jpg', NULL, NULL, '2020-07-22 22:17:17', '2020-08-27 10:22:53'),
(1002, 1, 2, 10, NULL, NULL, '1000', 'Deshi Goru Medium | EGS005', 'Deshi-Goru-Medium-|-EGS005', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 210 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', 77700.00, '210 kg', NULL, NULL, 'Out Of Stock', 11, 0, 0, '1595442252EGS005_210.jpg', NULL, NULL, '2020-07-22 22:24:12', '2020-08-27 10:22:53'),
(1003, 1, 84, 1, 4, NULL, '1001', 'Hilsha (ইলিশ) Fish | 700-900 gm', 'Hilsha-(ইলিশ)-Fish-|-700-900-gm', '<ul>\r\n	<li>পদ্মার ইলিশ মাছ।</li>\r\n	<li>সরাসরি চাঁদপুর থেকে ।&nbsp;</li>\r\n	<li>তাজা ইলিশ মাছ।&nbsp;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 950.00, '1 Kg', NULL, NULL, 'In Stock', 1000, 0, 0, '1596820980ilish Fish.png', NULL, NULL, '2020-08-07 21:23:00', '2020-08-27 10:22:53'),
(1004, 1, 84, 1, 4, NULL, '1002', 'Hilsha (ইলিশ) Fish | 1 kg - 1.2 kg', 'Hilsha-(ইলিশ)-Fish-|-1-kg---1.2-kg', '<ul>\r\n	<li>পদ্মার ইলিশ মাছ।</li>\r\n	<li>সরাসরি চাঁদপুর থেকে ।&nbsp;</li>\r\n	<li>তাজা ইলিশ মাছ।&nbsp;</li>\r\n</ul>', 1050.00, '1 Kg', NULL, NULL, 'In Stock', 1000, 0, 0, '1596821243ilish Fish.png', NULL, NULL, '2020-08-07 21:27:23', '2020-08-27 10:22:53'),
(1005, 1, 84, 1, 4, NULL, '1003', 'Hilsha (ইলিশ) Fish | 1.2 - 1.5 kg', 'Hilsha-(ইলিশ)-Fish-|-1.2---1.5-kg', '<ul>\r\n	<li>পদ্মার ইলিশ মাছ।</li>\r\n	<li>সরাসরি চাঁদপুর থেকে ।&nbsp;</li>\r\n	<li>তাজা ইলিশ</li>\r\n</ul>', 1350.00, '1 Kg', NULL, NULL, 'In Stock', 1000, 0, 0, '1596821422ilish Fish.png', NULL, NULL, '2020-08-07 21:30:22', '2020-08-27 10:22:53'),
(1006, 1, 84, 1, 4, NULL, '1004', 'Hilsha (ইলিশ) Fish | 1kg - 1.2 kg', 'Hilsha-(ইলিশ)-Fish-|-1kg---1.2-kg', '<p>পদ্দার ইলিশ</p>', 1250.00, '1 Kg', NULL, NULL, 'In Stock', 100, 0, 0, '1597508213ilish Fish.png', NULL, NULL, '2020-08-15 20:16:53', '2020-08-27 10:22:53'),
(1007, 1, 2, 7, 24, NULL, '1005', 'TP-Link TL-WR841N 300Mbps Wireless Router', 'TP-Link-TL-WR841N-300Mbps-Wireless-Router', '<ul>\r\n	<li>Model: TP-Link TL-WR841N</li>\r\n	<li>Speed: 11n: Up to 300Mbps</li>\r\n	<li>Frequency: 2.4-2.4835GHz</li>\r\n	<li>Interface: 1 x WAN &amp; 4 x LAN ports</li>\r\n</ul>', 2050.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597865952WR841N.jpg', NULL, NULL, '2020-08-19 23:39:12', '2020-08-27 10:22:53'),
(1008, 1, 2, 7, 24, NULL, '1006', 'TP-LINK TL-WR850N Wireless Router N300', 'TP-LINK-TL-WR850N-Wireless-Router-N300', '<ul>\r\n	<li>TP-LINK TL-WR850N Wireless Router N300 Black -</li>\r\n	<li>Share your Network - Speed Up to 300 Mbps -</li>\r\n	<li>WPS Button -</li>\r\n	<li>Agile Configuration</li>\r\n	<li>Support - Maximum Connection - Parental Control</li>\r\n</ul>', 1760.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597866110WR850N.jpg', NULL, NULL, '2020-08-19 23:41:50', '2020-08-27 10:22:53'),
(1009, 1, 2, 7, 24, NULL, '1007', 'Tp-link Archer C20 AC750 Dual Band Router', 'Tp-link-Archer-C20-AC750-Dual-Band-Router', '<ul>\r\n	<li>Model: Tp-link Archerc20 AC750</li>\r\n	<li>4 10/100Mbps LAN ports</li>\r\n	<li>1 10/100Mbps WAN port</li>\r\n	<li>9V/0.6A(EU), 9V/0.85A(US)</li>\r\n</ul>', 2850.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '15978662611_C20.jpg', NULL, NULL, '2020-08-19 23:44:21', '2020-08-27 10:22:53'),
(1010, 1, 2, 7, 24, NULL, '1008', 'TP-Link TL-WR820N 300Mbps Wireless N Router', 'TP-Link-TL-WR820N-300Mbps-Wireless-N-Router', '<p>300Mbps Wireless N Speed TL-WR820N 300Mbps wireless transmission rate ideal for both bandwidth sensitive tasks and basic work IPTV supports IGMP Proxy/Snooping, Bridge and Tag VLAN to optimize IPTV streaming Compatible with IPv6 (Internet Protocol version 6) Guest Network provides separate access for guests while securing the host network Parental Controls manage when and how connected devices can access the internet Security protocols protect your home network with firewalls and wireless encryption Wi-Fi Ideal for Everyday Use 300Mbps Wireless N Speed TL-WR820N</p>', 1650.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597866445WR820N.jpg', NULL, NULL, '2020-08-19 23:47:25', '2020-08-27 10:22:53'),
(1011, 1, 2, 7, 24, NULL, '1009', 'TP-Link Archer C5 V4 AC1200 Wireless Dual Band Gigabit Router', 'TP-Link-Archer-C5-V4-AC1200-Wireless-Dual-Band-Gigabit-Router', '<ul>\r\n	<li>\r\n	<p>Interface: 4 10/1000Mbps LAN Ports 1 10/1000Mbps WAN Port 1 USB 2.0 Port</p>\r\n	</li>\r\n	<li>\r\n	<p>LED Indicator: Power Internet WLAN LAN</p>\r\n	</li>\r\n	<li>\r\n	<p>Antenna Type: 4 Fixed antennas (2.4GHz:2 x 5 dBi High Gain Antennas/5GHz: 2 x 5dBi High Gain Antennas)</p>\r\n	</li>\r\n	<li>\r\n	<p>Number of Routes: Concurrent Connected Devices : 15-20</p>\r\n	</li>\r\n	<li>\r\n	<p>Wireless Standards: IEEE 802.11n/g/b 2.4GHz IEEE 802.11ac/n/a 5GHz</p>\r\n	</li>\r\n	<li>\r\n	<p>Frequency: 2.4GHz and 5GHz</p>\r\n	</li>\r\n	<li>\r\n	<p>Wireless Functions: Enable/Disable Wireless Radio, WDS Bridge, WMM, Wireless Statistics</p>\r\n	</li>\r\n	<li>\r\n	<p>Management: Access Control, Local Management, Remote Management</p>\r\n	</li>\r\n	<li>\r\n	<p>Access Control: Parental Control, Local Management Control, Host list, Access Schedule, Rule Management</p>\r\n	</li>\r\n	<li>\r\n	<p>System Requirements: Microsoft Windows 10/8.1/8/7/Vista/XP/2000/NT/98SE, MAC OS, NetWare, UNIX or Linux</p>\r\n	</li>\r\n</ul>', 3650.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597866641C5 2.png', NULL, NULL, '2020-08-19 23:50:41', '2020-08-27 10:22:53'),
(1012, 1, 2, 7, 24, NULL, '1010', 'TP- Link Archer C60 AC1350 Wireless Dual Band Router - White', 'TP--Link-Archer-C60-AC1350-Wireless-Dual-Band-Router---White', '<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Get faster Wi-Fi at both the 2.4GHz band (450Mbps) and the 5GHz band (867Mbps) The advanced AC Wi-Fi unlocks the performance of all your wireless devices Three 2.4GHz antennas and two5GHz antennas createsuperior Wi-Fi coverage Beamforming technology delivers highly efficient wireless connection (supported by Version 2.0 and above)</li>\r\n	<li>Advanced software functions like Parental Control and Guest Network Tether app provides easy router management in your palm</li>\r\n	<li>The New Wi-Fi Standard for an Advanced Online Experience: The Archer C60 comes with the latest wireless standard &ndash; 802.11ac. This advanced Wi-Fi is designed for high-traffic online activities and can help to run applications at triple the speed of the previous 802.11n standard. The result: faster, stronger and more capable Wi-Fi to unleash all your wireless devices.</li>\r\n	<li>Fast,Concurrent Dual Band Wi-Fi: The Archer C60 provides you with simultaneous dual band Wi-Fi connections. 2.4GHz band: 3&times;3 MIMO creates fast and stable Wi-Fi at speeds of 450Mbps, making it perfect for daily applications like sending emails, browsing the web or listening to music.</li>\r\n	<li>5GHz band: Provides up to 867Mbps Wi-Fi for latency-sensitive entertainment so you can stream HD video, play online games and hold video chats all at the same time, without delay.</li>\r\n</ul>', 4199.00, '1 Pcs', NULL, NULL, 'In Stock', 20, 0, 0, '1597866921C60.jpg', NULL, NULL, '2020-08-19 23:55:21', '2020-08-27 10:22:53'),
(1013, 1, 2, 7, 24, NULL, '1011', 'TP-Link TL-WR940N 450Mbps Wireless N Router', 'TP-Link-TL-WR940N-450Mbps-Wireless-N-Router', '<ul>\r\n	<li>450Mbps wireless speed ideal for interruption sensitive applications like HD video streaming</li>\r\n	<li>Three antennas increase the wireless robustness and stability Supports 3 modes: Router, Range Extender and Access Point modes Easy wireless security encryption at a push of WPS button Bandwidth Control: assigns your preferred devices with more bandwidth</li>\r\n	<li>4 10/100Mbps LAN PORTS</li>\r\n	<li>1 10/100Mbps WAN PORT IEEE 802.11n, IEEE 802.11g, IEEE 802.11b</li>\r\n	<li>3*5dBi Fixed Omni Directional Antenna</li>\r\n</ul>', 2650.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597867081WR940N.jpg', NULL, NULL, '2020-08-19 23:58:01', '2020-08-27 10:22:53'),
(1014, 1, 2, 7, 24, NULL, '1012', 'TP-Link TL-WR840N V2 300Mbps Wireless Router - White', 'TP-Link-TL-WR840N-V2-300Mbps-Wireless-Router---White', '<ul>\r\n	<li>Brand TP-Link</li>\r\n	<li>Model TL-WR840N V2</li>\r\n	<li>Network standards IEEE 802.11n, 11g, 11b</li>\r\n	<li>Outdoor range 400 sq. meter</li>\r\n	<li>Data transfer rate 300Mbps</li>\r\n	<li>Security protocols WEP, WPA/WPA2, WPA-PSK/WPA2-PSKencryptions, MAC Filtering, SSID Control, SPI Firewall, access control</li>\r\n	<li>Interface (Built-in) 1 x WAN port, 4 x LAN ports,</li>\r\n	<li>Antena 2 x External Antennas</li>\r\n	<li>Others 1200 - 1500 sq. feet</li>\r\n	<li>Warranty 1 year</li>\r\n	<li>Data Transfer Rate 300Mbps to 599Mbpls</li>\r\n	<li>Antena 2</li>\r\n</ul>', 1699.00, '1 Pcs', NULL, NULL, 'In Stock', 20, 0, 0, '1597867252WR840N.jpg', NULL, NULL, '2020-08-20 00:00:52', '2020-08-27 10:22:53'),
(1015, 1, 2, 7, 24, NULL, '1013', 'TP Link Archer A9 AC1900 Wireless MU-MIMO Gigabit Router', 'TP-Link-Archer-A9-AC1900-Wireless-MU-MIMO-Gigabit-Router', '<ul>\r\n	<li>Model: TP Link Archer A9 AC1900</li>\r\n	<li>802.11ac Wave2 Wi-Fi</li>\r\n	<li>MU-MIMO Technology</li>\r\n	<li>Boosted WiFi Coverage</li>\r\n	<li>1 Year Warranty</li>\r\n</ul>', 9300.00, '1 Pcs', NULL, NULL, 'In Stock', 10, 0, 0, '1597867616A9.jpg', NULL, NULL, '2020-08-20 00:06:56', '2020-08-27 10:22:53'),
(1016, 1, 2, 7, 24, NULL, '1014', 'TP-Link WR845N 300Mbps Wireless N Router', 'TP-Link-WR845N-300Mbps-Wireless-N-Router', '<ul>\r\n	<li>Model: TP-Link WR845N</li>\r\n	<li>Frequency: 2.4-2.4835GHz</li>\r\n	<li>Interface: 1 x LAN &amp; 4 x WAN ports</li>\r\n	<li>DIM: 9.1W x 5.7D x 1.4H in</li>\r\n</ul>', 1990.00, '1 Pcs', NULL, NULL, 'In Stock', 15, 0, 0, '1597867707WR845N.jpg', NULL, NULL, '2020-08-20 00:08:27', '2020-08-27 10:22:53'),
(1017, 1, 2, 7, 24, NULL, '1015', 'TP-LINK TD-W8961ND 300 MBPS WIRELESS & ADSL 2 + ROUTER', 'TP-LINK-TD-W8961ND-300-MBPS-WIRELESS-&-ADSL-2-+-ROUTER', '<ul>\r\n	<li>Model: TP-LINK TD-W8961</li>\r\n	<li>Antenna Omni directional, Detachable, Reverse SMA</li>\r\n	<li>Signal Rate 300Mbps</li>\r\n	<li>Frequency 2.400-2.4835GHz</li>\r\n	<li>1 WPS Button</li>\r\n</ul>', 2700.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597867806W8961ND.jpg', NULL, NULL, '2020-08-20 00:10:06', '2020-08-27 10:22:53'),
(1018, 1, 2, 7, 24, NULL, '1016', 'Tp-link TL-WR850N 300Mbps Wireless N Speed Router', 'Tp-link-TL-WR850N-300Mbps-Wireless-N-Speed-Router', '<ul>\r\n	<li>Model: Tp-link TL-WR850N</li>\r\n	<li>Signal Rate 300Mbps</li>\r\n	<li>Antenna 2 Antennas</li>\r\n	<li>Frequency 2.4-2.4835GHz</li>\r\n	<li>Button WPS/RESET Button</li>\r\n</ul>', 2100.00, '1 Pcs', NULL, NULL, 'In Stock', 20, 0, 0, '1597867892tl-wr840n-2-500x500.jpg', NULL, NULL, '2020-08-20 00:11:32', '2020-08-27 10:22:53'),
(1019, 1, 2, 7, 24, NULL, '1017', 'Tp-Link Archer AX10 AX1500 Wi-Fi 6 Gigabit Router', 'Tp-Link-Archer-AX10-AX1500-Wi-Fi-6-Gigabit-Router', '<ul>\r\n	<li>Model: Tp-Link Archer AX10</li>\r\n	<li>Wi-Fi 6 Technology</li>\r\n	<li>Triple-Core Processing</li>\r\n	<li>1.5 GHz Triple-Core CPU</li>\r\n	<li>Frequency: 5 GHz and 2.4 GHz</li>\r\n</ul>', 13500.00, '1 Pcs', NULL, NULL, 'In Stock', 5, 0, 0, '1597867982archer-ax10-500x500.jpg', NULL, NULL, '2020-08-20 00:13:02', '2020-08-27 10:22:53'),
(1020, 1, 2, 7, 24, NULL, '1018', 'TP-Link TL-WR740N Wireless N Router', 'TP-Link-TL-WR740N-Wireless-N-Router', '<ul>\r\n	<li>Model: TP-Link TL-WR740N</li>\r\n	<li>Frequency: 2.4-2.4835GHz</li>\r\n	<li>Interface: 1 x LAN &amp; 4 x WAN ports</li>\r\n	<li>DIM: 6.9W x 4.6D x 1.3H in</li>\r\n</ul>', 1150.00, '1 Pcs', NULL, NULL, 'In Stock', 50, 0, 0, '1597868062hyu-500x500 (1).jpg', NULL, NULL, '2020-08-20 00:14:22', '2020-08-27 10:22:53'),
(1021, 1, 2, 7, 24, NULL, '1019', 'Tenda F3 300Mbps Wi-Fi Router', 'Tenda-F3-300Mbps-Wi-Fi-Router', '<ul>\r\n	<li>Model: Tenda F3</li>\r\n	<li>Interface: 1x WAN &amp; 3x LAN Ports</li>\r\n	<li>DIM: 127.4*90.5*26mm</li>\r\n	<li>Frequency: 2.4GHz</li>\r\n</ul>', 1599.00, '1 Pcs', NULL, NULL, 'In Stock', 20, 0, 0, '1597868280Tenda F3-1-500x500.jpg', NULL, NULL, '2020-08-20 00:18:00', '2020-08-27 10:22:53'),
(1022, 1, 2, 7, 24, NULL, '1020', 'Tenda N301 Wireless N300 Easy Setup Router', 'Tenda-N301-Wireless-N300-Easy-Setup-Router', '<ul>\r\n	<li>Model: Tenda N301</li>\r\n	<li>2 fixed 5dbi antennas</li>\r\n	<li>1 Reset/WPS Button</li>\r\n	<li>Frequency 2.412GHz-2.472GHz</li>\r\n</ul>', 1500.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597868351Tenda N301-1-500x500.jpg', NULL, NULL, '2020-08-20 00:19:11', '2020-08-27 10:22:53'),
(1023, 1, 2, 7, NULL, NULL, '1021', 'Tenda FH456 Wireless-N 300Mbps Router', 'Tenda-FH456-Wireless-N-300Mbps-Router', '<ul>\r\n	<li>Model: Tenda FH456</li>\r\n	<li>Interface: 1x LAN &amp; 3x WAN Ports</li>\r\n	<li>DIM: 6.74*6.74*1.43in</li>\r\n	<li>Frequency: 2.4GHz</li>\r\n</ul>', 4250.00, '1 Pcs', NULL, NULL, 'Out Of Stock', 25, 0, 0, '15978684352-500x500.jpg', NULL, NULL, '2020-08-20 00:20:35', '2020-08-27 10:22:53'),
(1024, 1, 2, 7, 24, NULL, '1022', 'Tenda F9 600M Whole-Home Coverage Wi-Fi Router', 'Tenda-F9-600M-Whole-Home-Coverage-Wi-Fi-Router', '<ul>\r\n	<li>Model: Tenda F9 600M</li>\r\n	<li>Interface: 1x LAN &amp; 3x WAN Ports</li>\r\n	<li>DIM: 171.3*171.3*36.4 mm</li>\r\n	<li>Frequency: 2.4~2.4835 GHz</li>\r\n</ul>', 2499.00, '1 Pcs', NULL, NULL, 'In Stock', 20, 0, 0, '1597868507f9-1-500x500.jpg', NULL, NULL, '2020-08-20 00:21:47', '2020-08-27 10:22:53'),
(1025, 1, 2, 7, 24, NULL, '1023', 'Tenda AC5 AC1200 Smart Dual-Band WiFi Router', 'Tenda-AC5-AC1200-Smart-Dual-Band-WiFi-Router', '<ul>\r\n	<li>Model: Tenda AC5</li>\r\n	<li>Antenna 5dBi External antenna *4</li>\r\n	<li>Frequency 2.4 GHz &amp; 5 GHz</li>\r\n	<li>Smart Sleeping Mode</li>\r\n	<li>Smart LED on/off</li>\r\n</ul>', 5500.00, '1 Pcs', NULL, NULL, 'In Stock', 2, 0, 0, '1597868561ac5-500x500.jpg', NULL, NULL, '2020-08-20 00:22:41', '2020-08-27 10:22:53'),
(1026, 1, 2, 7, 24, NULL, '1024', 'Tenda AC15 AC1900 Smart Dual-Band Gigabit WiFi Router', 'Tenda-AC15-AC1900-Smart-Dual-Band-Gigabit-WiFi-Router', '<ul>\r\n	<li>Model: AC15</li>\r\n	<li>Dimension: 8.9 x 7.07 x 3.02 in</li>\r\n	<li>Frequency: 2.4G and 5G</li>\r\n	<li>Antenna: 3 x 3dBi dual brand</li>\r\n</ul>', 8400.00, '1 Pcs', NULL, NULL, 'In Stock', 10, 0, 0, '1597868634ac15-2-500x500.jpg', NULL, NULL, '2020-08-20 00:23:54', '2020-08-27 10:22:53'),
(1027, 1, 2, 7, 24, NULL, '1025', 'Tenda 4G630 3G/4G Wireless N300 Router', 'Tenda-4G630-3G/4G-Wireless-N300-Router', '<ul>\r\n	<li>Model: Tenda 4G630</li>\r\n	<li>Wireless Link Rate 300Mbps</li>\r\n	<li>Frequency Range 2.4-2.4835GHz</li>\r\n	<li>Antenna two fixed 5dBi Omni</li>\r\n</ul>', 2150.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '15978686984g630-1-500x500.jpg', NULL, NULL, '2020-08-20 00:24:58', '2020-08-27 10:22:53'),
(1028, 1, 2, 7, 24, NULL, '1026', 'Tenda AC6 AC1200 Smart Dual-Band Wireless Router', 'Tenda-AC6-AC1200-Smart-Dual-Band-Wireless-Router', '<ul>\r\n	<li>Model: AC6</li>\r\n	<li>Interface: 1x WAN &amp; 3x LAN Ports</li>\r\n	<li>DIM: 220*141.5*49mm</li>\r\n	<li>Frequency: 2.4 &amp; 5GHz</li>\r\n</ul>', 3550.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597868830ac6-1-500x500.jpg', NULL, NULL, '2020-08-20 00:27:10', '2020-08-27 10:22:53'),
(1029, 1, 2, 7, 24, NULL, '1027', 'Tenda FH1202 1200Mbps Dual-Speed Wireless Wifi Router', 'Tenda-FH1202-1200Mbps-Dual-Speed-Wireless-Wifi-Router', '<ul>\r\n	<li>Model: Tenda FH1202</li>\r\n	<li>Interface: 1x WAN &amp; 3x LANPorts</li>\r\n	<li>DIM: 153.2*153.2*40.04mm</li>\r\n	<li>Frequency: 2.4GHz and 5GHz</li>\r\n</ul>', 4250.00, '1 Pcs', NULL, NULL, 'In Stock', 10, 0, 0, '1597868893Tenda FH1202-1-500x500.jpg', NULL, NULL, '2020-08-20 00:28:13', '2020-08-27 10:22:53'),
(1030, 1, 2, 7, 24, NULL, '1028', 'Tenda Wireless F6 300Mbps N300 Easy Setup 4 Antenna Router', 'Tenda-Wireless-F6-300Mbps-N300-Easy-Setup-4-Antenna-Router', '<ul>\r\n	<li>Model: Tenda Wireless F6 300Mbps N300</li>\r\n	<li>4*5dBi High Gain Omni-Directional antennas</li>\r\n	<li>Support WISP and Universal Repeater</li>\r\n	<li>Support the easy-installation setup</li>\r\n	<li>Frequency: 2.4 GHz</li>\r\n</ul>', 1850.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597868964f6-1-500x500.jpg', NULL, NULL, '2020-08-20 00:29:24', '2020-08-27 10:22:53'),
(1031, 1, 2, 7, 24, NULL, '1029', 'Mercusys MW301R 300mbps 2 Antenna Router', 'Mercusys-MW301R-300mbps-2-Antenna-Router', '<ul>\r\n	<li>Model: Mercusys MW301R</li>\r\n	<li>Concurrent Dual Band Connections</li>\r\n	<li>Speed: up to 1200Mbps</li>\r\n	<li>Superior Online Experience</li>\r\n	<li>Strong Signal, Great Coverage</li>\r\n</ul>', 1450.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597870032mw301r-1-500x500.jpg', NULL, NULL, '2020-08-20 00:47:12', '2020-08-27 10:22:53'),
(1032, 1, 2, 7, 24, NULL, '1030', 'Mercusys MW302R 300mbps 2 Antenna Multi-Mode Wireless N Router', 'Mercusys-MW302R-300mbps-2-Antenna-Multi-Mode-Wireless-N-Router', '<ul>\r\n	<li>Model: Mercusys MW302R</li>\r\n	<li>Speed: up to 300Mbps</li>\r\n	<li>LED Control &amp; IPv6 Supported</li>\r\n	<li>Superior Online Experience</li>\r\n	<li>Strong Signal, Great Coverage</li>\r\n</ul>', 1350.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597870094mw302r-1-500x500.jpg', NULL, NULL, '2020-08-20 00:48:14', '2020-08-27 10:22:53'),
(1033, 1, 2, 7, 24, NULL, '1031', 'Mercusys MW305R 300Mbps Wireless N Router', 'Mercusys-MW305R-300Mbps-Wireless-N-Router', '<ul>\r\n	<li>Model: Mercusys MW305R</li>\r\n	<li>Interface: 1WAN and 3 LAN</li>\r\n	<li>Frequency: 2.4 - 2.4835GHz</li>\r\n	<li>DIM:169 x 116 x 35 mm​</li>\r\n</ul>', 1420.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597870160mw305r-1-500x500.jpg', NULL, NULL, '2020-08-20 00:49:20', '2020-08-27 10:22:53'),
(1034, 1, 2, 7, 24, NULL, '1032', 'Mercusys MW325R 300Mbps Enhanced Wireless N Router', 'Mercusys-MW325R-300Mbps-Enhanced-Wireless-N-Router', '<ul>\r\n	<li>Model: Mercusys MW325R</li>\r\n	<li>Interface: 1WAN and 4 LAN</li>\r\n	<li>Frequency: 2.4 - 2.4835GHz</li>\r\n	<li>DIM: 167 x 118 x 33 mm</li>\r\n</ul>', 2150.00, '1 Pcs', NULL, NULL, 'In Stock', 20, 0, 0, '1597870351MW325R.jpg', NULL, NULL, '2020-08-20 00:52:31', '2020-08-27 10:22:53'),
(1035, 1, 2, 7, 24, NULL, '1033', 'Mercusys AC12(EU) 1200Mbps 4 Antenna Dual Band Router', 'Mercusys-AC12(EU)-1200Mbps-4-Antenna-Dual-Band-Router', '<ul>\r\n	<li>Model: Mercusys AC12(EU)</li>\r\n	<li>Concurrent Dual Band Connections</li>\r\n	<li>Speed: up to 1200Mbps</li>\r\n	<li>Superior Online Experience</li>\r\n	<li>Strong Signal, Great Coverage</li>\r\n</ul>', 3350.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597870414ac12-2-500x500.jpg', NULL, NULL, '2020-08-20 00:53:34', '2020-08-27 10:22:53'),
(1036, 1, 2, 7, 24, NULL, '1034', 'Mercusys MW155R 150 Mbps Wireless N Router', 'Mercusys-MW155R-150-Mbps-Wireless-N-Router', '<ul>\r\n	<li>Model: Mercusys MW155R</li>\r\n	<li>Interface: 1WAN and 4 LAN</li>\r\n	<li>Frequency: 2.4 - 2.4835GHz</li>\r\n	<li>DIM: 114 x 94 x 26 mm</li>\r\n</ul>', 1150.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '159787048024-500x500.jpg', NULL, NULL, '2020-08-20 00:54:40', '2020-08-27 10:22:53'),
(1037, 1, 2, 7, 24, NULL, '1035', 'Xiaomi MI 4C R4CM 300 Mbps 4 Antenna Router (Global Version)', 'Xiaomi-MI-4C-R4CM-300-Mbps-4-Antenna-Router-(Global-Version)', '<ul>\r\n	<li>Model: 4C R4CM</li>\r\n	<li>Transmission Rate 300Mbps</li>\r\n	<li>Frequency 2.4GHz</li>\r\n	<li>Four 5dBi Antennas</li>\r\n</ul>', 2250.00, '1 Pcs', NULL, '100%', 'In Stock', 20, 0, 0, '1597870672mi-4c-1-500x500.jpg', NULL, NULL, '2020-08-20 00:57:52', '2020-09-01 18:23:06'),
(1038, 1, 2, 7, 24, NULL, '1036', 'Xiaomi MI 4C R4CM 300 Mbps 4 Antenna Router (Chinese Version)', 'Xiaomi-MI-4C-R4CM-300-Mbps-4-Antenna-Router-(Chinese-Version)', '<ul>\r\n	<li>Model: 4C R4CM</li>\r\n	<li>Transmission Rate 300Mbps</li>\r\n	<li>Frequency 2.4GHz</li>\r\n	<li>Four 5dBi Antennas</li>\r\n</ul>', 1850.00, '1 Pcs', NULL, '100%', 'In Stock', 50, 0, 0, '1597870751mi-4c-1-500x500.jpg', NULL, NULL, '2020-08-20 00:59:11', '2020-09-01 18:23:06'),
(1039, 1, 2, 7, 24, NULL, '1037', 'Amplificador Pro - 300Mbps WiFi Wireless Router Repeater - Black', 'Amplificador-Pro---300Mbps-WiFi-Wireless-Router-Repeater---Black', '<ul>\r\n	<li>Wireless Router Repetidor</li>\r\n	<li>Type: Wireless</li>\r\n	<li>Incredible Signal Strength</li>\r\n	<li>Maximum LAN data speed: 300Mbps</li>\r\n	<li>2x2 External Antenna</li>\r\n	<li>3 steps to connect the Router</li>\r\n</ul>', 1750.00, '1 Pcs', NULL, NULL, 'In Stock', 50, 0, 0, '1597870951-font-b-Xiaomi-b-font-font-b-WiFi-b-font-font-b-Amplifier-b-font.jpg', NULL, NULL, '2020-08-20 01:02:31', '2020-08-27 10:22:53'),
(1040, 1, 2, 7, 24, NULL, '1038', 'Tenda U1 300 Mbps Utral-Fast Wireless USB Adapter', 'Tenda-U1-300-Mbps-Utral-Fast-Wireless-USB-Adapter', '<ul>\r\n	<li>Model: Tenda U1</li>\r\n	<li>Frequency: 2.400~2.4835GHz</li>\r\n	<li>Dimension: 58&times;19.7&times;10.9 mm</li>\r\n	<li>Wi-Fi Protected Setup</li>\r\n</ul>', 1450.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1597871090u1-500x500.jpg', NULL, NULL, '2020-08-20 01:04:50', '2020-08-27 10:22:53'),
(1041, 1, 2, 7, 23, NULL, '1039', 'UiiSii HM13 In-Ear Dynamic Headset with Microphone-Black', 'UiiSii-HM13-In-Ear-Dynamic-Headset-with-Microphone-Black', '<ul>\r\n	<li>\r\n	<p>Brand Name:UiiSii</p>\r\n	</li>\r\n	<li>\r\n	<p>Function:For Mobile Phone,For Internet Bar,for Video Game,For iPod,Sport,Common Headphone</p>\r\n	</li>\r\n	<li>\r\n	<p>Waterproof:No</p>\r\n	</li>\r\n	<li>\r\n	<p>Support Memory Card:No</p>\r\n	</li>\r\n	<li>\r\n	<p>Connectors:3.5mm</p>\r\n	</li>\r\n	<li>\r\n	<p>Model Number: UiiSii HM13</p>\r\n	</li>\r\n</ul>', 1600.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598091110UiiSii HM13.jpg', NULL, NULL, '2020-08-22 14:11:50', '2020-08-27 10:22:53'),
(1042, 1, 167, 7, 23, NULL, '1040', 'UiiSii HM12 Gaming Headset On-Ear Deep Bass Good Treble Earphone - Black', 'UiiSii-HM12-Gaming-Headset-On-Ear-Deep-Bass-Good-Treble-Earphone---Black', '<ul>\r\n	<li>Brand name:UiiSii</li>\r\n	<li>Model number: HM-12</li>\r\n	<li>Plug diameter: 3.5mm</li>\r\n	<li>Cable length: 120cm</li>\r\n	<li>Headphone Category: Gaming Headset Mobile Phone Headphones</li>\r\n	<li>With or without microphone: With</li>\r\n	<li>Wired earphone plug type: L-bend</li>\r\n	<li>General impedance: 32&Omega;</li>\r\n	<li>Sensitivity: 100dB/mW</li>\r\n	<li>Frequency response range: 20-20000Hz</li>\r\n</ul>', 750.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598091458UiiSii HM12.jpg', NULL, NULL, '2020-08-22 14:17:38', '2020-08-27 10:22:53'),
(1043, 1, 167, 7, 23, NULL, '1041', 'UiiSii C100 In-ear Earphone with MIC - Black', 'UiiSii-C100-In-ear-Earphone-with-MIC---Black', '<ul>\r\n	<li>Built-in HD microphone, chat with friends or families smooth and freely</li>\r\n	<li>One-key operation, handy to switch songs and get hands-free calls</li>\r\n	<li>3.5mm gold-plated jack, compatible with the mainstream audio-visual devices</li>\r\n	<li>Compatible with: Computer,iPhone,iPod,Mobile,phone,MP3,PC,Portable Media Player</li>\r\n</ul>', 550.00, '1 Pcs', NULL, NULL, 'In Stock', 50, 0, 0, '1598091684UiiSii C100.jpg', NULL, NULL, '2020-08-22 14:21:24', '2020-08-27 10:22:53'),
(1044, 1, 167, 7, 23, NULL, '1042', 'UiiSii BA-T8 HiFi Earphone Earbuds Dual Dynamaic Music In-Ear Earphone Noise Cancelling Wired with Mic For Smartphones - Black', 'UiiSii-BA-T8-HiFi-Earphone-Earbuds-Dual-Dynamaic-Music-In-Ear-Earphone-Noise-Cancelling-Wired-with-Mic-For-Smartphones---Black', '<ul>\r\n	<li>Brand: UiiSii</li>\r\n	<li>Model: T8</li>\r\n	<li>100% Original Product</li>\r\n	<li>Connectors: 3.5mm</li>\r\n	<li>Control Button: Yes</li>\r\n	<li>Style: In-Ear</li>\r\n	<li>Communication: Wired</li>\r\n	<li>Vocalism Principle: Hybrid Technology</li>\r\n	<li>Volume Control: Yes</li>\r\n	<li>With Microphone: Yes</li>\r\n	<li>Resistance: 16&Omega;</li>\r\n	<li>Frequency Response Range: 20-20000Hz</li>\r\n	<li>Sensitivity: 108dB</li>\r\n	<li>Line Length: 1.2m</li>\r\n</ul>', 3850.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598092300UiiSii T8.jpg', NULL, NULL, '2020-08-22 14:31:40', '2020-08-27 10:22:53'),
(1046, 1, 2, 7, 23, NULL, '1044', 'UiiSii BT119 Wireless Bluetooth & Waterproof Earphone - Black', 'UiiSii-BT119-Wireless-Bluetooth-&-Waterproof-Earphone---Black', '<ul>\r\n	<li>120mAh large capacity built-in battery, standby time is about 240 hours, endurance is 10 hours &bull;</li>\r\n	<li>Bluetooth 5.0, compatibility, stability, and functionality are more powerful, and the signal connection is stable and fast within 10 meters</li>\r\n	<li>Slanted into the ear design, fully fits the auricle and is comfortable to wear for a long time</li>\r\n	<li>The two ends of the earphone can be magnetically attracted together for more convenient storage</li>\r\n	<li>Charging time: 1.5h</li>\r\n	<li>Impedance: 16 ohm</li>\r\n	<li>Sensitivity: 104dB</li>\r\n	<li>Frequency: 20 - 20Hz</li>\r\n	<li>Waterproof rating: IPX5</li>\r\n</ul>', 1650.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598092695UiiSii BT119.jpg', NULL, NULL, '2020-08-22 14:38:15', '2020-08-27 10:22:53'),
(1047, 1, 167, 7, 23, NULL, '1045', 'Uiisii HM8 Spiral Metal In-ear Earphones Super Bass with Microphone 3.5mm - Red', 'Uiisii-HM8-Spiral-Metal-In-ear-Earphones-Super-Bass-with-Microphone-3.5mm---Red', '<ul>\r\n	<li>100% Authentic</li>\r\n	<li>Impedance: 16&Omega;</li>\r\n	<li>Sensitivity: 85&plusmn;3dB</li>\r\n	<li>Speaker size: 13.5mm</li>\r\n	<li>Plug Type: 3.5mm</li>\r\n	<li>Transducer Principle: Dynamic</li>\r\n	<li>Frequency Response:20Hz~20kHz 5</li>\r\n	<li>MIC: High-Quality Sensitive In-line Microphone</li>\r\n</ul>', 899.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598093079UiiSii HM8.jpg', NULL, NULL, '2020-08-22 14:44:39', '2020-08-27 10:22:53'),
(1048, 1, 167, 7, 23, NULL, '1046', 'UiiSii UX In-Ear Dynamic Headset with Mic - Black', 'UiiSii-UX-In-Ear-Dynamic-Headset-with-Mic---Black', '<ul>\r\n	<li>Brand: UiiSii</li>\r\n	<li>Model: UX</li>\r\n	<li>Type: 3.5mm</li>\r\n	<li>Speaker diameter 12mm</li>\r\n	<li>Frequency range 20~20000HZ</li>\r\n	<li>Sensitivity 102 + 3dB</li>\r\n	<li>Impedance 180</li>\r\n	<li>Wire length 120cm Pin 3.5mm</li>\r\n</ul>', 600.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598093359UiiSii UX B.jpg', NULL, NULL, '2020-08-22 14:49:19', '2020-08-27 10:22:53'),
(1049, 1, 2, 7, 23, NULL, '1047', 'UiiSii UX In-Ear Dynamic Headset with Mic - White', 'UiiSii-UX-In-Ear-Dynamic-Headset-with-Mic---White', '<ul>\r\n	<li>Brand: UiiSii</li>\r\n	<li>Model: UX</li>\r\n	<li>Type: 3.5mm</li>\r\n	<li>Speaker diameter 12mm</li>\r\n	<li>Frequency range 20~20000HZ</li>\r\n	<li>Sensitivity 102 + 3dB</li>\r\n	<li>Impedance 180</li>\r\n	<li>Wire length 120cm Pin 3.5mm</li>\r\n</ul>', 600.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598093433UiiSii UX W.jpg', NULL, NULL, '2020-08-22 14:50:33', '2020-08-27 10:22:53'),
(1050, 1, 167, 7, 23, NULL, '1048', 'UIISII BN19 Wireless Bluetooth & Waterpoof Earphone - Black', 'UIISII-BN19-Wireless-Bluetooth-&-Waterpoof-Earphone---Black', '<ul>\r\n	<li>\r\n	<p>Brand:UIISII</p>\r\n	</li>\r\n	<li>\r\n	<p>Model:BN90J</p>\r\n	</li>\r\n	<li>\r\n	<p>Speaker:6mm Dual Dynamic Drive, 20Hz-20kHz, 32&Omega; &plusmn; 15%</p>\r\n	</li>\r\n	<li>\r\n	<p>Output:110&plusmn;3db</p>\r\n	</li>\r\n	<li>\r\n	<p>Microphone:MEMS, &ndash; 41dB&plusmn;3dB</p>\r\n	</li>\r\n	<li>\r\n	<p>Battery Life:24 Hours</p>\r\n	</li>\r\n	<li>\r\n	<p>Input Power:250mAh/3.7V</p>\r\n	</li>\r\n	<li>\r\n	<p>Earbud Charge Time:2.5 Hours</p>\r\n	</li>\r\n	<li>\r\n	<p>Standby Time:about 480 Hours</p>\r\n	</li>\r\n	<li>\r\n	<p>Version:Bluetooth 5.0</p>\r\n	</li>\r\n	<li>\r\n	<p>Bluetooth Chip:BK3266</p>\r\n	</li>\r\n	<li>\r\n	<p>Range:30+ ft</p>\r\n	</li>\r\n	<li>\r\n	<p>Support Protocols:HSP/HFP/A2DP/AVRCP</p>\r\n	</li>\r\n	<li>\r\n	<p>Wire length:11.81in</p>\r\n	</li>\r\n	<li>\r\n	<p>IP Rating: IPX5</p>\r\n	</li>\r\n</ul>', 1499.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598093961UiiSii BN19 2.png', NULL, NULL, '2020-08-22 14:55:09', '2020-08-27 10:22:53'),
(1052, 1, 2, 7, 23, NULL, '1050', 'Remax RM-301 Candy Wired Earphone', 'Remax-RM-301-Candy-Wired-Earphone', '<p><strong>Remax RM-301 Candy Wired Earphone</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Driver Diameter: 10mm</strong></li>\r\n	<li><strong>Frequency Response: 20Hz--20kHz</strong></li>\r\n	<li><strong>Impedance: 32&Omega;</strong></li>\r\n	<li><strong>Sensitivity(SPL): 90&plusmn;3db</strong></li>\r\n	<li><strong>Rated Input Power: 20mW</strong></li>\r\n	<li><strong>Plug: :3.5mm</strong></li>\r\n	<li><strong>Cord Length: 1.2meters</strong></li>\r\n</ul>', 650.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103050rem 301.jpg', NULL, NULL, '2020-08-22 17:30:50', '2020-08-27 10:22:53'),
(1053, 1, 2, 7, 23, NULL, '1051', 'Remax RM-501i Wired Music Headset', 'Remax-RM-501i-Wired-Music-Headset', '<ul>\r\n	<li>Product Type : RM - 512</li>\r\n	<li>Frequency Responce : 20Hz-20kHz</li>\r\n	<li>Sensitivity : 95dB&plusmn;4dB</li>\r\n	<li>Impedence : 32&Omega;</li>\r\n	<li>Rated Input : 3mW</li>\r\n	<li>Drive Unit : 9mm dual units</li>\r\n	<li>Pin : 3.5 Straight</li>\r\n	<li>Cable Length : 1.2m</li>\r\n</ul>', 350.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103198501i rem.jpg', NULL, NULL, '2020-08-22 17:33:18', '2020-08-27 10:22:53'),
(1054, 1, 2, 7, 23, NULL, '1052', 'Remax RW-105 Music Earphone With HD Mic', 'Remax-RW-105-Music-Earphone-With-HD-Mic', '<ul>\r\n	<li>High Purity OFC Oxygen Free Copper Wire</li>\r\n	<li>Easy Noise Isolation</li>\r\n	<li>Passive Shielding the External Noise Design Of The Ear Canal (IEMs)</li>\r\n	<li>Ergonomic Design</li>\r\n	<li>Fine Texture Mic Shell</li>\r\n</ul>', 450.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103308rem 105.jpg', NULL, NULL, '2020-08-22 17:35:08', '2020-08-27 10:22:53'),
(1055, 1, 2, 7, 23, NULL, '1053', 'REMAX RM 510 In-Ear Earphone - Black', 'REMAX-RM-510-In-Ear-Earphone---Black', '<ul>\r\n	<li>Speaker size 10MM</li>\r\n	<li>Impedance 16+_15%</li>\r\n	<li>Frequency response 20-20000Hz</li>\r\n	<li>Sensitivity 87 +_3dB</li>\r\n	<li>Microphone sensitivity 42 +_ 3dB</li>\r\n	<li>Bear the maximum thrust 20mw</li>\r\n	<li>Plug:3.5mm LLine length 1.2M</li>\r\n</ul>', 700.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103396rem 510.jpg', NULL, NULL, '2020-08-22 17:36:36', '2020-08-27 10:22:53'),
(1056, 1, 2, 7, 23, NULL, '1054', 'REMAX RM-303 PURE MUSIC SURROUND EARPHONE', 'REMAX-RM-303-PURE-MUSIC-SURROUND-EARPHONE', '<ul>\r\n	<li>Driver Diameter: 9mm</li>\r\n	<li>Headphone Style: In-Ear</li>\r\n	<li>Frequency Response: 20Hz--20kHz</li>\r\n	<li>Impedance: 16 &Omega;</li>\r\n	<li>Sensitivity(SPL): 100&plusmn;3db</li>\r\n	<li>Rated Input Power: 80mW7</li>\r\n	<li>Plug: :￠3.5mm</li>\r\n	<li>Cord Length: 1.2meters</li>\r\n	<li>Compatible Models: All Android Mobile Phone</li>\r\n</ul>', 950.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103471rem 303.jpg', NULL, NULL, '2020-08-22 17:37:51', '2020-08-27 10:22:53'),
(1057, 1, 2, 7, 23, NULL, '1055', 'REMAX RM 510 In-Ear Earphone With Metal box', 'REMAX-RM-510-In-Ear-Earphone-With-Metal-box', '<ul>\r\n	<li>Cable length: 1.2m</li>\r\n	<li>Mic Sensitivity: 42+-3dB</li>\r\n	<li>Impedance: 16-15 percentage</li>\r\n	<li>Maximumpower&pound;&ordm;10mW</li>\r\n	<li>HD Microphone</li>\r\n	<li>Frequency range: 20-20000HZ</li>\r\n	<li>Level of sensitivity: 87-3dB</li>\r\n	<li>510 touch music wired earphone</li>\r\n	<li>Compatibility and Comfortable</li>\r\n</ul>', 650.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103582rem 510.jpg', NULL, NULL, '2020-08-22 17:39:42', '2020-08-27 10:22:53'),
(1058, 1, 2, 7, 23, NULL, '1056', 'REMAX RM 512 High Performance Wired In Ear Earphone Stereo with Mic, 3.5mm Jack', 'REMAX-RM-512-High-Performance-Wired-In-Ear-Earphone-Stereo-with-Mic,-3.5mm-Jack', '<ul>\r\n	<li>Brand: REMAX</li>\r\n	<li>Model: RM-512</li>\r\n	<li>Features: HD Microphone / Compatibility / Volume Control</li>\r\n	<li>Material: TPE</li>\r\n	<li>Impedance: 32&Omega;</li>\r\n	<li>Frequency: 20-20k Hz</li>\r\n	<li>Bar Code Available(You can Check Its Originality.</li>\r\n</ul>', 300.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598103931rem 512.jpg', NULL, NULL, '2020-08-22 17:45:31', '2020-08-27 10:22:53'),
(1059, 1, 2, 7, 23, NULL, '1057', 'Orginal Remax RM 610D In-Ear Headphone', 'Orginal-Remax-RM-610D-In-Ear-Headphone', '<ul>\r\n	<li>Working Power: 100mw</li>\r\n	<li>The headset pin: 3.5mm (plating)</li>\r\n	<li>Acuity: 95 + 3 db</li>\r\n	<li>Wire length: 120cm</li>\r\n	<li>Gold plated plugs</li>\r\n	<li>Driver Diameter: 9mm</li>\r\n	<li>Frequency Response: 20Hz--20kHz</li>\r\n	<li>Impedance: 16 &Omega;</li>\r\n	<li>Sensitivity(SPL): 100&plusmn;3db</li>\r\n	<li>Rated Input Power: 80mW7</li>\r\n	<li>Plug: :￠3.5mm</li>\r\n	<li>Cord Length: 1.2meters</li>\r\n	<li>Compatibility: iOS, Android, OS Mobile Platforms</li>\r\n	<li>SmartSwitch controller and earbuds included</li>\r\n	<li>Two-way mutual conversion with crystal clear sound</li>\r\n	<li>Unit size: 1cm (moving-coil speaker)</li>\r\n</ul>', 500.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598104131rem 610d.jpg', NULL, NULL, '2020-08-22 17:48:51', '2020-08-27 10:22:53'),
(1060, 1, 2, 7, 23, NULL, '1058', 'Remax RB-S28 Neck-Mounted Wireless Bluetooth Earphones', 'Remax-RB-S28-Neck-Mounted-Wireless-Bluetooth-Earphones', '<ul>\r\n	<li>Type: Bluetooth Earphone</li>\r\n	<li>Material: Metal, Plastic</li>\r\n	<li>Transmission Distance: 10m</li>\r\n	<li>Bluetooth: Bluetooth 5.0</li>\r\n	<li>Frequency Response: 20Hz-2000Hz</li>\r\n	<li>Output Sensitivity: -90.5dB</li>\r\n	<li>Microphone Sensitivity: 42dB</li>\r\n	<li>Playing Time: 4-5 Hours</li>\r\n</ul>', 1650.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598104297s28.jpg', NULL, NULL, '2020-08-22 17:51:37', '2020-08-27 10:22:53'),
(1061, 1, 2, 7, 23, NULL, '1059', 'Remax S2 Magnetic Wireless Bluetooth Headset', 'Remax-S2-Magnetic-Wireless-Bluetooth-Headset', '<ul>\r\n	<li>Brand: REMAX</li>\r\n	<li>Model: S2</li>\r\n	<li>Wearing type : In-Ear</li>\r\n	<li>Function: Multi connection function,Song Switching,Voice control,</li>\r\n	<li>Bluetooth Connectivity : Wireless</li>\r\n	<li>Application: Sport</li>\r\n	<li>Sound channel: Two-channel (stereo)</li>\r\n	<li>Frequency response: 20~20KHz</li>\r\n	<li>Microphone frequency: -41 &plusmn; dB</li>\r\n	<li>Input Power: 10mW</li>\r\n	<li>Standby time: 48 hours</li>\r\n	<li>Charging time: about 2 hours</li>\r\n	<li>Bluetooth: Yes</li>\r\n	<li>Bluetooth version: V4.1</li>\r\n	<li>Bluetooth distance: W/O obstacles 10m</li>\r\n	<li>Package Weight: 0.234 kg</li>\r\n	<li>1 x REMAX S2 Wireless</li>\r\n	<li>Bluetooth 4.1 Magnet Sport Headsets</li>\r\n	<li>1 x User Manual</li>\r\n	<li>1 x USB Cable</li>\r\n	<li>3 x Pairs EarBuds</li>\r\n</ul>', 2000.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598104375s2..jpg', NULL, NULL, '2020-08-22 17:52:55', '2020-08-27 10:22:53'),
(1062, 1, 2, 7, 23, NULL, '1060', 'REMAX RM-711 WIRE CONTROLLED EARPLUG TYPE EARPHONE', 'REMAX-RM-711-WIRE-CONTROLLED-EARPLUG-TYPE-EARPHONE', '<ul>\r\n	<li>Model RM-711</li>\r\n	<li>Appearancety peearplugtype</li>\r\n	<li>Technologycategorymovingcoiltype</li>\r\n	<li>Transmissionmodewired</li>\r\n	<li>Sensitivity100(dB)</li>\r\n	<li>Linelength120(CM)</li>\r\n	<li>Thegrossweightoftheproductis0.05kg</li>\r\n	<li>Compatibleplatform</li>\r\n	<li>Colorblack</li>\r\n</ul>', 850.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598104899711.jpg', NULL, NULL, '2020-08-22 18:01:39', '2020-08-27 10:22:53'),
(1063, 1, 2, 7, 23, NULL, '1061', 'Remax Rpp-139 10000Mah Leader Series Power Bank', 'Remax-Rpp-139-10000Mah-Leader-Series-Power-Bank', '<p>Real capacity:10000mAh</p>\r\n\r\n<p>Input port:Micro&amp;&amp;TypeC</p>\r\n\r\n<p>Input:5V/2A</p>\r\n\r\n<p>Output:5V/2A</p>\r\n\r\n<p>Polymer battery</p>\r\n\r\n<p>With LED digital screen display</p>', 1100.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598105096rpp 139..jpg', NULL, NULL, '2020-08-22 18:04:56', '2020-08-27 10:22:53'),
(1064, 1, 2, 1, NULL, NULL, '1062', 'Remax Rpp-147 10000Mah Jany Series Power Bank', 'Remax-Rpp-147-10000Mah-Jany-Series-Power-Bank', '<p>Weight: 250g,<br />\r\nType-C Input: DC5V 2A,<br />\r\nSize: 135.7*67.3*15.5 mm,<br />\r\nMicro Input: DC5V 2A,<br />\r\nMaterial: PC+ABS,<br />\r\nCertification: RoHS/FCC/CE,<br />\r\nOutput: DC5V 2.1A,<br />\r\nBattery Capacity: 10000mAh,</p>', 1100.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598105271rpp 147.jpg', NULL, NULL, '2020-08-22 18:07:51', '2020-08-27 10:22:53'),
(1065, 1, 2, 7, 23, NULL, '1063', 'Remax Rpp-141 30000Mah Leader Series Power Bank', 'Remax-Rpp-141-30000Mah-Leader-Series-Power-Bank', '<ul>\r\n	<li>Output Interface:DC,</li>\r\n	<li>Micro USB,</li>\r\n	<li>Type C Input</li>\r\n	<li>Interface:DC,</li>\r\n	<li>USB Supports</li>\r\n	<li>Solar Power:No</li>\r\n	<li>LED Illumination:No</li>\r\n	<li>Battery Type:Lithium Polymer Battery</li>\r\n	<li>Name:Remax</li>\r\n	<li>Models:RPP-141</li>\r\n	<li>Measurement:14.2 * 7.3 * 2.6 cm</li>\r\n	<li>Weight:500g</li>\r\n	<li>Socket Type:USB Outport:5 V / 2.0A</li>\r\n	<li>Input Signal:5 V / 2.0A</li>\r\n	<li>Product Name:Large Capacity Polymer USB Power Bank</li>\r\n	<li>Feature 1:Large Capacity</li>\r\n	<li>Shape:Lycra, shaped like a camera</li>\r\n</ul>', 2200.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598105534rrp 141.jpg', NULL, NULL, '2020-08-22 18:12:14', '2020-08-27 10:22:53'),
(1066, 1, 2, 7, 23, NULL, '1064', 'Remax RPP 123 5000mAh Power Bank Orginal', 'Remax-RPP-123-5000mAh-Power-Bank-Orginal', '<ul>\r\n	<li>Brand:Remax</li>\r\n	<li>Model:RPP-123</li>\r\n	<li>Battery Type:Linon 2 Battery</li>\r\n	<li>Weight:100g</li>\r\n	<li>Output:DC5V/2A(Max)</li>\r\n	<li>Output Interface:1 USB</li>\r\n	<li>Battery Capacity(mAh):5000mAh</li>\r\n	<li>Input Interface:Micro USB</li>\r\n</ul>', 925.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598105641123.jpg', NULL, NULL, '2020-08-22 18:14:01', '2020-08-27 10:22:53');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(1067, 1, 2, 7, 23, NULL, '1065', 'REMAX LINON PRO POWER BANK 20000 mAh', 'REMAX-LINON-PRO-POWER-BANK-20000-mAh', '<ul>\r\n	<li>Brand REMAX</li>\r\n	<li>Name Linon Pro Power Bank</li>\r\n	<li>Model RPP-73</li>\r\n	<li>Capacity 20000mAh</li>\r\n	<li>Electric Core Polymers</li>\r\n	<li>Input DC5V-2.0A(max)</li>\r\n	<li>Output DC5V-2.0A(max)</li>\r\n	<li>Materials ABS PC</li>\r\n</ul>', 2500.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598105759rrp 73.jpg', NULL, NULL, '2020-08-22 18:15:59', '2020-08-27 10:22:53'),
(1068, 1, 2, 7, 23, NULL, '1066', 'REMAX RPP-119 10,000mAh Portable Power Bank Dual USB-port Charging Station', 'REMAX-RPP-119-10,000mAh-Portable-Power-Bank-Dual-USB-port-Charging-Station', '<ul>\r\n	<li>BRAND NAME:Remax</li>\r\n	<li>MODEL:RPP-119</li>\r\n	<li>TYPE:Emergency / Portable</li>\r\n	<li>INPUT:5V-2.0A</li>\r\n	<li>OUTPUT:5V/2A</li>\r\n	<li>BATTERY CAPACITY:10000mAh</li>\r\n	<li>MATERIAL:PC+ABS</li>\r\n</ul>', 1800.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598105894119.jpg', NULL, NULL, '2020-08-22 18:18:14', '2020-08-27 10:22:53'),
(1069, 1, 2, 7, 23, NULL, '1067', 'REMAX Leader 2 USB 10000mAh Multiple Input Power Bank RPP-139', 'REMAX-Leader-2-USB-10000mAh-Multiple-Input-Power-Bank-RPP-139', '<ul>\r\n	<li>Manufacturer: Remax</li>\r\n	<li>Model: RPP-139</li>\r\n	<li>Battery capacity: 10,000mAh</li>\r\n	<li>Actual norm: 6100mAh</li>\r\n	<li>Compact design</li>\r\n	<li>High-quality ABS material</li>\r\n	<li>Compatibility: Micro port, Type-c, USB</li>\r\n	<li>Input: DC5V &ndash; 2.0A</li>\r\n	<li>Output: DC5V &ndash; 2.0A</li>\r\n	<li>Size: 1328.96 * 68.44 * 14.5mm</li>\r\n</ul>', 1150.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106059leader 2.jpg', NULL, NULL, '2020-08-22 18:20:59', '2020-08-27 10:22:53'),
(1070, 1, 2, 7, 23, NULL, '1068', 'Remax RPP-153 Janshon Series 10000mAh Power Bank', 'Remax-RPP-153-Janshon-Series-10000mAh-Power-Bank', '<p>Remax RPP-153 10000mAh Pro Powerful Power Bank :</p>\r\n\r\n<p>&gt; Brand Name:Remax</p>\r\n\r\n<p>&gt; Model Number:RPP-153</p>\r\n\r\n<p>&gt; Material:ABS+PC</p>\r\n\r\n<p>&gt; Color:White ,Black</p>\r\n\r\n<p>&gt; Output Interface:DC, Single USB</p>\r\n\r\n<p>&gt; Input Interface:Micro USB/AC, USB TYPE C</p>\r\n\r\n<p>&gt; Supports Solar Energy:No</p>\r\n\r\n<p>&gt; Is LED Lamp Illumination:No</p>\r\n\r\n<p>&gt; Battery Type:Li-Polymer Battery, Lithium Battery</p>\r\n\r\n<p>&gt; Place of Origin:Guangdong, China</p>\r\n\r\n<p>&gt; Socket Type:USB Port</p>\r\n\r\n<p>&gt; Features:Type C Micro inputs, Double Inputs</p>\r\n\r\n<p>&gt; Outport:DC 5V 2.0A</p>\r\n\r\n<p>&gt; Input:DC 5V 2.0A</p>\r\n\r\n<p>&gt; Capacity:10000mAh</p>', 1780.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106175rpp 153.jpg', NULL, NULL, '2020-08-22 18:22:55', '2020-08-27 10:22:53'),
(1071, 1, 2, 7, 23, NULL, '1069', 'Remax RPP-106 20000mAh Power Bank Dual In And Out With LED Digital Display', 'Remax-RPP-106-20000mAh-Power-Bank-Dual-In-And-Out-With-LED-Digital-Display', '<ul>\r\n	<li>Brand: Remax</li>\r\n	<li>Model: RPP-106</li>\r\n	<li>20000mAh</li>\r\n</ul>', 2400.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106284106.jpg', NULL, NULL, '2020-08-22 18:24:44', '2020-08-27 10:22:53'),
(1072, 1, 2, 7, 23, NULL, '1070', 'Remax Proda PP-N3 Notebook 30000mAh Power Bank 4 USB Port-Black', 'Remax-Proda-PP-N3-Notebook-30000mAh-Power-Bank-4-USB-Port-Black', '<ul>\r\n	<li>Package includes: Pure 30000mAh Power Bank, Micro USB Charger Cable, and User Manual</li>\r\n	<li>Model: PP-N3</li>\r\n	<li>Capacity: 30000mAh</li>\r\n	<li>Input: DC5V/2.0A</li>\r\n	<li>Output: DC5V/4.2A</li>\r\n	<li>Product size: 16.3cm x 10.2cm x 1.2cm</li>\r\n	<li>Product weights: 400g</li>\r\n	<li>Package size: 22.5cm x 12.5cm x 1.5cm</li>\r\n	<li>Package weights: 500g</li>\r\n	<li>30000mAh Power Bank x 1</li>\r\n	<li>USB Charger Cable x 1</li>\r\n	<li>User Manual x 1</li>\r\n</ul>', 2950.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106438n3.jpg', NULL, NULL, '2020-08-22 18:27:18', '2020-08-27 10:22:53'),
(1073, 1, 2, 7, 23, NULL, '1071', 'Xiaomi Piston Basic In Ear Earphone - Black', 'Xiaomi-Piston-Basic-In-Ear-Earphone---Black', '<ul>\r\n	<li>Color: Black,Blue,Pink,Purple,Silver</li>\r\n	<li>Function: Answering Phone,Microphone,Song Switching</li>\r\n	<li>Material: Aluminum Alloy,TPE</li>\r\n	<li>Model: Piston Earphones Fresh Version</li>\r\n	<li>Cable Length (m): 1.25m</li>\r\n	<li>Compatible with: iPod</li>\r\n	<li>Connectivity: Wired</li>\r\n	<li>Frequency response: 20-20000Hz</li>\r\n	<li>Impedance: 32ohms</li>\r\n	<li>Input Power: 5mW</li>\r\n	<li>Plug Type: 3.5mm</li>\r\n	<li>Sensitivity: 98 dB (S.P.L at 1KHz)</li>\r\n</ul>', 790.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106638piston basic.jpg', NULL, NULL, '2020-08-22 18:30:38', '2020-08-27 10:22:53'),
(1074, 1, 2, 7, 23, NULL, '1072', 'Xiaomi Mi Sports Bluetooth Earphone Youth Edition Black', 'Xiaomi-Mi-Sports-Bluetooth-Earphone-Youth-Edition-Black', '<ul>\r\n	<li>PRODUCT PACKAGING IN CHINESE ONLY.</li>\r\n	<li>Sweat proof running sports earphone</li>\r\n	<li>Anti-shedding sports earphone</li>\r\n	<li>11 hours long lasting battery life</li>\r\n	<li>IPX4 Professional waterproof</li>\r\n</ul>', 2250.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106812sports youth.jpg', NULL, NULL, '2020-08-22 18:33:32', '2020-08-27 10:22:53'),
(1075, 1, 2, 7, 23, NULL, '1073', 'Redmi AirDots Pro Touch with Display TWS Bluetooth Wireless Earbuds 5.0 TWS Earphones for Xiaomi', 'Redmi-AirDots-Pro-Touch-with-Display-TWS-Bluetooth-Wireless-Earbuds-5.0-TWS-Earphones-for-Xiaomi', '<ul>\r\n	<li>Touch with Display</li>\r\n	<li>type c charging</li>\r\n	<li>7.2mm Audio Drivers</li>\r\n	<li>4.1g Compact Structure</li>\r\n	<li>One Touch to Connect and Listen To the Original Sound</li>\r\n	<li>Bluetooth 5.0</li>\r\n	<li>300mAh Charging Dock</li>\r\n	<li>Bluetooth 5.0, faster and more stable. .</li>\r\n	<li>Dustproof and IPX4 waterproof, Double-eared split design, single and double ears are free to wear. .</li>\r\n	<li>Will automatically pair, power on after taking out from the 280mAh charging box. .</li>\r\n</ul>', 2450.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598106981airdots pro,.jpg', NULL, NULL, '2020-08-22 18:36:21', '2020-08-27 10:22:53'),
(1076, 1, 2, 7, 23, NULL, '1074', 'For Xiaomi Mi In-Ear Piston Type C Earphone', 'For-Xiaomi-Mi-In-Ear-Piston-Type-C-Earphone', '<ul>\r\n	<li>Brand : Xiaomi</li>\r\n	<li>Type : In-Ear Wired</li>\r\n	<li>Connectors: Type c</li>\r\n	<li>Sensitivity: 98dB</li>\r\n	<li>Wire Length: 1.1m</li>\r\n	<li>Waterproof: Yes</li>\r\n	<li>Resistance: 32&Omega;</li>\r\n</ul>', 550.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598107076type c.jpg', NULL, NULL, '2020-08-22 18:37:56', '2020-08-27 10:22:53'),
(1077, 1, 2, 7, 23, NULL, '1075', 'Redmi Mi Power Bank 10000mAh Dual Input & Dual Output - White', 'Redmi-Mi-Power-Bank-10000mAh-Dual-Input-&-Dual-Output---White', '<ul>\r\n	<li>10000mAh Large Capacity</li>\r\n	<li>More durable and optimises charging efficiency, offer constant power</li>\r\n	<li>Dual USB Input and Output</li>\r\n	<li>Two USB ports, which can charge the devices at the same time, the USB-C and Micro USB provide two charging ways, convenient and fast</li>\r\n	<li>Power Input</li>\r\n	<li>5V 2.1A power input, deliver fast and efficient charging for each connected device.</li>\r\n	<li>High-density Lithium Polymer Batteries</li>\r\n	<li>Adopts premium Lithium polymer battery cells. It&#39;s compatible with smartphones and tablets as well as a variety of digital cameras and handheld gaming devices.</li>\r\n	<li>No Cable inside Powerbank Box, Cable Provided Externally</li>\r\n</ul>', 1650.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598108623redmi.jpg', NULL, NULL, '2020-08-22 19:03:43', '2020-08-27 10:22:53'),
(1078, 1, 2, 7, 23, NULL, '1076', 'Xiaomi Version 2 Dual USB Power Bank 10000mAh - Black', 'Xiaomi-Version-2-Dual-USB-Power-Bank-10000mAh---Black', '<ul>\r\n	<li>Batteries type: Li-pol</li>\r\n	<li>Input interface: Micro USB</li>\r\n	<li>Output interface: USB-A</li>\r\n	<li>Rated power:10000mAh 3.85V ( 38.5Wh )</li>\r\n	<li>Input current: 5.0V2.0A 9V/12V18W</li>\r\n	<li>Output current: 5.1V2.4A 9V/12V15W MAX</li>\r\n	<li>Charging time: About 4.2 hours (18W charger)</li>\r\n	<li>About 6.2 hours (10W charger)</li>\r\n	<li>Battery capacity: 10000mAhSafety</li>\r\n	<li>Short circuit protection</li>\r\n	<li>Charge and discharge temperature protection</li>\r\n	<li>Protection against electromagnetic</li>\r\n	<li>Input voltage protection</li>\r\n</ul>', 2300.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598109453xiaomi 2.jpg', NULL, NULL, '2020-08-22 19:17:33', '2020-08-27 10:22:53'),
(1079, 1, 2, 7, 23, NULL, '1077', 'Xiaomi_Mi 10000mAh Power bank 3 18W Two-way Quick Charge', 'Xiaomi_Mi-10000mAh-Power-bank-3-18W-Two-way-Quick-Charge', '<ul>\r\n	<li>Xiaomi_power bank 3 10000mAh USB-C two-way fast charge, USB-A and USB-C interface support 18W MAX fast charging,providing you with a convenient fast charging experience.</li>\r\n	<li>Xiaomi_power bank 3 10000mAh USB-C two-way fast charge version supports a variety of fast charge protocols,Intelligent identification device charging current, USB-C interface supports bidirectional 18W MAX fast charging,input and output faster.</li>\r\n	<li>14.2mm thin easier and comfortable in hand</li>\r\n	<li>Xiaomi_power bank 3 can be quickly charged using a USB-C interface with a power of up to 18W MAX.</li>\r\n	<li>Up to 93% conversion rate, Optimized charging/discharging efficiency</li>\r\n	<li>World-class chips are not only safer, they improve charging conversion rates and stabilize discharging voltage.With advanced resistance-capacitance sensors, 10000mAh Mi_Power Bank 2 is more durable and optimizes charging efficiency.</li>\r\n	<li>Incredibly dense, 10000mAh batteries supplied by ATL/Lishen are used to satisfy the portable power needs for your phone, tablet, camera, and more.</li>\r\n</ul>', 2850.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598109658xiaomi v3.jpg', NULL, NULL, '2020-08-22 19:20:58', '2020-08-27 10:22:53'),
(1080, 1, 2, 7, 23, NULL, '1078', 'Redmi 20000mAh 18W QC3.0 Power Bank Fast Charging Version White Large capacity Power Bank Portable Phone Charger', 'Redmi-20000mAh-18W-QC3.0-Power-Bank-Fast-Charging-Version-White-Large-capacity-Power-Bank-Portable-Phone-Charger', '<ul>\r\n	<li>10000mAh Large Capacity</li>\r\n	<li>More durable and optimises charging efficiency, offer constant power</li>\r\n	<li>Dual USB Input and Output</li>\r\n	<li>Two USB ports, which can charge the devices at the same time, the USB-C and Micro USB provide two charging ways, convenient and fast</li>\r\n	<li>Power Input</li>\r\n	<li>5V 2.1A power input, deliver fast and efficient charging for each connected device.</li>\r\n	<li>High-density Lithium Polymer Batteries</li>\r\n	<li>Adopts premium Lithium polymer battery cells. It&#39;s compatible with smartphones and tablets as well as a variety of digital cameras and handheld gaming devices.</li>\r\n	<li>No Cable inside Powerbank Box, Cable Provided Externally</li>\r\n</ul>', 2750.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598109835redmi  c30.jpg', NULL, NULL, '2020-08-22 19:23:55', '2020-08-27 10:22:53'),
(1081, 1, 2, 7, 23, NULL, '1079', 'Mi 12 Basic with Mic-Ultra deep bass In-Earphone for Xiaomi - White', 'Mi-12-Basic-with-Mic-Ultra-deep-bass-In-Earphone-for-Xiaomi---White', '<ul>\r\n	<li>Earpiece Design: Earbud (In Ear)</li>\r\n	<li>Wireless Technology: Not applicable</li>\r\n	<li>Connector: 3.5mm Jack</li>\r\n	<li>Headphone Style: In-Ear</li>\r\n	<li>​Microphone</li>\r\n	<li>Headphone Jack: 3.5mm</li>\r\n	<li>Cable length: 115cm</li>\r\n	<li>Wire Material: Plastic</li>\r\n	<li>Compatible Models: All Android Mobile Phone.</li>\r\n	<li>Frequency Response Range: 20~20,000 Hz</li>\r\n	<li>Sensitivity: 104 dB</li>\r\n	<li>Impedance: 32 ohm</li>\r\n	<li>Cable Length: 110cm</li>\r\n</ul>', 180.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598109996mi 12.jpg', NULL, NULL, '2020-08-22 19:26:36', '2020-08-27 10:22:53'),
(1082, 1, 2, 7, 23, NULL, '1080', 'Mi In-Ear Pro HD Headphones', 'Mi-In-Ear-Pro-HD-Headphones', '<ul>\r\n	<li>Material: Metal</li>\r\n	<li>Type: In-Ear</li>\r\n	<li>Cable Length (m): 1.25m</li>\r\n	<li>Connecting interface: 3.5mm</li>\r\n	<li>Connectivity: Wired</li>\r\n	<li>Frequency response: 20 - 40KHz</li>\r\n	<li>Impedance: 32ohms</li>\r\n	<li>Plug Type: 3.5mm</li>\r\n</ul>', 1650.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598110256Mi In-Ear Pro HD Headphones.jpg', NULL, NULL, '2020-08-22 19:30:56', '2020-08-27 10:22:53'),
(1083, 1, 2, 7, 23, NULL, '1081', 'Mi In Ear Pro HD MAX Headphones - Golden', 'Mi-In-Ear-Pro-HD-MAX-Headphones---Golden', '<ul>\r\n	<li>Every great story comes with great music</li>\r\n	<li>Product name:Mi In-Ear Headphones Pro HD</li>\r\n	<li>Model no.:QTEJ02JY</li>\r\n	<li>Type of Headphones:In-Ear</li>\r\n	<li>Weight:17g</li>\r\n	<li>Color:Silver</li>\r\n	<li>Wired control:Available</li>\r\n	<li>Cable length:1.25m</li>\r\n	<li>Jack type:3.5mm</li>\r\n	<li>Rated power:5mW</li>\r\n	<li>Speaker Impedance:32 &Omega;</li>\r\n	<li>Sensitivity:98 dB</li>\r\n	<li>Frequency response range:20 - 40,000 Hz</li>\r\n	<li>Standards:Q / WMSX004-2016</li>\r\n</ul>', 1850.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598110388Mi In-Ear Pro HD Headphones.jpg', NULL, NULL, '2020-08-22 19:33:08', '2020-08-27 10:22:53'),
(1084, 1, 2, 7, 23, NULL, '1082', 'Realme Buds 2 Subwoofer Stereo Wired Earphones with Mic', 'Realme-Buds-2-Subwoofer-Stereo-Wired-Earphones-with-Mic', '<ul>\r\n	<li>Brand: Realme</li>\r\n	<li>Color: Black</li>\r\n	<li>Type: In-ear</li>\r\n	<li>Connector: 3.5mm audio jack</li>\r\n	<li>In-line Remote: Yes</li>\r\n	<li>11.2mm bass boost driver</li>\r\n	<li>Built-in Magnets</li>\r\n	<li>In-line 3-Button Remote with Mic</li>\r\n	<li>Adjustable Cable Strap</li>\r\n</ul>', 750.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598110568buds2.jpg', NULL, NULL, '2020-08-22 19:36:08', '2020-08-27 10:22:53'),
(1085, 1, 2, 7, 23, NULL, '1083', 'Realme Buds R20 heavy bass & mic 3.5MM In-Ear Earphones', 'Realme-Buds-R20-heavy-bass-&-mic-3.5MM-In-Ear-Earphones', '<ul>\r\n	<li>Ultralight and classic flat-ear plugs design</li>\r\n	<li>Single-sided design allows to adjust and fit the earphone in right or left ear</li>\r\n	<li>High quality moving-coil loudspearker driver unit</li>\r\n	<li>High fidelity sound,enhance stable signal transmission</li>\r\n	<li>Driver Diameter: 14.2mm</li>\r\n	<li>Impedance: 32&Omega;</li>\r\n	<li>Sensitivity(SPL): 92&plusmn;3dB</li>\r\n	<li>Frequency Response: 20Hz--20000Hz</li>\r\n	<li>Power(Max): 50mw</li>\r\n	<li>Cable length: 120cm</li>\r\n	<li>Headset pin: 3.5mm</li>\r\n</ul>', 450.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598110677r20.jpg', NULL, NULL, '2020-08-22 19:37:57', '2020-08-27 10:22:53'),
(1086, 1, 2, 7, 23, NULL, '1084', 'Realme Buds Wireless In-Ear Bluetooth Headset with Mic Sports headphones Earphone Audio Earbuds', 'Realme-Buds-Wireless-In-Ear-Bluetooth-Headset-with-Mic-Sports-headphones-Earphone-Audio-Earbuds', '<ul>\r\n	<li>Type: Necklace Earphone</li>\r\n	<li>Quantity: 1 PCS</li>\r\n	<li>Material : Plastic</li>\r\n	<li>Color: Yellow</li>\r\n	<li>Geranic Name: Earphones</li>\r\n</ul>', 1750.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598110953realme buds.jpg', NULL, NULL, '2020-08-22 19:42:33', '2020-08-27 10:22:53'),
(1087, 1, 2, 7, 23, NULL, '1085', 'Realme Buds Tws -2', 'Realme-Buds-Tws--2', '<ul>\r\n	<li>Durable Build</li>\r\n	<li>Sweat Proof</li>\r\n	<li>Pure Base Performance</li>\r\n	<li>3 Button Mic</li>\r\n	<li>Universal Control</li>\r\n	<li>5 Hour Battery</li>\r\n	<li>Wireless</li>\r\n	<li>Power bank system charging</li>\r\n	<li>Smooth sound quality</li>\r\n	<li>Bluetooth standard:Bluetooth 5.1 version</li>\r\n	<li>Connection Standby: More than 5 Hours</li>\r\n	<li>Talk time : More than 3 hours</li>\r\n	<li>Song time :2.5 to 3 hours</li>\r\n	<li>Charging time :1 hour</li>\r\n</ul>', 1850.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598111152realmi airbuds.jpg', NULL, NULL, '2020-08-22 19:45:52', '2020-08-27 10:22:53'),
(1088, 1, 2, 7, 23, NULL, '1086', 'Realme Buds TWS -4', 'Realme-Buds-TWS--4', '<ul>\r\n	<li>Edition :Wireless 5.0</li>\r\n	<li>Model :TWS-4</li>\r\n	<li>Transmit Range : &lt;=15m</li>\r\n	<li>Battery:Rechargeable polymer lithum-on battery</li>\r\n	<li>Charge time:&lt;2.5H</li>\r\n	<li>Operate hours:About 4 hours(battery saturation) about 100 H(battery saturation)</li>\r\n	<li>Power bank system charging</li>\r\n	<li>Smooth sound quality</li>\r\n	<li>Bluetooth standard:Bluetooth 5.0 version</li>\r\n	<li>Battery Compartment Capacity:40mA</li>\r\n</ul>', 1990.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598111310airbuds 4.jpg', NULL, NULL, '2020-08-22 19:48:30', '2020-08-27 10:22:53'),
(1089, 1, 2, 7, 23, NULL, '1087', 'For Realme Buds In-ear Earphone 100% Original Bass Boosted Editio', 'For-Realme-Buds-In-ear-Earphone-100%-Original-Bass-Boosted-Editio', '<ul>\r\n	<li>160 percent Louder Bass:</li>\r\n	<li>Built-in Magnets:</li>\r\n	<li>Kevlar for Ultimate Durability:</li>\r\n	<li>Frequency Rate: 20-20,000Hz and Cable Length: 1.25 m</li>\r\n	<li>Three-Button Remote: Control your music, handle phone calls, and even summon Google Assistant with three tactile inline buttons and a mic</li>\r\n	<li>Unmatched Style: Iconic logo and transparent earbuds with yellow accents flawlessly complement your Realme device like no other earphones can.</li>\r\n</ul>', 1150.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598111497airdots.jpg', NULL, NULL, '2020-08-22 19:51:37', '2020-08-27 10:22:53'),
(1090, 1, 2, 7, 23, NULL, '1088', 'RMA108 IPX4 OPPO Realme Buds Air Wireless Earphones Bass headset Realme X50 Pro 5G 6 Pro X2 Pro 5i 5 Pro XT Q', 'RMA108-IPX4-OPPO-Realme-Buds-Air-Wireless-Earphones-Bass-headset-Realme-X50-Pro-5G-6-Pro-X2-Pro-5i-5-Pro-XT-Q', '<ul>\r\n	<li>Light and ComfortableThe realme Buds Wireless are ergonomic and made from high-quality silica gel and memory nickel-titanium alloy for your ultimate comfort.</li>\r\n	<li>Brand Realme</li>\r\n	<li>Model RMA108</li>\r\n	<li>Type In the Ear</li>\r\n	<li>Connectivity Wireless</li>\r\n	<li>Deep Bass Yes</li>\r\n	<li>Impedance 16&thinsp;ohm</li>\r\n	<li>Frequency Response 20&thinsp;Hz (Min) &ndash; 20&thinsp;KHz (Max)</li>\r\n	<li>Battery Lithium Ion 110mAh Battery</li>\r\n	<li>Charging Time 1.5&thinsp;hours</li>\r\n</ul>', 1850.00, '1 pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598111649105 ipx4.jpg', NULL, NULL, '2020-08-22 19:54:09', '2020-08-27 10:22:53'),
(1091, 1, 169, 7, 24, NULL, '1089', 'D-Link DIR-650IN N300 300mbps WiFi Router', 'D-Link-DIR-650IN-N300-300mbps-WiFi-Router', '<ul>\r\n	<li>Model: DIR-650IN</li>\r\n	<li>WPA/WPA2 &amp; Firewall(NAT) Security</li>\r\n	<li>Wireless Interface</li>\r\n	<li>4 X 5dBi External Antenna</li>\r\n	<li>Dimension: 255.9 x 168 x 41.2 mm</li>\r\n</ul>', 2250.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598118091650IN.jpg', NULL, NULL, '2020-08-22 21:41:31', '2020-08-27 10:22:53'),
(1092, 1, 169, 7, 24, NULL, '1090', 'D-Link DIR-806IN AC750 Dual-Brand Wireless Router (3 Antenna)', 'D-Link-DIR-806IN-AC750-Dual-Brand-Wireless-Router-(3-Antenna)', '<ul>\r\n	<li>Model: DIR-806IN</li>\r\n	<li>2.4GHz (2x2) and 5GHz (1x1) up to 750 Mbps</li>\r\n	<li>Advanced Security</li>\r\n	<li>User based bandwidth limitations</li>\r\n	<li>IPv6 and TR-069 Supported</li>\r\n</ul>', 2750.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598119908806in-ac750-1-500x500.jpg', NULL, NULL, '2020-08-22 22:11:48', '2020-08-27 10:22:53'),
(1093, 1, 169, 7, 24, NULL, '1091', 'D-Link DIR-819 AC750 Dual Band Router', 'D-Link-DIR-819-AC750-Dual-Band-Router', '<ul>\r\n	<li>Model: D-Link DIR-819 AC750</li>\r\n	<li>Next Generation Wireless Technology</li>\r\n	<li>3 High-Gain Antennas</li>\r\n	<li>Backward Compatibility</li>\r\n	<li>up to 1200 Mbps</li>\r\n</ul>', 2750.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598119967819 AC750.jpg', NULL, NULL, '2020-08-22 22:12:47', '2020-08-27 10:22:53'),
(1094, 1, 169, 7, 24, NULL, '1092', 'D-Link DIR-841 AC1200 MU-MIMO Wi-Fi Gigabit Router (4 Antena)', 'D-Link-DIR-841-AC1200-MU-MIMO-Wi-Fi-Gigabit-Router-(4-Antena)', '<ul>\r\n	<li>Model: DIR-841</li>\r\n	<li>Gigabit Ethernet WAN port, Fast Ethernet LAN ports</li>\r\n	<li>Up to 300Mbps for 2.4GHz</li>\r\n	<li>up to 867Mbps for 5GHz</li>\r\n	<li>IPV6 Support</li>\r\n</ul>', 3450.00, '1 Pcs', NULL, NULL, 'In Stock', 10, 0, 0, '1598120191841 AC1200.jpg', NULL, NULL, '2020-08-22 22:16:31', '2020-08-27 10:22:53'),
(1095, 1, 169, 7, 24, NULL, '1093', 'D-Link DIR-1360 EXO AC1300 Dual Band Smart Mesh Wi-Fi Router', 'D-Link-DIR-1360-EXO-AC1300-Dual-Band-Smart-Mesh-Wi-Fi-Router', '<ul>\r\n	<li>Model: D-Link DIR-1360 EXO AC1300</li>\r\n	<li>Wi-Fi speeds of up to 400 Mbps (2.4 GHz) + 867 Mbps (5 GHz)</li>\r\n	<li>Built-in powerful McAfee protection</li>\r\n	<li>Give your smart home Wi-Fi a new voice</li>\r\n	<li>Comprehensive parental controls</li>\r\n</ul>', 8000.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598120306DIR-1360 EXO AC1300.jpg', NULL, NULL, '2020-08-22 22:18:26', '2020-08-27 10:22:53'),
(1096, 1, 169, 7, 24, NULL, '1094', 'D-Link DIR-600M Wireless N150 Router', 'D-Link-DIR-600M-Wireless-N150-Router', '<ul>\r\n	<li>Model: DIR-600M Wireless N150</li>\r\n	<li>Interface: 1x LAN &amp; 4x WAN Ports</li>\r\n	<li>DIM: 11.1 x 15.1 x 2.7 cm</li>\r\n	<li>Frequency: 2.4 Ghz to 2.4835 Ghz</li>\r\n</ul>', 1650.00, '1 Pcs', NULL, NULL, 'In Stock', 15, 0, 0, '1598120557DIR-600M.jpeg', NULL, NULL, '2020-08-22 22:22:37', '2020-08-27 10:22:53'),
(1097, 1, 169, 7, 24, NULL, '1095', 'D-Link DIR-816 Wireless AC750 Dual Brand Router ( 3 Antenna)', 'D-Link-DIR-816-Wireless-AC750-Dual-Brand-Router-(-3-Antenna)', '<ul>\r\n	<li>Model: D-Link DIR-816</li>\r\n	<li>Interface: 1x LAN &amp; 4x WAN Ports</li>\r\n	<li>DIM: 108H X 192W X 30D MM</li>\r\n	<li>Frequency: 2.4 GHz to 5 GHz</li>\r\n</ul>', 3600.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598120712DIR-816 Wireless AC750.jpg', NULL, NULL, '2020-08-22 22:25:12', '2020-08-27 10:22:53'),
(1098, 1, 169, 7, 24, NULL, '1096', 'D-Link DWR‑921 4G LTE Router', 'D-Link-DWR‑921-4G-LTE-Router', '<ul>\r\n	<li>Model: D-Link DWR‑921</li>\r\n	<li>Wireless speed 300 Mbps 2.4 GHz</li>\r\n	<li>2 Antennas</li>\r\n	<li>support 3G/4G LTE via SIM</li>\r\n</ul>', 7450.00, '1 Pcs', NULL, NULL, 'In Stock', 5, 0, 0, '1598120907DWR‑921 4G.jpg', NULL, NULL, '2020-08-22 22:28:27', '2020-08-27 10:22:53'),
(1099, 1, 169, 7, 24, NULL, '1097', 'D-link DWR-910 4G Lte Wireless USB Sim Supported Modem + Pocket Router', 'D-link-DWR-910-4G-Lte-Wireless-USB-Sim-Supported-Modem-+-Pocket-Router', '<ul>\r\n	<li>Model: D-link DWR-910</li>\r\n	<li>USB 2.0 plug connects</li>\r\n	<li>SIM Slot (6-pin) allows</li>\r\n	<li>MicroSD card reader allows</li>\r\n</ul>', 2850.00, '1 Pcs', NULL, NULL, 'In Stock', 10, 0, 0, '1598121151DWR-910 4G.jpg', NULL, NULL, '2020-08-22 22:32:31', '2020-08-27 10:22:53'),
(1100, 1, 2, 7, 23, NULL, '1098', 'Uiisii HM9', 'Uiisii-HM9', '<ul>\r\n	<li>Brand Name:UiiSii</li>\r\n	<li>Model Number:UIISII HM9</li>\r\n	<li>With Microphone:Yes</li>\r\n	<li>Function:For Mobile Phone,Common Headphone</li>\r\n	<li>Support Apt-x:No</li>\r\n	<li>Style:In-Ear</li>\r\n	<li>Waterproof:No</li>\r\n	<li>Active Noise-Cancellation:Yes</li>\r\n	<li>Support Memory Card:No</li>\r\n	<li>Resistance:16&Omega;</li>\r\n	<li>Volume Control:Yes</li>\r\n	<li>Connectors:3.5mm</li>\r\n	<li>Communication:Wired</li>\r\n	<li>Frequency Response Range:20-20000Hz</li>\r\n	<li>Line Length:1.2m</li>\r\n	<li>Plug Type:Line Type</li>\r\n	<li>Wireless Type:None</li>\r\n	<li>Vocalism Principle:Dynamic</li>\r\n	<li>Support APP:No</li>\r\n	<li>Is wireless:No</li>\r\n	<li>Sensitivity:102&plusmn;3dB</li>\r\n	<li>Control Button:Yes</li>\r\n</ul>', 1150.00, '1 Pcs', NULL, NULL, 'In Stock', 25, 0, 0, '1598123282HM9.jpg', NULL, NULL, '2020-08-22 23:08:02', '2020-08-27 10:22:53'),
(1101, 1, 84, 2, NULL, NULL, '1099', 'Chili Powder | Organic 100 gm', 'Chili-Powder-|-Organic-100-gm', '<p>&nbsp;* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* সম্পুর্ণ খাঁটি মরিচ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।&nbsp;</p>', 60.00, '100 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598123744morich-gura.jpg', NULL, NULL, '2020-08-22 23:15:44', '2020-08-27 10:22:53'),
(1102, 1, 2, 2, NULL, NULL, '1100', 'Chili Powder | Organic 200 gm', 'Chili-Powder-|-Organic-200-gm', '<p>&nbsp;* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* সম্পুর্ণ খাঁটি মরিচ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -28px; top: -5.77778px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 110.00, '200 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598123796morich-gura.jpg', NULL, NULL, '2020-08-22 23:16:36', '2020-08-27 10:22:53'),
(1103, 1, 2, 2, NULL, NULL, '1101', 'Chili Powder | Organic 500gm', 'Chili-Powder-|-Organic-500gm', '<p>&nbsp;* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* সম্পুর্ণ খাঁটি মরিচ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।&nbsp;</p>', 230.00, '500 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598123833morich-gura.jpg', NULL, NULL, '2020-08-22 23:17:13', '2020-08-27 10:22:53'),
(1104, 1, 2, 2, NULL, NULL, '1102', 'Turmeric Powder | Organic 250 gm', 'Turmeric-Powder-|-Organic-250-gm', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* খাঁটি হলুদ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।</p>', 80.00, '250 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598123971holud-gura.jpg', NULL, NULL, '2020-08-22 23:19:31', '2020-08-27 10:22:53'),
(1105, 1, 2, 2, NULL, NULL, '1103', 'Turmeric Powder | Organic 500 gm', 'Turmeric-Powder-|-Organic-500-gm', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* খাঁটি হলুদ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।</p>', 150.00, '500 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598124091holud-gura.jpg', NULL, NULL, '2020-08-22 23:21:31', '2020-08-27 10:22:53'),
(1106, 1, 2, 2, NULL, NULL, '1104', 'Coriander Powder । ধনিয়া গুড়া -', 'Coriander-Powder-।-ধনিয়া-গুড়া--', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* স্বাস্থ্যসম্মত মসলা।</p>\r\n\r\n<p>* পরিশুদ্ধ উপাদানের নিশ্চয়তা।</p>\r\n\r\n<p>* সর্বোচ্চ গুনগতমানের নিশ্চয়তা।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাত ও প্যাকেজিংকৃত।</p>', 45.00, '100 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598124275dhoniya-gura.jpg', NULL, NULL, '2020-08-22 23:24:35', '2020-08-27 10:22:53'),
(1107, 1, 2, 2, NULL, NULL, '1105', 'Coriander Powder । ধনিয়া গুড়া - 200 gm', 'Coriander-Powder-।-ধনিয়া-গুড়া---200-gm', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* স্বাস্থ্যসম্মত মসলা।</p>\r\n\r\n<p>* পরিশুদ্ধ উপাদানের নিশ্চয়তা।</p>\r\n\r\n<p>* সর্বোচ্চ গুনগতমানের নিশ্চয়তা।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাত ও প্যাকেজিংকৃত।</p>', 80.00, '200 gm', NULL, NULL, 'In Stock', 100, 0, 0, '1598124341dhoniya-gura.jpg', NULL, NULL, '2020-08-22 23:25:41', '2020-08-27 10:22:53'),
(1108, 1, 84, 2, NULL, NULL, '1106', 'Pure Ghee | 1 kg', 'Pure-Ghee-|-1-kg', '<p>. Pure Ghee From cow milk</p>\r\n\r\n<p>. Money-Back Guarantee if prove it&#39;s not pure</p>', 1550.00, '1 Kg', NULL, '100%', 'In Stock', 25, 0, 0, '1598193980118118259_308850877044085_9163016870802367596_n.jpg', NULL, NULL, '2020-08-23 18:46:20', '2020-08-24 14:36:33'),
(1109, 1, 84, 2, NULL, NULL, '1107', 'Pure Ghee | 500 gm', 'Pure-Ghee-|-500-gm', '<p>. Pure Ghee From cow milk</p>\r\n\r\n<p>. Money-Back Guarantee if prove it&#39;s not pure</p>', 775.00, '500 Gm', 740.00, '5%', 'In Stock', 25, 0, 0, '1598194100118118259_308850877044085_9163016870802367596_n.jpg', NULL, NULL, '2020-08-23 18:48:20', '2020-08-23 21:15:22'),
(1110, 1, 84, 2, NULL, NULL, '1108', 'Pure Ghee | 250 gm', 'Pure-Ghee-|-250-gm', '<p>. Pure Ghee From cow milk</p>\r\n\r\n<p>. Money-Back Guarantee if prove it&#39;s pure</p>', 410.00, '1', NULL, '100%', 'In Stock', 25, 0, 0, '1598194177118118259_308850877044085_9163016870802367596_n.jpg', NULL, NULL, '2020-08-23 18:49:37', '2020-08-24 22:31:40'),
(1111, 1, 2, 7, 23, NULL, '1109', 'i7s TWS Mini Wireless Bluetooth Earphone Stereo Earbud Headset With air Charging Box', 'i7s-TWS-Mini-Wireless-Bluetooth-Earphone-Stereo-Earbud-Headset-With-air-Charging-Box', '<ul>\r\n	<li>1. Driver: 15mm</li>\r\n	<li>2. Impedance: 32 OHM</li>\r\n	<li>3. Bluetooth version: Bluetooth 5.0</li>\r\n	<li>4. Bluetooth use band: 2.4GHz</li>\r\n	<li>5. Power level: CLASS II</li>\r\n	<li>6. Output power: 30mW</li>\r\n	<li>7. Bluetooth distance: 12 meters barrier</li>\r\n	<li>8. Frequency response: 20-20000Hz</li>\r\n	<li>9. Operating voltage range: 3.0V-4.2V</li>\r\n	<li>10. Mic sensitivity: -96dB</li>\r\n	<li>11. With A2DP / AVRCP high quality stereo audio transmission and remote control protocol</li>\r\n	<li>12. Powerful noise de-noising circuit (active noise reduction)</li>\r\n	<li>13. switch between Chinese and English (boot does not connect Bluetooth state, press the switch 2 times, hear the tone switch successfully)13. Talk time is about 2-3hours</li>\r\n	<li>14. music time about 2-3hours15. Standby time is about 100 hours</li>\r\n</ul>', 750.00, '1 pcs', NULL, '100%', 'Out Of Stock', 25, 0, 0, '15982788291129e9b2cc5273175b278534afe2a325.jpg_720x720q75.jpg', NULL, NULL, '2020-08-24 18:20:29', '2020-09-01 18:23:06'),
(1112, 1, 2, 1, 1, NULL, '1110', 'Malta | 2 kg Pack', 'Malta-|-2-kg-Pack', '<ul>\r\n	<li>Malta</li>\r\n	<li>The great source of Vitamin C</li>\r\n	<li>Inported From South africa</li>\r\n</ul>', 360.00, '2 kg', 299.00, '17%', 'In Stock', 100, 0, 0, '1598736118malta.jpg', NULL, NULL, '2020-08-30 01:21:58', '2020-09-01 18:23:06'),
(1113, 1, 2, 1, 1, NULL, '1111', 'Guava Thai | 2 Kg', 'Guava-Thai-|-2-Kg', '<ul>\r\n	<li>Thai Guava</li>\r\n	<li>Big size</li>\r\n</ul>', 180.00, '2 kg', 140.00, '22%', 'In Stock', 100, 0, 0, '15987361960002370_guava-thai-500-gm_360.png', NULL, NULL, '2020-08-30 01:23:16', '2020-09-01 18:23:06'),
(1114, 1, 2, 1, 1, NULL, '1112', 'Green Apple | 2 Kg', 'Green-Apple-|-2-Kg', '<ul>\r\n	<li>Green apple</li>\r\n	<li>Imported from South Africa</li>\r\n</ul>', 380.00, '2 kg', 360.00, '5%', 'In Stock', 100, 0, 0, '1598736375green apple.png', NULL, NULL, '2020-08-30 01:26:15', '2020-09-01 18:23:06'),
(1115, 1, 2, 1, 1, NULL, '1113', 'Hog Plum (Amra) - 2 Kg', 'Hog-Plum-(Amra)---2-Kg', '<ul>\r\n	<li>Hog Plum [Amra]</li>\r\n	<li>From barisal</li>\r\n</ul>', 110.00, '2 kg', NULL, NULL, 'In Stock', 100, 0, 0, '15987364820003021_hog-plum-amra-500-gm_360.png', NULL, NULL, '2020-08-30 01:28:02', '2020-09-01 18:23:06'),
(1116, 1, 2, 1, 1, NULL, '1114', 'দেশী পেয়ারা । স্বরূপকাঠি পেয়ারা- ২ কেজি', 'দেশী-পেয়ারা-।-স্বরূপকাঠি-পেয়ারা--২-কেজি', '<ul>\r\n	<li>দেশী সুস্বাদু পেয়ারা&nbsp;</li>\r\n	<li>স্বরূপকাঠি, বরিশাল।&nbsp;</li>\r\n</ul>', 180.00, '2 kg', 160.00, '11%', 'In Stock', 100, 0, 0, '1598737946deshi peyara.jpg', NULL, NULL, '2020-08-30 01:35:44', '2020-09-01 18:23:06'),
(1117, 1, 2, 1, 1, NULL, '1115', 'Pomelo Fruit (Jambura) | 1 Pcs', 'Pomelo-Fruit-(Jambura)-|-1-Pcs', '<p>Citrus fruit maxima (or Citrus grandis), (Common titles: pomelo, maniglia, pummelo, pommelo, pamplemousse, jabong (Hawaii), shaddick, or shaddock) is an organic (non-hybrid) lemon or lime, with the overall look of a big grapefruit, native to South and Southeast South america. The toronja is an unique member of the citrus fruit which has a surprising quantity of health benefits for all those people ready to do a little bit of searching for this. These amazing health benefits of pomelos consist of its capability to boost the defense mechanisms, improve digestive function, lower blood pressure, decrease cramping, stop anemia, increase bone power, reduce indications of premature ageing, protect center health, assist in weight loss, and boost dental and oral health. Pomelos are believed citrus fruits and veggies, and are carefully related to grapefruits and the additional members from the Citrus genus. Its medical name of Citrus norma because it is the biggest citrus fruit. The closest in dimensions to this ruler of citrus fruit fruits is actually a grapefruit. Pomelos are mainly found in Southeast Asia, which can be their indigenous region.</p>', 85.00, '1', 80.00, '6%', 'In Stock', 100, 0, 0, '1598737174jambura.jpg', NULL, NULL, '2020-08-30 01:39:34', '2020-09-01 18:23:06'),
(1118, 1, 2, 1, NULL, NULL, '1116', 'Amla (Amloki) | 250 gm', 'Amla-(Amloki)-|-250-gm', '<ul>\r\n	<li>Amla good for health</li>\r\n	<li>Amla control hair fall</li>\r\n	<li>Amla control dry skin.</li>\r\n</ul>', 80.00, '1', NULL, NULL, 'In Stock', 1000, 0, 0, '1598737536amla 22.JPG', NULL, NULL, '2020-08-30 01:45:36', '2020-09-01 18:23:06'),
(1119, 1, 2, 1, 2, NULL, '1117', 'Discovery Peanut Butter  Chunky – 227gm', 'eyJpdiI6IkorZFFrK21GTHVBbjJjQTNqZVlrbkE9PSIsInZhbHVlIjoidHZiU2hDNFM1QTdwQ3JkdFZNQU9WXC85T0JjQ0REbVwvUDM5Q0lhTVlzUjZuTVlJeVlSS3RUd1FXcVVVeHNwSE53d3ZcL1kzSVdxNm1iU1dsdGxQXC9PVitBPT0iLCJtYWMiOiI2NjE4MDA1YTViNDEzOWFmZjkwNTZiNzc5NzRmYTgwMDA0ZTdkM2MyMzhmYzE3ZDI4YmFiOTA0ZGI4M2Y4YTQxIn0=', '<ul>\r\n	<li>Country of Origin: USA</li>\r\n	<li>Weight: 227 gm</li>\r\n	<li>One of the best Pasta brand from USA</li>\r\n</ul>', 255.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598996377Discovery Peanut Butter chunky.jpg', NULL, NULL, '2020-09-02 01:39:37', '2020-09-02 01:39:37'),
(1120, 1, 2, 1, 2, NULL, '1118', 'Discovery Peanut Butter Smooth Creamy 510gm', 'eyJpdiI6Ik5aZlA5YnRGd2UyWVQ5ZThmbWo0Nnc9PSIsInZhbHVlIjoiWWlqYTdrN2pHcyswQ0F2ZHp5aW1tMjAydkxqNkI0VXYyWWpnSlNmNlRmSnJBSWpmbUtlVlcrRlREZ1dpMlZHb3RBMXlKczV0c3Vxb2dSQUE3Q29FY0E9PSIsIm1hYyI6IjQ0NjNhNjVkYjczZTIwNjZhZjgzODhkZjNlMjA1NTAwMTQxZDY3YTliOTZlYTgzNzU4NDg5YmU1MTllYmVmNWEifQ==', '<ul>\r\n	<li>Capacity 510gm</li>\r\n	<li>Peanut Butter Smooth Creamy</li>\r\n</ul>', 500.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598996529Peanut Butter Smooth Creamy.jpg', NULL, NULL, '2020-09-02 01:42:09', '2020-09-02 01:42:09'),
(1121, 1, 2, 1, 2, NULL, '1119', 'Discovery Peanut Butter- Smooth n Creamy 510G', 'eyJpdiI6IjNFXC84QnNqbDJUQzA5czlNZm1wQUFBPT0iLCJ2YWx1ZSI6InU4cEQ0Y2s3b0UxN3VaUkRLSlNlWEpndGdFTGZVbld4MjkzYWVVRW9sSDlaMStlcWd6b1doTlpGR0NxK2RzanZQSHFmYU9GdWQzaDZwVTlWWFZCaDBnPT0iLCJtYWMiOiI5ZjcyNDM4ZDlkMGYzYjkxNWY4MTVhNzNkZGUwYzZhMjM4ZDUwM2M4MGU5YWQ2OGQ4MTUzZjg4MmE3ZGE1ZGRlIn0=', '<ul>\r\n	<li>Type: Peanut Butter</li>\r\n	<li>-Brand: Discovery</li>\r\n	<li>-Weight: 510gm</li>\r\n	<li>Smooth and creamy</li>\r\n	<li>made in usa</li>\r\n</ul>', 550.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598996645Discovery Peanut Butter- Smooth n Creamy 510G.jpg', NULL, NULL, '2020-09-02 01:44:05', '2020-09-02 01:44:05'),
(1122, 1, 2, 1, 2, NULL, '1120', 'Discovery Peanut Butter-340gm', 'eyJpdiI6IlBXWUZWd3JQMDFIdE9ySTJWd081Q2c9PSIsInZhbHVlIjoiUmxxWk1pVkhOZjZNbGx5NzdnTzhjYVJsVFlGTWI1QXZUcnZiTVZjcGMrVkI1S2ZiNDlMYnFjUm8zWjY2NkdRciIsIm1hYyI6ImRhZjA1ZjZhMzM2YWY0NzkyMWE0ZWQ5NjVmYzVlMzhjMGZjNmJjOWUzNDYzMjU1ZjRmZDc0MmU2MjgxMTU0NmYifQ==', '<ul>\r\n	<li>Country of Origin: USA</li>\r\n	<li>Weight: 340 gm</li>\r\n	<li>One of the best Pasta brand from USA</li>\r\n</ul>', 350.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598996815Discovery Peanut Butter-340gm.jpg', NULL, NULL, '2020-09-02 01:46:55', '2020-09-02 01:46:55'),
(1123, 1, 2, 1, 3, NULL, '1121', 'Discovery Apple Cider Vinegar With Mother-500 ml', 'eyJpdiI6Ink3XC92R3JZMW5Db1N1OHUzaGh3UjRBPT0iLCJ2YWx1ZSI6ImJZeThidXQ1M3pNMDB4NFlIUGk4dXpqclNZOVpGSkpTMTZYc0QwUlI4emM3M2xpWjNHU0FTK2dnVlduNnBOU1lGeWxPdU84Z0ErV09GZUlcL2lCUTZmdz09IiwibWFjIjoiYzY0NTg3MzAyNTg4NDFkYjc4ODJjMzBkYTFjZTYwZTcyNWU1ZjNjMDVmOGUwNDRhMmIwYmYwMGMxZDJkMDYzZiJ9', '<ul>\r\n	<li>Product: Organic Apple Cider Vinegar with mother</li>\r\n	<li>Speciality: Certified Organic, Raw &ndash; Unfiltered</li>\r\n	<li>Weight: 500ml</li>\r\n	<li>Store: In a Dry location at Room Temperature</li>\r\n	<li>Exterior Container: Glass Bottle</li>\r\n	<li>Quality: 100% Original</li>\r\n</ul>', 875.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598996977Organic Apple Cider Vinegar with mother.jpg', NULL, NULL, '2020-09-02 01:49:37', '2020-09-02 01:49:37'),
(1124, 1, 2, 1, 3, NULL, '1122', 'Organic Apple Cider Vinegar with The Mother 1 Ltr | Discovery | Italy', 'eyJpdiI6IkxDYjd0UytNMmVcL1U0cWhlYUlMZE53PT0iLCJ2YWx1ZSI6Imo4SHBaY2JBWWhrTUR6c2NZNE43b2swZEtcL1hjWXBMRHFpVnNaR0RzWVwvNDJqeW5oemI4VDUzckJPOXhXVnJOeG00QWhlN3R1OTYyXC9cLzI5RlZIcndZNk9hb3hLMWpsWFwvbkVUeDQ5SUFleEE9IiwibWFjIjoiZGY0Nzg4MjJhYzYwMGY1NjdkMmQ0NmY0ZWRkZWZmOWFmNDE0ZDAyOTJiODE0NTlhYjg2OTMyMmE2MTJhYjA3MCJ9', '<ul>\r\n	<li>Product Name: Organic Apple Cider Vinegar with the &#39;Mother&#39;</li>\r\n	<li>Origin: Italy</li>\r\n	<li>Weight: 1 Ltr</li>\r\n	<li>USDA Organic</li>\r\n	<li>Raw, Unfiltered</li>\r\n	<li>Unpasteurized, Naturally Gluten-Free</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 1325.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598997126Organic Unfiltered Apple Cider Virgin 1Ltr.jpg', NULL, NULL, '2020-09-02 01:52:06', '2020-09-02 01:52:06'),
(1125, 1, 2, 1, 3, NULL, '1123', 'Discovery Apple Cider Vinegar 473ml', 'eyJpdiI6IjZyVDdPR2xmQ3dNTElsTXBJaFhOaGc9PSIsInZhbHVlIjoiMFpFdDZENUNXb284NVwvVmVcLzhnT1orN0FGRFdcL3lSQXVhcWVRaEFwcW1Xb1NkZVpVXC9jS1BGRUNuc2tueW1XUGMiLCJtYWMiOiI1OWZhMjBkMDM3NzM4NmQwNmFhYTZmYTE3NTI0ZjA1ZDIxZDU2N2M1N2Q2MzU4YTZlOTRlZTA3ZTI1NDQyY2Q0In0=', '<ul>\r\n	<li>Product Type: Vinegar</li>\r\n	<li>Brand:Discovery</li>\r\n	<li>Flavor: Apple Cider</li>\r\n	<li>Weight: 473ml</li>\r\n	<li>Product Origin: USA</li>\r\n	<li>Quality: 100% Original</li>\r\n	<li>Packaging: Glass Bottle</li>\r\n</ul>', 490.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598997281Discovery Apple Cider Vinegar 473ml.jpg', NULL, NULL, '2020-09-02 01:54:41', '2020-09-02 01:54:41'),
(1126, 1, 2, 1, 3, NULL, '1124', 'Discovery Organic Apple Cider Vinegar With the Mother 250ml', 'eyJpdiI6ImhYRXFsVDlGZFwvcVRMbVhmZkpkN0VBPT0iLCJ2YWx1ZSI6IjQ0Y0FZRk1DM2JoakZiZmZkZCtUWUw1UnU4T2I3TU1nSllxcVNCVjR6OG5OSGluMCs0bE9JN2VNbU9mUUY3MWNMZ0xhVTNCd3dVMUk0c3lDVHdrMVl5cVwvS2xHUlpuRndmeUlwc1R0aUtlVT0iLCJtYWMiOiJmYTMwN2Q4MTljODQxZDQwNzdhMmE0MWJkMDkzYzRiODUyYmI3NDZlMGY3MDc5Y2YxYWYzYjNlNTYyMjA2MDk4In0=', '<ul>\r\n	<li>Product: Organic Apple Cider Vinegar with mother</li>\r\n	<li>Brand: Discovery</li>\r\n	<li>Speciality: Certified Organic, Raw &ndash; Unfiltered</li>\r\n	<li>Weight: 250 ml</li>\r\n	<li>Store: In a Dry location at Room Temperature</li>\r\n	<li>Exterior Container: Glass Bottle</li>\r\n	<li>Origin/Manufactured: Italy</li>\r\n	<li>Quality: 100% Original</li>\r\n</ul>', 500.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598997431Organic Apple Cider Vinegar with mother 250ml.jpg', NULL, NULL, '2020-09-02 01:57:11', '2020-09-02 01:57:11'),
(1127, 1, 2, 1, 8, NULL, '1125', 'Discovery BBQ Sauce 490 gm', 'eyJpdiI6IjFlRTFBcTN6V0lEYnJSTmVvbFh4ZFE9PSIsInZhbHVlIjoib1FldjNQNGJhWEJvQ3dMUFZZWXpKenRoZzJaTGM0NnlNN0NrZTdrTkEwMkhyWG13ejduRENQNkRWUkxQRHpDdCIsIm1hYyI6IjI2ZTliMmEwOWQzNDBkNzc2Yzk4M2I0YmY5OTc2NzdkNGNlMTY2MDRiZDc2OWNiOWNiNDRhYTMxYzgwZGQ4NDgifQ==', '<ul>\r\n	<li>Product Type: BBQ Sauce</li>\r\n	<li>Brand: Discovery</li>\r\n	<li>Capacity: 490gm</li>\r\n	<li>Great quality food product</li>\r\n</ul>', 350.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1601133246discovery bbq sauce.jpg', NULL, NULL, '2020-09-02 01:59:59', '2020-09-26 19:14:06'),
(1128, 1, 2, 1, 8, NULL, '1126', 'Discovery Mustard Sauces - 227gm', 'eyJpdiI6ImJqUmYwZUJDVHZzRGtOcDBmQ0NrZlE9PSIsInZhbHVlIjoidlRJZVA4aGRXcFpMN29nYjlobXcxdStDVUwzVUFZR2ZEb0V2S3V3WXBlNWFrcXBtNGNJMFVNZ21DN3ZhMHVNbCIsIm1hYyI6Ijk4NzUxYWQ1NGIyZWJhNjdkNzBjZDc4ZGExNTU0ZjYwMmY0OWVmZTY1YzBiOGExZGY0ZWZlYmM3NmNmMjJlMWUifQ==', '<ul>\r\n	<li>Discovery Mustard Sauces -</li>\r\n	<li>227g</li>\r\n	<li>Brand: Discovery</li>\r\n	<li>Flavor: Mustard</li>\r\n	<li>Origin: U.S.A</li>\r\n</ul>', 215.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1598997724Discovery Mustard Sauce- 227gm.jpg', NULL, NULL, '2020-09-02 02:02:04', '2020-09-02 02:02:04'),
(1129, 1, 2, 1, 5, NULL, '1127', 'Pasta Hut Macaroni 500 gm', 'eyJpdiI6InlJVDFiWjVmNDhsV2VONDdhRW8wcVE9PSIsInZhbHVlIjoiU1JKNzhrVTNSZWpsUHZUQU92aVhwODdZSmo1N2hmc0k4ZExnWHQ0NzA4akhtRkRYTjd2ZkRVWnVPcGM4Y1Y2UCIsIm1hYyI6ImU3Y2VlNDc2YjhjOWYyYjUzZjQyZGYyMmY5MTRmNDgwMTE4ZWRmMDU3MzAxOTUwNDZhZWUyYjE3YjQ0MTFiMDgifQ==', '<p>Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking.</p>', 120.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599071768Pasta Hut Macaroni 500 gm.jpg', NULL, NULL, '2020-09-02 22:36:08', '2020-09-02 22:36:08'),
(1130, 1, 2, 1, 5, NULL, '1128', 'Pasta Hut Spaghetti 500 gm', 'eyJpdiI6Ingxa3E3bHlWZmhPd0xFZ2xRMHFDK3c9PSIsInZhbHVlIjoiWDlaaEJ2WVBlYWFhXC9xQW5iVUx3RDhLaWc2NkhvTjMyckdxVXIraGhzK2tIdlhSTlFGNVhXTVJGTnFSbU8xdk0iLCJtYWMiOiJhYjU4ZGMwNGQ3NDIyOWE4MmM5ZDBlYmE4ODA4MmU5NjMwMTAwMWM5ZTM3MDUzZjQ5NDRhNGNjNDEyNDIxYjhmIn0=', '<ul>\r\n	<li>Pasta Hut Spaghetti 500gm</li>\r\n	<li>&nbsp;Finely sized spaghetti</li>\r\n	<li>&nbsp;Contains curbs and glucose</li>\r\n	<li>&nbsp;Thick and long</li>\r\n	<li>&nbsp;Cholesterol free</li>\r\n	<li>&nbsp;Helps to balance your diet</li>\r\n	<li>Can have as a main food</li>\r\n</ul>', 130.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599071896Pasta Hat Spaghetti Pasta 500 gm - Imported Food.jpg', NULL, NULL, '2020-09-02 22:38:16', '2020-09-02 22:38:16'),
(1131, 1, 2, 1, 5, NULL, '1129', 'Pasta Hat Spiral pasta 500 gm', 'eyJpdiI6ImdQR2VsOGorUWhmS0JoNVVKWGNIQ2c9PSIsInZhbHVlIjoiMVIxTU81WEtcL2dtcFdFdUVtS3VsY3JNMG5VemN0ZkVzOE9jVHhaUVY5M0pTbVA0dU5lTGYyanUweGNVSVpIVmMiLCJtYWMiOiJhYzJjMTJiYzU5ODk5YWVmNThjNDdiYjNhYzcwZTQ5MDIzNGYwYmU0MjM0NjNhNzVmOWNmMzFlY2U0ZWQyMTQ1In0=', '<ul>\r\n	<li>Brand: Pasta Hat</li>\r\n	<li>Weight: 500gm</li>\r\n	<li>Origin: Dubai, UAE</li>\r\n	<li>Manufacturer: Emirates Macaroni Factory</li>\r\n	<li>Keep in a dry and hygienic place</li>\r\n	<li>This is a Vegetarian product</li>\r\n	<li>100% Halal</li>\r\n	<li>The product is safe for human consumption</li>\r\n	<li>No additives added</li>\r\n	<li>Ingredients: Durum Wheat Semolina</li>\r\n	<li>Premium quality product</li>\r\n	<li>Pure and Fresh Grocery Item</li>\r\n	<li>Good for Your Healthy Life</li>\r\n	<li>Highest quality</li>\r\n	<li>All thing buy at wholesale price</li>\r\n	<li>99 % of customer satisfaction</li>\r\n</ul>', 180.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599072092Pasta Hat Spirali pasta 500 gm Imported Food.jpg', NULL, NULL, '2020-09-02 22:41:32', '2020-09-02 22:41:32'),
(1132, 1, 2, 1, 8, NULL, '1130', 'Luglio Pomace Olive Oil (5 ltr)-Cooking oil- Made in Italy | Discovery', 'eyJpdiI6IjdxdkVtTXpYNEpxdmpHNmI3bllwVHc9PSIsInZhbHVlIjoiNjgzOEJ1RVduRHJmSklrN2duSkw1YnUwN2hDTFV1RVRsZkRwQlBcL2pzYXdocE5XZTAzaFwvZDhFXC90Z09oM2xkMVc5ckY2eTF4Z3R5eW9hWG1UK3JzdG95b2F4MDgwalNXRStwcTZcL251aGVrPSIsIm1hYyI6IjQwNDU1NTgxZTYxYzIzMTUzYTc0NmI4ZjlkYjU3MTdmZjBlYTA4M2I4MWQ0M2ZmOGMyMWZiMzIxZDBhYjE0YmEifQ==', '<ul>\r\n	<li>Olive Oil Is Rich in Healthy Monounsaturated Fats. ...</li>\r\n	<li>Olive Oil Contains Large Amounts of Antioxidants. ...</li>\r\n	<li>Olive Oil Has Strong Anti-Inflammatory Properties. ...</li>\r\n	<li>Olive Oil May Help Prevent Strokes. ...</li>\r\n	<li>Olive Oil Is Protective Against Heart Disease.</li>\r\n	<li>Olive oil is the natural oil extracted from olives, the fruit of the olive tree.</li>\r\n	<li>About 14% of the oil is saturated fat, whereas 11% is polyunsaturated, such as omega-6 and omega-3 fatty acids (1).</li>\r\n	<li>But the predominant fatty acid in olive oil is a monounsaturated fat called oleic acid, making up 73% of the total oil content.</li>\r\n	<li>Studies suggest that oleic acid reduces inflammation and may even have beneficial effects on genes linked to cancer (2Trusted Source, 3Trusted Source, 4Trusted Source, 5Trusted Source).</li>\r\n	<li>Monounsaturated fats are also quite resistant to high heat, making olive oil a healthy choice for cooking.</li>\r\n</ul>', 3800.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599072461Luglio Olive pomace Oil-5litre(Cooking Oil)- Made in Italy.jpg', NULL, NULL, '2020-09-02 22:47:41', '2020-09-02 22:47:42'),
(1133, 1, 2, 1, 5, NULL, '1131', 'PASTA HAT VERMICELLI FINE 500G', 'eyJpdiI6ImhFcHc1RG1Rc1lQN2dCY0JraDZZWHc9PSIsInZhbHVlIjoiWTlxdVM4VEJ0UEdKYSt5SXY5ZFBXZTlUMDZIdHUrcDl2YWlkVXpTakhpTDV3QXE4bEJFODIxdVRLRFRWSFRVaSIsIm1hYyI6IjQ2NzQ4YmI2ZTQ5YTFiNjFkOGRjOTE0YzhkN2VkZGExYTNiZWMxNDMyNzJlODRiYjdmZjM5YzI2Y2Q3Yzk4MGQifQ==', '<h1>PASTA HAT VERMICELLI FINE 500G</h1>', 110.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599072520pasta_hat_vermicelli_fine_500g.png', NULL, NULL, '2020-09-02 22:48:40', '2020-09-02 22:48:40'),
(1134, 1, 2, 1, 5, NULL, '1132', 'Pasta Hat Macaroni (Medium Shell)', 'eyJpdiI6IkdRT1ExbittbGxueU1qMmVjY0x1aUE9PSIsInZhbHVlIjoibjFUcWc3MTNmSmdkZmpqdkZiWHVBUVRKZUpZbkt5NkRrSHVMSG56eXZyVFlmRnJ3M0NHVFVqa05EcDdaVE8rbSIsIm1hYyI6IjlkODIxZmI5MTgzNWM5Yzk5ZTA0NWNjNzI2ZjE2NWUwNGYwZWRlM2RkZjRiNTgwOGI3MGU2NGY0YzNkNjI5OTMifQ==', '<h1>Pasta Hat Macaroni (Medium Shell)</h1>', 130.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599072774_mpimage0.jpg', NULL, NULL, '2020-09-02 22:52:54', '2020-09-02 22:52:54'),
(1135, 1, 2, 1, 5, NULL, '1133', 'Pasta Hat Elbow Pasta 500 gm', 'eyJpdiI6IlBkK05IaXlyVDRwaVwvdVV0Z2FcL3NqZz09IiwidmFsdWUiOiJIR20xaU5XUDNsTlVPUzE0elYyOHRDVVFLXC9DbGxzVU5GN2dMY3VKQXRoY2xtMW5lXC9lSWFoUXk3WmpxSGM0dSsiLCJtYWMiOiIyNWYyYzlkYzU5OWYzMWI2OWVmZjM1M2JlNjJlMjg5ZmM3MzhiYzY2ZDgzMTgxOTU3ZjQ1MDhjYzFmYTc0YWNjIn0=', '<p>Pasta Hat Elbow Pasta 500 gm</p>', 125.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599072869Pasta Hat Elbow Pasta , 500gm.jpg', NULL, NULL, '2020-09-02 22:54:29', '2020-09-02 22:54:30'),
(1136, 1, 2, 3, 9, NULL, '1134', 'Supermom Mild Baby Wipes | 80 pcs', 'eyJpdiI6IkRDTnFaRFZuUkgyN3BJalp5V0YxSkE9PSIsInZhbHVlIjoiMm5lbkJwdWVQdGx4cFNnaVhSTDlJRjVqUXY1VzNsUWJaRkZmXC9cLzRNMEdSSVlVSWpYN2ViRys0Y2U4eDZvV21jIiwibWFjIjoiZjA4NTg0MjRlYjg5MGU0NzBlMWU2MzYxOWY4YTc4MTY2MDE0ZTczNmI4MGEwMzRmZjZhOTAxMjMwNzJiNzJjNSJ9', '<ul>\r\n	<li>Supermom mild baby wipes offer mildest care for the delicate skins of your baby. It is enriched with baby lotion and pH balanced which ensures required moisture of baby skin. Supermom mild baby wipes is also alcohol, soap and paraben free that prevents baby skin from any sort of side effects.</li>\r\n	<li>Baby lotion, Aqua, Cetylpyridinium chloride, Bronopol, Glycerol, Aloe Barbadensis Leaf Extract, Citric Acid, Propylene Glycol, Fragrance.</li>\r\n</ul>', 210.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599509679spm wipes.jpg', NULL, NULL, '2020-09-08 00:14:39', '2020-09-08 00:14:39'),
(1137, 1, 2, 2, NULL, NULL, '1135', 'Cashew Nut Kaju Badam - 500gm', 'eyJpdiI6IlA4dVh3RUpxZ05oV0REK2lhTzdjRVE9PSIsInZhbHVlIjoicmlXQ01SMTl3NUpXSHQ1bWRRc2NZZmMxNHJLdE9Ic0dsU0pSemhZbkdVMlN1YnVKTzdGNWthRW5MOGxcL0tlSnkiLCJtYWMiOiJhZjhhNjdjYTdkZWRiZWJiMTk3YWExYzMxNzlmMzgxODUyODM5MWIzY2I3NDc3MjBlYTc3YjQ4ZWZjYjI1OTBkIn0=', '<ul>\r\n	<li>Raw Cashew Nut</li>\r\n	<li>100% Pure and Fresh</li>\r\n	<li>Weight: 500gm</li>\r\n	<li>Premium Quality</li>\r\n	<li>Best Product</li>\r\n	<li>\r\n	<p>Kaju Nuts is best for Keto Dite.Kaju nuts is a very delicious nut. Kaju nuts increase the taste of any food. This nut contains abundant minerals, vitamins, and antioxidants. Kaju nut is rich in magnesium.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kaju helps to strengthen the muscles and nerve function and bone. Kaju contains non-acids that are very beneficial for the heart. Kaju has high sodium and potassium. As a result, blood pressure is in control.</p>\r\n	</li>\r\n</ul>', 550.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599763693kaju badam.jpg', NULL, NULL, '2020-09-10 22:48:13', '2020-09-10 22:48:14'),
(1138, 1, 2, 2, NULL, NULL, '1136', 'ALMOND KATH BADAM - 500gm', 'eyJpdiI6InpTbDdIa3QxRlBRcDMyT1I4WlRMTEE9PSIsInZhbHVlIjoiazZ0WWFuMEdJVG96MzhzQWdWWFwvR1UrRDFUTGpSa1hvXC9reCt4ODBhTFhlNzMxaFB1RVBKMXdKQ0JFSkNUXC9LOCIsIm1hYyI6IjJmOTQ5ZmQxYTAyM2YzMDZkNWU0ODZlNWJlODU4NDViYzE1ZGIzZDA5MWEwYzNmODA1NTM3MmIxMGI3MDgzZTYifQ==', '<ul>\r\n	<li>Product Type: Almondnut</li>\r\n	<li>Capacity: 1Packet</li>\r\n	<li>Weight: 500Grm</li>\r\n	<li>All thing buy at wholesale price</li>\r\n	<li>100% clients satisfaction</li>\r\n	<li>100% Highest quality guarantee</li>\r\n	<li>Best price from others</li>\r\n</ul>', 860.00, '1', 840.00, '2%', 'In Stock', 100, 0, 0, '1599764142kath badam 2.png', NULL, NULL, '2020-09-10 22:55:42', '2020-09-10 22:55:42'),
(1139, 1, 2, 2, NULL, NULL, '1137', 'Pista Badam -250gm', 'eyJpdiI6IjdWZGg5b1Q0dU1JYkU0ZUlyZjBwQWc9PSIsInZhbHVlIjoiYUppdXNmWkFNMEZOUGxyTGFTSGhSbHVcL0ltNGtORzdTSVRxb2hMcTU5UkU9IiwibWFjIjoiNmI3YTIxMDU4YzNmYTU2YjZlNzgyNjIwMmJkNjY3YWZmODAwZWRlN2Y0MWY0NzE4MTdlOGQ2ZWEwNzI4MDAyMiJ9', '<ul>\r\n	<li>Product Type:Pista Badam</li>\r\n	<li>Capacity: 250g</li>\r\n	<li>100% Halal</li>\r\n	<li>Good Quality Product</li>\r\n</ul>', 650.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599764493pista badam.jpg', NULL, NULL, '2020-09-10 23:01:33', '2020-09-10 23:01:33'),
(1140, 1, 2, 2, NULL, NULL, '1138', 'Natural Raw China Badam - 1kg', 'eyJpdiI6InhlV2prbGRGVGRyQUNSYmtVTXlRR0E9PSIsInZhbHVlIjoieDZWaDlxaEhqRmgzbFlTS09cL3NqclVGRzl3cGtCTkFCZlY1RFlENXlnYjdCdnZQUENnWEoxR2Z1alFlV2dtZkIiLCJtYWMiOiIwM2NlZjI5YTdkYmE0MTUwN2M4ZTMzNzJlY2UwZGY5Zjk4MmEzMmJiYjFiNzkzNzhlMzQ1YjIyZmE0NGYwZTgyIn0=', '<ul>\r\n	<li>Natural Fresh China Badam</li>\r\n	<li>100% Organic</li>\r\n</ul>', 150.00, '1', NULL, NULL, 'In Stock', 100, 0, 0, '1599764978china badam.jpg', NULL, NULL, '2020-09-10 23:09:38', '2020-09-10 23:09:38');
INSERT INTO `products` (`id`, `admin_id`, `company_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_code`, `product_name`, `slug`, `product_details`, `unit_price`, `unit_weight`, `discount_price`, `percentage`, `sku`, `quantity`, `is_favorite`, `user_quantity`, `image`, `video`, `special_note`, `created_at`, `updated_at`) VALUES
(1141, 1, 84, 2, NULL, NULL, '1139', 'Mix Dry Fruits and Roasted Nuts | 500gm', 'eyJpdiI6IlB5bjB5T2hzalpuZTRlRklKZVBiT1E9PSIsInZhbHVlIjoiRWh0c2hSOUpKQk8wUUFZM2ZLTlRrQ0VOcVZBR0ZGck5OMVNjRkhYU2Y2SlBGNkczTDFvVW9uT2tnd1RnUG13ViIsIm1hYyI6ImUyNTVlZDcwMjk1NGY2NmI0MGMyZGQ3NzhlMDdmNTA3Y2QxNTc2YjYxNmVmMzUxZGY2ZGMyODA2YWE3ZGM4OTkifQ==', '<ul>\r\n	<li>Mix Dry Fruits and Roasted Nuts</li>\r\n</ul>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ingredients</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Roasted Cashew nut (কাজু বাদাম)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Roasted Almond (কাঠ বাদাম)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Roasted peanut (চীনা বাদাম)</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Pistachio (পেস্তা বাদাম)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Walnut (আখরোট)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Pumpkin seeds ( মিষ্টি কুমড়ার বিচি)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Watermelon seeds (তরমুজের বিচি)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Black Raisin (কালো কিসমিস)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Brown Raisin (বাদামী কিসমিস)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * White Raisin (সাদা কিসিমিস)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Black Date palm (কালো খেজুর)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * White Date palm (সাদা খেজুর)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Tutifruti (টুটি ফ্রূটি)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Apricot (এপ্রিকট)</p>\r\n\r\n<ul>\r\n	<li>Keep in a dry place.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 650.00, '1', 550.00, '15%', 'In Stock', 100, 0, 0, '1601132971dry fuits nuts final.jpg', NULL, NULL, '2020-09-26 18:55:11', '2020-09-26 19:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(1, 36, 2, '2020-02-19 03:39:07', '2020-02-19 03:39:07'),
(2, 37, 2, '2020-02-19 03:50:53', '2020-02-19 03:50:53'),
(3, 38, 2, '2020-02-19 03:57:12', '2020-02-19 03:57:12'),
(4, 39, 2, '2020-02-19 04:09:55', '2020-02-19 04:09:55'),
(5, 40, 2, '2020-02-19 04:16:15', '2020-02-19 04:16:15'),
(6, 41, 1, '2020-02-19 04:27:22', '2020-02-19 04:27:22'),
(7, 42, 1, '2020-02-19 04:28:05', '2020-02-19 04:28:05'),
(8, 43, 1, '2020-02-19 04:29:05', '2020-02-19 04:29:05'),
(9, 86, 4, '2020-02-24 08:49:41', '2020-02-24 08:49:41'),
(10, 87, 1, '2020-02-24 08:53:45', '2020-02-24 08:53:45'),
(11, 88, 1, '2020-02-24 08:57:26', '2020-02-24 08:57:26'),
(12, 89, 1, '2020-02-24 08:58:37', '2020-02-24 08:58:37'),
(13, 90, 1, '2020-02-24 08:59:54', '2020-02-24 08:59:54'),
(14, 91, 1, '2020-02-24 09:01:36', '2020-02-24 09:01:36'),
(15, 92, 1, '2020-02-24 09:03:18', '2020-02-24 09:03:18'),
(16, 120, 1, '2020-02-25 08:48:52', '2020-02-25 08:48:52'),
(17, 121, 1, '2020-02-25 08:50:11', '2020-02-25 08:50:11'),
(18, 122, 1, '2020-02-25 08:51:30', '2020-02-25 08:51:30'),
(19, 123, 1, '2020-02-25 08:53:28', '2020-02-25 08:53:28'),
(20, 124, 1, '2020-02-25 08:54:50', '2020-02-25 08:54:50'),
(21, 125, 1, '2020-02-25 08:56:56', '2020-02-25 08:56:56'),
(22, 126, 1, '2020-02-25 09:01:13', '2020-02-25 09:01:13'),
(23, 127, 1, '2020-02-25 09:02:59', '2020-02-25 09:02:59'),
(24, 128, 1, '2020-02-25 09:08:36', '2020-02-25 09:08:36'),
(25, 129, 1, '2020-02-25 09:10:05', '2020-02-25 09:10:05'),
(26, 130, 1, '2020-02-25 09:11:10', '2020-02-25 09:11:10'),
(27, 131, 1, '2020-02-25 09:13:52', '2020-02-25 09:13:52'),
(28, 132, 1, '2020-02-25 09:14:50', '2020-02-25 09:14:50'),
(29, 133, 2, '2020-02-25 09:20:10', '2020-02-25 09:20:10'),
(30, 134, 1, '2020-02-25 09:22:02', '2020-02-25 09:22:02'),
(31, 135, 1, '2020-02-25 09:23:13', '2020-02-25 09:23:13'),
(32, 136, 1, '2020-02-25 09:24:09', '2020-02-25 09:24:09'),
(33, 137, 2, '2020-02-25 09:25:06', '2020-02-25 09:25:06'),
(34, 138, 2, '2020-02-25 09:25:52', '2020-02-25 09:25:52'),
(35, 139, 1, '2020-02-25 09:26:47', '2020-02-25 09:26:47'),
(36, 140, 1, '2020-02-25 09:27:29', '2020-02-25 09:27:29'),
(37, 149, 1, '2020-02-26 13:03:06', '2020-02-26 13:03:06'),
(38, 150, 1, '2020-02-26 13:07:22', '2020-02-26 13:07:22'),
(39, 151, 1, '2020-02-26 13:13:17', '2020-02-26 13:13:17'),
(40, 151, 2, '2020-02-26 13:13:17', '2020-02-26 13:13:17'),
(41, 152, 1, '2020-02-26 13:19:11', '2020-02-26 13:19:11'),
(42, 153, 1, '2020-02-26 13:24:00', '2020-02-26 13:24:00'),
(43, 154, 1, '2020-02-26 13:37:07', '2020-02-26 13:37:07'),
(44, 156, 1, '2020-02-27 09:03:53', '2020-02-27 09:03:53'),
(45, 157, 1, '2020-02-27 09:09:57', '2020-02-27 09:09:57'),
(46, 158, 1, '2020-02-27 09:11:04', '2020-02-27 09:11:04'),
(47, 159, 1, '2020-02-27 09:12:11', '2020-02-27 09:12:11'),
(48, 160, 2, '2020-02-27 09:13:52', '2020-02-27 09:13:52'),
(49, 161, 2, '2020-02-27 09:17:52', '2020-02-27 09:17:52'),
(50, 162, 4, '2020-02-27 09:19:10', '2020-02-27 09:19:10'),
(51, 163, 1, '2020-02-27 09:20:32', '2020-02-27 09:20:32'),
(52, 164, 2, '2020-02-27 09:21:38', '2020-02-27 09:21:38'),
(53, 165, 2, '2020-02-27 09:23:54', '2020-02-27 09:23:54'),
(54, 166, 4, '2020-02-27 09:25:02', '2020-02-27 09:25:02'),
(55, 263, 2, '2020-03-06 23:05:10', '2020-03-06 23:05:10'),
(56, 264, 4, '2020-03-06 23:06:49', '2020-03-06 23:06:49'),
(57, 265, 4, '2020-03-06 23:12:16', '2020-03-06 23:12:16'),
(58, 266, 1, '2020-03-06 23:15:14', '2020-03-06 23:15:14'),
(59, 267, 1, '2020-03-06 23:16:09', '2020-03-06 23:16:09'),
(60, 269, 1, '2020-03-06 23:17:04', '2020-03-06 23:17:04'),
(61, 270, 1, '2020-03-06 23:18:13', '2020-03-06 23:18:13'),
(62, 272, 1, '2020-03-06 23:19:27', '2020-03-06 23:19:27'),
(63, 273, 2, '2020-03-06 23:20:16', '2020-03-06 23:20:16'),
(64, 275, 1, '2020-03-06 23:21:01', '2020-03-06 23:21:01'),
(65, 279, 1, '2020-03-06 23:25:46', '2020-03-06 23:25:46'),
(66, 288, 4, '2020-03-06 23:52:40', '2020-03-06 23:52:40'),
(67, 289, 4, '2020-03-07 00:00:36', '2020-03-07 00:00:36'),
(68, 290, 4, '2020-03-07 00:01:31', '2020-03-07 00:01:31'),
(69, 291, 4, '2020-03-07 00:04:31', '2020-03-07 00:04:31'),
(70, 292, 4, '2020-03-07 00:05:24', '2020-03-07 00:05:24'),
(71, 293, 4, '2020-03-07 00:06:03', '2020-03-07 00:06:03'),
(72, 294, 4, '2020-03-07 00:07:18', '2020-03-07 00:07:18'),
(73, 295, 4, '2020-03-07 00:07:56', '2020-03-07 00:07:56'),
(74, 296, 4, '2020-03-07 00:09:09', '2020-03-07 00:09:09'),
(75, 297, 4, '2020-03-07 00:14:15', '2020-03-07 00:14:15'),
(76, 298, 4, '2020-03-07 00:14:54', '2020-03-07 00:14:54'),
(77, 301, 4, '2020-03-07 00:18:43', '2020-03-07 00:18:43'),
(78, 302, 4, '2020-03-07 00:20:04', '2020-03-07 00:20:04'),
(79, 303, 4, '2020-03-07 00:20:56', '2020-03-07 00:20:56'),
(80, 304, 4, '2020-03-07 00:21:34', '2020-03-07 00:21:34'),
(81, 305, 4, '2020-03-07 00:23:11', '2020-03-07 00:23:11'),
(82, 307, 4, '2020-03-07 00:26:07', '2020-03-07 00:26:07'),
(83, 308, 4, '2020-03-07 00:27:32', '2020-03-07 00:27:32'),
(84, 309, 4, '2020-03-07 00:28:21', '2020-03-07 00:28:21'),
(85, 310, 4, '2020-03-07 00:29:19', '2020-03-07 00:29:19'),
(86, 311, 4, '2020-03-07 00:30:04', '2020-03-07 00:30:04'),
(87, 313, 4, '2020-03-07 00:31:06', '2020-03-07 00:31:06'),
(88, 314, 4, '2020-03-07 00:31:45', '2020-03-07 00:31:45'),
(89, 315, 4, '2020-03-07 00:34:06', '2020-03-07 00:34:06'),
(90, 316, 4, '2020-03-07 00:34:44', '2020-03-07 00:34:44'),
(91, 317, 4, '2020-03-07 00:39:36', '2020-03-07 00:39:36'),
(92, 318, 4, '2020-03-07 00:40:11', '2020-03-07 00:40:11'),
(93, 319, 4, '2020-03-07 00:51:55', '2020-03-07 00:51:55'),
(94, 320, 4, '2020-03-07 00:52:36', '2020-03-07 00:52:36'),
(95, 321, 4, '2020-03-07 00:54:00', '2020-03-07 00:54:00'),
(96, 322, 4, '2020-03-07 00:57:58', '2020-03-07 00:57:58'),
(97, 323, 4, '2020-03-07 00:59:53', '2020-03-07 00:59:53'),
(98, 324, 4, '2020-03-07 01:00:34', '2020-03-07 01:00:34'),
(99, 325, 4, '2020-03-07 01:01:28', '2020-03-07 01:01:28'),
(100, 326, 4, '2020-03-07 01:06:03', '2020-03-07 01:06:03'),
(101, 327, 4, '2020-03-07 01:06:50', '2020-03-07 01:06:50'),
(102, 328, 4, '2020-03-07 01:08:58', '2020-03-07 01:08:58'),
(103, 329, 4, '2020-03-07 01:09:54', '2020-03-07 01:09:54'),
(104, 330, 4, '2020-03-07 01:13:28', '2020-03-07 01:13:28'),
(105, 331, 4, '2020-03-07 01:14:04', '2020-03-07 01:14:04'),
(106, 332, 4, '2020-03-07 01:15:16', '2020-03-07 01:15:16'),
(107, 333, 4, '2020-03-07 01:16:03', '2020-03-07 01:16:03'),
(108, 334, 4, '2020-03-07 01:17:02', '2020-03-07 01:17:02'),
(109, 335, 4, '2020-03-07 02:24:05', '2020-03-07 02:24:05'),
(110, 336, 4, '2020-03-07 02:25:22', '2020-03-07 02:25:22'),
(111, 337, 4, '2020-03-07 02:26:19', '2020-03-07 02:26:19'),
(112, 338, 4, '2020-03-07 02:27:16', '2020-03-07 02:27:16'),
(113, 339, 4, '2020-03-07 03:11:30', '2020-03-07 03:11:30'),
(114, 340, 4, '2020-03-07 03:12:16', '2020-03-07 03:12:16'),
(115, 341, 4, '2020-03-07 03:13:05', '2020-03-07 03:13:05'),
(116, 342, 1, '2020-03-07 03:17:26', '2020-03-07 03:17:26'),
(117, 343, 1, '2020-03-07 03:18:06', '2020-03-07 03:18:06'),
(118, 344, 1, '2020-03-07 03:18:49', '2020-03-07 03:18:49'),
(119, 345, 1, '2020-03-07 03:19:26', '2020-03-07 03:19:26'),
(120, 346, 4, '2020-03-07 03:20:37', '2020-03-07 03:20:37'),
(121, 347, 4, '2020-03-07 03:21:17', '2020-03-07 03:21:17'),
(122, 348, 4, '2020-03-07 03:22:05', '2020-03-07 03:22:05'),
(123, 349, 4, '2020-03-08 23:18:21', '2020-03-08 23:18:21'),
(124, 350, 4, '2020-03-08 23:19:13', '2020-03-08 23:19:13'),
(125, 351, 4, '2020-03-08 23:20:03', '2020-03-08 23:20:03'),
(126, 352, 4, '2020-03-08 23:21:06', '2020-03-08 23:21:06'),
(127, 353, 4, '2020-03-08 23:21:50', '2020-03-08 23:21:50'),
(128, 354, 4, '2020-03-08 23:22:48', '2020-03-08 23:22:48'),
(129, 355, 4, '2020-03-08 23:24:43', '2020-03-08 23:24:43'),
(130, 356, 4, '2020-03-08 23:25:31', '2020-03-08 23:25:31'),
(131, 357, 4, '2020-03-08 23:26:12', '2020-03-08 23:26:12'),
(132, 358, 1, '2020-03-08 23:27:00', '2020-03-08 23:27:00'),
(133, 359, 1, '2020-03-08 23:27:45', '2020-03-08 23:27:45'),
(134, 360, 4, '2020-03-08 23:29:00', '2020-03-08 23:29:00'),
(135, 361, 4, '2020-03-08 23:30:01', '2020-03-08 23:30:01'),
(136, 362, 4, '2020-03-08 23:30:48', '2020-03-08 23:30:48'),
(137, 363, 1, '2020-03-08 23:31:55', '2020-03-08 23:31:55'),
(138, 364, 4, '2020-03-08 23:32:41', '2020-03-08 23:32:41'),
(139, 365, 4, '2020-03-08 23:33:40', '2020-03-08 23:33:40'),
(140, 366, 4, '2020-03-08 23:34:43', '2020-03-08 23:34:43'),
(141, 367, 4, '2020-03-08 23:36:01', '2020-03-08 23:36:01'),
(142, 368, 4, '2020-03-08 23:36:49', '2020-03-08 23:36:49'),
(143, 369, 4, '2020-03-08 23:39:01', '2020-03-08 23:39:01'),
(144, 370, 4, '2020-03-08 23:41:51', '2020-03-08 23:41:51'),
(145, 371, 1, '2020-03-08 23:53:34', '2020-03-08 23:53:34'),
(146, 372, 4, '2020-03-08 23:55:46', '2020-03-08 23:55:46'),
(147, 373, 4, '2020-03-08 23:56:34', '2020-03-08 23:56:34'),
(148, 374, 4, '2020-03-08 23:57:14', '2020-03-08 23:57:14'),
(149, 375, 4, '2020-03-08 23:59:28', '2020-03-08 23:59:28'),
(150, 376, 4, '2020-03-09 00:09:50', '2020-03-09 00:09:50'),
(151, 377, 4, '2020-03-09 00:10:48', '2020-03-09 00:10:48'),
(152, 378, 4, '2020-03-09 00:15:03', '2020-03-09 00:15:03'),
(153, 379, 4, '2020-03-09 00:15:44', '2020-03-09 00:15:44'),
(154, 380, 4, '2020-03-09 00:20:24', '2020-03-09 00:20:24'),
(155, 381, 4, '2020-03-09 00:25:00', '2020-03-09 00:25:00'),
(156, 382, 4, '2020-03-09 00:31:29', '2020-03-09 00:31:29'),
(157, 383, 4, '2020-03-09 00:37:20', '2020-03-09 00:37:20'),
(158, 384, 4, '2020-03-09 00:38:06', '2020-03-09 00:38:06'),
(159, 385, 1, '2020-03-09 03:37:47', '2020-03-09 03:37:47'),
(160, 386, 1, '2020-03-09 03:38:28', '2020-03-09 03:38:28'),
(161, 387, 1, '2020-03-09 03:39:13', '2020-03-09 03:39:13'),
(162, 388, 1, '2020-03-09 03:40:04', '2020-03-09 03:40:04'),
(163, 389, 1, '2020-03-09 03:40:41', '2020-03-09 03:40:41'),
(164, 390, 1, '2020-03-09 03:41:26', '2020-03-09 03:41:26'),
(165, 391, 1, '2020-03-09 03:42:10', '2020-03-09 03:42:10'),
(166, 392, 4, '2020-03-09 03:42:54', '2020-03-09 03:42:54'),
(167, 393, 1, '2020-03-09 03:43:37', '2020-03-09 03:43:37'),
(168, 394, 4, '2020-03-09 03:44:33', '2020-03-09 03:44:33'),
(169, 396, 1, '2020-03-09 03:48:43', '2020-03-09 03:48:43'),
(170, 397, 1, '2020-03-09 03:49:24', '2020-03-09 03:49:24'),
(171, 398, 1, '2020-03-09 03:49:57', '2020-03-09 03:49:57'),
(172, 399, 1, '2020-03-09 03:50:54', '2020-03-09 03:50:54'),
(173, 400, 1, '2020-03-09 03:53:11', '2020-03-09 03:53:11'),
(174, 401, 1, '2020-03-09 03:56:05', '2020-03-09 03:56:05'),
(175, 402, 1, '2020-03-09 03:56:42', '2020-03-09 03:56:42'),
(176, 403, 1, '2020-03-09 03:57:45', '2020-03-09 03:57:45'),
(177, 404, 1, '2020-03-09 03:58:28', '2020-03-09 03:58:28'),
(178, 405, 4, '2020-03-09 04:06:13', '2020-03-09 04:06:13'),
(179, 406, 4, '2020-03-09 04:07:04', '2020-03-09 04:07:04'),
(180, 407, 4, '2020-03-09 04:07:52', '2020-03-09 04:07:52'),
(181, 408, 4, '2020-03-09 04:08:33', '2020-03-09 04:08:33'),
(182, 409, 4, '2020-03-09 04:11:29', '2020-03-09 04:11:29'),
(183, 410, 4, '2020-03-09 04:12:08', '2020-03-09 04:12:08'),
(184, 411, 4, '2020-03-09 04:12:38', '2020-03-09 04:12:38'),
(185, 412, 1, '2020-03-09 04:13:29', '2020-03-09 04:13:29'),
(186, 413, 1, '2020-03-09 04:25:21', '2020-03-09 04:25:21'),
(187, 414, 1, '2020-03-09 04:25:54', '2020-03-09 04:25:54'),
(188, 415, 1, '2020-03-09 04:26:46', '2020-03-09 04:26:46'),
(189, 416, 1, '2020-03-09 04:36:13', '2020-03-09 04:36:13'),
(190, 417, 1, '2020-03-09 04:36:50', '2020-03-09 04:36:50'),
(191, 418, 1, '2020-03-09 04:37:22', '2020-03-09 04:37:22'),
(192, 419, 1, '2020-03-09 04:37:52', '2020-03-09 04:37:52'),
(193, 420, 1, '2020-03-09 04:39:43', '2020-03-09 04:39:43'),
(194, 421, 1, '2020-03-09 04:40:17', '2020-03-09 04:40:17'),
(195, 422, 1, '2020-03-09 04:44:33', '2020-03-09 04:44:33'),
(196, 423, 1, '2020-03-09 04:45:10', '2020-03-09 04:45:10'),
(197, 424, 1, '2020-03-09 04:47:01', '2020-03-09 04:47:01'),
(198, 425, 4, '2020-03-09 05:44:53', '2020-03-09 05:44:53'),
(199, 426, 4, '2020-03-09 05:45:36', '2020-03-09 05:45:36'),
(200, 427, 4, '2020-03-09 05:46:19', '2020-03-09 05:46:19'),
(201, 428, 4, '2020-03-09 05:46:57', '2020-03-09 05:46:57'),
(202, 429, 4, '2020-03-09 05:47:37', '2020-03-09 05:47:37'),
(203, 430, 4, '2020-03-09 05:48:11', '2020-03-09 05:48:11'),
(204, 431, 1, '2020-03-09 05:49:00', '2020-03-09 05:49:00'),
(205, 432, 1, '2020-03-09 05:49:42', '2020-03-09 05:49:42'),
(206, 433, 4, '2020-03-09 06:01:21', '2020-03-09 06:01:21'),
(207, 434, 1, '2020-03-09 06:02:04', '2020-03-09 06:02:04'),
(208, 435, 1, '2020-03-09 06:02:41', '2020-03-09 06:02:41'),
(209, 436, 1, '2020-03-09 06:06:26', '2020-03-09 06:06:26'),
(210, 437, 1, '2020-03-09 06:07:41', '2020-03-09 06:07:41'),
(211, 438, 1, '2020-03-09 06:08:27', '2020-03-09 06:08:27'),
(212, 439, 1, '2020-03-09 06:10:14', '2020-03-09 06:10:14'),
(213, 440, 1, '2020-03-09 06:18:18', '2020-03-09 06:18:18'),
(214, 441, 1, '2020-03-09 06:19:23', '2020-03-09 06:19:23'),
(215, 442, 1, '2020-03-09 06:20:04', '2020-03-09 06:20:04'),
(216, 443, 1, '2020-03-09 06:21:22', '2020-03-09 06:21:22'),
(217, 444, 1, '2020-03-09 06:22:03', '2020-03-09 06:22:03'),
(218, 445, 4, '2020-03-09 06:25:35', '2020-03-09 06:25:35'),
(219, 446, 4, '2020-03-09 06:26:10', '2020-03-09 06:26:10'),
(220, 447, 4, '2020-03-09 06:26:46', '2020-03-09 06:26:46'),
(221, 448, 4, '2020-03-09 06:27:29', '2020-03-09 06:27:29'),
(222, 449, 4, '2020-03-09 06:28:10', '2020-03-09 06:28:10'),
(223, 450, 4, '2020-03-09 06:28:45', '2020-03-09 06:28:45'),
(224, 451, 4, '2020-03-09 22:58:29', '2020-03-09 22:58:29'),
(225, 452, 4, '2020-03-09 22:59:03', '2020-03-09 22:59:03'),
(226, 453, 4, '2020-03-09 23:01:10', '2020-03-09 23:01:10'),
(227, 454, 1, '2020-03-09 23:05:18', '2020-03-09 23:05:18'),
(228, 455, 1, '2020-03-09 23:26:06', '2020-03-09 23:26:06'),
(229, 456, 1, '2020-03-09 23:28:59', '2020-03-09 23:28:59'),
(230, 457, 1, '2020-03-09 23:44:30', '2020-03-09 23:44:30'),
(231, 458, 1, '2020-03-09 23:45:11', '2020-03-09 23:45:11'),
(232, 459, 1, '2020-03-09 23:46:43', '2020-03-09 23:46:43'),
(233, 460, 1, '2020-03-09 23:49:39', '2020-03-09 23:49:39'),
(234, 461, 4, '2020-03-09 23:53:21', '2020-03-09 23:53:21'),
(235, 462, 1, '2020-03-09 23:56:00', '2020-03-09 23:56:00'),
(236, 463, 4, '2020-03-09 23:57:23', '2020-03-09 23:57:23'),
(237, 464, 4, '2020-03-09 23:58:00', '2020-03-09 23:58:00'),
(238, 465, 1, '2020-03-09 23:59:31', '2020-03-09 23:59:31'),
(239, 466, 4, '2020-03-10 00:00:09', '2020-03-10 00:00:09'),
(240, 467, 4, '2020-03-10 00:02:10', '2020-03-10 00:02:10'),
(241, 468, 4, '2020-03-10 00:04:17', '2020-03-10 00:04:17'),
(242, 469, 1, '2020-03-10 00:10:33', '2020-03-10 00:10:33'),
(243, 470, 1, '2020-03-10 00:11:15', '2020-03-10 00:11:15'),
(244, 471, 1, '2020-03-10 00:12:00', '2020-03-10 00:12:00'),
(245, 472, 1, '2020-03-10 00:12:33', '2020-03-10 00:12:33'),
(246, 473, 1, '2020-03-10 00:13:07', '2020-03-10 00:13:07'),
(247, 474, 4, '2020-03-10 00:13:43', '2020-03-10 00:13:43'),
(248, 475, 1, '2020-03-10 01:07:59', '2020-03-10 01:07:59'),
(249, 476, 1, '2020-03-10 01:21:00', '2020-03-10 01:21:00'),
(250, 477, 1, '2020-03-10 01:21:48', '2020-03-10 01:21:48'),
(251, 478, 1, '2020-03-10 01:22:27', '2020-03-10 01:22:27'),
(252, 479, 1, '2020-03-10 01:47:46', '2020-03-10 01:47:46'),
(253, 480, 1, '2020-03-10 03:05:06', '2020-03-10 03:05:06'),
(254, 481, 1, '2020-03-10 03:05:53', '2020-03-10 03:05:53'),
(255, 482, 1, '2020-03-10 03:06:28', '2020-03-10 03:06:28'),
(256, 483, 1, '2020-03-10 03:07:00', '2020-03-10 03:07:00'),
(257, 484, 1, '2020-03-10 03:07:26', '2020-03-10 03:07:26'),
(258, 485, 1, '2020-03-10 03:08:17', '2020-03-10 03:08:17'),
(259, 486, 1, '2020-03-10 03:08:50', '2020-03-10 03:08:50'),
(260, 487, 1, '2020-03-10 03:09:29', '2020-03-10 03:09:29'),
(261, 488, 1, '2020-03-10 03:10:05', '2020-03-10 03:10:05'),
(262, 489, 1, '2020-03-10 03:16:55', '2020-03-10 03:16:55'),
(263, 490, 4, '2020-03-10 03:18:43', '2020-03-10 03:18:43'),
(264, 491, 4, '2020-03-10 03:19:21', '2020-03-10 03:19:21'),
(265, 492, 4, '2020-03-10 03:20:08', '2020-03-10 03:20:08'),
(266, 493, 4, '2020-03-10 03:20:57', '2020-03-10 03:20:57'),
(267, 494, 4, '2020-03-10 03:21:53', '2020-03-10 03:21:53'),
(268, 495, 4, '2020-03-10 03:28:21', '2020-03-10 03:28:21'),
(269, 496, 4, '2020-03-10 03:29:01', '2020-03-10 03:29:01'),
(270, 497, 4, '2020-03-10 03:29:56', '2020-03-10 03:29:56'),
(271, 498, 4, '2020-03-10 03:30:31', '2020-03-10 03:30:31'),
(272, 499, 4, '2020-03-10 03:31:06', '2020-03-10 03:31:06'),
(273, 500, 4, '2020-03-10 03:31:38', '2020-03-10 03:31:38'),
(274, 501, 1, '2020-03-10 03:33:01', '2020-03-10 03:33:01'),
(275, 502, 1, '2020-03-10 03:33:30', '2020-03-10 03:33:30'),
(276, 503, 1, '2020-03-10 03:38:22', '2020-03-10 03:38:22'),
(277, 504, 1, '2020-03-10 03:38:55', '2020-03-10 03:38:55'),
(278, 505, 1, '2020-03-10 03:39:43', '2020-03-10 03:39:43'),
(279, 506, 1, '2020-03-10 03:40:14', '2020-03-10 03:40:14'),
(280, 507, 1, '2020-03-10 03:40:50', '2020-03-10 03:40:50'),
(281, 508, 1, '2020-03-10 03:41:51', '2020-03-10 03:41:51'),
(282, 509, 4, '2020-03-10 03:42:43', '2020-03-10 03:42:43'),
(283, 510, 1, '2020-03-10 03:44:05', '2020-03-10 03:44:05'),
(284, 511, 4, '2020-03-10 04:25:56', '2020-03-10 04:25:56'),
(285, 512, 4, '2020-03-10 04:26:40', '2020-03-10 04:26:40'),
(286, 513, 4, '2020-03-10 04:27:32', '2020-03-10 04:27:32'),
(287, 514, 4, '2020-03-10 04:28:11', '2020-03-10 04:28:11'),
(288, 515, 4, '2020-03-10 04:29:43', '2020-03-10 04:29:43'),
(289, 516, 4, '2020-03-10 04:30:18', '2020-03-10 04:30:18'),
(290, 517, 4, '2020-03-10 04:31:43', '2020-03-10 04:31:43'),
(291, 518, 4, '2020-03-10 04:32:35', '2020-03-10 04:32:35'),
(292, 519, 4, '2020-03-10 04:33:26', '2020-03-10 04:33:26'),
(293, 520, 4, '2020-03-10 04:39:59', '2020-03-10 04:39:59'),
(294, 521, 4, '2020-03-10 04:40:49', '2020-03-10 04:40:49'),
(295, 522, 4, '2020-03-10 04:48:57', '2020-03-10 04:48:57'),
(296, 523, 4, '2020-03-10 04:49:41', '2020-03-10 04:49:41'),
(297, 524, 4, '2020-03-10 04:50:22', '2020-03-10 04:50:22'),
(298, 525, 4, '2020-03-10 04:56:56', '2020-03-10 04:56:56'),
(299, 526, 4, '2020-03-10 05:02:50', '2020-03-10 05:02:50'),
(300, 527, 4, '2020-03-10 05:03:21', '2020-03-10 05:03:21'),
(301, 528, 4, '2020-03-10 05:03:59', '2020-03-10 05:03:59'),
(302, 529, 4, '2020-03-10 05:04:40', '2020-03-10 05:04:40'),
(303, 530, 4, '2020-03-10 05:05:20', '2020-03-10 05:05:20'),
(304, 531, 4, '2020-03-10 05:05:52', '2020-03-10 05:05:52'),
(305, 532, 4, '2020-03-10 05:06:33', '2020-03-10 05:06:33'),
(306, 533, 4, '2020-03-10 05:10:56', '2020-03-10 05:10:56'),
(307, 534, 4, '2020-03-10 05:11:30', '2020-03-10 05:11:30'),
(308, 535, 4, '2020-03-10 05:12:31', '2020-03-10 05:12:31'),
(309, 536, 4, '2020-03-10 05:14:36', '2020-03-10 05:14:36'),
(310, 537, 4, '2020-03-10 05:15:19', '2020-03-10 05:15:19'),
(311, 538, 4, '2020-03-10 05:16:44', '2020-03-10 05:16:44'),
(312, 539, 4, '2020-03-10 05:17:18', '2020-03-10 05:17:18'),
(313, 540, 4, '2020-03-10 05:18:07', '2020-03-10 05:18:07'),
(314, 541, 4, '2020-03-10 05:29:48', '2020-03-10 05:29:48'),
(315, 542, 4, '2020-03-10 05:30:42', '2020-03-10 05:30:42'),
(316, 543, 4, '2020-03-10 05:31:33', '2020-03-10 05:31:33'),
(317, 544, 4, '2020-03-10 05:33:43', '2020-03-10 05:33:43'),
(318, 545, 4, '2020-03-10 05:38:27', '2020-03-10 05:38:27'),
(319, 546, 4, '2020-03-10 05:39:10', '2020-03-10 05:39:10'),
(320, 547, 4, '2020-03-10 05:39:43', '2020-03-10 05:39:43'),
(321, 548, 4, '2020-03-10 05:40:21', '2020-03-10 05:40:21'),
(322, 549, 4, '2020-03-10 05:41:49', '2020-03-10 05:41:49'),
(323, 550, 4, '2020-03-10 05:44:52', '2020-03-10 05:44:52'),
(324, 551, 4, '2020-03-10 05:45:31', '2020-03-10 05:45:31'),
(325, 552, 4, '2020-03-10 05:46:09', '2020-03-10 05:46:09'),
(326, 553, 4, '2020-03-10 05:47:40', '2020-03-10 05:47:40'),
(327, 554, 4, '2020-03-10 05:48:36', '2020-03-10 05:48:36'),
(328, 555, 4, '2020-03-10 05:50:29', '2020-03-10 05:50:29'),
(329, 556, 4, '2020-03-10 05:51:11', '2020-03-10 05:51:11'),
(330, 557, 4, '2020-03-10 05:51:42', '2020-03-10 05:51:42'),
(331, 558, 4, '2020-03-10 05:52:24', '2020-03-10 05:52:24'),
(332, 586, 1, '2020-03-12 23:20:50', '2020-03-12 23:20:50'),
(333, 587, 1, '2020-03-12 23:22:04', '2020-03-12 23:22:04'),
(334, 588, 1, '2020-03-12 23:25:39', '2020-03-12 23:25:39'),
(335, 589, 1, '2020-03-12 23:26:12', '2020-03-12 23:26:12'),
(336, 590, 1, '2020-03-12 23:27:00', '2020-03-12 23:27:00'),
(337, 591, 1, '2020-03-12 23:27:52', '2020-03-12 23:27:52'),
(338, 592, 1, '2020-03-12 23:29:12', '2020-03-12 23:29:12'),
(339, 593, 1, '2020-03-12 23:29:49', '2020-03-12 23:29:49'),
(340, 594, 1, '2020-03-12 23:30:39', '2020-03-12 23:30:39'),
(341, 595, 1, '2020-03-12 23:31:21', '2020-03-12 23:31:21'),
(342, 596, 1, '2020-03-12 23:32:19', '2020-03-12 23:32:19'),
(343, 597, 1, '2020-03-12 23:33:35', '2020-03-12 23:33:35'),
(344, 598, 1, '2020-03-12 23:34:31', '2020-03-12 23:34:31'),
(345, 599, 1, '2020-03-12 23:36:21', '2020-03-12 23:36:21'),
(346, 600, 1, '2020-03-12 23:37:36', '2020-03-12 23:37:36'),
(347, 604, 1, '2020-03-12 23:45:05', '2020-03-12 23:45:05'),
(348, 605, 1, '2020-03-12 23:45:56', '2020-03-12 23:45:56'),
(349, 606, 1, '2020-03-12 23:46:43', '2020-03-12 23:46:43'),
(350, 607, 1, '2020-03-12 23:48:30', '2020-03-12 23:48:30'),
(351, 608, 1, '2020-03-12 23:49:05', '2020-03-12 23:49:05'),
(352, 609, 1, '2020-03-12 23:49:43', '2020-03-12 23:49:43'),
(353, 610, 2, '2020-03-12 23:50:15', '2020-03-12 23:50:15'),
(354, 611, 1, '2020-03-12 23:51:53', '2020-03-12 23:51:53'),
(355, 612, 2, '2020-03-12 23:52:26', '2020-03-12 23:52:26'),
(356, 613, 1, '2020-03-12 23:53:10', '2020-03-12 23:53:10'),
(357, 614, 1, '2020-03-12 23:53:46', '2020-03-12 23:53:46'),
(358, 615, 1, '2020-03-12 23:54:32', '2020-03-12 23:54:32'),
(359, 616, 1, '2020-03-13 00:00:53', '2020-03-13 00:00:53'),
(360, 617, 1, '2020-03-13 00:02:06', '2020-03-13 00:02:06'),
(361, 618, 1, '2020-03-13 00:03:11', '2020-03-13 00:03:11'),
(362, 619, 1, '2020-03-13 00:04:02', '2020-03-13 00:04:02'),
(363, 620, 1, '2020-03-13 00:04:35', '2020-03-13 00:04:35'),
(364, 621, 1, '2020-03-13 00:11:21', '2020-03-13 00:11:21'),
(365, 622, 1, '2020-03-13 00:12:37', '2020-03-13 00:12:37'),
(366, 623, 1, '2020-03-13 00:14:01', '2020-03-13 00:14:01'),
(367, 624, 1, '2020-03-13 00:14:37', '2020-03-13 00:14:37'),
(368, 625, 1, '2020-03-13 03:21:31', '2020-03-13 03:21:31'),
(369, 626, 1, '2020-03-13 03:22:13', '2020-03-13 03:22:13'),
(370, 627, 1, '2020-03-13 03:22:53', '2020-03-13 03:22:53'),
(371, 628, 1, '2020-03-13 03:23:24', '2020-03-13 03:23:24'),
(372, 629, 1, '2020-03-13 03:25:38', '2020-03-13 03:25:38'),
(373, 630, 4, '2020-03-13 03:29:54', '2020-03-13 03:29:54'),
(374, 631, 4, '2020-03-13 03:36:53', '2020-03-13 03:36:53'),
(375, 632, 4, '2020-03-13 03:37:31', '2020-03-13 03:37:31'),
(376, 633, 1, '2020-03-13 03:40:49', '2020-03-13 03:40:49'),
(377, 634, 4, '2020-03-13 03:41:31', '2020-03-13 03:41:31'),
(378, 635, 4, '2020-03-13 03:42:09', '2020-03-13 03:42:09'),
(379, 636, 1, '2020-03-13 03:42:45', '2020-03-13 03:42:45'),
(380, 637, 1, '2020-03-13 03:43:21', '2020-03-13 03:43:21'),
(381, 638, 1, '2020-03-13 03:44:04', '2020-03-13 03:44:04'),
(382, 639, 1, '2020-03-13 03:44:39', '2020-03-13 03:44:39'),
(383, 640, 1, '2020-03-13 03:45:24', '2020-03-13 03:45:24'),
(384, 641, 1, '2020-03-13 05:12:34', '2020-03-13 05:12:34'),
(385, 642, 1, '2020-03-13 05:13:19', '2020-03-13 05:13:19'),
(386, 643, 1, '2020-03-13 05:14:47', '2020-03-13 05:14:47'),
(387, 644, 1, '2020-03-13 05:17:04', '2020-03-13 05:17:04'),
(388, 645, 1, '2020-03-13 05:17:56', '2020-03-13 05:17:56'),
(389, 646, 1, '2020-03-13 05:18:58', '2020-03-13 05:18:58'),
(390, 647, 1, '2020-03-13 05:21:40', '2020-03-13 05:21:40'),
(391, 648, 1, '2020-03-13 05:22:34', '2020-03-13 05:22:34'),
(392, 649, 1, '2020-03-13 05:24:14', '2020-03-13 05:24:14'),
(393, 650, 1, '2020-03-13 05:25:12', '2020-03-13 05:25:12'),
(394, 651, 1, '2020-03-13 05:25:52', '2020-03-13 05:25:52'),
(395, 652, 1, '2020-03-13 05:26:29', '2020-03-13 05:26:29'),
(396, 653, 1, '2020-03-13 05:27:35', '2020-03-13 05:27:35'),
(397, 654, 1, '2020-03-13 05:28:10', '2020-03-13 05:28:10'),
(398, 655, 1, '2020-03-13 05:28:56', '2020-03-13 05:28:56'),
(399, 656, 1, '2020-03-13 05:29:38', '2020-03-13 05:29:38'),
(400, 657, 1, '2020-03-13 05:30:11', '2020-03-13 05:30:11'),
(401, 658, 1, '2020-03-13 05:30:55', '2020-03-13 05:30:55'),
(402, 659, 1, '2020-03-13 05:31:59', '2020-03-13 05:31:59'),
(403, 660, 1, '2020-03-13 05:32:47', '2020-03-13 05:32:47'),
(404, 661, 1, '2020-03-13 05:33:57', '2020-03-13 05:33:57'),
(405, 662, 1, '2020-03-13 05:34:38', '2020-03-13 05:34:38'),
(406, 663, 1, '2020-03-13 05:35:27', '2020-03-13 05:35:27'),
(407, 664, 1, '2020-03-13 05:39:30', '2020-03-13 05:39:30'),
(408, 665, 1, '2020-03-13 05:40:44', '2020-03-13 05:40:44'),
(409, 666, 1, '2020-03-13 05:42:05', '2020-03-13 05:42:05'),
(410, 668, 1, '2020-03-13 05:44:19', '2020-03-13 05:44:19'),
(411, 670, 1, '2020-03-15 02:37:52', '2020-03-15 02:37:52'),
(412, 672, 1, '2020-03-15 03:02:31', '2020-03-15 03:02:31'),
(413, 673, 1, '2020-03-15 03:07:24', '2020-03-15 03:07:24'),
(414, 674, 1, '2020-03-15 03:08:13', '2020-03-15 03:08:13'),
(415, 675, 1, '2020-03-15 03:09:24', '2020-03-15 03:09:24'),
(416, 676, 1, '2020-03-15 03:18:35', '2020-03-15 03:18:35'),
(417, 677, 1, '2020-03-15 03:19:35', '2020-03-15 03:19:35'),
(418, 678, 1, '2020-03-15 03:20:15', '2020-03-15 03:20:15'),
(419, 679, 1, '2020-03-15 03:20:53', '2020-03-15 03:20:53'),
(420, 680, 1, '2020-03-15 03:22:31', '2020-03-15 03:22:31'),
(421, 681, 1, '2020-03-15 03:29:03', '2020-03-15 03:29:03'),
(422, 682, 1, '2020-03-15 03:30:28', '2020-03-15 03:30:28'),
(423, 683, 1, '2020-03-15 04:18:06', '2020-03-15 04:18:06'),
(424, 684, 1, '2020-03-15 04:18:52', '2020-03-15 04:18:52'),
(425, 685, 1, '2020-03-15 04:19:53', '2020-03-15 04:19:53'),
(426, 686, 1, '2020-03-15 04:20:34', '2020-03-15 04:20:34'),
(427, 687, 1, '2020-03-15 04:23:18', '2020-03-15 04:23:18'),
(428, 688, 1, '2020-03-15 04:24:53', '2020-03-15 04:24:53'),
(429, 689, 1, '2020-03-15 04:25:44', '2020-03-15 04:25:44'),
(430, 690, 1, '2020-03-15 04:26:27', '2020-03-15 04:26:27'),
(431, 691, 1, '2020-03-15 04:27:10', '2020-03-15 04:27:10'),
(432, 692, 1, '2020-03-15 04:32:29', '2020-03-15 04:32:29'),
(433, 693, 1, '2020-03-15 04:33:07', '2020-03-15 04:33:07'),
(434, 694, 1, '2020-03-15 04:34:09', '2020-03-15 04:34:09'),
(435, 695, 1, '2020-03-15 04:34:46', '2020-03-15 04:34:46'),
(436, 696, 1, '2020-03-15 04:35:30', '2020-03-15 04:35:30'),
(437, 697, 1, '2020-03-15 04:37:14', '2020-03-15 04:37:14'),
(438, 698, 1, '2020-03-15 04:37:51', '2020-03-15 04:37:51'),
(439, 699, 1, '2020-03-15 04:40:55', '2020-03-15 04:40:55'),
(440, 700, 1, '2020-03-15 04:41:31', '2020-03-15 04:41:31'),
(441, 701, 1, '2020-03-15 04:42:15', '2020-03-15 04:42:15'),
(442, 702, 1, '2020-03-15 04:48:20', '2020-03-15 04:48:20'),
(443, 703, 1, '2020-03-15 04:48:57', '2020-03-15 04:48:57'),
(444, 706, 1, '2020-03-15 04:50:58', '2020-03-15 04:50:58'),
(445, 707, 1, '2020-03-15 04:58:03', '2020-03-15 04:58:03'),
(446, 708, 1, '2020-03-15 04:58:49', '2020-03-15 04:58:49'),
(447, 709, 1, '2020-03-15 05:05:18', '2020-03-15 05:05:18'),
(448, 710, 1, '2020-03-15 05:06:08', '2020-03-15 05:06:08'),
(449, 711, 1, '2020-03-15 05:08:26', '2020-03-15 05:08:26'),
(450, 712, 1, '2020-03-15 05:09:07', '2020-03-15 05:09:07'),
(451, 713, 1, '2020-03-15 05:35:39', '2020-03-15 05:35:39'),
(452, 714, 1, '2020-03-15 05:37:57', '2020-03-15 05:37:57'),
(453, 715, 1, '2020-03-15 05:38:45', '2020-03-15 05:38:45'),
(454, 716, 1, '2020-03-15 05:43:04', '2020-03-15 05:43:04'),
(455, 717, 1, '2020-03-15 05:44:33', '2020-03-15 05:44:33'),
(456, 718, 1, '2020-03-15 05:46:53', '2020-03-15 05:46:53'),
(457, 719, 1, '2020-03-15 05:57:24', '2020-03-15 05:57:24'),
(458, 720, 1, '2020-03-15 05:58:39', '2020-03-15 05:58:39'),
(459, 721, 1, '2020-03-15 05:59:11', '2020-03-15 05:59:11'),
(460, 722, 1, '2020-03-15 06:02:17', '2020-03-15 06:02:17'),
(461, 723, 1, '2020-03-15 06:03:04', '2020-03-15 06:03:04'),
(462, 724, 1, '2020-03-15 06:04:46', '2020-03-15 06:04:46'),
(463, 725, 1, '2020-03-15 06:05:30', '2020-03-15 06:05:30'),
(464, 726, 1, '2020-03-15 06:07:32', '2020-03-15 06:07:32'),
(465, 727, 1, '2020-03-15 06:10:03', '2020-03-15 06:10:03'),
(466, 728, 1, '2020-03-15 06:11:11', '2020-03-15 06:11:11'),
(467, 729, 1, '2020-03-15 06:14:22', '2020-03-15 06:14:22'),
(468, 733, 1, '2020-03-16 00:12:26', '2020-03-16 00:12:26'),
(469, 734, 1, '2020-03-16 00:13:04', '2020-03-16 00:13:04'),
(470, 735, 1, '2020-03-16 00:13:47', '2020-03-16 00:13:47'),
(471, 739, 1, '2020-03-16 00:15:59', '2020-03-16 00:15:59'),
(472, 740, 1, '2020-03-16 00:16:27', '2020-03-16 00:16:27'),
(473, 741, 1, '2020-03-16 00:21:39', '2020-03-16 00:21:39'),
(474, 742, 1, '2020-03-16 00:22:28', '2020-03-16 00:22:28'),
(475, 743, 1, '2020-03-16 00:23:43', '2020-03-16 00:23:43'),
(476, 744, 1, '2020-03-16 00:24:17', '2020-03-16 00:24:17'),
(477, 745, 1, '2020-03-16 00:25:06', '2020-03-16 00:25:06'),
(478, 746, 1, '2020-03-16 00:29:36', '2020-03-16 00:29:36'),
(479, 747, 1, '2020-03-16 00:30:13', '2020-03-16 00:30:13'),
(480, 748, 1, '2020-03-16 00:32:12', '2020-03-16 00:32:12'),
(481, 749, 1, '2020-03-16 00:32:47', '2020-03-16 00:32:47'),
(482, 750, 1, '2020-03-16 00:33:18', '2020-03-16 00:33:18'),
(483, 751, 1, '2020-03-16 00:36:48', '2020-03-16 00:36:48'),
(484, 752, 1, '2020-03-16 00:47:12', '2020-03-16 00:47:12'),
(485, 753, 1, '2020-03-16 00:54:47', '2020-03-16 00:54:47'),
(486, 754, 1, '2020-03-16 00:55:37', '2020-03-16 00:55:37'),
(487, 755, 1, '2020-03-16 00:57:39', '2020-03-16 00:57:39'),
(488, 756, 1, '2020-03-16 00:58:16', '2020-03-16 00:58:16'),
(489, 757, 1, '2020-03-16 00:59:22', '2020-03-16 00:59:22'),
(490, 758, 1, '2020-03-16 01:00:05', '2020-03-16 01:00:05'),
(491, 759, 1, '2020-03-16 01:01:12', '2020-03-16 01:01:12'),
(492, 760, 1, '2020-03-16 01:02:09', '2020-03-16 01:02:09'),
(493, 761, 1, '2020-03-16 01:02:39', '2020-03-16 01:02:39'),
(494, 762, 1, '2020-03-16 01:03:09', '2020-03-16 01:03:09'),
(495, 763, 1, '2020-03-16 01:09:01', '2020-03-16 01:09:01'),
(496, 765, 1, '2020-03-16 02:16:35', '2020-03-16 02:16:35'),
(497, 766, 1, '2020-03-16 02:17:23', '2020-03-16 02:17:23'),
(498, 767, 1, '2020-03-16 02:17:57', '2020-03-16 02:17:57'),
(499, 768, 1, '2020-03-16 02:18:33', '2020-03-16 02:18:33'),
(500, 769, 1, '2020-03-16 02:20:46', '2020-03-16 02:20:46'),
(501, 770, 2, '2020-03-16 02:21:22', '2020-03-16 02:21:22'),
(502, 771, 1, '2020-03-16 02:22:10', '2020-03-16 02:22:10'),
(503, 772, 1, '2020-03-16 02:23:14', '2020-03-16 02:23:14'),
(504, 773, 1, '2020-03-16 02:23:56', '2020-03-16 02:23:56'),
(505, 774, 1, '2020-03-16 02:25:18', '2020-03-16 02:25:18'),
(506, 775, 1, '2020-03-16 02:25:57', '2020-03-16 02:25:57'),
(507, 776, 1, '2020-03-16 02:27:09', '2020-03-16 02:27:09'),
(508, 777, 1, '2020-03-16 02:28:49', '2020-03-16 02:28:49'),
(509, 778, 1, '2020-03-16 02:29:28', '2020-03-16 02:29:28'),
(510, 779, 1, '2020-03-16 02:30:01', '2020-03-16 02:30:01'),
(511, 780, 1, '2020-03-16 02:31:27', '2020-03-16 02:31:27'),
(512, 781, 1, '2020-03-16 02:32:16', '2020-03-16 02:32:16'),
(513, 782, 1, '2020-03-16 02:32:49', '2020-03-16 02:32:49'),
(514, 784, 1, '2020-03-16 02:35:29', '2020-03-16 02:35:29'),
(515, 785, 1, '2020-03-16 02:37:19', '2020-03-16 02:37:19'),
(516, 786, 1, '2020-03-16 02:37:57', '2020-03-16 02:37:57'),
(517, 787, 1, '2020-03-16 02:38:28', '2020-03-16 02:38:28'),
(518, 788, 3, '2020-03-16 02:39:49', '2020-03-16 02:39:49'),
(519, 789, 3, '2020-03-16 02:41:20', '2020-03-16 02:41:20'),
(520, 790, 4, '2020-03-16 02:42:37', '2020-03-16 02:42:37'),
(521, 791, 4, '2020-03-16 02:43:39', '2020-03-16 02:43:39'),
(522, 792, 4, '2020-03-16 02:44:22', '2020-03-16 02:44:22'),
(523, 793, 4, '2020-03-16 02:44:51', '2020-03-16 02:44:51'),
(524, 794, 3, '2020-03-16 02:45:23', '2020-03-16 02:45:23'),
(525, 795, 3, '2020-03-16 02:46:56', '2020-03-16 02:46:56'),
(526, 796, 4, '2020-03-16 02:47:28', '2020-03-16 02:47:28'),
(527, 797, 4, '2020-03-16 02:48:07', '2020-03-16 02:48:07'),
(528, 798, 4, '2020-03-16 02:48:57', '2020-03-16 02:48:57'),
(529, 799, 3, '2020-03-16 02:49:47', '2020-03-16 02:49:47'),
(530, 800, 3, '2020-03-16 02:50:24', '2020-03-16 02:50:24'),
(531, 801, 3, '2020-03-16 02:51:08', '2020-03-16 02:51:08'),
(532, 802, 4, '2020-03-16 02:51:53', '2020-03-16 02:51:53'),
(533, 803, 4, '2020-03-16 02:52:28', '2020-03-16 02:52:28'),
(534, 804, 3, '2020-03-16 02:53:08', '2020-03-16 02:53:08'),
(535, 805, 4, '2020-03-16 03:06:03', '2020-03-16 03:06:03'),
(536, 806, 4, '2020-03-16 03:06:38', '2020-03-16 03:06:38'),
(537, 807, 4, '2020-03-16 03:07:10', '2020-03-16 03:07:10'),
(538, 808, 4, '2020-03-16 03:07:46', '2020-03-16 03:07:46'),
(539, 809, 4, '2020-03-16 03:08:26', '2020-03-16 03:08:26'),
(540, 810, 4, '2020-03-16 03:12:59', '2020-03-16 03:12:59'),
(541, 811, 3, '2020-03-16 03:13:52', '2020-03-16 03:13:52'),
(542, 812, 4, '2020-03-16 03:14:27', '2020-03-16 03:14:27'),
(543, 813, 4, '2020-03-16 03:15:02', '2020-03-16 03:15:02'),
(544, 814, 3, '2020-03-16 03:15:35', '2020-03-16 03:15:35'),
(545, 815, 3, '2020-03-16 03:16:05', '2020-03-16 03:16:05'),
(546, 816, 4, '2020-03-16 03:16:43', '2020-03-16 03:16:43'),
(547, 817, 4, '2020-03-16 03:17:28', '2020-03-16 03:17:28'),
(548, 818, 4, '2020-03-16 03:18:27', '2020-03-16 03:18:27'),
(549, 819, 3, '2020-03-16 03:20:32', '2020-03-16 03:20:32'),
(550, 820, 4, '2020-03-16 03:21:10', '2020-03-16 03:21:10'),
(551, 821, 3, '2020-03-16 03:21:47', '2020-03-16 03:21:47'),
(552, 822, 3, '2020-03-16 03:22:21', '2020-03-16 03:22:21'),
(553, 823, 4, '2020-03-16 03:22:58', '2020-03-16 03:22:58'),
(554, 824, 4, '2020-03-16 03:23:32', '2020-03-16 03:23:32'),
(555, 825, 1, '2020-03-16 03:34:14', '2020-03-16 03:34:14'),
(556, 826, 1, '2020-03-16 03:35:06', '2020-03-16 03:35:06'),
(557, 827, 1, '2020-03-16 03:36:05', '2020-03-16 03:36:05'),
(558, 828, 1, '2020-03-16 03:39:30', '2020-03-16 03:39:30'),
(559, 829, 1, '2020-03-16 03:40:05', '2020-03-16 03:40:05'),
(560, 830, 1, '2020-03-16 03:42:55', '2020-03-16 03:42:55'),
(561, 831, 1, '2020-03-16 03:44:17', '2020-03-16 03:44:17'),
(562, 832, 1, '2020-03-16 03:45:58', '2020-03-16 03:45:58'),
(563, 833, 1, '2020-03-16 03:47:40', '2020-03-16 03:47:40'),
(564, 834, 1, '2020-03-16 03:48:21', '2020-03-16 03:48:21'),
(565, 835, 1, '2020-03-16 03:51:22', '2020-03-16 03:51:22'),
(566, 836, 1, '2020-03-16 03:52:08', '2020-03-16 03:52:08'),
(567, 837, 1, '2020-03-16 04:01:07', '2020-03-16 04:01:07'),
(568, 838, 1, '2020-03-16 04:01:46', '2020-03-16 04:01:46'),
(569, 839, 1, '2020-03-16 04:02:20', '2020-03-16 04:02:20'),
(570, 840, 1, '2020-03-16 04:02:57', '2020-03-16 04:02:57'),
(571, 857, 1, '2020-03-19 03:05:10', '2020-03-19 03:05:10'),
(572, 858, 1, '2020-03-19 03:05:47', '2020-03-19 03:05:47'),
(573, 859, 1, '2020-03-19 03:06:19', '2020-03-19 03:06:19'),
(574, 860, 1, '2020-03-19 03:06:51', '2020-03-19 03:06:51'),
(575, 861, 2, '2020-03-19 03:08:08', '2020-03-19 03:08:08'),
(576, 862, 1, '2020-03-19 03:08:43', '2020-03-19 03:08:43'),
(577, 863, 2, '2020-03-19 03:09:33', '2020-03-19 03:09:33'),
(578, 864, 4, '2020-03-19 04:50:06', '2020-03-19 04:50:06'),
(579, 865, 4, '2020-03-19 04:50:39', '2020-03-19 04:50:39'),
(580, 866, 4, '2020-03-19 04:51:22', '2020-03-19 04:51:22'),
(581, 867, 1, '2020-03-19 04:52:13', '2020-03-19 04:52:13'),
(582, 868, 4, '2020-03-19 04:54:27', '2020-03-19 04:54:27'),
(583, 869, 4, '2020-03-19 04:54:57', '2020-03-19 04:54:57'),
(584, 870, 1, '2020-03-19 04:55:27', '2020-03-19 04:55:27'),
(585, 871, 4, '2020-03-19 04:55:56', '2020-03-19 04:55:56'),
(586, 872, 1, '2020-03-19 05:03:06', '2020-03-19 05:03:06'),
(587, 873, 4, '2020-03-19 05:03:37', '2020-03-19 05:03:37'),
(588, 874, 1, '2020-03-19 05:04:05', '2020-03-19 05:04:05'),
(589, 875, 4, '2020-03-19 05:04:38', '2020-03-19 05:04:38'),
(590, 876, 1, '2020-03-19 05:05:10', '2020-03-19 05:05:10'),
(591, 877, 4, '2020-03-19 05:05:40', '2020-03-19 05:05:40'),
(592, 878, 4, '2020-03-19 05:06:14', '2020-03-19 05:06:14'),
(593, 879, 1, '2020-03-19 05:06:43', '2020-03-19 05:06:43'),
(594, 880, 4, '2020-03-19 05:07:18', '2020-03-19 05:07:18'),
(595, 881, 4, '2020-03-19 05:07:59', '2020-03-19 05:07:59'),
(596, 882, 4, '2020-03-19 05:17:50', '2020-03-19 05:17:50'),
(597, 883, 4, '2020-03-19 05:18:29', '2020-03-19 05:18:29'),
(598, 884, 4, '2020-03-19 05:21:53', '2020-03-19 05:21:53'),
(599, 885, 4, '2020-03-19 05:23:46', '2020-03-19 05:23:46'),
(600, 886, 1, '2020-03-19 05:25:15', '2020-03-19 05:25:15'),
(601, 887, 1, '2020-03-19 05:27:33', '2020-03-19 05:27:33'),
(602, 888, 1, '2020-03-19 05:28:08', '2020-03-19 05:28:08'),
(605, 962, 2, '2020-07-09 12:58:18', '2020-07-09 12:58:18'),
(606, 963, 2, '2020-07-09 13:01:34', '2020-07-09 13:01:34'),
(607, 964, 2, '2020-07-09 13:06:30', '2020-07-09 13:06:30'),
(608, 965, 2, '2020-07-09 13:09:51', '2020-07-09 13:09:51'),
(609, 966, 2, '2020-07-09 13:12:43', '2020-07-09 13:12:43'),
(610, 968, 2, '2020-07-17 02:20:09', '2020-07-17 02:20:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `product_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(4, 4, 2, '2020-02-17 22:39:09', '2020-02-17 22:39:09'),
(7, 6, 3, '2020-02-17 23:16:03', '2020-02-17 23:16:03'),
(8, 7, 3, '2020-02-17 23:28:28', '2020-02-17 23:28:28'),
(9, 8, 3, '2020-02-17 23:33:37', '2020-02-17 23:33:37'),
(10, 9, 3, '2020-02-17 23:44:00', '2020-02-17 23:44:00'),
(11, 10, 3, '2020-02-17 23:45:33', '2020-02-17 23:45:33'),
(13, 12, 3, '2020-02-17 23:54:03', '2020-02-17 23:54:03'),
(14, 13, 3, '2020-02-18 00:16:51', '2020-02-18 00:16:51'),
(15, 14, 3, '2020-02-18 00:20:14', '2020-02-18 00:20:14'),
(16, 15, 3, '2020-02-18 00:22:22', '2020-02-18 00:22:22'),
(19, 18, 7, '2020-02-18 22:37:00', '2020-02-18 22:37:00'),
(20, 19, 7, '2020-02-18 22:43:07', '2020-02-18 22:43:07'),
(21, 20, 7, '2020-02-18 22:59:37', '2020-02-18 22:59:37'),
(22, 21, 7, '2020-02-18 23:02:49', '2020-02-18 23:02:49'),
(24, 23, 7, '2020-02-18 23:07:55', '2020-02-18 23:07:55'),
(25, 24, 7, '2020-02-18 23:10:03', '2020-02-18 23:10:03'),
(26, 25, 7, '2020-02-18 23:29:39', '2020-02-18 23:29:39'),
(27, 26, 5, '2020-02-18 23:32:56', '2020-02-18 23:32:56'),
(28, 27, 5, '2020-02-18 23:47:57', '2020-02-18 23:47:57'),
(29, 28, 1, '2020-02-18 23:55:52', '2020-02-18 23:55:52'),
(30, 29, 1, '2020-02-19 00:18:50', '2020-02-19 00:18:50'),
(31, 30, 1, '2020-02-19 00:27:49', '2020-02-19 00:27:49'),
(32, 31, 1, '2020-02-19 00:38:23', '2020-02-19 00:38:23'),
(33, 32, 1, '2020-02-19 00:41:04', '2020-02-19 00:41:04'),
(34, 33, 1, '2020-02-19 00:50:51', '2020-02-19 00:50:51'),
(35, 34, 1, '2020-02-19 00:55:11', '2020-02-19 00:55:11'),
(36, 35, 1, '2020-02-19 00:59:44', '2020-02-19 00:59:44'),
(37, 36, 1, '2020-02-19 03:39:07', '2020-02-19 03:39:07'),
(38, 37, 1, '2020-02-19 03:50:53', '2020-02-19 03:50:53'),
(39, 38, 1, '2020-02-19 03:57:12', '2020-02-19 03:57:12'),
(40, 39, 1, '2020-02-19 04:09:55', '2020-02-19 04:09:55'),
(41, 40, 1, '2020-02-19 04:16:15', '2020-02-19 04:16:15'),
(42, 41, 6, '2020-02-19 04:27:22', '2020-02-19 04:27:22'),
(43, 42, 6, '2020-02-19 04:28:05', '2020-02-19 04:28:05'),
(44, 43, 6, '2020-02-19 04:29:05', '2020-02-19 04:29:05'),
(45, 44, 6, '2020-02-19 04:30:36', '2020-02-19 04:30:36'),
(46, 45, 6, '2020-02-19 04:35:34', '2020-02-19 04:35:34'),
(47, 46, 6, '2020-02-19 04:36:47', '2020-02-19 04:36:47'),
(48, 47, 6, '2020-02-19 04:42:35', '2020-02-19 04:42:35'),
(49, 48, 6, '2020-02-19 04:43:46', '2020-02-19 04:43:46'),
(50, 49, 6, '2020-02-19 05:59:55', '2020-02-19 05:59:55'),
(51, 50, 6, '2020-02-19 06:03:42', '2020-02-19 06:03:42'),
(52, 51, 6, '2020-02-19 06:38:10', '2020-02-19 06:38:10'),
(53, 52, 6, '2020-02-19 06:39:04', '2020-02-19 06:39:04'),
(54, 53, 1, '2020-02-19 07:28:30', '2020-02-19 07:28:30'),
(55, 54, 1, '2020-02-19 07:31:23', '2020-02-19 07:31:23'),
(56, 55, 1, '2020-02-19 07:46:57', '2020-02-19 07:46:57'),
(57, 56, 1, '2020-02-19 07:50:38', '2020-02-19 07:50:38'),
(58, 57, 1, '2020-02-19 07:56:16', '2020-02-19 07:56:16'),
(59, 58, 2, '2020-02-19 11:52:16', '2020-02-19 11:52:16'),
(60, 59, 2, '2020-02-19 11:56:37', '2020-02-19 11:56:37'),
(61, 60, 2, '2020-02-19 12:03:46', '2020-02-19 12:03:46'),
(62, 61, 7, '2020-02-24 04:22:31', '2020-02-24 04:22:31'),
(63, 62, 7, '2020-02-24 04:26:10', '2020-02-24 04:26:10'),
(64, 63, 5, '2020-02-24 04:27:17', '2020-02-24 04:27:17'),
(65, 64, 1, '2020-02-24 04:30:35', '2020-02-24 04:30:35'),
(66, 65, 1, '2020-02-24 04:33:11', '2020-02-24 04:33:11'),
(67, 66, 1, '2020-02-24 04:35:14', '2020-02-24 04:35:14'),
(68, 67, 1, '2020-02-24 04:36:12', '2020-02-24 04:36:12'),
(69, 68, 1, '2020-02-24 04:37:25', '2020-02-24 04:37:25'),
(70, 69, 1, '2020-02-24 05:33:17', '2020-02-24 05:33:17'),
(71, 70, 1, '2020-02-24 05:34:35', '2020-02-24 05:34:35'),
(72, 71, 1, '2020-02-24 05:36:43', '2020-02-24 05:36:43'),
(73, 72, 5, '2020-02-24 06:51:36', '2020-02-24 06:51:36'),
(74, 73, 5, '2020-02-24 06:53:39', '2020-02-24 06:53:39'),
(75, 74, 5, '2020-02-24 06:57:14', '2020-02-24 06:57:14'),
(76, 75, 5, '2020-02-24 06:58:32', '2020-02-24 06:58:32'),
(77, 76, 5, '2020-02-24 06:59:38', '2020-02-24 06:59:38'),
(78, 77, 6, '2020-02-24 07:01:22', '2020-02-24 07:01:22'),
(79, 78, 6, '2020-02-24 07:02:15', '2020-02-24 07:02:15'),
(80, 79, 6, '2020-02-24 07:04:34', '2020-02-24 07:04:34'),
(81, 80, 1, '2020-02-24 07:06:20', '2020-02-24 07:06:20'),
(82, 81, 1, '2020-02-24 07:07:36', '2020-02-24 07:07:36'),
(83, 82, 1, '2020-02-24 07:08:43', '2020-02-24 07:08:43'),
(84, 83, 6, '2020-02-24 07:14:14', '2020-02-24 07:14:14'),
(85, 84, 6, '2020-02-24 07:16:07', '2020-02-24 07:16:07'),
(86, 85, 1, '2020-02-24 08:18:57', '2020-02-24 08:18:57'),
(87, 86, 5, '2020-02-24 08:49:41', '2020-02-24 08:49:41'),
(88, 87, 6, '2020-02-24 08:53:45', '2020-02-24 08:53:45'),
(89, 88, 6, '2020-02-24 08:57:26', '2020-02-24 08:57:26'),
(90, 89, 6, '2020-02-24 08:58:37', '2020-02-24 08:58:37'),
(91, 90, 6, '2020-02-24 08:59:54', '2020-02-24 08:59:54'),
(92, 91, 6, '2020-02-24 09:01:36', '2020-02-24 09:01:36'),
(93, 92, 6, '2020-02-24 09:03:18', '2020-02-24 09:03:18'),
(94, 93, 6, '2020-02-24 09:09:29', '2020-02-24 09:09:29'),
(95, 94, 6, '2020-02-24 09:10:20', '2020-02-24 09:10:20'),
(96, 95, 6, '2020-02-24 09:13:28', '2020-02-24 09:13:28'),
(97, 96, 6, '2020-02-24 09:15:23', '2020-02-24 09:15:23'),
(98, 97, 6, '2020-02-24 09:20:54', '2020-02-24 09:20:54'),
(99, 98, 6, '2020-02-24 09:23:01', '2020-02-24 09:23:01'),
(100, 99, 6, '2020-02-24 09:24:14', '2020-02-24 09:24:14'),
(101, 100, 6, '2020-02-24 09:26:07', '2020-02-24 09:26:07'),
(102, 101, 6, '2020-02-24 09:27:55', '2020-02-24 09:27:55'),
(103, 102, 6, '2020-02-24 09:30:27', '2020-02-24 09:30:27'),
(104, 103, 6, '2020-02-24 09:31:29', '2020-02-24 09:31:29'),
(105, 104, 6, '2020-02-24 09:32:37', '2020-02-24 09:32:37'),
(106, 105, 6, '2020-02-24 09:37:10', '2020-02-24 09:37:10'),
(107, 106, 6, '2020-02-24 09:39:20', '2020-02-24 09:39:20'),
(108, 107, 6, '2020-02-24 09:41:04', '2020-02-24 09:41:04'),
(109, 108, 6, '2020-02-24 09:42:00', '2020-02-24 09:42:00'),
(110, 109, 6, '2020-02-24 09:43:38', '2020-02-24 09:43:38'),
(111, 110, 6, '2020-02-24 09:45:47', '2020-02-24 09:45:47'),
(112, 111, 6, '2020-02-24 09:47:20', '2020-02-24 09:47:20'),
(113, 112, 6, '2020-02-25 00:57:30', '2020-02-25 00:57:30'),
(114, 113, 6, '2020-02-25 00:59:05', '2020-02-25 00:59:05'),
(115, 114, 6, '2020-02-25 01:00:06', '2020-02-25 01:00:06'),
(116, 115, 6, '2020-02-25 01:01:04', '2020-02-25 01:01:04'),
(117, 116, 6, '2020-02-25 01:02:45', '2020-02-25 01:02:45'),
(118, 117, 6, '2020-02-25 01:04:58', '2020-02-25 01:04:58'),
(119, 118, 6, '2020-02-25 01:05:53', '2020-02-25 01:05:53'),
(120, 119, 6, '2020-02-25 01:06:55', '2020-02-25 01:06:55'),
(121, 120, 6, '2020-02-25 08:48:52', '2020-02-25 08:48:52'),
(122, 121, 6, '2020-02-25 08:50:11', '2020-02-25 08:50:11'),
(123, 122, 6, '2020-02-25 08:51:30', '2020-02-25 08:51:30'),
(124, 123, 6, '2020-02-25 08:53:28', '2020-02-25 08:53:28'),
(125, 124, 6, '2020-02-25 08:54:50', '2020-02-25 08:54:50'),
(126, 125, 6, '2020-02-25 08:56:56', '2020-02-25 08:56:56'),
(127, 126, 6, '2020-02-25 09:01:13', '2020-02-25 09:01:13'),
(128, 127, 6, '2020-02-25 09:02:59', '2020-02-25 09:02:59'),
(129, 128, 6, '2020-02-25 09:08:36', '2020-02-25 09:08:36'),
(130, 129, 6, '2020-02-25 09:10:05', '2020-02-25 09:10:05'),
(131, 130, 6, '2020-02-25 09:11:10', '2020-02-25 09:11:10'),
(132, 131, 6, '2020-02-25 09:13:52', '2020-02-25 09:13:52'),
(133, 132, 6, '2020-02-25 09:14:50', '2020-02-25 09:14:50'),
(134, 133, 1, '2020-02-25 09:20:10', '2020-02-25 09:20:10'),
(135, 134, 6, '2020-02-25 09:22:02', '2020-02-25 09:22:02'),
(136, 135, 6, '2020-02-25 09:23:13', '2020-02-25 09:23:13'),
(137, 136, 6, '2020-02-25 09:24:09', '2020-02-25 09:24:09'),
(138, 137, 1, '2020-02-25 09:25:06', '2020-02-25 09:25:06'),
(139, 138, 1, '2020-02-25 09:25:52', '2020-02-25 09:25:52'),
(140, 139, 6, '2020-02-25 09:26:47', '2020-02-25 09:26:47'),
(141, 140, 6, '2020-02-25 09:27:29', '2020-02-25 09:27:29'),
(142, 141, 7, '2020-02-25 10:34:25', '2020-02-25 10:34:25'),
(143, 142, 1, '2020-02-25 10:52:28', '2020-02-25 10:52:28'),
(144, 143, 1, '2020-02-25 10:57:12', '2020-02-25 10:57:12'),
(145, 144, 1, '2020-02-25 11:07:09', '2020-02-25 11:07:09'),
(146, 145, 5, '2020-02-26 00:18:47', '2020-02-26 00:18:47'),
(147, 146, 5, '2020-02-26 00:20:22', '2020-02-26 00:20:22'),
(148, 147, 5, '2020-02-26 00:21:07', '2020-02-26 00:21:07'),
(149, 148, 2, '2020-02-26 10:13:17', '2020-02-26 10:13:17'),
(150, 149, 3, '2020-02-26 13:03:06', '2020-02-26 13:03:06'),
(151, 150, 3, '2020-02-26 13:07:22', '2020-02-26 13:07:22'),
(152, 151, 3, '2020-02-26 13:13:17', '2020-02-26 13:13:17'),
(153, 152, 3, '2020-02-26 13:19:11', '2020-02-26 13:19:11'),
(154, 153, 3, '2020-02-26 13:24:00', '2020-02-26 13:24:00'),
(155, 154, 2, '2020-02-26 13:37:07', '2020-02-26 13:37:07'),
(156, 155, 2, '2020-02-27 04:38:19', '2020-02-27 04:38:19'),
(157, 156, 6, '2020-02-27 09:03:53', '2020-02-27 09:03:53'),
(158, 157, 6, '2020-02-27 09:09:57', '2020-02-27 09:09:57'),
(159, 158, 6, '2020-02-27 09:11:04', '2020-02-27 09:11:04'),
(160, 159, 6, '2020-02-27 09:12:11', '2020-02-27 09:12:11'),
(161, 160, 1, '2020-02-27 09:13:52', '2020-02-27 09:13:52'),
(162, 161, 1, '2020-02-27 09:17:52', '2020-02-27 09:17:52'),
(163, 162, 5, '2020-02-27 09:19:10', '2020-02-27 09:19:10'),
(164, 163, 6, '2020-02-27 09:20:32', '2020-02-27 09:20:32'),
(165, 164, 1, '2020-02-27 09:21:38', '2020-02-27 09:21:38'),
(166, 165, 1, '2020-02-27 09:23:54', '2020-02-27 09:23:54'),
(167, 166, 5, '2020-02-27 09:25:02', '2020-02-27 09:25:02'),
(168, 167, 3, '2020-02-29 04:10:19', '2020-02-29 04:10:19'),
(169, 168, 3, '2020-02-29 04:11:18', '2020-02-29 04:11:18'),
(170, 169, 3, '2020-02-29 04:12:00', '2020-02-29 04:12:00'),
(171, 170, 3, '2020-02-29 04:12:53', '2020-02-29 04:12:53'),
(172, 171, 3, '2020-02-29 04:13:39', '2020-02-29 04:13:39'),
(173, 172, 2, '2020-02-29 04:14:54', '2020-02-29 04:14:54'),
(174, 173, 2, '2020-02-29 04:16:30', '2020-02-29 04:16:30'),
(175, 174, 3, '2020-02-29 04:17:29', '2020-02-29 04:17:29'),
(176, 175, 3, '2020-02-29 04:18:31', '2020-02-29 04:18:31'),
(177, 176, 3, '2020-02-29 04:20:34', '2020-02-29 04:20:34'),
(178, 177, 3, '2020-02-29 04:21:39', '2020-02-29 04:21:39'),
(179, 178, 3, '2020-02-29 04:23:02', '2020-02-29 04:23:02'),
(180, 179, 3, '2020-02-29 04:23:49', '2020-02-29 04:23:49'),
(181, 180, 3, '2020-02-29 04:24:52', '2020-02-29 04:24:52'),
(183, 182, 3, '2020-02-29 04:38:37', '2020-02-29 04:38:37'),
(184, 183, 3, '2020-02-29 04:39:41', '2020-02-29 04:39:41'),
(185, 184, 3, '2020-02-29 04:40:35', '2020-02-29 04:40:35'),
(186, 185, 3, '2020-02-29 04:41:15', '2020-02-29 04:41:15'),
(187, 186, 3, '2020-02-29 07:41:13', '2020-02-29 07:41:13'),
(188, 187, 3, '2020-02-29 07:42:10', '2020-02-29 07:42:10'),
(189, 188, 3, '2020-02-29 07:44:57', '2020-02-29 07:44:57'),
(190, 189, 3, '2020-02-29 07:45:38', '2020-02-29 07:45:38'),
(191, 190, 3, '2020-02-29 07:46:36', '2020-02-29 07:46:36'),
(192, 191, 3, '2020-02-29 07:50:12', '2020-02-29 07:50:12'),
(193, 192, 3, '2020-02-29 07:51:13', '2020-02-29 07:51:13'),
(194, 193, 3, '2020-02-29 07:52:13', '2020-02-29 07:52:13'),
(195, 194, 3, '2020-03-02 02:40:43', '2020-03-02 02:40:43'),
(196, 195, 3, '2020-03-02 04:08:56', '2020-03-02 04:08:56'),
(197, 196, 3, '2020-03-02 04:09:50', '2020-03-02 04:09:50'),
(198, 197, 3, '2020-03-02 04:10:49', '2020-03-02 04:10:49'),
(199, 198, 3, '2020-03-02 04:11:35', '2020-03-02 04:11:35'),
(200, 199, 3, '2020-03-02 04:12:16', '2020-03-02 04:12:16'),
(201, 200, 3, '2020-03-02 04:14:51', '2020-03-02 04:14:51'),
(202, 201, 3, '2020-03-02 04:16:33', '2020-03-02 04:16:33'),
(203, 202, 3, '2020-03-02 04:17:52', '2020-03-02 04:17:52'),
(204, 203, 3, '2020-03-02 04:19:30', '2020-03-02 04:19:30'),
(205, 204, 3, '2020-03-02 04:20:23', '2020-03-02 04:20:23'),
(206, 205, 3, '2020-03-02 04:21:33', '2020-03-02 04:21:33'),
(207, 206, 3, '2020-03-02 04:22:48', '2020-03-02 04:22:48'),
(208, 207, 3, '2020-03-02 04:23:43', '2020-03-02 04:23:43'),
(209, 208, 3, '2020-03-02 04:25:19', '2020-03-02 04:25:19'),
(210, 209, 3, '2020-03-02 04:30:31', '2020-03-02 04:30:31'),
(211, 210, 3, '2020-03-02 04:31:30', '2020-03-02 04:31:30'),
(212, 211, 3, '2020-03-02 04:49:55', '2020-03-02 04:49:55'),
(213, 212, 3, '2020-03-02 04:50:38', '2020-03-02 04:50:38'),
(214, 213, 3, '2020-03-02 04:51:36', '2020-03-02 04:51:36'),
(215, 214, 3, '2020-03-02 04:57:08', '2020-03-02 04:57:08'),
(216, 215, 3, '2020-03-02 04:58:00', '2020-03-02 04:58:00'),
(217, 216, 3, '2020-03-02 04:58:59', '2020-03-02 04:58:59'),
(218, 217, 3, '2020-03-02 05:00:00', '2020-03-02 05:00:00'),
(219, 218, 3, '2020-03-02 05:01:02', '2020-03-02 05:01:02'),
(220, 219, 3, '2020-03-02 05:02:04', '2020-03-02 05:02:04'),
(221, 220, 3, '2020-03-02 05:02:53', '2020-03-02 05:02:53'),
(222, 221, 3, '2020-03-02 05:03:54', '2020-03-02 05:03:54'),
(223, 222, 3, '2020-03-02 05:04:51', '2020-03-02 05:04:51'),
(224, 223, 3, '2020-03-02 05:07:41', '2020-03-02 05:07:41'),
(225, 224, 3, '2020-03-02 05:12:04', '2020-03-02 05:12:04'),
(226, 225, 3, '2020-03-02 05:12:59', '2020-03-02 05:12:59'),
(227, 226, 3, '2020-03-02 05:14:13', '2020-03-02 05:14:13'),
(228, 227, 3, '2020-03-02 05:15:09', '2020-03-02 05:15:09'),
(229, 228, 3, '2020-03-02 05:15:59', '2020-03-02 05:15:59'),
(230, 229, 3, '2020-03-02 05:17:51', '2020-03-02 05:17:51'),
(231, 230, 3, '2020-03-02 05:18:54', '2020-03-02 05:18:54'),
(232, 231, 3, '2020-03-02 07:00:47', '2020-03-02 07:00:47'),
(233, 232, 3, '2020-03-02 07:01:57', '2020-03-02 07:01:57'),
(234, 233, 3, '2020-03-02 07:03:02', '2020-03-02 07:03:02'),
(235, 234, 3, '2020-03-02 07:12:50', '2020-03-02 07:12:50'),
(236, 235, 3, '2020-03-02 07:15:11', '2020-03-02 07:15:11'),
(237, 236, 3, '2020-03-02 07:18:18', '2020-03-02 07:18:18'),
(238, 237, 3, '2020-03-02 07:26:29', '2020-03-02 07:26:29'),
(239, 238, 3, '2020-03-02 07:29:35', '2020-03-02 07:29:35'),
(240, 239, 3, '2020-03-02 07:31:52', '2020-03-02 07:31:52'),
(241, 240, 3, '2020-03-02 07:32:53', '2020-03-02 07:32:53'),
(242, 241, 3, '2020-03-02 07:34:02', '2020-03-02 07:34:02'),
(243, 242, 3, '2020-03-02 07:38:44', '2020-03-02 07:38:44'),
(244, 243, 3, '2020-03-02 07:39:31', '2020-03-02 07:39:31'),
(245, 244, 3, '2020-03-02 07:40:56', '2020-03-02 07:40:56'),
(246, 245, 3, '2020-03-02 07:41:59', '2020-03-02 07:41:59'),
(247, 246, 3, '2020-03-02 07:46:46', '2020-03-02 07:46:46'),
(248, 247, 3, '2020-03-02 07:47:47', '2020-03-02 07:47:47'),
(249, 248, 3, '2020-03-02 08:49:23', '2020-03-02 08:49:23'),
(250, 249, 3, '2020-03-02 08:51:12', '2020-03-02 08:51:12'),
(251, 250, 3, '2020-03-02 08:52:24', '2020-03-02 08:52:24'),
(252, 251, 3, '2020-03-02 08:54:43', '2020-03-02 08:54:43'),
(253, 252, 3, '2020-03-02 08:57:46', '2020-03-02 08:57:46'),
(254, 253, 3, '2020-03-02 08:58:45', '2020-03-02 08:58:45'),
(255, 254, 3, '2020-03-02 08:59:42', '2020-03-02 08:59:42'),
(256, 255, 3, '2020-03-02 23:50:57', '2020-03-02 23:50:57'),
(257, 256, 3, '2020-03-02 23:52:01', '2020-03-02 23:52:01'),
(258, 257, 3, '2020-03-02 23:53:21', '2020-03-02 23:53:21'),
(259, 258, 3, '2020-03-02 23:55:53', '2020-03-02 23:55:53'),
(260, 259, 3, '2020-03-02 23:57:20', '2020-03-02 23:57:20'),
(261, 260, 3, '2020-03-02 23:58:53', '2020-03-02 23:58:53'),
(262, 261, 3, '2020-03-03 00:00:26', '2020-03-03 00:00:26'),
(263, 262, 3, '2020-03-05 00:22:55', '2020-03-05 00:22:55'),
(264, 263, 1, '2020-03-06 23:05:10', '2020-03-06 23:05:10'),
(265, 264, 5, '2020-03-06 23:06:49', '2020-03-06 23:06:49'),
(266, 265, 5, '2020-03-06 23:12:16', '2020-03-06 23:12:16'),
(267, 266, 6, '2020-03-06 23:15:14', '2020-03-06 23:15:14'),
(268, 267, 6, '2020-03-06 23:16:09', '2020-03-06 23:16:09'),
(269, 268, 3, '2020-03-06 23:16:59', '2020-03-06 23:16:59'),
(270, 269, 6, '2020-03-06 23:17:04', '2020-03-06 23:17:04'),
(271, 270, 6, '2020-03-06 23:18:13', '2020-03-06 23:18:13'),
(272, 271, 3, '2020-03-06 23:18:16', '2020-03-06 23:18:16'),
(273, 272, 6, '2020-03-06 23:19:27', '2020-03-06 23:19:27'),
(274, 273, 1, '2020-03-06 23:20:16', '2020-03-06 23:20:16'),
(275, 274, 3, '2020-03-06 23:20:41', '2020-03-06 23:20:41'),
(276, 275, 6, '2020-03-06 23:21:01', '2020-03-06 23:21:01'),
(277, 276, 3, '2020-03-06 23:22:26', '2020-03-06 23:22:26'),
(278, 277, 3, '2020-03-06 23:24:14', '2020-03-06 23:24:14'),
(279, 278, 3, '2020-03-06 23:25:17', '2020-03-06 23:25:17'),
(280, 279, 6, '2020-03-06 23:25:46', '2020-03-06 23:25:46'),
(281, 280, 3, '2020-03-06 23:26:15', '2020-03-06 23:26:15'),
(282, 281, 3, '2020-03-06 23:28:27', '2020-03-06 23:28:27'),
(283, 282, 3, '2020-03-06 23:30:01', '2020-03-06 23:30:01'),
(284, 283, 3, '2020-03-06 23:33:07', '2020-03-06 23:33:07'),
(285, 284, 3, '2020-03-06 23:46:20', '2020-03-06 23:46:20'),
(286, 285, 3, '2020-03-06 23:47:52', '2020-03-06 23:47:52'),
(287, 286, 3, '2020-03-06 23:49:42', '2020-03-06 23:49:42'),
(288, 287, 3, '2020-03-06 23:51:48', '2020-03-06 23:51:48'),
(289, 288, 5, '2020-03-06 23:52:40', '2020-03-06 23:52:40'),
(290, 289, 5, '2020-03-07 00:00:36', '2020-03-07 00:00:36'),
(291, 290, 5, '2020-03-07 00:01:31', '2020-03-07 00:01:31'),
(292, 291, 5, '2020-03-07 00:04:31', '2020-03-07 00:04:31'),
(293, 292, 5, '2020-03-07 00:05:24', '2020-03-07 00:05:24'),
(294, 293, 5, '2020-03-07 00:06:03', '2020-03-07 00:06:03'),
(295, 294, 5, '2020-03-07 00:07:18', '2020-03-07 00:07:18'),
(296, 295, 5, '2020-03-07 00:07:56', '2020-03-07 00:07:56'),
(297, 296, 5, '2020-03-07 00:09:09', '2020-03-07 00:09:09'),
(298, 297, 5, '2020-03-07 00:14:15', '2020-03-07 00:14:15'),
(299, 298, 5, '2020-03-07 00:14:54', '2020-03-07 00:14:54'),
(300, 299, 3, '2020-03-07 00:16:33', '2020-03-07 00:16:33'),
(301, 300, 3, '2020-03-07 00:18:28', '2020-03-07 00:18:28'),
(302, 301, 5, '2020-03-07 00:18:43', '2020-03-07 00:18:43'),
(303, 302, 5, '2020-03-07 00:20:04', '2020-03-07 00:20:04'),
(304, 303, 5, '2020-03-07 00:20:56', '2020-03-07 00:20:56'),
(305, 304, 5, '2020-03-07 00:21:34', '2020-03-07 00:21:34'),
(306, 305, 5, '2020-03-07 00:23:11', '2020-03-07 00:23:11'),
(307, 306, 3, '2020-03-07 00:23:19', '2020-03-07 00:23:19'),
(308, 307, 5, '2020-03-07 00:26:07', '2020-03-07 00:26:07'),
(309, 308, 5, '2020-03-07 00:27:32', '2020-03-07 00:27:32'),
(310, 309, 5, '2020-03-07 00:28:21', '2020-03-07 00:28:21'),
(311, 310, 5, '2020-03-07 00:29:19', '2020-03-07 00:29:19'),
(312, 311, 5, '2020-03-07 00:30:04', '2020-03-07 00:30:04'),
(313, 312, 3, '2020-03-07 00:30:22', '2020-03-07 00:30:22'),
(314, 313, 5, '2020-03-07 00:31:06', '2020-03-07 00:31:06'),
(315, 314, 5, '2020-03-07 00:31:45', '2020-03-07 00:31:45'),
(316, 315, 5, '2020-03-07 00:34:06', '2020-03-07 00:34:06'),
(317, 316, 5, '2020-03-07 00:34:44', '2020-03-07 00:34:44'),
(318, 317, 5, '2020-03-07 00:39:36', '2020-03-07 00:39:36'),
(319, 318, 5, '2020-03-07 00:40:11', '2020-03-07 00:40:11'),
(320, 319, 5, '2020-03-07 00:51:55', '2020-03-07 00:51:55'),
(321, 320, 5, '2020-03-07 00:52:36', '2020-03-07 00:52:36'),
(322, 321, 5, '2020-03-07 00:54:00', '2020-03-07 00:54:00'),
(323, 322, 5, '2020-03-07 00:57:58', '2020-03-07 00:57:58'),
(324, 323, 5, '2020-03-07 00:59:53', '2020-03-07 00:59:53'),
(325, 324, 5, '2020-03-07 01:00:34', '2020-03-07 01:00:34'),
(326, 325, 5, '2020-03-07 01:01:28', '2020-03-07 01:01:28'),
(327, 326, 5, '2020-03-07 01:06:03', '2020-03-07 01:06:03'),
(328, 327, 5, '2020-03-07 01:06:50', '2020-03-07 01:06:50'),
(329, 328, 5, '2020-03-07 01:08:58', '2020-03-07 01:08:58'),
(330, 329, 5, '2020-03-07 01:09:54', '2020-03-07 01:09:54'),
(331, 330, 5, '2020-03-07 01:13:28', '2020-03-07 01:13:28'),
(332, 331, 5, '2020-03-07 01:14:04', '2020-03-07 01:14:04'),
(333, 332, 5, '2020-03-07 01:15:16', '2020-03-07 01:15:16'),
(334, 333, 5, '2020-03-07 01:16:03', '2020-03-07 01:16:03'),
(335, 334, 5, '2020-03-07 01:17:02', '2020-03-07 01:17:02'),
(336, 335, 5, '2020-03-07 02:24:05', '2020-03-07 02:24:05'),
(337, 336, 5, '2020-03-07 02:25:22', '2020-03-07 02:25:22'),
(338, 337, 5, '2020-03-07 02:26:19', '2020-03-07 02:26:19'),
(339, 338, 5, '2020-03-07 02:27:16', '2020-03-07 02:27:16'),
(340, 339, 5, '2020-03-07 03:11:30', '2020-03-07 03:11:30'),
(341, 340, 5, '2020-03-07 03:12:16', '2020-03-07 03:12:16'),
(342, 341, 5, '2020-03-07 03:13:05', '2020-03-07 03:13:05'),
(343, 342, 6, '2020-03-07 03:17:26', '2020-03-07 03:17:26'),
(344, 343, 6, '2020-03-07 03:18:06', '2020-03-07 03:18:06'),
(345, 344, 6, '2020-03-07 03:18:49', '2020-03-07 03:18:49'),
(346, 345, 6, '2020-03-07 03:19:26', '2020-03-07 03:19:26'),
(347, 346, 5, '2020-03-07 03:20:37', '2020-03-07 03:20:37'),
(348, 347, 5, '2020-03-07 03:21:17', '2020-03-07 03:21:17'),
(349, 348, 5, '2020-03-07 03:22:05', '2020-03-07 03:22:05'),
(350, 349, 5, '2020-03-08 23:18:21', '2020-03-08 23:18:21'),
(351, 350, 5, '2020-03-08 23:19:13', '2020-03-08 23:19:13'),
(352, 351, 5, '2020-03-08 23:20:03', '2020-03-08 23:20:03'),
(353, 352, 5, '2020-03-08 23:21:06', '2020-03-08 23:21:06'),
(354, 353, 5, '2020-03-08 23:21:50', '2020-03-08 23:21:50'),
(355, 354, 5, '2020-03-08 23:22:48', '2020-03-08 23:22:48'),
(356, 355, 5, '2020-03-08 23:24:43', '2020-03-08 23:24:43'),
(357, 356, 5, '2020-03-08 23:25:31', '2020-03-08 23:25:31'),
(358, 357, 5, '2020-03-08 23:26:12', '2020-03-08 23:26:12'),
(359, 358, 6, '2020-03-08 23:27:00', '2020-03-08 23:27:00'),
(360, 359, 6, '2020-03-08 23:27:45', '2020-03-08 23:27:45'),
(361, 360, 5, '2020-03-08 23:29:00', '2020-03-08 23:29:00'),
(362, 361, 5, '2020-03-08 23:30:01', '2020-03-08 23:30:01'),
(363, 362, 5, '2020-03-08 23:30:48', '2020-03-08 23:30:48'),
(364, 363, 6, '2020-03-08 23:31:55', '2020-03-08 23:31:55'),
(365, 364, 5, '2020-03-08 23:32:41', '2020-03-08 23:32:41'),
(366, 365, 5, '2020-03-08 23:33:40', '2020-03-08 23:33:40'),
(367, 366, 5, '2020-03-08 23:34:43', '2020-03-08 23:34:43'),
(368, 367, 5, '2020-03-08 23:36:01', '2020-03-08 23:36:01'),
(369, 368, 5, '2020-03-08 23:36:49', '2020-03-08 23:36:49'),
(370, 369, 5, '2020-03-08 23:39:01', '2020-03-08 23:39:01'),
(371, 370, 5, '2020-03-08 23:41:51', '2020-03-08 23:41:51'),
(372, 371, 6, '2020-03-08 23:53:34', '2020-03-08 23:53:34'),
(373, 372, 5, '2020-03-08 23:55:46', '2020-03-08 23:55:46'),
(374, 373, 5, '2020-03-08 23:56:34', '2020-03-08 23:56:34'),
(375, 374, 5, '2020-03-08 23:57:14', '2020-03-08 23:57:14'),
(376, 375, 5, '2020-03-08 23:59:28', '2020-03-08 23:59:28'),
(377, 376, 5, '2020-03-09 00:09:50', '2020-03-09 00:09:50'),
(378, 377, 5, '2020-03-09 00:10:48', '2020-03-09 00:10:48'),
(379, 378, 5, '2020-03-09 00:15:03', '2020-03-09 00:15:03'),
(380, 379, 5, '2020-03-09 00:15:44', '2020-03-09 00:15:44'),
(381, 380, 5, '2020-03-09 00:20:24', '2020-03-09 00:20:24'),
(382, 381, 5, '2020-03-09 00:25:00', '2020-03-09 00:25:00'),
(383, 382, 5, '2020-03-09 00:31:29', '2020-03-09 00:31:29'),
(384, 383, 5, '2020-03-09 00:37:20', '2020-03-09 00:37:20'),
(385, 384, 5, '2020-03-09 00:38:06', '2020-03-09 00:38:06'),
(386, 385, 6, '2020-03-09 03:37:47', '2020-03-09 03:37:47'),
(387, 386, 6, '2020-03-09 03:38:28', '2020-03-09 03:38:28'),
(388, 387, 6, '2020-03-09 03:39:13', '2020-03-09 03:39:13'),
(389, 388, 6, '2020-03-09 03:40:04', '2020-03-09 03:40:04'),
(390, 389, 6, '2020-03-09 03:40:41', '2020-03-09 03:40:41'),
(391, 390, 6, '2020-03-09 03:41:26', '2020-03-09 03:41:26'),
(392, 391, 6, '2020-03-09 03:42:10', '2020-03-09 03:42:10'),
(393, 392, 5, '2020-03-09 03:42:54', '2020-03-09 03:42:54'),
(394, 393, 6, '2020-03-09 03:43:37', '2020-03-09 03:43:37'),
(395, 394, 5, '2020-03-09 03:44:33', '2020-03-09 03:44:33'),
(396, 395, 2, '2020-03-09 03:47:55', '2020-03-09 03:47:55'),
(397, 396, 6, '2020-03-09 03:48:43', '2020-03-09 03:48:43'),
(398, 397, 6, '2020-03-09 03:49:24', '2020-03-09 03:49:24'),
(399, 398, 6, '2020-03-09 03:49:57', '2020-03-09 03:49:57'),
(400, 399, 6, '2020-03-09 03:50:54', '2020-03-09 03:50:54'),
(401, 400, 6, '2020-03-09 03:53:11', '2020-03-09 03:53:11'),
(402, 401, 6, '2020-03-09 03:56:05', '2020-03-09 03:56:05'),
(403, 402, 6, '2020-03-09 03:56:42', '2020-03-09 03:56:42'),
(404, 403, 6, '2020-03-09 03:57:45', '2020-03-09 03:57:45'),
(405, 404, 6, '2020-03-09 03:58:28', '2020-03-09 03:58:28'),
(406, 405, 5, '2020-03-09 04:06:13', '2020-03-09 04:06:13'),
(407, 406, 5, '2020-03-09 04:07:04', '2020-03-09 04:07:04'),
(408, 407, 5, '2020-03-09 04:07:52', '2020-03-09 04:07:52'),
(409, 408, 5, '2020-03-09 04:08:33', '2020-03-09 04:08:33'),
(410, 409, 5, '2020-03-09 04:11:29', '2020-03-09 04:11:29'),
(411, 410, 5, '2020-03-09 04:12:08', '2020-03-09 04:12:08'),
(412, 411, 5, '2020-03-09 04:12:38', '2020-03-09 04:12:38'),
(413, 412, 6, '2020-03-09 04:13:29', '2020-03-09 04:13:29'),
(414, 413, 6, '2020-03-09 04:25:21', '2020-03-09 04:25:21'),
(415, 414, 6, '2020-03-09 04:25:54', '2020-03-09 04:25:54'),
(416, 415, 6, '2020-03-09 04:26:46', '2020-03-09 04:26:46'),
(417, 416, 6, '2020-03-09 04:36:13', '2020-03-09 04:36:13'),
(418, 417, 6, '2020-03-09 04:36:50', '2020-03-09 04:36:50'),
(419, 418, 6, '2020-03-09 04:37:22', '2020-03-09 04:37:22'),
(420, 419, 6, '2020-03-09 04:37:52', '2020-03-09 04:37:52'),
(421, 420, 6, '2020-03-09 04:39:43', '2020-03-09 04:39:43'),
(422, 421, 6, '2020-03-09 04:40:17', '2020-03-09 04:40:17'),
(423, 422, 6, '2020-03-09 04:44:33', '2020-03-09 04:44:33'),
(424, 423, 6, '2020-03-09 04:45:10', '2020-03-09 04:45:10'),
(425, 424, 6, '2020-03-09 04:47:01', '2020-03-09 04:47:01'),
(426, 425, 5, '2020-03-09 05:44:53', '2020-03-09 05:44:53'),
(427, 426, 5, '2020-03-09 05:45:36', '2020-03-09 05:45:36'),
(428, 427, 5, '2020-03-09 05:46:19', '2020-03-09 05:46:19'),
(429, 428, 5, '2020-03-09 05:46:57', '2020-03-09 05:46:57'),
(430, 429, 5, '2020-03-09 05:47:37', '2020-03-09 05:47:37'),
(431, 430, 5, '2020-03-09 05:48:11', '2020-03-09 05:48:11'),
(432, 431, 6, '2020-03-09 05:49:00', '2020-03-09 05:49:00'),
(433, 432, 6, '2020-03-09 05:49:42', '2020-03-09 05:49:42'),
(434, 433, 5, '2020-03-09 06:01:21', '2020-03-09 06:01:21'),
(435, 434, 6, '2020-03-09 06:02:04', '2020-03-09 06:02:04'),
(436, 435, 6, '2020-03-09 06:02:41', '2020-03-09 06:02:41'),
(437, 436, 6, '2020-03-09 06:06:26', '2020-03-09 06:06:26'),
(438, 437, 6, '2020-03-09 06:07:41', '2020-03-09 06:07:41'),
(439, 438, 6, '2020-03-09 06:08:27', '2020-03-09 06:08:27'),
(440, 439, 6, '2020-03-09 06:10:14', '2020-03-09 06:10:14'),
(441, 440, 6, '2020-03-09 06:18:18', '2020-03-09 06:18:18'),
(442, 441, 6, '2020-03-09 06:19:23', '2020-03-09 06:19:23'),
(443, 442, 6, '2020-03-09 06:20:04', '2020-03-09 06:20:04'),
(444, 443, 6, '2020-03-09 06:21:22', '2020-03-09 06:21:22'),
(445, 444, 6, '2020-03-09 06:22:03', '2020-03-09 06:22:03'),
(446, 445, 5, '2020-03-09 06:25:35', '2020-03-09 06:25:35'),
(447, 446, 5, '2020-03-09 06:26:10', '2020-03-09 06:26:10'),
(448, 447, 5, '2020-03-09 06:26:46', '2020-03-09 06:26:46'),
(449, 448, 5, '2020-03-09 06:27:29', '2020-03-09 06:27:29'),
(450, 449, 5, '2020-03-09 06:28:10', '2020-03-09 06:28:10'),
(451, 450, 5, '2020-03-09 06:28:45', '2020-03-09 06:28:45'),
(452, 451, 5, '2020-03-09 22:58:29', '2020-03-09 22:58:29'),
(453, 452, 5, '2020-03-09 22:59:03', '2020-03-09 22:59:03'),
(454, 453, 5, '2020-03-09 23:01:10', '2020-03-09 23:01:10'),
(455, 454, 6, '2020-03-09 23:05:18', '2020-03-09 23:05:18'),
(456, 455, 6, '2020-03-09 23:26:06', '2020-03-09 23:26:06'),
(457, 456, 6, '2020-03-09 23:28:59', '2020-03-09 23:28:59'),
(458, 457, 6, '2020-03-09 23:44:30', '2020-03-09 23:44:30'),
(459, 458, 6, '2020-03-09 23:45:11', '2020-03-09 23:45:11'),
(460, 459, 6, '2020-03-09 23:46:43', '2020-03-09 23:46:43'),
(461, 460, 6, '2020-03-09 23:49:39', '2020-03-09 23:49:39'),
(462, 461, 5, '2020-03-09 23:53:21', '2020-03-09 23:53:21'),
(463, 462, 6, '2020-03-09 23:56:00', '2020-03-09 23:56:00'),
(464, 463, 5, '2020-03-09 23:57:23', '2020-03-09 23:57:23'),
(465, 464, 5, '2020-03-09 23:58:00', '2020-03-09 23:58:00'),
(466, 465, 6, '2020-03-09 23:59:31', '2020-03-09 23:59:31'),
(467, 466, 5, '2020-03-10 00:00:09', '2020-03-10 00:00:09'),
(468, 467, 5, '2020-03-10 00:02:10', '2020-03-10 00:02:10'),
(469, 468, 5, '2020-03-10 00:04:17', '2020-03-10 00:04:17'),
(470, 469, 6, '2020-03-10 00:10:33', '2020-03-10 00:10:33'),
(471, 470, 6, '2020-03-10 00:11:15', '2020-03-10 00:11:15'),
(472, 471, 6, '2020-03-10 00:12:00', '2020-03-10 00:12:00'),
(473, 472, 6, '2020-03-10 00:12:33', '2020-03-10 00:12:33'),
(474, 473, 6, '2020-03-10 00:13:07', '2020-03-10 00:13:07'),
(475, 474, 5, '2020-03-10 00:13:43', '2020-03-10 00:13:43'),
(476, 475, 6, '2020-03-10 01:07:59', '2020-03-10 01:07:59'),
(477, 476, 6, '2020-03-10 01:21:00', '2020-03-10 01:21:00'),
(478, 477, 6, '2020-03-10 01:21:48', '2020-03-10 01:21:48'),
(479, 478, 6, '2020-03-10 01:22:27', '2020-03-10 01:22:27'),
(480, 479, 6, '2020-03-10 01:47:46', '2020-03-10 01:47:46'),
(481, 480, 6, '2020-03-10 03:05:06', '2020-03-10 03:05:06'),
(482, 481, 6, '2020-03-10 03:05:53', '2020-03-10 03:05:53'),
(483, 482, 6, '2020-03-10 03:06:28', '2020-03-10 03:06:28'),
(484, 483, 6, '2020-03-10 03:07:00', '2020-03-10 03:07:00'),
(485, 484, 6, '2020-03-10 03:07:26', '2020-03-10 03:07:26'),
(486, 485, 6, '2020-03-10 03:08:17', '2020-03-10 03:08:17'),
(487, 486, 6, '2020-03-10 03:08:50', '2020-03-10 03:08:50'),
(488, 487, 6, '2020-03-10 03:09:29', '2020-03-10 03:09:29'),
(489, 488, 6, '2020-03-10 03:10:05', '2020-03-10 03:10:05'),
(490, 489, 6, '2020-03-10 03:16:55', '2020-03-10 03:16:55'),
(491, 490, 5, '2020-03-10 03:18:43', '2020-03-10 03:18:43'),
(492, 491, 5, '2020-03-10 03:19:21', '2020-03-10 03:19:21'),
(493, 492, 5, '2020-03-10 03:20:08', '2020-03-10 03:20:08'),
(494, 493, 5, '2020-03-10 03:20:57', '2020-03-10 03:20:57'),
(495, 494, 5, '2020-03-10 03:21:53', '2020-03-10 03:21:53'),
(496, 495, 5, '2020-03-10 03:28:21', '2020-03-10 03:28:21'),
(497, 496, 5, '2020-03-10 03:29:01', '2020-03-10 03:29:01'),
(498, 497, 5, '2020-03-10 03:29:56', '2020-03-10 03:29:56'),
(499, 498, 5, '2020-03-10 03:30:31', '2020-03-10 03:30:31'),
(500, 499, 5, '2020-03-10 03:31:06', '2020-03-10 03:31:06'),
(501, 500, 5, '2020-03-10 03:31:38', '2020-03-10 03:31:38'),
(502, 501, 6, '2020-03-10 03:33:01', '2020-03-10 03:33:01'),
(503, 502, 6, '2020-03-10 03:33:30', '2020-03-10 03:33:30'),
(504, 503, 6, '2020-03-10 03:38:22', '2020-03-10 03:38:22'),
(505, 504, 6, '2020-03-10 03:38:55', '2020-03-10 03:38:55'),
(506, 505, 6, '2020-03-10 03:39:43', '2020-03-10 03:39:43'),
(507, 506, 6, '2020-03-10 03:40:14', '2020-03-10 03:40:14'),
(508, 507, 6, '2020-03-10 03:40:50', '2020-03-10 03:40:50'),
(509, 508, 6, '2020-03-10 03:41:51', '2020-03-10 03:41:51'),
(510, 509, 5, '2020-03-10 03:42:43', '2020-03-10 03:42:43'),
(511, 510, 6, '2020-03-10 03:44:05', '2020-03-10 03:44:05'),
(512, 511, 5, '2020-03-10 04:25:56', '2020-03-10 04:25:56'),
(513, 512, 5, '2020-03-10 04:26:40', '2020-03-10 04:26:40'),
(514, 513, 5, '2020-03-10 04:27:32', '2020-03-10 04:27:32'),
(515, 514, 5, '2020-03-10 04:28:11', '2020-03-10 04:28:11'),
(516, 515, 5, '2020-03-10 04:29:43', '2020-03-10 04:29:43'),
(517, 516, 5, '2020-03-10 04:30:18', '2020-03-10 04:30:18'),
(518, 517, 5, '2020-03-10 04:31:43', '2020-03-10 04:31:43'),
(519, 518, 5, '2020-03-10 04:32:35', '2020-03-10 04:32:35'),
(520, 519, 5, '2020-03-10 04:33:26', '2020-03-10 04:33:26'),
(521, 520, 5, '2020-03-10 04:39:59', '2020-03-10 04:39:59'),
(522, 521, 5, '2020-03-10 04:40:49', '2020-03-10 04:40:49'),
(523, 522, 5, '2020-03-10 04:48:57', '2020-03-10 04:48:57'),
(524, 523, 5, '2020-03-10 04:49:41', '2020-03-10 04:49:41'),
(525, 524, 5, '2020-03-10 04:50:22', '2020-03-10 04:50:22'),
(526, 525, 5, '2020-03-10 04:56:56', '2020-03-10 04:56:56'),
(527, 526, 5, '2020-03-10 05:02:50', '2020-03-10 05:02:50'),
(528, 527, 5, '2020-03-10 05:03:21', '2020-03-10 05:03:21'),
(529, 528, 5, '2020-03-10 05:03:59', '2020-03-10 05:03:59'),
(530, 529, 5, '2020-03-10 05:04:40', '2020-03-10 05:04:40'),
(531, 530, 5, '2020-03-10 05:05:20', '2020-03-10 05:05:20'),
(532, 531, 5, '2020-03-10 05:05:52', '2020-03-10 05:05:52'),
(533, 532, 5, '2020-03-10 05:06:33', '2020-03-10 05:06:33'),
(534, 533, 5, '2020-03-10 05:10:56', '2020-03-10 05:10:56'),
(535, 534, 5, '2020-03-10 05:11:30', '2020-03-10 05:11:30'),
(536, 535, 5, '2020-03-10 05:12:31', '2020-03-10 05:12:31'),
(537, 536, 5, '2020-03-10 05:14:36', '2020-03-10 05:14:36'),
(538, 537, 5, '2020-03-10 05:15:19', '2020-03-10 05:15:19'),
(539, 538, 5, '2020-03-10 05:16:44', '2020-03-10 05:16:44'),
(540, 539, 5, '2020-03-10 05:17:18', '2020-03-10 05:17:18'),
(541, 540, 5, '2020-03-10 05:18:07', '2020-03-10 05:18:07'),
(542, 541, 5, '2020-03-10 05:29:48', '2020-03-10 05:29:48'),
(543, 542, 5, '2020-03-10 05:30:42', '2020-03-10 05:30:42'),
(544, 543, 5, '2020-03-10 05:31:33', '2020-03-10 05:31:33'),
(545, 544, 5, '2020-03-10 05:33:43', '2020-03-10 05:33:43'),
(546, 545, 5, '2020-03-10 05:38:27', '2020-03-10 05:38:27'),
(547, 546, 5, '2020-03-10 05:39:10', '2020-03-10 05:39:10'),
(548, 547, 5, '2020-03-10 05:39:43', '2020-03-10 05:39:43'),
(549, 548, 5, '2020-03-10 05:40:21', '2020-03-10 05:40:21'),
(550, 549, 5, '2020-03-10 05:41:49', '2020-03-10 05:41:49'),
(551, 550, 5, '2020-03-10 05:44:52', '2020-03-10 05:44:52'),
(552, 551, 5, '2020-03-10 05:45:31', '2020-03-10 05:45:31'),
(553, 552, 5, '2020-03-10 05:46:09', '2020-03-10 05:46:09'),
(554, 553, 5, '2020-03-10 05:47:40', '2020-03-10 05:47:40'),
(555, 554, 5, '2020-03-10 05:48:36', '2020-03-10 05:48:36'),
(556, 555, 5, '2020-03-10 05:50:29', '2020-03-10 05:50:29'),
(557, 556, 5, '2020-03-10 05:51:11', '2020-03-10 05:51:11'),
(558, 557, 5, '2020-03-10 05:51:42', '2020-03-10 05:51:42'),
(559, 558, 5, '2020-03-10 05:52:24', '2020-03-10 05:52:24'),
(560, 559, 2, '2020-03-11 23:52:06', '2020-03-11 23:52:06'),
(561, 560, 2, '2020-03-11 23:52:48', '2020-03-11 23:52:48'),
(562, 561, 2, '2020-03-11 23:59:11', '2020-03-11 23:59:11'),
(563, 562, 2, '2020-03-11 23:59:51', '2020-03-11 23:59:51'),
(564, 563, 2, '2020-03-12 00:00:32', '2020-03-12 00:00:32'),
(565, 564, 2, '2020-03-12 00:01:09', '2020-03-12 00:01:09'),
(566, 565, 2, '2020-03-12 00:01:47', '2020-03-12 00:01:47'),
(567, 566, 2, '2020-03-12 00:02:23', '2020-03-12 00:02:23'),
(568, 567, 2, '2020-03-12 00:03:13', '2020-03-12 00:03:13'),
(569, 568, 2, '2020-03-12 00:06:54', '2020-03-12 00:06:54'),
(570, 569, 2, '2020-03-12 00:07:38', '2020-03-12 00:07:38'),
(571, 570, 2, '2020-03-12 00:08:20', '2020-03-12 00:08:20'),
(572, 571, 2, '2020-03-12 00:09:02', '2020-03-12 00:09:02'),
(573, 572, 2, '2020-03-12 00:09:49', '2020-03-12 00:09:49'),
(574, 573, 2, '2020-03-12 00:10:29', '2020-03-12 00:10:29'),
(575, 574, 2, '2020-03-12 00:13:42', '2020-03-12 00:13:42'),
(576, 575, 2, '2020-03-12 00:14:32', '2020-03-12 00:14:32'),
(577, 576, 2, '2020-03-12 00:15:46', '2020-03-12 00:15:46'),
(578, 577, 2, '2020-03-12 00:16:35', '2020-03-12 00:16:35'),
(579, 578, 2, '2020-03-12 00:18:17', '2020-03-12 00:18:17'),
(580, 579, 4, '2020-03-12 00:18:58', '2020-03-12 00:18:58'),
(581, 580, 2, '2020-03-12 00:19:56', '2020-03-12 00:19:56'),
(582, 581, 2, '2020-03-12 00:20:37', '2020-03-12 00:20:37'),
(583, 582, 2, '2020-03-12 00:23:18', '2020-03-12 00:23:18'),
(584, 583, 2, '2020-03-12 00:23:55', '2020-03-12 00:23:55'),
(585, 584, 2, '2020-03-12 00:24:33', '2020-03-12 00:24:33'),
(586, 585, 2, '2020-03-12 00:25:09', '2020-03-12 00:25:09'),
(587, 586, 6, '2020-03-12 23:20:50', '2020-03-12 23:20:50'),
(588, 587, 6, '2020-03-12 23:22:04', '2020-03-12 23:22:04'),
(589, 588, 6, '2020-03-12 23:25:39', '2020-03-12 23:25:39'),
(590, 589, 6, '2020-03-12 23:26:12', '2020-03-12 23:26:12'),
(591, 590, 6, '2020-03-12 23:27:00', '2020-03-12 23:27:00'),
(592, 591, 6, '2020-03-12 23:27:52', '2020-03-12 23:27:52'),
(593, 592, 6, '2020-03-12 23:29:12', '2020-03-12 23:29:12'),
(594, 593, 6, '2020-03-12 23:29:49', '2020-03-12 23:29:49'),
(595, 594, 6, '2020-03-12 23:30:39', '2020-03-12 23:30:39'),
(596, 595, 6, '2020-03-12 23:31:21', '2020-03-12 23:31:21'),
(597, 596, 6, '2020-03-12 23:32:19', '2020-03-12 23:32:19'),
(598, 597, 6, '2020-03-12 23:33:35', '2020-03-12 23:33:35'),
(599, 598, 6, '2020-03-12 23:34:31', '2020-03-12 23:34:31'),
(600, 599, 6, '2020-03-12 23:36:21', '2020-03-12 23:36:21'),
(601, 600, 6, '2020-03-12 23:37:36', '2020-03-12 23:37:36'),
(602, 601, 2, '2020-03-12 23:40:13', '2020-03-12 23:40:13'),
(603, 602, 2, '2020-03-12 23:41:01', '2020-03-12 23:41:01'),
(604, 603, 2, '2020-03-12 23:41:59', '2020-03-12 23:41:59'),
(605, 604, 6, '2020-03-12 23:45:05', '2020-03-12 23:45:05'),
(606, 605, 6, '2020-03-12 23:45:56', '2020-03-12 23:45:56'),
(607, 606, 6, '2020-03-12 23:46:43', '2020-03-12 23:46:43'),
(608, 607, 6, '2020-03-12 23:48:30', '2020-03-12 23:48:30'),
(609, 608, 6, '2020-03-12 23:49:05', '2020-03-12 23:49:05'),
(610, 609, 6, '2020-03-12 23:49:43', '2020-03-12 23:49:43'),
(611, 610, 1, '2020-03-12 23:50:15', '2020-03-12 23:50:15'),
(612, 611, 6, '2020-03-12 23:51:53', '2020-03-12 23:51:53'),
(613, 612, 1, '2020-03-12 23:52:26', '2020-03-12 23:52:26'),
(614, 613, 6, '2020-03-12 23:53:10', '2020-03-12 23:53:10'),
(615, 614, 6, '2020-03-12 23:53:46', '2020-03-12 23:53:46'),
(616, 615, 6, '2020-03-12 23:54:32', '2020-03-12 23:54:32'),
(617, 616, 6, '2020-03-13 00:00:53', '2020-03-13 00:00:53'),
(618, 617, 6, '2020-03-13 00:02:06', '2020-03-13 00:02:06'),
(619, 618, 6, '2020-03-13 00:03:11', '2020-03-13 00:03:11'),
(620, 619, 6, '2020-03-13 00:04:02', '2020-03-13 00:04:02'),
(621, 620, 6, '2020-03-13 00:04:35', '2020-03-13 00:04:35'),
(622, 621, 6, '2020-03-13 00:11:21', '2020-03-13 00:11:21'),
(623, 622, 6, '2020-03-13 00:12:37', '2020-03-13 00:12:37'),
(624, 623, 6, '2020-03-13 00:14:01', '2020-03-13 00:14:01'),
(625, 624, 6, '2020-03-13 00:14:37', '2020-03-13 00:14:37'),
(626, 625, 6, '2020-03-13 03:21:31', '2020-03-13 03:21:31'),
(627, 626, 6, '2020-03-13 03:22:13', '2020-03-13 03:22:13'),
(628, 627, 6, '2020-03-13 03:22:53', '2020-03-13 03:22:53'),
(629, 628, 6, '2020-03-13 03:23:24', '2020-03-13 03:23:24'),
(630, 629, 6, '2020-03-13 03:25:38', '2020-03-13 03:25:38'),
(631, 630, 5, '2020-03-13 03:29:54', '2020-03-13 03:29:54'),
(632, 631, 5, '2020-03-13 03:36:53', '2020-03-13 03:36:53'),
(633, 632, 5, '2020-03-13 03:37:31', '2020-03-13 03:37:31'),
(634, 633, 6, '2020-03-13 03:40:49', '2020-03-13 03:40:49'),
(635, 634, 5, '2020-03-13 03:41:31', '2020-03-13 03:41:31'),
(636, 635, 5, '2020-03-13 03:42:09', '2020-03-13 03:42:09'),
(637, 636, 6, '2020-03-13 03:42:45', '2020-03-13 03:42:45'),
(638, 637, 6, '2020-03-13 03:43:21', '2020-03-13 03:43:21'),
(639, 638, 6, '2020-03-13 03:44:04', '2020-03-13 03:44:04'),
(640, 639, 6, '2020-03-13 03:44:39', '2020-03-13 03:44:39'),
(641, 640, 6, '2020-03-13 03:45:24', '2020-03-13 03:45:24'),
(642, 641, 6, '2020-03-13 05:12:34', '2020-03-13 05:12:34'),
(643, 642, 6, '2020-03-13 05:13:19', '2020-03-13 05:13:19'),
(644, 643, 6, '2020-03-13 05:14:47', '2020-03-13 05:14:47'),
(645, 644, 6, '2020-03-13 05:17:04', '2020-03-13 05:17:04'),
(646, 645, 6, '2020-03-13 05:17:56', '2020-03-13 05:17:56'),
(647, 646, 6, '2020-03-13 05:18:58', '2020-03-13 05:18:58'),
(648, 647, 6, '2020-03-13 05:21:40', '2020-03-13 05:21:40'),
(649, 648, 6, '2020-03-13 05:22:34', '2020-03-13 05:22:34'),
(650, 649, 6, '2020-03-13 05:24:14', '2020-03-13 05:24:14'),
(651, 650, 6, '2020-03-13 05:25:12', '2020-03-13 05:25:12'),
(652, 651, 6, '2020-03-13 05:25:52', '2020-03-13 05:25:52'),
(653, 652, 6, '2020-03-13 05:26:29', '2020-03-13 05:26:29'),
(654, 653, 6, '2020-03-13 05:27:35', '2020-03-13 05:27:35'),
(655, 654, 6, '2020-03-13 05:28:10', '2020-03-13 05:28:10'),
(656, 655, 6, '2020-03-13 05:28:56', '2020-03-13 05:28:56'),
(657, 656, 6, '2020-03-13 05:29:38', '2020-03-13 05:29:38'),
(658, 657, 6, '2020-03-13 05:30:11', '2020-03-13 05:30:11'),
(659, 658, 6, '2020-03-13 05:30:55', '2020-03-13 05:30:55'),
(660, 659, 6, '2020-03-13 05:31:59', '2020-03-13 05:31:59'),
(661, 660, 6, '2020-03-13 05:32:47', '2020-03-13 05:32:47'),
(662, 661, 6, '2020-03-13 05:33:57', '2020-03-13 05:33:57'),
(663, 662, 6, '2020-03-13 05:34:38', '2020-03-13 05:34:38'),
(664, 663, 6, '2020-03-13 05:35:27', '2020-03-13 05:35:27'),
(665, 664, 6, '2020-03-13 05:39:30', '2020-03-13 05:39:30'),
(666, 665, 6, '2020-03-13 05:40:44', '2020-03-13 05:40:44'),
(667, 666, 6, '2020-03-13 05:42:05', '2020-03-13 05:42:05'),
(668, 667, 2, '2020-03-13 05:43:43', '2020-03-13 05:43:43'),
(669, 668, 6, '2020-03-13 05:44:19', '2020-03-13 05:44:19'),
(670, 669, 2, '2020-03-13 05:46:40', '2020-03-13 05:46:40'),
(671, 670, 6, '2020-03-15 02:37:52', '2020-03-15 02:37:52'),
(672, 671, 2, '2020-03-15 03:01:28', '2020-03-15 03:01:28'),
(673, 672, 6, '2020-03-15 03:02:31', '2020-03-15 03:02:31'),
(674, 673, 6, '2020-03-15 03:07:24', '2020-03-15 03:07:24'),
(675, 674, 6, '2020-03-15 03:08:13', '2020-03-15 03:08:13'),
(676, 675, 6, '2020-03-15 03:09:24', '2020-03-15 03:09:24'),
(677, 676, 6, '2020-03-15 03:18:35', '2020-03-15 03:18:35'),
(678, 677, 6, '2020-03-15 03:19:35', '2020-03-15 03:19:35'),
(679, 678, 6, '2020-03-15 03:20:15', '2020-03-15 03:20:15'),
(680, 679, 6, '2020-03-15 03:20:53', '2020-03-15 03:20:53'),
(681, 680, 6, '2020-03-15 03:22:31', '2020-03-15 03:22:31'),
(682, 681, 6, '2020-03-15 03:29:03', '2020-03-15 03:29:03'),
(683, 682, 6, '2020-03-15 03:30:28', '2020-03-15 03:30:28'),
(684, 683, 6, '2020-03-15 04:18:06', '2020-03-15 04:18:06'),
(685, 684, 6, '2020-03-15 04:18:52', '2020-03-15 04:18:52'),
(686, 685, 6, '2020-03-15 04:19:53', '2020-03-15 04:19:53'),
(687, 686, 6, '2020-03-15 04:20:34', '2020-03-15 04:20:34'),
(688, 687, 6, '2020-03-15 04:23:18', '2020-03-15 04:23:18'),
(689, 688, 6, '2020-03-15 04:24:53', '2020-03-15 04:24:53'),
(690, 689, 6, '2020-03-15 04:25:44', '2020-03-15 04:25:44'),
(691, 690, 6, '2020-03-15 04:26:27', '2020-03-15 04:26:27'),
(692, 691, 6, '2020-03-15 04:27:10', '2020-03-15 04:27:10'),
(693, 692, 6, '2020-03-15 04:32:29', '2020-03-15 04:32:29'),
(694, 693, 6, '2020-03-15 04:33:07', '2020-03-15 04:33:07'),
(695, 694, 6, '2020-03-15 04:34:09', '2020-03-15 04:34:09'),
(696, 695, 6, '2020-03-15 04:34:46', '2020-03-15 04:34:46'),
(697, 696, 6, '2020-03-15 04:35:30', '2020-03-15 04:35:30'),
(698, 697, 6, '2020-03-15 04:37:14', '2020-03-15 04:37:14'),
(699, 698, 6, '2020-03-15 04:37:51', '2020-03-15 04:37:51'),
(700, 699, 6, '2020-03-15 04:40:55', '2020-03-15 04:40:55'),
(701, 700, 6, '2020-03-15 04:41:31', '2020-03-15 04:41:31'),
(702, 701, 6, '2020-03-15 04:42:15', '2020-03-15 04:42:15'),
(703, 702, 6, '2020-03-15 04:48:20', '2020-03-15 04:48:20'),
(704, 703, 6, '2020-03-15 04:48:57', '2020-03-15 04:48:57'),
(705, 704, 4, '2020-03-15 04:49:36', '2020-03-15 04:49:36'),
(706, 705, 4, '2020-03-15 04:50:04', '2020-03-15 04:50:04'),
(707, 706, 6, '2020-03-15 04:50:58', '2020-03-15 04:50:58'),
(708, 707, 6, '2020-03-15 04:58:03', '2020-03-15 04:58:03'),
(709, 708, 6, '2020-03-15 04:58:49', '2020-03-15 04:58:49'),
(710, 709, 6, '2020-03-15 05:05:18', '2020-03-15 05:05:18'),
(711, 710, 6, '2020-03-15 05:06:08', '2020-03-15 05:06:08'),
(712, 711, 6, '2020-03-15 05:08:26', '2020-03-15 05:08:26'),
(713, 712, 6, '2020-03-15 05:09:07', '2020-03-15 05:09:07'),
(714, 713, 6, '2020-03-15 05:35:39', '2020-03-15 05:35:39'),
(715, 714, 6, '2020-03-15 05:37:57', '2020-03-15 05:37:57'),
(716, 715, 6, '2020-03-15 05:38:45', '2020-03-15 05:38:45'),
(717, 716, 6, '2020-03-15 05:43:04', '2020-03-15 05:43:04'),
(718, 717, 6, '2020-03-15 05:44:33', '2020-03-15 05:44:33'),
(719, 718, 6, '2020-03-15 05:46:53', '2020-03-15 05:46:53'),
(720, 719, 6, '2020-03-15 05:57:24', '2020-03-15 05:57:24'),
(721, 720, 6, '2020-03-15 05:58:39', '2020-03-15 05:58:39'),
(722, 721, 6, '2020-03-15 05:59:11', '2020-03-15 05:59:11'),
(723, 722, 6, '2020-03-15 06:02:17', '2020-03-15 06:02:17'),
(724, 723, 6, '2020-03-15 06:03:04', '2020-03-15 06:03:04'),
(725, 724, 6, '2020-03-15 06:04:46', '2020-03-15 06:04:46'),
(726, 725, 6, '2020-03-15 06:05:30', '2020-03-15 06:05:30'),
(727, 726, 6, '2020-03-15 06:07:32', '2020-03-15 06:07:32'),
(728, 727, 6, '2020-03-15 06:10:03', '2020-03-15 06:10:03'),
(729, 728, 6, '2020-03-15 06:11:11', '2020-03-15 06:11:11'),
(730, 729, 6, '2020-03-15 06:14:22', '2020-03-15 06:14:22'),
(731, 730, 2, '2020-03-15 06:15:18', '2020-03-15 06:15:18'),
(732, 731, 2, '2020-03-15 06:17:11', '2020-03-15 06:17:11'),
(733, 732, 2, '2020-03-15 06:17:50', '2020-03-15 06:17:50'),
(734, 733, 6, '2020-03-16 00:12:26', '2020-03-16 00:12:26'),
(735, 734, 6, '2020-03-16 00:13:04', '2020-03-16 00:13:04'),
(736, 735, 6, '2020-03-16 00:13:47', '2020-03-16 00:13:47'),
(737, 736, 2, '2020-03-16 00:14:14', '2020-03-16 00:14:14'),
(738, 737, 2, '2020-03-16 00:14:58', '2020-03-16 00:14:58'),
(739, 738, 2, '2020-03-16 00:15:26', '2020-03-16 00:15:26'),
(740, 739, 6, '2020-03-16 00:15:59', '2020-03-16 00:15:59'),
(741, 740, 6, '2020-03-16 00:16:27', '2020-03-16 00:16:27'),
(742, 741, 6, '2020-03-16 00:21:39', '2020-03-16 00:21:39'),
(743, 742, 6, '2020-03-16 00:22:28', '2020-03-16 00:22:28'),
(744, 743, 6, '2020-03-16 00:23:43', '2020-03-16 00:23:43'),
(745, 744, 6, '2020-03-16 00:24:17', '2020-03-16 00:24:17'),
(746, 745, 6, '2020-03-16 00:25:06', '2020-03-16 00:25:06'),
(747, 746, 6, '2020-03-16 00:29:36', '2020-03-16 00:29:36'),
(748, 747, 6, '2020-03-16 00:30:13', '2020-03-16 00:30:13'),
(749, 748, 6, '2020-03-16 00:32:12', '2020-03-16 00:32:12'),
(750, 749, 6, '2020-03-16 00:32:47', '2020-03-16 00:32:47'),
(751, 750, 6, '2020-03-16 00:33:18', '2020-03-16 00:33:18'),
(752, 751, 6, '2020-03-16 00:36:48', '2020-03-16 00:36:48'),
(753, 752, 6, '2020-03-16 00:47:12', '2020-03-16 00:47:12'),
(754, 753, 6, '2020-03-16 00:54:47', '2020-03-16 00:54:47'),
(755, 754, 6, '2020-03-16 00:55:37', '2020-03-16 00:55:37'),
(756, 755, 6, '2020-03-16 00:57:39', '2020-03-16 00:57:39'),
(757, 756, 6, '2020-03-16 00:58:16', '2020-03-16 00:58:16'),
(758, 757, 6, '2020-03-16 00:59:22', '2020-03-16 00:59:22'),
(759, 758, 6, '2020-03-16 01:00:05', '2020-03-16 01:00:05'),
(760, 759, 6, '2020-03-16 01:01:12', '2020-03-16 01:01:12'),
(761, 760, 6, '2020-03-16 01:02:09', '2020-03-16 01:02:09'),
(762, 761, 6, '2020-03-16 01:02:39', '2020-03-16 01:02:39'),
(763, 762, 6, '2020-03-16 01:03:09', '2020-03-16 01:03:09'),
(764, 763, 6, '2020-03-16 01:09:01', '2020-03-16 01:09:01'),
(765, 764, 2, '2020-03-16 01:10:30', '2020-03-16 01:10:30'),
(766, 765, 6, '2020-03-16 02:16:35', '2020-03-16 02:16:35'),
(767, 766, 6, '2020-03-16 02:17:23', '2020-03-16 02:17:23'),
(768, 767, 6, '2020-03-16 02:17:57', '2020-03-16 02:17:57'),
(769, 768, 6, '2020-03-16 02:18:33', '2020-03-16 02:18:33'),
(770, 769, 6, '2020-03-16 02:20:46', '2020-03-16 02:20:46'),
(771, 770, 1, '2020-03-16 02:21:22', '2020-03-16 02:21:22'),
(772, 771, 6, '2020-03-16 02:22:10', '2020-03-16 02:22:10'),
(773, 772, 6, '2020-03-16 02:23:14', '2020-03-16 02:23:14'),
(774, 773, 6, '2020-03-16 02:23:56', '2020-03-16 02:23:56'),
(775, 774, 6, '2020-03-16 02:25:18', '2020-03-16 02:25:18'),
(776, 775, 6, '2020-03-16 02:25:57', '2020-03-16 02:25:57'),
(777, 776, 6, '2020-03-16 02:27:09', '2020-03-16 02:27:09'),
(778, 777, 6, '2020-03-16 02:28:49', '2020-03-16 02:28:49'),
(779, 778, 6, '2020-03-16 02:29:28', '2020-03-16 02:29:28'),
(780, 779, 6, '2020-03-16 02:30:01', '2020-03-16 02:30:01'),
(781, 780, 6, '2020-03-16 02:31:27', '2020-03-16 02:31:27'),
(782, 781, 6, '2020-03-16 02:32:16', '2020-03-16 02:32:16'),
(783, 782, 6, '2020-03-16 02:32:49', '2020-03-16 02:32:49'),
(784, 783, 2, '2020-03-16 02:33:26', '2020-03-16 02:33:26'),
(785, 784, 6, '2020-03-16 02:35:29', '2020-03-16 02:35:29'),
(786, 785, 6, '2020-03-16 02:37:19', '2020-03-16 02:37:19'),
(787, 786, 6, '2020-03-16 02:37:57', '2020-03-16 02:37:57'),
(788, 787, 6, '2020-03-16 02:38:28', '2020-03-16 02:38:28'),
(789, 788, 7, '2020-03-16 02:39:49', '2020-03-16 02:39:49'),
(790, 789, 7, '2020-03-16 02:41:20', '2020-03-16 02:41:20'),
(791, 790, 5, '2020-03-16 02:42:37', '2020-03-16 02:42:37'),
(792, 791, 5, '2020-03-16 02:43:39', '2020-03-16 02:43:39'),
(793, 792, 5, '2020-03-16 02:44:22', '2020-03-16 02:44:22'),
(794, 793, 5, '2020-03-16 02:44:51', '2020-03-16 02:44:51'),
(795, 794, 7, '2020-03-16 02:45:23', '2020-03-16 02:45:23'),
(796, 795, 7, '2020-03-16 02:46:56', '2020-03-16 02:46:56'),
(797, 796, 5, '2020-03-16 02:47:28', '2020-03-16 02:47:28'),
(798, 797, 5, '2020-03-16 02:48:07', '2020-03-16 02:48:07'),
(799, 798, 5, '2020-03-16 02:48:57', '2020-03-16 02:48:57'),
(800, 799, 7, '2020-03-16 02:49:47', '2020-03-16 02:49:47'),
(801, 800, 7, '2020-03-16 02:50:24', '2020-03-16 02:50:24'),
(802, 801, 7, '2020-03-16 02:51:08', '2020-03-16 02:51:08'),
(803, 802, 5, '2020-03-16 02:51:53', '2020-03-16 02:51:53'),
(804, 803, 5, '2020-03-16 02:52:28', '2020-03-16 02:52:28'),
(805, 804, 7, '2020-03-16 02:53:08', '2020-03-16 02:53:08'),
(806, 805, 5, '2020-03-16 03:06:03', '2020-03-16 03:06:03'),
(807, 806, 5, '2020-03-16 03:06:38', '2020-03-16 03:06:38'),
(808, 807, 5, '2020-03-16 03:07:10', '2020-03-16 03:07:10'),
(809, 808, 5, '2020-03-16 03:07:46', '2020-03-16 03:07:46'),
(810, 809, 5, '2020-03-16 03:08:26', '2020-03-16 03:08:26'),
(811, 810, 5, '2020-03-16 03:12:59', '2020-03-16 03:12:59'),
(812, 811, 7, '2020-03-16 03:13:52', '2020-03-16 03:13:52'),
(813, 812, 5, '2020-03-16 03:14:27', '2020-03-16 03:14:27'),
(814, 813, 5, '2020-03-16 03:15:02', '2020-03-16 03:15:02'),
(815, 814, 7, '2020-03-16 03:15:35', '2020-03-16 03:15:35'),
(816, 815, 7, '2020-03-16 03:16:05', '2020-03-16 03:16:05'),
(817, 816, 5, '2020-03-16 03:16:43', '2020-03-16 03:16:43'),
(818, 817, 5, '2020-03-16 03:17:28', '2020-03-16 03:17:28'),
(819, 818, 5, '2020-03-16 03:18:27', '2020-03-16 03:18:27'),
(820, 819, 7, '2020-03-16 03:20:32', '2020-03-16 03:20:32'),
(821, 820, 5, '2020-03-16 03:21:10', '2020-03-16 03:21:10'),
(822, 821, 7, '2020-03-16 03:21:47', '2020-03-16 03:21:47'),
(823, 822, 7, '2020-03-16 03:22:21', '2020-03-16 03:22:21'),
(824, 823, 5, '2020-03-16 03:22:58', '2020-03-16 03:22:58'),
(825, 824, 5, '2020-03-16 03:23:32', '2020-03-16 03:23:32'),
(826, 825, 6, '2020-03-16 03:34:14', '2020-03-16 03:34:14'),
(827, 826, 6, '2020-03-16 03:35:06', '2020-03-16 03:35:06'),
(828, 827, 6, '2020-03-16 03:36:05', '2020-03-16 03:36:05'),
(829, 828, 6, '2020-03-16 03:39:30', '2020-03-16 03:39:30'),
(830, 829, 6, '2020-03-16 03:40:05', '2020-03-16 03:40:05'),
(831, 830, 6, '2020-03-16 03:42:55', '2020-03-16 03:42:55'),
(832, 831, 6, '2020-03-16 03:44:17', '2020-03-16 03:44:17'),
(833, 832, 6, '2020-03-16 03:45:58', '2020-03-16 03:45:58'),
(834, 833, 6, '2020-03-16 03:47:40', '2020-03-16 03:47:40'),
(835, 834, 6, '2020-03-16 03:48:21', '2020-03-16 03:48:21'),
(836, 835, 6, '2020-03-16 03:51:22', '2020-03-16 03:51:22'),
(837, 836, 6, '2020-03-16 03:52:08', '2020-03-16 03:52:08'),
(838, 837, 6, '2020-03-16 04:01:07', '2020-03-16 04:01:07'),
(839, 838, 6, '2020-03-16 04:01:46', '2020-03-16 04:01:46'),
(840, 839, 6, '2020-03-16 04:02:20', '2020-03-16 04:02:20'),
(841, 840, 6, '2020-03-16 04:02:57', '2020-03-16 04:02:57'),
(842, 841, 5, '2020-03-17 12:43:55', '2020-03-17 12:43:55'),
(843, 842, 5, '2020-03-17 12:46:41', '2020-03-17 12:46:41'),
(844, 843, 5, '2020-03-17 12:48:17', '2020-03-17 12:48:17'),
(845, 844, 5, '2020-03-17 12:50:11', '2020-03-17 12:50:11'),
(846, 845, 5, '2020-03-17 12:51:16', '2020-03-17 12:51:16'),
(847, 846, 2, '2020-03-17 13:01:39', '2020-03-17 13:01:39'),
(848, 847, 4, '2020-03-18 07:44:18', '2020-03-18 07:44:18'),
(849, 848, 4, '2020-03-18 07:45:52', '2020-03-18 07:45:52'),
(850, 849, 4, '2020-03-18 07:50:17', '2020-03-18 07:50:17'),
(851, 850, 2, '2020-03-18 07:57:23', '2020-03-18 07:57:23'),
(852, 851, 2, '2020-03-18 08:00:51', '2020-03-18 08:00:51'),
(853, 852, 3, '2020-03-18 08:05:30', '2020-03-18 08:05:30'),
(854, 853, 3, '2020-03-18 08:07:01', '2020-03-18 08:07:01'),
(855, 854, 1, '2020-03-18 12:01:14', '2020-03-18 12:01:14'),
(856, 855, 2, '2020-03-18 23:53:42', '2020-03-18 23:53:42'),
(857, 856, 7, '2020-03-19 00:21:57', '2020-03-19 00:21:57'),
(858, 857, 6, '2020-03-19 03:05:10', '2020-03-19 03:05:10'),
(859, 858, 6, '2020-03-19 03:05:47', '2020-03-19 03:05:47');
INSERT INTO `product_units` (`id`, `product_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(860, 859, 6, '2020-03-19 03:06:19', '2020-03-19 03:06:19'),
(861, 860, 6, '2020-03-19 03:06:51', '2020-03-19 03:06:51'),
(862, 861, 1, '2020-03-19 03:08:08', '2020-03-19 03:08:08'),
(863, 862, 6, '2020-03-19 03:08:43', '2020-03-19 03:08:43'),
(864, 863, 1, '2020-03-19 03:09:33', '2020-03-19 03:09:33'),
(865, 864, 5, '2020-03-19 04:50:06', '2020-03-19 04:50:06'),
(866, 865, 5, '2020-03-19 04:50:39', '2020-03-19 04:50:39'),
(867, 866, 5, '2020-03-19 04:51:22', '2020-03-19 04:51:22'),
(868, 867, 6, '2020-03-19 04:52:13', '2020-03-19 04:52:13'),
(869, 868, 5, '2020-03-19 04:54:27', '2020-03-19 04:54:27'),
(870, 869, 5, '2020-03-19 04:54:57', '2020-03-19 04:54:57'),
(871, 870, 6, '2020-03-19 04:55:27', '2020-03-19 04:55:27'),
(872, 871, 5, '2020-03-19 04:55:56', '2020-03-19 04:55:56'),
(873, 872, 6, '2020-03-19 05:03:06', '2020-03-19 05:03:06'),
(874, 873, 5, '2020-03-19 05:03:37', '2020-03-19 05:03:37'),
(875, 874, 6, '2020-03-19 05:04:05', '2020-03-19 05:04:05'),
(876, 875, 5, '2020-03-19 05:04:38', '2020-03-19 05:04:38'),
(877, 876, 6, '2020-03-19 05:05:10', '2020-03-19 05:05:10'),
(878, 877, 5, '2020-03-19 05:05:40', '2020-03-19 05:05:40'),
(879, 878, 5, '2020-03-19 05:06:14', '2020-03-19 05:06:14'),
(880, 879, 6, '2020-03-19 05:06:43', '2020-03-19 05:06:43'),
(881, 880, 5, '2020-03-19 05:07:18', '2020-03-19 05:07:18'),
(882, 881, 5, '2020-03-19 05:07:59', '2020-03-19 05:07:59'),
(883, 882, 5, '2020-03-19 05:17:50', '2020-03-19 05:17:50'),
(884, 883, 5, '2020-03-19 05:18:29', '2020-03-19 05:18:29'),
(885, 884, 5, '2020-03-19 05:21:53', '2020-03-19 05:21:53'),
(886, 885, 5, '2020-03-19 05:23:46', '2020-03-19 05:23:46'),
(887, 886, 6, '2020-03-19 05:25:15', '2020-03-19 05:25:15'),
(888, 887, 6, '2020-03-19 05:27:33', '2020-03-19 05:27:33'),
(889, 888, 6, '2020-03-19 05:28:08', '2020-03-19 05:28:08'),
(890, 889, 2, '2020-03-20 02:49:03', '2020-03-20 02:49:03'),
(891, 890, 2, '2020-03-20 02:52:31', '2020-03-20 02:52:31'),
(892, 891, 2, '2020-03-20 02:53:53', '2020-03-20 02:53:53'),
(893, 892, 2, '2020-03-20 02:55:19', '2020-03-20 02:55:19'),
(894, 893, 2, '2020-03-20 02:57:03', '2020-03-20 02:57:03'),
(895, 894, 2, '2020-03-20 02:58:15', '2020-03-20 02:58:15'),
(896, 895, 2, '2020-03-20 03:03:08', '2020-03-20 03:03:08'),
(897, 896, 2, '2020-03-20 03:04:21', '2020-03-20 03:04:21'),
(898, 897, 2, '2020-03-20 03:05:47', '2020-03-20 03:05:47'),
(899, 898, 2, '2020-03-20 03:06:48', '2020-03-20 03:06:48'),
(900, 899, 2, '2020-03-20 03:23:43', '2020-03-20 03:23:43'),
(901, 900, 2, '2020-03-20 03:31:40', '2020-03-20 03:31:40'),
(902, 901, 2, '2020-03-20 03:39:33', '2020-03-20 03:39:33'),
(903, 902, 2, '2020-03-20 03:41:12', '2020-03-20 03:41:12'),
(904, 903, 2, '2020-03-20 03:42:44', '2020-03-20 03:42:44'),
(905, 904, 2, '2020-03-20 03:45:32', '2020-03-20 03:45:32'),
(906, 905, 2, '2020-03-20 03:46:13', '2020-03-20 03:46:13'),
(907, 906, 2, '2020-03-20 03:46:49', '2020-03-20 03:46:49'),
(908, 907, 2, '2020-03-20 03:47:38', '2020-03-20 03:47:38'),
(909, 908, 2, '2020-03-20 03:49:14', '2020-03-20 03:49:14'),
(910, 909, 2, '2020-03-20 03:53:03', '2020-03-20 03:53:03'),
(911, 910, 2, '2020-03-20 03:53:40', '2020-03-20 03:53:40'),
(912, 911, 2, '2020-03-20 03:54:15', '2020-03-20 03:54:15'),
(913, 912, 2, '2020-03-20 03:54:44', '2020-03-20 03:54:44'),
(914, 913, 2, '2020-03-20 03:55:14', '2020-03-20 03:55:14'),
(915, 914, 2, '2020-03-20 03:55:48', '2020-03-20 03:55:48'),
(916, 915, 2, '2020-03-20 03:56:30', '2020-03-20 03:56:30'),
(917, 916, 2, '2020-03-20 03:57:04', '2020-03-20 03:57:04'),
(918, 917, 2, '2020-03-20 03:57:38', '2020-03-20 03:57:38'),
(919, 918, 2, '2020-03-20 03:58:09', '2020-03-20 03:58:09'),
(920, 919, 2, '2020-03-20 04:03:31', '2020-03-20 04:03:31'),
(921, 920, 2, '2020-03-20 04:04:05', '2020-03-20 04:04:05'),
(922, 921, 2, '2020-03-20 04:04:47', '2020-03-20 04:04:47'),
(923, 922, 2, '2020-03-20 04:05:18', '2020-03-20 04:05:18'),
(924, 923, 2, '2020-03-20 04:05:50', '2020-03-20 04:05:50'),
(925, 924, 2, '2020-03-20 04:09:56', '2020-03-20 04:09:56'),
(926, 925, 2, '2020-03-20 04:10:31', '2020-03-20 04:10:31'),
(927, 926, 2, '2020-03-20 04:11:02', '2020-03-20 04:11:02'),
(928, 927, 2, '2020-03-20 04:11:32', '2020-03-20 04:11:32'),
(929, 928, 2, '2020-03-20 04:12:03', '2020-03-20 04:12:03'),
(930, 929, 2, '2020-03-20 04:20:58', '2020-03-20 04:20:58'),
(931, 930, 2, '2020-03-20 04:21:29', '2020-03-20 04:21:29'),
(932, 931, 2, '2020-03-20 04:22:01', '2020-03-20 04:22:01'),
(933, 932, 2, '2020-03-20 04:22:51', '2020-03-20 04:22:51'),
(934, 933, 2, '2020-03-20 04:23:24', '2020-03-20 04:23:24'),
(935, 934, 2, '2020-03-20 04:24:37', '2020-03-20 04:24:37'),
(936, 935, 2, '2020-03-20 04:25:24', '2020-03-20 04:25:24'),
(937, 936, 2, '2020-03-20 04:27:03', '2020-03-20 04:27:03'),
(938, 937, 2, '2020-03-20 04:27:38', '2020-03-20 04:27:38'),
(939, 938, 2, '2020-03-20 04:28:13', '2020-03-20 04:28:13'),
(940, 939, 2, '2020-03-20 04:32:37', '2020-03-20 04:32:37'),
(941, 940, 2, '2020-03-20 04:34:02', '2020-03-20 04:34:02'),
(942, 941, 2, '2020-03-20 05:14:59', '2020-03-20 05:14:59'),
(943, 942, 2, '2020-03-20 05:15:37', '2020-03-20 05:15:37'),
(944, 943, 2, '2020-03-20 05:16:10', '2020-03-20 05:16:10'),
(945, 944, 2, '2020-03-20 05:18:04', '2020-03-20 05:18:04'),
(946, 945, 2, '2020-03-20 05:18:37', '2020-03-20 05:18:37'),
(947, 946, 2, '2020-03-20 05:19:15', '2020-03-20 05:19:15'),
(948, 947, 2, '2020-03-20 05:19:49', '2020-03-20 05:19:49'),
(949, 948, 2, '2020-03-20 05:20:24', '2020-03-20 05:20:24'),
(950, 949, 1, '2020-03-21 11:35:20', '2020-03-21 11:35:20'),
(951, 950, 1, '2020-03-21 11:37:30', '2020-03-21 11:37:30'),
(952, 951, 1, '2020-03-21 11:40:27', '2020-03-21 11:40:27'),
(953, 952, 1, '2020-05-06 15:50:12', '2020-05-06 15:50:12'),
(956, 955, 1, '2020-05-06 16:05:29', '2020-05-06 16:05:29'),
(957, 956, 1, '2020-05-06 16:06:26', '2020-05-06 16:06:26'),
(958, 957, 1, '2020-05-06 16:07:23', '2020-05-06 16:07:23'),
(959, 958, 2, '2020-05-31 06:25:31', '2020-05-31 06:25:31'),
(963, 962, 1, '2020-07-09 12:58:18', '2020-07-09 12:58:18'),
(964, 963, 1, '2020-07-09 13:01:34', '2020-07-09 13:01:34'),
(965, 964, 1, '2020-07-09 13:06:30', '2020-07-09 13:06:30'),
(966, 965, 1, '2020-07-09 13:09:51', '2020-07-09 13:09:51'),
(967, 966, 1, '2020-07-09 13:12:43', '2020-07-09 13:12:43'),
(968, 967, 1, '2020-07-16 02:49:30', '2020-07-16 02:49:30'),
(969, 968, 1, '2020-07-17 02:20:09', '2020-07-17 02:20:09'),
(970, 969, 1, '2020-07-19 00:39:56', '2020-07-19 00:39:56'),
(971, 970, 1, '2020-07-19 00:42:26', '2020-07-19 00:42:26'),
(972, 971, 1, '2020-07-19 00:47:32', '2020-07-19 00:47:32'),
(973, 972, 1, '2020-07-19 00:48:57', '2020-07-19 00:48:57'),
(974, 973, 1, '2020-07-19 00:52:50', '2020-07-19 00:52:50'),
(975, 974, 1, '2020-07-19 00:53:54', '2020-07-19 00:53:54'),
(976, 975, 1, '2020-07-19 00:54:44', '2020-07-19 00:54:44'),
(977, 976, 1, '2020-07-19 00:55:50', '2020-07-19 00:55:50'),
(978, 977, 1, '2020-07-19 01:16:17', '2020-07-19 01:16:17'),
(979, 978, 1, '2020-07-19 01:17:32', '2020-07-19 01:17:32'),
(980, 979, 1, '2020-07-19 01:23:55', '2020-07-19 01:23:55'),
(981, 980, 1, '2020-07-19 01:26:05', '2020-07-19 01:26:05'),
(982, 981, 1, '2020-07-19 01:27:10', '2020-07-19 01:27:10'),
(983, 982, 1, '2020-07-19 01:48:49', '2020-07-19 01:48:49'),
(984, 983, 1, '2020-07-19 01:53:28', '2020-07-19 01:53:28'),
(985, 984, 1, '2020-07-20 20:29:59', '2020-07-20 20:29:59'),
(986, 985, 1, '2020-07-20 20:33:21', '2020-07-20 20:33:21'),
(987, 986, 1, '2020-07-20 20:34:32', '2020-07-20 20:34:32'),
(988, 987, 1, '2020-07-20 20:36:10', '2020-07-20 20:36:10'),
(989, 988, 1, '2020-07-20 20:40:05', '2020-07-20 20:40:05'),
(990, 989, 1, '2020-07-20 20:41:53', '2020-07-20 20:41:53'),
(991, 990, 1, '2020-07-20 20:43:03', '2020-07-20 20:43:03'),
(992, 991, 1, '2020-07-20 20:44:25', '2020-07-20 20:44:25'),
(993, 992, 1, '2020-07-20 20:47:14', '2020-07-20 20:47:14'),
(994, 993, 1, '2020-07-20 20:53:37', '2020-07-20 20:53:37'),
(995, 994, 1, '2020-07-20 20:55:46', '2020-07-20 20:55:46'),
(996, 995, 1, '2020-07-20 20:57:06', '2020-07-20 20:57:06'),
(997, 996, 1, '2020-07-20 20:58:23', '2020-07-20 20:58:23'),
(998, 997, 1, '2020-07-20 21:01:25', '2020-07-20 21:01:25'),
(999, 998, 1, '2020-07-22 21:57:07', '2020-07-22 21:57:07'),
(1000, 999, 1, '2020-07-22 22:09:03', '2020-07-22 22:09:03'),
(1001, 1000, 1, '2020-07-22 22:12:57', '2020-07-22 22:12:57'),
(1002, 1001, 1, '2020-07-22 22:17:17', '2020-07-22 22:17:17'),
(1003, 1002, 1, '2020-07-22 22:24:12', '2020-07-22 22:24:12'),
(1004, 1003, 1, '2020-08-07 21:23:00', '2020-08-07 21:23:00'),
(1005, 1004, 1, '2020-08-07 21:27:23', '2020-08-07 21:27:23'),
(1006, 1005, 1, '2020-08-07 21:30:22', '2020-08-07 21:30:22'),
(1007, 1006, 1, '2020-08-15 20:16:53', '2020-08-15 20:16:53'),
(1008, 1007, 2, '2020-08-19 23:39:12', '2020-08-19 23:39:12'),
(1009, 1008, 2, '2020-08-19 23:41:50', '2020-08-19 23:41:50'),
(1010, 1009, 2, '2020-08-19 23:44:21', '2020-08-19 23:44:21'),
(1011, 1010, 2, '2020-08-19 23:47:25', '2020-08-19 23:47:25'),
(1012, 1011, 2, '2020-08-19 23:50:41', '2020-08-19 23:50:41'),
(1013, 1012, 2, '2020-08-19 23:55:21', '2020-08-19 23:55:21'),
(1014, 1013, 2, '2020-08-19 23:58:01', '2020-08-19 23:58:01'),
(1015, 1014, 2, '2020-08-20 00:00:52', '2020-08-20 00:00:52'),
(1016, 1015, 2, '2020-08-20 00:06:56', '2020-08-20 00:06:56'),
(1017, 1016, 2, '2020-08-20 00:08:27', '2020-08-20 00:08:27'),
(1018, 1017, 2, '2020-08-20 00:10:06', '2020-08-20 00:10:06'),
(1019, 1018, 2, '2020-08-20 00:11:32', '2020-08-20 00:11:32'),
(1020, 1019, 2, '2020-08-20 00:13:02', '2020-08-20 00:13:02'),
(1021, 1020, 2, '2020-08-20 00:14:22', '2020-08-20 00:14:22'),
(1022, 1021, 2, '2020-08-20 00:18:00', '2020-08-20 00:18:00'),
(1023, 1022, 2, '2020-08-20 00:19:11', '2020-08-20 00:19:11'),
(1024, 1023, 2, '2020-08-20 00:20:35', '2020-08-20 00:20:35'),
(1025, 1024, 2, '2020-08-20 00:21:47', '2020-08-20 00:21:47'),
(1026, 1025, 2, '2020-08-20 00:22:41', '2020-08-20 00:22:41'),
(1027, 1026, 2, '2020-08-20 00:23:54', '2020-08-20 00:23:54'),
(1028, 1027, 2, '2020-08-20 00:24:58', '2020-08-20 00:24:58'),
(1029, 1028, 2, '2020-08-20 00:27:10', '2020-08-20 00:27:10'),
(1030, 1029, 2, '2020-08-20 00:28:13', '2020-08-20 00:28:13'),
(1031, 1030, 2, '2020-08-20 00:29:24', '2020-08-20 00:29:24'),
(1032, 1031, 2, '2020-08-20 00:47:12', '2020-08-20 00:47:12'),
(1033, 1032, 2, '2020-08-20 00:48:14', '2020-08-20 00:48:14'),
(1034, 1033, 2, '2020-08-20 00:49:20', '2020-08-20 00:49:20'),
(1035, 1034, 2, '2020-08-20 00:52:31', '2020-08-20 00:52:31'),
(1036, 1035, 2, '2020-08-20 00:53:34', '2020-08-20 00:53:34'),
(1037, 1036, 2, '2020-08-20 00:54:40', '2020-08-20 00:54:40'),
(1038, 1037, 2, '2020-08-20 00:57:52', '2020-08-20 00:57:52'),
(1039, 1038, 2, '2020-08-20 00:59:11', '2020-08-20 00:59:11'),
(1040, 1039, 2, '2020-08-20 01:02:31', '2020-08-20 01:02:31'),
(1041, 1040, 2, '2020-08-20 01:04:50', '2020-08-20 01:04:50'),
(1042, 1041, 2, '2020-08-22 14:11:50', '2020-08-22 14:11:50'),
(1043, 1042, 2, '2020-08-22 14:17:38', '2020-08-22 14:17:38'),
(1044, 1043, 2, '2020-08-22 14:21:24', '2020-08-22 14:21:24'),
(1045, 1044, 2, '2020-08-22 14:31:40', '2020-08-22 14:31:40'),
(1047, 1046, 2, '2020-08-22 14:38:15', '2020-08-22 14:38:15'),
(1048, 1047, 2, '2020-08-22 14:44:39', '2020-08-22 14:44:39'),
(1049, 1048, 2, '2020-08-22 14:49:19', '2020-08-22 14:49:19'),
(1050, 1049, 2, '2020-08-22 14:50:33', '2020-08-22 14:50:33'),
(1051, 1050, 2, '2020-08-22 14:55:09', '2020-08-22 14:55:09'),
(1053, 1052, 2, '2020-08-22 17:30:50', '2020-08-22 17:30:50'),
(1054, 1053, 2, '2020-08-22 17:33:18', '2020-08-22 17:33:18'),
(1055, 1054, 2, '2020-08-22 17:35:08', '2020-08-22 17:35:08'),
(1056, 1055, 2, '2020-08-22 17:36:36', '2020-08-22 17:36:36'),
(1057, 1056, 2, '2020-08-22 17:37:51', '2020-08-22 17:37:51'),
(1058, 1057, 2, '2020-08-22 17:39:42', '2020-08-22 17:39:42'),
(1059, 1058, 2, '2020-08-22 17:45:31', '2020-08-22 17:45:31'),
(1060, 1059, 2, '2020-08-22 17:48:51', '2020-08-22 17:48:51'),
(1061, 1060, 2, '2020-08-22 17:51:37', '2020-08-22 17:51:37'),
(1062, 1061, 2, '2020-08-22 17:52:55', '2020-08-22 17:52:55'),
(1063, 1062, 2, '2020-08-22 18:01:39', '2020-08-22 18:01:39'),
(1064, 1063, 2, '2020-08-22 18:04:56', '2020-08-22 18:04:56'),
(1065, 1064, 2, '2020-08-22 18:07:51', '2020-08-22 18:07:51'),
(1066, 1065, 2, '2020-08-22 18:12:14', '2020-08-22 18:12:14'),
(1067, 1066, 2, '2020-08-22 18:14:01', '2020-08-22 18:14:01'),
(1068, 1067, 2, '2020-08-22 18:15:59', '2020-08-22 18:15:59'),
(1069, 1068, 2, '2020-08-22 18:18:14', '2020-08-22 18:18:14'),
(1070, 1069, 2, '2020-08-22 18:20:59', '2020-08-22 18:20:59'),
(1071, 1070, 2, '2020-08-22 18:22:55', '2020-08-22 18:22:55'),
(1072, 1071, 2, '2020-08-22 18:24:44', '2020-08-22 18:24:44'),
(1073, 1072, 2, '2020-08-22 18:27:18', '2020-08-22 18:27:18'),
(1074, 1073, 2, '2020-08-22 18:30:38', '2020-08-22 18:30:38'),
(1075, 1074, 2, '2020-08-22 18:33:32', '2020-08-22 18:33:32'),
(1076, 1075, 2, '2020-08-22 18:36:21', '2020-08-22 18:36:21'),
(1077, 1076, 2, '2020-08-22 18:37:56', '2020-08-22 18:37:56'),
(1078, 1077, 2, '2020-08-22 19:03:43', '2020-08-22 19:03:43'),
(1079, 1078, 2, '2020-08-22 19:17:33', '2020-08-22 19:17:33'),
(1080, 1079, 2, '2020-08-22 19:20:58', '2020-08-22 19:20:58'),
(1081, 1080, 2, '2020-08-22 19:23:55', '2020-08-22 19:23:55'),
(1082, 1081, 2, '2020-08-22 19:26:36', '2020-08-22 19:26:36'),
(1083, 1082, 2, '2020-08-22 19:30:56', '2020-08-22 19:30:56'),
(1084, 1083, 2, '2020-08-22 19:33:08', '2020-08-22 19:33:08'),
(1085, 1084, 2, '2020-08-22 19:36:08', '2020-08-22 19:36:08'),
(1086, 1085, 2, '2020-08-22 19:37:57', '2020-08-22 19:37:57'),
(1087, 1086, 2, '2020-08-22 19:42:33', '2020-08-22 19:42:33'),
(1088, 1087, 2, '2020-08-22 19:45:52', '2020-08-22 19:45:52'),
(1089, 1088, 2, '2020-08-22 19:48:30', '2020-08-22 19:48:30'),
(1090, 1089, 2, '2020-08-22 19:51:37', '2020-08-22 19:51:37'),
(1091, 1090, 2, '2020-08-22 19:54:09', '2020-08-22 19:54:09'),
(1092, 1091, 2, '2020-08-22 21:41:31', '2020-08-22 21:41:31'),
(1093, 1092, 1, '2020-08-22 22:11:48', '2020-08-22 22:11:48'),
(1094, 1092, 2, '2020-08-22 22:11:48', '2020-08-22 22:11:48'),
(1095, 1093, 2, '2020-08-22 22:12:47', '2020-08-22 22:12:47'),
(1096, 1094, 2, '2020-08-22 22:16:31', '2020-08-22 22:16:31'),
(1097, 1095, 2, '2020-08-22 22:18:26', '2020-08-22 22:18:26'),
(1098, 1096, 2, '2020-08-22 22:22:37', '2020-08-22 22:22:37'),
(1099, 1097, 2, '2020-08-22 22:25:12', '2020-08-22 22:25:12'),
(1100, 1098, 2, '2020-08-22 22:28:27', '2020-08-22 22:28:27'),
(1101, 1099, 2, '2020-08-22 22:32:31', '2020-08-22 22:32:31'),
(1102, 1100, 2, '2020-08-22 23:08:02', '2020-08-22 23:08:02'),
(1103, 1101, 1, '2020-08-22 23:15:44', '2020-08-22 23:15:44'),
(1104, 1102, 1, '2020-08-22 23:16:36', '2020-08-22 23:16:36'),
(1105, 1103, 1, '2020-08-22 23:17:13', '2020-08-22 23:17:13'),
(1106, 1104, 1, '2020-08-22 23:19:31', '2020-08-22 23:19:31'),
(1107, 1105, 1, '2020-08-22 23:21:31', '2020-08-22 23:21:31'),
(1108, 1106, 1, '2020-08-22 23:24:35', '2020-08-22 23:24:35'),
(1109, 1107, 1, '2020-08-22 23:25:41', '2020-08-22 23:25:41'),
(1111, 1109, 6, '2020-08-23 18:48:20', '2020-08-23 18:48:20'),
(1112, 1110, 6, '2020-08-23 18:49:37', '2020-08-23 18:49:37'),
(1113, 1108, 1, '2020-08-23 21:17:18', '2020-08-23 21:17:18'),
(1114, 1111, 4, '2020-08-24 18:20:29', '2020-08-24 18:20:29'),
(1115, 1112, 1, '2020-08-30 01:21:58', '2020-08-30 01:21:58'),
(1116, 1113, 1, '2020-08-30 01:23:16', '2020-08-30 01:23:16'),
(1117, 1114, 1, '2020-08-30 01:26:15', '2020-08-30 01:26:15'),
(1118, 1115, 1, '2020-08-30 01:28:02', '2020-08-30 01:28:02'),
(1119, 1116, 1, '2020-08-30 01:35:44', '2020-08-30 01:35:44'),
(1120, 1117, 2, '2020-08-30 01:39:34', '2020-08-30 01:39:34'),
(1121, 1118, 6, '2020-08-30 01:45:36', '2020-08-30 01:45:36'),
(1122, 1119, 6, '2020-09-02 01:39:37', '2020-09-02 01:39:37'),
(1123, 1120, 6, '2020-09-02 01:42:09', '2020-09-02 01:42:09'),
(1124, 1121, 6, '2020-09-02 01:44:05', '2020-09-02 01:44:05'),
(1125, 1122, 6, '2020-09-02 01:46:55', '2020-09-02 01:46:55'),
(1126, 1123, 5, '2020-09-02 01:49:37', '2020-09-02 01:49:37'),
(1127, 1124, 7, '2020-09-02 01:52:06', '2020-09-02 01:52:06'),
(1128, 1125, 5, '2020-09-02 01:54:41', '2020-09-02 01:54:41'),
(1129, 1126, 5, '2020-09-02 01:57:11', '2020-09-02 01:57:11'),
(1130, 1127, 6, '2020-09-02 01:59:59', '2020-09-02 01:59:59'),
(1131, 1128, 6, '2020-09-02 02:02:04', '2020-09-02 02:02:04'),
(1132, 1129, 6, '2020-09-02 22:36:08', '2020-09-02 22:36:08'),
(1133, 1130, 6, '2020-09-02 22:38:16', '2020-09-02 22:38:16'),
(1134, 1131, 6, '2020-09-02 22:41:32', '2020-09-02 22:41:32'),
(1135, 1132, 7, '2020-09-02 22:47:41', '2020-09-02 22:47:41'),
(1136, 1133, 6, '2020-09-02 22:48:40', '2020-09-02 22:48:40'),
(1137, 1134, 6, '2020-09-02 22:52:54', '2020-09-02 22:52:54'),
(1138, 1135, 6, '2020-09-02 22:54:29', '2020-09-02 22:54:29'),
(1139, 1136, 2, '2020-09-08 00:14:39', '2020-09-08 00:14:39'),
(1140, 1137, 6, '2020-09-10 22:48:13', '2020-09-10 22:48:13'),
(1141, 1138, 6, '2020-09-10 22:55:42', '2020-09-10 22:55:42'),
(1142, 1139, 6, '2020-09-10 23:01:33', '2020-09-10 23:01:33'),
(1143, 1140, 1, '2020-09-10 23:09:38', '2020-09-10 23:09:38'),
(1144, 1141, 6, '2020-09-26 18:55:11', '2020-09-26 18:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `promotionproducts`
--

CREATE TABLE `promotionproducts` (
  `id` int(191) NOT NULL,
  `promotion_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `offer_price` double(8,2) NOT NULL,
  `percentage` varchar(191) DEFAULT NULL,
  `status` int(191) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promotionproducts`
--

INSERT INTO `promotionproducts` (`id`, `promotion_id`, `product_id`, `offer_price`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(5, 7, 1007, 1650.00, '20%', 1, '2020-08-22 02:16:23', '2020-08-22 21:17:29'),
(6, 7, 1008, 1410.00, '20%', 1, '2020-08-22 02:18:52', '2020-08-22 02:18:52'),
(7, 7, 1009, 2250.00, '21%', 1, '2020-08-22 02:21:04', '2020-08-22 21:17:06'),
(8, 7, 1010, 1390.00, '16%', 1, '2020-08-22 02:21:32', '2020-08-22 02:21:32'),
(9, 7, 1011, 2950.00, '19%', 1, '2020-08-22 02:23:54', '2020-08-22 21:18:04'),
(10, 7, 1012, 3550.00, '15%', 1, '2020-08-22 02:25:44', '2020-08-22 02:25:44'),
(11, 7, 1013, 1950.00, '26%', 1, '2020-08-22 02:26:45', '2020-08-22 21:18:59'),
(12, 7, 1014, 1399.00, '18%', 1, '2020-08-22 02:27:11', '2020-08-22 02:27:11'),
(14, 7, 1016, 1790.00, '10%', 1, '2020-08-22 02:30:02', '2020-08-22 02:30:02'),
(16, 7, 1017, 2270.00, '16%', 1, '2020-08-22 02:32:19', '2020-08-22 02:32:19'),
(17, 7, 1018, 1690.00, '20%', 1, '2020-08-22 02:32:47', '2020-08-22 02:32:47'),
(18, 7, 1021, 1199.00, '25%', 1, '2020-08-22 02:33:52', '2020-08-22 02:33:52'),
(19, 7, 1022, 1150.00, '23%', 1, '2020-08-22 02:34:55', '2020-08-22 02:34:55'),
(20, 7, 1023, 3188.00, '25%', 1, '2020-08-22 02:37:25', '2020-08-22 02:37:25'),
(21, 7, 1024, 1949.00, '22%', 1, '2020-08-22 02:38:50', '2020-08-22 02:38:50'),
(22, 7, 1025, 2650.00, '52%', 1, '2020-08-22 02:40:39', '2020-08-22 02:40:39'),
(23, 7, 1028, 2840.00, '20%', 1, '2020-08-22 02:42:38', '2020-08-22 02:42:38'),
(24, 7, 1027, 1750.00, '19%', 1, '2020-08-22 02:43:16', '2020-08-22 02:43:16'),
(25, 7, 1029, 3549.00, '16%', 1, '2020-08-22 02:43:54', '2020-08-22 02:43:54'),
(26, 7, 1030, 1450.00, '22%', 1, '2020-08-22 02:44:27', '2020-08-22 02:44:27'),
(27, 7, 1040, 950.00, '34%', 1, '2020-08-22 02:45:07', '2020-08-22 02:45:07'),
(28, 7, 1037, 1750.00, '22%', 1, '2020-08-22 02:46:44', '2020-08-22 02:46:44'),
(29, 7, 1038, 1580.00, '19%', 1, '2020-08-22 02:47:46', '2020-08-22 02:47:46'),
(30, 7, 1031, 1250.00, '14%', 1, '2020-08-22 02:49:05', '2020-08-22 02:49:05'),
(31, 7, 1032, 900.00, '33%', 1, '2020-08-22 02:49:43', '2020-08-22 02:49:43'),
(32, 7, 1033, 1199.00, '16%', 1, '2020-08-22 02:50:21', '2020-08-22 02:50:21'),
(33, 7, 1034, 1450.00, '33%', 1, '2020-08-22 02:52:15', '2020-08-22 02:52:15'),
(34, 7, 1035, 2650.00, '21%', 1, '2020-08-22 02:53:39', '2020-08-22 02:53:39'),
(35, 7, 1036, 950.00, '17%', 1, '2020-08-22 02:54:41', '2020-08-22 02:54:41'),
(36, 7, 1039, 1350.00, '23%', 1, '2020-08-22 02:55:27', '2020-08-22 02:55:27'),
(37, 7, 1091, 2050.00, '-8%', 1, '2020-08-22 22:48:39', '2020-08-22 22:48:39'),
(38, 7, 1092, 2450.00, '11%', 1, '2020-08-22 22:51:46', '2020-08-22 22:51:46'),
(39, 7, 1093, 2450.00, '11%', 1, '2020-08-22 22:52:47', '2020-08-22 22:52:47'),
(40, 7, 1094, 2850.00, '17%', 1, '2020-08-22 22:54:21', '2020-08-22 22:54:21'),
(41, 7, 1095, 6900.00, '14%', 1, '2020-08-22 22:55:07', '2020-08-22 22:55:07'),
(42, 7, 1096, 1450.00, '12%', 1, '2020-08-22 22:55:24', '2020-08-22 22:55:24'),
(43, 7, 1097, 3150.00, '13%', 1, '2020-08-22 22:55:43', '2020-08-22 22:55:43'),
(44, 7, 1099, 2650.00, '7%', 1, '2020-08-22 23:03:36', '2020-08-22 23:03:36'),
(45, 6, 1041, 799.00, '50%', 1, '2020-08-23 00:55:13', '2020-08-23 00:55:13'),
(46, 6, 1042, 380.00, '49%', 1, '2020-08-23 00:55:57', '2020-08-23 00:55:57'),
(47, 6, 1043, 280.00, '49%', 1, '2020-08-23 00:56:19', '2020-08-23 00:56:19'),
(48, 6, 1044, 2750.00, '29%', 1, '2020-08-23 00:57:28', '2020-08-23 00:57:28'),
(49, 6, 1046, 1450.00, '12%', 1, '2020-08-23 00:58:10', '2020-08-23 00:58:10'),
(50, 6, 1047, 649.00, '28%', 1, '2020-08-23 00:58:56', '2020-08-23 00:58:56'),
(51, 6, 1048, 299.00, '50%', 1, '2020-08-23 00:59:20', '2020-08-23 00:59:20'),
(52, 6, 1049, 299.00, '50%', 1, '2020-08-23 00:59:41', '2020-08-23 00:59:41'),
(53, 6, 1050, 1280.00, '15%', 1, '2020-08-23 01:00:29', '2020-08-23 01:00:29'),
(54, 6, 1100, 450.00, '61%', 1, '2020-08-23 01:01:14', '2020-08-26 00:29:26'),
(55, 6, 1052, 475.00, '27%', 1, '2020-08-23 01:02:40', '2020-08-23 01:02:40'),
(56, 6, 1053, 150.00, '57%', 1, '2020-08-23 01:04:04', '2020-08-23 01:04:04'),
(57, 6, 1054, 220.00, '51%', 1, '2020-08-23 01:05:32', '2020-08-23 01:05:32'),
(58, 6, 1055, 550.00, '21%', 1, '2020-08-23 01:05:58', '2020-08-23 01:05:58'),
(59, 6, 1056, 510.00, '46%', 1, '2020-08-23 01:06:55', '2020-08-23 01:06:55'),
(60, 6, 1057, 320.00, '51%', 1, '2020-08-23 01:07:20', '2020-08-23 01:07:20'),
(61, 6, 1058, 99.00, '67%', 1, '2020-08-23 01:07:42', '2020-08-23 01:07:42'),
(62, 6, 1059, 240.00, '52%', 1, '2020-08-23 01:09:14', '2020-08-23 01:09:14'),
(63, 6, 1060, 1190.00, '28%', 1, '2020-08-23 01:11:08', '2020-08-23 01:11:08'),
(64, 6, 1061, 1750.00, '13%', 1, '2020-08-23 01:11:50', '2020-08-23 01:11:50'),
(65, 6, 1062, 550.00, '35%', 1, '2020-08-23 01:12:08', '2020-08-23 01:12:08'),
(66, 6, 1063, 880.00, '20%', 1, '2020-08-23 01:13:29', '2020-08-23 01:13:29'),
(67, 6, 1065, 1850.00, '16%', 1, '2020-08-23 01:15:27', '2020-08-23 01:15:27'),
(68, 6, 1066, 599.00, '35%', 1, '2020-08-23 01:15:51', '2020-08-23 01:15:51'),
(69, 6, 1067, 1950.00, '22%', 1, '2020-08-23 01:16:45', '2020-08-23 01:16:45'),
(70, 6, 1068, 899.00, '50%', 1, '2020-08-23 01:17:27', '2020-08-23 01:17:27'),
(71, 6, 1069, 999.00, '13%', 1, '2020-08-23 01:18:24', '2020-08-23 01:18:24'),
(72, 6, 1070, 850.00, '52%', 1, '2020-08-23 01:19:05', '2020-08-23 01:19:05'),
(73, 6, 1071, 1399.00, '42%', 1, '2020-08-23 01:19:53', '2020-08-23 01:19:53'),
(74, 6, 1072, 1850.00, '37%', 1, '2020-08-23 01:20:38', '2020-08-23 01:20:38'),
(75, 6, 1073, 299.00, '62%', 1, '2020-08-23 01:21:25', '2020-08-23 01:21:25'),
(76, 6, 1074, 1399.00, '38%', 1, '2020-08-23 01:22:02', '2020-08-23 01:22:02'),
(77, 6, 1075, 1150.00, '53%', 1, '2020-08-23 01:29:43', '2020-08-23 01:29:43'),
(78, 6, 1076, 350.00, '36%', 1, '2020-08-23 01:30:29', '2020-08-23 01:30:29'),
(79, 6, 1077, 1049.00, '36%', 1, '2020-08-23 01:32:11', '2020-08-23 01:32:11'),
(80, 6, 1078, 1499.00, '35%', 1, '2020-08-23 01:33:10', '2020-08-23 01:33:10'),
(81, 6, 1079, 1550.00, '46%', 1, '2020-08-23 01:33:52', '2020-08-23 01:33:52'),
(82, 6, 1081, 99.00, '45%', 1, '2020-08-23 01:34:19', '2020-08-23 01:34:19'),
(83, 6, 1084, 199.00, '73%', 1, '2020-08-23 01:36:33', '2020-08-23 01:36:33'),
(84, 6, 1085, 110.00, '76%', 1, '2020-08-23 01:37:26', '2020-08-23 01:37:26'),
(85, 6, 1086, 850.00, '51%', 1, '2020-08-23 01:38:41', '2020-08-23 01:38:41'),
(86, 6, 1087, 1150.00, '38%', 1, '2020-08-23 01:39:28', '2020-08-23 01:39:28'),
(87, 6, 1088, 1270.00, '36%', 1, '2020-08-23 01:40:11', '2020-08-23 01:40:11'),
(88, 6, 1089, 760.00, '34%', 1, '2020-08-23 01:41:16', '2020-08-23 01:41:16'),
(89, 6, 1090, 1360.00, '26%', 1, '2020-08-23 01:41:39', '2020-08-23 01:41:39');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `status` int(191) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Mobile Mania', '1598048053BANNER-WEB-CAMPAIGN-MOBILE.jpg', 'Mobile-Mania', 0, '2020-08-04 01:31:58', '2020-08-29 11:59:27'),
(7, 'Brand Day WiFi Router', '1598048030BANNER-WEB-CAMPAIGN-ROUTER.jpg', 'Brand-Day-WiFi-Router', 0, '2020-08-21 00:23:55', '2020-08-29 11:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `rating` varchar(191) DEFAULT NULL,
  `comments` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sellingreports`
--

CREATE TABLE `sellingreports` (
  `id` int(191) NOT NULL,
  `create_date` date NOT NULL,
  `admin_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `quantity` int(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `buying_unit_price` double(8,2) NOT NULL,
  `selling_unit_price` double(8,2) NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `created_at` timestamp(5) NULL DEFAULT NULL,
  `updated_at` timestamp(5) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, 'gm', '2020-02-17 09:10:14', '2020-02-18 03:44:10'),
(2, 'Kg', '2020-02-17 09:10:19', '2020-02-18 03:44:17'),
(3, 'Ltr', '2020-02-17 09:10:23', '2020-02-18 03:43:31'),
(4, 'ml', '2020-02-18 03:42:41', '2020-02-18 03:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `sliderproducts`
--

CREATE TABLE `sliderproducts` (
  `id` int(191) NOT NULL,
  `slider_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `offer_price` double(8,2) DEFAULT NULL,
  `status` int(191) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliderproducts`
--

INSERT INTO `sliderproducts` (`id`, `slider_id`, `product_id`, `offer_price`, `status`, `created_at`, `updated_at`) VALUES
(5, 8, 962, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(6, 8, 963, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(7, 8, 964, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(8, 8, 965, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(9, 8, 966, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(10, 8, 984, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(11, 8, 985, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(12, 8, 986, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(13, 8, 987, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(14, 8, 988, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(15, 8, 989, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(16, 8, 990, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(17, 8, 991, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(18, 8, 992, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(19, 8, 993, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(20, 8, 994, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(21, 8, 995, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(22, 8, 996, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(23, 8, 997, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(24, 8, 998, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(25, 8, 999, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(26, 8, 1000, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(27, 8, 1001, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54'),
(28, 8, 1002, NULL, 1, '2020-07-23 17:11:54', '2020-07-23 17:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(191) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(11, 'Mustard Oil Buy 3 Get 1 Offer', '1598195389118342248_388961722071949_1676068671373393111_n.jpg', 'Mustard-Oil-Buy-3-Get-1-Offer', 1, '2020-08-23 19:09:49', '2020-08-23 19:09:49'),
(12, 'Malta', '1598961300malta banner.jpeg', 'Malta', 1, '2020-09-01 15:55:01', '2020-09-01 15:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fruits & Vegetables', '1594901792FRUITS-AND-VEGETABLES.jpg', 'Fruits-&-Vegetables', '2020-02-17 12:14:25', '2020-08-21 14:09:04'),
(2, 1, 'Breakfast', '1594901748Grab-n-Go-Egg-Breakfast-Box2-CMS.jpg', 'Breakfast', '2020-02-17 12:15:24', '2020-08-21 14:09:04'),
(3, 1, 'Beverages', '1594901702non-alcoholic-drinks-hero.jpg', 'Beverages', '2020-02-17 12:15:47', '2020-08-21 14:09:04'),
(4, 1, 'Meat & Fish', '1594901647food-bad-for-dogs-raw-meat-eggs.jpg', 'Meat-&-Fish', '2020-02-17 12:18:47', '2020-08-21 14:09:04'),
(5, 1, 'Snacks', '1594901557cheesy-keto-snacks-150747-2.jpg', 'Snacks', '2020-02-17 12:19:01', '2020-08-21 14:09:04'),
(6, 1, 'Dairy', '1594901505637243603784859129Fresh-dairy-products-on-the-wooden-table-675334958_3524x4712.jpeg', 'Dairy', '2020-02-17 12:19:30', '2020-08-21 14:09:04'),
(7, 1, 'Bread & Bakery', '1594901446counter-display-of-all.jpg', 'Bread-&-Bakery', '2020-02-17 12:20:03', '2020-08-21 14:09:04'),
(8, 1, 'Cooking', '1594901360the-cooking-professor.jpg', 'Cooking', '2020-02-17 12:20:20', '2020-08-21 14:09:04'),
(9, 3, 'Diapers & Wipes', '1594901283bilde.jpg', 'Diapers-&-Wipes', '2020-02-17 12:21:58', '2020-08-21 14:09:04'),
(11, 3, 'Fooding', '1594901222nisha-kitchen-fooding-and-lodding-dhemaji-restaurants-yxev7.jpg', 'Fooding', '2020-02-17 12:22:28', '2020-08-21 14:09:04'),
(12, 3, 'Bath & Skincare', '1594901169f3.png', 'Bath-&-Skincare', '2020-02-17 12:22:56', '2020-08-21 14:09:04'),
(13, 3, 'Baby Accessories', '1594901096Baby-Accessories0.jpg', 'Baby-Accessories', '2020-02-17 12:23:22', '2020-08-21 14:09:04'),
(14, 3, 'Baby Oral Care', '159490104376b3104f6846fdad24c457ec6f74da81a72810b9_400_400.jpeg', 'Baby-Oral-Care', '2020-02-17 12:23:42', '2020-08-21 14:09:04'),
(15, 5, 'Air Fresheners', '1594900888odour-removal2-sydney-forensic-cleaning.jpg', 'Air-Fresheners', '2020-02-17 12:25:32', '2020-08-21 14:09:04'),
(16, 5, 'Dish Detergents', '1594900820Afwasmiddel.jpg', 'Dish-Detergents', '2020-02-17 12:25:56', '2020-08-21 14:09:04'),
(17, 5, 'Cleaning Supplies', '1594900755148-1481675_transparent-cleaning-supplies-png-tools-and-equipment-in.png', 'Cleaning-Supplies', '2020-02-17 12:26:25', '2020-08-21 14:09:04'),
(18, 5, 'Kitchen Accessories', '15949006517d828b0743da7d9f10ac65473d75b990.jpg', 'Kitchen-Accessories', '2020-02-17 12:26:49', '2020-08-21 14:09:04'),
(19, 5, 'Laundry', '1594900554laundrycoronaviruas-lowres-2x1-iStock-160528106-600x300.jpg', 'Laundry', '2020-02-17 12:27:09', '2020-08-21 14:09:04'),
(20, 5, 'Napkins & Paper Products', '1594900490Untitled-design-2020-03-12T154109.689.png', 'Napkins-&-Paper-Products', '2020-02-17 12:27:46', '2020-08-21 14:09:04'),
(21, 5, 'Cleaning Accessories', '1594900383cleaning-supplies-kit.1.jpg', 'Cleaning-Accessories', '2020-02-17 12:28:26', '2020-08-21 14:09:04'),
(22, 5, 'Food Storage', '1594900325GettyImages-666732190-5c69ea9146e0fb0001917219.jpg', 'Food-Storage', '2020-02-17 12:28:39', '2020-08-21 14:09:04'),
(23, 7, 'Mobile Accessories', '1594900271612nJ6wQknL._SL1021_.jpg', 'Mobile-Accessories', '2020-02-17 12:29:28', '2020-08-21 14:09:04'),
(24, 7, 'Computer Accessories', '1594900201unnamed.jpg', 'Computer-Accessories', '2020-02-17 12:29:53', '2020-08-21 14:09:04'),
(25, 8, 'Batteries', '1594900149Types-of-BatterY.jpg', 'Batteries', '2020-02-17 12:30:36', '2020-08-21 14:09:04'),
(26, 8, 'Writing & Drawing', '1594900078kissclipart-graphic-design-writing-implement-6c3f2d95338d8f5e.png', 'Writing-&-Drawing', '2020-02-17 12:31:02', '2020-08-21 14:09:04'),
(27, 8, 'Organizing', '1594900006organizing-900x675.jpg', 'Organizing', '2020-02-17 12:31:21', '2020-08-21 14:09:04'),
(28, 8, 'Printing', '1594899962img_0439.jpg', 'Printing', '2020-02-17 12:32:41', '2020-08-21 14:09:04'),
(29, 4, 'Health Care', '1594899851HEI_2017-Touts_1600x900-5.png', 'Health-Care', '2020-02-17 12:32:58', '2020-08-21 14:09:04'),
(30, 4, 'Personal Care', '1594899683cosmetics-and-personal-care-1537529188-4325866.jpeg', 'Personal-Care', '2020-02-17 12:33:18', '2020-08-21 14:09:04'),
(31, 6, 'Lights & Electrical', '1594899582wrap817c1klitelightfittings-250x250.jpg', 'Lights-&-Electrical', '2020-02-17 12:34:52', '2020-08-21 14:09:04'),
(32, 6, 'Tools & Hardware', '1594899445hand-tools-header.jpg', 'Tools-&-Hardware', '2020-02-17 12:35:13', '2020-08-21 14:09:04'),
(33, 6, 'Kitchen Appliance', '1594899342Expressionist-Collection-in-kitchen1.jpg', 'Kitchen-Appliance', '2020-02-17 12:36:31', '2020-08-21 14:09:04'),
(35, 3, 'Feeders', '159489926761kuBDq2c0L._SL1000_.jpg', 'Feeders', '2020-02-26 09:38:42', '2020-08-21 14:09:04'),
(36, 4, 'Feminine Care', '1594899208vulva-collage-3.jpg', 'Feminine-Care', '2020-03-04 12:08:29', '2020-08-21 14:09:04'),
(37, 5, 'Pest Control', '1594899140115117_1.jpg', 'Pest-Control', '2020-03-06 23:15:19', '2020-08-21 14:09:04'),
(38, 4, 'Handwash', '1594898924certex_antibacterial_handwash1.jpg', 'Handwash', '2020-03-17 12:37:27', '2020-08-21 14:09:04'),
(39, 4, 'Ladies Fashion Accessories', '1594898776FASH.jpg', 'Ladies-Fashion-Accessories', '2020-03-18 08:21:29', '2020-08-21 14:09:04'),
(40, 4, 'Men\'s Fashion Accessories', '1594898613mens_fashion_accessories_bodyimage.jpg', 'Men\'s-Fashion-Accessories', '2020-03-18 08:21:51', '2020-08-21 14:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `subsubcategories`
--

CREATE TABLE `subsubcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `todyoffers`
--

CREATE TABLE `todyoffers` (
  `id` int(191) NOT NULL,
  `admin_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `offer_date` datetime(6) NOT NULL,
  `offer_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Kg', '2020-02-17 09:09:31', '2020-02-17 09:09:31'),
(2, 'Pices', '2020-02-17 09:09:38', '2020-02-17 09:09:38'),
(3, 'each', '2020-02-17 09:09:55', '2020-02-17 09:09:55'),
(4, 'set', '2020-02-17 09:10:02', '2020-02-17 09:10:02'),
(5, 'ml', '2020-02-18 06:46:31', '2020-02-18 06:46:31'),
(6, 'gm', '2020-02-18 06:46:44', '2020-02-18 06:46:44'),
(7, 'ltr', '2020-02-18 06:47:05', '2020-02-18 06:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `upazila_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `division_id`, `district_id`, `upazila_name`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Adabor', '2020-02-17 12:41:46', '2020-02-17 12:41:46'),
(3, 1, 1, 'Badda', '2020-02-17 12:42:19', '2020-02-17 12:42:19'),
(4, 1, 1, 'Banani', '2020-02-17 12:43:30', '2020-02-17 12:43:30'),
(5, 1, 1, 'Bangshal', '2020-02-17 12:43:56', '2020-02-17 12:43:56'),
(6, 1, 1, 'Bimanbondor', '2020-02-17 12:45:13', '2020-02-17 12:45:13'),
(7, 1, 1, 'Cantonment', '2020-02-17 12:53:37', '2020-02-17 12:53:37'),
(8, 1, 1, 'Chalkbazar', '2020-02-17 12:53:59', '2020-02-17 12:53:59'),
(9, 1, 1, 'Dakshinkhan', '2020-02-17 12:54:24', '2020-02-17 12:54:24'),
(10, 1, 1, 'Darus-Salam', '2020-02-17 12:54:55', '2020-02-17 12:54:55'),
(11, 1, 1, 'Demra', '2020-02-17 12:56:03', '2020-02-17 12:56:03'),
(12, 1, 1, 'Dhanmondi', '2020-02-17 12:56:32', '2020-02-17 12:56:32'),
(13, 1, 1, 'Gandaria', '2020-02-17 12:56:59', '2020-02-17 12:56:59'),
(14, 1, 1, 'Gulshan', '2020-02-17 12:57:28', '2020-02-17 12:57:28'),
(15, 1, 1, 'Hazaribag', '2020-02-17 12:57:46', '2020-02-17 12:57:46'),
(16, 1, 1, 'Jatrabari', '2020-02-17 12:58:02', '2020-02-17 12:58:02'),
(17, 1, 1, 'Kafrul', '2020-02-17 12:58:33', '2020-02-17 12:58:33'),
(18, 1, 1, 'Kalabagan', '2020-02-17 13:01:06', '2020-02-17 13:01:06'),
(19, 1, 1, 'Kamrangirchar', '2020-02-17 13:01:35', '2020-02-17 13:01:35'),
(20, 1, 1, 'Khilgaon', '2020-02-17 13:01:55', '2020-02-17 13:01:55'),
(21, 1, 1, 'Khilkhet', '2020-02-17 13:02:09', '2020-02-17 13:02:09'),
(22, 1, 1, 'Kadamtoli', '2020-02-17 13:02:35', '2020-02-17 13:02:35'),
(23, 1, 1, 'Kotwali', '2020-02-17 13:02:55', '2020-02-17 13:02:55'),
(24, 1, 1, 'Lalbagh', '2020-02-17 13:03:19', '2020-02-17 13:03:19'),
(25, 1, 1, 'Mirpur', '2020-02-17 13:03:37', '2020-02-17 13:03:37'),
(26, 1, 1, 'Mohammadpur', '2020-02-17 13:03:52', '2020-02-17 13:03:52'),
(27, 1, 1, 'Motijheel', '2020-02-17 13:04:05', '2020-02-17 13:04:05'),
(28, 1, 1, 'Mugda', '2020-02-17 13:05:40', '2020-02-17 13:05:40'),
(29, 1, 1, 'New Market', '2020-02-17 13:06:00', '2020-02-17 13:06:00'),
(30, 1, 1, 'Pallabi', '2020-02-17 13:06:30', '2020-02-17 13:06:30'),
(31, 1, 1, 'Paltan', '2020-02-17 13:07:02', '2020-02-17 13:07:02'),
(32, 1, 1, 'Ramna', '2020-02-17 13:07:18', '2020-02-17 13:07:18'),
(33, 1, 1, 'Rampura', '2020-02-17 13:08:38', '2020-02-17 13:08:38'),
(34, 1, 1, 'Rupnagar', '2020-02-17 13:08:55', '2020-02-17 13:08:55'),
(35, 1, 1, 'Sabujbag', '2020-02-17 13:09:37', '2020-02-17 13:09:37'),
(36, 1, 1, 'Shah Ali', '2020-02-17 13:10:05', '2020-02-17 13:10:05'),
(37, 1, 1, 'Shahbagh', '2020-02-17 13:10:18', '2020-02-17 13:10:18'),
(38, 1, 1, 'Shahjahanpur', '2020-02-17 13:10:34', '2020-02-17 13:10:34'),
(39, 1, 1, 'Sutrapur', '2020-02-17 13:10:47', '2020-02-17 13:10:47'),
(40, 1, 1, 'Shyampur', '2020-02-17 13:11:07', '2020-02-17 13:11:07'),
(41, 1, 1, 'Sher-e-Bangla Nagar', '2020-02-17 13:11:29', '2020-02-17 13:11:50'),
(42, 1, 1, 'Tejgoan Industrial Area', '2020-02-17 13:12:33', '2020-02-17 13:12:33'),
(43, 1, 1, 'Tejgaon', '2020-02-17 13:12:49', '2020-02-17 13:12:49'),
(44, 1, 1, 'Uttara (East)', '2020-02-17 13:13:25', '2020-02-17 13:13:25'),
(45, 1, 1, 'Uttara (West)', '2020-02-17 13:13:40', '2020-02-17 13:13:40'),
(46, 1, 1, 'Uttarkhan', '2020-02-17 13:13:55', '2020-02-17 13:13:55'),
(47, 1, 1, 'Bhashantek', '2020-02-17 13:14:12', '2020-02-17 13:14:12'),
(48, 1, 1, 'Vatara', '2020-02-17 13:14:26', '2020-02-17 13:14:26'),
(49, 1, 1, 'Wari', '2020-02-17 13:14:41', '2020-02-17 13:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobileVarified` int(191) NOT NULL DEFAULT 0,
  `isVerified` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `referral_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int(191) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `mobileVarified`, `isVerified`, `image`, `gender`, `password`, `token`, `user_id`, `referral_code`, `referral_link`, `points`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Name', 'mremail@gmail.com', '12345678910', 0, 0, NULL, 'Male', '$2y$10$yVsTKOomZy/5blqQNFjzkO3f/iWroiNsvmRdApUSFBQWn5fT3epPu', 'qUc3DTfeIT', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-17 22:26:51', '2020-02-17 22:26:51'),
(2, 'Arman Rakib', 'rakib@gmail.com', '01747473856', 0, 0, NULL, 'male', '$2y$10$O0IBIjUngDZInMF51ifNxeEx5Vx8is4agzCbxvc8/XifRhxEjqPJW', '93Nu8HVGTH', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-17 22:29:43', '2020-06-28 16:46:10'),
(3, 'Ripo', 'ripo@gmail.com', '01840210515', 0, 0, NULL, 'Male', '$2y$10$VoNxGIRJOXDIxCms8cXgQuTCWIb1TQDHFd36/rq3vX2po774BP2vi', 'gUDZi7I5OG', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-17 23:19:04', '2020-02-17 23:19:19'),
(4, 'Mahtab tareq', 'gmtareq2014@gmail.com', '01973438885', 1, 0, NULL, 'Male', '$2y$10$tcXuG.fFRokSSlQXsNqbQOOIcFBCmo2M4TBpn625HGAIsb6ev3qQi', 'ntMSY5RIbm', NULL, '8520', NULL, 10, NULL, NULL, '2020-02-18 08:37:13', '2020-10-16 15:42:47'),
(5, 'Meg Hassan', 'meg@gmail.com', '01732325740', 0, 0, NULL, 'Female', '$2y$10$Zrc8WCs8QrDPPLflygq.1.o7H8NHKy7ij7pp2jBEl8Imhcide/Z1e', 'HygpKA30AW', NULL, '4817', NULL, 0, NULL, NULL, '2020-02-18 10:42:49', '2020-06-30 18:41:46'),
(6, 'Arman Rakib', 'armanrakib@gmail.com', '01401592610', 1, 0, NULL, 'Male', '$2y$10$bpsUTGtBDcnSDVWNmHO6S.E3fWy.NR4VPL7bub4bZApZcNunX1BUW', 'BvEeFTjCVg', NULL, '7714', NULL, 0, NULL, NULL, '2020-02-18 13:07:13', '2020-10-23 10:54:09'),
(7, 'rakib', 'ra@gmail.com', '01932132132', 0, 0, NULL, 'Male', '$2y$10$gRqbYqPkXRrTMkVR7GkBeuYaWBhAc6qH262u4JGiCJvoEocMyOqqO', 'HIppISWFr5', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-22 08:35:27', '2020-02-22 08:35:38'),
(8, 'Raju Real', 'raju@gmail.com', '01947319692', 0, 0, NULL, 'Male', '$2y$10$EPJUOJd/EOdmj8xJ0aY/veM8bv4Wsat1a1/roX7BWw5NDAZc71OD.', '1B10pno23h', NULL, '3162', NULL, 0, NULL, NULL, '2020-02-22 23:04:56', '2020-07-01 19:08:49'),
(9, 'Yasin Arafat', 'yasin.arafat90@gmail.com', '01511149398', 0, 0, NULL, 'Male', '$2y$10$PFjNZSSHI0vcaVBvGvFmtuLu5m.cMqcrPoRp0a.2eRIHRi9NA0SQ.', '4fDHUb8LcA', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 02:45:05', '2020-06-21 19:27:44'),
(10, 'Faruk', '2012omarfaruq@gmail.com', '96594911318', 0, 0, NULL, 'Male', '$2y$10$uirplbBueVnJCRF9R/7DAOUcwfUhUxcECoR44afa3bu6.VBy.xcg.', 'Cy7yO2WAJ9', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 03:05:09', '2020-02-23 03:05:43'),
(11, 'সানি', 'sani@inflatablesmaster.com', '01961225957', 0, 0, NULL, 'Male', '$2y$10$mFXp7mnw59TVAok5KAVVS.gEp0XOMqcZOh.PzJBBM4MbPO8U0k/bK', '7ekJ8kjpi2', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 03:10:09', '2020-02-23 03:10:19'),
(12, 'Sujan das', 'sujandasrupshi@gmail.com', '01515247719', 0, 0, NULL, 'Male', '$2y$10$rylbtq9tynLtVuWql2Z5XOc3AsZryg5mNv1SloE7pxghSltATKUPC', 'VcwMDNmDlR', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 03:11:21', '2020-02-23 03:11:44'),
(13, 'Saiful islam', 'saiful.vat2018@gmail.com', '01710868792', 0, 0, NULL, 'Male', '$2y$10$ks9cwbeYjgFn4TjcyDOvtuH09jnXogxmcoVQ3ZJkRIMlkhVlTMS6W', '0uonWGRBXu', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 03:15:31', '2020-02-23 03:16:17'),
(14, 'Rabbi Yusuf', 'rabbiyusuf2953@gmail.com', '01717539538', 0, 0, NULL, 'Male', '$2y$10$ujH.ihfenuukBePmlMpyW.AZqoD4v99NYUrlA7iKD3UQF1WHFBMGq', 'ekyAeSgy0h', NULL, '1418', NULL, 0, NULL, NULL, '2020-02-23 06:21:43', '2020-11-02 01:37:31'),
(15, 'S M Sawon', 'sawonboy0@gmail.com', '01722642874', 0, 0, NULL, 'Male', '$2y$10$GSwaYA.g.P9LSrUJ4jzvn.2LHuXhPkAjWje0VTg4flUvB0UnsjiAq', '4Tj2yFFQZb', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 08:58:54', '2020-02-23 08:59:27'),
(16, 'Jaheer Hussain', 'jaheed.dk@gmail.com', '01575033476', 0, 0, NULL, 'Male', '$2y$10$DA5kkSjx2W1tt8PUo/TpWuM/fSinf6a/DBDmJhZN91PRQ8aPORO32', 'EDqE5J1DhQ', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-23 10:16:51', '2020-02-23 10:17:11'),
(17, 'surjee', 'sunbangla@gmail.com', '01911762584', 0, 0, NULL, 'Female', '$2y$10$4OR/H.mao0.j3wHFPgmkiOB32aZFXmdhl/AGOEcxCPL8BWzrBd7Bu', 'cU6jZZCvJK', NULL, NULL, NULL, 0, NULL, NULL, '2020-02-25 08:50:26', '2020-02-25 08:50:41'),
(18, 'fatimatoz johora', 'bhairobi14@yahoo.com', '01870670113', 0, 0, NULL, 'Female', '$2y$10$xz6w8WoGyMc6ycU8sCDqMOY6JcAlNBkh1ZFVXxrE9eroXaZ.SO6Xa', 'O6h462WREP', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-09 12:28:30', '2020-03-09 12:31:24'),
(19, 'Noor', 'noor@gmail.com', '01774162144', 0, 0, NULL, 'Male', '$2y$10$sxvPz/RSPGbVaOGMUJzvVetS8GKwsC7OENnJFCeODeel9txW0y0iq', 'z2ij3DohGp', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-12 12:14:34', '2020-04-01 05:37:40'),
(20, 'antor', 'khondoker.antor@gmail.com', '+8801921737117', 0, 0, NULL, 'Female', '$2y$10$zA3ocN1rZJdvti30E0NS5eWtOvr9VHNi9fejxGHebKmTW/0Wcwcm6', 'ipDze2qCon', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-15 10:28:12', '2020-03-18 11:54:24'),
(21, 'Tahera Tamanna', 'tahera.tamanna@gmail.com', '01715001895', 0, 0, NULL, 'Female', '$2y$10$2E6GrooG7mYr6fIrMaWGAO09UJk4RkkKpH5G9pYMnIqjVkMM.D7iC', 'a7E7IoESQp', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-17 10:27:55', '2020-03-17 10:28:12'),
(22, 'Shams Arefin Saikat', 'shamsarefin.bd@hmail.com', '01784603179', 0, 0, NULL, 'Male', '$2y$10$/E/hHHdJNB2lJUdWwl4e0etOaPbG6M6SR5VsENLNwZjXn/5TyQ8NS', 'fm024Gdbex', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-18 01:35:11', '2020-03-21 10:15:39'),
(23, 'Syeda Oishi', 'syedaoishi9@gmail.com', '01929037357', 0, 0, NULL, 'Female', '$2y$10$x1e.bJ0MFCRFNPaI0XAJyOWqkLucdrDCj61DrEb4jJYLMWIeOLVTy', 'MrWms32tIp', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-18 02:28:02', '2020-03-18 02:28:23'),
(24, 'Janifar Yeasmin', 'urme92.ru@gmail.com', '01763211822', 0, 0, NULL, 'Female', '$2y$10$lD61ON6ueaXl6agcixswmOtGiJgdyXA8EwiYdpKVs1rgvUjsve39a', 'xL7O5doIKK', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-19 05:44:44', '2020-03-19 05:45:17'),
(25, 'Nur Alom', 'nuralom93@gmail.com', '01958133522', 0, 0, NULL, 'Male', '$2y$10$20AXty8m2RZ5qdUFMhYGAOEPViipgXI5CsyjizpO1TyKZzUpVFATW', 'WV7nVt68IH', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-19 12:23:35', '2020-03-19 12:23:54'),
(26, 'sohel Rana', 'sohel.rana@gmail.com', '01754728292', 0, 0, NULL, 'Male', '$2y$10$rKzcUB2gqc55.p7EgQupme5KXylcY/CE3YWgZdhXvhJpZRzMEcxW2', 'ngTCJWCVHa', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-21 02:20:45', '2020-03-21 02:20:59'),
(27, 'Meer', 'dadarakib@gmail.com', '01711029839', 0, 0, NULL, 'Male', '$2y$10$lpiKSs/xuSErMxrAmfc0HOGP5yrcv8H6UmvtlPN3vN4ZCoQV9KzyO', 'ZVMKv9h5Cn', NULL, NULL, NULL, 0, NULL, NULL, '2020-03-25 03:47:31', '2020-03-25 03:47:44'),
(28, 'Sanjida Haseen', 'sanjida22haseen@gmail.com', '01706681856', 0, 0, NULL, 'Female', '$2y$10$ImuZ5XexWxvhVZSTOjSfCuweLj.VAkNwMv3sgnWffGSjKEn.JRVOG', 'u0tUz4OfjM', NULL, NULL, NULL, 0, NULL, NULL, '2020-04-11 02:59:30', '2020-04-11 02:59:53'),
(29, 'ashik', 'ashik.bcl@gmail.com', '01709651235', 0, 0, NULL, 'Male', '$2y$10$bBICbSYA1iOUd34yzF.YoeGVnOf3MglmA4eH.vwNdWAy4RfEYUCQy', 'XURpLrRIb3', NULL, NULL, NULL, 0, NULL, NULL, '2020-04-16 22:00:38', '2020-04-16 22:00:51'),
(30, 'miftahul jannat', 'jannatmeftahul58@gmail.com', '01315907658', 0, 0, NULL, 'Female', '$2y$10$jsH9jCoFXxhngmPJUXNO1eO2FqDzdYVRIRUbE9DpaXZgE/zhRLHHW', 'wD6dISo4CJ', NULL, NULL, NULL, 0, NULL, NULL, '2020-04-17 20:29:27', '2020-04-17 20:29:50'),
(31, 'Abdul Malek Rubel', 'amalakfeni@gmail.com', '01840112265', 0, 0, NULL, 'Male', '$2y$10$AmPu78VfyGPzsRnBaIQqO.5Y2gV/rMHi2awPGpsZYLIS7HBhVcoc2', 'uoG77IPno0', NULL, '3522', NULL, 0, NULL, NULL, '2020-04-20 21:53:07', '2020-04-20 21:53:31'),
(32, 'sabbor', 'nimeplan@gmail.com', '01670762671', 0, 0, NULL, 'Male', '$2y$10$nbEIquvUxbVGnozT8KcLRuPwqVuTp20DisuUyvJAL7w8hXhCjpECS', 'aZEp6NK2hN', NULL, '7150', NULL, 0, NULL, NULL, '2020-04-25 14:21:05', '2020-04-25 14:21:21'),
(33, 'aminul', 'aminul10302160@gmail.com', '01814477899', 0, 0, NULL, 'Male', '$2y$10$2E76GqEVzKJsGDbxCgjJyeeZtPp1g1uZGCwTh.Gcn5VPkL3ZX.qB6', 'aJsteO6BDc', NULL, '5179', NULL, 0, NULL, NULL, '2020-04-30 13:51:26', '2020-04-30 13:51:58'),
(34, 'Tarana Ferdous Karim Udoy', 'tarana.ud30@gmail.com', '01714075508', 0, 0, NULL, 'Female', '$2y$10$Mk20NI3qyeXeXFb69FyZcuPGw86mdjMgwlY4mx8DtbJuzC2Q.Bfqy', 'CUV5IrEwHh', NULL, '4745', NULL, 0, NULL, NULL, '2020-04-30 15:21:23', '2020-04-30 15:22:10'),
(35, 'arif emon', 'amemon1981@gmail.com', '01713453163', 0, 0, NULL, 'Male', '$2y$10$t6mLYmRlFQu8Z5kw2dmSaewncJVownVqfDTovye4fiLs9lLvo8s52', 'XRWwM7bgOh', NULL, '7244', NULL, 0, NULL, NULL, '2020-05-09 18:42:46', '2020-05-09 18:45:02'),
(36, 'Arif Khokon', 'arifkhokon45@gmail.com', '01915051370', 0, 0, NULL, 'Male', '$2y$10$fwlYSsGXJpnBLGhbBk2s0.DPYDbRJGgThlwT52Bp74GOQzLF1BGHK', 'L854oLqIyP', NULL, '5821', NULL, 0, NULL, NULL, '2020-05-12 06:20:28', '2020-05-12 06:22:15'),
(37, 'Barsha', 'nondinilaw@gmail.com', '01778600808', 0, 0, NULL, 'Female', '$2y$10$giARBP3nn3GAgzU.NyOYsOwJk1V2nicK5asuV8wdmHTY5H6OBGXk6', 'ps9pXnHztt', NULL, '2776', NULL, 0, NULL, NULL, '2020-05-18 17:25:27', '2020-05-18 17:25:43'),
(38, 'zahid', 'zahideee097@gmail.com', '01777736487', 0, 0, NULL, 'Male', '$2y$10$jNIzDHrglY7pphZG3BjbS.HV3uQ.v2wB6gcd00wKTTx.JmzcAYTkK', 'LWJNNaJEGY', NULL, '8052', NULL, 0, NULL, NULL, '2020-06-04 01:10:15', '2020-06-04 01:10:47'),
(39, 'A R Emon', 'aremon.me@gmail.com', '01851130620', 0, 0, NULL, 'Female', '$2y$10$zTCJCtK8rgC5VGN.yvOa.uL8PJKmZGez15Gg0r4kVU97a3jpCO4lG', 'mQjtcA447H', NULL, '4956', NULL, 0, NULL, NULL, '2020-06-07 13:48:58', '2020-07-02 17:08:46'),
(40, 'Md. Mazharul Islam', 'jony007ex@gmail.com', '+8801700799353', 0, 0, NULL, 'Male', '$2y$10$Vxs10egxIW.BT92TcuBEYe0wtSbhmQ6HBS5WXPDUzQUK8Qi0Bg/Zm', '1zswIWBiHj', NULL, '8678', NULL, 0, NULL, NULL, '2020-06-11 20:41:11', '2020-06-11 20:41:11'),
(42, 'Ahsanul Islam', 'ahsanul1230@gmail.com', '01715089099', 0, 0, NULL, 'Male', '$2y$10$frhXN9SRBihfxmhNjUimCet6f7Zi2QoeZH3aODodoKHb65n7knEgK', 'jk8H30GkGj', NULL, '8289', NULL, 0, NULL, NULL, '2020-06-17 13:25:39', '2020-08-23 15:07:59'),
(43, 'Bithy', 'kamrunnaharbithy1990@gmail.com', '01722946766', 0, 0, NULL, 'Female', '$2y$10$y04qiOS9ifkDsQUkNBpz5OnY60lHkOFyblvWYKbeTS.WN/GDXicMy', 'T2nApi2oYS', NULL, '5886', NULL, 0, NULL, NULL, '2020-06-24 18:41:36', '2020-06-24 18:42:13'),
(45, 'check', 'm@gmail.com', '54125987452', 0, 0, NULL, 'Male', '$2y$10$RjgOYKijw3.K8Jd58k2G4OgdJt73w4glOa7DwJfP2Su/oZkjaRubC', 'cH0SE1e8Pq', NULL, '8376', NULL, 0, NULL, NULL, '2020-06-28 20:47:55', '2020-07-01 18:29:07'),
(46, 'Rakib Arman', NULL, '01747473855', 0, 0, NULL, NULL, '$2y$10$ry7TvHnkaIe.kngL8.WMHOH5XwKiFJeuAdyvE.i4ChGu4dDNC9Bo6', '1udHhwbMmd', NULL, '5411', NULL, 0, NULL, NULL, '2020-06-28 22:04:50', '2020-07-19 20:01:35'),
(47, 'Ripo Hasan', NULL, '01732326565', 0, 0, NULL, NULL, '$2y$10$9mD4tZWvFQxgfSMmdegPGOGRMOCbM5zd4calSp9kwXcZ1on1M1PdW', 'KafFyzoo3O', NULL, '9331', NULL, 0, NULL, NULL, '2020-06-29 00:14:48', '2020-06-29 00:14:59'),
(48, 'Test', NULL, '01401592611', 0, 0, NULL, NULL, '$2y$10$JevP0lxWd5zJzxovSzTE1uSIiCWkrGyKtn6PQ1sLXGi4dDH7VnIBi', 'qomhviB8iF', NULL, '2130', NULL, 0, NULL, NULL, '2020-07-01 13:46:48', '2020-07-01 13:46:48'),
(49, 'Test Test', NULL, '01711187171', 0, 0, NULL, NULL, '$2y$10$iGN4nh6j3kJX2hW7/Upj0OPecNUSpuLZDFm8MuW0JRQSJwFjyl9x6', 'Wpa4LxvGFZ', NULL, '4622', NULL, 0, NULL, NULL, '2020-07-01 13:50:21', '2020-07-01 13:50:21'),
(50, 'Test', NULL, '01767293697', 0, 0, NULL, NULL, '$2y$10$0GaXiZOReEbRJOOFQNMlpejYKRYWTcVps7QDaoru4qkkutiG6Ai9W', '7NCHHeVSfr', NULL, '4771', NULL, 0, NULL, NULL, '2020-07-01 18:30:44', '2020-07-01 19:51:59'),
(51, 'Test', NULL, '01401123456', 0, 0, NULL, NULL, '$2y$10$3mgDLQmWqV4GI6.UYbkHFeigHSbYBoD49M1E4GFFmOR7M5XUqfFx.', 'sKEYHvrBMu', NULL, '4245', NULL, 0, NULL, NULL, '2020-07-01 18:37:35', '2020-07-01 18:37:35'),
(52, 'Test', NULL, '01767293698', 0, 0, NULL, NULL, '$2y$10$uITZWftrDHk.lAezJBe/POcQrY91l8PFxoNQ6vWQrwAk8ZA1G6wc.', 'rRhP6lzkGp', NULL, '4592', NULL, 0, NULL, NULL, '2020-07-01 18:42:15', '2020-07-01 18:45:35'),
(53, 'Xhe', NULL, '01789652369', 0, 0, NULL, NULL, '$2y$10$orvdzx0CN.1Jcpcy8vaKFOMLw3L93gnUUzdafLGrrI.3I2GQ844ku', 'DKPqaxT5lt', NULL, '1015', NULL, 0, NULL, NULL, '2020-07-01 19:01:00', '2020-07-01 19:02:28'),
(54, 'Check Test', NULL, '01812345678', 0, 0, NULL, NULL, '$2y$10$tC89Rup7K6tf78551CV8g.6z/8qkAWFKnmRhm0aJqVDQmLJvekI16', 'uNzLMvKyjj', NULL, '5245', NULL, 0, NULL, NULL, '2020-07-01 19:17:46', '2020-07-01 19:18:02'),
(55, 'Nazmul Huda', NULL, '01867801220', 0, 0, NULL, NULL, '$2y$10$MQtEtiE/8mlcQZMlZ1xgje9Gb2G1q7HY5Aw0V26LlQ4r1aEKig0Y.', 'GZEpD8ZSIf', NULL, '6971', NULL, 0, NULL, NULL, '2020-07-07 11:35:17', '2020-07-07 11:35:34'),
(56, 'tanim.mariner@gmail.com', 'tanim.mariner@gmail.com', '01674691936', 0, 0, NULL, NULL, '$2y$10$q059w6tzPxpqhV1gUroQ6uqpO55/WwGIq4D87YG1duzdF3v3M9yOS', 'WtMCFagdiZ', NULL, '6015', NULL, 0, NULL, NULL, '2020-07-07 18:42:25', '2020-07-07 19:01:59'),
(58, 'Nahid Iqbal', 'example@gmail.com', '01784210303', 0, 0, NULL, NULL, '$2y$10$Htzq0OVeqZOm/DOvQwpKGulI5KC4k5XzwKFM9oW4ifHY2n8MsqM66', 'Ow5f5wX4WE', NULL, '6078', NULL, 0, NULL, NULL, '2020-07-08 21:05:43', '2020-07-16 20:22:51'),
(59, 'Nayeef Quadir', NULL, '01670818626', 0, 0, NULL, NULL, '$2y$10$pSB3xQlfXG9KuAz75/ZxoeTdFikMX79k.sJnOX5ZqdFmd7FE12X4C', 'NkFtzfDVkk', NULL, '2546', NULL, 0, NULL, NULL, '2020-07-08 23:29:19', '2020-08-28 21:13:25'),
(60, 'mutad', NULL, '01817072006', 0, 0, NULL, NULL, '$2y$10$Vo5Sje06RSREgXM7e1nU6OXlbvo6iyy6fkr8uqbaFCLmXhx86gm5C', 'rAQ6Edf6Fi', NULL, '1587', NULL, 0, NULL, NULL, '2020-07-10 20:39:55', '2020-07-10 20:40:06'),
(61, 'Md Hasan Mollah', NULL, '01773797416', 0, 0, NULL, NULL, '$2y$10$mDC44HTe261JiwfG6m3rh./ckxRMWvFyex141NhmsWlpRDBso8b0q', '5PGT6cox8B', NULL, '9252', NULL, 0, NULL, NULL, '2020-07-11 15:17:32', '2020-07-11 15:18:00'),
(62, 'gdhfgfgg', NULL, '017246895889', 0, 0, NULL, NULL, '$2y$10$BigOF3IwQHHS8NkWT7p4mur85ZBGSadZaPZkayp2GVQ2X6VYINxc2', '827v5TLKRo', NULL, '1936', NULL, 0, NULL, NULL, '2020-07-12 14:47:59', '2020-07-12 14:47:59'),
(63, 'rjfhu', NULL, '12345678954', 0, 0, NULL, NULL, '$2y$10$f7PWBIr92.UIBBrzORvnXOL7e91EOEdewlUGQ2i4k5Do2ocSlqd/6', 'd5tNlYO1Qt', NULL, '5061', NULL, 0, NULL, NULL, '2020-07-12 14:48:41', '2020-07-12 14:48:53'),
(64, 'wajed', NULL, '01721195353', 0, 0, NULL, NULL, '$2y$10$u3kl7SrQKEFKyjoPqYzyYu85DR59.H4kyTAMIa/msQVEz1wNaf94.', 'cZ82vlJDlL', NULL, '3273', NULL, 0, NULL, NULL, '2020-07-15 21:20:09', '2020-07-15 21:20:23'),
(65, 'Raju Real', 'rajureal21@gmail.com', '01609605494', 1, 0, '1594841265fiver3.png', 'Male', '$2y$10$cCFzcFIwcRAyC4M1IVR0Xen2BcDUvgIEFhOigS23RrGbt5MTz3pka', 'eEtW0OhwOs', NULL, '7627', NULL, 0, NULL, NULL, '2020-07-15 23:27:06', '2020-11-03 23:35:32'),
(66, 'fatimatoz johora', NULL, '01989646557', 0, 0, NULL, NULL, '$2y$10$nYCulZ61w6LT.unm4Mhcfuq8Hyau6QnoSHTIKFqTsYgAvvbkmGktG', 'b2Uwcf8xAD', NULL, '8577', NULL, 0, NULL, NULL, '2020-07-18 17:23:12', '2020-07-18 17:23:31'),
(67, 'MOHAMMAD MOHIUDDIN', NULL, '01717059787', 0, 0, NULL, NULL, '$2y$10$j0Kfg8tPL4z6evEV7VknReoaUCJ3flv9Td0/hz36d0OEh7c5cBrwO', '9CgPdnbtjv', NULL, '1857', NULL, 0, NULL, NULL, '2020-07-20 23:08:21', '2020-07-20 23:08:50'),
(68, 'Moksuda Doly', NULL, '01534343480', 0, 0, NULL, NULL, '$2y$10$MKDfZNTVUQijKQu4cssN3.JHehPnNF10OvgWri2sTncwS6Y1tsp.W', 'CZeZj3nkZm', NULL, '3348', NULL, 0, NULL, NULL, '2020-08-06 10:53:37', '2020-08-06 10:53:53'),
(69, 'imrul', NULL, '01672320145', 0, 0, NULL, NULL, '$2y$10$8aOOAho2Pqd/w1zgEXSNluaYj0bQ6WbZYVpRA27n2dY2S8AzCxZ5m', 'EqS209PvbI', NULL, '2944', NULL, 0, NULL, NULL, '2020-08-07 18:03:58', '2020-08-07 18:04:51'),
(70, 'Rony', NULL, '+8801678352205', 0, 0, NULL, NULL, '$2y$10$QU.7DY0RUBDk/NmDThWMQ.n02ZwTQUW2wI/oFMZKM6kNlcwxSCoA6', 'aYgLrFFHJP', NULL, '8493', NULL, 0, NULL, NULL, '2020-08-12 17:53:33', '2020-08-12 17:53:33'),
(71, 'Rony', NULL, '01678352205', 0, 0, NULL, NULL, '$2y$10$FQI5MKUVwPKxs7TWe5WuZuaJPj0rG1agJ4y6uDS8ePg.6BdVWliXy', 'A516DIgm5k', NULL, '2461', NULL, 0, NULL, NULL, '2020-08-12 17:56:09', '2020-08-12 17:56:20'),
(72, 'Shamima Nasrin', NULL, '01993058335', 0, 0, NULL, NULL, '$2y$10$LghDvgklTKrlCBnLTwT3dek73gqqUSCvWay2pOgVeQgU9.W8x/anO', 'iou2M9ewrC', NULL, '5421', NULL, 0, NULL, NULL, '2020-08-15 08:16:33', '2020-08-15 10:52:54'),
(73, 'Imran hossen', NULL, '01771474040', 0, 0, NULL, NULL, '$2y$10$VRwzItlmqJte9dZquRvk6ux3cdgd609p7OngXuRD4uwIEjppscFGO', 'FlXaOeS2ik', NULL, '1911', NULL, 0, NULL, NULL, '2020-08-18 21:54:10', '2020-08-18 21:54:30'),
(75, 'Md Ataul Goni Rabbani', NULL, '01722360564', 0, 0, NULL, NULL, '$2y$10$KPEeXNwdL9FSEz8LZXQZoeVJizaZ8xGQzex36s1ZM7yuJNEi8ePny', 'bDJHB0nPyS', NULL, '6917', NULL, 0, NULL, NULL, '2020-08-22 08:33:42', '2020-08-22 08:33:54'),
(76, 'Moznur Rahman', NULL, '01726686085', 0, 0, NULL, NULL, '$2y$10$BQoofBTMpmCF365Bj9w9jesVPoOcFP.Szp8PT2nFxyx0TvZOo3Y4K', 'IU5ck7IUBH', NULL, '7094', NULL, 0, NULL, NULL, '2020-08-22 12:52:42', '2020-08-22 12:54:28'),
(77, 'Md.Abadul Hoq', NULL, '01836341914', 0, 0, NULL, NULL, '$2y$10$nfk4/TbUkuGKjduHlSszge07AZRIZ9DHEtxae4QEuUTbks.P2Lz7m', '60yv0154bj', NULL, '2163', NULL, 0, NULL, NULL, '2020-08-22 13:58:55', '2020-08-22 14:04:18'),
(78, 'Imran Ahmed', NULL, '01610005901', 0, 0, NULL, NULL, '$2y$10$qcAOmxBxA6OVCYsUfjsTUuMg32CaDQXDEwLpNmmygvebKcp1gJ4B6', 'xRytREKNY5', NULL, '9175', NULL, 0, NULL, NULL, '2020-08-23 01:14:05', '2020-08-24 08:14:53'),
(79, 'Shetu', NULL, '01922329595', 0, 0, NULL, NULL, '$2y$10$/i34Q/KkPijLBqRHRRfYOOYqnrlwxRpI8vzBV4ZGOq37jpTGP4MOu', '5nRajVxRvD', NULL, '1279', NULL, 0, NULL, NULL, '2020-08-23 14:47:52', '2020-08-23 14:48:40'),
(80, 'Sourav', NULL, '01595002591', 0, 0, NULL, NULL, '$2y$10$1wqCcILYQ792TsUcTLNIH.Nqp/EEL9XFZ5XQIk1SuMXF75G/SrkUS', 'HP7p5IQJUJ', NULL, '4027', NULL, 0, NULL, NULL, '2020-08-24 19:16:59', '2020-08-24 19:17:11'),
(81, 'sajal', NULL, '01688036707', 0, 0, NULL, NULL, '$2y$10$/3d5Nq1pUhePrYceeprNheiFkGxi98zqqzfv3CwIR6OFMCc9wTkNi', 'BkXbe5O9aA', NULL, '7155', NULL, 0, NULL, NULL, '2020-08-25 16:11:41', '2020-08-25 16:13:48'),
(82, 'Md. Raju', NULL, '01737773393', 1, 0, '1598449111fiver3.png', 'Male', '$2y$10$x.oy5BDw2WjSbLvhBg0TkOgJoStDAygW/YJARImsrMyOOjsB5T.xq', 'UE3oTvxInh', NULL, '4231', NULL, 0, NULL, NULL, '2020-08-26 17:33:35', '2020-08-26 17:38:32'),
(83, 'Hajifur Rahman', NULL, '01711082551', 1, 0, NULL, NULL, '$2y$10$NLTJGJhR8yczqSXWNbh61u1g3/GLAK7gMIZGVn6apqE6n.lgc83Sy', 'NCNXXWDvGf', 4, '9286', NULL, 0, NULL, NULL, '2020-08-27 23:45:36', '2020-09-09 19:42:20'),
(84, 'Saif Haque', 'saif. Haque2009@gmail.com', '01793597110', 1, 0, NULL, 'Male', '$2y$10$8p9rwqHDAudIUabGgQtpTOh/xUy5Mi4eNRVAHLICDolnr2zVIcy2u', 'RfwLRlqbMk', NULL, '2511', NULL, 0, NULL, NULL, '2020-08-28 21:27:11', '2020-08-28 21:35:54'),
(85, 'Abdullah Sayeed Anowar', NULL, '01747497884', 0, 0, NULL, NULL, '$2y$10$EtI1g/t1IjGpdYxgOHY/3eNm5DGQA1vUGigRsYQ4Z11wqiiL2CuvC', '28xxkjIjpg', NULL, '1904', NULL, 0, NULL, NULL, '2020-08-29 10:45:48', '2020-08-29 10:46:47'),
(86, 'egrocery', NULL, '01851939913', 1, 0, NULL, NULL, '$2y$10$3ulKNz/iJkEGG88pe30.X.tuSDbVl3aLZzI6ruSwKzE6tQg5DXbZ2', 'fmiuDoebC8', NULL, '5104', NULL, 0, NULL, NULL, '2020-08-29 16:54:20', '2020-08-29 16:54:59'),
(87, 'Aman', NULL, '01648901233', 1, 0, NULL, NULL, '$2y$10$I1kLA1lkKWKmHq141DZth./lvP89PGUx6sccM8dIM7hJZMUEUa4mK', '76pLfHF9uu', NULL, '5227', NULL, 0, NULL, NULL, '2020-08-30 14:36:47', '2020-08-30 14:37:09'),
(88, 'Habib Ahsan', NULL, '01740074754', 1, 0, NULL, NULL, '$2y$10$rb3NIsCHx8eC6ObFvpNwyu/ef8BcgBJXPihyoIkdNpDB8wOkdWZ9i', 'f8Z92PIH7r', NULL, '3338', NULL, 0, NULL, NULL, '2020-08-31 07:14:45', '2020-08-31 07:17:57'),
(89, 'Pablu Parvez', NULL, '01716204836', 1, 0, NULL, NULL, '$2y$10$81idfscyupXF08Cuhnh0seWQZQlfZUFYqvnnZCSZVfU.nQ480ZkpC', 'lBa4pBVdVE', NULL, '8996', NULL, 0, NULL, NULL, '2020-09-01 07:13:04', '2020-09-01 07:14:00'),
(90, 'mustakimmia397496@gmail.com', 'mustakimmia397496@gmail.com', '01918574496', 0, 0, NULL, NULL, '$2y$10$tm3kPTP2viJh.MbDNUOmiOswNi1PhRIicNFekglmxEQBs833koVFC', 'xLhkuZxiJr', NULL, '9722', NULL, 0, NULL, NULL, '2020-09-02 21:45:45', '2020-09-02 21:46:44'),
(91, 'Urmi', NULL, '01844556633', 0, 0, NULL, NULL, '$2y$10$UNpO7BbgDcdLxM063h3fV.N30DpD1y9OuYM4GzL32zUi7ZDf9RSuW', 'qV6nhfiVUz', NULL, '2372', NULL, 0, NULL, NULL, '2020-09-03 11:35:46', '2020-09-03 11:36:03'),
(92, 'Tanvir Abdullah', NULL, '01711085988', 0, 0, NULL, NULL, '$2y$10$NhsiLPMr7SJy.urOqIBn5.GCZjMVbZM.zEl19OZsa79CzZ645iLh2', '5fBiioO1HN', NULL, '3907', NULL, 0, NULL, NULL, '2020-09-08 01:50:38', '2020-09-08 01:51:04'),
(93, 'MD.Ariful Islam', NULL, '01911259281', 0, 0, NULL, NULL, '$2y$10$8bEKLjonbDDPOJbXCxyRm.W2ynytdl/adeQPFtuBFThUbQDsjuhcC', 'CAAPnzNlEd', NULL, '4153', NULL, 0, NULL, NULL, '2020-09-13 21:49:15', '2020-09-13 21:49:36'),
(94, 'rimi', NULL, '01875220618', 0, 0, NULL, NULL, '$2y$10$Z9jiX57r51XiGSRiqUJFfuKm93BUVNG4u9MSL8xO1FNqQCsuOOBom', 'KCEpWeqFCp', NULL, '8659', NULL, 0, NULL, NULL, '2020-09-15 23:23:29', '2020-09-15 23:23:56'),
(95, 'shayla sharmin shimu', NULL, '01958389022', 0, 0, NULL, NULL, '$2y$10$nKS4jQR3DeJtKsl6h6DwkOsjoH9ytHFW8RIrhnbtWa8s1ApNJJaKe', '4kaQXsG39x', NULL, '5563', NULL, 0, NULL, NULL, '2020-09-22 15:14:11', '2020-09-22 15:14:24'),
(96, 'Moin Uddin', NULL, '01819044281', 0, 0, NULL, NULL, '$2y$10$w5nwCp3dPs1GNUtHmiI8wOuShI/FG9g8hLaPfVt9hA9MFQBEKc/c6', 'Xj7iLU0PGn', NULL, '8855', NULL, 0, NULL, NULL, '2020-10-02 07:52:50', '2020-10-02 07:53:41'),
(97, 'Shohel', NULL, '01918033882', 0, 0, NULL, NULL, '$2y$10$4KkXwGkDm0fJZQHrXVJN4ugbgtieEpnGEkqTV14lOZiYEIwVZPDbi', 'oEp4tK8glm', NULL, '9113', NULL, 0, NULL, NULL, '2020-10-12 06:59:52', '2020-10-12 07:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `weeklyoffers`
--

CREATE TABLE `weeklyoffers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `offer_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weeklyoffers`
--

INSERT INTO `weeklyoffers` (`id`, `admin_id`, `product_id`, `start_date`, `end_date`, `offer_price`, `created_at`, `updated_at`) VALUES
(26, 1, 58, '2020-07-08 00:00:00', '2020-07-14 00:00:00', 650.00, '2020-07-07 23:40:03', '2020-07-07 23:40:03'),
(27, 1, 910, '2020-07-08 00:00:00', '2020-07-14 00:00:00', 1450.00, '2020-07-07 23:40:27', '2020-07-07 23:40:27'),
(28, 1, 914, '2020-07-08 00:00:00', '2020-07-14 00:00:00', 750.00, '2020-07-07 23:40:53', '2020-07-07 23:40:53'),
(29, 1, 700, '2020-07-08 00:00:00', '2020-07-14 00:00:00', 110.00, '2020-07-07 23:41:38', '2020-07-07 23:41:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `bazarlists`
--
ALTER TABLE `bazarlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buynows`
--
ALTER TABLE `buynows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_products`
--
ALTER TABLE `color_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `coupon_users`
--
ALTER TABLE `coupon_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `franchies`
--
ALTER TABLE `franchies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giftaddresses`
--
ALTER TABLE `giftaddresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeaddresses`
--
ALTER TABLE `homeaddresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_products`
--
ALTER TABLE `image_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modifylists`
--
ALTER TABLE `modifylists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officeaddresses`
--
ALTER TABLE `officeaddresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice` (`invoice`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_users`
--
ALTER TABLE `order_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `populars`
--
ALTER TABLE `populars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotionproducts`
--
ALTER TABLE `promotionproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellingreports`
--
ALTER TABLE `sellingreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliderproducts`
--
ALTER TABLE `sliderproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todyoffers`
--
ALTER TABLE `todyoffers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `users_token_unique` (`token`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  ADD UNIQUE KEY `users_referral_link_unique` (`referral_link`);

--
-- Indexes for table `weeklyoffers`
--
ALTER TABLE `weeklyoffers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bazarlists`
--
ALTER TABLE `bazarlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `buynows`
--
ALTER TABLE `buynows`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color_products`
--
ALTER TABLE `color_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupon_users`
--
ALTER TABLE `coupon_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `franchies`
--
ALTER TABLE `franchies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `giftaddresses`
--
ALTER TABLE `giftaddresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `homeaddresses`
--
ALTER TABLE `homeaddresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `image_products`
--
ALTER TABLE `image_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1303;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `modifylists`
--
ALTER TABLE `modifylists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `officeaddresses`
--
ALTER TABLE `officeaddresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=638;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `order_users`
--
ALTER TABLE `order_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `populars`
--
ALTER TABLE `populars`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1142;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1145;

--
-- AUTO_INCREMENT for table `promotionproducts`
--
ALTER TABLE `promotionproducts`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellingreports`
--
ALTER TABLE `sellingreports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliderproducts`
--
ALTER TABLE `sliderproducts`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todyoffers`
--
ALTER TABLE `todyoffers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `weeklyoffers`
--
ALTER TABLE `weeklyoffers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
