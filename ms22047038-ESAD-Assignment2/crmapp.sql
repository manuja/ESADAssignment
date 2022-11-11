-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2022 at 07:02 PM
-- Server version: 8.0.23
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crmapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `bg_color` varchar(255) NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `is_admin` int NOT NULL COMMENT '1-Admin 2-Staff 3-Member',
  `sequence` int NOT NULL DEFAULT '10000',
  `is_single` int NOT NULL DEFAULT '0',
  `is_division` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `bg_color`, `parent_id`, `is_admin`, `sequence`, `is_single`, `is_division`) VALUES
(1, 'admin', 'Administrator edited', '', 0, 1, 10000, 0, 0),
(2, 'Staff', 'Staff', '', 0, 0, 10000, 0, 0),
(3, 'SLGS Member', 'SLGS Member', '', 0, 0, 10000, 0, 0),
(4, 'Staff Member', 'Staff Member', '', 2, 0, 10000, 0, 0),
(5, 'Member', 'Member', '', 3, 0, 10000, 0, 0),
(9, 'Test', 'Test', '', 0, 0, 10000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_permissions`
--

CREATE TABLE `group_permissions` (
  `perm_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_permissions`
--

INSERT INTO `group_permissions` (`perm_id`, `group_id`) VALUES
(123, 4),
(123, 5),
(124, 4),
(124, 5),
(125, 4),
(125, 5),
(126, 5),
(127, 4),
(127, 5),
(128, 5),
(129, 4),
(129, 5),
(130, 4),
(130, 5),
(131, 4),
(132, 4),
(134, 4),
(135, 4),
(136, 4),
(137, 4),
(138, 0),
(138, 4),
(139, 0),
(139, 4),
(140, 4),
(141, 4),
(142, 4),
(143, 4),
(144, 5),
(145, 5),
(146, 5),
(147, 5);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(0, '::1', 'root', 1668094892),
(0, '::1', 'root', 1668099175);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avail_qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `name`, `avail_qty`) VALUES
(1, 'Shirt', 12),
(2, 'Blouse', 18),
(3, 'Frock', 4),
(4, 'Hat', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE `orderlist` (
  `id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dval` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `order_item_id` int DEFAULT NULL,
  `quantity_of_raw_material_used` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderlist`
--

INSERT INTO `orderlist` (`id`, `description`, `dval`, `qty`, `order_id`, `order_item_id`, `quantity_of_raw_material_used`) VALUES
(1, NULL, NULL, 70, 1, 2, NULL),
(2, NULL, NULL, 20, 1, 1, NULL),
(3, NULL, NULL, 30, 2, 4, NULL),
(4, NULL, NULL, 50, 2, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`) VALUES
(1, 'FoodOrder'),
(2, 'ClothOrder');

-- --------------------------------------------------------

--
-- Table structure for table `permission_history`
--

CREATE TABLE `permission_history` (
  `perm_history_id` int NOT NULL,
  `updated_user` int DEFAULT NULL,
  `userId_or_groupId` int DEFAULT NULL,
  `perm_type` int DEFAULT NULL COMMENT '1 - user permissions   2 - group permissions',
  `status` int DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission_history`
--

INSERT INTO `permission_history` (`perm_history_id`, `updated_user`, `userId_or_groupId`, `perm_type`, `status`, `updated_date`, `updated_time`) VALUES
(1, 1, 4, 2, 1, '2021-09-03', '11:29:19'),
(2, 1, 4, 2, 1, '2021-09-06', '13:24:55'),
(3, 1, 4, 2, 1, '2021-09-07', '11:50:57'),
(4, 1, 4, 2, 1, '2021-09-07', '12:31:12'),
(5, 1, 4, 2, 1, '2021-09-07', '12:32:40'),
(6, 1, 4, 2, 1, '2021-09-07', '12:33:33'),
(7, 1, 4, 2, 1, '2021-09-07', '12:43:28'),
(8, 1, 4, 2, 1, '2021-09-07', '12:43:54'),
(9, 1, 15, 1, 1, '2021-09-07', '12:44:55'),
(10, 1, 4, 2, 1, '2021-09-07', '12:52:23'),
(11, 1, 4, 2, 1, '2021-09-07', '12:53:25'),
(12, 1, 4, 2, 1, '2021-09-07', '12:54:25'),
(13, 1, 4, 2, 1, '2021-09-07', '12:55:45'),
(14, 1, 15, 1, 1, '2021-09-07', '12:56:36'),
(15, 1, 4, 2, 1, '2021-09-08', '16:07:42'),
(16, 1, 4, 2, 1, '2021-09-23', '09:27:02'),
(17, 1, 4, 2, 1, '2021-09-27', '00:00:54'),
(18, 1, 5, 2, 1, '2021-09-27', '00:01:07'),
(19, 1, 5, 2, 1, '2021-09-27', '00:01:13'),
(20, 1, 4, 2, 1, '2021-09-27', '00:01:19'),
(21, 1, 5, 2, 1, '2021-09-27', '00:04:27'),
(22, 1, 4, 2, 1, '2021-09-27', '07:56:58'),
(23, 1, 4, 2, 1, '2021-09-27', '09:28:19'),
(24, 1, 5, 2, 1, '2021-09-27', '09:28:30'),
(25, 1, 4, 2, 1, '2021-09-27', '11:04:20'),
(26, 1, 5, 2, 1, '2021-09-27', '11:04:36'),
(27, 1, 4, 2, 1, '2021-09-27', '12:51:39'),
(28, 1, 5, 2, 1, '2021-09-27', '12:51:47'),
(29, 1, 4, 2, 1, '2021-09-27', '13:10:18'),
(30, 1, 4, 2, 1, '2021-09-27', '14:10:04'),
(31, 1, 4, 2, 1, '2021-09-29', '11:04:53'),
(32, 1, 4, 2, 1, '2021-09-29', '11:16:37'),
(33, 1, 5, 2, 1, '2021-09-29', '11:16:45'),
(34, 1, 5, 2, 1, '2021-09-29', '11:16:50'),
(35, 1, 4, 2, 1, '2021-10-04', '14:08:47'),
(36, 1, 4, 2, 1, '2021-10-04', '14:22:03'),
(37, 1, 4, 2, 1, '2021-10-05', '16:00:03'),
(38, 1, 0, 2, 1, '2021-10-15', '19:24:56'),
(39, 1, 4, 2, 1, '2021-10-15', '19:25:05'),
(40, 1, 229, 1, 1, '2021-12-06', '14:07:51'),
(41, 1, 224, 1, 1, '2021-12-07', '14:48:41'),
(42, 1, 4, 2, 1, '2022-03-28', '08:38:02'),
(43, 1, 5, 2, 1, '2022-03-28', '08:38:18'),
(44, 1, 4, 2, 1, '2022-04-27', '01:27:10'),
(45, 1, 4, 2, 1, '2022-04-27', '01:27:31'),
(46, 1, 1, 1, 1, '2022-11-07', '22:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int NOT NULL COMMENT 'primary key',
  `name` varchar(255) NOT NULL COMMENT 'staff name',
  `email` varchar(255) NOT NULL COMMENT 'Email Address',
  `mobile` varchar(16) DEFAULT NULL,
  `address` text,
  `salary` float(10,2) NOT NULL COMMENT 'staff salary'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `mobile`, `address`, `salary`) VALUES
(1, 'Samson', 'samson@webdamn.com', '1234567890', 'London', 457002.00),
(2, 'Jhon', 'jhon@webdamn.com', '1234567890', 'Paris', 456003.00),
(22, 'momo', 'ujithamanuja@gmail.com', '0759194781', '693/2/62, Supercity, Nawagamuwa, Ranaala', 20.00),
(23, 'saman', 'sama@gmail.com', '0769194781', 'dsdsd', 12344.00),
(24, 'Suneth', 's@gmail.com', '0769194781', '693/2/62, Supercity, Nawagamuwa, Ranaala', 2333.00);

-- --------------------------------------------------------

--
-- Table structure for table `status_comment`
--

CREATE TABLE `status_comment` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_comment`
--

INSERT INTO `status_comment` (`id`, `user_id`, `comment`, `created_at`) VALUES
(1, 209, 'Test', '2021-10-05 12:08:29'),
(3, 208, 'test', '2021-10-07 04:16:23'),
(4, 213, 'Accept', '2021-10-11 04:38:07'),
(5, 213, ' Comment - Accept\r\n Date - 2021-10-11 Time - 10:08:07 AM', '2021-10-11 04:38:28'),
(6, 213, ' Comment -  Comment - Accept\r\n Date - 2021-10-11 Time - 10:08:07 AM\r\n Date - 2021-10-11 Time - 10:08:28 AM', '2021-10-11 04:39:48'),
(7, 213, ' Comment -  Comment -  Comment - Accept\r\n Date - 2021-10-11 Time - 10:08:07 AM\r\n Date - 2021-10-11 Time - 10:08:28 AM\r\n Date - 2021-10-11 Time - 10:09:48 AM', '2021-10-11 04:40:54'),
(8, 213, ' Comment -  Comment -  Comment -  Comment - Accept\r\n Date - 2021-10-11 Time - 10:08:07 AM\r\n Date - 2021-10-11 Time - 10:08:28 AM\r\n Date - 2021-10-11 Time - 10:09:48 AM\r\n Date - 2021-10-11 Time - 10:10:54 AM', '2021-10-11 04:41:40'),
(9, 207, 'Payment Done Manually', '2021-10-11 05:16:06'),
(10, 207, ' Comment - Payment Done Manually\r\n Date - 2021-10-11 Time - 10:46:06 AM', '2021-10-11 05:17:28'),
(11, 209, ' Comment - Test\r\n Date - 2021-10-05 Time - 5:38:29 PM', '2021-10-11 05:24:47'),
(12, 214, 'approved', '2021-10-11 05:49:59'),
(13, 214, 'paid', '2021-10-11 05:51:16'),
(14, 214, ' Comment - paid\r\n Date - 2021-10-11 Time - 11:21:16 AM', '2021-10-11 05:51:58'),
(15, 215, 'Approved', '2021-10-11 06:14:02'),
(16, 215, ' Comment - Approved\r\n Date - 2021-10-11 Time - 11:44:02 AM', '2021-10-11 06:14:21'),
(17, 215, ' Comment -  Comment - Approved\r\n Date - 2021-10-11 Time - 11:44:02 AM\r\n Date - 2021-10-11 Time - 11:44:21 AM', '2021-10-11 06:15:58'),
(18, 209, ' Comment -  Comment - Test\r\n Date - 2021-10-05 Time - 5:38:29 PM\r\n Date - 2021-10-11 Time - 10:54:47 AM', '2021-10-11 06:20:24'),
(19, 209, ' Comment -  Comment -  Comment - Test\r\n Date - 2021-10-05 Time - 5:38:29 PM\r\n Date - 2021-10-11 Time - 10:54:47 AM\r\n Date - 2021-10-11 Time - 11:50:24 AM', '2021-10-11 06:21:13'),
(20, 214, ' renewed', '2021-10-11 06:44:11'),
(21, 214, 'terminated', '2021-10-11 06:45:08'),
(22, 214, ' Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM', '2021-10-11 06:46:04'),
(23, 213, ' Comment -  Comment -  Comment -  Comment -  Comment - Accept\r\n Date - 2021-10-11 Time - 10:08:07 AM\r\n Date - 2021-10-11 Time - 10:08:28 AM\r\n Date - 2021-10-11 Time - 10:09:48 AM\r\n Date - 2021-10-11 Time - 10:10:54 AM\r\n Date - 2021-10-11 Time - 10:11:40 AM', '2021-10-16 04:09:11'),
(24, 219, 'Activated', '2021-10-16 06:21:23'),
(25, 213, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Accept\r\n Date - 2021-10-11 Time - 10:08:07 AM\r\n Date - 2021-10-11 Time - 10:08:28 AM\r\n Date - 2021-10-11 Time - 10:09:48 AM\r\n Date - 2021-10-11 Time - 10:10:54 AM\r\n Date - 2021-10-11 Time - 10:11:40 AM\r\n Date - 2021-10-16 Time - 9:39:', '2021-10-16 07:06:19'),
(26, 214, ' Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM', '2021-11-05 06:34:28'),
(27, 214, ' Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM', '2021-11-05 06:43:35'),
(28, 214, ' Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM', '2021-12-07 09:26:25'),
(29, 214, ' Comment -  Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM\r\n Date - 2021-12-07 Time - 2:56:25 PM', '2021-12-07 09:26:39'),
(30, 231, 'APPLICATION APPROVED', '2021-12-07 09:43:14'),
(31, 231, ' Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM', '2021-12-07 09:44:32'),
(32, 231, ' Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM', '2021-12-07 09:45:40'),
(33, 231, ' Comment -  Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM\r\n Date - 2021-12-07 Time - 3:15:40 PM', '2021-12-07 09:46:50'),
(34, 231, ' Comment -  Comment -  Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM\r\n Date - 2021-12-07 Time - 3:15:40 PM\r\n Date - 2021-12-07 Time - 3:16:50 PM', '2021-12-07 09:48:28'),
(35, 231, ' Comment -  Comment -  Comment -  Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM\r\n Date - 2021-12-07 Time - 3:15:40 PM\r\n Date - 2021-12-07 Time - 3:16:50 PM\r\n Date - 2021-12-07 Time - 3:18:28 PM', '2021-12-07 09:50:10'),
(36, 231, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM\r\n Date - 2021-12-07 Time - 3:15:40 PM\r\n Date - 2021-12-07 Time - 3:16:50 PM\r\n Date - 2021-12-07 Time - 3:18:28 PM\r\n Date - 2021-12-07 Tim', '2021-12-07 10:27:18'),
(37, 231, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM\r\n Date - 2021-12-07 Time - 3:15:40 PM\r\n Date - 2021-12-07 Time - 3:16:50 PM\r\n Date - 2021-12-07 Time - 3:18:28 PM\r\n Date - 202', '2022-03-02 06:13:52'),
(38, 231, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - APPLICATION APPROVED\r\n Date - 2021-12-07 Time - 3:13:14 PM\r\n Date - 2021-12-07 Time - 3:14:32 PM\r\n Date - 2021-12-07 Time - 3:15:40 PM\r\n Date - 2021-12-07 Time - 3:16:50 PM\r\n Date - 2021-12-07 Time - 3:18:28 PM\r\n', '2022-03-02 06:14:05'),
(48, 234, 'paid for 2021', '2022-03-29 23:13:16'),
(49, 234, ' Comment - paid for 2021\r\n Date - 2022-03-29 Time - 4:43:16 AM', '2022-03-29 23:16:54'),
(50, 234, ' Comment -  Comment - paid for 2021\r\n Date - 2022-03-29 Time - 4:43:16 AM\r\n Date - 2022-03-29 Time - 4:46:54 AM', '2022-03-29 23:17:32'),
(51, 233, 'Paid', '2022-03-30 04:38:47'),
(52, 233, ' Comment - Paid\r\n Date - 2022-03-30 Time - 10:08:47 AM', '2022-03-30 04:57:14'),
(53, 235, 'Approved', '2022-03-31 08:17:55'),
(54, 235, ' Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM', '2022-03-31 08:18:43'),
(55, 235, ' Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM', '2022-03-31 08:21:30'),
(56, 235, ' Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM', '2022-03-31 08:24:09'),
(57, 235, ' Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM', '2022-03-31 08:25:29'),
(58, 235, ' Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-31 Time - 1:55:29 PM', '2022-04-06 03:12:33'),
(59, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-31 Time - 1:55:29 PM\r\n Date - 2022-04-06 Time - 8:42:33 ', '2022-04-06 03:13:06'),
(60, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-31 Time - 1:55:29 PM\r\n Date - 2022-04-06 Time', '2022-04-06 11:43:47'),
(61, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-31 Time - 1:55:29 PM\r\n Date - 2022', '2022-04-06 11:44:12'),
(62, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-31 Time - 1:55:29 PM\r\n ', '2022-04-06 11:46:28'),
(63, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-31 Time - 1:', '2022-04-08 10:56:47'),
(64, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date - 2022-03-3', '2022-04-08 10:57:24'),
(65, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09 PM\r\n Date ', '2022-04-08 10:58:44'),
(66, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Time - 1:54:09', '2022-04-08 10:59:22'),
(67, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 2022-03-31 Tim', '2022-04-08 11:00:47'),
(68, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n Date - 202', '2022-04-08 11:01:48'),
(69, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1:51:30 PM\r\n', '2022-04-08 11:02:26'),
(70, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-31 Time - 1', '2022-04-08 11:03:37'),
(71, 214, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM\r\n Date - 2021-12-07 Time - 2:56:25 PM\r\n Date - 2021-12-07 Time - 2:', '2022-04-18 09:04:43'),
(72, 214, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM\r\n Date - 2021-12-07 Time - 2:56:25 PM\r\n Date - 2021-12-0', '2022-04-18 09:05:33'),
(73, 214, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM\r\n Date - 2021-12-07 Time - 2:56:25 PM\r\n Date ', '2022-04-18 09:31:05'),
(74, 214, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM\r\n Date - 2021-12-07 Time - 2:56:25', '2022-04-18 09:38:16'),
(75, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date - 2022-03-', '2022-04-18 09:47:45'),
(76, 235, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - Approved\r\n Date - 2022-03-31 Time - 1:47:55 PM\r\n Date - 2022-03-31 Time - 1:48:43 PM\r\n Date', '2022-04-18 09:48:31'),
(77, 214, ' Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment -  Comment - terminated\r\n Date - 2021-10-11 Time - 12:15:08 PM\r\n Date - 2021-10-11 Time - 12:16:04 PM\r\n Date - 2021-11-05 Time - 12:04:28 PM\r\n Date - 2021-11-05 Time - 12:13:35 PM\r\n Date - 2021-12-07 Tim', '2022-04-18 09:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `system_menu`
--

CREATE TABLE `system_menu` (
  `menu_id` int NOT NULL,
  `menu_level` int NOT NULL,
  `menu_title` varchar(50) NOT NULL,
  `menu_icon` varchar(80) NOT NULL,
  `menu_path` varchar(100) NOT NULL,
  `permission_id` int NOT NULL,
  `menu_parent` int NOT NULL,
  `row_order` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `permission_parent_id` int DEFAULT NULL,
  `permission_child_id` int DEFAULT NULL,
  `permission_grand_child_id` int DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_menu`
--

INSERT INTO `system_menu` (`menu_id`, `menu_level`, `menu_title`, `menu_icon`, `menu_path`, `permission_id`, `menu_parent`, `row_order`, `status`, `permission_parent_id`, `permission_child_id`, `permission_grand_child_id`, `created_date`) VALUES
(3, 1, 'View Profile', 'fa-address-book', '#', 10, 0, 1, 1, 9, 10, NULL, '2021-04-01'),
(4, 2, 'My Profile', '', 'my-profile', 10, 3, 1, 1, 9, 10, NULL, '2021-04-01'),
(5, 1, 'Users', 'fa-group', '#', 0, 0, 2, 1, 0, 0, NULL, '2021-04-05'),
(6, 2, 'All Users', '', 'users', 11, 5, 1, 1, 3, 11, NULL, '2021-04-05'),
(7, 2, 'User Groups', '', 'groups', 16, 5, 2, 1, 15, 16, NULL, '2021-04-05'),
(8, 2, 'User Permissions', '', 'user_permissions', 23, 5, 3, 1, 3, 23, NULL, '2021-04-05'),
(9, 2, 'Group Permissions', '', 'group_permissions', 20, 5, 4, 1, 3, 20, NULL, '2021-04-05'),
(10, 1, 'Employee', 'fa-users', '#', 0, 0, 3, 1, 0, 0, NULL, '2021-04-05'),
(11, 2, 'All Employees', '', 'employees', 4, 10, 1, 1, 1, 4, NULL, '2021-04-05'),
(14, 1, 'Settings', 'fa-cogs', '#', 0, 0, 10, 1, 0, 0, NULL, '2021-04-05'),
(15, 2, 'System Menu', '', 'system_menu', 26, 14, 1, 1, 25, 26, NULL, '2021-04-05'),
(16, 2, 'System Permission', '', 'permissions', 29, 14, 2, 1, 25, 29, NULL, '2021-04-05'),
(17, 2, 'Access Control Matrix', '', 'access_control_matrix', 32, 14, 3, 1, 25, 32, NULL, '2021-04-05'),
(20, 1, 'Event Management', 'fa-calendar', '#', 0, 0, 3, 1, 0, 0, NULL, '2021-09-07'),
(21, 2, 'Event', 'fa-arrow-circle-o-right', 'event_management', 118, 20, 1, 1, 117, 118, NULL, '2021-09-07'),
(22, 1, 'Publication', 'fa-bullhorn', '#', 0, 0, 3, 1, 0, NULL, NULL, '2021-09-23'),
(23, 2, 'Manage Publications', 'fa-angle-double-right', 'publication', 124, 22, 1, 1, 123, 124, NULL, '2021-09-23'),
(24, 2, 'View Publications', 'fa-angle-double-right', 'view-user-publication', 125, 22, 2, 1, 123, 125, NULL, '2021-09-23'),
(25, 1, 'Member', 'fa-address-book-o', '#', 0, 0, 1, 1, 0, 0, NULL, '2021-09-27'),
(26, 2, 'Member Management', 'fa-angle-double-right', 'member-management', 132, 25, 1, 1, 131, 132, NULL, '2021-10-05'),
(31, 1, 'Notification', 'fa-bell-o', '#', 0, 0, 4, 1, 0, 0, NULL, '2021-10-15'),
(32, 2, 'Custome notification', 'fa-angle-double-right', 'custome-notification', 139, 31, 1, 1, 138, 139, NULL, '2021-10-15'),
(33, 1, 'Payment', 'fa-dollar', '#', 0, 0, 5, 1, 0, 0, NULL, '2022-03-28'),
(34, 2, 'Payment History', 'fa-angle-double-right', 'member-management/member_payment_history', 145, 33, 1, 1, 144, 145, NULL, '2022-03-28');

-- --------------------------------------------------------

--
-- Table structure for table `system_permissions`
--

CREATE TABLE `system_permissions` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission_code` varchar(255) NOT NULL,
  `hash_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `level` int NOT NULL,
  `sequence` int NOT NULL DEFAULT '10000',
  `is_child` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_permissions`
--

INSERT INTO `system_permissions` (`id`, `name`, `permission_code`, `hash_code`, `description`, `parent_id`, `level`, `sequence`, `is_child`) VALUES
(1, 'Employees', 'emp', 'ac8be4aee61f5f6e21b8c5afffb52939', 'Employees', 0, 1, 10000, 0),
(3, 'User', '', 'd41d8cd98f00b204e9800998ecf8427e', 'User', 0, 1, 10000, 0),
(4, 'All Employees', 'emp_all', 'c01806913f1b4a3faa0462483f1b98f2', 'All Employees', 1, 2, 10000, 0),
(5, 'Create Employee', 'emp_create', '4b6302e46d0778e413b2ddd0f7a7d66d', 'Create Employee', 4, 3, 10000, 0),
(6, 'View Employee', 'emp_view', '7fe6930c7181d074f58bd568684a5891', 'View Employee', 4, 3, 10000, 0),
(7, 'Edit Employee', 'emp_edit', 'cc6a0a1b3335e1f79cc4f47404b2e893', 'Edit Employee', 4, 3, 10000, 0),
(9, 'My Profile', 'profile', '7d97481b1fe66f4b51db90da7e794d9f', 'Profile', 0, 1, 10000, 0),
(10, 'View Profile', 'profile_view', 'c9cc318fe3f719d66d6f5afd151c0320', 'View Profile', 9, 2, 10000, 0),
(11, 'All Users', 'users', '9bc65c2abec141778ffaa729489f3e87', 'All Users', 3, 2, 10000, 0),
(17, 'Add User', 'user_add', 'f18c0b441e99ddc8c8750445f096e4f2', 'Add User', 11, 3, 10000, 0),
(18, 'Edit User', 'user_edit', '892680f4a1e9bfcab0bd7a22b5c19024', 'Edit User', 11, 3, 10000, 0),
(19, 'Active User', 'user_active', '45e292341c5e66fdc8e78b785ad93f55', 'Active User', 11, 3, 10000, 0),
(20, 'User Groups', 'user_group', 'd7a1715b3eb4a0693d0877835f1b89d4', 'User Groups', 3, 2, 10000, 0),
(21, 'Add User Groups', 'user_add_group', '718bb5813298e43c3d3dd8fc1aa1f1e3', 'Add User Groups', 20, 3, 10000, 0),
(22, 'Add User Sub Groups', 'user_sub_group_add', 'e12eb564cc162e30b5ee19ed7f88259d', 'User Sub Groups', 20, 3, 10000, 0),
(23, 'User Permissions', 'permission_user', 'f90e21cf1297967dcf645cd51d4baf5c', 'User Permissions', 3, 2, 10000, 0),
(24, 'Group Permission', 'permission_group', '0aca056ab644aeb99df707b455e55a8e', 'Group Permission', 3, 2, 10000, 0),
(25, 'Settings', 'setting', '7dc22b2c6a992f0232345df41303f5ea', 'Settings', 0, 1, 10000, 0),
(26, 'System Menu', 'setting_menu', 'ff07beb23c3d9075925cb775ca685101', 'System Menu', 25, 2, 10000, 0),
(27, 'Add Menu', 'add_menu', '677a5d06239d5a7abeb6b2b9720be4e6', 'Add Menu', 26, 3, 10000, 0),
(28, 'Edit Menu', 'edit_menu', '356b37e982fa45a468cf05530cfc9cba', 'Edit Menu', 26, 3, 10000, 0),
(29, 'System Permission', 'system_permission', '5b68c0ad7bd555aec837ba9c1ba57f6c', 'System Permission', 25, 2, 10000, 0),
(30, 'Add Permission', 'add_permission', '7b2fbe6fba02669386a0489df19f27d5', 'Add Permission', 29, 3, 10000, 0),
(31, 'Edit Permission', 'edit_permission', 'a73a6cbc7abe3144d2f7e9674caf4a53', 'Edit Permission', 29, 3, 10000, 0),
(32, 'Access Control Matrix', 'access_metrics', 'ba1c285974c34fbdb9fcae221175ec4b', 'Access Control Matrix', 25, 2, 10000, 0),
(33, 'Edit Profile', 'profile_edit', 'ebe168884969ec40d67417b8b369d1a7', 'Edit Profile', 9, 2, 10000, 0),
(34, 'Edit User Groups', 'user_edit_group', 'b6d307478b939b3f17ca40d38a3c7790', 'Edit User Groups', 20, 3, 10000, 0),
(35, 'Delete Group', 'user_group_delete', '46efd05d1f4e0e25fca542aea5a87672', 'Delete Group', 20, 3, 10000, 0),
(36, 'Delete Permission', 'delete_permission', 'a0e0ae0743d3b870d7e3d61b2515b23e', 'Delete Permission', 29, 3, 10000, 0),
(117, 'Event', '', '', 'Event', 0, 1, 10000, 0),
(118, 'Event_management', 'event_management', '7251323a8363938ce6ddcd58bbdd41a0', 'event_management', 117, 2, 10000, 0),
(119, 'add_event', 'add_event', '02974eb362d11d66d6e3c88fb176a8b9', 'add_event', 118, 3, 10000, 0),
(120, 'Edit Events', 'edit_event', '46e1ee5960f4b340e7585d0c074c3a68', 'Edit Events', 118, 3, 10000, 0),
(121, 'Delete Event', 'delete_event', '1e51d4cf29a11234faff12b75e56aab4', 'Delete Event', 118, 3, 10000, 0),
(122, 'View Event', 'view_event', '78fa6eac67bb06ea19d1f436cdcb1421', 'View Event', 118, 3, 10000, 0),
(123, 'Publication', '', '', 'Publication', 0, 1, 10000, 0),
(124, 'Manage Publications', 'publication_all', 'ecc73b83caee836e912e7d449a998064', 'Manage Publications', 123, 2, 10000, 0),
(125, 'View Publications', 'publication_all_user_view', 'e542727ee29d494655f6a08106202412', 'View Publications', 123, 2, 10000, 0),
(126, 'Add publication', 'publication_add', 'fa5b1d8a6cdc70ccf41b729e531ea99e', 'Add publication', 124, 3, 10000, 0),
(127, 'View publication', 'publication_view', 'b29073a1e84fb42d40c8ba1c4d79f77d', 'View publication', 124, 3, 10000, 0),
(128, 'Edit publication', 'publication_edit', '0e852a8acc8fc14986ff6ab9573761fc', 'Edit publication', 124, 3, 10000, 0),
(129, 'View user publication', 'publication_user_view', 'f4aae37c90dadeeee659da9e3dc15e2f', 'View user publication', 125, 3, 10000, 0),
(130, 'Publication Status Update', 'publication_status_update', '265a1a88acdc6d60188df96b848e354c', 'Publication Status Update', 124, 3, 10000, 0),
(131, 'Member Management', '', '', 'Member Management', 0, 1, 10000, 0),
(132, 'All Member', 'member_management', '2d06431960e93a9ad77850bba6071103', 'All Member', 131, 2, 10000, 0),
(134, 'Add Member', 'add_member', '4fef5d2920ee953785f92d7dac514ae9', 'Add Member', 132, 3, 10000, 0),
(135, 'View Member', 'view_member', 'e7ef2421c29b766910f7bf4d8721a2de', 'View Member', 132, 3, 10000, 0),
(136, 'Edit Member', 'edit_member', '037ae216b1614bdcecb2e929835f5bfb', 'Edit Member', 132, 3, 10000, 0),
(137, 'Member Status', 'status_change_member', '0b1bd4ec7be4492afa78b9c18e750629', 'Member Status', 132, 3, 10000, 0),
(138, 'Notification', '', '', 'Notification', 0, 1, 10000, 0),
(139, 'Custome Notification', 'custome_notification', '8963d3a1a4e3d40029457baf94ff6180', 'Custome Notification', 138, 2, 10000, 0),
(140, 'Member Payment', 'payment_history', 'fb5f2750a340489c627c21f787778bc9', 'Member Payment', 132, 3, 10000, 0),
(141, 'payment History - staff', 'payment_history_staff', '36a1a020c7f58b3e4674f909d0cfa33d', 'payment History - staff', 132, 3, 10000, 0),
(142, 'payment History - staff  - View', 'payment_history_staff_view', 'b9198d2cdbae6ac453bbfee672b6504e', 'payment History - staff  - View', 132, 3, 10000, 0),
(143, 'payment History - staff  - Attachment Download', 'payment_history_staff_attachment', 'd34cbca5ba58507f4efcf6d29a180f4f', 'payment History - staff  - Attachment Download', 132, 3, 10000, 0),
(144, 'Payment Management Member', '', '', 'Payment Management Member', 0, 1, 10000, 0),
(145, 'Payment History', 'payment_slgs_member', '9e49b623193edbf3230460d4a7366ec3', 'Payment History', 144, 2, 10000, 0),
(146, 'payment History - member  - View', 'payment_history_member_view', 'f88367455dd5fb180f5a54fbae280c2f', 'payment History - member  - View', 145, 3, 10000, 0),
(147, 'payment History - member  - Attachment Download', 'payment_history_member_attachment', 'c664b0099b5519b185b9597c3588f9e8', 'payment History - member  - Attachment Download', 145, 3, 10000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_sequences`
--

CREATE TABLE `system_sequences` (
  `system_sequnces_id` int NOT NULL,
  `sequence_value` int NOT NULL,
  `sequence_name` varchar(50) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `state` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_variables`
--

CREATE TABLE `system_variables` (
  `system_variable_id` int NOT NULL,
  `system_variable_name` varchar(100) NOT NULL,
  `system_variable_value` varchar(50) NOT NULL,
  `system_variable_description` varchar(500) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `state` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_variables`
--

INSERT INTO `system_variables` (`system_variable_id`, `system_variable_name`, `system_variable_value`, `system_variable_description`, `created_datetime`, `updated_datetime`, `state`) VALUES
(1, 'member_reinstatement_eligible_time_period', '3', 'years - time duration which a user is eligible for reinstatement after membership expiration', '2018-05-28 05:32:30', '0000-00-00 00:00:00', 1),
(2, 'notification_expire_duration', '30', 'days - Default notification expiration duration', '2018-07-06 01:44:46', '2018-07-06 01:45:45', 1),
(3, 'notification_fetch_interval_member', '900000', 'milliseconds - notification refresh interval for members', '2018-07-06 01:52:04', '2018-07-11 01:12:11', 1),
(4, 'notification_fetch_interval_admin', '300000', 'milliseconds - notification refresh interval for admins', '2018-07-06 01:52:04', '2018-07-11 01:11:30', 1),
(5, 'notification_priority_top_limit', '5', 'number - Top priority notification limit to show', '2018-07-10 06:12:02', '0000-00-00 00:00:00', 1),
(6, 'notification_total_top_limit', '10', 'number - All notification limit to show', '2018-07-10 06:12:02', '0000-00-00 00:00:00', 1),
(18, 'iesl_web_url', 'http://192.168.1.201/iesl_snapshots/web', 'IESL Website link', '2018-05-28 05:32:30', '0000-00-00 00:00:00', 1),
(19, 'mis_version', '1.0.0-alpha', 'IESL MIS version number', '2019-01-16 23:40:13', '0000-00-00 00:00:00', 1),
(20, 'email_master_switch', '1', 'boolean - Send emails (1-yes 0-no)', '2019-03-24 21:27:34', '0000-00-00 00:00:00', 1),
(21, 'session_expire_redir_time', '10', 'minutes - Minimum time before redirecting to login page', '2021-04-16 13:45:54', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_views`
--

CREATE TABLE `system_views` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `page` varchar(255) NOT NULL,
  `group_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_views`
--

INSERT INTO `system_views` (`id`, `name`, `page`, `group_id`) VALUES
(1, 'temp', 'temp_dashboard', 57),
(2, 'mem_user1', 'member_user1', 20),
(3, 'mem_user2', 'member_user2', 21),
(4, 'mem_user3', 'member_user3', 22),
(5, 'mem_student', 'member_student', 16),
(6, 'mem_amie', 'member_student', 15),
(7, 'mem_mie', 'member_student', 18),
(8, 'mem_fie', 'member_student', 19),
(9, 'mem_hlm', 'member_student', 24),
(10, 'mem_hlf', 'member_student', 25),
(11, 'mem_companion', 'member_student', 26),
(12, 'mem_aie', 'member_student', 27),
(13, 'tech_temp', 'tech_temp_dashboard', 58),
(14, 'publications_user2', 'publications_user2', 37),
(15, 'editor', 'publications_user2', 60),
(16, 'copy_editor', 'publications_user2', 61),
(17, 'finance_user1', 'finance_user1', 29),
(18, 'sub_admin', 'sub_admin', 2),
(19, 'temp_resource_person', 'temp_dashboard_resource_person', 78),
(20, 'temp_training_org', 'temp_dashboard_trainingorg', 77),
(21, 'temp - direct route', 'temp_dashboard_direct_route', 62),
(22, 'deactivated_by_system', 'system_nactive_member', 80),
(23, 'deactivated_by_admin', 'inactive_member', 81),
(24, 'member_afimie', 'member_student', 59),
(25, 'publications_user1', 'publications_user2', 36),
(26, 'publications_user3', 'publications_user2', 38),
(27, 'finance_user2', 'finance_user1', 33),
(28, 'finance_user3', 'finance_user1', 34),
(29, 'ceo_office_user1', 'ceo_office', 40),
(31, 'ceo_office_user2', 'ceo_office', 41),
(32, 'ceo_office_user3', 'ceo_office', 42),
(33, 'techno_division_user1', 'techno_division', 52),
(34, 'techno_division_user2', 'techno_division', 53),
(35, 'techno_division_user3', 'techno_division', 54),
(36, 'it_division_user1', 'it_division', 83),
(37, 'it_division_user2', 'it_division', 84),
(38, 'it_division_user3', 'it_division', 85),
(39, 'edu_div_user1', 'education_user1', 30),
(40, 'edu_div_user2', 'education_user1', 31),
(41, 'edu_div_user3', 'education_user1', 32),
(42, 'temp_user', 'temp_user', 86),
(43, 'exam_user', 'exam_user', 91),
(44, 'mem_data_entry1', 'member_user1', 94),
(45, 'cpd_user', 'cpd_user', 95);

-- --------------------------------------------------------

--
-- Table structure for table `temp_orderlist`
--

CREATE TABLE `temp_orderlist` (
  `id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dval` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `order_item_id` int DEFAULT NULL,
  `qtyedit_previous` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `temp_orderlist`
--

INSERT INTO `temp_orderlist` (`id`, `description`, `dval`, `qty`, `order_id`, `order_item_id`, `qtyedit_previous`) VALUES
(3, NULL, NULL, 30, 111, 4, NULL),
(4, NULL, NULL, 50, 112, 3, NULL),
(111, NULL, NULL, 2, 402, 2, 0),
(112, NULL, NULL, 3, 402, 1, 0),
(113, NULL, NULL, 2, 403, 1, 0),
(114, NULL, NULL, 4, 403, 2, 0),
(115, NULL, NULL, 2, 404, 1, -2),
(116, NULL, NULL, 4, 404, 2, 2),
(117, NULL, NULL, 6, 405, 2, -6),
(118, NULL, NULL, 2, 406, 1, 0),
(119, NULL, NULL, 4, 406, 2, 0),
(120, NULL, NULL, 2, 407, 1, 2),
(121, NULL, NULL, 4, 407, 2, 4),
(122, NULL, NULL, 2, 408, 1, 0),
(123, NULL, NULL, 4, 408, 2, 0),
(124, NULL, NULL, 2, 409, 1, 0),
(125, NULL, NULL, 4, 409, 2, 0),
(126, NULL, NULL, 4, 410, 1, 2),
(127, NULL, NULL, 2, 410, 2, 2),
(128, NULL, NULL, 4, 411, 1, -4),
(129, NULL, NULL, 2, 411, 2, -2),
(130, NULL, NULL, 2, 412, 1, 0),
(131, NULL, NULL, 4, 412, 2, 0),
(132, NULL, NULL, 2, 413, 1, 0),
(133, NULL, NULL, 4, 413, 2, 0),
(134, NULL, NULL, 2, 414, 1, 2),
(135, NULL, NULL, 4, 414, 2, -2),
(136, NULL, NULL, 6, 418, 1, -4),
(137, NULL, NULL, 3, 418, 2, 0),
(138, NULL, NULL, 2, 425, 1, 0),
(140, NULL, NULL, 2, 427, 2, 0),
(141, NULL, NULL, 2, 429, 1, 0),
(142, NULL, NULL, 2, 430, 1, 0),
(143, NULL, NULL, 3, 431, 2, 0),
(145, NULL, NULL, 1, 432, 2, 1),
(146, NULL, NULL, 2, 433, 2, 0),
(147, NULL, NULL, 1, 434, 2, 0),
(148, NULL, NULL, 1, 435, 2, 0),
(149, NULL, NULL, 1, 437, 2, 1),
(150, NULL, NULL, 2, 438, 3, 0),
(151, NULL, NULL, 1, 439, 2, 0),
(152, NULL, NULL, 1, 401, 3, 0),
(153, NULL, NULL, 1, 441, 3, 0),
(154, NULL, NULL, 1, 449, 4, 0),
(155, NULL, NULL, 1, 457, 3, 0),
(156, NULL, NULL, 1, 458, 3, 0),
(157, NULL, NULL, 2, 459, 3, 0),
(159, NULL, NULL, 1, 461, 4, 0),
(160, NULL, NULL, 1, 461, 4, 0),
(161, NULL, NULL, 2, 464, 1, 0),
(162, NULL, NULL, 2, 464, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `temp_orders`
--

CREATE TABLE `temp_orders` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `order_need_date` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `place_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client` varchar(255) NOT NULL,
  `contactno` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `temp_orders`
--

INSERT INTO `temp_orders` (`id`, `name`, `status`, `order_need_date`, `description`, `created_by`, `place_date`, `client`, `contactno`) VALUES
(1, 'FoodOrderxmmmmmmmm', 0, '2022-11-01', '', 'Piyumi', '0000-00-00 00:00:00', 'xzxzx', '0769194780'),
(2, 'ClothOrder', 0, '', '', '', '0000-00-00 00:00:00', '', ''),
(344, NULL, 0, '', '', '', '2022-11-10 15:15:22', '', ''),
(345, NULL, 0, '', '', '', '2022-11-10 15:17:37', '', ''),
(346, NULL, 0, '', '', '', '2022-11-10 15:18:34', '', ''),
(347, NULL, 0, '', '', '', '2022-11-10 15:22:58', '', ''),
(348, NULL, 0, '', '', '', '2022-11-10 15:42:45', '', ''),
(349, NULL, 0, '', '', '', '2022-11-10 15:43:32', '', ''),
(350, NULL, 0, '', '', '', '2022-11-10 15:44:06', '', ''),
(351, 'Check Similarity Indexv', 0, '2022-11-11', 'sv', 'Piyumi', '2022-11-10 16:34:44', 'vAllianx', '0769194780'),
(352, 'ClothOrderx', 0, '2022-11-08', 'vbnvb', 'Piyumi', '2022-11-10 16:36:49', 'Allian Alanka', '0769194781'),
(353, NULL, 0, '', '', '', '2022-11-10 16:59:29', '', ''),
(354, NULL, 0, '', '', '', '2022-11-10 17:01:22', '', ''),
(355, NULL, 0, '', '', '', '2022-11-10 17:03:11', '', ''),
(356, NULL, 0, '', '', '', '2022-11-10 17:28:48', '', ''),
(357, NULL, 0, '', '', '', '2022-11-10 17:34:30', '', ''),
(358, NULL, 0, '', '', '', '2022-11-10 17:40:46', '', ''),
(359, NULL, 0, '', '', '', '2022-11-10 17:42:22', '', ''),
(360, NULL, 0, '', '', '', '2022-11-10 18:12:29', '', ''),
(361, NULL, 0, '', '', '', '2022-11-10 18:22:22', '', ''),
(362, NULL, 0, '', '', '', '2022-11-10 18:24:25', '', ''),
(363, NULL, 0, '', '', '', '2022-11-10 18:24:37', '', ''),
(364, NULL, 0, '', '', '', '2022-11-10 18:25:56', '', ''),
(365, NULL, 0, '', '', '', '2022-11-10 18:26:02', '', ''),
(366, NULL, 0, '', '', '', '2022-11-10 18:27:25', '', ''),
(367, NULL, 0, '', '', '', '2022-11-10 18:27:47', '', ''),
(368, NULL, 0, '', '', '', '2022-11-10 18:29:00', '', ''),
(369, NULL, 0, '', '', '', '2022-11-10 18:29:25', '', ''),
(370, NULL, 0, '', '', '', '2022-11-10 18:29:38', '', ''),
(371, NULL, 0, '', '', '', '2022-11-10 18:30:55', '', ''),
(372, NULL, 0, '', '', '', '2022-11-10 18:31:36', '', ''),
(373, NULL, 0, '', '', '', '2022-11-10 18:32:43', '', ''),
(374, NULL, 0, '', '', '', '2022-11-10 18:33:45', '', ''),
(375, NULL, 0, '', '', '', '2022-11-10 18:34:03', '', ''),
(376, NULL, 0, '', '', '', '2022-11-10 18:34:39', '', ''),
(377, NULL, 0, '', '', '', '2022-11-10 18:35:11', '', ''),
(378, NULL, 0, '', '', '', '2022-11-10 18:37:08', '', ''),
(379, NULL, 0, '', '', '', '2022-11-10 18:37:28', '', ''),
(380, NULL, 0, '', '', '', '2022-11-10 18:43:55', '', ''),
(381, NULL, 0, '', '', '', '2022-11-10 18:44:22', '', ''),
(382, NULL, 0, '', '', '', '2022-11-10 18:48:16', '', ''),
(383, NULL, 0, '', '', '', '2022-11-10 18:56:04', '', ''),
(384, NULL, 0, '', '', '', '2022-11-10 18:56:12', '', ''),
(385, NULL, 0, '', '', '', '2022-11-10 18:56:32', '', ''),
(386, NULL, 0, '', '', '', '2022-11-10 18:56:44', '', ''),
(387, NULL, 0, '', '', '', '2022-11-10 18:58:19', '', ''),
(388, 'xc', 0, '2022-11-11', 'xcxc', 'Piyumi', '2022-11-10 18:58:33', 'xcxc', 'cxc'),
(389, NULL, 0, '', '', '', '2022-11-10 18:59:09', '', ''),
(390, NULL, 0, '', '', '', '2022-11-10 19:00:31', '', ''),
(391, NULL, 0, '', '', '', '2022-11-10 19:00:40', '', ''),
(392, NULL, 0, '', '', '', '2022-11-10 19:15:19', '', ''),
(393, NULL, 0, '', '', '', '2022-11-10 19:17:02', '', ''),
(394, NULL, 0, '', '', '', '2022-11-10 19:18:41', '', ''),
(395, NULL, 0, '', '', '', '2022-11-10 19:19:42', '', ''),
(396, NULL, 0, '', '', '', '2022-11-10 19:19:58', '', ''),
(397, NULL, 0, '', '', '', '2022-11-10 19:20:23', '', ''),
(398, 'My Firstv', 0, '2022-11-11', 'AA', 'Piyumi', '2022-11-10 19:34:18', 'Allian Alanka', '0769194781'),
(399, NULL, 0, '', '', '', '2022-11-10 19:37:11', '', ''),
(400, 'ClothOrderx', 0, '2022-10-31', 'asas', 'Piyumi', '2022-11-10 19:43:02', 'Allianx', '0769194780'),
(401, 'Check Similarity Indexmxxxxxxxxxxxxx', 0, '2022-10-31', 'asas', 'Piyumi', '2022-11-10 19:52:03', 'Allianx', '0769194781'),
(402, 'My Firstv', 0, '2022-11-09', 'asa', 'Piyumi', '2022-11-10 20:10:06', 'vcv', '0769194781'),
(403, 'My Firstv', 0, '2022-11-01', '121212', 'Piyumi', '2022-11-10 20:15:10', 'Allianx', '0769194781'),
(404, 'x', 0, '2022-11-11', 'x', 'Piyumi', '2022-11-10 20:36:26', 'Allianx', '0769194781'),
(405, NULL, 0, '', '', '', '2022-11-10 20:52:22', '', ''),
(406, 'My Firstv', 0, '2022-10-31', 'ss', 'Piyumi', '2022-11-10 20:55:07', 'Allian Alanka', '0769194780'),
(407, 'My Firstv', 0, '2022-10-31', 'sdsd', 'Piyumi', '2022-11-10 21:27:13', 'Allianx', '0769194781'),
(408, 'My Firstv', 0, '2022-11-09', 'fdfd', 'Piyumi', '2022-11-10 22:30:49', 'sdsd', '0769194781'),
(409, 'My Firstv', 0, '2022-11-08', 'aas', 'Piyumi', '2022-11-10 22:39:48', 'Allian Alanka', '0769194781'),
(410, 'Check Similarity Index', 0, '2022-11-02', 'sasasas', 'Piyumi', '2022-11-10 22:42:52', 'Allianx', '0769194781'),
(411, NULL, 0, '', '', '', '2022-11-10 23:01:32', '', ''),
(412, NULL, 0, '', '', '', '2022-11-10 23:07:39', '', ''),
(413, NULL, 0, '', '', '', '2022-11-10 23:14:26', '', ''),
(414, 'My Firstv', 0, '2022-11-01', 'sasa', 'Piyumi', '2022-11-10 23:17:18', 'sas', '0769194781'),
(415, NULL, 0, '', '', '', '2022-11-10 23:40:09', '', ''),
(416, NULL, 0, '', '', '', '2022-11-11 00:17:26', '', ''),
(417, NULL, 0, '', '', '', '2022-11-11 00:48:03', '', ''),
(418, 'My Firstv', 0, '2022-11-01', 'asas', 'Piyumi', '2022-11-11 00:48:07', 'Allianx', '0769194781'),
(419, NULL, 0, '', '', '', '2022-11-11 01:05:33', '', ''),
(420, NULL, 0, '', '', '', '2022-11-11 08:07:34', '', ''),
(421, NULL, 0, '', '', '', '2022-11-11 08:14:54', '', ''),
(422, NULL, 0, '', '', '', '2022-11-11 08:14:58', '', ''),
(423, NULL, 0, '', '', '', '2022-11-11 08:23:20', '', ''),
(424, NULL, 0, '', '', '', '2022-11-11 08:32:34', '', ''),
(425, NULL, 0, '', '', '', '2022-11-11 08:35:23', '', ''),
(426, NULL, 0, '', '', '', '2022-11-11 08:46:50', '', ''),
(427, NULL, 0, '', '', '', '2022-11-11 08:48:33', '', ''),
(428, NULL, 0, '', '', '', '2022-11-11 08:49:41', '', ''),
(429, 'My Firstv', 0, '2022-10-31', 'assa', 'Piyumi', '2022-11-11 08:50:41', 'vcv', '0769194781'),
(430, 'sqq', 0, '2022-10-31', 'dada', 'Piyumi', '2022-11-11 08:51:30', 'Allianx', '0769194781'),
(431, 'zx', 0, '2022-11-10', 'sdsd', 'Piyumi', '2022-11-11 08:53:00', 'xcxc', '0769194781'),
(432, 'sas', 0, '2022-10-31', 'asasa', 'Piyumi', '2022-11-11 08:54:37', 'asas', '0769194781'),
(433, 'My Firstv', 0, '2022-11-11', 'sasa', 'Piyumi', '2022-11-11 08:59:21', 'asas', '0769194781'),
(434, 'mmx', 0, '2022-11-08', 'xx', 'Piyumi', '2022-11-11 08:59:57', 'Allianx', '0769194781'),
(435, 'My Firstv', 0, '2022-10-31', 'zxz', 'Piyumi', '2022-11-11 09:22:56', 'Allian Alanka', '0769194780'),
(436, NULL, 0, '', '', '', '2022-11-11 09:25:29', '', ''),
(437, 'My Firstvsss', 0, '2022-11-03', 'asas', 'Piyumi', '2022-11-11 09:30:03', 'aass', '0769194781'),
(438, 'My Firstv', 0, '2022-10-31', 'asasa', 'Piyumi', '2022-11-11 09:47:04', 'ssa', '0769194780'),
(439, 'Check Similarity Index', 0, '2022-11-11', 's', 'Piyumi', '2022-11-11 09:54:49', 'asas', 'sa'),
(440, NULL, 0, '', '', '', '2022-11-11 10:21:37', '', ''),
(441, 'fffass', 0, '2022-11-01', 'asa', 'Piyumi', '2022-11-11 10:24:14', 'Allianx', '0769194781'),
(442, NULL, 0, '', '', '', '2022-11-11 10:25:54', '', ''),
(443, NULL, 0, '', '', '', '2022-11-11 10:29:28', '', ''),
(444, NULL, 0, '', '', '', '2022-11-11 10:29:47', '', ''),
(445, NULL, 0, '', '', '', '2022-11-11 10:30:30', '', ''),
(446, NULL, 0, '', '', '', '2022-11-11 10:41:45', '', ''),
(447, NULL, 0, '', '', '', '2022-11-11 10:47:17', '', ''),
(448, NULL, 0, '', '', '', '2022-11-11 10:55:21', '', ''),
(449, NULL, 0, '', '', '', '2022-11-11 11:09:44', '', ''),
(450, NULL, 0, '', '', '', '2022-11-11 11:10:18', '', ''),
(451, NULL, 0, '', '', '', '2022-11-11 11:10:26', '', ''),
(452, NULL, 0, '', '', '', '2022-11-11 11:49:19', '', ''),
(453, NULL, 0, '', '', '', '2022-11-11 11:51:43', '', ''),
(454, NULL, 0, '', '', '', '2022-11-11 11:52:26', '', ''),
(455, NULL, 0, '', '', '', '2022-11-11 11:53:31', '', ''),
(456, NULL, 0, '', '', '', '2022-11-11 12:02:21', '', ''),
(457, NULL, 0, '', '', '', '2022-11-11 12:20:27', '', ''),
(458, NULL, 0, '', '', '', '2022-11-11 12:21:17', '', ''),
(459, 'My Firstv ishu', 0, '2022-11-16', 't', 'Piyumi', '2022-11-11 12:32:16', 'Allianx', '0769194781'),
(460, NULL, 0, '', '', '', '2022-11-11 12:53:05', '', ''),
(461, 'rx', 0, '2022-11-01', 'rrrx', 'Piyumi', '2022-11-11 12:53:41', 'rrx', '0769194781'),
(462, NULL, 0, '', '', '', '2022-11-11 12:57:39', '', ''),
(463, NULL, 0, '', '', '', '2022-11-11 13:21:31', '', ''),
(464, 'General Order For Employees', 1, '2022-11-17', 'Good quality service need', 'Piyumi', '2022-11-11 13:29:24', 'Allianz', '0769194781');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int UNSIGNED NOT NULL,
  `last_login` int UNSIGNED DEFAULT NULL,
  `active` int DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `name_initials` varchar(255) NOT NULL,
  `nic` varchar(25) NOT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `in_source` int DEFAULT NULL COMMENT '1 - portal\\\\\\\\\\\\\\\\n2 - site',
  `user_constatnt_id` int NOT NULL DEFAULT '0',
  `user_agreement_read` int NOT NULL DEFAULT '0',
  `first_login` int NOT NULL DEFAULT '0',
  `data_migrate` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `title`, `first_name`, `last_name`, `name_initials`, `nic`, `is_admin`, `in_source`, `user_constatnt_id`, `user_agreement_read`, `first_login`, `data_migrate`) VALUES
(1, '127.0.0.1', 'admin@gmail.com', '$2y$08$7KiXSY/LN3wrLKmqNsJi7OHnL3vLKj.9AccjYiiC.ca55MamdmTnu', '', '', 'LTIFHxf89WZ4WE3Lsl1EQ.7ddec5c799e33f785a', 1522747772, 'Kfdu4./AqNSJLT66xh5D0u', 1268889823, 1668172867, 1, 'Nuwan', 'Piyumi', 'Amarakoon', '', '', 1, NULL, 0, 1, 1, 0),
(17, '127.0.0.1', 'user@gmail.com', '$2y$08$7KiXSY/LN3wrLKmqNsJi7OHnL3vLKj.9AccjYiiC.ca55MamdmTnu', NULL, NULL, NULL, NULL, NULL, 1631245196, 1631261394, 1, '', 'user', 'user', 'User', '000000000v', 0, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `group_id` mediumint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `deactivated_datetime` datetime DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`, `status`, `deactivated_datetime`, `created_datetime`) VALUES
(1, 1, 1, 1, '2019-01-24 13:05:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `log_id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(200) NOT NULL,
  `login_ip` varchar(200) NOT NULL,
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`log_id`, `user_id`, `username`, `login_ip`) VALUES
(2306, 1, 'admin@gmail.com', '::1'),
(2307, 1, 'admin@gmail.com', '::1'),
(2308, 1, 'admin@gmail.com', '::1'),
(2309, 1, 'admin@gmail.com', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `perm_id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`perm_id`, `user_id`, `group_id`) VALUES
(1, 1, 0),
(1, 229, 0),
(3, 1, 0),
(3, 224, 0),
(3, 229, 0),
(4, 1, 0),
(4, 229, 0),
(5, 1, 0),
(5, 229, 0),
(6, 1, 0),
(6, 229, 0),
(7, 1, 0),
(7, 229, 0),
(9, 1, 0),
(10, 1, 0),
(11, 1, 0),
(11, 224, 0),
(11, 229, 0),
(17, 1, 0),
(17, 224, 0),
(17, 229, 0),
(18, 1, 0),
(18, 224, 0),
(18, 229, 0),
(19, 1, 0),
(19, 224, 0),
(19, 229, 0),
(20, 1, 0),
(20, 224, 0),
(20, 229, 0),
(21, 1, 0),
(21, 224, 0),
(21, 229, 0),
(22, 1, 0),
(22, 224, 0),
(22, 229, 0),
(23, 1, 0),
(23, 224, 0),
(23, 229, 0),
(24, 1, 0),
(24, 224, 0),
(24, 229, 0),
(25, 1, 0),
(26, 1, 0),
(27, 1, 0),
(28, 1, 0),
(29, 1, 0),
(30, 1, 0),
(31, 1, 0),
(32, 1, 0),
(33, 1, 0),
(34, 1, 0),
(34, 224, 0),
(34, 229, 0),
(35, 1, 0),
(35, 224, 0),
(35, 229, 0),
(36, 1, 0),
(117, 1, 0),
(118, 1, 0),
(119, 1, 0),
(120, 1, 0),
(121, 1, 0),
(122, 1, 0),
(123, 1, 0),
(124, 1, 0),
(125, 1, 0),
(126, 1, 0),
(127, 1, 0),
(128, 1, 0),
(129, 1, 0),
(130, 1, 0),
(131, 1, 0),
(131, 229, 0),
(132, 1, 0),
(132, 229, 0),
(134, 1, 0),
(134, 229, 0),
(135, 1, 0),
(135, 229, 0),
(136, 1, 0),
(136, 229, 0),
(137, 1, 0),
(137, 229, 0),
(138, 1, 0),
(138, 229, 0),
(139, 1, 0),
(139, 229, 0),
(140, 1, 0),
(141, 1, 0),
(142, 1, 0),
(143, 1, 0),
(144, 1, 0),
(145, 1, 0),
(146, 1, 0),
(147, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_constants`
--

CREATE TABLE `user_permission_constants` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permission_constants`
--

INSERT INTO `user_permission_constants` (`id`, `name`) VALUES
(1, 'MEM-AMIE');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_profile_id` int NOT NULL,
  `user_id` int NOT NULL,
  `nic` varchar(15) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `name_w_initials` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_profilecol` varchar(45) DEFAULT 'A',
  `nationality` varchar(45) DEFAULT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `passport_country` varchar(45) DEFAULT NULL,
  `contact_mobile` int DEFAULT NULL,
  `contact_home` int DEFAULT NULL,
  `is_srilankan` int DEFAULT NULL,
  `upload` varchar(45) DEFAULT NULL,
  `reff_id` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_profile_id`, `user_id`, `nic`, `title`, `first_name`, `last_name`, `name_w_initials`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`, `user_profilecol`, `nationality`, `address1`, `address2`, `Province`, `city`, `country`, `passport_country`, `contact_mobile`, `contact_home`, `is_srilankan`, `upload`, `reff_id`, `postal_code`) VALUES
(42, 17, '000000000v', NULL, 'user', 'user', 'User', '2021-09-09 22:09:56', 1, '2021-09-17 03:37:22', 0, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 189, '356269584V', 'Mr', 'Ninidu', 'Lakisuru', 'A H NInidu Lakisuru', '2021-09-27 07:35:34', 1, '2021-10-16 06:13:16', 0, 1, 'A', NULL, '122 / 10 / 05', 'kandy road ,  kandy', '', '', '', '', 715588610, 247896410, NULL, NULL, NULL, '20020'),
(216, 193, '950763485v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-29 08:05:24', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image2.jpg', NULL, '20000'),
(217, 194, '950763403v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-29 11:25:20', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image2.jpg', NULL, '20000'),
(218, 195, '950763401v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-30 08:56:07', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'acm desktopcta.jpg', NULL, '20000'),
(219, 196, '950763404v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-30 08:57:17', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image2.jpg', NULL, '20000'),
(220, 197, '950763405v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-30 09:31:34', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image2.jpg', NULL, '20000'),
(221, 198, '950763406v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-30 09:32:50', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image2.jpg', NULL, '20000'),
(222, 199, '950763407v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-30 09:33:45', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image2.jpg', NULL, '20000'),
(223, 200, '950563410v', 'Mr', 'Nadun', 'perera', 'H K Nadun Liyanage', '2021-09-30 09:41:35', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'kandy road ,  kandy', 'Texas', 'Laredo', 'America', 'Englend', 715588693, 268956604, 0, 'image2.jpg', NULL, '20001'),
(224, 201, '356269574V', 'Mr', 'dasun', 'sandeepp', 'H K dasun sandeepp', '2021-09-30 09:44:01', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 09', 'kandy road , kandy', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'acm desktopcta.jpg', NULL, '20001'),
(225, 202, '950763412v', 'Mr', 'Supun', 'perera', 'H K SUpun Liyanage', '2021-09-30 09:53:02', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'kandy road , kandy', 'Texas', 'Laredo', 'America', 'America', 715588693, 247896458, 0, 'acm desktopcta.jpg', NULL, '20001'),
(226, 203, '950763425v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-09-30 09:58:13', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', '', '', '', '', 715588693, 268956604, 1, 'acm desktopcta.jpg', NULL, '20000'),
(227, 204, '950661426v', 'Mr', 'Supun', 'sandeepp', 'H K SUpun Liyanage', '2021-09-30 10:13:20', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 06', 'kandy road ,  kandy', '', '', '', '', 715588693, 268956604, 1, 'acm desktopcta.jpg', NULL, '20001'),
(228, 205, '950661427v', 'Mr', 'nadun', 'perera', 'H K SUpun Liyanage', '2021-09-30 10:14:47', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'kandy road ,  kandy', 'Texas', 'Laredo', 'America', 'America', 715588693, 247896458, 0, 'acm desktopcta.jpg', NULL, '20001'),
(229, 206, '199722212121', 'Mr', 'Vinusha', 'Jayasinghe', 'V I Jayasinghe', '2021-09-30 11:15:34', 17, '2021-09-30 11:21:16', 0, 1, 'A', NULL, 'No 110, nugegoda, Sri Lanka', 'Havelock Road', '', '', '', '', 2147483647, 112346783, 1, 'pexels-photo-771742.jpeg', NULL, '10300'),
(230, 207, '1352635374637', 'Mrs', 'Dushanthani', 'B', 'B Dushanthani', '2021-10-01 08:14:31', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 88', 'aloe road', '', '', '', '', 1212121212, 12121212, 1, 'Screenshot from 2021-09-14 14-49-47.png', NULL, '001500'),
(231, 208, '950763415v', 'Mr', 'Supun', 'Liyanage', 'H K SUpun Liyanage', '2021-10-04 04:03:40', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'Kanthale', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image5.jpg', NULL, '20000'),
(232, 209, '950661405v', 'Mr', 'Gayan', 'liyanage', 'G H Gayan Perera', '2021-10-04 08:18:14', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'kandy road , kandy', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image5.jpg', NULL, '20001'),
(233, 210, '950763486v', 'Mr', 'Supun', 'shanaka', 'H K SUpun perera', '2021-10-04 09:04:17', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 05', 'kandy road , kandy', 'Texas', 'Laredo', 'America', 'America', 715588693, 268956604, 0, 'image5.jpg', NULL, '20001'),
(234, 211, '950661484v', 'Mr', 'Gayan', 'perera', 'G H Gayan Perera', '2021-10-04 11:04:50', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 06', 'kandy road , kandy', '', '', '', '', 715628948, 247896455, 1, 'image5.jpg', NULL, '20001'),
(235, 212, '356269575V', 'Mr', 'Nadun', 'sandeepp', 'H K Nadun Liyanage', '2021-10-04 11:06:34', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'kandy road , kandy', 'pro2', 'Laredo', 'America', 'America', 715628948, 268956604, 0, 'image6.jpg', NULL, '10003'),
(236, 213, '199712212121', 'Mr', 'Sahan', 'Silva', 'A K Sahan Silva', '2021-10-11 04:37:23', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 110, Nugegoda, Sri Lanka', 'Park Road', '', '', '', '', 2147483647, 112324321, 1, 'pexels-photo-771742.jpeg', NULL, '10300'),
(237, 214, '207800824v', 'Ms', 'Hasini', 'Uththara', 'Hasini Uththara', '2021-10-11 05:37:53', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '1/110', 'Perera MW', '', '', '', '', 2147483647, 114324567, 1, 'download_(1).jpg', NULL, '15320'),
(238, 215, '1990474574', 'Mrs', 'Dushanthani', 'Balasubramaniam', 'B Dushanthani', '2021-10-11 06:13:34', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '1245', 'aloe avenu', '', '', '', '', 2147483647, 2147483647, 1, 'imageedit_3_7002834675.png', NULL, '001500'),
(239, 216, '356269584V', 'Mr', 'Ninidu', 'Lakisuru', 'A H NInidu Lakisuru', '2021-10-16 04:14:23', 189, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 05', 'kandy road ,  kandy', '', '', '', '', 715588610, 247896410, 1, 'image6.jpg', NULL, '20020'),
(240, 217, '950661420v', NULL, 'chamara', 'Kavinda', 'G H kasun Silva', '2021-10-16 06:16:35', 1, '0000-00-00 00:00:00', 0, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 218, '346269576V', 'Mr', 'Dasun', 'Perera', 'G H Gayan Perera', '2021-10-16 06:20:04', 217, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'kandy road ,  kandy', '', '', '', '', 715628948, 247896458, 1, 'image6.jpg', NULL, '20020'),
(242, 219, '123463212321', NULL, 'Vinusha', 'Jayasinghe', 'Vinusha Jayasinghe', '2021-10-16 06:20:52', 1, '0000-00-00 00:00:00', 0, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 220, '123463222321', 'Mr', 'Kusal', 'Perera', 'S K Perera', '2021-10-16 07:29:17', 219, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'Colombo 02', 'Nugegoda', '', '', '', '', 723476681, 112312312, 1, 'appchallengec.png', NULL, '10211'),
(244, 221, '950063485v', 'MR', 'Dasun', 'Shanaka', 'H K Nadun Liyanage', '2021-10-18 11:35:12', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'kandy road ,  kandy', '', '', '', '', 715588610, 247896405, 1, 'image5.jpg', NULL, '20021'),
(245, 222, '9507634863v', 'Mr', 'Dasun', 'sandeepp', 'H K Nadun Liyanage', '2021-10-18 11:36:32', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 08', 'Kanthale', 'texas', 'laredo', 'Englend', 'Englend', 715588605, 247896458, 0, 'image6.jpg', NULL, '20010'),
(246, 223, '768956743V', 'Ms', 'Hasini', 'Uththara', 'Hasini Uththara', '2021-10-21 09:01:56', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '1/3,perera avenue', 'colombo 3', '', '', '', '', 767761305, 112345663, 1, '1634531831_ModernAgriculturalTechnologyAdopti', NULL, '9320'),
(247, 224, '789898989899', 'Mr', 'Dushanthani', 'B', 'B Dushanthani', '2021-11-05 05:26:22', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '99', '2/4', '', '', '', '', 2147483647, 2147483647, 1, 'GUID-02F67E52-DC82-40DB-9429-2E0296DF8237-def', NULL, '15'),
(248, 225, '207800834v', 'Ms', 'Sasini', 'Uthpala', 'Hasini Uththara', '2021-11-05 06:57:46', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '1/11, Read Avenue', 'Colombo 07', 'WA', 'PERTH', 'Australia', 'SRI LANKA', 712345689, 112678945, 0, '1_(4).PNG', NULL, '19390'),
(249, 226, '950660409v', 'Mr', 'Supun', 'sandeepp', 'H K SUpun sandeepp', '2021-11-05 07:00:00', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 05', 'kandy road Kandy', '', '', '', '', 715588610, 247896455, 1, 'image6.jpg', NULL, '20001'),
(250, 227, '977193230V', 'Ms', 'Kavya', 'Fernando', 'D', '2021-11-11 06:14:37', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 1 Test', 'No 1 test', '', '', '', '', 716270453, 0, 1, '', NULL, '12345'),
(251, 228, '887878908V', NULL, 'B', 'Perera', 'B', '2021-11-12 08:12:26', 1, '0000-00-00 00:00:00', 0, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 229, '977193240V', 'Ms', 'Kavya', 'Fernando', 'DKF', '2021-11-17 05:54:52', 17, '2021-12-06 09:01:30', 0, 1, 'A', NULL, 'no test 2', 'no test 123', '', '', '', '', 716270453, 0, 1, '', NULL, '12345'),
(253, 230, '207800524v', NULL, 'Randulani', 'Wijesekara', 'DR', '2021-12-07 09:35:56', 1, '0000-00-00 00:00:00', 0, 1, 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 231, '217800824v', 'Mr', 'Kesara', 'Dissanayake', 'KGP', '2021-12-07 09:41:28', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'NO 7/145,', 'Galle rd, Colombo 03', '', '', '', '', 767791905, 112456787, 1, '', NULL, '10920'),
(255, 232, '950660085v', 'Mr', 'Nimal', 'Kumara', 'A D Nimal Kumara', '2022-02-01 06:52:42', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'kandy road ,  kandy', '', '', '', '', 715588695, 247896455, 1, 'image6.jpg', NULL, '20020'),
(256, 233, '639634863v', 'Mr', 'Dasun', 'Gamage', 'H K Dasun gamage', '2022-03-08 10:59:01', 17, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No 189 kandy road', 'kandy', '', '', '', '', 715588695, 247896410, 1, 'image6.jpg', NULL, '20001'),
(257, 234, '874567890V', 'Ms', 'Ashani', 'Rathnayaka', 'A Rathnayaka', '2022-03-28 05:58:38', 219, '0000-00-00 00:00:00', 0, 1, 'A', NULL, 'No567', 'PERERA AVENUE', '', '', '', '', 775544332, 112768790, 1, 'girl-cartoon-cute-dp-images_(1).jpg', NULL, '13876'),
(258, 235, '950681419v', 'Mr', 'Nuwan', 'Gamage', 'A J Nuwan Gamage', '2022-03-31 07:51:12', 219, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '122 / 10 / 06', 'kandy road ,  kandy', '', '', '', '', 715588695, 247896405, 1, 'image6.jpg', NULL, '20020'),
(259, 236, '997899745v', 'Ms', 'Uththara', 'Hasini', 'U Hasini', '2022-04-18 09:52:51', 219, '0000-00-00 00:00:00', 0, 1, 'A', NULL, '3/78 Garden Place Colombo 07', '3/78 Garden Place Colombo 07', '', '', '', '', 764456308, 112456780, 1, 'unnamed_(2).jpg', NULL, '10320');

-- --------------------------------------------------------

--
-- Table structure for table `web_user_authentication`
--

CREATE TABLE `web_user_authentication` (
  `id` int NOT NULL,
  `users_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_user_authentication`
--

INSERT INTO `web_user_authentication` (`id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES
(12, 1, '05f3f91f648983ce3811077e9b60a311e1f3e9d922314b85f7c58e9c5b9f1963', '2023-11-08 23:35:39', '2021-09-27 13:31:43', '2021-09-27 13:31:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permissions`
--
ALTER TABLE `group_permissions`
  ADD PRIMARY KEY (`perm_id`,`group_id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5xbd9n8lglynoulrfrdjhf5v4` (`order_id`),
  ADD KEY `FKce7wm5503sd1wl743tvyw15lp` (`order_item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_history`
--
ALTER TABLE `permission_history`
  ADD PRIMARY KEY (`perm_history_id`);

--
-- Indexes for table `status_comment`
--
ALTER TABLE `status_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_menu`
--
ALTER TABLE `system_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `system_permissions`
--
ALTER TABLE `system_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_variables`
--
ALTER TABLE `system_variables`
  ADD PRIMARY KEY (`system_variable_id`);

--
-- Indexes for table `system_views`
--
ALTER TABLE `system_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_orderlist`
--
ALTER TABLE `temp_orderlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5xbd9n8lglynoulrfrdjhf5v4` (`order_id`),
  ADD KEY `FKce7wm5503sd1wl743tvyw15lp` (`order_item_id`);

--
-- Indexes for table `temp_orders`
--
ALTER TABLE `temp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`perm_id`,`user_id`);

--
-- Indexes for table `user_permission_constants`
--
ALTER TABLE `user_permission_constants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_profile_id`);

--
-- Indexes for table `web_user_authentication`
--
ALTER TABLE `web_user_authentication`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_history`
--
ALTER TABLE `permission_history`
  MODIFY `perm_history_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `status_comment`
--
ALTER TABLE `status_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `system_menu`
--
ALTER TABLE `system_menu`
  MODIFY `menu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `system_permissions`
--
ALTER TABLE `system_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `system_variables`
--
ALTER TABLE `system_variables`
  MODIFY `system_variable_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `system_views`
--
ALTER TABLE `system_views`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `temp_orderlist`
--
ALTER TABLE `temp_orderlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `temp_orders`
--
ALTER TABLE `temp_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2310;

--
-- AUTO_INCREMENT for table `user_permission_constants`
--
ALTER TABLE `user_permission_constants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `user_profile_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `web_user_authentication`
--
ALTER TABLE `web_user_authentication`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD CONSTRAINT `FK5xbd9n8lglynoulrfrdjhf5v4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKce7wm5503sd1wl743tvyw15lp` FOREIGN KEY (`order_item_id`) REFERENCES `orderitem` (`id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
