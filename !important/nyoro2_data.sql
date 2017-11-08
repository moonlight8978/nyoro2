-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.26-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table nyoro2_development.ar_internal_metadata: ~0 rows (approximately)
DELETE FROM `ar_internal_metadata`;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
	('environment', 'development', '2017-09-19 10:25:57', '2017-09-19 10:25:57');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.countries: ~0 rows (approximately)
DELETE FROM `countries`;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `name`, `name_en`, `name_pronounce`, `code`, `note`, `created_at`, `updated_at`) VALUES
	(1, '日本', 'Japan', 'にほん', 'jp', NULL, '2017-10-13 02:56:25', '2017-10-13 02:56:25');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_albums: ~4 rows (approximately)
DELETE FROM `db_albums`;
/*!40000 ALTER TABLE `db_albums` DISABLE KEYS */;
INSERT INTO `db_albums` (`id`, `latest_version_id`, `marked`, `created_at`, `updated_at`, `comments_count`) VALUES
	(1, 44, 0, '2017-09-19 11:41:48', '2017-10-22 08:51:06', 6),
	(2, 21, 0, '2017-09-19 13:26:11', '2017-10-19 04:14:44', 1),
	(4, 9, 0, '2017-09-28 10:58:01', '2017-09-28 10:58:38', 0),
	(6, 45, 1, '2017-10-21 07:51:14', '2017-10-25 06:40:13', 0);
/*!40000 ALTER TABLE `db_albums` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_albums_companies: ~3 rows (approximately)
DELETE FROM `db_albums_companies`;
/*!40000 ALTER TABLE `db_albums_companies` DISABLE KEYS */;
INSERT INTO `db_albums_companies` (`album_id`, `company_id`) VALUES
	(1, 5),
	(2, 5),
	(6, 1);
/*!40000 ALTER TABLE `db_albums_companies` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_albums_tags: ~5 rows (approximately)
DELETE FROM `db_albums_tags`;
/*!40000 ALTER TABLE `db_albums_tags` DISABLE KEYS */;
INSERT INTO `db_albums_tags` (`album_id`, `tag_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(4, 2),
	(6, 1);
/*!40000 ALTER TABLE `db_albums_tags` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_album_versions: ~37 rows (approximately)
DELETE FROM `db_album_versions`;
/*!40000 ALTER TABLE `db_album_versions` DISABLE KEYS */;
INSERT INTO `db_album_versions` (`id`, `previous_version_id`, `album_id`, `marked`, `title`, `title_en`, `title_pronounce`, `image`, `note`, `created_at`, `updated_at`, `editor_id`, `release_id`) VALUES
	(1, NULL, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-09-19 11:41:51', '2017-09-19 11:41:51', 1, NULL),
	(3, 1, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-09-19 11:44:16', '2017-09-19 11:44:16', 1, NULL),
	(4, NULL, 2, 0, 'TRIBAL LINK - L', 'TRIBAL LINK - L', 'TRIBAL LINK - L', NULL, NULL, '2017-09-19 13:26:17', '2017-09-19 13:26:17', 1, NULL),
	(5, 4, 2, 0, 'TRIBAL LINK - R', 'TRIBAL LINK - L', 'TRIBAL LINK - L', NULL, NULL, '2017-09-19 13:26:53', '2017-09-19 13:26:53', 1, NULL),
	(6, 3, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-09-23 07:29:00', '2017-09-23 07:29:00', 1, NULL),
	(7, 3, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-09-25 15:16:26', '2017-09-25 15:16:26', 1, NULL),
	(8, NULL, 4, 0, '恋と恋するユートピア　ボーカルCD', 'Koi To Koi Suru Utopia Vocal CD', 'こいとこいするうーとぴあぼーかるCD', NULL, NULL, '2017-09-28 10:58:01', '2017-09-28 10:58:01', 1, NULL),
	(9, 8, 4, 0, '恋と恋するユートピア　ボーカルCD', 'Koi To Koi Suru Utopia Vocal CD', 'こいとこいするうーとぴあぼーかるCD', NULL, NULL, '2017-09-28 10:58:38', '2017-09-28 10:58:38', 1, NULL),
	(12, 4, 2, 0, 'TRIBAL LINK - L', 'TRIBAL LINK - L', 'TRIBAL LINK - L', NULL, NULL, '2017-10-08 06:21:58', '2017-10-08 06:21:58', 1, NULL),
	(13, 3, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-08 06:30:13', '2017-10-08 06:30:13', 1, NULL),
	(15, 13, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-12 08:44:40', '2017-10-12 08:44:40', 1, NULL),
	(16, 15, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-12 10:15:25', '2017-10-12 10:15:25', 1, NULL),
	(17, 12, 2, 0, 'TRIBAL LINK - L', 'TRIBAL LINK - L', 'TRIBAL LINK - L', NULL, NULL, '2017-10-12 10:18:54', '2017-10-12 10:18:54', 1, NULL),
	(18, 17, 2, 0, 'TRIBAL LINK - L', 'TRIBAL LINK - L', 'TRIBAL LINK - L', NULL, NULL, '2017-10-12 10:48:48', '2017-10-12 10:48:48', 1, NULL),
	(21, 18, 2, 0, 'TRIBAL LINK - L', 'TRIBAL LINK - L', 'TRIBAL LINK - L', NULL, NULL, '2017-10-12 11:06:37', '2017-10-12 11:06:37', 1, NULL),
	(22, 16, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-13 02:51:58', '2017-10-13 02:51:58', 1, NULL),
	(23, 22, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-13 02:54:29', '2017-10-13 02:54:29', 1, NULL),
	(24, 22, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-13 09:57:12', '2017-10-13 09:57:12', 1, NULL),
	(25, 24, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-13 09:58:44', '2017-10-13 09:58:44', 1, NULL),
	(26, 22, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-19 04:02:35', '2017-10-19 04:02:35', 1, NULL),
	(27, 22, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-19 04:02:36', '2017-10-19 04:02:36', 1, NULL),
	(28, 22, 1, 0, 'loz', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-19 04:03:30', '2017-10-19 04:03:30', 1, NULL),
	(29, NULL, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 07:51:14', '2017-10-21 07:51:22', 1, NULL),
	(30, 29, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 07:57:53', '2017-10-21 07:57:53', 1, NULL),
	(31, 30, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 07:59:13', '2017-10-21 07:59:14', 1, 9),
	(33, 31, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 08:00:47', '2017-10-21 08:00:47', 1, 9),
	(34, 33, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 08:05:53', '2017-10-21 08:05:53', 1, 9),
	(36, 33, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 08:09:41', '2017-10-21 08:09:41', 1, 9),
	(37, 36, 6, 0, 'asdasdas', 'asdasdasd', 'asdasdasd', NULL, NULL, '2017-10-21 08:11:30', '2017-10-21 08:11:30', 1, 10),
	(38, 37, 6, 0, 'AAAAAAAAAAAAAAA', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-21 08:36:15', '2017-10-21 08:36:15', 1, 10),
	(39, 38, 6, 0, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-21 08:37:53', '2017-10-21 08:37:53', 1, 10),
	(40, 39, 6, 0, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-21 08:40:20', '2017-10-21 08:40:21', 1, 10),
	(41, 40, 6, 0, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-21 08:42:17', '2017-10-21 08:42:18', 1, 10),
	(42, 41, 6, 0, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-21 08:43:02', '2017-10-21 08:43:02', 1, 11),
	(43, 42, 6, 0, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-21 08:45:47', '2017-10-21 08:45:47', 1, 12),
	(44, 22, 1, 0, '恋する少女と想いのキセキ Original Sound Track', 'Koi Suru Shoujo to Omoi no Kiseki Original Sound Track', 'こいするしょうじょとおもいのきせきOriginal Sound Track', NULL, NULL, '2017-10-22 07:49:09', '2017-10-22 07:49:14', 1, 13),
	(45, 43, 6, 0, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'asdasdasd', 'asdasdasdasdasd', NULL, NULL, '2017-10-25 06:40:13', '2017-10-25 06:40:15', 1, 14);
/*!40000 ALTER TABLE `db_album_versions` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_album_versions_discs: ~21 rows (approximately)
DELETE FROM `db_album_versions_discs`;
/*!40000 ALTER TABLE `db_album_versions_discs` DISABLE KEYS */;
INSERT INTO `db_album_versions_discs` (`album_version_id`, `disc_id`) VALUES
	(3, 2),
	(9, 3),
	(13, 2),
	(15, 2),
	(16, 2),
	(22, 2),
	(23, 2),
	(24, 2),
	(25, 2),
	(28, 2),
	(33, 5),
	(36, 5),
	(37, 5),
	(38, 5),
	(39, 5),
	(40, 5),
	(41, 5),
	(42, 5),
	(43, 5),
	(44, 2),
	(45, 5);
/*!40000 ALTER TABLE `db_album_versions_discs` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_companies: ~2 rows (approximately)
DELETE FROM `db_companies`;
/*!40000 ALTER TABLE `db_companies` DISABLE KEYS */;
INSERT INTO `db_companies` (`id`, `latest_version_id`, `marked`, `created_at`, `updated_at`, `comments_count`) VALUES
	(1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
	(5, 6, 0, '2017-10-13 04:10:19', '2017-10-25 07:24:18', 1);
/*!40000 ALTER TABLE `db_companies` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_company_versions: ~4 rows (approximately)
DELETE FROM `db_company_versions`;
/*!40000 ALTER TABLE `db_company_versions` DISABLE KEYS */;
INSERT INTO `db_company_versions` (`id`, `company_id`, `previous_version_id`, `country_id`, `marked`, `name`, `name_en`, `name_pronounce`, `established_at`, `note`, `created_at`, `updated_at`, `editor_id`) VALUES
	(1, 1, NULL, 1, 0, 'sugar pot', 'sugar pot', 'sugar pot', NULL, NULL, '2017-10-13 03:14:53', '2017-10-13 03:14:53', 1),
	(5, 5, NULL, 1, 0, '株式会社ビジュアルアーツ', 'Visual Art\'s Co., Ltd.', 'かぶしきがいしゃびじゅあるあーと', NULL, '', '2017-10-13 04:10:19', '2017-10-13 04:10:19', 1),
	(6, 5, 5, 1, 0, '株式会社ビジュアルアーツ', 'Visual Art\'s Co., Ltd.', 'かぶしきがいしゃびじゅあるあーと', '1991-01-01', '', '2017-10-13 09:47:06', '2017-10-13 09:47:07', 1),
	(7, 5, 6, 1, 0, '株式会社ビジュアル', 'Visual Art\'s Co., Ltd.', 'かぶしきがいしゃびじゅあるあーと', '1991-01-01', '', '2017-10-25 07:23:07', '2017-10-25 07:23:07', 1);
/*!40000 ALTER TABLE `db_company_versions` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_discs: ~3 rows (approximately)
DELETE FROM `db_discs`;
/*!40000 ALTER TABLE `db_discs` DISABLE KEYS */;
INSERT INTO `db_discs` (`id`, `marked`, `number`, `title`, `created_at`, `updated_at`, `editor_id`) VALUES
	(2, 0, 1, '', '2017-09-19 11:44:16', '2017-09-19 11:44:16', 1),
	(3, 0, 1, '', '2017-09-28 10:58:38', '2017-09-28 10:58:38', 1),
	(5, 0, 1, '', '2017-10-21 08:00:46', '2017-10-21 08:00:46', 1);
/*!40000 ALTER TABLE `db_discs` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_people: ~8 rows (approximately)
DELETE FROM `db_people`;
/*!40000 ALTER TABLE `db_people` DISABLE KEYS */;
INSERT INTO `db_people` (`id`, `latest_version_id`, `marked`, `created_at`, `updated_at`, `comments_count`) VALUES
	(7, 13, NULL, '2017-09-21 10:18:01', '2017-10-23 07:31:59', 1),
	(8, 8, NULL, '2017-09-21 11:12:36', '2017-09-21 11:12:36', 0),
	(9, 14, NULL, '2017-09-22 06:06:09', '2017-09-22 06:06:09', 0),
	(10, 15, NULL, '2017-09-28 11:01:32', '2017-09-28 11:01:32', 0),
	(11, 16, NULL, '2017-09-28 11:02:20', '2017-09-28 11:02:20', 0),
	(12, 17, NULL, '2017-09-28 11:04:39', '2017-09-28 11:04:39', 0),
	(13, 18, NULL, '2017-09-28 11:05:25', '2017-09-28 11:05:25', 0),
	(16, 26, NULL, '2017-10-22 02:38:27', '2017-10-22 02:48:16', 0);
/*!40000 ALTER TABLE `db_people` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_person_versions: ~16 rows (approximately)
DELETE FROM `db_person_versions`;
/*!40000 ALTER TABLE `db_person_versions` DISABLE KEYS */;
INSERT INTO `db_person_versions` (`id`, `person_id`, `previous_version_id`, `marked`, `name`, `name_en`, `name_pronounce`, `birthday`, `gender`, `blood_type`, `website`, `twitter`, `note`, `created_at`, `updated_at`, `country_id`, `editor_id`) VALUES
	(7, 7, NULL, 0, 'nao', 'nao', 'なお', '1985-01-26', 0, 'O', '', 'http://orz-nao.com/', NULL, '2017-09-21 10:18:01', '2017-09-21 10:18:01', NULL, 1),
	(8, 8, NULL, 0, 'nao', 'nao', 'なお', '1985-01-26', 0, 'O', '', 'http://orz-nao.com/', NULL, '2017-09-21 11:12:36', '2017-09-21 11:12:36', NULL, 1),
	(9, 7, 7, 0, 'na', 'nao', 'なお', '1985-01-26', 0, 'O', '', 'http://orz-nao.com/', NULL, '2017-09-21 11:15:49', '2017-09-21 11:15:49', NULL, 1),
	(10, 7, 9, 0, 'ミルノ純', 'Miruno Jun', 'みるのじゅん', NULL, 0, 'O', '', 'http://www.synchronist.net/pages/265743/page_201601070927', NULL, '2017-09-21 12:56:21', '2017-09-21 12:56:21', NULL, 1),
	(11, 7, 10, 0, 'ミルノ純', 'Miruno Jun', 'みるのじゅん', '0100-09-14', 0, 'O', '', 'http://www.synchronist.net/pages/265743/page_201601070927', NULL, '2017-09-21 13:01:21', '2017-09-21 13:01:21', NULL, 1),
	(12, 7, 11, 0, 'ミルノ純', 'Miruno Jun', 'みるのじゅん', '0100-09-14', NULL, '', '', 'http://www.synchronist.net/pages/265743/page_201601070927', NULL, '2017-09-21 13:14:02', '2017-09-21 13:14:02', NULL, 1),
	(13, 7, 12, 0, 'ミルノ純', 'Miruno Jun', 'みるのじゅん', '0100-09-14', 0, 'O', '', 'http://www.synchronist.net/pages/265743/page_201601070927', NULL, '2017-09-21 13:14:16', '2017-09-21 13:14:16', NULL, 1),
	(14, 9, NULL, 0, '山下慎一狼', 'Yamashita Junichirou', 'やましたしんいちろう', '1980-02-14', 1, 'AB', '', 'https://ameblo.jp/phoenrill/', NULL, '2017-09-22 06:06:09', '2017-09-22 06:06:09', NULL, 1),
	(15, 10, NULL, 0, '華憐', 'Karen', 'かれん', '0100-10-25', 0, '', '', '', NULL, '2017-09-28 11:01:32', '2017-09-28 11:01:32', NULL, 1),
	(16, 11, NULL, 0, '電気', 'Denki', 'でんき', '0100-03-25', 1, '', '', '', NULL, '2017-09-28 11:02:20', '2017-09-28 11:02:20', NULL, 1),
	(17, 12, NULL, 0, '小春めう', 'Koharu Meu', 'こはるめう', NULL, 0, 'A', '', '', NULL, '2017-09-28 11:04:39', '2017-09-28 11:04:39', NULL, 1),
	(18, 13, NULL, 0, '春川あかり', 'Harukawa Akari', 'はるかわあかり', NULL, 0, '', '', '', NULL, '2017-09-28 11:05:25', '2017-09-28 11:05:25', NULL, 1),
	(22, 16, NULL, 0, 'dasasdasddasasd', 'sdaasdasdasdads', 'asdasdsads', NULL, NULL, '', '', '', NULL, '2017-10-22 02:38:27', '2017-10-22 02:38:27', NULL, 1),
	(23, 16, 22, 0, 'dasasdasddasasd', 'sdaasdasdasdads', '123', NULL, NULL, '', '', '', NULL, '2017-10-22 02:39:12', '2017-10-22 02:39:12', NULL, 1),
	(25, 16, 23, 0, '123asdassa', 'sdaasdasdasdads', '123', NULL, NULL, '', '', '', NULL, '2017-10-22 02:46:53', '2017-10-22 02:46:53', NULL, 1),
	(26, 16, 26, 0, 'AAAA', 'sdaasdasdasdads', '123', NULL, NULL, '', '', '', NULL, '2017-10-22 02:48:16', '2017-10-22 02:48:16', NULL, 1);
/*!40000 ALTER TABLE `db_person_versions` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_releases: ~6 rows (approximately)
DELETE FROM `db_releases`;
/*!40000 ALTER TABLE `db_releases` DISABLE KEYS */;
INSERT INTO `db_releases` (`id`, `price`, `currency`, `format`, `released_at`, `catalog_number`, `note`, `created_at`, `updated_at`, `publisher_id`, `editor_id`, `marked`) VALUES
	(9, 12123, 'JPY', 'CD', NULL, '1212321', NULL, '2017-10-21 07:59:14', '2017-10-21 07:59:14', 1, 1, 0),
	(10, 12123, 'JPY', 'CD', '2017-10-11', '1212321', NULL, '2017-10-21 08:11:30', '2017-10-21 08:11:30', 1, 1, 0),
	(11, 12123, 'JPY', 'CD', '2017-10-11', '1212321', NULL, '2017-10-21 08:43:02', '2017-10-21 08:43:02', 5, 1, 0),
	(12, 12123, 'JPY', 'CD', '2017-10-11', '1212321', NULL, '2017-10-21 08:45:47', '2017-10-21 08:45:47', 1, 1, 0),
	(13, NULL, '', 'CD', '2014-02-28', '', NULL, '2017-10-22 07:49:14', '2017-10-22 07:49:14', 1, 1, 0),
	(14, 12123, 'JPY', 'CD', '2017-10-11', '1111', NULL, '2017-10-25 06:40:15', '2017-10-25 06:40:15', 1, 1, 0);
/*!40000 ALTER TABLE `db_releases` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_songs: ~5 rows (approximately)
DELETE FROM `db_songs`;
/*!40000 ALTER TABLE `db_songs` DISABLE KEYS */;
INSERT INTO `db_songs` (`id`, `disc_id`, `latest_version_id`, `marked`, `created_at`, `updated_at`, `comments_count`) VALUES
	(1, 2, 11, 0, '2017-09-19 11:45:05', '2017-10-23 07:32:04', 3),
	(2, 2, 2, 0, '2017-09-19 11:48:21', '2017-09-19 11:48:21', 0),
	(3, 3, 17, 0, '2017-09-28 11:00:01', '2017-09-28 11:07:04', 0),
	(6, 5, 21, 0, '2017-10-21 08:03:57', '2017-10-25 06:38:50', 0),
	(7, 5, 19, 0, '2017-10-21 08:06:58', '2017-10-21 08:06:58', 0);
/*!40000 ALTER TABLE `db_songs` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_song_versions: ~21 rows (approximately)
DELETE FROM `db_song_versions`;
/*!40000 ALTER TABLE `db_song_versions` DISABLE KEYS */;
INSERT INTO `db_song_versions` (`id`, `previous_version_id`, `song_id`, `marked`, `title`, `title_en`, `title_pronounce`, `length`, `number`, `created_at`, `updated_at`, `editor_id`) VALUES
	(1, NULL, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-19 11:45:05', '2017-09-19 11:45:05', NULL),
	(2, NULL, 2, 0, '人形遣い', 'Ningyou Tsukai', 'にんぎょうつかい', '3:26', 2, '2017-09-19 11:48:21', '2017-09-19 11:48:21', NULL),
	(3, 1, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 06:02:31', '2017-09-22 06:02:31', NULL),
	(4, 3, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 06:11:01', '2017-09-22 06:11:01', NULL),
	(5, 4, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 06:26:00', '2017-09-22 06:26:00', NULL),
	(6, 4, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 10:51:29', '2017-09-22 10:51:29', NULL),
	(7, 6, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 12:07:11', '2017-09-22 12:07:11', NULL),
	(8, 7, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 13:52:24', '2017-09-22 13:52:24', NULL),
	(9, 8, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 13:53:37', '2017-09-22 13:53:37', NULL),
	(10, 9, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-22 13:54:33', '2017-09-22 13:54:33', NULL),
	(11, 10, 1, 0, '永遠なる絆と想いのキセキ', 'Towa naru Kizuna to Omoi no Kiseki', 'とわなるきずなとおもいのきせき', '3:50', 1, '2017-09-23 04:07:59', '2017-09-23 04:07:59', NULL),
	(12, NULL, 3, 0, '蒸熱♨ユートピア', 'Jounetsu ♨ yuutopia', 'じょうねゆーとぴあ', '1:38', 1, '2017-09-28 11:00:01', '2017-09-28 11:00:01', NULL),
	(13, 12, 3, 0, '蒸熱♨ユートピア', 'Jounetsu ♨ yuutopia', 'じょうねゆーとぴあ', '1:38', 1, '2017-09-28 11:06:14', '2017-09-28 11:06:14', NULL),
	(14, 13, 3, 0, '蒸熱♨ユートピア', 'Jounetsu ♨ yuutopia', 'じょうねゆーとぴあ', '1:38', 1, '2017-09-28 11:06:26', '2017-09-28 11:06:26', NULL),
	(15, 14, 3, 0, '蒸熱♨ユートピア', 'Jounetsu ♨ yuutopia', 'じょうねゆーとぴあ', '1:38', 1, '2017-09-28 11:06:34', '2017-09-28 11:06:34', NULL),
	(16, 15, 3, 0, '蒸熱♨ユートピア', 'Jounetsu ♨ yuutopia', 'じょうねゆーとぴあ', '1:38', 1, '2017-09-28 11:06:48', '2017-09-28 11:06:48', NULL),
	(17, 16, 3, 0, '蒸熱♨ユートピア', 'Jounetsu ♨ yuutopia', 'じょうねゆーとぴあ', '1:38', 1, '2017-09-28 11:07:04', '2017-09-28 11:07:04', NULL),
	(18, NULL, 6, 0, 'asdsadsa', 'asdasdasdads', 'asdasdasd', '3:25', 1, '2017-10-21 08:03:57', '2017-10-21 08:03:57', 1),
	(19, NULL, 7, 0, 'asasaasa', 'saasasdsaa', 'sasasaasas', '3:44', 2, '2017-10-21 08:06:58', '2017-10-21 08:06:58', 1),
	(20, 18, 6, 0, 'asdsadsa', 'asdasdasdads', 'asdasdasd', '3:25', 1, '2017-10-25 06:38:39', '2017-10-25 06:38:39', 1),
	(21, 20, 6, 0, 'asdsadsa', 'asdasdasdads', 'asdasdasd', '3:25', 1, '2017-10-25 06:38:50', '2017-10-25 06:38:50', 1);
/*!40000 ALTER TABLE `db_song_versions` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_song_versions_staffs: ~41 rows (approximately)
DELETE FROM `db_song_versions_staffs`;
/*!40000 ALTER TABLE `db_song_versions_staffs` DISABLE KEYS */;
INSERT INTO `db_song_versions_staffs` (`song_version_id`, `staff_id`) VALUES
	(3, 1),
	(4, 1),
	(4, 2),
	(5, 1),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 2),
	(6, 4),
	(7, 1),
	(7, 2),
	(7, 4),
	(7, 5),
	(8, 1),
	(8, 2),
	(8, 5),
	(9, 1),
	(9, 2),
	(10, 1),
	(10, 2),
	(11, 1),
	(11, 2),
	(11, 6),
	(13, 7),
	(14, 7),
	(14, 8),
	(15, 7),
	(15, 8),
	(15, 9),
	(16, 7),
	(16, 8),
	(16, 9),
	(16, 10),
	(17, 7),
	(17, 8),
	(17, 9),
	(17, 10),
	(17, 11),
	(20, 12),
	(21, 12),
	(21, 13);
/*!40000 ALTER TABLE `db_song_versions_staffs` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_staffs: ~13 rows (approximately)
DELETE FROM `db_staffs`;
/*!40000 ALTER TABLE `db_staffs` DISABLE KEYS */;
INSERT INTO `db_staffs` (`id`, `latest_version_id`, `marked`, `created_at`, `updated_at`) VALUES
	(1, 1, 0, '2017-09-22 06:02:30', '2017-09-22 06:02:30'),
	(2, 2, 0, '2017-09-22 06:11:01', '2017-09-22 06:11:01'),
	(3, 3, 0, '2017-09-22 06:26:00', '2017-09-22 06:26:00'),
	(4, 6, 0, '2017-09-22 10:51:29', '2017-09-22 12:11:04'),
	(5, 5, 0, '2017-09-22 12:07:11', '2017-09-22 12:07:11'),
	(6, 7, 0, '2017-09-23 04:07:59', '2017-09-23 04:07:59'),
	(7, 8, 0, '2017-09-28 11:06:14', '2017-09-28 13:09:09'),
	(8, 9, 0, '2017-09-28 11:06:25', '2017-09-28 11:06:25'),
	(9, 10, 0, '2017-09-28 11:06:34', '2017-09-28 11:06:34'),
	(10, 11, 0, '2017-09-28 11:06:48', '2017-09-28 11:06:48'),
	(11, 12, 0, '2017-09-28 11:07:04', '2017-09-28 11:07:04'),
	(12, 19, 0, '2017-10-25 06:38:38', '2017-10-25 06:39:23'),
	(13, 18, 0, '2017-10-25 06:38:50', '2017-10-25 06:38:50');
/*!40000 ALTER TABLE `db_staffs` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_staff_versions: ~19 rows (approximately)
DELETE FROM `db_staff_versions`;
/*!40000 ALTER TABLE `db_staff_versions` DISABLE KEYS */;
INSERT INTO `db_staff_versions` (`id`, `staff_id`, `previous_version_id`, `marked`, `person_id`, `position`, `alias`, `alias_en`, `alias_pronounce`, `note`, `created_at`, `updated_at`, `editor_id`) VALUES
	(1, 1, NULL, 0, 8, 'Vocal', '', '', '', NULL, '2017-09-22 06:02:30', '2017-09-22 06:02:30', NULL),
	(2, 2, NULL, 0, 9, 'Lyrics', '', '', '', NULL, '2017-09-22 06:11:01', '2017-09-22 06:11:01', NULL),
	(3, 3, NULL, 0, 8, 'Lyrics', '', '', '', NULL, '2017-09-22 06:26:00', '2017-09-22 06:26:00', NULL),
	(4, 4, NULL, 0, 7, 'Vocal', 'miru', 'miru', 'みる', NULL, '2017-09-22 10:51:29', '2017-09-22 10:51:29', NULL),
	(5, 5, NULL, 0, 7, 'Lyrics', 'miru', 'miru', 'みる', NULL, '2017-09-22 12:07:11', '2017-09-22 12:07:11', NULL),
	(6, 4, 4, 0, 7, 'Compose', 'miru', 'miru', 'みる', NULL, '2017-09-22 12:11:04', '2017-09-22 12:11:04', NULL),
	(7, 6, NULL, 0, 7, 'Vocal', 'miru', 'miru', 'みる', NULL, '2017-09-23 04:07:59', '2017-09-23 04:07:59', NULL),
	(8, 7, NULL, 0, 10, 'Vocal', '', '', '', NULL, '2017-09-28 11:06:14', '2017-09-28 11:06:14', NULL),
	(9, 8, NULL, 0, 12, 'Vocal', '', '', '', NULL, '2017-09-28 11:06:25', '2017-09-28 11:06:25', NULL),
	(10, 9, NULL, 0, 13, 'Vocal', '', '', '', NULL, '2017-09-28 11:06:34', '2017-09-28 11:06:34', NULL),
	(11, 10, NULL, 0, 11, 'Arrange', '', '', '', NULL, '2017-09-28 11:06:48', '2017-09-28 11:06:48', NULL),
	(12, 11, NULL, 0, 11, 'Lyrics', '', '', '', NULL, '2017-09-28 11:07:04', '2017-09-28 11:07:04', NULL),
	(13, 7, 8, 0, 10, 'Vocal', 'asdasd', '', '', NULL, '2017-09-28 12:03:16', '2017-09-28 12:03:16', NULL),
	(14, 7, 13, 0, 10, 'Vocal', 'asdasdasdasdsa', '', '', NULL, '2017-09-28 12:04:36', '2017-09-28 12:04:36', NULL),
	(15, 7, 14, 0, 10, 'Vocal', 'asdasdasdasdsaasdasdasd', '', '', NULL, '2017-09-28 12:10:41', '2017-09-28 12:10:41', NULL),
	(16, 7, 15, 0, 10, 'Vocal', 'asdasdasdasdsaasdasdasdasdadasd', '', '', NULL, '2017-09-28 12:22:39', '2017-09-28 12:22:39', NULL),
	(17, 12, NULL, 0, 8, 'Lyrics', '', '', '', NULL, '2017-10-25 06:38:38', '2017-10-25 06:38:38', 1),
	(18, 13, NULL, 0, 8, 'Vocal', '', '', '', NULL, '2017-10-25 06:38:50', '2017-10-25 06:38:50', 1),
	(19, 12, 17, 0, 8, 'Arrange', '', '', '', NULL, '2017-10-25 06:39:23', '2017-10-25 06:39:23', 1);
/*!40000 ALTER TABLE `db_staff_versions` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.db_tags: ~3 rows (approximately)
DELETE FROM `db_tags`;
/*!40000 ALTER TABLE `db_tags` DISABLE KEYS */;
INSERT INTO `db_tags` (`id`, `name`, `name_en`, `name_pronounce`, `description`, `created_at`, `updated_at`, `comments_count`, `editor_id`, `marked`) VALUES
	(1, 'オリジナル・サウンドトラック', 'Original Soundtrack', 'おりじなるさうんどとらっく', 'ゲームやムービのサウンドトラック', '2017-09-24 04:17:39', '2017-10-23 07:32:05', 1, 1, 0),
	(2, 'コマーシャル', 'Commercial', 'こまーしゃる', '', '2017-09-25 14:22:55', '2017-09-25 14:22:55', 0, 1, 0),
	(3, 'プレオーダーボーナス', 'Preorder Bonus', 'プレオーダーボーナス', '', '2017-09-25 14:23:43', '2017-09-25 14:23:43', 0, 1, 0);
/*!40000 ALTER TABLE `db_tags` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_categories: ~8 rows (approximately)
DELETE FROM `ec_categories`;
/*!40000 ALTER TABLE `ec_categories` DISABLE KEYS */;
INSERT INTO `ec_categories` (`id`, `parent_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(2, NULL, 'フィギュア', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, NULL, 'ゲーム', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 3, 'PCゲーム', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 3, 'PlayStationゲーム', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, NULL, 'DVD/CD', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(7, 6, '音楽', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(8, 6, 'AV', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(9, NULL, '他', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ec_categories` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_products: ~0 rows (approximately)
DELETE FROM `ec_products`;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` (`id`, `category_id`, `shop_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 7, 1, '恋するドールと想いのキセキOriginal Soundtrack', NULL, '2017-11-05 10:57:29', '2017-11-05 10:57:29');
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_product_colors: ~0 rows (approximately)
DELETE FROM `ec_product_colors`;
/*!40000 ALTER TABLE `ec_product_colors` DISABLE KEYS */;
INSERT INTO `ec_product_colors` (`id`, `product_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Default', '200000', '2017-11-05 10:58:22', '2017-11-05 10:58:22');
/*!40000 ALTER TABLE `ec_product_colors` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_product_discounts: ~1 rows (approximately)
DELETE FROM `ec_product_discounts`;
/*!40000 ALTER TABLE `ec_product_discounts` DISABLE KEYS */;
INSERT INTO `ec_product_discounts` (`id`, `product_id`, `shop`, `system`, `created_at`, `updated_at`) VALUES
	(1, 1, 0, 0, '2017-11-08 02:49:09', '2017-11-08 02:49:09');
/*!40000 ALTER TABLE `ec_product_discounts` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_product_images: ~4 rows (approximately)
DELETE FROM `ec_product_images`;
/*!40000 ALTER TABLE `ec_product_images` DISABLE KEYS */;
INSERT INTO `ec_product_images` (`id`, `product_id`, `image`, `nsfw`, `created_at`, `updated_at`) VALUES
	(21, 1, 'index_parallax_1.jpg', 0, '2017-11-07 05:11:01', '2017-11-07 05:11:01'),
	(22, 1, 'index_parallax_1_.jpg', 0, '2017-11-07 05:11:14', '2017-11-07 05:11:14'),
	(23, 1, 'index_parallax_5.jpg', 0, '2017-11-07 05:18:50', '2017-11-07 05:18:50'),
	(24, 1, 'index_parallax_3.jpg', 0, '2017-11-07 05:56:14', '2017-11-07 05:56:14');
/*!40000 ALTER TABLE `ec_product_images` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_product_storages: ~1 rows (approximately)
DELETE FROM `ec_product_storages`;
/*!40000 ALTER TABLE `ec_product_storages` DISABLE KEYS */;
INSERT INTO `ec_product_storages` (`id`, `color_id`, `total`, `sold`, `created_at`, `updated_at`) VALUES
	(1, 1, 20, 0, '2017-11-08 00:41:43', '2017-11-08 00:41:43');
/*!40000 ALTER TABLE `ec_product_storages` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.ec_shops: ~0 rows (approximately)
DELETE FROM `ec_shops`;
/*!40000 ALTER TABLE `ec_shops` DISABLE KEYS */;
INSERT INTO `ec_shops` (`id`, `user_id`, `type`, `name`, `website`, `phone`, `email`, `address`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Ec::ApprovedShop', 'はるか', 'haruka_ya.com', '11111111111', 'haruka_ya@yahoo.co.jp', '23東京、日本', 'かるかのかわいい店', '2017-11-05 04:10:16', '2017-11-07 02:04:51');
/*!40000 ALTER TABLE `ec_shops` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.feature_comments: ~13 rows (approximately)
DELETE FROM `feature_comments`;
/*!40000 ALTER TABLE `feature_comments` DISABLE KEYS */;
INSERT INTO `feature_comments` (`id`, `user_id`, `commentable_type`, `commentable_id`, `body`, `created_at`, `updated_at`) VALUES
	(2, 1, 'Db::Album', 1, 'いいアルバムですね。', '2017-09-27 08:33:05', '2017-09-27 08:33:05'),
	(3, 1, 'Db::Song', 1, 'コメントして見たでけ。気にしないでください（^^）', '2017-10-01 05:10:11', '2017-10-01 05:10:11'),
	(4, 1, 'Db::Album', 1, 'Yay', '2017-10-14 12:04:12', '2017-10-14 12:04:12'),
	(5, 1, 'Db::Album', 1, 'Yay', '2017-10-14 12:06:31', '2017-10-14 12:06:31'),
	(6, 1, 'Db::Album', 1, 'Yay', '2017-10-14 12:06:52', '2017-10-14 12:06:52'),
	(7, 1, 'Db::Album', 1, 'FUCKKKKKKKKKKKKKKKKK', '2017-10-14 12:08:06', '2017-10-21 04:16:48'),
	(9, 1, 'Db::Person', 7, 'Konnichiwa', '2017-10-14 12:12:51', '2017-10-14 12:12:51'),
	(10, 1, 'Db::Song', 1, 'asdljkdasjdaskjdaskjadkjdas', '2017-10-14 12:14:50', '2017-10-14 12:14:50'),
	(11, 1, 'Db::Tag', 1, '皆さん今日は。お元気ですか^_^', '2017-10-15 01:57:18', '2017-10-15 01:57:18'),
	(12, 1, 'Db::Company', 5, 'こｄｓｆじゃｄｓｆｊｋだふぁｄｆｊかｄｓｆｊぁｄｓｆｊｌｋ', '2017-10-15 02:13:38', '2017-10-15 02:13:38'),
	(13, 1, 'Db::Song', 1, 'hello', '2017-10-15 04:43:04', '2017-10-15 04:43:04'),
	(14, 1, 'Db::Album', 1, 'asadasdsasd', '2017-10-22 04:41:00', '2017-10-22 04:41:00'),
	(15, 1, 'Db::Album', 2, 'こんにちは', '2017-10-22 08:51:40', '2017-10-22 08:51:40');
/*!40000 ALTER TABLE `feature_comments` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.feature_logs: ~122 rows (approximately)
DELETE FROM `feature_logs`;
/*!40000 ALTER TABLE `feature_logs` DISABLE KEYS */;
INSERT INTO `feature_logs` (`id`, `user_id`, `loggable_type`, `loggable_id`, `title`, `classification`, `action`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'create', NULL, '2017-09-19 11:41:52', '2017-09-19 11:41:52'),
	(3, 1, 'Db::Album', 1, 'ディスク1・恋する少女と想いのキセキ Original Sound Track', 'db', 'create', NULL, '2017-09-19 11:44:16', '2017-09-19 11:44:16'),
	(4, 1, 'Db::Song', 1, '永遠なる絆と想いのキセキ', 'db', 'create', NULL, '2017-09-19 11:45:05', '2017-09-19 11:45:05'),
	(5, 1, 'Db::Song', 2, '人形遣い', 'db', 'create', NULL, '2017-09-19 11:48:21', '2017-09-19 11:48:21'),
	(6, 1, 'Db::Album', 2, 'TRIBAL LINK - L', 'db', 'create', NULL, '2017-09-19 13:26:17', '2017-09-19 13:26:17'),
	(7, 1, 'Db::Album', 2, 'TRIBAL LINK - R', 'db', 'update', NULL, '2017-09-19 13:26:53', '2017-09-19 13:26:53'),
	(8, 1, 'Db::Album', 2, 'TRIBAL LINK - L', 'db', 'update', 'バーション4に戻す。', '2017-09-19 13:40:44', '2017-09-19 13:40:44'),
	(9, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション1に戻す。', '2017-09-20 15:09:14', '2017-09-20 15:09:14'),
	(10, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション3に戻す。', '2017-09-20 15:09:37', '2017-09-20 15:09:37'),
	(11, 1, 'Db::Person', 7, 'nao', 'db', 'create', NULL, '2017-09-21 10:18:02', '2017-09-21 10:18:02'),
	(12, 1, 'Db::Person', 8, 'nao', 'db', 'create', NULL, '2017-09-21 11:12:36', '2017-09-21 11:12:36'),
	(13, 1, 'Db::Person', 7, 'na', 'db', 'update', NULL, '2017-09-21 11:15:49', '2017-09-21 11:15:49'),
	(14, 1, 'Db::Person', 7, 'nao', 'db', 'update', 'バーション7に戻す。', '2017-09-21 11:19:00', '2017-09-21 11:19:00'),
	(15, 1, 'Db::Person', 7, 'na', 'db', 'update', 'バーション9に戻す。', '2017-09-21 11:25:36', '2017-09-21 11:25:36'),
	(16, 1, 'Db::Person', 7, 'ミルノ純', 'db', 'update', NULL, '2017-09-21 12:56:21', '2017-09-21 12:56:21'),
	(17, 1, 'Db::Person', 7, 'ミルノ純', 'db', 'update', NULL, '2017-09-21 13:01:21', '2017-09-21 13:01:21'),
	(18, 1, 'Db::Person', 7, 'ミルノ純', 'db', 'update', NULL, '2017-09-21 13:14:02', '2017-09-21 13:14:02'),
	(19, 1, 'Db::Person', 7, 'ミルノ純', 'db', 'update', NULL, '2017-09-21 13:14:16', '2017-09-21 13:14:16'),
	(20, 1, 'Db::Person', 9, '山下慎一狼', 'db', 'create', NULL, '2017-09-22 06:06:09', '2017-09-22 06:06:09'),
	(21, 1, 'Db::Song', 1, 'スタッフ', 'db', 'update', NULL, '2017-09-22 06:11:01', '2017-09-22 06:11:01'),
	(22, 1, 'Db::Song', 1, 'スタッフ', 'db', 'update', NULL, '2017-09-22 06:26:00', '2017-09-22 06:26:00'),
	(23, 1, 'Db::Song', 1, '永遠なる絆と想いのキセキ', 'db', 'update', 'バーション4に戻す。', '2017-09-22 06:26:29', '2017-09-22 06:26:29'),
	(24, 1, 'Db::Song', 1, 'スタッフ', 'db', 'create', NULL, '2017-09-22 10:51:29', '2017-09-22 10:51:29'),
	(25, 1, 'Db::Song', 1, 'スタッフ', 'db', 'create', NULL, '2017-09-22 12:07:12', '2017-09-22 12:07:12'),
	(26, 1, 'Db::Song', 1, 'スタッフ', 'db', 'update', NULL, '2017-09-22 12:11:04', '2017-09-22 12:11:04'),
	(27, 1, 'Db::Song', 1, 'スタッフ', 'db', 'destroy', NULL, '2017-09-22 13:52:24', '2017-09-22 13:52:24'),
	(28, 1, 'Db::Song', 1, 'スタッフ', 'db', 'destroy', NULL, '2017-09-22 13:53:37', '2017-09-22 13:53:37'),
	(29, 1, 'Db::Song', 1, 'スタッフ', 'db', 'destroy', NULL, '2017-09-22 13:54:33', '2017-09-22 13:54:33'),
	(30, 1, 'Db::Song', 1, 'スタッフ', 'db', 'create', NULL, '2017-09-23 04:07:59', '2017-09-23 04:07:59'),
	(31, 1, 'Db::Album', 1, 'ディスク1', 'db', 'destroy', NULL, '2017-09-23 07:29:03', '2017-09-23 07:29:03'),
	(32, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション3に戻す。', '2017-09-23 07:29:56', '2017-09-23 07:29:56'),
	(33, 1, 'Db::Album', 1, 'ディスク1', 'db', 'destroy', NULL, '2017-09-25 15:16:28', '2017-09-25 15:16:28'),
	(34, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション6に戻す。', '2017-09-25 15:16:47', '2017-09-25 15:16:47'),
	(35, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション3に戻す。', '2017-09-25 15:17:01', '2017-09-25 15:17:01'),
	(36, 1, 'Feature::Comment', 2, '恋する少女と想いのキセキ Original Sound Track', 'db', 'comment', NULL, '2017-09-27 08:33:06', '2017-09-27 08:33:06'),
	(37, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション6に戻す。', '2017-09-27 08:33:53', '2017-09-27 08:33:53'),
	(38, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション3に戻す。', '2017-09-27 08:34:07', '2017-09-27 08:34:07'),
	(39, 1, 'Db::Album', 4, '恋と恋するユートピア　ボーカルCD', 'db', 'create', NULL, '2017-09-28 10:58:02', '2017-09-28 10:58:02'),
	(40, 1, 'Db::Album', 4, 'ディスク1・恋と恋するユートピア　ボーカルCD', 'db', 'create', NULL, '2017-09-28 10:58:38', '2017-09-28 10:58:38'),
	(41, 1, 'Db::Song', 3, '蒸熱♨ユートピア', 'db', 'create', NULL, '2017-09-28 11:00:01', '2017-09-28 11:00:01'),
	(42, 1, 'Db::Person', 10, '華憐', 'db', 'create', NULL, '2017-09-28 11:01:32', '2017-09-28 11:01:32'),
	(43, 1, 'Db::Person', 11, '電気', 'db', 'create', NULL, '2017-09-28 11:02:20', '2017-09-28 11:02:20'),
	(44, 1, 'Db::Person', 12, '小春めう', 'db', 'create', NULL, '2017-09-28 11:04:39', '2017-09-28 11:04:39'),
	(45, 1, 'Db::Person', 13, '春川あかり', 'db', 'create', NULL, '2017-09-28 11:05:26', '2017-09-28 11:05:26'),
	(46, 1, 'Db::Song', 3, 'スタッフ', 'db', 'create', NULL, '2017-09-28 11:06:14', '2017-09-28 11:06:14'),
	(47, 1, 'Db::Song', 3, 'スタッフ', 'db', 'create', NULL, '2017-09-28 11:06:26', '2017-09-28 11:06:26'),
	(48, 1, 'Db::Song', 3, 'スタッフ', 'db', 'create', NULL, '2017-09-28 11:06:35', '2017-09-28 11:06:35'),
	(49, 1, 'Db::Song', 3, 'スタッフ', 'db', 'create', NULL, '2017-09-28 11:06:48', '2017-09-28 11:06:48'),
	(50, 1, 'Db::Song', 3, 'スタッフ', 'db', 'create', NULL, '2017-09-28 11:07:04', '2017-09-28 11:07:04'),
	(51, 1, 'Db::Song', 3, 'スタッフ', 'db', 'update', NULL, '2017-09-28 12:03:16', '2017-09-28 12:03:16'),
	(52, 1, 'Db::Song', 3, 'スタッフ', 'db', 'update', 'update', '2017-09-28 12:04:36', '2017-09-28 12:04:36'),
	(53, 1, 'Db::Song', 3, 'スタッフ', 'db', 'update', 'update', '2017-09-28 12:10:42', '2017-09-28 12:10:42'),
	(54, 1, 'Db::Song', 3, 'スタッフadadasasdasdasdasdasdasdasdasd', 'db', 'update', 'update', '2017-09-28 12:22:39', '2017-09-28 12:22:39'),
	(55, 1, 'Feature::Comment', 3, '永遠なる絆と想いのキセキ', 'db', 'comment', NULL, '2017-10-01 05:10:11', '2017-10-01 05:10:11'),
	(56, 1, 'Db::Album', 1, '発売情報・恋する少女と想いのキセキ Original Sound Track', 'db', 'create', '恋する少女と想いのキセキ Original Sound Trackの新しい発売情報が作られました。', '2017-10-12 10:15:24', '2017-10-12 10:15:24'),
	(57, 1, 'Db::Album', 2, '発売情報・TRIBAL LINK - L', 'db', 'create', 'TRIBAL LINK - Lの新しい発売情報が作られました。', '2017-10-12 10:18:53', '2017-10-12 10:18:53'),
	(58, 1, 'Db::Album', 2, '発売情報・TRIBAL LINK - L', 'db', 'create', 'TRIBAL LINK - Lの新しい発売情報が作られました。', '2017-10-12 10:48:49', '2017-10-12 10:48:49'),
	(59, 1, 'Db::Album', 2, '発売情報・TRIBAL LINK - L', 'db', 'update', 'TRIBAL LINK - Lの新しい発売情報が作られました。', '2017-10-12 11:06:39', '2017-10-12 11:06:39'),
	(60, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', NULL, '2017-10-13 02:52:09', '2017-10-13 02:52:09'),
	(61, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', NULL, '2017-10-13 02:54:30', '2017-10-13 02:54:30'),
	(62, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション22に戻す。', '2017-10-13 02:54:50', '2017-10-13 02:54:50'),
	(63, 1, 'Db::Company', 5, '株式会社ビジュアルアーツ', 'db', 'create', '株式会社ビジュアルアーツを作りました。', '2017-10-13 04:10:20', '2017-10-13 04:10:20'),
	(64, 1, 'Db::Company', 5, '株式会社ビジュアルアーツ', 'db', 'update', '株式会社ビジュアルアーツを作りました。', '2017-10-13 09:47:07', '2017-10-13 09:47:07'),
	(65, 1, 'Db::Album', 1, '発売情報・恋する少女と想いのキセキ Original Sound Track', 'db', 'update', '恋する少女と想いのキセキ Original Sound Trackの新しい発売情報が作られました。', '2017-10-13 09:57:22', '2017-10-13 09:57:22'),
	(66, 1, 'Db::Album', 1, '発売情報・恋する少女と想いのキセキ Original Sound Track', 'db', 'update', '恋する少女と想いのキセキ Original Sound Trackの新しい発売情報が作られました。', '2017-10-13 09:58:45', '2017-10-13 09:58:45'),
	(67, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション23に戻す。', '2017-10-13 10:00:38', '2017-10-13 10:00:38'),
	(68, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション22に戻す。', '2017-10-13 10:00:45', '2017-10-13 10:00:45'),
	(69, 1, 'Feature::Comment', 6, '恋する少女と想いのキセキ Original Sound Track', 'db', 'comment', NULL, '2017-10-14 12:06:54', '2017-10-14 12:06:54'),
	(70, 1, 'Feature::Comment', 7, '恋する少女と想いのキセキ Original Sound Track', 'db', 'comment', NULL, '2017-10-14 12:08:07', '2017-10-14 12:08:07'),
	(71, 1, 'Feature::Comment', 8, '恋する少女と想いのキセキ Original Sound Track', 'db', 'comment', NULL, '2017-10-14 12:08:16', '2017-10-14 12:08:16'),
	(72, 1, 'Feature::Comment', 9, 'ミルノ純', 'db', 'comment', NULL, '2017-10-14 12:12:51', '2017-10-14 12:12:51'),
	(73, 1, 'Feature::Comment', 10, '永遠なる絆と想いのキセキ', 'db', 'comment', NULL, '2017-10-14 12:14:50', '2017-10-14 12:14:50'),
	(74, 1, 'Feature::Comment', 11, 'オリジナル・サウンドトラック', 'db', 'comment', NULL, '2017-10-15 01:57:19', '2017-10-15 01:57:19'),
	(75, 1, 'Feature::Comment', 12, '株式会社ビジュアルアーツ', 'db', 'comment', NULL, '2017-10-15 02:13:38', '2017-10-15 02:13:38'),
	(76, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション23に戻す。', '2017-10-15 04:01:59', '2017-10-15 04:01:59'),
	(77, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション22に戻す。', '2017-10-15 04:03:26', '2017-10-15 04:03:26'),
	(78, 1, 'Db::Company', 5, '株式会社ビジュアルアーツ', 'db', 'update', 'バーション5に戻す。', '2017-10-15 04:09:59', '2017-10-15 04:09:59'),
	(79, 1, 'Db::Company', 5, '株式会社ビジュアルアーツ', 'db', 'update', 'バーション6に戻す。', '2017-10-15 04:10:05', '2017-10-15 04:10:05'),
	(80, 1, 'Feature::Comment', 13, '永遠なる絆と想いのキセキ', 'db', 'comment', NULL, '2017-10-15 04:43:05', '2017-10-15 04:43:05'),
	(81, 1, 'Db::Album', 1, 'ディスク1', 'db', 'destroy', NULL, '2017-10-19 04:02:38', '2017-10-19 04:02:38'),
	(82, 1, 'Db::Album', 1, 'ディスク1', 'db', 'destroy', NULL, '2017-10-19 04:02:39', '2017-10-19 04:02:39'),
	(83, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション22に戻す。', '2017-10-19 04:03:01', '2017-10-19 04:03:01'),
	(84, 1, 'Db::Album', 1, 'loz', 'db', 'update', NULL, '2017-10-19 04:03:30', '2017-10-19 04:03:30'),
	(85, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション22に戻す。', '2017-10-19 04:03:51', '2017-10-19 04:03:51'),
	(86, 1, 'Db::Album', 2, 'TRIBAL LINK - L', 'db', 'update', 'バーション18に戻す。', '2017-10-19 04:12:21', '2017-10-19 04:12:21'),
	(87, 1, 'Db::Album', 2, 'TRIBAL LINK - L', 'db', 'update', 'バーション21に戻す。', '2017-10-19 04:14:44', '2017-10-19 04:14:44'),
	(88, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション27に戻す。', '2017-10-19 04:22:45', '2017-10-19 04:22:45'),
	(89, 1, 'Db::Album', 1, '恋する少女と想いのキセキ Original Sound Track', 'db', 'update', 'バーション22に戻す。', '2017-10-20 05:41:34', '2017-10-20 05:41:34'),
	(90, 1, 'Db::Album', 6, 'asdasdas', 'db', 'create', NULL, '2017-10-21 07:51:22', '2017-10-21 07:51:22'),
	(91, 1, 'Db::Album', 6, '発売情報・asdasdas', 'db', 'create', 'asdasdasの新しい発売情報が作られました。', '2017-10-21 07:57:55', '2017-10-21 07:57:55'),
	(92, 1, 'Db::Album', 6, '発売情報・asdasdas', 'db', 'create', 'asdasdasの新しい発売情報が作られました。', '2017-10-21 07:59:14', '2017-10-21 07:59:14'),
	(93, 1, 'Db::Album', 6, 'ディスク1・asdasdas', 'db', 'create', NULL, '2017-10-21 08:00:47', '2017-10-21 08:00:47'),
	(94, 1, 'Db::Album', 6, 'asdasdas', 'db', 'update', 'バーション31に戻す。', '2017-10-21 08:01:04', '2017-10-21 08:01:04'),
	(95, 1, 'Db::Album', 6, 'asdasdas', 'db', 'update', 'バーション33に戻す。', '2017-10-21 08:01:21', '2017-10-21 08:01:21'),
	(96, 1, 'Db::Song', 6, 'asdsadsa', 'db', 'create', NULL, '2017-10-21 08:03:57', '2017-10-21 08:03:57'),
	(97, 1, 'Db::Album', 6, 'ディスク1', 'db', 'destroy', NULL, '2017-10-21 08:05:54', '2017-10-21 08:05:54'),
	(98, 1, 'Db::Album', 6, 'asdasdas', 'db', 'update', 'バーション33に戻す。', '2017-10-21 08:06:20', '2017-10-21 08:06:20'),
	(99, 1, 'Db::Song', 7, 'asasaasa', 'db', 'create', NULL, '2017-10-21 08:06:58', '2017-10-21 08:06:58'),
	(100, 1, 'Db::Album', 6, '発売情報・asdasdas', 'db', 'update', 'asdasdasの新しい発売情報が作られました。', '2017-10-21 08:09:41', '2017-10-21 08:09:41'),
	(101, 1, 'Db::Album', 6, '発売情報・asdasdas', 'db', 'update', 'asdasdasの新しい発売情報が作られました。', '2017-10-21 08:11:31', '2017-10-21 08:11:31'),
	(102, 1, 'Db::Album', 6, 'AAAAAAAAAAAAAAA', 'db', 'update', NULL, '2017-10-21 08:36:16', '2017-10-21 08:36:16'),
	(103, 1, 'Db::Album', 6, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'db', 'update', NULL, '2017-10-21 08:37:53', '2017-10-21 08:37:53'),
	(104, 1, 'Db::Album', 6, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'db', 'update', NULL, '2017-10-21 08:40:21', '2017-10-21 08:40:21'),
	(105, 1, 'Db::Album', 6, 'AAAAAAAAAAAAAAAdassadasdsaasd', 'db', 'update', NULL, '2017-10-21 08:42:18', '2017-10-21 08:42:18'),
	(106, 1, 'Db::Album', 6, '発売情報・AAAAAAAAAAAAAAAdassadasdsaasd', 'db', 'update', 'AAAAAAAAAAAAAAAdassadasdsaasdの新しい発売情報が作られました。', '2017-10-21 08:43:02', '2017-10-21 08:43:02'),
	(107, 1, 'Db::Album', 6, '発売情報・AAAAAAAAAAAAAAAdassadasdsaasd', 'db', 'update', 'AAAAAAAAAAAAAAAdassadasdsaasdの新しい発売情報が作られました。', '2017-10-21 08:45:48', '2017-10-21 08:45:48'),
	(108, 1, 'Db::Person', 16, 'dasasdasddasasd', 'db', 'create', NULL, '2017-10-22 02:38:27', '2017-10-22 02:38:27'),
	(109, 1, 'Db::Person', 16, 'dasasdasddasasd', 'db', 'update', NULL, '2017-10-22 02:39:12', '2017-10-22 02:39:12'),
	(110, 1, 'Db::Person', 16, 'dasasdasddasasd', 'db', 'update', 'バーション23に戻す。', '2017-10-22 02:43:06', '2017-10-22 02:43:06'),
	(111, 1, 'Db::Person', 16, '123asdassa', 'db', 'update', NULL, '2017-10-22 02:46:53', '2017-10-22 02:46:53'),
	(112, 1, 'Db::Person', 16, '123asdassa', 'db', 'update', 'バーション25に戻す。', '2017-10-22 02:47:40', '2017-10-22 02:47:40'),
	(113, 1, 'Db::Person', 16, 'AAAA', 'db', 'update', NULL, '2017-10-22 02:48:16', '2017-10-22 02:48:16'),
	(114, 1, 'Feature::Comment', 14, '恋する少女と想いのキセキ Original Sound Track', 'db', 'comment', NULL, '2017-10-22 04:41:00', '2017-10-22 04:41:00'),
	(115, 1, 'Db::Album', 1, '発売情報・恋する少女と想いのキセキ Original Sound Track', 'db', 'create', '恋する少女と想いのキセキ Original Sound Trackの新しい発売情報が作られました。', '2017-10-22 07:49:14', '2017-10-22 07:49:14'),
	(116, 1, 'Feature::Comment', 15, 'TRIBAL LINK - L', 'db', 'comment', NULL, '2017-10-22 08:51:40', '2017-10-22 08:51:40'),
	(117, 1, 'Db::Song', 6, 'スタッフ', 'db', 'create', NULL, '2017-10-25 06:38:39', '2017-10-25 06:38:39'),
	(118, 1, 'Db::Song', 6, 'スタッフ', 'db', 'create', NULL, '2017-10-25 06:38:50', '2017-10-25 06:38:50'),
	(119, 1, 'Db::Song', 6, 'スタッフ', 'db', 'update', NULL, '2017-10-25 06:39:23', '2017-10-25 06:39:23'),
	(120, 1, 'Db::Album', 6, '発売情報・AAAAAAAAAAAAAAAdassadasdsaasd', 'db', 'update', 'AAAAAAAAAAAAAAAdassadasdsaasdの新しい発売情報が作られました。', '2017-10-25 06:40:15', '2017-10-25 06:40:15'),
	(121, 1, 'Db::Tag', 4, 'test_tag', 'db', 'create', NULL, '2017-10-25 07:14:18', '2017-10-25 07:14:18'),
	(122, 1, 'Db::Company', 5, '株式会社ビジュアル', 'db', 'update', '株式会社ビジュアルを作りました。', '2017-10-25 07:23:07', '2017-10-25 07:23:07'),
	(123, 1, 'Db::Company', 5, '株式会社ビジュアルアーツ', 'db', 'update', 'バーション6に戻す。', '2017-10-25 07:24:19', '2017-10-25 07:24:19');
/*!40000 ALTER TABLE `feature_logs` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.feature_ratings: ~4 rows (approximately)
DELETE FROM `feature_ratings`;
/*!40000 ALTER TABLE `feature_ratings` DISABLE KEYS */;
INSERT INTO `feature_ratings` (`id`, `user_id`, `rateable_type`, `rateable_id`, `star`, `created_at`, `updated_at`) VALUES
	(2, 2, 'Db::Album', 1, 7, '2017-10-15 08:40:18', '2017-10-15 08:40:18'),
	(15, 1, 'Db::Album', 1, 8, '2017-10-17 04:08:34', '2017-10-23 08:44:59'),
	(16, 1, 'Db::Album', 4, 9, '2017-10-21 09:02:41', '2017-10-21 09:04:08'),
	(17, 1, 'Db::Album', 6, 6, '2017-10-21 09:03:40', '2017-10-21 09:03:40');
/*!40000 ALTER TABLE `feature_ratings` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.schema_migrations: ~39 rows (approximately)
DELETE FROM `schema_migrations`;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES
	('20170829060408'),
	('20170830121040'),
	('20170904031112'),
	('20170904031203'),
	('20170904031807'),
	('20170904032514'),
	('20170916071922'),
	('20170916072445'),
	('20170916072953'),
	('20170916073137'),
	('20170918113659'),
	('20170920123021'),
	('20170920123635'),
	('20170921114731'),
	('20170921115543'),
	('20170921122853'),
	('20170922042806'),
	('20170922042929'),
	('20170922043113'),
	('20170924034211'),
	('20170924034611'),
	('20171008034212'),
	('20171008034323'),
	('20171008051054'),
	('20171008051234'),
	('20171012093915'),
	('20171013021912'),
	('20171013022029'),
	('20171013023436'),
	('20171013023651'),
	('20171013030106'),
	('20171015043152'),
	('20171021065518'),
	('20171021072317'),
	('20171022084536'),
	('20171023072709'),
	('20171024091748'),
	('20171024092609'),
	('20171104072816');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `user_name`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`, `failed_attempts`, `unlock_token`, `locked_at`, `first_name`, `last_name`, `name_pronounce`, `avatar`, `provider`, `uid`, `created_at`, `updated_at`, `country_id`) VALUES
	(1, 'moonlight8978', 'bach.bach.1812@gmail.com', '$2a$11$Wy3uSzLqsi/Fz7YsuXyW6eXcKGOvWZ4bcUHUDcFo7G.ppmhAOWx36', NULL, NULL, '2017-10-27 07:31:25', 82, '2017-11-08 00:46:54', '2017-11-08 00:46:50', '127.0.0.1', '127.0.0.1', 'yC-HzUukJ2U2NygrUyMj', '2017-09-29 08:43:07', '2017-09-29 08:41:26', NULL, 0, NULL, NULL, 'ひろし', '鈴木', '', NULL, NULL, NULL, '2017-09-19 10:25:59', '2017-11-08 00:46:54', 1),
	(2, 'depzai', 'lesi.bich.181297@gmail.com', '$2a$11$JEP04UfK4cd4RDWW.nNzzOJHl9vdsGOvpiyTV3ADq3fFHsvZjhjNK', NULL, NULL, NULL, 1, '2017-09-29 08:09:32', '2017-09-29 08:09:32', '127.0.0.1', '127.0.0.1', 'mvDRDSYp5USgJS9Ni6m1', '2017-09-29 15:09:20', '2017-09-29 08:08:29', NULL, 0, NULL, NULL, 'ひろし', '鈴木', 'すずきひろし', NULL, 'google_oauth2', '104325539789436039537', '2017-09-29 08:08:29', '2017-09-29 08:13:05', 1),
	(4, NULL, 'moonlight8978@gmail.com', '$2a$11$ISKmyDR4pvQApaiQ5WSmOeMoz3sFhvxyMtstLy1DQ0C4B9xoaJ3b2', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'meRzgiaGGpDcn8zgAzNu', NULL, '2017-10-27 07:30:53', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'facebook', '1405224559595957', '2017-10-27 07:30:53', '2017-10-27 07:30:53', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.users_user_roles: ~6 rows (approximately)
DELETE FROM `users_user_roles`;
/*!40000 ALTER TABLE `users_user_roles` DISABLE KEYS */;
INSERT INTO `users_user_roles` (`user_id`, `role_id`) VALUES
	(1, 1),
	(1, 1),
	(1, 3),
	(1, 4),
	(2, 1),
	(4, 1);
/*!40000 ALTER TABLE `users_user_roles` ENABLE KEYS */;

-- Dumping data for table nyoro2_development.user_roles: ~4 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'user', '2017-09-19 10:25:58', '2017-09-19 10:25:58'),
	(2, 'banned', '2017-09-19 10:25:58', '2017-09-19 10:25:58'),
	(3, 'moderator', '2017-09-19 10:25:58', '2017-09-19 10:25:58'),
	(4, 'admin', '2017-09-19 10:25:58', '2017-09-19 10:25:58');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
