-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2019 at 02:35 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharedhome`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment_table`
--

CREATE TABLE `apartment_table` (
  `apartment_id` int(11) NOT NULL,
  `apartment_uniq_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no_of_room` int(11) DEFAULT NULL,
  `apartment_avg_price` float DEFAULT '0',
  `apartment_rating` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_rated',
  `apartment_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `apartment_modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `apartment_updated_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_modified_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apartment_table`
--

INSERT INTO `apartment_table` (`apartment_id`, `apartment_uniq_id`, `apartment_name`, `apartment_description`, `apartment_address`, `apartment_contact`, `apartment_image`, `apartment_location`, `apartment_no_of_room`, `apartment_avg_price`, `apartment_rating`, `apartment_update_time`, `apartment_modify_time`, `apartment_updated_by`, `apartment_modified_by`) VALUES
(1, 'SMP', 'Mitsui Garden Hotel Nihonbashi Premier', NULL, '3 Chome-4-4 Nihonbashimuromachi, Chuo City, Tokyo 103-0022, Japan', '+81 3-3270-1131', 'photo', 'tottori', NULL, 229, '4.7', '2019-04-21 05:41:02', '2019-04-21 05:41:02', 'user', 'user'),
(2, 'SMQ', 'Hotel East 21 Tokyo', NULL, '6 Chome-3-3 Toyo, Koto City, Tokyo 135-0016, Japan', '+81 3-5683-5683', 'photo', 'tokyo', NULL, 150, '7.6', '2019-04-21 05:41:02', '2019-04-21 05:41:02', 'user', 'user'),
(3, 'SMR', 'APA Hotel Shinjuku Gyoen-mae', NULL, '2 Chome-2-8 Shinjuku, 新宿区 Shinjuku City, Tokyo 160-0022, Japan', '+81 570-033-622', 'photo', 'Tokyo', NULL, 169, '8', '2019-04-21 05:42:05', '2019-04-21 05:42:05', 'user', 'user'),
(4, 'SMS', 'Tachikawa Grand Hotel', NULL, '2 Chome-14-16 曙町 Tachikawa, Tokyo 190-0012, Japan', '+81 42-525-1121', 'photo', 'Tokyo', NULL, 149, '7.2', '2019-04-21 05:45:54', '2019-04-21 05:45:54', 'user', 'user'),
(5, 'SMT', ' GR Hotel Esaka', NULL, '2 Chome-1-63 Esakacho, Suita, Osaka 564-0063, Japan', '+81 6-6821-2001', 'photo', 'Osaka', NULL, 119, '7', '2019-04-21 05:47:04', '2019-04-21 05:47:04', 'user', 'user'),
(6, 'SMU', 'Smile Hotel Kyoto-shijo', NULL, 'apan, 〒600-8494 Kyoto, Shimogyo Ward, Kasabokocho, ル59・61 四条西洞院西入', '+81 75-371-0941', 'photo', 'kyoto', NULL, 99, 'not_rated', '2019-04-21 05:48:41', '2019-04-21 05:48:41', 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `bed_info`
--

CREATE TABLE `bed_info` (
  `bed_sl_id` int(11) NOT NULL,
  `bed_uniq_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_uniq_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_uniq_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_status` int(5) DEFAULT '0',
  `bed_create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bed_modify_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bed_created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `bed_modified_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bed_info`
--

INSERT INTO `bed_info` (`bed_sl_id`, `bed_uniq_id`, `bed_number`, `bed_price`, `room_uniq_id`, `apartment_uniq_id`, `bed_status`, `bed_create_at`, `bed_modify_at`, `bed_created_by`, `bed_modified_by`) VALUES
(1, 'SMP101A', '101A', '150', 'SMP101', 'SMP', 1, '2019-04-21 06:57:14', '2019-04-21 06:57:14', 'admin', 'admin'),
(2, 'SMP101B', '101B', '150', 'SMP101', 'SMP', 0, '2019-04-21 06:58:26', '2019-04-21 06:58:26', 'admin', 'admin'),
(3, 'SMP102A', '102A', '150', 'SMP102', 'SMP', 1, '2019-04-21 07:00:17', '2019-04-21 07:00:17', 'admin', 'admin'),
(4, 'SMP102B', '102B', '150', 'SMP102', 'SMP', 0, '2019-04-21 07:01:46', '2019-04-21 07:01:46', 'admin', 'admin'),
(5, 'SMQ101A', '101A', '180', 'SMQ101', 'SMQ', 0, '2019-04-21 08:23:41', '2019-04-21 08:23:41', 'admin', 'admin'),
(6, 'SMQ101B', '101B', '180', 'SMQ101', 'SMQ', 0, '2019-04-21 08:24:14', '2019-04-21 08:24:14', 'admin', 'admin'),
(7, 'SMQ102A', '102A', '180', 'SMQ102', 'SMQ', 0, '2019-04-21 08:24:45', '2019-04-21 08:24:45', 'admin', 'admin'),
(8, 'SMQ102B', '102B', '180', 'SMQ102', 'SMQ', 0, '2019-04-21 08:25:18', '2019-04-21 08:25:18', 'admin', 'admin'),
(9, 'SMR101A', '101A', '190', 'SMR101', 'SMR', 0, '2019-04-23 07:38:40', '2019-04-23 07:38:40', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking_table`
--

CREATE TABLE `booking_table` (
  `booking_sl_id` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_uniq_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_uniq_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_uniq_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_checkin_time` date DEFAULT NULL,
  `booking_checkout_time` date DEFAULT NULL,
  `booking_created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_confirmed_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_confirmed_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_ref_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_confirm_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` int(5) DEFAULT '0',
  `bed_status` int(5) DEFAULT '0',
  `payment_extra2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_table`
--

INSERT INTO `booking_table` (`booking_sl_id`, `user_id`, `apartment_uniq_id`, `room_uniq_id`, `bed_uniq_id`, `booking_time`, `booking_checkin_time`, `booking_checkout_time`, `booking_created_time`, `booking_confirmed_time`, `booking_created_by`, `booking_confirmed_by`, `booking_ref_no`, `payment_confirm_id`, `payment_status`, `bed_status`, `payment_extra2`) VALUES
(1, 's.hasan247', 'SMP', 'SMP101', 'SMP101A', '2019-04-20 18:00:00', '2019-04-21', '2019-04-22', '2019-04-21 08:30:03', '2019-04-21 08:30:03', 's.hasan247', 's.hasan247', '8989891', '9898981', 1, 1, NULL),
(32, 's.hasan247', 'SMP', 'SMP101', 'SMP101A', '2019-04-23 11:45:31', '2019-04-23', '2019-04-23', '2019-04-23 11:45:31', '2019-04-23 11:45:31', 's.hasan247', 's.hasan247', 'd5d55db3-1cf4', '46415a55-465c', 1, 1, NULL),
(33, 's.hasan247', 'SMP', 'SMP101', 'SMP101A', '2019-04-23 11:46:33', '2019-04-23', '2019-04-23', '2019-04-23 11:46:33', '2019-04-23 11:46:33', 's.hasan247', 's.hasan247', '0e7dec8b-ff3e', '0f0afa11-a9c4', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_table`
--

CREATE TABLE `device_table` (
  `device_sl_id` int(11) NOT NULL,
  `device_uniq_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_status` int(5) DEFAULT '0' COMMENT '1= ON; 0= OFF',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_model` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_s/n` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_mac` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_api_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_project` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_owner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_vendor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_updated_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_table`
--

INSERT INTO `device_table` (`device_sl_id`, `device_uniq_id`, `device_id`, `device_name`, `device_status`, `device_type`, `device_mode`, `device_location`, `device_model`, `device_s/n`, `device_ip`, `device_mac`, `device_api_id`, `device_project`, `device_owner`, `device_vendor`, `device_updated_by`, `device_updated_time`) VALUES
(1, '165121651', 'awfd251', 'smart socket', 0, 'plug socket', 'wifi', 'tokyo', 'a30a90', '123456789', '192.168.2.15', '18:54:87:93:aa', '/device', 'sharedhome', 'SMP101', 'china', NULL, '2019-04-23 06:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `room_info`
--

CREATE TABLE `room_info` (
  `room_sl_id` int(11) NOT NULL,
  `room_uniq_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'shared',
  `room_washroom_no` int(11) NOT NULL DEFAULT '1',
  `room_kitchen_no` int(11) NOT NULL DEFAULT '1',
  `room_amenity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment_uniq_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room_modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room_update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_modify_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_info`
--

INSERT INTO `room_info` (`room_sl_id`, `room_uniq_id`, `room_number`, `room_type`, `room_washroom_no`, `room_kitchen_no`, `room_amenity`, `apartment_uniq_id`, `room_update_time`, `room_modify_time`, `room_update_by`, `room_modify_by`) VALUES
(1, 'SMP101', '101', 'shared', 1, 1, 'Locker, Hair Dryer, Bath robe', 'SMP', '2019-04-21 08:21:03', '2019-04-21 08:21:03', 'admin', 'admin'),
(2, 'SMP102', '102', 'shared', 1, 1, 'Hair Dryer, Iron', 'SMP', '2019-04-21 08:21:34', '2019-04-21 08:21:34', 'admin', 'admin'),
(3, 'SMQ101', '101', 'shared', 1, 1, 'Hair Dryer, Iron', 'SMQ', '2019-04-21 08:27:14', '2019-04-21 08:27:14', 'admin', 'admin'),
(4, 'SMQ102', '102', 'shared', 1, 1, 'TV, Fridge', 'SMQ', '2019-04-21 08:27:30', '2019-04-21 08:27:30', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_sl_id` int(11) NOT NULL,
  `user_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_passport_no` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_religion` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_foodchoice` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_accstatus` int(11) DEFAULT '0',
  `user_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_nationality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_national_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_rent_to` date DEFAULT NULL,
  `user_rent_from` date DEFAULT NULL,
  `user_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_job_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_permanent_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_emergency_contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_photo_in_string` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_sl_id`, `user_id`, `user_pass`, `user_first_name`, `user_last_name`, `user_address`, `user_phone`, `user_passport_no`, `user_religion`, `user_foodchoice`, `user_gender`, `user_accstatus`, `user_email`, `user_nationality`, `user_birthday`, `user_national_id`, `user_rent_to`, `user_rent_from`, `user_organization`, `user_job_title`, `user_permanent_address`, `user_emergency_contact`, `user_photo_in_string`, `user_created_at`, `user_modified_at`, `user_created_by`, `user_modified_by`) VALUES
(1, 's.hasan247', '123456', 'Saiful', 'Hasan', 'asda', '01624441666', '156161', 'islam', 'veg', 'male', 0, 's.hasan247', 'Pakistan', '0000-00-00', '41517', '2030-04-19', '2028-04-19', 'asdasd', 'asda', 'asda', '161816', 'asdasdas', '2019-04-21 04:15:01', '2019-04-21 05:23:14', NULL, 'asdas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment_table`
--
ALTER TABLE `apartment_table`
  ADD PRIMARY KEY (`apartment_id`);

--
-- Indexes for table `bed_info`
--
ALTER TABLE `bed_info`
  ADD PRIMARY KEY (`bed_sl_id`);

--
-- Indexes for table `booking_table`
--
ALTER TABLE `booking_table`
  ADD PRIMARY KEY (`booking_sl_id`);

--
-- Indexes for table `device_table`
--
ALTER TABLE `device_table`
  ADD PRIMARY KEY (`device_sl_id`);

--
-- Indexes for table `room_info`
--
ALTER TABLE `room_info`
  ADD PRIMARY KEY (`room_sl_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_sl_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartment_table`
--
ALTER TABLE `apartment_table`
  MODIFY `apartment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bed_info`
--
ALTER TABLE `bed_info`
  MODIFY `bed_sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `booking_table`
--
ALTER TABLE `booking_table`
  MODIFY `booking_sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `device_table`
--
ALTER TABLE `device_table`
  MODIFY `device_sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_info`
--
ALTER TABLE `room_info`
  MODIFY `room_sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `user_sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
