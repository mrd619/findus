-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2020 at 08:20 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydjango_45`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add register', 7, 'add_register'),
(26, 'Can change register', 7, 'change_register'),
(27, 'Can delete register', 7, 'delete_register'),
(28, 'Can view register', 7, 'view_register'),
(29, 'Can add addcat', 8, 'add_addcat'),
(30, 'Can change addcat', 8, 'change_addcat'),
(31, 'Can delete addcat', 8, 'delete_addcat'),
(32, 'Can view addcat', 8, 'view_addcat'),
(33, 'Can add addsubcat', 9, 'add_addsubcat'),
(34, 'Can change addsubcat', 9, 'change_addsubcat'),
(35, 'Can delete addsubcat', 9, 'delete_addsubcat'),
(36, 'Can view addsubcat', 9, 'view_addsubcat'),
(37, 'Can add locality', 10, 'add_locality'),
(38, 'Can change locality', 10, 'change_locality'),
(39, 'Can delete locality', 10, 'delete_locality'),
(40, 'Can view locality', 10, 'view_locality'),
(41, 'Can add location', 11, 'add_location'),
(42, 'Can change location', 11, 'change_location'),
(43, 'Can delete location', 11, 'delete_location'),
(44, 'Can view location', 11, 'view_location'),
(45, 'Can add payment', 12, 'add_payment'),
(46, 'Can change payment', 12, 'change_payment'),
(47, 'Can delete payment', 12, 'delete_payment'),
(48, 'Can view payment', 12, 'view_payment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'findus', 'register'),
(8, 'myadmin', 'addcat'),
(9, 'myadmin', 'addsubcat'),
(10, 'user', 'locality'),
(11, 'user', 'location'),
(12, 'user', 'payment');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-01-21 08:58:09.989920'),
(2, 'auth', '0001_initial', '2020-01-21 08:58:10.247535'),
(3, 'admin', '0001_initial', '2020-01-21 08:58:10.794422'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-01-21 08:58:10.933364'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-01-21 08:58:10.949365'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-01-21 08:58:11.023253'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-01-21 08:58:11.069261'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-01-21 08:58:11.103789'),
(9, 'auth', '0004_alter_user_username_opts', '2020-01-21 08:58:11.123790'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-01-21 08:58:11.163326'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-01-21 08:58:11.167321'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-01-21 08:58:11.179353'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-01-21 08:58:11.218916'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-01-21 08:58:11.258607'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-01-21 08:58:11.299731'),
(16, 'auth', '0011_update_proxy_permissions', '2020-01-21 08:58:11.314249'),
(17, 'findus', '0001_initial', '2020-01-21 08:58:11.355656'),
(18, 'myadmin', '0001_initial', '2020-01-21 08:58:11.383736'),
(19, 'myadmin', '0002_addsubcat', '2020-01-21 08:58:11.425877'),
(20, 'sessions', '0001_initial', '2020-01-21 08:58:11.461590'),
(21, 'user', '0001_initial', '2020-01-21 08:58:11.541587'),
(22, 'user', '0002_location', '2020-01-21 08:58:11.589591'),
(23, 'user', '0003_location_uid', '2020-01-21 08:58:11.661589'),
(24, 'user', '0004_payment', '2020-01-21 08:58:11.705588');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('clrol0w5sjshy6ikoiboamsvj2d1e417', 'YjdmMGE4ZDc1MDc5NmRkMDIyNzViOGIzMzJjZTcwOTdiYmEyYjQwNjp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==', '2020-02-04 09:01:05.786183'),
('xkztr65ucivzxg47r9v2qq1s96f6thtl', 'YjdmMGE4ZDc1MDc5NmRkMDIyNzViOGIzMzJjZTcwOTdiYmEyYjQwNjp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==', '2020-02-04 09:02:30.525385'),
('o22g75saz0gbv60l0b1vah9fgi638y60', 'YjdmMGE4ZDc1MDc5NmRkMDIyNzViOGIzMzJjZTcwOTdiYmEyYjQwNjp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==', '2020-02-04 09:03:08.975559'),
('wnekdk6nw8yyovvqra90hk1p8re7iq8t', 'YjdmMGE4ZDc1MDc5NmRkMDIyNzViOGIzMzJjZTcwOTdiYmEyYjQwNjp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==', '2020-02-04 09:28:58.615554'),
('uvjbwbs3pxoc43fkd5zeop5ghdyydu4h', 'YjdmMGE4ZDc1MDc5NmRkMDIyNzViOGIzMzJjZTcwOTdiYmEyYjQwNjp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==', '2020-02-04 09:29:29.828585'),
('g1ru08fed7gsfu37p2qmctq7nidzkfax', 'OTUyM2IwNDgzMjJjOGY5MzQ0YmFkOWIwNmYwZmRiMjdjY2ExN2ZmMTp7InN1bm0iOiJodXNhaW4uaG03ODY1M0BnbWFpbC5jb20iLCJzcm9sZSI6InVzZXIifQ==', '2020-02-04 09:30:38.762488'),
('awdwev9kg7by6b9wwta7ywrxuqd7relc', 'OTUyM2IwNDgzMjJjOGY5MzQ0YmFkOWIwNmYwZmRiMjdjY2ExN2ZmMTp7InN1bm0iOiJodXNhaW4uaG03ODY1M0BnbWFpbC5jb20iLCJzcm9sZSI6InVzZXIifQ==', '2020-02-04 09:32:54.141113');

-- --------------------------------------------------------

--
-- Table structure for table `findus_register`
--

DROP TABLE IF EXISTS `findus_register`;
CREATE TABLE IF NOT EXISTS `findus_register` (
  `regid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `dt` varchar(1000) NOT NULL,
  PRIMARY KEY (`regid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `findus_register`
--

INSERT INTO `findus_register` (`regid`, `name`, `username`, `password`, `address`, `mobile`, `city`, `gender`, `status`, `role`, `dt`) VALUES
(1, 'Husain Bohra', 'husain.hm78653@gmail.com', '123', '34,Mubarak Manzil Vidhya Nagar Mangrul Road Khargone', '9700753000', 'Indore', 'male', 1, 'user', '21/01/2020-14:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_addcat`
--

DROP TABLE IF EXISTS `myadmin_addcat`;
CREATE TABLE IF NOT EXISTS `myadmin_addcat` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catnm` varchar(50) NOT NULL,
  `caticonnm` varchar(1000) NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_addsubcat`
--

DROP TABLE IF EXISTS `myadmin_addsubcat`;
CREATE TABLE IF NOT EXISTS `myadmin_addsubcat` (
  `subcatid` int(11) NOT NULL AUTO_INCREMENT,
  `catnm` varchar(50) NOT NULL,
  `subcatnm` varchar(50) NOT NULL,
  `subcaticonnm` varchar(1000) NOT NULL,
  PRIMARY KEY (`subcatid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_locality`
--

DROP TABLE IF EXISTS `user_locality`;
CREATE TABLE IF NOT EXISTS `user_locality` (
  `localityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) NOT NULL,
  `localityname` varchar(100) NOT NULL,
  PRIMARY KEY (`localityid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
CREATE TABLE IF NOT EXISTS `user_location` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `subcategory` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `file1` varchar(500) NOT NULL,
  `file2` varchar(500) NOT NULL,
  `file3` varchar(500) NOT NULL,
  `file4` varchar(500) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `uid` varchar(100) NOT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
CREATE TABLE IF NOT EXISTS `user_payment` (
  `txnid` int(11) NOT NULL AUTO_INCREMENT,
  `locationid` int(11) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `dt` varchar(100) NOT NULL,
  PRIMARY KEY (`txnid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
