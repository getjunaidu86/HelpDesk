-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2025 at 02:30 PM
-- Server version: 9.1.0
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_attachments`
--

DROP TABLE IF EXISTS `galaxy_attachments`;
CREATE TABLE IF NOT EXISTS `galaxy_attachments` (
  `att_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_attachments`
--

INSERT INTO `galaxy_attachments` (`att_id`, `ticket_id`, `saved_name`, `real_name`, `size`, `type`) VALUES
(1, 'LTP-QJQ-RVR4', 'LTP-QJQ-RVR4_35fc76140fc2b141858673f60859043e.png', 'Galaxy-ITT.png', 465011, '0');

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_auth_tokens`
--

DROP TABLE IF EXISTS `galaxy_auth_tokens`;
CREATE TABLE IF NOT EXISTS `galaxy_auth_tokens` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `selector` char(12) DEFAULT NULL,
  `token` char(64) DEFAULT NULL,
  `user_id` smallint UNSIGNED NOT NULL,
  `user_type` varchar(8) NOT NULL DEFAULT 'STAFF',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_banned_emails`
--

DROP TABLE IF EXISTS `galaxy_banned_emails`;
CREATE TABLE IF NOT EXISTS `galaxy_banned_emails` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `banned_by` smallint UNSIGNED NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `galaxy_banned_emails`
--

INSERT INTO `galaxy_banned_emails` (`id`, `email`, `banned_by`, `dt`) VALUES
(1, 'abcd@yahoo.com', 1, '2025-05-14 11:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_banned_ips`
--

DROP TABLE IF EXISTS `galaxy_banned_ips`;
CREATE TABLE IF NOT EXISTS `galaxy_banned_ips` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_from` int UNSIGNED NOT NULL DEFAULT '0',
  `ip_to` int UNSIGNED NOT NULL DEFAULT '0',
  `ip_display` varchar(100) NOT NULL,
  `banned_by` smallint UNSIGNED NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_bookmarks`
--

DROP TABLE IF EXISTS `galaxy_bookmarks`;
CREATE TABLE IF NOT EXISTS `galaxy_bookmarks` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint UNSIGNED NOT NULL,
  `ticket_id` mediumint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`,`user_id`),
  KEY `user_id` (`user_id`,`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_categories`
--

DROP TABLE IF EXISTS `galaxy_categories`;
CREATE TABLE IF NOT EXISTS `galaxy_categories` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cat_order` smallint UNSIGNED NOT NULL DEFAULT '0',
  `autoassign` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `autoassign_config` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `priority` enum('0','1','2','3') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '3',
  `default_due_date_amount` int DEFAULT NULL,
  `default_due_date_unit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_categories`
--

INSERT INTO `galaxy_categories` (`id`, `name`, `cat_order`, `autoassign`, `autoassign_config`, `type`, `priority`, `default_due_date_amount`, `default_due_date_unit`) VALUES
(1, 'General', 10, '1', NULL, '0', '3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_customers`
--

DROP TABLE IF EXISTS `galaxy_customers`;
CREATE TABLE IF NOT EXISTS `galaxy_customers` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verified` smallint UNSIGNED NOT NULL DEFAULT '0',
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verification_email_sent_at` timestamp NULL DEFAULT NULL,
  `mfa_enrollment` smallint UNSIGNED NOT NULL DEFAULT '0',
  `mfa_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_customers`
--

INSERT INTO `galaxy_customers` (`id`, `pass`, `name`, `email`, `language`, `verified`, `verification_token`, `verification_email_sent_at`, `mfa_enrollment`, `mfa_secret`) VALUES
(1, NULL, 'Tanko Junaidu Customer', 'jtanko@galaxyitt.com.ng', NULL, 0, NULL, NULL, 0, NULL),
(2, NULL, 'Musa Inuwa Jahun', 'mijahun@yahoo.com', NULL, 0, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_custom_fields`
--

DROP TABLE IF EXISTS `galaxy_custom_fields`;
CREATE TABLE IF NOT EXISTS `galaxy_custom_fields` (
  `id` tinyint UNSIGNED NOT NULL,
  `use` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `place` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `req` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `category` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `order` smallint UNSIGNED NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `useType` (`use`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_custom_fields`
--

INSERT INTO `galaxy_custom_fields` (`id`, `use`, `place`, `type`, `req`, `category`, `name`, `value`, `order`) VALUES
(1, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(2, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(3, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(4, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(5, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(6, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(7, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(8, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(9, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(10, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(11, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(12, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(13, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(14, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(15, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(16, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(17, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(18, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(19, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(20, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(21, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(22, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(23, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(24, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(25, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(26, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(27, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(28, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(29, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(30, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(31, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(32, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(33, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(34, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(35, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(36, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(37, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(38, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(39, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(40, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(41, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(42, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(43, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(44, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(45, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(46, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(47, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(48, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(49, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(50, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(51, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(52, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(53, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(54, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(55, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(56, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(57, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(58, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(59, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(60, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(61, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(62, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(63, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(64, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(65, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(66, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(67, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(68, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(69, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(70, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(71, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(72, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(73, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(74, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(75, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(76, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(77, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(78, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(79, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(80, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(81, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(82, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(83, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(84, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(85, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(86, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(87, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(88, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(89, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(90, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(91, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(92, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(93, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(94, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(95, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(96, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(97, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(98, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(99, '0', '0', 'text', '0', NULL, '', NULL, 1000),
(100, '0', '0', 'text', '0', NULL, '', NULL, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_custom_statuses`
--

DROP TABLE IF EXISTS `galaxy_custom_statuses`;
CREATE TABLE IF NOT EXISTS `galaxy_custom_statuses` (
  `id` tinyint UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `can_customers_change` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `order` smallint UNSIGNED NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_kb_articles`
--

DROP TABLE IF EXISTS `galaxy_kb_articles`;
CREATE TABLE IF NOT EXISTS `galaxy_kb_articles` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` smallint UNSIGNED NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` smallint UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `keywords` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rating` float NOT NULL DEFAULT '0',
  `votes` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `views` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `html` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `sticky` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `art_order` smallint UNSIGNED NOT NULL DEFAULT '0',
  `history` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `sticky` (`sticky`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_kb_attachments`
--

DROP TABLE IF EXISTS `galaxy_kb_attachments`;
CREATE TABLE IF NOT EXISTS `galaxy_kb_attachments` (
  `att_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `saved_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_kb_categories`
--

DROP TABLE IF EXISTS `galaxy_kb_categories`;
CREATE TABLE IF NOT EXISTS `galaxy_kb_categories` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent` smallint UNSIGNED NOT NULL,
  `articles` smallint UNSIGNED NOT NULL DEFAULT '0',
  `articles_private` smallint UNSIGNED NOT NULL DEFAULT '0',
  `articles_draft` smallint UNSIGNED NOT NULL DEFAULT '0',
  `cat_order` smallint UNSIGNED NOT NULL,
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_kb_categories`
--

INSERT INTO `galaxy_kb_categories` (`id`, `name`, `parent`, `articles`, `articles_private`, `articles_draft`, `cat_order`, `type`) VALUES
(1, 'Knowledgebase', 0, 0, 0, 0, 10, '0');

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_logins`
--

DROP TABLE IF EXISTS `galaxy_logins`;
CREATE TABLE IF NOT EXISTS `galaxy_logins` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `number` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `last_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_log_overdue`
--

DROP TABLE IF EXISTS `galaxy_log_overdue`;
CREATE TABLE IF NOT EXISTS `galaxy_log_overdue` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket` mediumint UNSIGNED NOT NULL,
  `category` smallint UNSIGNED NOT NULL,
  `priority` enum('0','1','2','3') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `owner` smallint UNSIGNED NOT NULL DEFAULT '0',
  `due_date` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `comments` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket` (`ticket`),
  KEY `category` (`category`),
  KEY `priority` (`priority`),
  KEY `status` (`status`),
  KEY `owner` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_mail`
--

DROP TABLE IF EXISTS `galaxy_mail`;
CREATE TABLE IF NOT EXISTS `galaxy_mail` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `from` smallint UNSIGNED NOT NULL,
  `to` smallint UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `deletedby` smallint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`,`read`,`deletedby`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_mail`
--

INSERT INTO `galaxy_mail` (`id`, `from`, `to`, `subject`, `message`, `dt`, `read`, `deletedby`) VALUES
(1, 9999, 1, 'Hesk quick start guide', '</p><div style=\"text-align:justify; padding-left: 10px; padding-right: 10px;\">\r\n\r\n<h2 style=\"padding-left:0px\">Welcome to Hesk, an excellent tool for improving your customer support!</h2>\r\n\r\n<h3>Below is a short guide to help you get started.</h3>\r\n\r\n<div class=\"main__content notice-flash \">\r\n<div class=\"notification orange\">\r\nAn up-to-date and expanded guide is available at <a href=\"https://www.hesk.com/knowledgebase/?article=109\" target=\"_blank\">Hesk online Quick Start Guide</a>.</div>\r\n</div>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #1: Set up your profile</h3>\r\n\r\n<ol>\r\n<li>go to <a href=\"profile.php\">Profile</a>,</li>\r\n<li>set your name and email address.</li>\r\n</ol>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #2: Configure Hesk</h3>\r\n\r\n<ol>\r\n<li>go to <a href=\"admin_settings_general.php\">Settings</a>,</li>\r\n<li>for a quick start, modify these settings on the \"General\" tab:<br><br>\r\n<b>Website title</b> - enter the title of your main website (not your help desk),<br>\r\n<b>Website URL</b> - enter the URL of your main website,<br>\r\n<b>Webmaster email</b> - enter an alternative email address people can contact in case your Hesk database is down<br>&nbsp;\r\n</li>\r\n<li>you can come back to the settings page later and explore all the options. To view details about a setting, click the [?]</li>\r\n</ol>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #3: Add support categories</h3>\r\n\r\n<p>Go to <a href=\"manage_categories.php\">Categories</a> to add support ticket categories.</p>\r\n<p>You cannot delete the default category, but you can rename it.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #4: Add your support team members</h3>\r\n\r\n<p>Go to <a href=\"manage_users.php\">Team</a> to create new support staff accounts.</p>\r\n<p>You can use two user types in Hesk:</p>\r\n<ul>\r\n<li><b>Administrators</b> who have full access to all Hesk features</li>\r\n<li><b>Staff</b> who you can restrict access to categories and features</li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #5: Useful tools</h3>\r\n\r\n<p>You can do a lot in the <a href=\"banned_emails.php\">Tools</a> section, for example:</p>\r\n<ul>\r\n<li>create custom ticket statuses,</li>\r\n<li>add custom input fields to the &quot;Submit a ticket&quot; form,</li>\r\n<li>make public announcements (Service messages),</li>\r\n<li>modify email templates,</li>\r\n<li>ban disruptive customers,</li>\r\n<li>and more.</li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #6: Create a Knowledgebase</h3>\r\n\r\n<p>A Knowledgebase is a collection of articles, guides, and answers to frequently asked questions, usually organized in multiple categories.</p>\r\n<p>A clear and comprehensive knowledgebase can drastically reduce the number of support tickets you receive, thereby saving you significant time and effort in the long run.</p>\r\n<p>Go to <a href=\"manage_knowledgebase.php\">Knowledgebase</a> to create categories and write articles for your knowledgebase.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #7: Don\'t repeat yourself</h3>\r\n\r\n<p>Sometimes several support tickets address the same issues - allowing you to use pre-written (&quot;canned&quot;) responses.</p>\r\n<p>To compose canned responses, go to the <a href=\"manage_canned.php\">Templates &gt; Responses</a> page.</p>\r\n<p>Similarly, you can create <a href=\"manage_ticket_templates.php\">Templates &gt; Tickets</a> if your staff will be submitting support tickets on the client\'s behalf, for example, from telephone conversations.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #8: Secure your help desk</h3>\r\n\r\n<p>Make sure your help desk is as secure as possible by going through the <a href=\"https://www.hesk.com/knowledgebase/?article=82\">Hesk security checklist</a>.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #9: Stay updated</h3>\r\n\r\n<p>Hesk regularly receives improvements and bug fixes; make sure you know about them!</p>\r\n<ul>\r\n<li>for fast notifications, <a href=\"https://x.com/HESKdotCOM\" rel=\"nofollow\">follow Hesk on <b>X</b></a></li>\r\n<li>for email notifications, subscribe to our low-volume, zero-spam <a href=\"https://www.hesk.com/newsletter.php\">newsletter</a></li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #10: Look professional</h3>\r\n\r\n<p><a href=\"https://www.hesk.com/get/hesk3-license\">Remove &quot;Powered by&quot; links</a> to support Hesk development and make it look more professional.</p>\r\n\r\n&nbsp;\r\n\r\n<h3>&raquo; Step #11: Too much hassle? Switch to Hesk Cloud for the ultimate experience</h3>\r\n\r\n<p>Experience the best of Hesk by moving your help desk into the Hesk Cloud:</p>\r\n<ul>\r\n<li>exclusive advanced modules,</li>\r\n<li>automated updates,</li>\r\n<li>free migration of your existing Hesk tickets and settings,</li>\r\n<li>we take care of maintenance, server setup and optimization, backups, and more!</li>\r\n</ul>\r\n\r\n<p>&nbsp;<br><a href=\"https://www.hesk.com/get/hesk3-cloud\" class=\"btn btn--blue-border\" style=\"text-decoration:none\">Click here to learn more about Hesk Cloud</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Again, welcome to Hesk, and enjoy using it!</p>\r\n\r\n<p>Klemen Stirn<br>\r\nFounder<br>\r\n<a href=\"https://www.hesk.com\">https://www.hesk.com</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n</div><p>', '2025-04-28 16:02:28', '1', 9999);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_mfa_backup_codes`
--

DROP TABLE IF EXISTS `galaxy_mfa_backup_codes`;
CREATE TABLE IF NOT EXISTS `galaxy_mfa_backup_codes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` smallint UNSIGNED NOT NULL,
  `user_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'STAFF',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_mfa_verification_tokens`
--

DROP TABLE IF EXISTS `galaxy_mfa_verification_tokens`;
CREATE TABLE IF NOT EXISTS `galaxy_mfa_verification_tokens` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint UNSIGNED NOT NULL,
  `user_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'STAFF',
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `verification_token` (`verification_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_notes`
--

DROP TABLE IF EXISTS `galaxy_notes`;
CREATE TABLE IF NOT EXISTS `galaxy_notes` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket` mediumint UNSIGNED NOT NULL,
  `who` smallint UNSIGNED NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketid` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_oauth_providers`
--

DROP TABLE IF EXISTS `galaxy_oauth_providers`;
CREATE TABLE IF NOT EXISTS `galaxy_oauth_providers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `authorization_url` text NOT NULL,
  `token_url` text NOT NULL,
  `client_id` text NOT NULL,
  `client_secret` text NOT NULL,
  `scope` text NOT NULL,
  `no_val_ssl` tinyint NOT NULL DEFAULT '0',
  `verified` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_oauth_tokens`
--

DROP TABLE IF EXISTS `galaxy_oauth_tokens`;
CREATE TABLE IF NOT EXISTS `galaxy_oauth_tokens` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL,
  `token_value` text,
  `token_type` varchar(32) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_online`
--

DROP TABLE IF EXISTS `galaxy_online`;
CREATE TABLE IF NOT EXISTS `galaxy_online` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint UNSIGNED NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tmp` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_pending_customer_email_changes`
--

DROP TABLE IF EXISTS `galaxy_pending_customer_email_changes`;
CREATE TABLE IF NOT EXISTS `galaxy_pending_customer_email_changes` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` mediumint UNSIGNED NOT NULL,
  `new_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  PRIMARY KEY (`id`),
  KEY `email` (`new_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_pipe_loops`
--

DROP TABLE IF EXISTS `galaxy_pipe_loops`;
CREATE TABLE IF NOT EXISTS `galaxy_pipe_loops` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hits` smallint UNSIGNED NOT NULL DEFAULT '0',
  `message_hash` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_pipe_rejections`
--

DROP TABLE IF EXISTS `galaxy_pipe_rejections`;
CREATE TABLE IF NOT EXISTS `galaxy_pipe_rejections` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_replies`
--

DROP TABLE IF EXISTS `galaxy_replies`;
CREATE TABLE IF NOT EXISTS `galaxy_replies` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `replyto` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `staffid` smallint UNSIGNED NOT NULL DEFAULT '0',
  `customer_id` mediumint UNSIGNED DEFAULT NULL,
  `rating` enum('1','5') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `read` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `eid` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replyto` (`replyto`),
  KEY `dt` (`dt`),
  KEY `staffid` (`staffid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_replies`
--

INSERT INTO `galaxy_replies` (`id`, `replyto`, `message`, `message_html`, `dt`, `attachments`, `staffid`, `customer_id`, `rating`, `read`, `eid`) VALUES
(1, 1, 'Alright am waiting. thank you', 'Alright am waiting. thank you', '2025-05-13 15:54:26', '', 0, 1, NULL, '0', NULL),
(2, 2, 'Hi, your enquiry has been received and we will get back to you very soon. Please hold on.This is a test canned response. My internet is down', 'Hi, your enquiry has been received and we will get back to you very soon. Please hold on.This is a test canned response. My internet is down', '2025-05-14 11:25:33', '', 1, NULL, NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_reply_drafts`
--

DROP TABLE IF EXISTS `galaxy_reply_drafts`;
CREATE TABLE IF NOT EXISTS `galaxy_reply_drafts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner` smallint UNSIGNED NOT NULL,
  `ticket` mediumint UNSIGNED NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_reset_password`
--

DROP TABLE IF EXISTS `galaxy_reset_password`;
CREATE TABLE IF NOT EXISTS `galaxy_reset_password` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` smallint UNSIGNED NOT NULL,
  `hash` char(40) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type` varchar(8) NOT NULL DEFAULT 'STAFF',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_service_messages`
--

DROP TABLE IF EXISTS `galaxy_service_messages`;
CREATE TABLE IF NOT EXISTS `galaxy_service_messages` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` smallint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `style` enum('0','1','2','3','4') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `type` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `order` smallint UNSIGNED NOT NULL DEFAULT '0',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_service_messages`
--

INSERT INTO `galaxy_service_messages` (`id`, `dt`, `author`, `title`, `message`, `language`, `style`, `type`, `order`, `location`) VALUES
(1, '2025-05-13 16:01:59', 1, 'New test title', '<p>New test message</p>', NULL, '2', '0', 10, 'c-profile');

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_std_replies`
--

DROP TABLE IF EXISTS `galaxy_std_replies`;
CREATE TABLE IF NOT EXISTS `galaxy_std_replies` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `reply_order` smallint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_std_replies`
--

INSERT INTO `galaxy_std_replies` (`id`, `title`, `message`, `message_html`, `reply_order`) VALUES
(1, 'Please Wait...', 'Hi, your enquiry has been received and we will get back to you very soon. Please hold on.', 'Hi, your enquiry has been received and we will get back to you very soon. Please hold on.', 10),
(2, 'New Canned Response', 'This is a test canned response. %%HESK_SUBJECT%%', 'This is a test canned response. %%HESK_SUBJECT%%', 20);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_temp_attachments`
--

DROP TABLE IF EXISTS `galaxy_temp_attachments`;
CREATE TABLE IF NOT EXISTS `galaxy_temp_attachments` (
  `att_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` timestamp NOT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_temp_attachments_limits`
--

DROP TABLE IF EXISTS `galaxy_temp_attachments_limits`;
CREATE TABLE IF NOT EXISTS `galaxy_temp_attachments_limits` (
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `upload_count` int UNSIGNED NOT NULL DEFAULT '1',
  `last_upload_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_tickets`
--

DROP TABLE IF EXISTS `galaxy_tickets`;
CREATE TABLE IF NOT EXISTS `galaxy_tickets` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `trackid` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `u_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `u_email` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `category` smallint UNSIGNED NOT NULL DEFAULT '1',
  `priority` enum('0','1','2','3') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '3',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dt` timestamp NOT NULL DEFAULT '1999-12-31 23:00:00',
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `firstreply` timestamp NULL DEFAULT NULL,
  `closedat` timestamp NULL DEFAULT NULL,
  `articles` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `openedby` mediumint DEFAULT '0',
  `firstreplyby` smallint UNSIGNED DEFAULT NULL,
  `closedby` mediumint DEFAULT NULL,
  `replies` smallint UNSIGNED NOT NULL DEFAULT '0',
  `staffreplies` smallint UNSIGNED NOT NULL DEFAULT '0',
  `owner` smallint UNSIGNED NOT NULL DEFAULT '0',
  `assignedby` mediumint DEFAULT NULL,
  `time_worked` time NOT NULL DEFAULT '00:00:00',
  `lastreplier` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `replierid` smallint UNSIGNED DEFAULT NULL,
  `archive` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `locked` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `attachments` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `merged` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `history` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom1` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom2` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom3` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom4` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom5` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom6` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom7` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom8` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom9` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom10` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom11` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom12` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom13` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom14` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom15` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom16` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom17` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom18` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom19` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom20` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom21` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom22` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom23` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom24` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom25` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom26` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom27` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom28` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom29` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom30` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom31` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom32` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom33` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom34` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom35` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom36` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom37` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom38` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom39` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom40` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom41` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom42` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom43` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom44` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom45` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom46` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom47` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom48` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom49` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom50` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom51` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom52` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom53` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom54` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom55` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom56` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom57` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom58` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom59` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom60` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom61` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom62` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom63` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom64` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom65` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom66` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom67` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom68` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom69` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom70` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom71` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom72` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom73` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom74` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom75` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom76` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom77` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom78` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom79` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom80` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom81` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom82` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom83` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom84` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom85` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom86` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom87` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom88` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom89` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom90` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom91` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom92` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom93` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom94` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom95` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom96` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom97` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom98` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom99` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom100` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `overdue_email_sent` tinyint(1) DEFAULT '0',
  `satisfaction_email_sent` tinyint(1) DEFAULT '0',
  `satisfaction_email_dt` timestamp NULL DEFAULT NULL,
  `eid` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trackid` (`trackid`),
  KEY `archive` (`archive`),
  KEY `categories` (`category`),
  KEY `statuses` (`status`),
  KEY `owner` (`owner`),
  KEY `openedby` (`openedby`,`firstreplyby`,`closedby`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_tickets`
--

INSERT INTO `galaxy_tickets` (`id`, `trackid`, `u_name`, `u_email`, `category`, `priority`, `subject`, `message`, `message_html`, `dt`, `lastchange`, `firstreply`, `closedat`, `articles`, `ip`, `language`, `status`, `openedby`, `firstreplyby`, `closedby`, `replies`, `staffreplies`, `owner`, `assignedby`, `time_worked`, `lastreplier`, `replierid`, `archive`, `locked`, `attachments`, `merged`, `history`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`, `custom11`, `custom12`, `custom13`, `custom14`, `custom15`, `custom16`, `custom17`, `custom18`, `custom19`, `custom20`, `custom21`, `custom22`, `custom23`, `custom24`, `custom25`, `custom26`, `custom27`, `custom28`, `custom29`, `custom30`, `custom31`, `custom32`, `custom33`, `custom34`, `custom35`, `custom36`, `custom37`, `custom38`, `custom39`, `custom40`, `custom41`, `custom42`, `custom43`, `custom44`, `custom45`, `custom46`, `custom47`, `custom48`, `custom49`, `custom50`, `custom51`, `custom52`, `custom53`, `custom54`, `custom55`, `custom56`, `custom57`, `custom58`, `custom59`, `custom60`, `custom61`, `custom62`, `custom63`, `custom64`, `custom65`, `custom66`, `custom67`, `custom68`, `custom69`, `custom70`, `custom71`, `custom72`, `custom73`, `custom74`, `custom75`, `custom76`, `custom77`, `custom78`, `custom79`, `custom80`, `custom81`, `custom82`, `custom83`, `custom84`, `custom85`, `custom86`, `custom87`, `custom88`, `custom89`, `custom90`, `custom91`, `custom92`, `custom93`, `custom94`, `custom95`, `custom96`, `custom97`, `custom98`, `custom99`, `custom100`, `due_date`, `overdue_email_sent`, `satisfaction_email_sent`, `satisfaction_email_dt`, `eid`) VALUES
(1, 'LTP-QJQ-RVR4', 'Tanko Junaidu Customer', 'jtanko@galaxyitt.com.ng', 1, '2', 'Domain name renewal', 'Your ticket has been received, please wait a little bit we are responding to you.', 'Your ticket has been received, please wait a little bit we are responding to you.', '2025-05-13 15:49:52', '2025-05-13 15:54:26', NULL, NULL, NULL, '::1', NULL, 0, 1, NULL, NULL, 1, 0, 1, -1, '00:00:00', '0', NULL, '0', '0', '1#Galaxy-ITT.png,', '', '<li class=\"smaller\">2025-05-13 15:49:52 | ticket created by Junaidu Tanko (Administrator)</li><li class=\"smaller\">2025-05-13 15:49:52 | automatically assigned to Junaidu Tanko (Administrator)</li>', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, 0, NULL, NULL),
(2, 'NVS-3VV-YNMT', 'Musa Inuwa Jahun', 'mijahun@yahoo.com', 1, '1', 'My internet is down', 'Please help, my internet network is down since around 04:00pm yesterday monday 12/05/2025.', 'Please help, my internet network is down since around 04:00pm yesterday monday 12/05/2025.', '2025-05-13 16:05:49', '2025-05-14 11:25:33', '2025-05-14 11:25:33', '2025-05-14 11:25:33', NULL, '::1', NULL, 3, 0, 1, 1, 1, 1, 1, -1, '00:00:41', '1', 1, '0', '0', '', '', '<li class=\"smaller\">2025-05-13 16:05:49 | submitted by Customer</li><li class=\"smaller\">2025-05-13 16:05:49 | automatically assigned to Junaidu Tanko (Administrator)</li><li class=\"smaller\">2025-05-14 11:25:33 | status changed to Resolved by Junaidu Tanko (Administrator)</li>', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_ticket_templates`
--

DROP TABLE IF EXISTS `galaxy_ticket_templates`;
CREATE TABLE IF NOT EXISTS `galaxy_ticket_templates` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `tpl_order` smallint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_ticket_templates`
--

INSERT INTO `galaxy_ticket_templates` (`id`, `title`, `message`, `message_html`, `tpl_order`) VALUES
(1, 'Waiting Response', 'Your ticket has been received, please wait a little bit we are responding to you.', 'Your ticket has been received, please wait a little bit we are responding to you.', 10),
(2, 'Thank You', 'Thank you for being with us. \r\nGalaxy ITT Team.\r\nDutse- Jigawa State.', 'Thank you for being with us. <br />\r\nGalaxy ITT Team.<br />\r\nDutse- Jigawa State.', 20);

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_ticket_to_customer`
--

DROP TABLE IF EXISTS `galaxy_ticket_to_customer`;
CREATE TABLE IF NOT EXISTS `galaxy_ticket_to_customer` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` mediumint UNSIGNED NOT NULL,
  `customer_id` mediumint UNSIGNED NOT NULL,
  `customer_type` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'REQUESTER',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_ticket_to_customer`
--

INSERT INTO `galaxy_ticket_to_customer` (`id`, `ticket_id`, `customer_id`, `customer_type`) VALUES
(1, 1, 1, 'REQUESTER'),
(2, 2, 2, 'REQUESTER');

-- --------------------------------------------------------

--
-- Table structure for table `galaxy_users`
--

DROP TABLE IF EXISTS `galaxy_users`;
CREATE TABLE IF NOT EXISTS `galaxy_users` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `isadmin` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `signature` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `categories` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `afterreply` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `autostart` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `autoreload` smallint UNSIGNED NOT NULL DEFAULT '0',
  `notify_customer_new` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_customer_reply` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `show_suggested` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_unassigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_my` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_unassigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_my` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_assigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_pm` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_note` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_unassigned` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_my` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_customer_approval` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `default_list` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `autoassign` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `heskprivileges` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ratingneg` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `ratingpos` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `replies` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `mfa_enrollment` smallint UNSIGNED NOT NULL DEFAULT '0',
  `mfa_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autoassign` (`autoassign`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `galaxy_users`
--

INSERT INTO `galaxy_users` (`id`, `user`, `pass`, `isadmin`, `name`, `email`, `signature`, `language`, `categories`, `afterreply`, `autostart`, `autoreload`, `notify_customer_new`, `notify_customer_reply`, `show_suggested`, `notify_new_unassigned`, `notify_new_my`, `notify_reply_unassigned`, `notify_reply_my`, `notify_assigned`, `notify_pm`, `notify_note`, `notify_overdue_unassigned`, `notify_overdue_my`, `notify_customer_approval`, `default_list`, `autoassign`, `heskprivileges`, `ratingneg`, `ratingpos`, `rating`, `replies`, `mfa_enrollment`, `mfa_secret`) VALUES
(1, 'Administrator', '$2y$10$oHclqr9u5MrH3dl1blKKvOgZMEnYPZgSz7yZJOv71rs9zuJ9Bm1Pm', '1', 'Junaidu Tanko', 'tankojunaidu@gmail.com', '', NULL, '', '0', '1', 0, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '', '1', '', 0, 0, 0, 1, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `galaxy_kb_articles`
--
ALTER TABLE `galaxy_kb_articles` ADD FULLTEXT KEY `subject` (`subject`,`content`,`keywords`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
