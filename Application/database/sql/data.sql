-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 04, 2024 at 10:09 PM
-- Server version: 9.0.1
-- PHP Version: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imgurai`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google2fa_status` tinyint(1) DEFAULT '0' COMMENT '0: Disabled, 1: Active',
  `google2fa_secret` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 : Unread 1: Read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint UNSIGNED NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `position`, `size`, `alias`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Head Code', NULL, 'head_code', '<!--Head code -->', 0, '2022-06-24 14:52:11', '2023-02-19 16:33:15'),
(2, 'Home Page And Images (Top)', 'Responsive', 'home_page_top', NULL, 0, '2022-06-24 14:53:01', '2023-02-23 20:35:28'),
(3, 'Home Page And Images (Center)', 'Responsive', 'home_page_center', NULL, 0, '2022-06-24 14:53:30', '2023-02-23 20:35:33'),
(4, 'Home Page And Images (Bottom)', 'Responsive', 'home_page_bottom', NULL, 0, '2022-06-24 15:29:57', '2022-06-24 19:23:30'),
(5, 'Image Page (Image Top)', 'Responsive', 'image_page_image_top', NULL, 0, '2022-06-24 15:29:57', '2022-06-24 19:14:36'),
(6, 'Image Page (Image Bottom)', 'Responsive', 'image_page_image_bottom', NULL, 0, '2022-06-24 15:29:57', '2022-06-24 19:14:46'),
(7, 'Image Page (Center)', 'Responsive', 'image_page_center', NULL, 0, '2022-06-24 15:29:57', '2022-06-24 19:07:41'),
(8, 'Image Page (Bottom)', 'Responsive', 'image_page_bottom', NULL, 0, '2022-06-24 15:29:57', '2022-06-24 19:24:30'),
(9, 'Blog Page (Top)', 'Responsive', 'blog_page_top', NULL, 0, '2022-06-24 15:37:39', '2022-06-24 19:25:03'),
(10, 'Blog Page (Bottom)', 'Responsive', 'blog_page_bottom', NULL, 0, '2022-06-24 15:37:39', '2022-06-24 19:24:53'),
(11, 'Blog Page (Sidebar Top)', 'Responsive', 'blog_page_sidebar_top', NULL, 0, '2022-06-24 15:37:39', '2022-06-24 19:15:34'),
(13, 'Blog Page (Article Top)', 'Responsive', 'blog_page_article_top', NULL, 0, '2022-06-24 15:37:39', '2022-06-24 19:24:43'),
(14, 'Blog Page (Article Bottom)', 'Responsive', 'blog_page_article_Bottom', NULL, 0, '2022-06-24 15:37:39', '2023-02-19 16:13:03'),
(15, 'Other Pages (Top)', 'Responsive', 'other_pages_top', NULL, 0, '2022-06-24 15:37:39', '2023-02-19 16:13:03'),
(16, 'Other Pages (Bottom)', 'Responsive', 'other_pages_bottom', NULL, 0, '2022-06-24 15:37:39', '2023-02-19 16:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `blog_articles`
--

CREATE TABLE `blog_articles` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `article_id` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captcha_providers`
--

CREATE TABLE `captcha_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Disabled 1:Enabled',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:No 1:Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `captcha_providers`
--

INSERT INTO `captcha_providers` (`id`, `name`, `alias`, `logo`, `settings`, `instructions`, `status`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Google reCAPTCHA', 'google_recaptcha', 'images/captcha-providers/google-recaptcha.png', '{\"site_key\":null,\"secret_key\":null}', NULL, 0, 1, '2024-10-13 16:39:19', '2024-11-02 15:05:26'),
(2, 'hCaptcha', 'hcaptcha', 'images/captcha-providers/hcaptcha.png', '{\"site_key\":null,\"secret_key\":null}', NULL, 0, 0, '2024-10-13 16:39:25', '2024-11-01 16:46:24'),
(3, 'Cloudflare Turnstile', 'cloudflare_turnstile', 'images/captcha-providers/cloudflare-turnstile.png', '{\"site_key\":null,\"secret_key\":null}', NULL, 0, 0, '2024-10-13 16:39:30', '2024-11-01 16:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `continent_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alpha_3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `capital`, `continent`, `continent_code`, `phone`, `currency`, `symbol`, `alpha_3`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 'Kabul', 'Asia', 'AS', '+93', 'AFN', '؋', 'AFG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(2, 'AX', 'Aland Islands', 'Mariehamn', 'Europe', 'EU', '+358', 'EUR', '€', 'ALA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(3, 'AL', 'Albania', 'Tirana', 'Europe', 'EU', '+355', 'ALL', 'Lek', 'ALB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(4, 'DZ', 'Algeria', 'Algiers', 'Africa', 'AF', '+213', 'DZD', 'دج', 'DZA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(5, 'AS', 'American Samoa', 'Pago Pago', 'Oceania', 'OC', '+1684', 'USD', '$', 'ASM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(6, 'AD', 'Andorra', 'Andorra la Vella', 'Europe', 'EU', '+376', 'EUR', '€', 'AND', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(7, 'AO', 'Angola', 'Luanda', 'Africa', 'AF', '+244', 'AOA', 'Kz', 'AGO', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(8, 'AI', 'Anguilla', 'The Valley', 'North America', 'NA', '+1264', 'XCD', '$', 'AIA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(9, 'AQ', 'Antarctica', 'Antarctica', 'Antarctica', 'AN', '+672', 'AAD', '$', 'ATA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(10, 'AG', 'Antigua and Barbuda', 'St. John\'s', 'North America', 'NA', '+1268', 'XCD', '$', 'ATG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(11, 'AR', 'Argentina', 'Buenos Aires', 'South America', 'SA', '+54', 'ARS', '$', 'ARG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(12, 'AM', 'Armenia', 'Yerevan', 'Asia', 'AS', '+374', 'AMD', '֏', 'ARM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(13, 'AW', 'Aruba', 'Oranjestad', 'North America', 'NA', '+297', 'AWG', 'ƒ', 'ABW', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(14, 'AU', 'Australia', 'Canberra', 'Oceania', 'OC', '+61', 'AUD', '$', 'AUS', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(15, 'AT', 'Austria', 'Vienna', 'Europe', 'EU', '+43', 'EUR', '€', 'AUT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(16, 'AZ', 'Azerbaijan', 'Baku', 'Asia', 'AS', '+994', 'AZN', 'm', 'AZE', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(17, 'BS', 'Bahamas', 'Nassau', 'North America', 'NA', '+1242', 'BSD', 'B$', 'BHS', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(18, 'BH', 'Bahrain', 'Manama', 'Asia', 'AS', '+973', 'BHD', '.د.ب', 'BHR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(19, 'BD', 'Bangladesh', 'Dhaka', 'Asia', 'AS', '+880', 'BDT', '৳', 'BGD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(20, 'BB', 'Barbados', 'Bridgetown', 'North America', 'NA', '+1246', 'BBD', 'Bds$', 'BRB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(21, 'BY', 'Belarus', 'Minsk', 'Europe', 'EU', '+375', 'BYN', 'Br', 'BLR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(22, 'BE', 'Belgium', 'Brussels', 'Europe', 'EU', '+32', 'EUR', '€', 'BEL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(23, 'BZ', 'Belize', 'Belmopan', 'North America', 'NA', '+501', 'BZD', '$', 'BLZ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(24, 'BJ', 'Benin', 'Porto-Novo', 'Africa', 'AF', '+229', 'XOF', 'CFA', 'BEN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(25, 'BM', 'Bermuda', 'Hamilton', 'North America', 'NA', '+1441', 'BMD', '$', 'BMU', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(26, 'BT', 'Bhutan', 'Thimphu', 'Asia', 'AS', '+975', 'BTN', 'Nu.', 'BTN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(27, 'BO', 'Bolivia', 'Sucre', 'South America', 'SA', '+591', 'BOB', 'Bs.', 'BOL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'Kralendijk', 'North America', 'NA', '+599', 'USD', '$', 'BES', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(29, 'BA', 'Bosnia and Herzegovina', 'Sarajevo', 'Europe', 'EU', '+387', 'BAM', 'KM', 'BIH', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(30, 'BW', 'Botswana', 'Gaborone', 'Africa', 'AF', '+267', 'BWP', 'P', 'BWA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(31, 'BV', 'Bouvet Island', NULL, 'Antarctica', 'AN', '+55', 'NOK', 'kr', 'BVT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(32, 'BR', 'Brazil', 'Brasilia', 'South America', 'SA', '+55', 'BRL', 'R$', 'BRA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(33, 'IO', 'British Indian Ocean Territory', 'Diego Garcia', 'Asia', 'AS', '+246', 'USD', '$', 'IOT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(34, 'BN', 'Brunei Darussalam', 'Bandar Seri Begawan', 'Asia', 'AS', '+673', 'BND', 'B$', 'BRN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(35, 'BG', 'Bulgaria', 'Sofia', 'Europe', 'EU', '+359', 'BGN', 'Лв.', 'BGR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(36, 'BF', 'Burkina Faso', 'Ouagadougou', 'Africa', 'AF', '+226', 'XOF', 'CFA', 'BFA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(37, 'BI', 'Burundi', 'Bujumbura', 'Africa', 'AF', '+257', 'BIF', 'FBu', 'BDI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(38, 'KH', 'Cambodia', 'Phnom Penh', 'Asia', 'AS', '+855', 'KHR', 'KHR', 'KHM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(39, 'CM', 'Cameroon', 'Yaounde', 'Africa', 'AF', '+237', 'XAF', 'FCFA', 'CMR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(40, 'CA', 'Canada', 'Ottawa', 'North America', 'NA', '+1', 'CAD', '$', 'CAN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(41, 'CV', 'Cape Verde', 'Praia', 'Africa', 'AF', '+238', 'CVE', '$', 'CPV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(42, 'KY', 'Cayman Islands', 'George Town', 'North America', 'NA', '+1345', 'KYD', '$', 'CYM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(43, 'CF', 'Central African Republic', 'Bangui', 'Africa', 'AF', '+236', 'XAF', 'FCFA', 'CAF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(44, 'TD', 'Chad', 'N\'Djamena', 'Africa', 'AF', '+235', 'XAF', 'FCFA', 'TCD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(45, 'CL', 'Chile', 'Santiago', 'South America', 'SA', '+56', 'CLP', '$', 'CHL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(46, 'CN', 'China', 'Beijing', 'Asia', 'AS', '+86', 'CNY', '¥', 'CHN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(47, 'CX', 'Christmas Island', 'Flying Fish Cove', 'Asia', 'AS', '+61', 'AUD', '$', 'CXR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(48, 'CC', 'Cocos (Keeling) Islands', 'West Island', 'Asia', 'AS', '+672', 'AUD', '$', 'CCK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(49, 'CO', 'Colombia', 'Bogota', 'South America', 'SA', '+57', 'COP', '$', 'COL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(50, 'KM', 'Comoros', 'Moroni', 'Africa', 'AF', '+269', 'KMF', 'CF', 'COM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(51, 'CG', 'Congo', 'Brazzaville', 'Africa', 'AF', '+242', 'XAF', 'FC', 'COG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(52, 'CD', 'Congo, Democratic Republic of the Congo', 'Kinshasa', 'Africa', 'AF', '+242', 'CDF', 'FC', 'COD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(53, 'CK', 'Cook Islands', 'Avarua', 'Oceania', 'OC', '+682', 'NZD', '$', 'COK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(54, 'CR', 'Costa Rica', 'San Jose', 'North America', 'NA', '+506', 'CRC', '₡', 'CRI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(55, 'CI', 'Cote D\'Ivoire', 'Yamoussoukro', 'Africa', 'AF', '+225', 'XOF', 'CFA', 'CIV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(56, 'HR', 'Croatia', 'Zagreb', 'Europe', 'EU', '+385', 'HRK', 'kn', 'HRV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(57, 'CU', 'Cuba', 'Havana', 'North America', 'NA', '+53', 'CUP', '$', 'CUB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(58, 'CW', 'Curacao', 'Willemstad', 'North America', 'NA', '+599', 'ANG', 'ƒ', 'CUW', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(59, 'CY', 'Cyprus', 'Nicosia', 'Asia', 'AS', '+357', 'EUR', '€', 'CYP', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(60, 'CZ', 'Czech Republic', 'Prague', 'Europe', 'EU', '+420', 'CZK', 'Kč', 'CZE', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(61, 'DK', 'Denmark', 'Copenhagen', 'Europe', 'EU', '+45', 'DKK', 'Kr.', 'DNK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(62, 'DJ', 'Djibouti', 'Djibouti', 'Africa', 'AF', '+253', 'DJF', 'Fdj', 'DJI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(63, 'DM', 'Dominica', 'Roseau', 'North America', 'NA', '+1767', 'XCD', '$', 'DMA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(64, 'DO', 'Dominican Republic', 'Santo Domingo', 'North America', 'NA', '+1809', 'DOP', '$', 'DOM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(65, 'EC', 'Ecuador', 'Quito', 'South America', 'SA', '+593', 'USD', '$', 'ECU', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(66, 'EG', 'Egypt', 'Cairo', 'Africa', 'AF', '+20', 'EGP', 'ج.م', 'EGY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(67, 'SV', 'El Salvador', 'San Salvador', 'North America', 'NA', '+503', 'USD', '$', 'SLV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(68, 'GQ', 'Equatorial Guinea', 'Malabo', 'Africa', 'AF', '+240', 'XAF', 'FCFA', 'GNQ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(69, 'ER', 'Eritrea', 'Asmara', 'Africa', 'AF', '+291', 'ERN', 'Nfk', 'ERI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(70, 'EE', 'Estonia', 'Tallinn', 'Europe', 'EU', '+372', 'EUR', '€', 'EST', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(71, 'ET', 'Ethiopia', 'Addis Ababa', 'Africa', 'AF', '+251', 'ETB', 'Nkf', 'ETH', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(72, 'FK', 'Falkland Islands (Malvinas)', 'Stanley', 'South America', 'SA', '+500', 'FKP', '£', 'FLK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(73, 'FO', 'Faroe Islands', 'Torshavn', 'Europe', 'EU', '+298', 'DKK', 'Kr.', 'FRO', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(74, 'FJ', 'Fiji', 'Suva', 'Oceania', 'OC', '+679', 'FJD', 'FJ$', 'FJI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(75, 'FI', 'Finland', 'Helsinki', 'Europe', 'EU', '+358', 'EUR', '€', 'FIN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(76, 'FR', 'France', 'Paris', 'Europe', 'EU', '+33', 'EUR', '€', 'FRA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(77, 'GF', 'French Guiana', 'Cayenne', 'South America', 'SA', '+594', 'EUR', '€', 'GUF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(78, 'PF', 'French Polynesia', 'Papeete', 'Oceania', 'OC', '+689', 'XPF', '₣', 'PYF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(79, 'TF', 'French Southern Territories', 'Port-aux-Francais', 'Antarctica', 'AN', '+262', 'EUR', '€', 'ATF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(80, 'GA', 'Gabon', 'Libreville', 'Africa', 'AF', '+241', 'XAF', 'FCFA', 'GAB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(81, 'GM', 'Gambia', 'Banjul', 'Africa', 'AF', '+220', 'GMD', 'D', 'GMB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(82, 'GE', 'Georgia', 'Tbilisi', 'Asia', 'AS', '+995', 'GEL', 'ლ', 'GEO', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(83, 'DE', 'Germany', 'Berlin', 'Europe', 'EU', '+49', 'EUR', '€', 'DEU', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(84, 'GH', 'Ghana', 'Accra', 'Africa', 'AF', '+233', 'GHS', 'GH₵', 'GHA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(85, 'GI', 'Gibraltar', 'Gibraltar', 'Europe', 'EU', '+350', 'GIP', '£', 'GIB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(86, 'GR', 'Greece', 'Athens', 'Europe', 'EU', '+30', 'EUR', '€', 'GRC', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(87, 'GL', 'Greenland', 'Nuuk', 'North America', 'NA', '+299', 'DKK', 'Kr.', 'GRL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(88, 'GD', 'Grenada', 'St. George\'s', 'North America', 'NA', '+1473', 'XCD', '$', 'GRD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(89, 'GP', 'Guadeloupe', 'Basse-Terre', 'North America', 'NA', '+590', 'EUR', '€', 'GLP', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(90, 'GU', 'Guam', 'Hagatna', 'Oceania', 'OC', '+1671', 'USD', '$', 'GUM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(91, 'GT', 'Guatemala', 'Guatemala City', 'North America', 'NA', '+502', 'GTQ', 'Q', 'GTM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(92, 'GG', 'Guernsey', 'St Peter Port', 'Europe', 'EU', '+44', 'GBP', '£', 'GGY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(93, 'GN', 'Guinea', 'Conakry', 'Africa', 'AF', '+224', 'GNF', 'FG', 'GIN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(94, 'GW', 'Guinea-Bissau', 'Bissau', 'Africa', 'AF', '+245', 'XOF', 'CFA', 'GNB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(95, 'GY', 'Guyana', 'Georgetown', 'South America', 'SA', '+592', 'GYD', '$', 'GUY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(96, 'HT', 'Haiti', 'Port-au-Prince', 'North America', 'NA', '+509', 'HTG', 'G', 'HTI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(97, 'HM', 'Heard Island and Mcdonald Islands', '', 'Antarctica', 'AN', '+0', 'AUD', '$', 'HMD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(98, 'VA', 'Holy See (Vatican City State)', 'Vatican City', 'Europe', 'EU', '+39', 'EUR', '€', 'VAT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(99, 'HN', 'Honduras', 'Tegucigalpa', 'North America', 'NA', '+504', 'HNL', 'L', 'HND', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(100, 'HK', 'Hong Kong', 'Hong Kong', 'Asia', 'AS', '+852', 'HKD', '$', 'HKG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(101, 'HU', 'Hungary', 'Budapest', 'Europe', 'EU', '+36', 'HUF', 'Ft', 'HUN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(102, 'IS', 'Iceland', 'Reykjavik', 'Europe', 'EU', '+354', 'ISK', 'kr', 'ISL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(103, 'IN', 'India', 'New Delhi', 'Asia', 'AS', '+91', 'INR', '₹', 'IND', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(104, 'ID', 'Indonesia', 'Jakarta', 'Asia', 'AS', '+62', 'IDR', 'Rp', 'IDN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(105, 'IR', 'Iran, Islamic Republic of', 'Tehran', 'Asia', 'AS', '+98', 'IRR', '﷼', 'IRN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(106, 'IQ', 'Iraq', 'Baghdad', 'Asia', 'AS', '+964', 'IQD', 'د.ع', 'IRQ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(107, 'IE', 'Ireland', 'Dublin', 'Europe', 'EU', '+353', 'EUR', '€', 'IRL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(108, 'IM', 'Isle of Man', 'Douglas, Isle of Man', 'Europe', 'EU', '+44', 'GBP', '£', 'IMN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(109, 'IL', 'Israel', 'Jerusalem', 'Asia', 'AS', '+972', 'ILS', '₪', 'ISR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(110, 'IT', 'Italy', 'Rome', 'Europe', 'EU', '+39', 'EUR', '€', 'ITA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(111, 'JM', 'Jamaica', 'Kingston', 'North America', 'NA', '+1876', 'JMD', 'J$', 'JAM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(112, 'JP', 'Japan', 'Tokyo', 'Asia', 'AS', '+81', 'JPY', '¥', 'JPN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(113, 'JE', 'Jersey', 'Saint Helier', 'Europe', 'EU', '+44', 'GBP', '£', 'JEY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(114, 'JO', 'Jordan', 'Amman', 'Asia', 'AS', '+962', 'JOD', 'ا.د', 'JOR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(115, 'KZ', 'Kazakhstan', 'Astana', 'Asia', 'AS', '+7', 'KZT', 'лв', 'KAZ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(116, 'KE', 'Kenya', 'Nairobi', 'Africa', 'AF', '+254', 'KES', 'KSh', 'KEN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(117, 'KI', 'Kiribati', 'Tarawa', 'Oceania', 'OC', '+686', 'AUD', '$', 'KIR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(118, 'KP', 'Korea, Democratic People\'s Republic of', 'Pyongyang', 'Asia', 'AS', '+850', 'KPW', '₩', 'PRK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(119, 'KR', 'Korea, Republic of', 'Seoul', 'Asia', 'AS', '+82', 'KRW', '₩', 'KOR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(120, 'XK', 'Kosovo', 'Pristina', 'Europe', 'EU', '+381', 'EUR', '€', 'XKX', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(121, 'KW', 'Kuwait', 'Kuwait City', 'Asia', 'AS', '+965', 'KWD', 'ك.د', 'KWT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(122, 'KG', 'Kyrgyzstan', 'Bishkek', 'Asia', 'AS', '+996', 'KGS', 'лв', 'KGZ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(123, 'LA', 'Lao People\'s Democratic Republic', 'Vientiane', 'Asia', 'AS', '+856', 'LAK', '₭', 'LAO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(124, 'LV', 'Latvia', 'Riga', 'Europe', 'EU', '+371', 'EUR', '€', 'LVA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(125, 'LB', 'Lebanon', 'Beirut', 'Asia', 'AS', '+961', 'LBP', '£', 'LBN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(126, 'LS', 'Lesotho', 'Maseru', 'Africa', 'AF', '+266', 'LSL', 'L', 'LSO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(127, 'LR', 'Liberia', 'Monrovia', 'Africa', 'AF', '+231', 'LRD', '$', 'LBR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(128, 'LY', 'Libyan Arab Jamahiriya', 'Tripolis', 'Africa', 'AF', '+218', 'LYD', 'د.ل', 'LBY', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(129, 'LI', 'Liechtenstein', 'Vaduz', 'Europe', 'EU', '+423', 'CHF', 'CHf', 'LIE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(130, 'LT', 'Lithuania', 'Vilnius', 'Europe', 'EU', '+370', 'EUR', '€', 'LTU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(131, 'LU', 'Luxembourg', 'Luxembourg', 'Europe', 'EU', '+352', 'EUR', '€', 'LUX', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(132, 'MO', 'Macao', 'Macao', 'Asia', 'AS', '+853', 'MOP', '$', 'MAC', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(133, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'Skopje', 'Europe', 'EU', '+389', 'MKD', 'ден', 'MKD', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(134, 'MG', 'Madagascar', 'Antananarivo', 'Africa', 'AF', '+261', 'MGA', 'Ar', 'MDG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(135, 'MW', 'Malawi', 'Lilongwe', 'Africa', 'AF', '+265', 'MWK', 'MK', 'MWI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(136, 'MY', 'Malaysia', 'Kuala Lumpur', 'Asia', 'AS', '+60', 'MYR', 'RM', 'MYS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(137, 'MV', 'Maldives', 'Male', 'Asia', 'AS', '+960', 'MVR', 'Rf', 'MDV', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(138, 'ML', 'Mali', 'Bamako', 'Africa', 'AF', '+223', 'XOF', 'CFA', 'MLI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(139, 'MT', 'Malta', 'Valletta', 'Europe', 'EU', '+356', 'EUR', '€', 'MLT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(140, 'MH', 'Marshall Islands', 'Majuro', 'Oceania', 'OC', '+692', 'USD', '$', 'MHL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(141, 'MQ', 'Martinique', 'Fort-de-France', 'North America', 'NA', '+596', 'EUR', '€', 'MTQ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(142, 'MR', 'Mauritania', 'Nouakchott', 'Africa', 'AF', '+222', 'MRO', 'MRU', 'MRT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(143, 'MU', 'Mauritius', 'Port Louis', 'Africa', 'AF', '+230', 'MUR', '₨', 'MUS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(144, 'YT', 'Mayotte', 'Mamoudzou', 'Africa', 'AF', '+269', 'EUR', '€', 'MYT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(145, 'MX', 'Mexico', 'Mexico City', 'North America', 'NA', '+52', 'MXN', '$', 'MEX', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(146, 'FM', 'Micronesia, Federated States of', 'Palikir', 'Oceania', 'OC', '+691', 'USD', '$', 'FSM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(147, 'MD', 'Moldova, Republic of', 'Chisinau', 'Europe', 'EU', '+373', 'MDL', 'L', 'MDA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(148, 'MC', 'Monaco', 'Monaco', 'Europe', 'EU', '+377', 'EUR', '€', 'MCO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(149, 'MN', 'Mongolia', 'Ulan Bator', 'Asia', 'AS', '+976', 'MNT', '₮', 'MNG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(150, 'ME', 'Montenegro', 'Podgorica', 'Europe', 'EU', '+382', 'EUR', '€', 'MNE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(151, 'MS', 'Montserrat', 'Plymouth', 'North America', 'NA', '+1664', 'XCD', '$', 'MSR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(152, 'MA', 'Morocco', 'Rabat', 'Africa', 'AF', '+212', 'MAD', 'DH', 'MAR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(153, 'MZ', 'Mozambique', 'Maputo', 'Africa', 'AF', '+258', 'MZN', 'MT', 'MOZ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(154, 'MM', 'Myanmar', 'Nay Pyi Taw', 'Asia', 'AS', '+95', 'MMK', 'K', 'MMR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(155, 'NA', 'Namibia', 'Windhoek', 'Africa', 'AF', '+264', 'NAD', '$', 'NAM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(156, 'NR', 'Nauru', 'Yaren', 'Oceania', 'OC', '+674', 'AUD', '$', 'NRU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(157, 'NP', 'Nepal', 'Kathmandu', 'Asia', 'AS', '+977', 'NPR', '₨', 'NPL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(158, 'NL', 'Netherlands', 'Amsterdam', 'Europe', 'EU', '+31', 'EUR', '€', 'NLD', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(159, 'AN', 'Netherlands Antilles', 'Willemstad', 'North America', 'NA', '+599', 'ANG', 'NAf', 'ANT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(160, 'NC', 'New Caledonia', 'Noumea', 'Oceania', 'OC', '+687', 'XPF', '₣', 'NCL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(161, 'NZ', 'New Zealand', 'Wellington', 'Oceania', 'OC', '+64', 'NZD', '$', 'NZL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(162, 'NI', 'Nicaragua', 'Managua', 'North America', 'NA', '+505', 'NIO', 'C$', 'NIC', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(163, 'NE', 'Niger', 'Niamey', 'Africa', 'AF', '+227', 'XOF', 'CFA', 'NER', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(164, 'NG', 'Nigeria', 'Abuja', 'Africa', 'AF', '+234', 'NGN', '₦', 'NGA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(165, 'NU', 'Niue', 'Alofi', 'Oceania', 'OC', '+683', 'NZD', '$', 'NIU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(166, 'NF', 'Norfolk Island', 'Kingston', 'Oceania', 'OC', '+672', 'AUD', '$', 'NFK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(167, 'MP', 'Northern Mariana Islands', 'Saipan', 'Oceania', 'OC', '+1670', 'USD', '$', 'MNP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(168, 'NO', 'Norway', 'Oslo', 'Europe', 'EU', '+47', 'NOK', 'kr', 'NOR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(169, 'OM', 'Oman', 'Muscat', 'Asia', 'AS', '+968', 'OMR', '.ع.ر', 'OMN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(170, 'PK', 'Pakistan', 'Islamabad', 'Asia', 'AS', '+92', 'PKR', '₨', 'PAK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(171, 'PW', 'Palau', 'Melekeok', 'Oceania', 'OC', '+680', 'USD', '$', 'PLW', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(172, 'PS', 'Palestinian Territory, Occupied', 'East Jerusalem', 'Asia', 'AS', '+970', 'ILS', '₪', 'PSE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(173, 'PA', 'Panama', 'Panama City', 'North America', 'NA', '+507', 'PAB', 'B/.', 'PAN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(174, 'PG', 'Papua New Guinea', 'Port Moresby', 'Oceania', 'OC', '+675', 'PGK', 'K', 'PNG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(175, 'PY', 'Paraguay', 'Asuncion', 'South America', 'SA', '+595', 'PYG', '₲', 'PRY', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(176, 'PE', 'Peru', 'Lima', 'South America', 'SA', '+51', 'PEN', 'S/.', 'PER', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(177, 'PH', 'Philippines', 'Manila', 'Asia', 'AS', '+63', 'PHP', '₱', 'PHL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(178, 'PN', 'Pitcairn', 'Adamstown', 'Oceania', 'OC', '+64', 'NZD', '$', 'PCN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(179, 'PL', 'Poland', 'Warsaw', 'Europe', 'EU', '+48', 'PLN', 'zł', 'POL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(180, 'PT', 'Portugal', 'Lisbon', 'Europe', 'EU', '+351', 'EUR', '€', 'PRT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(181, 'PR', 'Puerto Rico', 'San Juan', 'North America', 'NA', '+1787', 'USD', '$', 'PRI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(182, 'QA', 'Qatar', 'Doha', 'Asia', 'AS', '+974', 'QAR', 'ق.ر', 'QAT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(183, 'RE', 'Reunion', 'Saint-Denis', 'Africa', 'AF', '+262', 'EUR', '€', 'REU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(184, 'RO', 'Romania', 'Bucharest', 'Europe', 'EU', '+40', 'RON', 'lei', 'ROM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(185, 'RU', 'Russian Federation', 'Moscow', 'Asia', 'AS', '+70', 'RUB', '₽', 'RUS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(186, 'RW', 'Rwanda', 'Kigali', 'Africa', 'AF', '+250', 'RWF', 'FRw', 'RWA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(187, 'BL', 'Saint Barthelemy', 'Gustavia', 'North America', 'NA', '+590', 'EUR', '€', 'BLM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(188, 'SH', 'Saint Helena', 'Jamestown', 'Africa', 'AF', '+290', 'SHP', '£', 'SHN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(189, 'KN', 'Saint Kitts and Nevis', 'Basseterre', 'North America', 'NA', '+1869', 'XCD', '$', 'KNA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(190, 'LC', 'Saint Lucia', 'Castries', 'North America', 'NA', '+1758', 'XCD', '$', 'LCA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(191, 'MF', 'Saint Martin', 'Marigot', 'North America', 'NA', '+590', 'EUR', '€', 'MAF', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(192, 'PM', 'Saint Pierre and Miquelon', 'Saint-Pierre', 'North America', 'NA', '+508', 'EUR', '€', 'SPM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(193, 'VC', 'Saint Vincent and the Grenadines', 'Kingstown', 'North America', 'NA', '+1784', 'XCD', '$', 'VCT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(194, 'WS', 'Samoa', 'Apia', 'Oceania', 'OC', '+684', 'WST', 'SAT', 'WSM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(195, 'SM', 'San Marino', 'San Marino', 'Europe', 'EU', '+378', 'EUR', '€', 'SMR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(196, 'ST', 'Sao Tome and Principe', 'Sao Tome', 'Africa', 'AF', '+239', 'STD', 'Db', 'STP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(197, 'SA', 'Saudi Arabia', 'Riyadh', 'Asia', 'AS', '+966', 'SAR', '﷼', 'SAU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(198, 'SN', 'Senegal', 'Dakar', 'Africa', 'AF', '+221', 'XOF', 'CFA', 'SEN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(199, 'RS', 'Serbia', 'Belgrade', 'Europe', 'EU', '+381', 'RSD', 'din', 'SRB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(200, 'CS', 'Serbia and Montenegro', 'Belgrade', 'Europe', 'EU', '+381', 'RSD', 'din', 'SCG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(201, 'SC', 'Seychelles', 'Victoria', 'Africa', 'AF', '+248', 'SCR', 'SRe', 'SYC', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(202, 'SL', 'Sierra Leone', 'Freetown', 'Africa', 'AF', '+232', 'SLL', 'Le', 'SLE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(203, 'SG', 'Singapore', 'Singapur', 'Asia', 'AS', '+65', 'SGD', '$', 'SGP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(204, 'SX', 'Sint Maarten', 'Philipsburg', 'North America', 'NA', '+1', 'ANG', 'ƒ', 'SXM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(205, 'SK', 'Slovakia', 'Bratislava', 'Europe', 'EU', '+421', 'EUR', '€', 'SVK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(206, 'SI', 'Slovenia', 'Ljubljana', 'Europe', 'EU', '+386', 'EUR', '€', 'SVN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(207, 'SB', 'Solomon Islands', 'Honiara', 'Oceania', 'OC', '+677', 'SBD', 'Si$', 'SLB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(208, 'SO', 'Somalia', 'Mogadishu', 'Africa', 'AF', '+252', 'SOS', 'Sh.so.', 'SOM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(209, 'ZA', 'South Africa', 'Pretoria', 'Africa', 'AF', '+27', 'ZAR', 'R', 'ZAF', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(210, 'GS', 'South Georgia and the South Sandwich Islands', 'Grytviken', 'Antarctica', 'AN', '+500', 'GBP', '£', 'SGS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(211, 'SS', 'South Sudan', 'Juba', 'Africa', 'AF', '+211', 'SSP', '£', 'SSD', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(212, 'ES', 'Spain', 'Madrid', 'Europe', 'EU', '+34', 'EUR', '€', 'ESP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(213, 'LK', 'Sri Lanka', 'Colombo', 'Asia', 'AS', '+94', 'LKR', 'Rs', 'LKA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(214, 'SD', 'Sudan', 'Khartoum', 'Africa', 'AF', '+249', 'SDG', '.س.ج', 'SDN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(215, 'SR', 'Suriname', 'Paramaribo', 'South America', 'SA', '+597', 'SRD', '$', 'SUR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(216, 'SJ', 'Svalbard and Jan Mayen', 'Longyearbyen', 'Europe', 'EU', '+47', 'NOK', 'kr', 'SJM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(217, 'SZ', 'Swaziland', 'Mbabane', 'Africa', 'AF', '+268', 'SZL', 'E', 'SWZ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(218, 'SE', 'Sweden', 'Stockholm', 'Europe', 'EU', '+46', 'SEK', 'kr', 'SWE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(219, 'CH', 'Switzerland', 'Berne', 'Europe', 'EU', '+41', 'CHF', 'CHf', 'CHE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(220, 'SY', 'Syrian Arab Republic', 'Damascus', 'Asia', 'AS', '+963', 'SYP', 'LS', 'SYR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(221, 'TW', 'Taiwan, Province of China', 'Taipei', 'Asia', 'AS', '+886', 'TWD', '$', 'TWN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(222, 'TJ', 'Tajikistan', 'Dushanbe', 'Asia', 'AS', '+992', 'TJS', 'SM', 'TJK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(223, 'TZ', 'Tanzania, United Republic of', 'Dodoma', 'Africa', 'AF', '+255', 'TZS', 'TSh', 'TZA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(224, 'TH', 'Thailand', 'Bangkok', 'Asia', 'AS', '+66', 'THB', '฿', 'THA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(225, 'TL', 'Timor-Leste', 'Dili', 'Asia', 'AS', '+670', 'USD', '$', 'TLS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(226, 'TG', 'Togo', 'Lome', 'Africa', 'AF', '+228', 'XOF', 'CFA', 'TGO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(227, 'TK', 'Tokelau', NULL, 'Oceania', 'OC', '+690', 'NZD', '$', 'TKL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(228, 'TO', 'Tonga', 'Nuku\'alofa', 'Oceania', 'OC', '+676', 'TOP', '$', 'TON', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(229, 'TT', 'Trinidad and Tobago', 'Port of Spain', 'North America', 'NA', '+1868', 'TTD', '$', 'TTO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(230, 'TN', 'Tunisia', 'Tunis', 'Africa', 'AF', '+216', 'TND', 'ت.د', 'TUN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(231, 'TR', 'Turkey', 'Ankara', 'Asia', 'AS', '+90', 'TRY', '₺', 'TUR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(232, 'TM', 'Turkmenistan', 'Ashgabat', 'Asia', 'AS', '+7370', 'TMT', 'T', 'TKM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(233, 'TC', 'Turks and Caicos Islands', 'Cockburn Town', 'North America', 'NA', '+1649', 'USD', '$', 'TCA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(234, 'TV', 'Tuvalu', 'Funafuti', 'Oceania', 'OC', '+688', 'AUD', '$', 'TUV', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(235, 'UG', 'Uganda', 'Kampala', 'Africa', 'AF', '+256', 'UGX', 'USh', 'UGA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(236, 'UA', 'Ukraine', 'Kiev', 'Europe', 'EU', '+380', 'UAH', '₴', 'UKR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(237, 'AE', 'United Arab Emirates', 'Abu Dhabi', 'Asia', 'AS', '+971', 'AED', 'إ.د', 'ARE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(238, 'GB', 'United Kingdom', 'London', 'Europe', 'EU', '+44', 'GBP', '£', 'GBR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(239, 'US', 'United States', 'Washington', 'North America', 'NA', '+1', 'USD', '$', 'USA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(240, 'UM', 'United States Minor Outlying Islands', NULL, 'North America', 'NA', '+1', 'USD', '$', 'UMI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(241, 'UY', 'Uruguay', 'Montevideo', 'South America', 'SA', '+598', 'UYU', '$', 'URY', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(242, 'UZ', 'Uzbekistan', 'Tashkent', 'Asia', 'AS', '+998', 'UZS', 'лв', 'UZB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(243, 'VU', 'Vanuatu', 'Port Vila', 'Oceania', 'OC', '+678', 'VUV', 'VT', 'VUT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(244, 'VE', 'Venezuela', 'Caracas', 'South America', 'SA', '+58', 'VEF', 'Bs', 'VEN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(245, 'VN', 'Viet Nam', 'Hanoi', 'Asia', 'AS', '+84', 'VND', '₫', 'VNM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(246, 'VG', 'Virgin Islands, British', 'Road Town', 'North America', 'NA', '+1284', 'USD', '$', 'VGB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(247, 'VI', 'Virgin Islands, U.s.', 'Charlotte Amalie', 'North America', 'NA', '+1340', 'USD', '$', 'VIR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(248, 'WF', 'Wallis and Futuna', 'Mata Utu', 'Oceania', 'OC', '+681', 'XPF', '₣', 'WLF', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(249, 'EH', 'Western Sahara', 'El-Aaiun', 'Africa', 'AF', '+212', 'MAD', 'MAD', 'ESH', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(250, 'YE', 'Yemen', 'Sanaa', 'Asia', 'AS', '+967', 'YER', '﷼', 'YEM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(251, 'ZM', 'Zambia', 'Lusaka', 'Africa', 'AF', '+260', 'ZMW', 'ZK', 'ZMB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(252, 'ZW', 'Zimbabwe', 'Harare', 'Africa', 'AF', '+263', 'ZWL', '$', 'ZWE', '2021-11-03 22:07:16', '2021-11-04 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` bigint NOT NULL DEFAULT '1',
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `action_type` tinyint NOT NULL,
  `limit` bigint NOT NULL DEFAULT '1',
  `expiry_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `editor_files`
--

CREATE TABLE `editor_files` (
  `id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engines`
--

CREATE TABLE `engines` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handler` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` longtext COLLATE utf8mb4_unicode_ci,
  `filters` longtext COLLATE utf8mb4_unicode_ci,
  `support_negative_prompt` tinyint(1) NOT NULL DEFAULT '0',
  `sizes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `art_styles` longtext COLLATE utf8mb4_unicode_ci,
  `lightning_styles` longtext COLLATE utf8mb4_unicode_ci,
  `moods` longtext COLLATE utf8mb4_unicode_ci,
  `max` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `engines`
--

INSERT INTO `engines` (`id`, `name`, `alias`, `logo`, `handler`, `credentials`, `instructions`, `filters`, `support_negative_prompt`, `sizes`, `art_styles`, `lightning_styles`, `moods`, `max`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DALLE 2', 'dall-e-2', 'images/engines/openai-dalle-2.png', 'App\\Engines\\OpenAIDalle2Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.openai.com/api-keys\" target=\"_blank\">https://platform.openai.com/api-keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>256x256</li>\n    <li>512x512</li>\n    <li>1024x1024</li>\n</ul>', 'porn,sex,sexy', 0, '256x256,512x512,1024x1024', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 10, 0, '2024-03-23 17:21:38', '2024-11-04 11:04:36'),
(2, 'DALLE 3', 'dall-e-3', 'images/engines/openai-dalle-3.png', 'App\\Engines\\OpenAIDalle3Engine', '{\"api_key\":null}', '<p>\r\n    You can get your API key from: <a href=\"https://platform.openai.com/api-keys\" target=\"_blank\">https://platform.openai.com/api-keys</a>\r\n</p>\r\n<p>\r\n    <strong>Allowed Sizes</strong>\r\n</p>\r\n<ul>\r\n    <li>1024x1024</li>\r\n    <li>1792x1024</li>\r\n    <li>1024x1792</li>\r\n</ul>', 'porn,sex,sexy', 0, '1024x1024,1792x1024,1024x1792', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:24:17', '2024-11-04 11:04:41'),
(3, 'FLUX Dev', 'flux-dev', 'images/engines/replicate.png', 'App\\Engines\\ReplicateFluxEngine', '{\"api_token\":null}', '<p>\r\n    You can get your API token from: <a href=\"https://replicate.com/account/api-tokens\" target=\"_blank\">https://replicate.com/account/api-tokens</a>\r\n</p>\r\n<p>\r\n    <strong>Allowed Sizes</strong>\r\n</p>\r\n<ul>\r\n    <li>1:1</li>\r\n    <li>2:3</li>\r\n    <li>3:2</li>\r\n    <li>4:5</li>\r\n    <li>5:4</li>\r\n    <li>4:3</li>\r\n    <li>3:4</li>\r\n    <li>16:9</li>\r\n    <li>21:9</li>\r\n    <li>9:16</li>\r\n    <li>9:21</li>\r\n</ul>\r\n\r\n', 'porn,sex,sexy', 0, '1:1,2:3,3:2,4:5,5:4,4:3,3:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 4, 0, '2024-03-23 17:35:53', '2024-11-04 11:43:12'),
(4, 'FLUX Pro', 'flux-pro', 'images/engines/replicate.png', 'App\\Engines\\ReplicateFluxEngine', '{\"api_token\":null}', '<p>\r\n    You can get your API token from: <a href=\"https://replicate.com/account/api-tokens\" target=\"_blank\">https://replicate.com/account/api-tokens</a>\r\n</p>\r\n<p>\r\n    <strong>Allowed Sizes</strong>\r\n</p>\r\n<ul>\r\n    <li>1:1</li>\r\n    <li>2:3</li>\r\n    <li>3:2</li>\r\n    <li>4:5</li>\r\n    <li>5:4</li>\r\n    <li>4:3</li>\r\n    <li>3:4</li>\r\n    <li>16:9</li>\r\n    <li>21:9</li>\r\n    <li>9:16</li>\r\n    <li>9:21</li>\r\n</ul>\r\n\r\n', 'porn,sex,sexy', 0, '1:1,2:3,3:2,4:5,5:4,4:3,3:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:35:53', '2024-11-04 11:04:54'),
(5, 'FLUX 1.1 Pro', 'flux-1.1-pro', 'images/engines/replicate.png', 'App\\Engines\\ReplicateFluxEngine', '{\"api_token\":null}', '<p>\r\n    You can get your API token from: <a href=\"https://replicate.com/account/api-tokens\" target=\"_blank\">https://replicate.com/account/api-tokens</a>\r\n</p>\r\n<p>\r\n    <strong>Allowed Sizes</strong>\r\n</p>\r\n<ul>\r\n    <li>1:1</li>\r\n    <li>2:3</li>\r\n    <li>3:2</li>\r\n    <li>4:5</li>\r\n    <li>5:4</li>\r\n    <li>4:3</li>\r\n    <li>3:4</li>\r\n    <li>16:9</li>\r\n    <li>21:9</li>\r\n    <li>9:16</li>\r\n    <li>9:21</li>\r\n</ul>\r\n\r\n', 'porn,sex,sexy', 0, '1:1,2:3,3:2,4:5,5:4,4:3,3:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:35:53', '2024-11-04 11:04:59'),
(6, 'FLUX Schnell', 'flux-schnell', 'images/engines/replicate.png', 'App\\Engines\\ReplicateFluxEngine', '{\"api_token\":null}', '<p>\r\n    You can get your API token from: <a href=\"https://replicate.com/account/api-tokens\" target=\"_blank\">https://replicate.com/account/api-tokens</a>\r\n</p>\r\n<p>\r\n    <strong>Allowed Sizes</strong>\r\n</p>\r\n<ul>\r\n    <li>1:1</li>\r\n    <li>2:3</li>\r\n    <li>3:2</li>\r\n    <li>4:5</li>\r\n    <li>5:4</li>\r\n    <li>4:3</li>\r\n    <li>3:4</li>\r\n    <li>16:9</li>\r\n    <li>21:9</li>\r\n    <li>9:16</li>\r\n    <li>9:21</li>\r\n</ul>\r\n\r\n', 'porn,sex,sexy', 0, '1:1,2:3,3:2,4:5,5:4,4:3,3:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 4, 0, '2024-03-23 17:35:53', '2024-11-04 11:05:05'),
(7, 'Stable Diffusion Xl v1.0', 'stable-diffusion-xl-1024-v1-0', 'images/engines/stability-ai.png', 'App\\Engines\\StabilityAiEngine', '{\"api_key\":null}', '<p>\r\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\r\n</p>\r\n<p>\r\n    <strong>Allowed Sizes</strong>\r\n</p>\r\n<ul>\r\n    <li>1024x1024</li>\r\n    <li>1152x896</li>\r\n    <li>896x1152</li>\r\n    <li>1216x832</li>\r\n    <li>1344x768</li>\r\n    <li>768x1344</li>\r\n    <li>1536x640</li>\r\n    <li>640x1536</li>\r\n</ul>', 'porn,sex,sexy', 1, '1024x1024,1152x896,896x1152,1216x832,1344x768,768x1344,1536x640,640x1536', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 10, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:12'),
(8, 'Stable Diffusion v1.6', 'stable-diffusion-v1-6', 'images/engines/stability-ai.png', 'App\\Engines\\StabilityAiEngine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1024x1024</li>\n    <li>1152x896</li>\n    <li>896x1152</li>\n    <li>1216x832</li>\n    <li>1344x768</li>\n    <li>768x1344</li>\n    <li>1536x640</li>\n    <li>640x1536</li>\n</ul>', 'porn,sex,sexy', 1, '1024x1024,1152x896,896x1152,1216x832,1344x768,768x1344,1536x640,640x1536', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 10, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:17'),
(9, 'Stable Diffusion Image Ultra', 'stable-image-ultra', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageUltraEngine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:43:18'),
(10, 'Stable Diffusion Image Core', 'stable-image-core', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageCoreEngine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:29'),
(11, 'Stable Diffusion 3 Medium', 'sd3-medium', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageSD3Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:35'),
(12, 'Stable Diffusion 3 Large', 'sd3-large', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageSD3Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:40'),
(13, 'Stable Diffusion 3 Large Turbo', 'sd3-large-turbo', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageSD3Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:46'),
(14, 'Stable Diffusion 3.0 Medium', 'sd3.5-medium', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageSD3Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:51'),
(15, 'Stable Diffusion 3.5 Large', 'sd3.5-large', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageSD3Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:05:57'),
(16, 'Stable Diffusion 3.5 Large Turbo', 'sd3.5-large-turbo', 'images/engines/stability-ai.png', 'App\\Engines\\StableImageSD3Engine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://platform.stability.ai/account/keys\" target=\"_blank\">https://platform.stability.ai/account/keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>1:1</li>\n    <li>2:3</li>\n    <li>3:2</li>\n    <li>4:5</li>\n    <li>5:4</li>\n    <li>16:9</li>\n    <li>21:9</li>\n    <li>9:16</li>\n    <li>9:21</li>\n</ul>\n', 'porn,sex,sexy', 1, '1:1,2:3,3:2,4:5,5:4,16:9,21:9,9:16,9:21', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 1, 0, '2024-03-23 17:28:35', '2024-11-04 11:06:02'),
(17, 'Modelslab Stable Diffusion', 'stable-diffusion-api', 'images/engines/stable-diffusion-api.png', 'App\\Engines\\ModelsLabSDEngine', '{\"api_key\":null}', '<p>\n    You can get your API key from: <a href=\"https://modelslab.com/dashboard/api-keys\" target=\"_blank\">https://modelslab.com/dashboard/api-keys</a>\n</p>\n<p>\n    <strong>Allowed Sizes</strong>\n</p>\n<ul>\n    <li>512x512</li>\n    <li>1024x1024</li>\n    <li>1920x1080</li>\n    <li>1800x1200</li>\n    <li>1200x1800</li>\n    <li>1080x1350</li>\n    <li>1280x1024</li>\n    <li>1080x1440</li>\n    <li>1024x768</li>\n    <li>1080x1920</li>\n    <li>1080x2560</li>\n</ul>', 'porn,sex,sexy', 1, '512x512,1024x1024,1920x1080,2560x1080,1800x1200,1200x1800,1080x1350,1280x1024,1080x1440,1024x768,1080x1920,1080x2560', '3d model, Analog film, Anime, Cinematic, Comic book, Digital art, Enhance, Fantasy art, Isometric, Line art, Low poly, Modeling compound, Neon punk, Origami, Photographic, Pixel art, Tile texture', 'Ambient, Backlight, Blue Hour, Cinematic, Cold, Dramatic, Foggy, Golden Hour, Hard, Natural, Neon, Studio, Warm', 'Aggressive, Angry, Boring, Bright, Calm, Cheerful, Chilling, Colorful, Dark, Neutral', 4, 0, '2024-03-23 17:35:53', '2024-11-04 11:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Disabled 1:Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `name`, `alias`, `logo`, `credentials`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Google Analytics 4', 'google_analytics', 'images/extensions/google-analytics.png', '{\"measurement_id\":null}', '<ul class=\"mb-0\"> \n<li>Enter google analytics 4 measurement ID, like <strong>G-12345ABC</strong></li> \n</ul>', 0, '2022-02-23 19:40:12', '2024-11-02 19:23:30'),
(2, 'Tawk.to', 'tawk_to', 'images/extensions/tawk-to.png', '{\"api_key\":null}', '<ul class=\"mb-0\"> \r\n<li>https://tawk.to/chat/<strong>API-KEY</strong></li> \r\n</ul>', 0, '2022-02-23 19:40:12', '2024-11-02 19:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `lang`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'en', 'What is Lorem Ipsum?', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-07-17 00:58:31', '2022-07-17 00:58:31'),
(2, 'en', 'Why do we use it?', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '2022-07-17 00:58:58', '2022-07-17 00:58:58'),
(3, 'en', 'Where does it come from?', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '2022-07-17 00:59:17', '2022-07-17 00:59:17'),
(4, 'en', 'Where can I get some?', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '2022-07-17 00:59:33', '2023-02-15 15:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `lang`, `title`, `image`, `content`, `created_at`, `updated_at`) VALUES
(1, 'en', 'High-Quality Image Generation', 'images/others/features/nfgvCiJrrvfafDV_1676569744.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat incidunt consectetur voluptates.', '2023-02-05 19:19:05', '2023-02-16 11:49:04'),
(2, 'en', 'Advanced AI Algorithms', 'images/others/features/9zSq2pAzVCmvOlP_1675646687.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat incidunt consectetur voluptates.', '2023-02-05 19:24:11', '2023-02-05 19:24:47'),
(3, 'en', 'Multiple Sizes Supported', 'images/others/features/iByyssENEt96mK7_1676570115.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat incidunt consectetur voluptates.', '2023-02-05 19:26:31', '2023-02-17 19:23:19'),
(4, 'en', 'User-Friendly Interface', 'images/others/features/dKLhhcflS5XZiJr_1675646883.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat incidunt consectetur voluptates.', '2023-02-05 19:28:03', '2023-02-05 19:28:03'),
(5, 'en', 'Image Saving', 'images/others/features/OAiLxsvv8DwoUPo_1676570018.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat incidunt consectetur voluptates.', '2023-02-05 19:29:55', '2023-02-16 11:53:38'),
(6, 'en', 'Flexible Pricing', 'images/others/features/9S61O7CWo6nWbPK_1675647227.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat incidunt consectetur voluptates.', '2023-02-05 19:32:51', '2023-02-05 19:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `footer_menu`
--

CREATE TABLE `footer_menu` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `order` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_menu`
--

INSERT INTO `footer_menu` (`id`, `name`, `link`, `lang`, `parent_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Company', '/page-example', 'en', NULL, 1, '2023-02-05 17:20:43', '2023-02-05 17:32:39'),
(2, 'About Us', '/page-example', 'en', 1, 1, '2023-02-05 17:21:04', '2023-02-05 17:21:26'),
(3, 'Careers', '/page-example', 'en', 1, 2, '2023-02-05 17:21:21', '2023-02-05 17:32:58'),
(4, 'Legal', '/page-example', 'en', NULL, 2, '2023-02-05 17:21:53', '2023-02-05 17:33:43'),
(5, 'Privacy policy', '/privacy-policy', 'en', 4, 1, '2023-02-05 17:22:03', '2023-02-10 20:47:39'),
(6, 'Terms of use', '/terms-of-use', 'en', 4, 2, '2023-02-05 17:22:16', '2023-02-10 20:47:48'),
(7, 'Copyright Policy', '/page-example', 'en', 4, 4, '2023-02-05 17:22:27', '2023-02-05 17:34:26'),
(8, 'Contact Us', '/contact-us', 'en', 1, 3, '2023-02-05 17:22:53', '2023-11-10 16:57:29'),
(10, 'Press Room', '/page-example', 'en', 1, 4, '2023-02-05 17:33:25', '2023-02-05 17:33:33'),
(11, 'Cookies Policy', '/page-example', 'en', 4, 3, '2023-02-05 17:34:06', '2023-02-05 17:34:11'),
(12, 'Support', '/page-example', 'en', NULL, 3, '2023-02-05 17:34:49', '2023-02-05 17:35:22'),
(13, 'Help Center', '/page-example', 'en', 12, 1, '2023-02-05 17:35:02', '2023-02-05 17:35:22'),
(14, 'Customer Service', '/page-example', 'en', 12, 2, '2023-02-05 17:35:12', '2023-02-05 17:35:22'),
(15, 'Frequently Asked Questions', '/page-example', 'en', 12, 3, '2023-02-05 17:35:28', '2023-02-05 17:35:33'),
(16, 'Report a Problem', '/page-example', 'en', 12, 4, '2023-02-05 17:35:49', '2023-02-05 17:35:53'),
(17, 'Explore', '/page-example', 'en', NULL, 4, '2023-02-05 17:36:27', '2023-02-05 17:38:22'),
(18, 'Features', '/features', 'en', 17, 1, '2023-02-05 17:37:52', '2023-02-10 20:12:43'),
(19, 'Pricing', '/pricing', 'en', 17, 2, '2023-02-05 17:38:04', '2023-02-10 20:12:34'),
(20, 'Blog', '/blog', 'en', 17, 3, '2023-02-05 17:38:14', '2023-02-10 20:12:26'),
(21, 'FAQs', '/faqs', 'en', 17, 4, '2023-02-19 17:18:46', '2023-02-19 17:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `generated_images`
--

CREATE TABLE `generated_images` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `storage_provider_id` bigint UNSIGNED NOT NULL,
  `engine_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `negative_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `art_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lightning_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `views` bigint UNSIGNED NOT NULL DEFAULT '0',
  `downloads` bigint UNSIGNED NOT NULL DEFAULT '0',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `is_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` tinyint NOT NULL COMMENT '1:LTR 2:RTL',
  `sort_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `flag`, `code`, `direction`, `sort_id`, `created_at`, `updated_at`) VALUES
(1, 'English', 'images/flags/en.png', 'en', 1, 0, '2021-12-11 14:35:51', '2023-02-17 19:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcodes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `lang`, `alias`, `name`, `subject`, `body`, `shortcodes`, `status`) VALUES
(1, 'en', 'password_reset', 'Reset Password', 'Reset Password Notification', '<h2><strong>Hello!</strong></h2><p>You are receiving this email because we received a password reset request for your account, please click on the link below to reset your password.</p><p><a href=\"{{link}}\">{{link}}</a></p><p>This password reset link will expire in <strong>{{expiry_time}}</strong> minutes. If you did not request a password reset, no further action is required.</p><p>Regards,<br><strong>{{website_name}}</strong></p>', '{\n\"link\":\"Password reset link\",\n\"expiry_time\":\"Link expiry time\",\n\"website_name\":\"Your website name\"\n}', 1),
(3, 'en', 'email_verification', 'Email Verification', 'Verify Email Address', '<h2>Hello!</h2><p>Please click on the link below to verify your email address.</p><p><a href=\"{{link}}\">{{link}}</a></p><p>If you did not create an account, no further action is required.</p><p>&nbsp;</p><p>Regards,<br><strong>{{website_name}}</strong></p>', '{\"link\":\"Email verification link\",\"website_name\":\"Your website name\"}', 1),
(4, 'en', 'subscription_about_expired', 'Subscription About To Expired Notification', 'Your subscription is about to expire', '<h2>Hi, <strong>{{username}}</strong></h2><p>We hope you\'re enjoying using our service. Just a friendly reminder that your subscription on <strong>{{plan}}</strong> plan is about to expire on <strong>{{expiry_date}}</strong>.</p><p>To continue receiving the benefits of our service, please renew your subscription before the expiration date. Simply follow the link below to access your account and renew:</p><p><a href=\"{{link}}\">{{link}}</a></p><p>Our team is always here to assist you with any questions or concerns.</p><p>Thank you for being a valued customer.</p><p>Best regards,<br><strong>{{website_name}}</strong></p>', '{\"username\":\"User name\",\"plan\":\"Subscription plan name\",\"expiry_date\":\"Subscription expiry date\",\"link\":\"User Subscription page\",\"website_name\":\"Your website name\"}', 1),
(5, 'en', 'subscription_expired', 'Subscription Expired Notification', 'Your subscription has been expired', '<h2>Hi, <strong>{{username}}</strong></h2><p>I hope this email finds you well. We wanted to let you know that your subscription on <strong>{{plan}}</strong> plan has expired on <strong>{{expiry_date}}</strong>.</p><p>We understand that life can get busy, but we would love the opportunity to continue serving you. If you renew your subscription now, you\'ll be able to take advantage of all the benefits and services we have to offer.</p><p>Renewing your subscription is easy, simply log into your account and select the plan that works best for you, or by clicking on the link below. If you have any questions or concerns, please don\'t hesitate to reach out to our customer support team.</p><p><a href=\"{{link}}\">{{link}}</a></p><p>Please note that if you do not renew your subscription soon, it will be deleted permanently. We would hate to see you go, but if you do decide to let your subscription expire, please know that it has been a pleasure serving you.</p><p>Thank you for choosing us, and we hope to have the opportunity to serve you again soon.</p><p>Best regards,<br><strong>{{website_name}}</strong></p>', '{\"username\":\"User name\",\"plan\":\"Subscription plan name\",\"expiry_date\":\"Subscription expiry date\",\"link\":\"User Subscription page\",\"website_name\":\"Your website name\"}', 1),
(6, 'en', 'subscription_deleted', 'Subscription Deleted Notification', 'Your subscription has been deleted', '<h2>Hi, <strong>{{username}}</strong></h2><p>We regret to inform you that your subscription on <strong>{{plan}}</strong> plan has been deleted due to its expiration.</p><p>We understand that you might still be interested in using our services, and we would be more than happy to welcome you back as a subscriber. If you have any questions or concerns, please don\'t hesitate to reach out to us.</p><p>Thank you for choosing us as your service provider, and we hope to have the opportunity to serve you again in the future.</p><p>Best regards,<br><strong>{{website_name}}</strong></p>', '{\"username\":\"User name\",\"plan\":\"Subscription plan name\",\"website_name\":\"Your website name\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2021_10_03_223916_create_admins_table', 1),
(6, '2021_10_03_224118_create_admin_password_resets', 1),
(12, '2021_10_07_221832_create_settings_table', 4),
(27, '2021_10_14_230536_create_languages_table', 8),
(54, '2021_10_04_213420_create_pages_table', 14),
(55, '2021_10_06_201713_create_blog_categories_table', 14),
(56, '2021_10_06_201752_create_blog_articles_table', 14),
(62, '2021_11_03_225531_create_countries_table', 19),
(73, '2021_12_01_100425_create_admin_notifications_table', 24),
(87, '2022_01_06_180145_create_blog_comments_table', 32),
(93, '2022_02_23_213634_create_extensions_table', 37),
(97, '2022_01_06_225055_create_features_table', 41),
(98, '2021_10_24_215104_create_seo_configurations_table', 42),
(101, '2022_04_03_220038_create_mail_templates_table', 43),
(104, '2014_10_12_000000_create_users_table', 44),
(105, '2014_10_12_100000_create_password_resets_table', 44),
(106, '2019_12_14_000001_create_personal_access_tokens_table', 44),
(107, '2021_11_01_162229_create_user_logs_table', 44),
(109, '2021_12_14_233352_create_navbar_menu_table', 46),
(114, '2023_02_04_164717_create_editor_files_table', 49),
(116, '2021_12_15_215308_create_footer_menu_table', 50),
(123, '2022_03_07_231527_create_taxes_table', 55),
(124, '2022_01_08_213840_create_payment_gateways_table', 56),
(129, '2022_06_05_002924_create_coupons_table', 60),
(130, '2023_02_07_162343_create_transactions_table', 61),
(134, '2023_02_07_151751_create_subscriptions_table', 62),
(137, '2021_10_28_191044_create_storage_providers_table', 64),
(139, '2023_02_15_155209_create_faqs_table', 65),
(141, '2023_02_06_210846_create_plans_table', 66),
(146, '2023_02_19_164123_create_advertisements_table', 68),
(151, '2023_02_17_213506_create_generated_images_table', 70),
(152, '2024_11_01_172458_create_captcha_providers_table', 71),
(153, '2024_11_01_181001_create_oauth_providers_table', 72),
(154, '2024_11_03_111927_create_engines_table', 73);

-- --------------------------------------------------------

--
-- Table structure for table `navbar_menu`
--

CREATE TABLE `navbar_menu` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `order` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navbar_menu`
--

INSERT INTO `navbar_menu` (`id`, `name`, `link`, `lang`, `parent_id`, `order`, `created_at`, `updated_at`) VALUES
(6, 'Home', '/', 'en', NULL, 1, '2023-02-01 15:40:56', '2023-02-01 15:59:00'),
(7, 'Features', '/features', 'en', NULL, 2, '2023-02-01 15:58:00', '2023-02-10 20:11:38'),
(8, 'Pricing', '/pricing', 'en', NULL, 3, '2023-02-01 16:07:47', '2023-02-10 20:11:58'),
(9, 'Blog', '/blog', 'en', NULL, 4, '2023-02-05 16:55:35', '2023-02-05 16:57:11'),
(11, 'More', '/', 'en', NULL, 6, '2023-02-05 16:57:50', '2023-02-10 20:50:33'),
(12, 'Terms of use', '/terms-of-use', 'en', 11, 2, '2023-02-05 16:58:00', '2023-02-10 20:51:29'),
(13, 'Privacy policy', '/privacy-policy', 'en', 11, 1, '2023-02-05 16:58:21', '2023-02-10 20:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_providers`
--

INSERT INTO `oauth_providers` (`id`, `name`, `alias`, `logo`, `credentials`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', 'facebook', 'images/oauth/facebook.png', '{\"client_id\":null,\"client_secret\":null}', '<ul class=\"mb-0\"><li><strong>Redirect URL :</strong> [URL]/oauth/facebook/callback</li> \n</ul>', 0, '2024-10-13 16:39:57', '2024-11-02 11:34:10'),
(2, 'Google', 'google', 'images/oauth/google.png', '{\"client_id\":null,\"client_secret\":null}', '<ul class=\"mb-0\">  <li><strong>Redirect URL :</strong> [URL]/oauth/google/callback</li>  </ul>', 0, '2024-10-13 16:40:02', '2024-11-02 11:34:16'),
(3, 'Microsoft', 'microsoft', 'images/oauth/microsoft.png', '{\"client_id\":null,\"client_secret\":null}', '<ul class=\"mb-0\">  <li><strong>Redirect URL :</strong> [URL]/oauth/microsoft/callback</li>  </ul>', 0, '2024-10-13 16:40:07', '2024-11-02 11:34:22'),
(4, 'Vkontakte', 'vkontakte', 'images/oauth/vkontakte.png', '{\"client_id\":null,\"client_secret\":null}', '<ul class=\"mb-0\">  <li><strong>Redirect URL :</strong> [URL]/oauth/vkontakte/callback</li>  </ul>', 0, '2024-10-13 16:40:11', '2024-11-02 11:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `lang`, `title`, `slug`, `content`, `short_description`, `views`, `created_at`, `updated_at`) VALUES
(4, 'en', 'Privacy Policy', 'privacy-policy', '<p><strong>What is Lorem Ipsum?</strong></p><p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><strong>Where does it come from?</strong></p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><strong>Why do we use it?</strong></p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><strong>Where can I get some?</strong></p><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 40, '2023-01-28 11:56:37', '2024-11-03 17:43:22'),
(5, 'en', 'Terms of use', 'terms-of-use', '<p><strong>What is Lorem Ipsum?</strong></p><p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><strong>Where does it come from?</strong></p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><strong>Why do we use it?</strong></p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><strong>Where can I get some?</strong></p><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'Terms of use', 5, '2023-01-28 11:57:10', '2024-11-02 12:50:23'),
(6, 'en', 'Page Example', 'page-example', '<p><strong>What is Lorem Ipsum?</strong></p><p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><strong>Where does it come from?</strong></p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><strong>Why do we use it?</strong></p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><strong>Where can I get some?</strong></p><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'Page Example', 6, '2023-02-10 20:48:45', '2024-11-02 12:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fees` int NOT NULL,
  `min` double(10,2) NOT NULL,
  `test_mode` tinyint(1) DEFAULT NULL COMMENT 'null 0:Disbaled 1:Enabled',
  `credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Disabled 1:Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `alias`, `handler`, `logo`, `supported_currencies`, `fees`, `min`, `test_mode`, `credentials`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Paypal', 'paypal_express', 'App\\Http\\Controllers\\Frontend\\Gateways\\PaypalExpressController', 'images/payments/l6yGIXyP6SbqTrA_1641691269.png', '[\"AUD\",\"BRL\",\"CAD\",\"CZK\",\"DKK\",\"EUR\",\"HKD\",\"HUF\",\"INR\",\"ILS\",\"JPY\",\"MYR\",\"MXN\",\"TWD\",\"NZD\",\"NOK\",\"PHP\",\"PLN\",\"GBP\",\"RUB\",\"SGD\",\"SEK\",\"CHF\",\"THB\",\"USD\"]', 0, 0.00, 0, '{\"client_id\":\"\",\"client_secret\":\"\"}', '<ul class=\"mb-0\"> \r\n<li>You can get the Api Keys from : <a target=\"__blank\" href=\"https://developer.paypal.com/developer/applications/create\">https://developer.paypal.com/developer/applications/create</a>&nbsp;</li> \r\n</ul>', 0, '2022-01-08 20:05:29', '2023-08-14 16:51:13'),
(2, 'Stripe', 'stripe_checkout', 'App\\Http\\Controllers\\Frontend\\Gateways\\StripeCheckoutController', 'images/payments/ufBAiDA1bT2sZ4O_1655769600.png', '[\"USD\",\"AUD\",\"BRL\",\"CAD\",\"CHF\",\"DKK\",\"EUR\",\"GBP\",\"HKD\",\"INR\",\"JPY\",\"MXN\",\"MYR\",\"NOK\",\"NZD\",\"PLN\",\"SEK\",\"SGD\"]', 0, 0.50, NULL, '{\"publishable_key\":\"\",\"secret_key\":\"\"}', '<ul class=\"mb-0\"> <li>You can get the API keys from : <a target=\"__blank\" href=\"https://dashboard.stripe.com/apikeys\">https://dashboard.stripe.com/apikeys</a>&nbsp;</li>\r\n</ul>', 0, '2022-01-08 20:05:29', '2024-06-27 13:15:54'),
(3, 'Mollie', 'mollie', 'App\\Http\\Controllers\\Frontend\\Gateways\\MollieController', 'images/payments/mollie.png', '[\"AED\",\"AUD\",\"BGN\",\"BRL\",\"CAD\",\"CHF\",\"CZK\",\"DKK\",\"EUR\",\"GBP\",\"HKD\",\"HRK\",\"HUF\",\"ILS\",\"ISK\",\"JPY\",\"MXN\",\"MYR\",\"NOK\",\"NZD\",\"PHP\",\"PLN\",\"RON\",\"RUB\",\"SEK\",\"SGD\",\"THB\",\"TWD\",\"USD\",\"ZAR\"]', 0, 0.00, NULL, '{\"api_key\":null}', '<ul class=\"mb-0\"> <li>You can get the API key from : <a target=\"__blank\" href=\"https://www.mollie.com/dashboard\">https://www.mollie.com/dashboard</a>&nbsp;</li>\r\n</ul>', 0, '2022-01-08 18:05:29', '2023-06-10 14:50:06'),
(4, 'Razorpay', 'razorpay', 'App\\Http\\Controllers\\Frontend\\Gateways\\RazorpayController', 'images/payments/E9tyZzO5PqhB34H_1670195643.png', '[\"AUD\",\"BRL\",\"CAD\",\"CZK\",\"DKK\",\"EUR\",\"GBP\",\"HKD\",\"HUF\",\"ILS\",\"INR\",\"JPY\",\"MXN\",\"MYR\",\"NOK\",\"NZD\",\"PHP\",\"PLN\",\"RUB\",\"SEK\",\"SGD\",\"THB\",\"TRY\",\"USD\",\"ZAR\"]', 0, 0.00, NULL, '{\"key_id\":\"\",\"key_secret\":\"\"}', '<ul class=\"mb-0\"> <li>You can get the API keys from : <a target=\"__blank\" href=\"https://dashboard.razorpay.com/app/keys\">https://dashboard.razorpay.com/app/keys</a>&nbsp;</li>\r\n</ul>', 0, '2022-01-08 18:05:29', '2023-11-10 12:41:15');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` tinyint NOT NULL COMMENT '1:Monthly 2:Yearly',
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `images` bigint UNSIGNED NOT NULL,
  `max_images` int UNSIGNED NOT NULL COMMENT 'Form 1 to 10',
  `engines` longtext COLLATE utf8mb4_unicode_ci,
  `expiration` int DEFAULT NULL,
  `advertisements` tinyint(1) NOT NULL DEFAULT '0',
  `watermark` tinyint(1) NOT NULL DEFAULT '0',
  `custom_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_free` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:No 1:Yes',
  `login_require` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:No 1:Yes',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:No 1:Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `short_description`, `interval`, `price`, `images`, `max_images`, `engines`, `expiration`, `advertisements`, `watermark`, `custom_features`, `is_free`, `login_require`, `is_featured`, `created_at`, `updated_at`) VALUES
(3, 'Standard', 'Perfect to get started', 1, 0.00, 500, 4, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"16\",\"17\",\"18\",\"19\"]', NULL, 1, 0, NULL, 1, 0, 0, '2023-02-15 17:19:46', '2024-11-04 10:56:37'),
(4, 'Professional', 'Best for professionals and bloggers', 1, 19.00, 1000, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"16\",\"17\",\"18\",\"19\"]', NULL, 1, 0, NULL, 0, 1, 1, '2023-02-15 17:22:04', '2024-11-03 18:25:38'),
(5, 'Enterprise', 'For large enterprises', 1, 29.00, 5000, 3, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"16\",\"17\",\"18\",\"19\"]', NULL, 1, 0, NULL, 0, 1, 0, '2023-02-15 17:24:56', '2024-11-03 18:25:46'),
(6, 'Standard', 'Perfect to get started', 2, 5.99, 500, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"16\",\"17\",\"18\",\"19\"]', NULL, 1, 0, NULL, 0, 1, 0, '2023-02-15 17:19:46', '2024-11-03 18:25:56'),
(7, 'Professional', 'Best for professionals and bloggers', 2, 199.00, 1000, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"16\",\"17\",\"18\",\"19\"]', NULL, 1, 0, NULL, 0, 1, 1, '2023-02-15 17:22:04', '2024-11-03 13:35:03'),
(8, 'Enterprise', 'For large enterprises', 2, 299.00, 5000, 3, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"16\",\"17\",\"18\",\"19\"]', NULL, 1, 0, NULL, 0, 1, 0, '2023-02-15 17:24:56', '2024-11-03 13:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `seo_configurations`
--

CREATE TABLE `seo_configurations` (
  `id` bigint UNSIGNED NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `robots_index` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `robots_follow_links` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'general', '{\"site_name\":\"Imgurai\",\"site_url\":\"http:\\/\\/imgurai.viro.com\",\"contact_email\":\"\",\"terms_of_service_link\":\"\\/\",\"date_format\":\"10\",\"timezone\":\"America\\/New_York\"}'),
(2, 'media', '{\"dark_logo\":\"images\\/dark-logo.jpg\",\"light_logo\":\"images\\/light-logo.jpg\",\"favicon\":\"images\\/favicon.jpg\",\"social_image\":\"images\\/social-image.jpg\"}'),
(3, 'colors', '{\"primary_color\":\"#8F37FF\",\"secondary_color\":\"#641BC0\",\"third_color\":\"#0F0B1D\",\"background_color\":\"#FAFBFF\",\"dark_mode_primary_color\":\"#0F0B1D\",\"dark_mode_secondary_color\":\"#1E1439\",\"dark_mode_third_color\":\"#2A1B45\",\"dark_mode_background_color\":\"#0F0B1D\"}'),
(4, 'smtp', '{\"mailer\":\"smtp\",\"host\":null,\"port\":null,\"username\":null,\"password\":null,\"encryption\":\"tls\",\"from_email\":null,\"from_name\":null,\"status\":0}'),
(5, 'actions', '{\"registration_status\":1,\"gdpr_cookie_status\":1,\"blog_status\":1,\"features_page\":1,\"faqs_status\":1,\"language_menu_status\":1,\"email_verification_status\":0,\"force_ssl_status\":0,\"contact_page\":0,\"language_type\":0}'),
(6, 'popup', '{\"body\":\"<p style=\\\"text-align:center;\\\"><span style=\\\"color:#3498db;\\\"><strong><img><\\/strong><\\/span><\\/p><h2 style=\\\"text-align:center;\\\"><span style=\\\"color:#3498db;\\\"><strong>What is Lorem Ipsum?<\\/strong><\\/span><\\/h2><p style=\\\"text-align:center;\\\">Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\",\"status\":0}'),
(7, 'currency', '{\"code\":\"USD\",\"symbol\":\"$\",\"position\":\"1\"}'),
(8, 'subscription', '{\"about_to_expire_reminder\":\"3\",\"expired_reminder\":\"3\",\"delete_expired\":\"7\"}'),
(9, 'theme', '{\"mode_default\":\"auto\",\"mode_switcher\":1}'),
(10, 'watermark', '{\"position\":\"bottom-right\",\"width\":\"120\",\"height\":\"30\",\"add_to\":\"3\",\"status\":0,\"logo\":\"images\\/watermark\\/R4Kz6AU3D4I8w5q_1707874022.png\"}'),
(11, 'image', '{\"original\":{\"webp_convert\":\"0\"},\"thumbnail\":{\"status\":1,\"width\":\"320\",\"height\":\"320\",\"webp_convert\":\"1\"}}'),
(12, 'limits', '{\"home_page_images\":\"32\",\"explore_page_images\":\"32\"}'),
(13, 'cronjob', '{\"key\":\"\",\"last_execution\":\"\"}'),
(14, 'maintenance', '{\"status\":0,\"title\":\"Under Maintenance\",\"body\":\"<p style=\\\"text-align:center;\\\">Our site is currently undergoing scheduled maintenance to enhance your browsing experience. We apologize for any inconvenience and appreciate your patience. Please check back soon!<\\/p>\"}');

-- --------------------------------------------------------

--
-- Table structure for table `storage_providers`
--

CREATE TABLE `storage_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Disabled 1:Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storage_providers`
--

INSERT INTO `storage_providers` (`id`, `name`, `alias`, `handler`, `logo`, `credentials`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Local Storage', 'local', 'App\\Http\\Controllers\\Storage\\LocalController', 'images/storage/local.png', NULL, 1, '2022-02-20 21:13:06', '2023-01-29 10:04:04'),
(2, 'Amazon S3', 's3', 'App\\Http\\Controllers\\Storage\\AmazonController', 'images/storage/amazon.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-02-20 21:12:55', '2024-11-02 12:08:06'),
(4, 'Digitalocean Spaces', 'digitalocean', 'App\\Http\\Controllers\\Storage\\DigitaloceanController', 'images/storage/digitalocean.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-02-20 21:13:06', '2024-03-21 11:51:30'),
(5, 'Wasabi Cloud Storage', 'wasabi', 'App\\Http\\Controllers\\Storage\\WasabiController', 'images/storage/wasabi.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-02-20 21:13:01', '2023-11-11 11:41:40'),
(6, 'Cloudflare R2', 'cloudflare', 'App\\Http\\Controllers\\Storage\\CloudflareR2Controller', 'images/storage/cloudflare.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-05-17 22:23:27', '2024-11-02 12:09:32'),
(7, 'Idrive E2', 'idrive', 'App\\Http\\Controllers\\Storage\\IdriveE2Controller', 'images/storage/idrive.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-05-17 22:23:27', '2023-02-17 23:23:18'),
(8, 'Storj', 'storj', 'App\\Http\\Controllers\\Storage\\StorjController', 'images/storage/storj.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-05-17 22:23:27', '2024-02-14 12:20:16'),
(9, 'Backblaze B2 Cloud Storage ', 'backblaze', 'App\\Http\\Controllers\\Storage\\BackblazeController', 'images/storage/backblaze.png', '{\"access_key_id\":null,\"secret_access_key\":null,\"default_region\":null,\"bucket\":null,\"url\":null,\"endpoint\":null}', 0, '2022-02-20 20:13:01', '2024-02-13 12:50:40');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `generated_images` bigint UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:Active 0:cancelled',
  `expiry_at` datetime NOT NULL,
  `about_to_expire_reminder` tinyint(1) NOT NULL DEFAULT '0',
  `expired_reminder` tinyint(1) NOT NULL DEFAULT '0',
  `is_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `percentage` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `checkout_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `details_before_discount` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details_after_discount` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double(10,2) NOT NULL,
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `fees` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL,
  `payment_gateway_id` bigint UNSIGNED DEFAULT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL COMMENT '1:Subscribing 2:Renewing 3:Upgrading 4:Downgrading',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0:Unpaid 1:Pending 2:Paid 3:Cancelled',
  `is_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `microsoft_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vkontakte_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `google2fa_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Disabled, 1: Active',
  `google2fa_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: Banned, 1: Active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_articles`
--
ALTER TABLE `blog_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_articles_slug_unique` (`slug`),
  ADD KEY `blog_articles_category_id_foreign` (`category_id`),
  ADD KEY `blog_articles_admin_id_foreign` (`admin_id`),
  ADD KEY `blog_articles_lang_foreign` (`lang`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`),
  ADD KEY `blog_categories_lang_foreign` (`lang`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`),
  ADD KEY `blog_comments_article_id_foreign` (`article_id`);

--
-- Indexes for table `captcha_providers`
--
ALTER TABLE `captcha_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `editor_files`
--
ALTER TABLE `editor_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `engines`
--
ALTER TABLE `engines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_lang_foreign` (`lang`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_lang_foreign` (`lang`);

--
-- Indexes for table `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `footer_menu_name_unique` (`name`),
  ADD KEY `footer_menu_lang_foreign` (`lang`),
  ADD KEY `footer_menu_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `generated_images`
--
ALTER TABLE `generated_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generated_images_user_id_foreign` (`user_id`),
  ADD KEY `generated_images_storage_provider_id_foreign` (`storage_provider_id`),
  ADD KEY `generated_images_engine_id_foreign` (`engine_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_templates_lang_foreign` (`lang`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbar_menu`
--
ALTER TABLE `navbar_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navbar_menu_name_unique` (`name`),
  ADD KEY `navbar_menu_lang_foreign` (`lang`),
  ADD KEY `navbar_menu_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_page_slug_unique` (`slug`),
  ADD KEY `pages_lang_foreign` (`lang`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_configurations`
--
ALTER TABLE `seo_configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seo_configurations_lang_unique` (`lang`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage_providers`
--
ALTER TABLE `storage_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`),
  ADD KEY `subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_country_id_unique` (`country_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_checkout_id_unique` (`checkout_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_plan_id_foreign` (`plan_id`),
  ADD KEY `transactions_coupon_id_foreign` (`coupon_id`),
  ADD KEY `transactions_payment_gateway_id_foreign` (`payment_gateway_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD UNIQUE KEY `microsoft_id` (`microsoft_id`),
  ADD UNIQUE KEY `vkontakte_id` (`vkontakte_id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logs_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blog_articles`
--
ALTER TABLE `blog_articles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captcha_providers`
--
ALTER TABLE `captcha_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `editor_files`
--
ALTER TABLE `editor_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engines`
--
ALTER TABLE `engines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `footer_menu`
--
ALTER TABLE `footer_menu`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `generated_images`
--
ALTER TABLE `generated_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `navbar_menu`
--
ALTER TABLE `navbar_menu`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seo_configurations`
--
ALTER TABLE `seo_configurations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `storage_providers`
--
ALTER TABLE `storage_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_articles`
--
ALTER TABLE `blog_articles`
  ADD CONSTRAINT `blog_articles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_articles_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `blog_articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD CONSTRAINT `footer_menu_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `footer_menu_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `footer_menu` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `generated_images`
--
ALTER TABLE `generated_images`
  ADD CONSTRAINT `generated_images_engine_id_foreign` FOREIGN KEY (`engine_id`) REFERENCES `engines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generated_images_storage_provider_id_foreign` FOREIGN KEY (`storage_provider_id`) REFERENCES `storage_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `generated_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD CONSTRAINT `mail_templates_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `navbar_menu`
--
ALTER TABLE `navbar_menu`
  ADD CONSTRAINT `navbar_menu_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `navbar_menu_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `navbar_menu` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `seo_configurations`
--
ALTER TABLE `seo_configurations`
  ADD CONSTRAINT `seo_configurations_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`),
  ADD CONSTRAINT `transactions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
