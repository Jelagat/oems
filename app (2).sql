-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2017 at 11:02 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `status`) VALUES
(1, 'Nairobi', 1),
(2, 'Mombasa', 1),
(3, 'Kisumu', 1),
(4, 'Meru', 1),
(5, 'Eldoret', 1),
(6, 'Nakuru', 1),
(7, 'Naivasha', 1),
(8, 'Kabarnet', 1),
(9, 'Kakamega', 1),
(10, 'Baringo', 1),
(11, 'Iten', 1),
(12, 'Kilifi', 1),
(13, 'Chuka', 1),
(14, 'Nyeri', 1),
(15, 'Nyahururu', 1),
(16, 'Iten', 1),
(17, 'Malindi', 1),
(18, 'Machakos', 1),
(19, 'Kitui', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enquire`
--

CREATE TABLE `enquire` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_12_10_065428_create_settings_table', 1),
('2015_12_25_133843_create_enquire_table', 1),
('2015_12_25_134328_create_partners_table', 1),
('2015_12_25_134629_create_properties_table', 1),
('2015_12_25_142242_create_slider_table', 1),
('2015_12_25_142436_create_subscriber_table', 1),
('2015_12_25_142619_create_testimonials_table', 1),
('2016_04_04_164203_create_cities_table', 1),
('2016_04_04_164227_create_property_types_table', 1),
('2017_07_20_140932_create_payments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `partner_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `created_at`, `updated_at`, `property_id`, `user_id`, `amount`, `payment_type`, `transaction_reference`) VALUES
(1, '2017-07-22 14:25:16', '2017-07-22 14:25:16', 16, 9, 800, 'M-PESA', 'yqm729idhf'),
(2, '2017-07-23 06:32:31', '2017-07-23 06:32:31', 17, 10, 2000, 'M-PESA', 'QMO0VE2TI6'),
(3, '2017-07-23 06:32:32', '2017-07-23 06:32:32', 17, 10, 2000, 'M-PESA', 'EADR2NF03B'),
(4, '2017-07-23 06:58:10', '2017-07-23 06:58:10', 18, 10, 0, 'M-PESA', 'LQG53BV6TF'),
(5, '2017-07-30 12:46:28', '2017-07-30 12:46:28', 19, 2, 14000, 'M-PESA', 'A7HSBXQTUD');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `contract_status` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL,
  `featured_property` int(11) NOT NULL DEFAULT '0',
  `property_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_purpose` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sale_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rent_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `map_latitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `map_longitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bathrooms` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bedrooms` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `property_features` text COLLATE utf8_unicode_ci NOT NULL,
  `featured_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_images1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_images2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_images3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_images4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_images5` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `eventdate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `client_id`, `contract_status`, `city_id`, `featured_property`, `property_name`, `property_slug`, `property_type`, `property_purpose`, `sale_price`, `rent_price`, `address`, `map_latitude`, `map_longitude`, `bathrooms`, `bedrooms`, `area`, `description`, `property_features`, `featured_image`, `property_images1`, `property_images2`, `property_images3`, `property_images4`, `property_images5`, `status`, `eventdate`, `created_at`, `updated_at`) VALUES
(2, 1, 6, 1, 1, 0, 'ACACIA HOTEL', 'conference', '2', 'Rent', '50000', '30000', '43-30101 ', '', '', '', '', '1000m2', 'xxxxxcc', '', 'acacia-hotel-1feee423953de9328419f5ad5d608425', 'acacia-hotel-154860e7d6c1a90ff1fd9f6c8b209054', 'acacia-hotel-151707d721895d9379a3762726859df7', '', '', '', 1, NULL, '2017-07-15 07:44:29', '2017-07-19 08:58:17'),
(3, 1, 2, 1, 4, 0, 'hill garden', 'garden', '1', 'Rent', '60000', '20000', 'ww', '', '', '', '', '2000m2', 'weddings', '', 'hill-garden-162059e3022bdd1918e6aadf0332df79', 'hill-garden-638e4b67a5c863b01bec07ae05253341', 'hill-garden-1221132d8390ea66832cf2eabd8eb668', '', '', '', 1, NULL, '2017-07-15 07:49:16', '2017-07-18 08:18:40'),
(4, 2, NULL, 0, 4, 0, 'hilside hotel', 'hillside', '2', 'Rent', '60000', '1000', '', '', '', '', '', '900', 'dd', '', 'hilside-hotel-b3f106039b4e0c2435c14bb4074a5d95', '', '', '', '', '', 1, NULL, '2017-07-20 17:00:43', '2017-07-20 17:15:16'),
(5, 1, NULL, 0, 6, 0, 'Nakuru ', 'naks', '2', 'Rent', '20000', '10000', '', '', '', '', '', '40000', 'naks', '', 'nakuru-63d6352735e9e69c4d804dee37e227d4', '', '', '', '', '', 1, NULL, '2017-07-21 05:48:56', '2017-07-22 14:39:59'),
(6, 1, NULL, 0, 5, 0, 'Meru hill', 'meru', '1', 'Rent', '1000000', '2000', '', '', '', '', '', '', 'at meru garden', '', 'meru-hill-c4a74b998dc96b638d655ec05997a14f', '', '', '', '', '', 1, NULL, '2017-07-22 13:41:08', '2017-07-29 05:06:22'),
(7, 1, NULL, 0, 5, 0, 'Tilil garden', 'tilil', '1', 'Rent', '10000', '5000', '', '', '', '', '', '10000', 'cc', '', 'tilil-garden-10a08cdd741bb5dd841466abff753a3c', '', '', '', '', '', 1, NULL, '2017-07-22 13:44:52', '2017-07-22 14:40:05'),
(8, 1, NULL, 0, 4, 0, 'Chuka garden', 'chuka', '1', 'Rent', '', '', '', '', '', '', '', '', 'dd', '', 'chuka-garden-64724694d467aac4c061bf4e45ff3a18', '', '', '', '', '', 1, NULL, '2017-07-22 13:45:30', '2017-07-29 05:04:58'),
(9, 1, NULL, 0, 6, 0, 'kabarnet garden', 'kab', '1', 'Sale', '', '', '', '', '', '', '', '', '11', '', 'kabarnet-garden-62889e73828c756c961c5a6d6c01a463', '', '', '', '', '', 1, NULL, '2017-07-22 13:46:10', '2017-07-22 14:40:11'),
(10, 1, NULL, 0, 5, 0, 'Eldoret club', 'ld', '4', 'Sale', '2000', '1000', '', '', '', '', '', '', 'LDORET', '', 'eldoret-club-4d4abe423f7e5121591eb3785dfe42c4', '', '', '', '', '', 1, NULL, '2017-07-22 13:58:07', '2017-07-22 14:40:14'),
(12, 1, NULL, 0, 13, 0, 'chuka', 'cc', '4', 'Rent', '500', '250', '', '', '', '', '', '', 'vv', '', 'chuka-a5b1612c586470dd5dc023c28474e101', '', '', '', '', '', 1, NULL, '2017-07-22 14:00:56', '2017-07-22 14:40:17'),
(13, 1, NULL, 0, 16, 0, 'Iten finest', 'iten', '1', 'Rent', '3000', '233', '', '', '', '', '', '', 'cc', '', 'iten-finest-7070f9088e456682f0f84f815ebda761', '', '', '', '', '', 0, NULL, '2017-07-22 14:03:41', '2017-07-22 14:03:41'),
(14, 1, NULL, 0, 17, 0, 'marine park', 'ma', '3', 'Rent', '2000', '800', '', '', '', '', '', '', 'br', '', 'marine-park-7072a5c26d796e02dc28cb861210abba', '', '', '', '', '', 0, NULL, '2017-07-22 14:06:26', '2017-07-22 14:06:26'),
(15, 1, NULL, 0, 2, 0, 'malindi beach', 'mal', '3', 'Rent', '3000', '2000', '', '', '', '', '', '', 'ww', '', 'malindi-beach-ee0b86d2e127f776eaaa97d77e078e41', '', '', '', '', '', 0, NULL, '2017-07-22 14:07:42', '2017-07-22 14:07:42'),
(16, 1, 9, 1, 12, 0, 'kilifi best', 'kilifi', '3', 'Sale', '1000', '800', '', '', '', '', '', '', 'ss', '', 'kilifi-best-adebe1b4a332ae019c5cbb114397cf51', '', '', '', '', '', 1, NULL, '2017-07-22 14:08:45', '2017-07-22 14:25:16'),
(17, 1, 10, 1, 1, 0, 'impala club', 'impala', '4', 'Rent', '5000', '2000', '', '', '', '', '', '', 'cc', '', 'impala-club-51c906bfb5deb0b9ad87a02fdedab41a', '', '', '', '', '', 1, NULL, '2017-07-22 14:14:23', '2017-07-23 06:32:31'),
(18, 1, 10, 1, 16, 0, 'ww', 'ww', '1', 'General', '', '', '', '', '', '', '', '', 'ww', '', 'ww-c7b2bc1ca674ef16b6ab833cfe088d6d', '', '', '', '', '', 0, NULL, '2017-07-23 06:57:30', '2017-07-23 06:58:10'),
(19, 5, 2, 1, 1, 0, 'Westlands Garden', 'wgarden', '1', 'General', '20000', '14000', 'box 40, Nairobi', '', '', '5', '7', '2000m2', 'A very nice venue', 'Flower gardens', 'westlands-garden-6ae2bc6ef427d27f724baeef96218583', 'westlands-garden-9323f21f2098b7288267c785458548b2', 'westlands-garden-dd94289cbed5fed884742ac2562ee69f', 'westlands-garden-9484d3d801e7a0c0cbf0db0f64fbfabe', '', '', 0, '2017-07-21', '2017-07-30 12:40:54', '2017-07-30 12:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `types`, `slug`) VALUES
(1, 'Garden', 'garden'),
(2, 'Hall', 'hall'),
(3, 'Beach', 'b'),
(4, 'Club', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_style` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_favicon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `site_header_code` text COLLATE utf8_unicode_ci NOT NULL,
  `site_footer_code` text COLLATE utf8_unicode_ci NOT NULL,
  `site_copyright` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `footer_widget1` text COLLATE utf8_unicode_ci NOT NULL,
  `footer_widget2` text COLLATE utf8_unicode_ci NOT NULL,
  `footer_widget3` text COLLATE utf8_unicode_ci NOT NULL,
  `addthis_share_code` text COLLATE utf8_unicode_ci NOT NULL,
  `disqus_comment_code` text COLLATE utf8_unicode_ci NOT NULL,
  `social_facebook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `social_twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `social_linkedin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `social_gplus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `about_us_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `about_us_description` text COLLATE utf8_unicode_ci NOT NULL,
  `careers_with_us_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `careers_with_us_description` text COLLATE utf8_unicode_ci NOT NULL,
  `terms_conditions_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `terms_conditions_description` text COLLATE utf8_unicode_ci NOT NULL,
  `privacy_policy_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `privacy_policy_description` text COLLATE utf8_unicode_ci NOT NULL,
  `currency_sign` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_style`, `site_name`, `site_email`, `site_logo`, `site_favicon`, `site_description`, `site_keywords`, `site_header_code`, `site_footer_code`, `site_copyright`, `footer_widget1`, `footer_widget2`, `footer_widget3`, `addthis_share_code`, `disqus_comment_code`, `social_facebook`, `social_twitter`, `social_linkedin`, `social_gplus`, `about_us_title`, `about_us_description`, `careers_with_us_title`, `careers_with_us_description`, `terms_conditions_title`, `terms_conditions_description`, `privacy_policy_title`, `privacy_policy_description`, `currency_sign`) VALUES
(1, 'red', 'Online Events Management System', 'admin@admin.com', 'logo.png', 'favicon.png', '', '', '', '', 'Copyright © 2017 Irine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_name`) VALUES
(2, 'beatiful_garden', 'beatiful-garden-b80392f3cb364670ff47d9c23aa0d042'),
(3, 'graduation', 'graduation-1f734a5456a80cafcf4ad2b69d876c19'),
(4, 'wedding', 'wedding-fa80ba4ef2a3002df96eab2c468ff916');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `testimonial` text COLLATE utf8_unicode_ci NOT NULL,
  `t_user_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `usertype` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `name`, `email`, `password`, `phone`, `fax`, `city`, `about`, `facebook`, `twitter`, `gplus`, `linkedin`, `image_icon`, `status`, `confirmation_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', '$2y$10$LzBjU4oP3Dg564p0JZg02ulPckGZft.myY81d.dXfHbqgBt4sEU4K', '', '', 'Baringo', '', '', '', '', '', 'admin-9fa2b77a173bf01612e163cb82afbe3a', 1, NULL, '7wfxeCIq6MuWdnYZcxW3sHsGpNydPSgQYezYl19pmYY4npkyg4Wn3i6CGqK7', '2017-07-10 11:51:30', '2017-07-30 13:46:45'),
(2, 'Client', 'Stephen Okeno', 'steveokeno@gmail.com', '$2y$10$xgPCiT2PGXH3gUU.IdNC2uA5D4SIZkPKVeVrKze30yuyR803xCy6e', '726103730', '', 'Meru', '', '', '', '', '', NULL, 1, 'RNyOb8lpfcBabze', 'qXrSjqBNlOteUxY5O95ctzYnQ8QcOREcbyvw3HumwQKD0Kqd1abFL8lmV0gV', '2017-07-12 07:15:11', '2017-07-30 13:42:25'),
(5, 'Owner', 'lucy', 'admin1@admin.com', '$2y$10$4jTIKDlLvwqqv/fgA8cEXuEe87DylXhQHXX6f5pcbOSNihwVOXIBe', '0726103730', NULL, 'Kisumu', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'G0bnLOHZb7HLfnI', 'OPWKT8qmscDovoJS80VSyRNzYWq22Jxlqyu7eIZfmO4bafelNaZTH5Jtuyqv', '2017-07-12 07:35:03', '2017-07-30 12:46:01'),
(6, 'Client', 'Junior', 'swashdownload@gmail.com', '$2y$10$58VP6W36lhQCZLqLGBlGbeDuJr/iPpox3jVqVVrgE4sqJ9G1ecRO6', '723986958', NULL, 'Kisumu', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'cpd30Pou8Uxfr39', 'wlJnMMaeiGfo0Phhm5MepqbCzSN5JzddOisJGI0FqkQUShSglLV1WjaIx8WO', '2017-07-19 08:31:55', '2017-07-19 10:00:54'),
(7, 'Client', 'iii', 'naodiah58@gmail.com', '$2y$10$Bk.Sibp4vIj9GH/o28lriuxvIvvPy2kSrT.juRbuKx.9x7W2inNTC', '12345678', NULL, 'Kisumu', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'RnjP0jkTBgx7ZZG', NULL, '2017-07-19 10:59:35', '2017-07-19 10:59:35'),
(9, 'Client', 'Stella chepkuto', 'stellachepkuto@gmail.com', '$2y$10$ifN98ifjiFV5ZXSom7Ugd.Ey08ewWryRNtluijDtUfVeA.BicGQay', '089934', NULL, 'Eldoret', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'xNVOD1By5Zdblwv', '7De6AdyCaNZhRuERWVfkwTIzZm2ryqtrLTntc7k64w9rllW8a8sy8uu7ne1Z', '2017-07-22 14:16:47', '2017-07-23 06:47:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquire`
--
ALTER TABLE `enquire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `enquire`
--
ALTER TABLE `enquire`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
