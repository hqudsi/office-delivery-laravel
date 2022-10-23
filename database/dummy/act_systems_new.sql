-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 06:16 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `act_systems_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'الخليل', '2021-01-09 15:37:47', '2021-01-23 14:27:20', NULL),
(2, 'بيت لحم', '2021-01-23 14:26:04', '2021-01-23 14:26:04', NULL),
(3, 'القدس', '2021-01-23 14:26:10', '2021-01-23 14:26:10', NULL),
(4, 'رام الله', '2021-01-23 14:26:18', '2021-01-23 14:26:18', NULL),
(5, 'البيرة', '2021-01-23 14:26:27', '2021-01-23 14:26:27', NULL),
(6, 'نابلس', '2021-01-23 14:26:34', '2021-01-23 14:26:34', NULL),
(7, 'جنين', '2021-01-23 14:26:41', '2021-01-23 14:26:41', NULL),
(8, 'طولكرم', '2021-01-23 14:26:50', '2021-01-23 14:26:50', NULL),
(9, 'قلقيلية', '2021-01-23 14:27:11', '2021-01-30 12:27:51', NULL),
(10, 'يطا', '2021-01-23 14:28:34', '2021-01-23 14:28:34', NULL),
(11, 'دورا', '2021-01-23 14:28:42', '2021-01-23 14:28:42', NULL),
(12, 'حلحول', '2021-01-23 14:28:50', '2021-01-23 14:28:50', NULL),
(13, 'الظاهرية', '2021-01-23 14:28:56', '2021-01-23 14:28:56', NULL),
(14, 'السموع', '2021-01-23 14:29:03', '2021-01-23 14:29:03', NULL),
(15, 'بيت جالا', '2021-01-23 14:29:12', '2021-01-23 14:29:12', NULL),
(16, 'بيت ساحور', '2021-01-23 14:29:20', '2021-01-23 14:29:20', NULL),
(21, 'test', '2021-05-10 16:38:29', '2021-05-10 16:38:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `package_cost` float DEFAULT NULL,
  `trans_cost` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `received` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `order_id`, `company_id`, `package_cost`, `trans_cost`, `total`, `received`, `created_at`, `updated_at`, `deleted_at`, `driver_id`, `notes`) VALUES
(54, 271, 27, 10, 10, 20, 20, '2021-07-04 14:44:38', '2021-07-04 14:44:38', NULL, 26, 'asdfasdf'),
(55, 270, 27, 121, 11, 132, 132, '2021-07-04 14:52:44', '2021-07-04 14:52:44', NULL, 26, 'akjdsf;lkjas;dfkj;askdf');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `oid` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `oid`, `name`, `address`, `phone`, `manager`, `system`, `created_at`, `updated_at`, `deleted_at`, `city_id`, `user_id`) VALUES
(12, '9CCE8F36', 'Anas Takrouri', 'Jerusalem', '654321', 'Anas', 2, '2021-02-03 14:42:10', '2021-02-03 14:42:10', NULL, 3, 11),
(26, '2FB4319E', 'Hani Qudsi', 'الخليل', '0597264577', 'Hani', 2, '2021-03-17 20:36:11', '2021-03-17 20:36:11', NULL, 1, 53),
(27, '223BB63C', 'Act Company', 'عين سارة', '0594560918', 'Anas Tam', 2, '2021-06-24 12:16:51', '2021-06-24 12:16:51', NULL, 1, 57);

-- --------------------------------------------------------

--
-- Table structure for table `company_customers`
--

CREATE TABLE `company_customers` (
  `company_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_customers`
--

INSERT INTO `company_customers` (`company_id`, `customer_id`) VALUES
(26, 10),
(12, 10),
(27, 11),
(27, 12);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `oid` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `oid`, `name`, `city_id`, `address`, `phone`, `manager`, `system`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(10, '5689A674', 'S Hani', 1, 'الخليل', '0597264577', 'S Hani', 2, '2021-03-17 20:37:42', '2021-03-17 20:37:42', NULL, 54),
(11, '13E88294', 'Act Supplier', 1, 'الحاووز', '0599123456', 'Mohammad', 2, '2021-06-24 12:18:13', '2021-06-24 12:18:13', NULL, 58),
(12, 'B83A9920', 'asdf', 5, 'hebron', '0597264577', 'asdf', 2, '2021-06-25 15:47:53', '2021-06-25 15:47:53', NULL, 60);

-- --------------------------------------------------------

--
-- Table structure for table `customer_collections`
--

CREATE TABLE `customer_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `trans_cost` float DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 1, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 18),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 0, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 15),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 1, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(56, 7, 'id', 'number', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(60, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 1, 'user_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(63, 1, 'user_belongstomany_system_relationship', 'relationship', 'Subsystems', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_systems\",\"pivot\":\"1\",\"taggable\":\"0\"}', 17),
(64, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 1, 1, 1, 1, '{}', 6),
(65, 1, 'system_id', 'text', 'System Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(66, 8, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(67, 8, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
(69, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(70, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 5),
(89, 11, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(90, 11, 'oid', 'text', 'Oid', 0, 1, 1, 1, 1, 1, '{}', 2),
(99, 11, 'quantity', 'number', 'Quantity', 0, 0, 1, 1, 1, 1, '{}', 18),
(100, 11, 'due_date', 'timestamp', 'Due Date', 0, 0, 1, 1, 1, 1, '{}', 19),
(101, 11, 'received_date', 'timestamp', 'Received Date', 0, 0, 1, 1, 1, 1, '{}', 20),
(102, 11, 'created_by', 'number', 'Created By', 0, 0, 1, 1, 1, 1, '{}', 21),
(103, 11, 'notes', 'text_area', 'Notes', 0, 0, 1, 1, 1, 1, '{}', 23),
(104, 11, 'system', 'number', 'System', 0, 1, 1, 1, 1, 1, '{}', 24),
(105, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 26),
(106, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 27),
(107, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 28),
(109, 11, 'order_belongsto_city_relationship', 'relationship', 'From', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"from_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(110, 11, 'order_belongsto_city_relationship_1', 'relationship', 'To', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"to_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(111, 11, 'order_belongsto_status_relationship', 'relationship', 'Status', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(112, 11, 'order_belongsto_user_relationship', 'relationship', 'Created By', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 22),
(113, 11, 'order_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 25),
(114, 12, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(115, 12, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(116, 12, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 8),
(117, 12, 'system', 'number', 'System', 0, 1, 1, 1, 1, 1, '{}', 9),
(118, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 11),
(119, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(120, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 13),
(121, 12, 'driver_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(122, 11, 'order_belongsto_driver_relationship', 'relationship', 'Driver', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Driver\",\"table\":\"drivers\",\"type\":\"belongsTo\",\"column\":\"driver_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(123, 13, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(126, 13, 'user', 'number', 'User', 0, 1, 1, 1, 1, 1, '{}', 6),
(127, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 8),
(128, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(129, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(130, 13, 'status_detail_belongsto_order_relationship', 'relationship', 'Order ID', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"oid\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(131, 13, 'status_detail_belongsto_status_relationship', 'relationship', 'Status', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(132, 13, 'status_detail_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(133, 14, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(135, 14, 'service', 'number', 'Service id', 0, 1, 1, 1, 1, 1, '{}', 4),
(136, 14, 'quantity', 'number', 'Quantity', 0, 1, 1, 1, 1, 1, '{}', 6),
(137, 14, 'amount', 'number', 'Amount', 0, 1, 1, 1, 1, 1, '{}', 8),
(138, 14, 'total', 'number', 'Total', 0, 1, 1, 1, 1, 1, '{}', 9),
(139, 14, 'user', 'number', 'User', 0, 1, 1, 1, 1, 1, '{}', 10),
(140, 14, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 12),
(141, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 14),
(142, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(143, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 16),
(144, 14, 'order_detail_belongsto_order_relationship', 'relationship', 'Order ID', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"oid\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(145, 14, 'order_detail_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(146, 15, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(147, 15, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(148, 15, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 3),
(149, 15, 'system', 'number', 'System', 0, 1, 1, 1, 1, 1, '{}', 4),
(150, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(151, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(152, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 8),
(153, 15, 'service_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(154, 16, 'id', 'number', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(155, 16, 'oid', 'text', 'Oid', 0, 1, 1, 1, 1, 1, '{}', 2),
(156, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 5),
(158, 16, 'address', 'text_area', 'Address', 0, 1, 1, 1, 1, 1, '{}', 6),
(159, 16, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 7),
(160, 16, 'manager', 'text', 'Manager', 0, 1, 1, 1, 1, 1, '{}', 8),
(162, 16, 'system', 'number', 'System', 0, 1, 1, 1, 1, 1, '{}', 11),
(163, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 14),
(164, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(165, 16, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 16),
(167, 16, 'company_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(168, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(169, 17, 'oid', 'text', 'Oid', 0, 1, 1, 1, 1, 1, '{}', 2),
(170, 17, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(172, 17, 'address', 'text_area', 'Address', 0, 1, 1, 1, 1, 1, '{}', 7),
(173, 17, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 8),
(174, 17, 'manager', 'text', 'Manager', 0, 1, 1, 1, 1, 1, '{}', 9),
(175, 17, 'system', 'number', 'System', 0, 1, 1, 1, 1, 1, '{}', 10),
(176, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 12),
(177, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(178, 17, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
(179, 17, 'customer_belongsto_city_relationship', 'relationship', 'City', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"city_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(180, 17, 'customer_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(182, 12, 'driver_belongsto_company_relationship', 'relationship', 'Company', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(183, 11, 'end_customer_name', 'text', 'End Customer Name', 0, 1, 1, 1, 1, 1, '{}', 9),
(184, 11, 'end_customer_phone', 'text', 'End Customer Phone', 0, 1, 1, 1, 1, 1, '{}', 10),
(185, 11, 'end_customer_address', 'text', 'End Customer Address', 0, 1, 1, 1, 1, 1, '{}', 13),
(187, 11, 'order_belongsto_customer_relationship', 'relationship', 'Customer', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"belongsTo\",\"column\":\"customer_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(188, 11, 'order_belongsto_company_relationship', 'relationship', 'Company', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(191, 16, 'city_id', 'number', 'City Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(192, 16, 'company_belongsto_city_relationship', 'relationship', 'City', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"city_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(193, 16, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(194, 16, 'company_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(195, 1, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"Manager\",\"2\":\"Customer\",\"3\":\"Driver\",\"4\":\"Assistance\",\"5\":\"End Customer\"}}', 13),
(196, 17, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(197, 17, 'customer_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(198, 12, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(199, 12, 'driver_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(200, 12, 'oid', 'text', 'Oid', 0, 1, 1, 1, 1, 1, '{}', 2),
(201, 1, 'active', 'checkbox', 'Active', 0, 1, 1, 1, 1, 1, '{\"0\":\"Active\",\"1\":\"Inactive\"}', 14),
(202, 18, 'id', 'number', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(203, 18, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(204, 18, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 5),
(205, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
(206, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(207, 18, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(208, 18, 'system_id', 'number', 'System Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(209, 18, 'status_belongsto_system_relationship', 'relationship', 'systems', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(210, 14, 'order_detail_belongsto_service_relationship', 'relationship', 'Service', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Service\",\"table\":\"services\",\"type\":\"belongsTo\",\"column\":\"service\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(211, 13, 'notes', 'text_area', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 8),
(212, 16, 'company_belongstomany_customer_relationship', 'relationship', 'Customers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"company_customers\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(213, 17, 'customer_belongstomany_company_relationship', 'relationship', 'companies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"company_customers\",\"pivot\":\"1\",\"taggable\":\"0\"}', 16),
(214, 19, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(215, 19, 'size', 'text', 'Size', 0, 1, 1, 1, 1, 1, '{}', 2),
(216, 19, 'order', 'number', 'Order', 0, 1, 1, 1, 1, 1, '{}', 3),
(217, 19, 'system', 'number', 'System ID', 0, 1, 1, 1, 1, 1, '{}', 4),
(218, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
(219, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(220, 19, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(221, 19, 'pack_size_belongsto_system_relationship', 'relationship', 'System', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\System\",\"table\":\"systems\",\"type\":\"belongsTo\",\"column\":\"system\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(222, 14, 'order_detail_belongsto_pack_size_relationship', 'relationship', 'pack_sizes', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\PackSize\",\"table\":\"pack_sizes\",\"type\":\"belongsTo\",\"column\":\"pack_size_id\",\"key\":\"id\",\"label\":\"size\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(224, 18, 'order', 'number', 'Order', 0, 1, 1, 1, 1, 1, '{}', 3),
(225, 20, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(227, 20, 'user', 'number', 'UserID', 0, 0, 1, 1, 1, 1, '{}', 4),
(228, 20, 'pay_on_delivery', 'checkbox', 'Pay On Delivery', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 6),
(229, 20, 'who_pays', 'select_dropdown', 'Who Pays', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"\\u0627\\u0644\\u0645\\u0631\\u0633\\u0644\",\"2\":\"\\u0627\\u0644\\u0645\\u0633\\u062a\\u0644\\u0645\",\"3\":\"\\u0645\\u062c\\u0627\\u0646\\u064a\"}}', 7),
(230, 20, 'trans_cost', 'number', 'Trans Cost', 0, 1, 1, 1, 1, 1, '{}', 8),
(231, 20, 'packages_count', 'number', 'Packages Count', 0, 1, 1, 1, 1, 1, '{}', 9),
(232, 20, 'packages_cost', 'number', 'Packages Cost', 0, 1, 1, 1, 1, 1, '{}', 10),
(233, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 11),
(234, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(235, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 13),
(236, 20, 'order_cost_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(237, 20, 'order_cost_belongsto_order_relationship', 'relationship', 'Order', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"oid\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(238, 13, 'status_id', 'number', 'Status Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(239, 20, 'order_id', 'text', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(240, 11, 'company_id', 'text', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(241, 11, 'from_id', 'text', 'From Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(242, 11, 'to_id', 'text', 'To Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(243, 11, 'status_id', 'text', 'Status Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(244, 11, 'driver_id', 'text', 'Driver Id', 0, 1, 1, 1, 1, 1, '{}', 10),
(245, 11, 'customer_id', 'text', 'Customer Id', 0, 1, 1, 1, 1, 1, '{}', 20),
(246, 21, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(247, 21, 'order_id', 'number', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(248, 21, 'company_id', 'number', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(249, 21, 'package_cost', 'number', 'Package Cost', 0, 1, 1, 1, 1, 1, '{}', 4),
(250, 21, 'trans_cost', 'number', 'Trans Cost', 0, 1, 1, 1, 1, 1, '{}', 5),
(251, 21, 'total', 'number', 'Total', 0, 1, 1, 1, 1, 1, '{}', 6),
(252, 21, 'received', 'number', 'Received', 0, 1, 1, 1, 1, 1, '{}', 7),
(253, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(254, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(255, 21, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
(256, 21, 'collection_belongsto_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"oid\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(257, 21, 'collection_belongsto_company_relationship', 'relationship', 'companies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(258, 22, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(259, 22, 'order_id', 'number', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(260, 22, 'company_id', 'number', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(261, 22, 'customer_id', 'number', 'Customer Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(262, 22, 'amount', 'number', 'Amount', 0, 1, 1, 1, 1, 1, '{}', 6),
(263, 22, 'collection_id', 'number', 'Collection Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(264, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(265, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(266, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
(267, 22, 'transaction_belongsto_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"oid\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(268, 22, 'transaction_belongsto_company_relationship', 'relationship', 'companies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(269, 22, 'transaction_belongsto_customer_relationship', 'relationship', 'customers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"belongsTo\",\"column\":\"customer_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(270, 22, 'transaction_belongsto_collection_relationship', 'relationship', 'collections', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Collection\",\"table\":\"collections\",\"type\":\"belongsTo\",\"column\":\"collection_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(271, 21, 'driver_id', 'number', 'Driver Id', 0, 1, 1, 1, 1, 1, '{}', 11),
(272, 21, 'collection_belongsto_driver_relationship', 'relationship', 'drivers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Driver\",\"table\":\"drivers\",\"type\":\"belongsTo\",\"column\":\"driver_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(273, 20, 'to_collect', 'number', 'To Collect', 0, 1, 1, 1, 1, 1, '{}', 12),
(274, 20, 'received', 'number', 'Received', 0, 1, 1, 1, 1, 1, '{}', 13),
(275, 20, 'collected', 'checkbox', 'Collected', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 14),
(276, 12, 'company_id', 'text', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(277, 13, 'order_id', 'number', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(278, 23, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(279, 23, 'order_id', 'number', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(280, 23, 'company_id', 'number', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(281, 23, 'driver_id', 'number', 'Driver Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(282, 23, 'trans_cost', 'number', 'Trans Cost', 0, 1, 1, 1, 1, 1, '{}', 5),
(283, 23, 'collection_id', 'number', 'Collection Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(284, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
(285, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(286, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(287, 23, 'customer_collection_belongsto_company_relationship', 'relationship', 'companies', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(288, 23, 'customer_collection_belongsto_driver_relationship', 'relationship', 'drivers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Driver\",\"table\":\"drivers\",\"type\":\"belongsTo\",\"column\":\"driver_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(289, 23, 'customer_collection_belongsto_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"oid\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(290, 23, 'customer_collection_belongsto_collection_relationship', 'relationship', 'collections', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Collection\",\"table\":\"collections\",\"type\":\"belongsTo\",\"column\":\"collection_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(291, 17, 'city_id', 'text', 'City Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(292, 22, 'trans_type', 'select_dropdown', 'Trans Type', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"Package Cost\",\"2\":\"Trans Cost\",\"3\":\"Payment\",\"4\":\"Cancel Package Cost\",\"5\":\"Cancel Trans Cost\",\"6\":\"Return Cost\"}}', 12),
(293, 22, 'manual_number', 'text', 'Manual Number', 0, 1, 1, 1, 1, 1, '{}', 14),
(294, 14, 'order_id', 'text', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(295, 14, 'pack_size_id', 'text', 'Pack Size Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(296, 22, 'driver_id', 'number', 'Driver Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(297, 22, 'transaction_belongsto_driver_relationship', 'relationship', 'drivers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Driver\",\"table\":\"drivers\",\"type\":\"belongsTo\",\"column\":\"driver_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(298, 20, 'returned', 'checkbox', 'Returned', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 15),
(299, 20, 'return_cost', 'number', 'Return Cost', 0, 1, 1, 1, 1, 1, '{}', 16),
(300, 20, 'canceled', 'checkbox', 'Canceled', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 17),
(301, 12, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 11),
(302, 1, 'company_id', 'number', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 15),
(303, 1, 'user_belongsto_company_relationship', 'relationship', 'Company', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 19),
(304, 11, 'manual_number', 'text', 'Manual Number', 0, 1, 1, 1, 1, 1, '{}', 21),
(305, 21, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 12),
(306, 20, 'collection_notes', 'text', 'Collection Notes', 0, 1, 1, 1, 1, 1, '{}', 18),
(307, 24, 'id', 'number', 'Id', 1, 1, 1, 0, 0, 0, '{}', 0),
(308, 24, 'order_id', 'number', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(309, 24, 'driver_id', 'number', 'Driver Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(310, 24, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(311, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
(312, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(313, 24, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-05 07:17:10', '2021-07-04 14:03:55'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-05 07:17:10', '2021-01-06 18:33:09'),
(7, 'systems', 'systems', 'System', 'Systems', 'voyager-window-list', 'App\\System', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-01-06 18:41:35', '2021-01-06 18:41:35'),
(8, 'cities', 'cities', 'City', 'Cities', 'voyager-world', 'App\\City', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-01-09 15:37:23', '2021-01-09 15:37:23'),
(11, 'orders', 'orders', 'Order', 'Orders', 'voyager-basket', 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-10 14:44:11', '2021-07-04 14:28:30'),
(12, 'drivers', 'drivers', 'Driver', 'Drivers', 'voyager-group', 'App\\Driver', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-10 14:53:34', '2021-07-06 16:37:46'),
(13, 'status_details', 'status-details', 'Status Detail', 'Status Details', 'voyager-list-add', 'App\\StatusDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-10 14:57:09', '2021-02-05 11:28:28'),
(14, 'order_details', 'order-details', 'Order Detail', 'Order Details', 'voyager-basket', 'App\\OrderDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-10 15:06:13', '2021-02-20 16:06:22'),
(15, 'services', 'services', 'Service', 'Services', 'voyager-tools', 'App\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-10 15:10:58', '2021-01-10 15:11:36'),
(16, 'companies', 'companies', 'Company', 'Companies', 'voyager-company', 'App\\Company', NULL, '\\App\\Http\\Controllers\\Voyager\\CompanyController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-10 16:39:16', '2021-06-24 13:33:20'),
(17, 'customers', 'customers', 'Customer', 'Customers', 'voyager-group', 'App\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-11 13:47:41', '2021-02-07 19:36:09'),
(18, 'statuses', 'statuses', 'Status', 'Statuses', 'voyager-list', 'App\\Status', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-13 13:43:28', '2021-07-03 14:54:12'),
(19, 'pack_sizes', 'pack-sizes', 'Pack Size', 'Pack Sizes', 'voyager-categories', 'App\\PackSize', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-20 09:33:38', '2021-01-20 09:34:39'),
(20, 'order_costs', 'order-costs', 'Order Cost', 'Order Costs', 'voyager-dollar', 'App\\OrderCost', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-23 06:15:57', '2021-07-04 14:48:20'),
(21, 'collections', 'collections', 'Collection', 'Collections', 'voyager-dollar', 'App\\Collection', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-30 15:41:28', '2021-07-04 14:42:36'),
(22, 'transactions', 'transactions', 'Transaction', 'Transactions', 'voyager-dollar', 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-30 15:42:55', '2021-03-18 03:45:34'),
(23, 'customer_collections', 'customer-collections', 'Customer Collection', 'Customer Collections', 'voyager-dollar', 'App\\CustomerCollection', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-06 18:20:38', '2021-02-06 18:22:17'),
(24, 'order_drivers', 'order-drivers', 'Order Driver', 'Order Drivers', 'voyager-truck', 'App\\OrderDriver', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-08 18:02:38', '2021-07-08 18:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `oid` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `notes`, `system`, `created_at`, `updated_at`, `deleted_at`, `company_id`, `user_id`, `oid`, `phone`) VALUES
(24, '1', NULL, 2, '2021-03-29 12:49:32', '2021-05-10 16:34:30', NULL, 12, 55, '0B020524', NULL),
(25, '2', NULL, 2, '2021-03-29 12:50:23', '2021-05-10 16:34:21', NULL, 12, 56, '89B13945', NULL),
(26, 'Hani Q', NULL, 2, '2021-06-24 12:19:30', '2021-06-24 12:19:30', NULL, 27, 59, '92435522', '0597264577'),
(27, 'new driver', NULL, 2, '2021-07-06 16:36:32', '2021-07-06 16:36:32', NULL, 12, 62, 'CCD5B556', NULL),
(28, 'drvier1', NULL, 2, '2021-07-06 16:39:25', '2021-07-06 16:39:25', NULL, 12, 63, '76C8FE92', '0597264577'),
(29, 'سائق 1', NULL, 2, '2021-07-09 08:56:52', '2021-07-09 08:56:52', NULL, 26, 65, '32D3E6DE', '0597264577'),
(30, 'driver 2', NULL, 2, '2021-07-09 08:57:10', '2021-07-09 08:57:10', NULL, 26, 66, '8AEC03BC', '0597264577');

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
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-12-05 07:17:10', '2020-12-05 07:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-12-05 07:17:10', '2021-01-06 20:21:29', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 4, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 16, 1, '2020-12-05 07:17:10', '2021-01-06 20:23:56', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 16, 2, '2020-12-05 07:17:10', '2021-01-06 20:23:56', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 2, '2020-12-05 07:17:10', '2021-01-06 20:27:52', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 7, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 1, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 2, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 3, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 6, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-12-05 07:17:10', '2021-01-06 20:24:23', 'voyager.hooks', NULL),
(15, 1, 'Systems', '', '_self', 'voyager-window-list', NULL, 17, 1, '2021-01-06 18:41:35', '2021-01-06 20:26:54', 'voyager.systems.index', NULL),
(16, 1, 'Users Management', '', '_self', 'voyager-people', '#000000', NULL, 3, '2021-01-06 20:23:39', '2021-01-06 20:27:52', NULL, ''),
(17, 1, 'Definitions', '', '_self', 'voyager-list', '#000000', NULL, 4, '2021-01-06 20:26:36', '2021-01-06 20:26:51', NULL, ''),
(18, 1, 'Cities', '', '_self', 'voyager-world', NULL, 17, 2, '2021-01-09 15:37:23', '2021-01-10 15:13:01', 'voyager.cities.index', NULL),
(21, 1, 'Orders', '', '_self', 'voyager-basket', NULL, 26, 1, '2021-01-10 14:44:11', '2021-01-10 15:14:20', 'voyager.orders.index', NULL),
(22, 1, 'Drivers', '', '_self', 'voyager-group', NULL, 17, 7, '2021-01-10 14:53:34', '2021-01-12 12:29:48', 'voyager.drivers.index', NULL),
(23, 1, 'Status Details', '', '_self', 'voyager-list-add', NULL, 26, 4, '2021-01-10 14:57:09', '2021-01-23 06:16:14', 'voyager.status-details.index', NULL),
(24, 1, 'Order Details', '', '_self', 'voyager-basket', '#000000', 26, 2, '2021-01-10 15:06:13', '2021-01-10 15:14:23', 'voyager.order-details.index', 'null'),
(25, 1, 'Services', '', '_self', 'voyager-tools', NULL, 17, 3, '2021-01-10 15:10:58', '2021-01-10 15:13:13', 'voyager.services.index', NULL),
(26, 1, 'Orders', '', '_self', 'voyager-basket', '#000000', NULL, 5, '2021-01-10 15:14:07', '2021-01-10 15:14:15', NULL, ''),
(27, 1, 'Companies', '', '_self', 'voyager-company', NULL, 17, 5, '2021-01-10 16:39:16', '2021-01-10 16:53:22', 'voyager.companies.index', NULL),
(28, 1, 'Customers', '', '_self', 'voyager-group', NULL, 17, 6, '2021-01-11 13:47:41', '2021-01-12 12:29:48', 'voyager.customers.index', NULL),
(29, 1, 'Statuses', '', '_self', 'voyager-list', NULL, 17, 4, '2021-01-13 13:43:28', '2021-01-13 13:52:57', 'voyager.statuses.index', NULL),
(30, 1, 'Pack Sizes', '', '_self', 'voyager-categories', NULL, 17, 8, '2021-01-20 09:33:38', '2021-01-23 06:16:22', 'voyager.pack-sizes.index', NULL),
(31, 1, 'Order Costs', '', '_self', 'voyager-dollar', NULL, 26, 3, '2021-01-23 06:15:58', '2021-01-23 06:16:14', 'voyager.order-costs.index', NULL),
(32, 1, 'Collections', '', '_self', 'voyager-dollar', NULL, 34, 1, '2021-01-30 15:41:28', '2021-01-30 15:47:57', 'voyager.collections.index', NULL),
(33, 1, 'Transactions', '', '_self', 'voyager-dollar', NULL, 34, 3, '2021-01-30 15:42:56', '2021-02-17 17:10:48', 'voyager.transactions.index', NULL),
(34, 1, 'Financial', '', '_self', 'voyager-dollar', '#000000', NULL, 6, '2021-01-30 15:47:50', '2021-01-30 15:47:56', NULL, ''),
(35, 1, 'Customer Collections', '', '_self', 'voyager-dollar', NULL, 34, 2, '2021-02-06 18:20:38', '2021-02-17 17:10:48', 'voyager.customer-collections.index', NULL),
(36, 1, 'Order Drivers', '', '_self', 'voyager-truck', NULL, 26, 5, '2021-07-08 18:02:38', '2021-07-08 18:02:59', 'voyager.order-drivers.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `oid` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `end_customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_customer_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_customer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `received_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `manual_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `oid`, `company_id`, `from_id`, `to_id`, `end_customer_name`, `end_customer_phone`, `end_customer_address`, `status_id`, `driver_id`, `quantity`, `due_date`, `received_date`, `created_by`, `notes`, `system`, `created_at`, `updated_at`, `deleted_at`, `customer_id`, `manual_number`) VALUES
(248, '105B6BA3', 26, 1, 4, 'اي حد', '123', 'سيبل', 7, 25, NULL, '2021-03-17', NULL, 53, 'شسيب', 2, '2021-03-17 20:56:22', '2021-07-10 09:16:34', NULL, 10, NULL),
(249, '1F98FB3C', 26, 1, 8, 'asdf', 'asdf', 'asdf', 7, 24, NULL, '2021-03-18', NULL, 53, 'asdf', 2, '2021-03-18 15:31:39', '2021-07-10 09:16:33', NULL, 10, NULL),
(250, '95F18230', 26, 1, 7, 'asdf', 'asdf', 'asdf', 3, 25, NULL, '2021-03-27', NULL, 53, 'asdf', 2, '2021-03-27 05:39:24', '2021-07-12 12:49:56', NULL, 10, NULL),
(251, '722DFC38', 26, 1, 8, 'qwer', 'qwer', 'qwer', 4, 29, NULL, '2021-03-27', NULL, 53, 'qwer', 2, '2021-03-27 05:43:11', '2021-07-11 06:54:20', NULL, 10, NULL),
(268, '86A5B04F', 26, 1, 7, '34', '234', '234', 1, 26, NULL, '2021-06-24', NULL, 57, '34', 2, '2021-06-24 13:29:45', '2021-07-12 02:33:46', NULL, 11, NULL),
(269, '651DABAD', 26, 1, 1, 'sadf', '123', 'asdf', 7, 26, NULL, '2021-06-24', NULL, 57, 'asdf', 2, '2021-06-24 13:36:12', '2021-07-12 02:33:35', NULL, 11, NULL),
(270, '69CBE144', 26, 1, 7, 'خالد خليل عيسى', '05998954536', 'الدوار الثاني بعد الاول', 3, 26, NULL, '2021-06-24', NULL, 58, 'asdf', 2, '2021-06-24 14:11:03', '2021-07-12 12:49:55', NULL, 11, NULL),
(271, '8A5D6640', 26, 1, 1, 'هاني', '0597264577', 'الخليل', 1, 26, NULL, '2021-07-04', NULL, 57, NULL, 2, '2021-07-04 14:36:23', '2021-07-12 02:33:12', NULL, 11, 'anas123');

-- --------------------------------------------------------

--
-- Table structure for table `order_costs`
--

CREATE TABLE `order_costs` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `pay_on_delivery` tinyint(4) DEFAULT NULL,
  `who_pays` smallint(6) DEFAULT NULL,
  `trans_cost` float DEFAULT NULL,
  `packages_count` int(11) DEFAULT NULL,
  `packages_cost` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `to_collect` float DEFAULT NULL,
  `received` float DEFAULT NULL,
  `collected` tinyint(4) DEFAULT NULL,
  `returned` tinyint(4) DEFAULT NULL,
  `return_cost` float DEFAULT NULL,
  `canceled` tinyint(4) DEFAULT NULL,
  `collection_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_costs`
--

INSERT INTO `order_costs` (`id`, `order_id`, `user`, `pay_on_delivery`, `who_pays`, `trans_cost`, `packages_count`, `packages_cost`, `created_at`, `updated_at`, `deleted_at`, `to_collect`, `received`, `collected`, `returned`, `return_cost`, `canceled`, `collection_notes`) VALUES
(224, 248, 53, 1, 1, 20, 1, 50, '2021-03-17 20:56:22', '2021-03-18 04:23:37', NULL, 50, 0, 0, 1, 10, NULL, NULL),
(225, 249, 53, 1, 2, 10, 1, 10, '2021-03-18 15:31:39', '2021-07-10 09:16:33', NULL, 20, 0, 0, 1, 10, NULL, NULL),
(226, 250, 53, 1, 2, 10, 3, 5, '2021-03-27 05:39:24', '2021-03-27 05:39:24', NULL, 15, 0, 0, 0, NULL, 0, NULL),
(227, 251, 53, 1, 2, 1, 3, 5, '2021-03-27 05:43:11', '2021-03-27 05:43:11', NULL, 6, 0, 0, 0, NULL, 0, NULL),
(228, 268, 57, 1, 2, 1, 1, 1, '2021-06-24 13:29:45', '2021-06-24 13:29:45', NULL, 2, 0, 0, 0, NULL, 0, NULL),
(229, 269, 57, 1, 2, 1, 1, 1, '2021-06-24 13:36:12', '2021-07-04 13:40:37', NULL, 2, 0, 0, 1, 0, 0, NULL),
(230, 270, 58, 1, 2, 11, 11, 121, '2021-06-24 14:11:03', '2021-07-04 14:52:44', NULL, 132, 132, 1, 1, 0, 0, 'akjdsf;lkjas;dfkj;askdf'),
(231, 271, 57, 1, 2, 10, 1, 10, '2021-07-04 14:36:23', '2021-07-04 14:53:42', NULL, 20, 20, 1, 0, NULL, 0, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `notes` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pack_size_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `service`, `quantity`, `amount`, `total`, `user`, `notes`, `created_at`, `updated_at`, `deleted_at`, `pack_size_id`) VALUES
(258, 248, 2, 1, 50, 50, 53, NULL, '2021-03-17 20:56:22', '2021-03-17 20:56:22', NULL, 1),
(259, 249, 2, 1, 10, 10, 53, NULL, '2021-03-18 15:31:39', '2021-03-18 15:31:39', NULL, 1),
(260, 250, 2, 1, 1, 1, 53, 'adsf', '2021-03-27 05:39:24', '2021-03-27 05:39:24', NULL, 1),
(261, 250, 2, 2, 2, 4, 53, '2adsf', '2021-03-27 05:39:24', '2021-03-27 05:39:24', NULL, 2),
(262, 251, 2, 1, 1, 1, 53, '1', '2021-03-27 05:43:11', '2021-03-27 05:43:11', NULL, 1),
(263, 251, 2, 2, 2, 4, 53, '2', '2021-03-27 05:43:11', '2021-03-27 05:43:11', NULL, 2),
(264, 268, 2, 1, 1, 1, 57, '1', '2021-06-24 13:29:45', '2021-06-24 13:29:45', NULL, 1),
(265, 269, 2, 1, 1, 1, 57, NULL, '2021-06-24 13:36:12', '2021-06-24 13:36:12', NULL, 1),
(266, 270, 2, 11, 11, 121, 58, '1', '2021-06-24 14:11:03', '2021-06-24 14:11:03', NULL, 1),
(267, 271, 2, 1, 10, 10, 57, NULL, '2021-07-04 14:36:23', '2021-07-04 14:36:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_drivers`
--

CREATE TABLE `order_drivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_drivers`
--

INSERT INTO `order_drivers` (`id`, `order_id`, `driver_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 251, 29, 53, '2021-07-09 08:57:25', '2021-07-09 08:57:25', NULL),
(2, 251, 30, 53, '2021-07-09 08:57:42', '2021-07-09 08:57:42', NULL),
(3, 251, 29, 53, '2021-07-09 08:58:50', '2021-07-09 08:58:50', NULL),
(4, 251, 30, 53, '2021-07-09 09:00:12', '2021-07-09 09:00:12', NULL),
(5, 251, 29, 53, '2021-07-09 09:00:18', '2021-07-09 09:00:18', NULL),
(6, 251, 30, 53, '2021-07-09 09:01:33', '2021-07-09 09:01:33', NULL),
(7, 251, 29, 53, '2021-07-09 12:56:03', '2021-07-09 12:56:03', NULL),
(8, 251, 30, 53, '2021-07-09 14:17:23', '2021-07-09 14:17:23', NULL),
(9, 251, 29, 53, '2021-07-11 06:54:20', '2021-07-11 06:54:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pack_sizes`
--

CREATE TABLE `pack_sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pack_sizes`
--

INSERT INTO `pack_sizes` (`id`, `size`, `order`, `system`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'صغير', 1, 2, '2021-01-20 13:44:34', '2021-01-20 13:44:34', NULL),
(2, 'متوسط', 2, 2, '2021-01-20 13:44:46', '2021-01-20 13:44:46', NULL),
(3, 'كبير', 3, 2, '2021-01-20 13:44:56', '2021-01-20 13:44:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hcompany@act.ps', '$2y$10$K34rpP6q1vauTTNfLNonQ.JvKQPn2FOfMOKv9BPbMbd3T2S.9UJoe', '2021-03-13 05:50:41'),
('hani.a.qudsi@gmail.com', '$2y$10$pWEUTDQDsat67L2QpDEjtOKk6YQNYzrwv1Q/3H2UIvFKr0WwdUrnG', '2021-04-01 14:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(2, 'browse_bread', NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(3, 'browse_database', NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(4, 'browse_media', NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(5, 'browse_compass', NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(6, 'browse_menus', 'menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(7, 'read_menus', 'menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(8, 'edit_menus', 'menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(9, 'add_menus', 'menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(10, 'delete_menus', 'menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(11, 'browse_roles', 'roles', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(12, 'read_roles', 'roles', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(13, 'edit_roles', 'roles', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(14, 'add_roles', 'roles', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(15, 'delete_roles', 'roles', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(16, 'browse_users', 'users', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(17, 'read_users', 'users', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(18, 'edit_users', 'users', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(19, 'add_users', 'users', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(20, 'delete_users', 'users', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(21, 'browse_settings', 'settings', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(22, 'read_settings', 'settings', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(23, 'edit_settings', 'settings', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(24, 'add_settings', 'settings', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(25, 'delete_settings', 'settings', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(41, 'browse_hooks', NULL, '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(42, 'browse_systems', 'systems', '2021-01-06 18:41:35', '2021-01-06 18:41:35'),
(43, 'read_systems', 'systems', '2021-01-06 18:41:35', '2021-01-06 18:41:35'),
(44, 'edit_systems', 'systems', '2021-01-06 18:41:35', '2021-01-06 18:41:35'),
(45, 'add_systems', 'systems', '2021-01-06 18:41:35', '2021-01-06 18:41:35'),
(46, 'delete_systems', 'systems', '2021-01-06 18:41:35', '2021-01-06 18:41:35'),
(47, 'browse_cities', 'cities', '2021-01-09 15:37:23', '2021-01-09 15:37:23'),
(48, 'read_cities', 'cities', '2021-01-09 15:37:23', '2021-01-09 15:37:23'),
(49, 'edit_cities', 'cities', '2021-01-09 15:37:23', '2021-01-09 15:37:23'),
(50, 'add_cities', 'cities', '2021-01-09 15:37:23', '2021-01-09 15:37:23'),
(51, 'delete_cities', 'cities', '2021-01-09 15:37:23', '2021-01-09 15:37:23'),
(62, 'browse_orders', 'orders', '2021-01-10 14:44:11', '2021-01-10 14:44:11'),
(63, 'read_orders', 'orders', '2021-01-10 14:44:11', '2021-01-10 14:44:11'),
(64, 'edit_orders', 'orders', '2021-01-10 14:44:11', '2021-01-10 14:44:11'),
(65, 'add_orders', 'orders', '2021-01-10 14:44:11', '2021-01-10 14:44:11'),
(66, 'delete_orders', 'orders', '2021-01-10 14:44:11', '2021-01-10 14:44:11'),
(67, 'browse_drivers', 'drivers', '2021-01-10 14:53:34', '2021-01-10 14:53:34'),
(68, 'read_drivers', 'drivers', '2021-01-10 14:53:34', '2021-01-10 14:53:34'),
(69, 'edit_drivers', 'drivers', '2021-01-10 14:53:34', '2021-01-10 14:53:34'),
(70, 'add_drivers', 'drivers', '2021-01-10 14:53:34', '2021-01-10 14:53:34'),
(71, 'delete_drivers', 'drivers', '2021-01-10 14:53:34', '2021-01-10 14:53:34'),
(72, 'browse_status_details', 'status_details', '2021-01-10 14:57:09', '2021-01-10 14:57:09'),
(73, 'read_status_details', 'status_details', '2021-01-10 14:57:09', '2021-01-10 14:57:09'),
(74, 'edit_status_details', 'status_details', '2021-01-10 14:57:09', '2021-01-10 14:57:09'),
(75, 'add_status_details', 'status_details', '2021-01-10 14:57:09', '2021-01-10 14:57:09'),
(76, 'delete_status_details', 'status_details', '2021-01-10 14:57:09', '2021-01-10 14:57:09'),
(77, 'browse_order_details', 'order_details', '2021-01-10 15:06:13', '2021-01-10 15:06:13'),
(78, 'read_order_details', 'order_details', '2021-01-10 15:06:13', '2021-01-10 15:06:13'),
(79, 'edit_order_details', 'order_details', '2021-01-10 15:06:13', '2021-01-10 15:06:13'),
(80, 'add_order_details', 'order_details', '2021-01-10 15:06:13', '2021-01-10 15:06:13'),
(81, 'delete_order_details', 'order_details', '2021-01-10 15:06:13', '2021-01-10 15:06:13'),
(82, 'browse_services', 'services', '2021-01-10 15:10:58', '2021-01-10 15:10:58'),
(83, 'read_services', 'services', '2021-01-10 15:10:58', '2021-01-10 15:10:58'),
(84, 'edit_services', 'services', '2021-01-10 15:10:58', '2021-01-10 15:10:58'),
(85, 'add_services', 'services', '2021-01-10 15:10:58', '2021-01-10 15:10:58'),
(86, 'delete_services', 'services', '2021-01-10 15:10:58', '2021-01-10 15:10:58'),
(87, 'browse_companies', 'companies', '2021-01-10 16:39:16', '2021-01-10 16:39:16'),
(88, 'read_companies', 'companies', '2021-01-10 16:39:16', '2021-01-10 16:39:16'),
(89, 'edit_companies', 'companies', '2021-01-10 16:39:16', '2021-01-10 16:39:16'),
(90, 'add_companies', 'companies', '2021-01-10 16:39:16', '2021-01-10 16:39:16'),
(91, 'delete_companies', 'companies', '2021-01-10 16:39:16', '2021-01-10 16:39:16'),
(92, 'browse_customers', 'customers', '2021-01-11 13:47:41', '2021-01-11 13:47:41'),
(93, 'read_customers', 'customers', '2021-01-11 13:47:41', '2021-01-11 13:47:41'),
(94, 'edit_customers', 'customers', '2021-01-11 13:47:41', '2021-01-11 13:47:41'),
(95, 'add_customers', 'customers', '2021-01-11 13:47:41', '2021-01-11 13:47:41'),
(96, 'delete_customers', 'customers', '2021-01-11 13:47:41', '2021-01-11 13:47:41'),
(97, 'browse_statuses', 'statuses', '2021-01-13 13:43:28', '2021-01-13 13:43:28'),
(98, 'read_statuses', 'statuses', '2021-01-13 13:43:28', '2021-01-13 13:43:28'),
(99, 'edit_statuses', 'statuses', '2021-01-13 13:43:28', '2021-01-13 13:43:28'),
(100, 'add_statuses', 'statuses', '2021-01-13 13:43:28', '2021-01-13 13:43:28'),
(101, 'delete_statuses', 'statuses', '2021-01-13 13:43:28', '2021-01-13 13:43:28'),
(102, 'browse_pack_sizes', 'pack_sizes', '2021-01-20 09:33:38', '2021-01-20 09:33:38'),
(103, 'read_pack_sizes', 'pack_sizes', '2021-01-20 09:33:38', '2021-01-20 09:33:38'),
(104, 'edit_pack_sizes', 'pack_sizes', '2021-01-20 09:33:38', '2021-01-20 09:33:38'),
(105, 'add_pack_sizes', 'pack_sizes', '2021-01-20 09:33:38', '2021-01-20 09:33:38'),
(106, 'delete_pack_sizes', 'pack_sizes', '2021-01-20 09:33:38', '2021-01-20 09:33:38'),
(107, 'browse_order_costs', 'order_costs', '2021-01-23 06:15:58', '2021-01-23 06:15:58'),
(108, 'read_order_costs', 'order_costs', '2021-01-23 06:15:58', '2021-01-23 06:15:58'),
(109, 'edit_order_costs', 'order_costs', '2021-01-23 06:15:58', '2021-01-23 06:15:58'),
(110, 'add_order_costs', 'order_costs', '2021-01-23 06:15:58', '2021-01-23 06:15:58'),
(111, 'delete_order_costs', 'order_costs', '2021-01-23 06:15:58', '2021-01-23 06:15:58'),
(112, 'browse_collections', 'collections', '2021-01-30 15:41:28', '2021-01-30 15:41:28'),
(113, 'read_collections', 'collections', '2021-01-30 15:41:28', '2021-01-30 15:41:28'),
(114, 'edit_collections', 'collections', '2021-01-30 15:41:28', '2021-01-30 15:41:28'),
(115, 'add_collections', 'collections', '2021-01-30 15:41:28', '2021-01-30 15:41:28'),
(116, 'delete_collections', 'collections', '2021-01-30 15:41:28', '2021-01-30 15:41:28'),
(117, 'browse_transactions', 'transactions', '2021-01-30 15:42:56', '2021-01-30 15:42:56'),
(118, 'read_transactions', 'transactions', '2021-01-30 15:42:56', '2021-01-30 15:42:56'),
(119, 'edit_transactions', 'transactions', '2021-01-30 15:42:56', '2021-01-30 15:42:56'),
(120, 'add_transactions', 'transactions', '2021-01-30 15:42:56', '2021-01-30 15:42:56'),
(121, 'delete_transactions', 'transactions', '2021-01-30 15:42:56', '2021-01-30 15:42:56'),
(122, 'browse_customer_collections', 'customer_collections', '2021-02-06 18:20:38', '2021-02-06 18:20:38'),
(123, 'read_customer_collections', 'customer_collections', '2021-02-06 18:20:38', '2021-02-06 18:20:38'),
(124, 'edit_customer_collections', 'customer_collections', '2021-02-06 18:20:38', '2021-02-06 18:20:38'),
(125, 'add_customer_collections', 'customer_collections', '2021-02-06 18:20:38', '2021-02-06 18:20:38'),
(126, 'delete_customer_collections', 'customer_collections', '2021-02-06 18:20:38', '2021-02-06 18:20:38'),
(127, 'browse_order_drivers', 'order_drivers', '2021-07-08 18:02:38', '2021-07-08 18:02:38'),
(128, 'read_order_drivers', 'order_drivers', '2021-07-08 18:02:38', '2021-07-08 18:02:38'),
(129, 'edit_order_drivers', 'order_drivers', '2021-07-08 18:02:38', '2021-07-08 18:02:38'),
(130, 'add_order_drivers', 'order_drivers', '2021-07-08 18:02:38', '2021-07-08 18:02:38'),
(131, 'delete_order_drivers', 'order_drivers', '2021-07-08 18:02:38', '2021-07-08 18:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(104, 1),
(104, 2),
(105, 1),
(105, 2),
(106, 1),
(106, 2),
(107, 1),
(107, 2),
(108, 1),
(108, 2),
(109, 1),
(109, 2),
(110, 1),
(110, 2),
(111, 1),
(111, 2),
(112, 1),
(112, 2),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(115, 2),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(118, 2),
(119, 1),
(119, 2),
(120, 1),
(120, 2),
(121, 1),
(121, 2),
(122, 1),
(122, 2),
(123, 1),
(123, 2),
(124, 1),
(124, 2),
(125, 1),
(125, 2),
(126, 1),
(126, 2),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(2, 'user', 'Normal User', '2020-12-05 07:17:10', '2020-12-05 07:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `notes`, `system`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'خدمة توصيل', NULL, 2, '2021-01-12 15:00:31', '2021-01-12 15:00:31', NULL),
(2, 'سعر الطرد', NULL, 2, '2021-01-12 15:00:45', '2021-01-12 15:00:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'ACT', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'ACT', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\January2021\\AQHVkrgvHFKiQX5rEAaG.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/February2021/osMMOHsNR2dw2B4HwyjQ.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'ACT', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to ACT.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\January2021\\mTmgGcdYoyvvgEmRH81b.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\January2021\\tMXH9swHehAnnEDnb0R3.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `system_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `note`, `created_at`, `updated_at`, `deleted_at`, `system_id`, `order`) VALUES
(1, 'جديد', 'جديد', '2021-01-20 10:22:44', '2021-01-28 08:54:04', NULL, 2, 1),
(2, 'في الشركة', 'في الشركة', '2021-07-03 13:49:12', '2021-07-03 14:57:10', NULL, 2, 2),
(3, 'قيد الفرز', 'قيد الفرز', '2021-07-03 13:49:40', '2021-07-03 14:57:13', NULL, 2, 3),
(4, 'عالق', 'عالق', '2021-07-03 13:49:56', '2021-07-03 15:00:25', NULL, 2, 4),
(5, 'قيد التنفيذ', 'قيد التنفيذ', '2021-01-28 08:52:52', '2021-07-03 14:56:51', NULL, 2, 5),
(6, 'تم التسليم', 'تم التسليم', '2021-01-28 08:53:09', '2021-07-03 14:57:00', NULL, 2, 6),
(7, 'مرتجع', 'مرتجع', '2021-01-28 08:53:31', '2021-07-03 14:56:58', NULL, 2, 7),
(8, 'ملغي', 'ملغي', '2021-01-28 08:53:45', '2021-07-03 14:57:04', NULL, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `status_details`
--

CREATE TABLE `status_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `notes` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_details`
--

INSERT INTO `status_details` (`id`, `order_id`, `status_id`, `user`, `created_at`, `updated_at`, `deleted_at`, `notes`) VALUES
(366, 248, 1, 53, '2021-03-17 20:56:22', '2021-03-17 20:56:22', NULL, NULL),
(367, 248, 4, 53, '2021-03-18 04:23:37', '2021-03-18 04:23:37', NULL, 'ارجاع'),
(368, 249, 1, 53, '2021-03-18 15:31:39', '2021-03-18 15:31:39', NULL, NULL),
(369, 250, 1, 53, '2021-03-27 05:39:24', '2021-03-27 05:39:24', NULL, NULL),
(370, 251, 1, 53, '2021-03-27 05:43:11', '2021-03-27 05:43:11', NULL, NULL),
(371, 268, 1, 57, '2021-06-24 13:29:46', '2021-06-24 13:29:46', NULL, NULL),
(372, 269, 1, 57, '2021-06-24 13:36:12', '2021-06-24 13:36:12', NULL, NULL),
(373, 270, 1, 58, '2021-06-24 14:11:03', '2021-06-24 14:11:03', NULL, NULL),
(374, 270, 4, 57, '2021-06-25 14:55:35', '2021-06-25 14:55:35', NULL, NULL),
(375, 269, 2, 57, '2021-07-03 15:35:18', '2021-07-03 15:35:18', NULL, NULL),
(376, 269, 3, 57, '2021-07-03 15:45:27', '2021-07-03 15:45:27', NULL, NULL),
(377, 269, 5, 57, '2021-07-03 15:54:42', '2021-07-03 15:54:42', NULL, NULL),
(378, 269, 2, 57, '2021-07-03 16:00:38', '2021-07-03 16:00:38', NULL, NULL),
(379, 269, 3, 57, '2021-07-03 16:03:18', '2021-07-03 16:03:18', NULL, NULL),
(380, 269, 3, 57, '2021-07-03 16:05:05', '2021-07-03 16:05:05', NULL, NULL),
(381, 269, 4, 57, '2021-07-03 16:06:49', '2021-07-03 16:06:49', NULL, NULL),
(382, 269, 2, 57, '2021-07-03 16:13:20', '2021-07-03 16:13:20', NULL, NULL),
(383, 269, 3, 57, '2021-07-03 16:13:34', '2021-07-03 16:13:34', NULL, NULL),
(384, 269, 4, 57, '2021-07-03 16:14:04', '2021-07-03 16:14:04', NULL, NULL),
(385, 269, 2, 57, '2021-07-03 16:14:21', '2021-07-03 16:14:21', NULL, NULL),
(386, 269, 5, 57, '2021-07-03 16:14:40', '2021-07-03 16:14:40', NULL, NULL),
(387, 269, 4, 57, '2021-07-03 16:21:10', '2021-07-03 16:21:10', NULL, NULL),
(388, 269, 2, 57, '2021-07-03 16:21:24', '2021-07-03 16:21:24', NULL, NULL),
(389, 269, 1, 57, '2021-07-03 16:22:33', '2021-07-03 16:22:33', NULL, NULL),
(390, 269, 2, 57, '2021-07-03 16:26:36', '2021-07-03 16:26:36', NULL, NULL),
(391, 269, 3, 57, '2021-07-03 16:26:51', '2021-07-03 16:26:51', NULL, NULL),
(392, 269, 5, 57, '2021-07-03 16:27:07', '2021-07-03 16:27:07', NULL, NULL),
(393, 269, 4, 57, '2021-07-03 16:27:23', '2021-07-03 16:27:23', NULL, NULL),
(394, 269, 5, 57, '2021-07-03 16:27:40', '2021-07-03 16:27:40', NULL, NULL),
(395, 269, 4, 57, '2021-07-03 16:28:03', '2021-07-03 16:28:03', NULL, NULL),
(396, 269, 7, 57, '2021-07-04 13:40:37', '2021-07-04 13:40:37', NULL, NULL),
(397, 271, 1, 57, '2021-07-04 14:36:23', '2021-07-04 14:36:23', NULL, NULL),
(398, 251, 2, 53, '2021-07-09 14:01:58', '2021-07-09 14:01:58', NULL, NULL),
(399, 250, 2, 53, '2021-07-09 14:03:00', '2021-07-09 14:03:00', NULL, NULL),
(400, 249, 2, 53, '2021-07-09 14:04:41', '2021-07-09 14:04:41', NULL, NULL),
(401, 251, 3, 53, '2021-07-09 14:05:47', '2021-07-09 14:05:47', NULL, NULL),
(402, 251, 4, 53, '2021-07-09 14:58:57', '2021-07-09 14:58:57', NULL, 'تجريبي'),
(403, 250, 4, 53, '2021-07-09 14:58:57', '2021-07-09 14:58:57', NULL, 'تجريبي'),
(404, 249, 4, 53, '2021-07-09 14:58:57', '2021-07-09 14:58:57', NULL, 'تجريبي'),
(405, 248, 4, 53, '2021-07-09 14:58:58', '2021-07-09 14:58:58', NULL, 'تجريبي'),
(406, 251, 2, 53, '2021-07-09 15:01:35', '2021-07-09 15:01:35', NULL, NULL),
(407, 251, 3, 53, '2021-07-09 15:02:45', '2021-07-09 15:02:45', NULL, NULL),
(408, 251, 4, 53, '2021-07-09 15:11:36', '2021-07-09 15:11:36', NULL, NULL),
(409, 251, 2, 53, '2021-07-09 15:12:33', '2021-07-09 15:12:33', NULL, NULL),
(410, 251, 3, 53, '2021-07-10 08:56:57', '2021-07-10 08:56:57', NULL, NULL),
(411, 250, 2, 53, '2021-07-10 08:58:27', '2021-07-10 08:58:27', NULL, NULL),
(412, 249, 2, 53, '2021-07-10 08:58:28', '2021-07-10 08:58:28', NULL, NULL),
(413, 250, 4, 53, '2021-07-10 09:02:45', '2021-07-10 09:02:45', NULL, NULL),
(414, 249, 4, 53, '2021-07-10 09:02:45', '2021-07-10 09:02:45', NULL, NULL),
(415, 250, 2, 53, '2021-07-10 09:03:21', '2021-07-10 09:03:21', NULL, NULL),
(416, 249, 2, 53, '2021-07-10 09:03:22', '2021-07-10 09:03:22', NULL, NULL),
(417, 250, 4, 53, '2021-07-10 09:04:16', '2021-07-10 09:04:16', NULL, NULL),
(418, 249, 4, 53, '2021-07-10 09:04:17', '2021-07-10 09:04:17', NULL, NULL),
(419, 250, 2, 53, '2021-07-10 09:06:35', '2021-07-10 09:06:35', NULL, NULL),
(420, 249, 2, 53, '2021-07-10 09:06:36', '2021-07-10 09:06:36', NULL, NULL),
(421, 248, 2, 53, '2021-07-10 09:06:36', '2021-07-10 09:06:36', NULL, NULL),
(422, 250, 4, 53, '2021-07-10 09:06:59', '2021-07-10 09:06:59', NULL, NULL),
(423, 249, 4, 53, '2021-07-10 09:06:59', '2021-07-10 09:06:59', NULL, NULL),
(424, 248, 4, 53, '2021-07-10 09:07:00', '2021-07-10 09:07:00', NULL, NULL),
(425, 250, 2, 53, '2021-07-10 09:07:49', '2021-07-10 09:07:49', NULL, NULL),
(426, 249, 2, 53, '2021-07-10 09:07:50', '2021-07-10 09:07:50', NULL, NULL),
(427, 248, 2, 53, '2021-07-10 09:07:51', '2021-07-10 09:07:51', NULL, NULL),
(428, 249, 3, 53, '2021-07-10 09:09:40', '2021-07-10 09:09:40', NULL, NULL),
(429, 250, 3, 53, '2021-07-10 09:09:40', '2021-07-10 09:09:40', NULL, NULL),
(430, 248, 3, 53, '2021-07-10 09:09:41', '2021-07-10 09:09:41', NULL, NULL),
(431, 250, 4, 53, '2021-07-10 09:10:53', '2021-07-10 09:10:53', NULL, NULL),
(432, 249, 4, 53, '2021-07-10 09:10:53', '2021-07-10 09:10:53', NULL, NULL),
(433, 248, 4, 53, '2021-07-10 09:10:54', '2021-07-10 09:10:54', NULL, NULL),
(434, 250, 5, 53, '2021-07-10 09:12:04', '2021-07-10 09:12:04', NULL, NULL),
(435, 248, 5, 53, '2021-07-10 09:12:05', '2021-07-10 09:12:05', NULL, NULL),
(436, 249, 5, 53, '2021-07-10 09:12:05', '2021-07-10 09:12:05', NULL, NULL),
(437, 250, 4, 53, '2021-07-10 09:15:08', '2021-07-10 09:15:08', NULL, NULL),
(438, 248, 4, 53, '2021-07-10 09:15:08', '2021-07-10 09:15:08', NULL, NULL),
(439, 249, 4, 53, '2021-07-10 09:15:09', '2021-07-10 09:15:09', NULL, NULL),
(440, 250, 5, 53, '2021-07-10 09:15:36', '2021-07-10 09:15:36', NULL, NULL),
(441, 249, 3, 53, '2021-07-10 09:15:52', '2021-07-10 09:15:52', NULL, NULL),
(442, 248, 3, 53, '2021-07-10 09:15:52', '2021-07-10 09:15:52', NULL, NULL),
(443, 249, 4, 53, '2021-07-10 09:16:11', '2021-07-10 09:16:11', NULL, NULL),
(444, 248, 4, 53, '2021-07-10 09:16:12', '2021-07-10 09:16:12', NULL, NULL),
(445, 249, 7, 53, '2021-07-10 09:16:33', '2021-07-10 09:16:33', NULL, NULL),
(446, 248, 7, 53, '2021-07-10 09:16:34', '2021-07-10 09:16:34', NULL, NULL),
(447, 250, 4, 53, '2021-07-10 09:19:21', '2021-07-10 09:19:21', NULL, NULL),
(448, 250, 3, 53, '2021-07-10 11:48:34', '2021-07-10 11:48:34', NULL, NULL),
(449, 251, 4, 53, '2021-07-10 11:48:51', '2021-07-10 11:48:51', NULL, NULL),
(450, 250, 4, 53, '2021-07-10 11:48:52', '2021-07-10 11:48:52', NULL, NULL),
(451, 270, 3, 68, '2021-07-12 12:49:55', '2021-07-12 12:49:55', NULL, NULL),
(452, 250, 3, 68, '2021-07-12 12:49:56', '2021-07-12 12:49:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Point of sale', 'POS', '2021-01-06 18:54:01', '2021-01-13 16:38:05', NULL),
(2, 'Logistics and Transportation', 'Logistics', '2021-01-06 18:55:05', '2021-01-13 16:37:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `manual_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `company_id`, `customer_id`, `amount`, `collection_id`, `created_at`, `updated_at`, `deleted_at`, `trans_type`, `manual_number`, `driver_id`) VALUES
(261, 248, 26, 10, -50, NULL, '2021-03-17 20:56:22', '2021-03-17 20:56:22', NULL, 1, NULL, NULL),
(262, 248, 26, 10, 20, NULL, '2021-03-17 20:56:22', '2021-03-17 20:56:22', NULL, 2, NULL, NULL),
(263, 248, 26, 10, 50, NULL, '2021-03-18 04:23:37', '2021-03-18 04:23:37', NULL, 4, NULL, NULL),
(264, 248, 26, 10, -20, NULL, '2021-03-18 04:23:37', '2021-03-18 04:23:37', NULL, 5, NULL, NULL),
(265, 248, 26, 10, 10, NULL, '2021-03-18 04:23:37', '2021-03-18 04:23:37', NULL, 6, NULL, NULL),
(266, 249, 26, 10, -10, NULL, '2021-03-18 15:31:39', '2021-03-18 15:31:39', NULL, 1, NULL, NULL),
(267, 250, 26, 10, -5, NULL, '2021-03-27 05:39:24', '2021-03-27 05:39:24', NULL, 1, NULL, NULL),
(268, 251, 26, 10, -5, NULL, '2021-03-27 05:43:11', '2021-03-27 05:43:11', NULL, 1, NULL, NULL),
(269, 268, 57, 11, -1, NULL, '2021-06-24 13:29:45', '2021-06-24 13:29:45', NULL, 1, NULL, 26),
(270, 269, 27, 11, -1, NULL, '2021-06-24 13:36:12', '2021-06-24 13:36:12', NULL, 1, NULL, 26),
(271, 270, 27, 11, -121, NULL, '2021-06-24 14:11:03', '2021-06-24 14:11:03', NULL, 1, NULL, 26),
(272, 270, 27, 11, 121, NULL, '2021-06-25 14:55:35', '2021-06-25 14:55:35', NULL, 4, NULL, 26),
(273, NULL, 27, 11, 1, NULL, '2021-07-03 12:13:34', '2021-07-03 12:13:34', NULL, 3, 'شسيب', NULL),
(274, 269, 27, 11, 1, NULL, '2021-07-04 13:40:37', '2021-07-04 13:40:37', NULL, 4, NULL, 26),
(275, 271, 27, 11, -10, NULL, '2021-07-04 14:36:23', '2021-07-04 14:36:23', NULL, 1, NULL, 26),
(276, 249, 26, 10, 10, NULL, '2021-07-10 09:16:33', '2021-07-10 09:16:33', NULL, 4, NULL, NULL),
(277, 249, 26, 10, 10, NULL, '2021-07-10 09:16:33', '2021-07-10 09:16:33', NULL, 6, NULL, NULL),
(278, 248, 26, 10, 50, NULL, '2021-07-10 09:16:34', '2021-07-10 09:16:34', NULL, 4, NULL, NULL),
(279, 248, 26, 10, -20, NULL, '2021-07-10 09:16:34', '2021-07-10 09:16:34', NULL, 5, NULL, NULL),
(280, 248, 26, 10, 10, NULL, '2021-07-10 09:16:34', '2021-07-10 09:16:34', NULL, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-12-05 07:17:10', '2020-12-05 07:17:10'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-12-05 07:17:10', '2020-12-05 07:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `system_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `system_id`, `type`, `active`, `company_id`) VALUES
(1, 1, 'Admin', 'admin@act.ps', 'users/February2021/zNqmapDsFreJHmlweGKH.png', NULL, '$2y$10$syCLLqfp4t9rsGJA5T8MPe0Rvn9VhndCzMiOi/OWwncoLpU96sDA.', NULL, '{\"locale\":\"en\"}', '2020-12-05 07:17:10', '2021-02-02 14:14:17', 1, 1, 0, NULL),
(11, 1, 'Anas Takrouri', 'anas@act.ps', 'users/March2021/kfrKiJwOQnXeE9DquEPb.png', NULL, '$2y$10$v9/ae4.tlydv6L/OtpZiq.4d9P51WSpFkSBkuVCnUY3OAsfxNvzje', NULL, '{\"locale\":\"en\"}', '2021-02-03 14:41:27', '2021-03-01 13:18:38', 2, 1, 1, NULL),
(53, 2, 'Hani', 'hani.a.qudsi@gmail.com', 'users/default.png', NULL, '$2y$10$rY9xs5u39lAzg9YcSdsMTOpBlwfzSNSoRVHy2QEdNEb7ohTRUAUA6', NULL, NULL, '2021-03-17 20:36:11', '2021-07-11 12:11:19', 2, 1, 1, NULL),
(54, 2, 'S Hani', 's.hani@act.ps', 'users/default.png', NULL, '$2y$10$XKNgj.P7MJcDcHNv/t/3Mu7zpDt043JLbg7CBfneLUjCEM15l5BRe', NULL, NULL, '2021-03-17 20:37:42', '2021-03-17 20:37:42', 2, 2, 1, NULL),
(55, 2, '1', '1@act.ps', 'users/default.png', NULL, '$2y$10$CszeRwmX0g8.iOJSxzuFS.5NREvVOeV8pEdNRJ5pHWo9ggrCZQiU6', NULL, NULL, '2021-03-29 12:49:32', '2021-05-10 16:39:47', 2, 3, 1, NULL),
(56, 2, '2', '2@act.ps', 'users/default.png', NULL, '$2y$10$atw3jzfTVDCHWAApBnxAMuuTDLzuGb002dsADEuAaNhyd0cP0gPhC', NULL, NULL, '2021-03-29 12:50:23', '2021-03-29 12:50:23', 2, 3, 1, NULL),
(57, 2, 'ACT Company', 'actco@act.ps', 'users/default.png', NULL, '$2y$10$qFZw7bIJyPc/C5u.9Q5Z5OqZrdvX.QWaScasnbUmsSUbFPx0tgo7m', NULL, NULL, '2021-06-24 12:16:51', '2021-06-24 12:16:51', 2, 1, 1, NULL),
(58, 2, 'Act Supplier', 'actcu@act.ps', 'users/default.png', NULL, '$2y$10$5bJrKqLeTuXsRRXG7g2s8ed2VNeTx0g1Dq4oguZsBbCNy/lZQjN8q', NULL, NULL, '2021-06-24 12:18:13', '2021-06-24 12:18:13', 2, 2, 1, NULL),
(59, 2, 'Hani Q', 'actdr@act.ps', 'users/default.png', NULL, '$2y$10$aFjKBlY15Z7kzEjvqI5ahud8Z7CR1qynbAuoRfsK7xL5f9SMjFWuK', NULL, NULL, '2021-06-24 12:19:30', '2021-06-27 12:53:55', 2, 3, 1, NULL),
(60, 2, 'test', 'test@123.com', 'users/default.png', NULL, '$2y$10$5tD/xF60O4XiE1pB0ro.cOgizAR.fxKDCy/B/yPdQg./7CzyXKZCS', NULL, NULL, '2021-06-25 15:47:53', '2021-06-25 15:47:53', 2, 2, 1, NULL),
(61, 2, 'new manager', 'newmanager@act.ps', 'users/default.png', NULL, '$2y$10$Mmb9xeDU5NVBmkFHJOFOEu0oJjjnz8lYcvExdOEYPjJXMYsp/qKXK', NULL, NULL, '2021-07-06 16:35:47', '2021-07-06 16:35:47', 2, 1, 1, 12),
(62, 2, 'new driver', 'newdriver@act.ps', 'users/default.png', NULL, '$2y$10$vlnrrI5lMPEa799tB0FZeONlzjvr/B05A7GvW6Xcy3PwWCV4lkvqS', NULL, NULL, '2021-07-06 16:36:32', '2021-07-06 16:36:32', 2, 3, 1, 12),
(63, 2, 'drvier1', 'driver1@act.ps', 'users/default.png', NULL, '$2y$10$mJoPYBTe/lLJZEkoq2MJIewQ2/ZtfrZSEWPg3TnfEjK0AgDcpQACK', NULL, NULL, '2021-07-06 16:39:25', '2021-07-06 16:39:25', 2, 3, 1, 12),
(64, 2, 'assis', 'assis@act.ps', 'users/default.png', NULL, '$2y$10$qt/ka5I4m14KhJh6A1Xv7el2oh/wktNAqtIv00qx96130TSwoGW0C', NULL, NULL, '2021-07-06 16:41:17', '2021-07-06 16:41:17', 2, 4, 1, 12),
(65, 2, 'سائق 1', 'test@act.ps', 'users/default.png', NULL, '$2y$10$jbOO.q2NeoaiCcqSRmQhm.EH0wEU8n3PnHKiBmHd3FOX5ir59wyDi', NULL, NULL, '2021-07-09 08:56:52', '2021-07-09 08:56:52', 2, 3, 1, 26),
(66, 2, 'driver 2', 'test2@act.ps', 'users/default.png', NULL, '$2y$10$AHoYCSmI.lpj6VyLb5zrtuZPMOw71mse3pL0CrGjOB.35EDE15Xpu', NULL, NULL, '2021-07-09 08:57:10', '2021-07-09 08:57:10', 2, 3, 1, 26),
(67, 2, 'hani2', 'hani2@gmail.com', 'users/default.png', NULL, '$2y$10$rBbtqStpuKBdd9ytFl2Pfei3z7pwRqHbanpBGSghFGSBXzdud8O4.', NULL, NULL, '2021-07-12 04:47:02', '2021-07-12 04:47:02', 2, 1, 1, 26),
(68, 2, 'hani3', '0597264577', 'users/default.png', NULL, '$2y$10$p/oZv6TGd41WB8uddDrXU.9OaS1cUp0ITLCF0S.u.D4aFPlETZeMO', NULL, NULL, '2021-07-12 04:51:11', '2021-07-12 04:51:11', 2, 1, 1, 26);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_systems`
--

CREATE TABLE `user_systems` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `system_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_systems`
--

INSERT INTO `user_systems` (`user_id`, `system_id`) VALUES
(1, 1),
(1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_oid_index` (`oid`);

--
-- Indexes for table `company_customers`
--
ALTER TABLE `company_customers`
  ADD KEY `company_customers_company_id_index` (`company_id`),
  ADD KEY `company_customers_customer_id_index` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_collections`
--
ALTER TABLE `customer_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_oid_index` (`oid`);

--
-- Indexes for table `order_costs`
--
ALTER TABLE `order_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_drivers`
--
ALTER TABLE `order_drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_drivers_order_id_index` (`order_id`),
  ADD KEY `order_drivers_driver_id_index` (`driver_id`),
  ADD KEY `order_drivers_user_id_index` (`user_id`);

--
-- Indexes for table `pack_sizes`
--
ALTER TABLE `pack_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_details`
--
ALTER TABLE `status_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systems_name_unique` (`name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_system_id_index` (`system_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `user_systems`
--
ALTER TABLE `user_systems`
  ADD KEY `user_systems_user_id_index` (`user_id`),
  ADD KEY `user_systems_system_id_index` (`system_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_collections`
--
ALTER TABLE `customer_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `order_costs`
--
ALTER TABLE `order_costs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `order_drivers`
--
ALTER TABLE `order_drivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pack_sizes`
--
ALTER TABLE `pack_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status_details`
--
ALTER TABLE `status_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
