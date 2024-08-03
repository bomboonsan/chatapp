/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chat-app
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (3,'bomTest','xxxx',NULL,'2024-07-24 22:58:00','2024-07-24 22:58:00'),(251,'aunTest','bbxx',NULL,NULL,NULL),(253,'Bomboonsan','Ua2fe5a197b6a7921692d90e77b35061d','https://profile.line-scdn.net/0hCiDcvkEhHEZpGg62ZdxiORlKHyxKa0VUTHpUKQlIEnBTeQkRECwGI1UTECFVeFtEEX9acFodEHFlCWsgd0zgcm4qQXdVLlMQRnhVoA','2024-08-02 03:46:15','2024-08-02 03:46:15'),(254,'Auncha','Uf11ff588540e62542db9ac95ba44ef7b','https://profile.line-scdn.net/0h9g7RftJZZkgaK3Xmw4AYN2p7ZSI5Wj9aMEgpLCgqMCgjTiEaPx99eSsiOisnH3RJZkp9Knx8aC0WOBEuBH2afB0bO3kmHykeNUkvrg','2024-08-02 04:37:38','2024-08-02 04:37:38');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel:reverb:restart','i:1722394926;',2037754926);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_room_id_foreign` (`room_id`),
  KEY `messages_account_id_foreign` (`account_id`),
  CONSTRAINT `messages_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `messages_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (28,1,3,'ttt','2024-07-24 20:54:50','2024-07-24 20:54:50'),(29,1,3,'mmm','2024-07-24 20:55:46','2024-07-24 20:55:46'),(30,1,3,'1111','2024-07-24 21:13:13','2024-07-24 21:13:13'),(31,1,3,'q','2024-07-24 21:13:34','2024-07-24 21:13:34'),(32,1,3,'oo','2024-07-24 21:14:09','2024-07-24 21:14:09'),(33,1,3,'pp','2024-07-24 21:14:18','2024-07-24 21:14:18'),(34,1,3,'q','2024-07-24 21:44:26','2024-07-24 21:44:26'),(35,1,3,'hnhgf','2024-07-24 21:44:43','2024-07-24 21:44:43'),(36,1,3,'tt','2024-07-24 21:45:07','2024-07-24 21:45:07'),(37,1,3,'33','2024-07-24 21:50:23','2024-07-24 21:50:23'),(38,1,3,'yuyuy','2024-07-24 22:01:19','2024-07-24 22:01:19'),(39,1,3,'rr','2024-07-24 22:01:41','2024-07-24 22:01:41'),(40,1,3,'e','2024-07-30 19:40:42','2024-07-30 19:40:42'),(41,1,3,'ddddd','2024-07-30 19:41:11','2024-07-30 19:41:11'),(42,1,3,'2345','2024-07-30 19:41:28','2024-07-30 19:41:28'),(43,1,3,'2','2024-07-30 19:41:55','2024-07-30 19:41:55'),(44,1,3,'4','2024-07-30 19:44:27','2024-07-30 19:44:27'),(45,1,3,'4','2024-07-30 19:46:57','2024-07-30 19:46:57'),(46,1,3,'tttt','2024-07-30 19:47:06','2024-07-30 19:47:06'),(47,1,3,'eeee','2024-07-30 19:49:33','2024-07-30 19:49:33'),(48,1,3,'xxxx','2024-07-30 19:49:52','2024-07-30 19:49:52'),(49,1,3,'ds','2024-07-30 19:55:49','2024-07-30 19:55:49'),(50,1,3,'f','2024-07-30 19:56:12','2024-07-30 19:56:12'),(51,1,3,'s','2024-07-30 19:57:33','2024-07-30 19:57:33'),(52,1,3,'c','2024-07-30 19:58:57','2024-07-30 19:58:57'),(53,1,3,'rrrrr','2024-07-30 19:59:27','2024-07-30 19:59:27'),(54,1,3,'llllllllllll','2024-07-30 20:00:08','2024-07-30 20:00:08'),(55,1,3,'e','2024-07-30 20:05:33','2024-07-30 20:05:33'),(56,1,3,'d','2024-07-30 20:06:45','2024-07-30 20:06:45'),(57,1,3,'weqweqwe','2024-07-30 20:06:50','2024-07-30 20:06:50'),(58,1,3,'ll','2024-07-30 20:10:12','2024-07-30 20:10:12'),(59,1,3,'999','2024-07-30 20:17:10','2024-07-30 20:17:10'),(60,1,3,'o','2024-07-30 20:18:30','2024-07-30 20:18:30'),(61,1,3,'s','2024-07-30 20:19:31','2024-07-30 20:19:31'),(62,1,3,'d','2024-07-30 20:20:13','2024-07-30 20:20:13'),(63,1,3,'ddd','2024-07-30 20:21:42','2024-07-30 20:21:42'),(64,1,3,'we','2024-07-30 20:21:45','2024-07-30 20:21:45'),(65,1,3,'h','2024-07-30 20:22:00','2024-07-30 20:22:00'),(66,1,3,'ffff','2024-07-30 20:22:12','2024-07-30 20:22:12'),(67,1,3,'bomboonsan','2024-07-30 20:22:20','2024-07-30 20:22:20'),(68,1,3,'sd','2024-07-30 20:24:23','2024-07-30 20:24:23'),(69,1,3,'x','2024-07-30 20:24:28','2024-07-30 20:24:28'),(70,1,3,'d','2024-07-30 20:24:53','2024-07-30 20:24:53'),(71,1,3,'xz','2024-07-30 20:25:02','2024-07-30 20:25:02'),(72,1,3,'d','2024-07-30 20:36:12','2024-07-30 20:36:12'),(73,1,3,'g','2024-07-30 20:39:06','2024-07-30 20:39:06'),(74,1,3,'fsd','2024-07-30 20:39:37','2024-07-30 20:39:37'),(75,1,3,'sd','2024-07-30 20:42:15','2024-07-30 20:42:15'),(76,1,3,'sd','2024-07-30 20:43:57','2024-07-30 20:43:57'),(77,1,3,'asd','2024-07-30 20:51:38','2024-07-30 20:51:38'),(78,1,3,'asd','2024-07-30 20:58:30','2024-07-30 20:58:30'),(79,1,3,'ds','2024-07-30 21:14:55','2024-07-30 21:14:55'),(80,1,251,'sdssx','2024-07-30 21:52:41','2024-07-30 21:52:41'),(81,1,3,'xxxxxx','2024-07-30 21:52:55','2024-07-30 21:52:55'),(82,1,3,'ooo','2024-07-30 21:53:14','2024-07-30 21:53:14'),(83,1,251,'d','2024-07-30 21:58:39','2024-07-30 21:58:39'),(84,1,3,'s','2024-07-30 21:59:58','2024-07-30 21:59:58'),(85,1,3,'pp','2024-07-30 22:12:47','2024-07-30 22:12:47'),(86,1,251,'tesssst','2024-07-30 22:25:17','2024-07-30 22:25:17'),(87,1,3,'ss','2024-07-30 22:25:39','2024-07-30 22:25:39'),(88,1,251,'xcxcxc','2024-07-30 22:25:46','2024-07-30 22:25:46'),(89,1,251,'x','2024-07-30 22:25:54','2024-07-30 22:25:54'),(90,1,251,'dasd','2024-07-30 22:26:00','2024-07-30 22:26:00'),(91,1,3,'po','2024-07-30 22:27:10','2024-07-30 22:27:10'),(92,1,251,'x','2024-07-30 23:26:54','2024-07-30 23:26:54'),(93,1,251,'d','2024-08-02 02:55:23','2024-08-02 02:55:23'),(94,1,251,'xx','2024-08-02 02:55:26','2024-08-02 02:55:26'),(95,1,253,'ทดสอบ','2024-08-02 05:56:29','2024-08-02 05:56:29'),(96,4,253,'สวัสดี','2024-08-02 06:00:12','2024-08-02 06:00:12'),(97,4,254,'Yo','2024-08-02 06:00:58','2024-08-02 06:00:58'),(98,4,253,'x','2024-08-02 06:01:03','2024-08-02 06:01:03'),(99,4,254,'xxxxc','2024-08-02 06:02:22','2024-08-02 06:02:22'),(100,4,253,'ew','2024-08-02 06:02:28','2024-08-02 06:02:28'),(101,4,253,'x','2024-08-02 06:06:34','2024-08-02 06:06:34'),(102,4,253,'โย่','2024-08-02 06:16:41','2024-08-02 06:16:41'),(103,4,254,'ppp','2024-08-02 06:17:07','2024-08-02 06:17:07'),(104,4,253,'โย่','2024-08-02 06:17:28','2024-08-02 06:17:28'),(105,4,254,'จจจ','2024-08-02 06:25:31','2024-08-02 06:25:31'),(106,4,253,'ขาย','2024-08-02 06:26:44','2024-08-02 06:26:44'),(107,4,253,'บบบ','2024-08-02 06:27:05','2024-08-02 06:27:05'),(108,9,253,'สวัสดี','2024-08-02 20:11:43','2024-08-02 20:11:43'),(109,9,254,'ก','2024-08-02 20:11:52','2024-08-02 20:11:52'),(110,11,254,'่สวัสดีีี','2024-08-02 20:25:48','2024-08-02 20:25:48'),(111,1,253,'d','2024-08-02 20:44:11','2024-08-02 20:44:11');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_07_24_221617_create_accounts_table',1),(5,'2024_07_24_221621_create_rooms_table',1),(6,'2024_07_24_221710_create_messages_table',1),(7,'2024_07_24_222629_create_personal_access_tokens_table',1),(8,'2024_08_02_103532_edit_account_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` bigint(20) unsigned NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_room_number_unique` (`room_number`),
  KEY `rooms_owner_id_foreign` (`owner_id`),
  CONSTRAINT `rooms_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'test',3,'123',NULL,NULL),(4,'Bomboonsan',253,'413039','2024-08-02 05:16:11','2024-08-02 05:16:11'),(5,'Bomboonsan',253,'968290','2024-08-02 20:10:02','2024-08-02 20:10:02'),(6,'Bomboonsan',253,'668147','2024-08-02 20:10:40','2024-08-02 20:10:40'),(7,'Bomboonsan',253,'797091','2024-08-02 20:10:53','2024-08-02 20:10:53'),(8,'Bomboonsan',253,'742970','2024-08-02 20:11:04','2024-08-02 20:11:04'),(9,'Bomboonsan',253,'240982','2024-08-02 20:11:35','2024-08-02 20:11:35'),(10,'Bomboonsan',253,'437473','2024-08-02 20:24:39','2024-08-02 20:24:39'),(11,'Auncha',254,'492296','2024-08-02 20:25:40','2024-08-02 20:25:40'),(12,'Bomboonsan',253,'940420','2024-08-02 20:58:54','2024-08-02 20:58:54');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('LNTDL50pKtpTvY43rXdj4bgxpi2kjT6fMjejk4Ng',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSkdPSXZoWnZxMHlXUW1XVm01WHhGTmtjakJVcVZTY1d1OHVGN29DMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9saW51eC04MDAwLmJvbWJvb25zYW4uY29tL2NoYXQvMjQwOTgyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMDoiYWNjb3VudF9pZCI7aToyNTQ7czo1OiJ0b2tlbiI7czozMzoiVWYxMWZmNTg4NTQwZTYyNTQyZGI5YWM5NWJhNDRlZjdiIjt9',1722654710),('OAo5sXPxa1CZdDiA8WOspCXxvh9OU6YsSxddnEil',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR3FQZXJFZGdycklRck53cDVmYVB2bkNjZGlDaVo0dk9xNzQ3eTFUciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9saW51eC04MDAwLmJvbWJvb25zYW4uY29tL2NoYXQvMTIzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMDoiYWNjb3VudF9pZCI7aToyNTM7czo1OiJ0b2tlbiI7czozMzoiVWEyZmU1YTE5N2I2YTc5MjE2OTJkOTBlNzdiMzUwNjFkIjt9',1722657818),('vmzBJKNc9Xt1eheNgTULUcb8rATEV7HDk28XsRia',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 11; vivo 1906 Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/126.0.6478.188 Mobile Safari/537.36 Line/14.12.2/IAB','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU2VGbmprZUVJQ0NOTk1wM2FwUWRRaFgwd3hySW8xc2l3SjdPd2kzYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9saW51eC04MDAwLmJvbWJvb25zYW4uY29tL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEwOiJhY2NvdW50X2lkIjtpOjI1NDtzOjU6InRva2VuIjtzOjMzOiJVZjExZmY1ODg1NDBlNjI1NDJkYjlhYzk1YmE0NGVmN2IiO30=',1722655848);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-03 11:05:16
