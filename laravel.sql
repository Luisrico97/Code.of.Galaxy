# Host: 127.0.0.1  (Version 8.0.31)
# Date: 2024-03-12 18:17:53
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "comments"
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibily` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `comment_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  KEY `comments_comment_id_foreign` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "comments"
#

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Este ejemplo es muy claro, gracias por compartirlo','2023-01-01',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',7,1),(2,'Muy buen código, bien estructurado y fácil de seguir','2023-01-02',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',20,2),(3,'Excelente función, me ahorró mucho tiempo de desarrollo','2023-01-03',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',20,3),(4,'Este ejemplo realmente ilustra el concepto, ¡bien hecho!','2023-01-04',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',18,4),(5,'Un código muy limpio y legible, gracias por la demostración','2023-01-05',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',11,5),(6,'La función proporcionada es exactamente lo que necesitaba','2023-01-06',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',18,6),(7,'El ejemplo es perfecto para entender el uso práctico','2023-01-07',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',18,7),(8,'Gran código, gracias por compartir tu conocimiento','2023-01-08',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',16,8),(9,'La función es brillante, la implementaré en mis proyectos','2023-01-09',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',5,9),(10,'Ejemplo muy útil, resolvió mi problema de inmediato','2023-01-10',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',17,10),(11,'Código excepcional, fácil de entender y aplicar','2023-01-11',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',8,11),(12,'La función es simplemente genial, gracias por proporcionarla','2023-01-12',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',10,12),(13,'No puedo creer lo simple y efectivo que es este ejemplo','2023-01-13',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',5,13),(14,'Función excelente, definitivamente la agregaré a mi arsenal','2023-01-14',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',13,14),(15,'Este ejemplo demuestra una solución elegante al problema','2023-01-15',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',12,15),(16,'Código impresionante, gracias por compartir tus conocimientos','2023-01-16',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',19,16),(17,'La función proporcionada supera mis expectativas, ¡gracias!','2023-01-17',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',18,17),(18,'Comentario positivo sobre el código, realmente aprecio esto','2023-01-18',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',15,18),(19,'Ejemplo excepcional, fácil de entender incluso para principiantes','2023-01-19',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',19,19),(20,'Función brillante, esto es exactamente lo que estaba buscando','2023-01-20',1,'2024-01-12 00:31:48','2024-01-12 00:31:48',10,20),(21,'Hello world','2023-01-04',1,'2024-02-20 17:30:46','2024-02-20 17:30:46',NULL,0),(22,'Comment 1 for comment_id 1','2024-02-15',1,NULL,NULL,1,1),(23,'Comment 2 for comment_id 1','2024-02-15',1,NULL,NULL,2,1),(24,'Comment 3 for comment_id 1','2024-02-15',1,NULL,NULL,3,1),(25,'Comment 4 for comment_id 1','2024-02-15',1,NULL,NULL,4,1),(26,'Comment 1 for comment_id 3','2024-02-15',1,NULL,NULL,5,3),(27,'Comment 2 for comment_id 3','2024-02-15',1,NULL,NULL,6,3);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

#
# Structure for table "failed_jobs"
#

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "failed_jobs"
#


#
# Structure for table "frameworks"
#

DROP TABLE IF EXISTS `frameworks`;
CREATE TABLE `frameworks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "frameworks"
#

/*!40000 ALTER TABLE `frameworks` DISABLE KEYS */;
INSERT INTO `frameworks` VALUES (1,'laravelo',NULL,'2024-01-25 16:25:28'),(2,'Ruby on Rails',NULL,NULL),(3,'Spring',NULL,NULL),(4,'ASP.NET',NULL,NULL),(5,'Express.js',NULL,NULL),(6,'Angular',NULL,NULL),(7,'React.js',NULL,NULL),(8,'Vue.js',NULL,NULL),(9,'Laravel',NULL,NULL),(10,'Symfony',NULL,NULL),(11,'Flask',NULL,NULL),(12,'Express.js',NULL,NULL),(13,'Spring Boot',NULL,NULL),(14,'Flask',NULL,NULL),(15,'Ruby on Rails',NULL,NULL),(16,'ASP.NET Core',NULL,NULL),(17,'Django REST framework',NULL,NULL),(18,'Express.js',NULL,NULL),(19,'Flutter',NULL,NULL),(20,'React Native',NULL,NULL),(21,'Django',NULL,NULL),(22,'Ruby on Rails',NULL,NULL),(23,'Spring',NULL,NULL),(24,'ASP.NET',NULL,NULL),(25,'Express.js',NULL,NULL),(26,'Angular',NULL,NULL),(27,'React.js',NULL,NULL),(28,'Vue.js',NULL,NULL),(29,'Laravel',NULL,NULL),(30,'Symfony',NULL,NULL),(31,'Flask',NULL,NULL),(32,'Express.js',NULL,NULL),(33,'Spring Boot',NULL,NULL),(34,'Flask',NULL,NULL),(35,'Ruby on Rails',NULL,NULL),(36,'ASP.NET Core',NULL,NULL),(37,'Django REST framework',NULL,NULL),(38,'Express.js',NULL,NULL),(39,'Flutter',NULL,NULL),(40,'React Native',NULL,NULL),(41,'laravel','2024-01-25 15:38:38','2024-01-25 15:38:38'),(42,'Angular','2024-02-19 02:24:09','2024-02-19 02:24:09');
/*!40000 ALTER TABLE `frameworks` ENABLE KEYS */;

#
# Structure for table "languages"
#

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "languages"
#

/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'alberto','2024-02-28 20:32:03','2024-02-28 20:32:03',NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

#
# Structure for table "levels"
#

DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "levels"
#


#
# Structure for table "migrations"
#

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "migrations"
#

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (33,'2014_10_12_000000_create_users_table',1),(34,'2014_10_12_100000_create_password_resets_table',1),(35,'2016_06_01_000001_create_oauth_auth_codes_table',1),(36,'2016_06_01_000002_create_oauth_access_tokens_table',1),(37,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(38,'2016_06_01_000004_create_oauth_clients_table',1),(39,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(40,'2019_08_19_000000_create_failed_jobs_table',1),(41,'2019_12_14_000001_create_personal_access_tokens_table',1),(42,'2024_01_10_175312_create_languajes_table',1),(43,'2024_01_11_145402_create_votes_table',1),(44,'2024_01_11_145533_create_frameworks_table',1),(45,'2024_01_11_145726_create_publications_table',1),(46,'2024_01_11_145746_create_comments_table',1),(47,'2024_01_11_170020_update_users_table',1),(48,'2024_01_12_072021_update_publications_table',2),(50,'2024_02_16_022645_create_languages_table',3),(51,'2024_02_19_022644_drop_language_id_column_from_languages_table',4),(52,'2024_02_19_030214_update_languages_table',5),(53,'2024_02_21_011011_update_comments_table',6),(54,'2024_02_29_012847_update_users_table',7),(55,'2024_02_29_013757_update_users_table',8),(56,'2024_03_08_013009_create_levels_table',9),(57,'2024_03_08_065635_add_user_id_to_users_table',9),(58,'2024_03_08_194813_update_users_table',10),(59,'2024_03_08_195406_update_levels_table',11),(60,'2024_03_10_224633_update_users_table',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

#
# Structure for table "oauth_access_tokens"
#

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "oauth_access_tokens"
#

/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('01e08be64d8a2d65e0ba6760a7088ab0d005bd0062eb8205162811986e65628d30340c1bff254151',23,1,'authToken','[]',0,'2024-02-28 01:10:55','2024-02-28 01:10:55','2025-02-28 01:10:55'),('03182b51d0840e7b44b68623c88728d6b88ae4747164519c9aa89c37541e8cae8247ebf0ae39f0d5',31,1,'authToken','[]',0,'2024-03-12 02:59:03','2024-03-12 02:59:03','2025-03-12 02:59:03'),('1b11f0ffc936b16daa105b51ed6cfe7928464f26950b3b10480eb12929620916b88cd075ca361352',31,1,'authToken','[]',0,'2024-03-12 03:57:45','2024-03-12 03:57:45','2025-03-12 03:57:45'),('257d8ce82c9313f0a30f7fd9c85b0fa004950585c9552127bf5702d97e9f04654f388f6cd0b63bcd',23,1,'authToken','[]',0,'2024-02-28 18:48:31','2024-02-28 18:48:31','2025-02-28 18:48:31'),('3b1547622cbf80633667a2cebede2a47d39cd1db446dddf3f9db438902d74e596537c4a1a611017b',23,1,'authToken','[]',0,'2024-02-28 01:02:24','2024-02-28 01:02:24','2025-02-28 01:02:24'),('5dd99089b80a591cf9aaeef0b6abd1cb71048d14efc601d5bd54b2f2112545c8f82c867ef0d0baf6',31,1,'authToken','[]',0,'2024-03-12 04:03:38','2024-03-12 04:03:38','2025-03-12 04:03:38'),('65b6038567ad7f96fd2c8c5b38b0db0552d74d938c7ed0398d5f8492f34d82b7173082b9aa46dbe9',23,1,'authToken','[]',0,'2024-02-28 18:31:42','2024-02-28 18:31:42','2025-02-28 18:31:42'),('886e2c7c3b677224b1f2ab14632af098b867ce07b726fe86856654a79cd09abc6e07410141e2edaa',31,1,'authToken','[]',0,'2024-03-12 03:20:17','2024-03-12 03:20:17','2025-03-12 03:20:17'),('8c769c62c85fe7664eb0608f65c87957159f8cd3f52954e0ecb7c235c9ffec017a87352e67dda8ca',31,1,'authToken','[]',0,'2024-03-12 03:07:47','2024-03-12 03:07:47','2025-03-12 03:07:47'),('af3ff08926ea21a5f2cdf09f0f9f28b333b959af6f1202b1e3dbf065f946d6b83b8b3158a66b7686',31,1,'authToken','[]',0,'2024-03-12 18:36:39','2024-03-12 18:36:39','2025-03-12 18:36:39'),('bddad6adfbb58f148cc729fdad64b08cfadf177efd3de1b245e44c6a6e75c2b6938268285757d258',23,1,'authToken','[]',0,'2024-02-27 20:41:25','2024-02-27 20:41:25','2025-02-27 20:41:25'),('c2692a85d94a6086cf5c229d6299a1230a9d032c03ff0d4cb94736bbedffdd7a93a45e6a96355ed4',31,1,'authToken','[]',0,'2024-03-12 18:17:41','2024-03-12 18:17:41','2025-03-12 18:17:41'),('d140f3f2c9fe60504de381796c39e86b8fe8ccf06dc2deede098ec7d1e7775936e031ac39ee2a944',31,1,'authToken','[]',0,'2024-03-12 18:36:29','2024-03-12 18:36:29','2025-03-12 18:36:29'),('ffdb0e846f3e03958774650e90e32ad096b26d59cc502e72a6bd999fd6b970f442af4927f2a367f4',23,1,'authToken','[]',0,'2024-02-28 18:56:35','2024-02-28 18:56:35','2025-02-28 18:56:35');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

#
# Structure for table "oauth_auth_codes"
#

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "oauth_auth_codes"
#


#
# Structure for table "oauth_clients"
#

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "oauth_clients"
#

/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'code_galaxy Personal Access Client','h4TMJbA5te7NSJwt0KmT2QG5BUj9XYLGm8JWLwfM',NULL,'http://localhost',1,0,0,'2024-02-23 01:28:13','2024-02-23 01:28:13'),(2,NULL,'code_galaxy Password Grant Client','NkAggXpGnw28aqc7QXgvv1PUSKT8VAi02OJFz8b8','users','http://localhost',0,1,0,'2024-02-23 01:28:13','2024-02-23 01:28:13');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

#
# Structure for table "oauth_personal_access_clients"
#

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "oauth_personal_access_clients"
#

/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2024-02-23 01:28:13','2024-02-23 01:28:13');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

#
# Structure for table "oauth_refresh_tokens"
#

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "oauth_refresh_tokens"
#


#
# Structure for table "password_resets"
#

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "password_resets"
#


#
# Structure for table "personal_access_tokens"
#

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "personal_access_tokens"
#


#
# Structure for table "publications"
#

DROP TABLE IF EXISTS `publications`;
CREATE TABLE `publications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibily` tinyint(1) NOT NULL,
  `language_id` int NOT NULL,
  `vote_id` int NOT NULL,
  `framework_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `vote_range` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_comment_id` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "publications"
#

/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,'Publicación 1','2023-01-01',1,1,1,1,1,'2024-01-12 00:34:53','2024-01-12 00:34:53',13,'6'),(2,'Publicación 2','2023-01-02',1,2,2,2,2,'2024-01-12 00:34:53','2024-01-12 00:34:53',10,'2'),(3,'Publicación 3','2023-01-03',1,3,3,3,3,'2024-01-12 00:34:53','2024-01-12 00:34:53',9,'5'),(4,'Publicación 4','2023-01-04',1,4,4,4,4,'2024-01-12 00:34:53','2024-01-12 00:34:53',16,'6'),(5,'Publicación 5','2023-01-05',1,5,5,5,5,'2024-01-12 00:34:53','2024-01-12 00:34:53',10,'6'),(6,'Publicación 6','2023-01-06',1,6,6,6,6,'2024-01-12 00:34:53','2024-01-12 00:34:53',3,'2'),(7,'Publicación 7','2023-01-07',1,7,7,7,7,'2024-01-12 00:34:53','2024-01-12 00:34:53',4,'2'),(8,'Publicación 8','2023-01-08',1,8,8,8,8,'2024-01-12 00:34:53','2024-01-12 00:34:53',12,'2'),(9,'Publicación 9','2023-01-09',1,9,9,9,9,'2024-01-12 00:34:53','2024-01-12 00:34:53',7,'6'),(10,'Publicación 10','2023-01-10',1,10,10,10,10,'2024-01-12 00:34:53','2024-01-12 00:34:53',18,'10'),(11,'Publicación 11','2023-01-11',1,11,11,11,11,'2024-01-12 00:34:53','2024-01-12 00:34:53',9,'4'),(12,'Publicación 12','2023-01-12',1,12,12,12,12,'2024-01-12 00:34:53','2024-01-12 00:34:53',11,'10'),(13,'Publicación 13','2023-01-13',1,13,13,13,13,'2024-01-12 00:34:53','2024-01-12 00:34:53',7,'6'),(14,'Publicación 14','2023-01-14',1,14,14,14,14,'2024-01-12 00:34:53','2024-01-12 00:34:53',1,'1'),(15,'Publicación 15','2023-01-15',1,15,15,15,15,'2024-01-12 00:34:53','2024-01-12 00:34:53',5,'7'),(16,'Publicación 16','2023-01-16',1,16,16,16,16,'2024-01-12 00:34:53','2024-01-12 00:34:53',1,'1'),(17,'Publicación 17','2023-01-17',1,17,17,17,17,'2024-01-12 00:34:53','2024-01-12 00:34:53',8,'2'),(18,'Publicación 18','2023-01-18',1,18,18,18,18,'2024-01-12 00:34:53','2024-01-12 00:34:53',16,'8'),(19,'Publicación 19','2023-01-19',1,19,19,19,19,'2024-01-12 00:34:53','2024-01-12 00:34:53',16,'5'),(20,'Publicación 20','2023-01-20',1,20,20,20,20,'2024-01-12 00:34:53','2024-01-12 00:34:53',11,'10');
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `level_id` int NOT NULL DEFAULT '1',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'placeholder.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "users"
#

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'José',NULL,NULL,'jose.hernandez@example.com',NULL,'25aa34070a75ce79dcf2496484ad2301de3daa2b80581c9b265eaadb79685303',1,1,'jose.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',1),(2,'María',NULL,NULL,'maria.garcia@example.com',NULL,'1926cc5d3c74483db2814600b2a0b5e0913d48d038efc536c6dfcf7ab18d4675',1,1,'maria.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',2),(3,'alberto','rico','641623456','luisalberto@gmail.com',NULL,'$2y$10$dqxrwGEOF2NXmwKaN9N5cuexVdnxty6NK4bnNyzT51DiGgCRU.YSC',1,1,'sacad.jpg',NULL,'2024-02-08 09:30:26','2024-03-07 01:21:14',3),(4,'Guadalupe',NULL,NULL,'guadalupe.lopez@example.com',NULL,'dfb44795c3fc308c5fabce4a14d876a5bfd2f0a5b095f260db9258b79cbb6159',1,1,'guadalupe.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',4),(5,'Antonio',NULL,NULL,'antonio.gonzalez@example.com',NULL,'1b4b2c10238acd06ce8feb0995028558db9534b3efbc0c830ecc95c5c3163595',1,1,'antonio.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',5),(6,'Jesús',NULL,NULL,'jesus.rodriguez@example.com',NULL,'aa2097e6024286ea9a564488ae933f237d10570433c62a88864d03067f76f6a0',1,1,'jesus.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',6),(7,'Manuel',NULL,NULL,'manuel.perez@example.com',NULL,'d9c0597959cc91658dd19ed14f34fba3ed0a615152054626902bc12bb13f9835',1,1,'manuel.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',7),(8,'Francisco',NULL,NULL,'francisco.sanchez@example.com',NULL,'fbafb3b93a3033242d01e9d92bc45621125391806bbc578c3cc16b5ca00d2914',1,1,'francisco.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',8),(9,'Miguel',NULL,NULL,'miguel.ramirez@example.com',NULL,'492e46f0c3aee1ee56b1cd8ae297f09f433555c281662476d2c8ed04b95899a8',1,1,'miguel.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',9),(10,'Ana',NULL,NULL,'ana.torres@example.com',NULL,'d6b87aa0a76a42e8be13ff51f2c51ff066a56b31bfb0deab66ec20315f3d66c3',1,1,'ana.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',10),(11,'Luis',NULL,NULL,'luis.flores@example.com',NULL,'c124cc93e679f6e7d20d41bec71be3ca729e2cbf729931fdc14349e042287c2a',1,1,'luis.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',11),(12,'Pedro',NULL,NULL,'pedro.gomez@example.com',NULL,'b43604988463b002bb1723b04fc7651e68e8d52e0fa214af5ffba66900491357',1,1,'pedro.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',12),(13,'Carlos',NULL,NULL,'carlos.diaz@example.com',NULL,'eb02709c9efc175970bbf423238df68976540be34c0350eedebccb66d7127c2c',1,1,'carlos.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',13),(14,'Roberto',NULL,NULL,'roberto.vazquez@example.com',NULL,'be4eb918c6aa1ec1289e35c955d6d51ad77ed6d1a804b23dda1f0eacb1727c2d',1,1,'roberto.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',14),(15,'Alejandro',NULL,NULL,'alejandro.jimenez@example.com',NULL,'03698c8ed278500e4cadadd15b5093e65f7c3c768431179dd4e30e51cbdaf759',1,1,'alejandro.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',15),(16,'Ricardo',NULL,NULL,'ricardo.rojas@example.com',NULL,'a20512b3f573b74009f57e5929d54450f064cd6b543b790d5285a91371f0de44',1,1,'ricardo.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',16),(17,'Daniel',NULL,NULL,'daniel.medina@example.com',NULL,'5c191542af2e0911240d76323996496c035c0e460a076dd62fd3a535135e6d99',1,1,'daniel.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',17),(18,'Adriana',NULL,NULL,'adriana.castillo@example.com',NULL,'d2be6a2a2b8ea5e8ef3b23f87ab6fad6a4cac4b38fb1cae6fe85f52cff1e31e2',1,1,'adriana.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',18),(19,'Fernando',NULL,NULL,'fernando.guerrero@example.com',NULL,'a78823a0a0a089fa05a0f1bb4db14562e6256cf251f86f7f373e9f444dcceb68',1,1,'fernando.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',19),(20,'Sandra',NULL,NULL,'sandra.ortiz@example.com',NULL,'6312f3c8a78cb2e80f878232af733f841a6417c9f9738ef5a315fab65c6ed506',1,1,'sandra.jpg',NULL,'2024-02-08 09:30:26','2024-02-08 09:30:26',20),(21,'Nombre',NULL,NULL,'luis@gmail.com',NULL,'$2a$12$//jRB1.DlFkmn/lsKsZaXOZFyEkM/tYXsGYYThKUYULX3DyprMfFW\r\n$2a$12$//jRB1.DlFkmn/lsKsZaXOZFyEkM/tYXsGYYThKUYULX3DyprMfFW\r\n',1,1,'placeholder.png',NULL,'2024-02-27 13:06:51','2024-02-27 13:06:51',21),(22,'Luis',NULL,NULL,'Ricoj@gmail.com',NULL,'$2a$12$W.h.gxJY1nGs56ykaSt05eG3ce3KKg3WPUzmsNfKrwKqiLKbQ43kS\r\n',1,1,'placeholder.png',NULL,'2024-02-27 13:21:45','2024-02-27 13:21:45',22),(23,'Luis',NULL,NULL,'alberto@gmail.com',NULL,'$2a$12$t8Q1OlIBRgW0eDEqHFzTMe7px6Mo3JkVfD24uV1HuZAHpdk6F/bBi',1,1,' ',NULL,'2024-02-27 13:40:52','2024-02-27 13:40:52',23),(24,'albertoo','ricoiii','6416234565','luisal15berto@gmail.com',NULL,'$2y$10$IrSvtZIes.jFVuHiznr7SuLLH6mUOLGMu/P1svKAFzybxwQAURrE2',1,1,'sacad.jpg',NULL,'2024-03-07 01:29:28','2024-03-07 01:29:28',24),(25,'albertoo','ricoiiiss','6416234565','luisal15basaerto@gmail.com',NULL,'$2y$10$g7wvW1iifeAnlV9IlKNOt.0xDgLn7A6kc2YPN1aymMkxHNoeXeeDu',1,1,'sacad.jpg',NULL,'2024-03-07 01:31:07','2024-03-07 01:31:07',25),(26,'albertooe','ricoiiisss','641623456','luisal15baserto@gmail.com',NULL,'$2y$10$6lfc8TebK5zKf6vbPudfx.LoqQKKySshKI5nkGOUAhpdidzK3I9qq',1,1,'mifoto.jpg',NULL,'2024-03-10 22:08:17','2024-03-10 22:08:17',26),(27,'albertooesdsd','ricoiiisss','641623456','luisalsds15baserto@gmail.com',NULL,'$2y$10$Lnaqo1H2gqcXoPG9RkA8vOi5O3hIWgLqgLApEkclhyFjPcc5JWkua',1,1,'mifoto.jpg',NULL,'2024-03-11 15:26:49','2024-03-11 15:26:49',NULL),(28,'albertooesdsd','ricoi','64162345655','luisalsdbaserto@gmail.com',NULL,'$2y$10$hFSYR12mgsyqj57ICUBz6uxHochsjBmuIonAXr66vjoP4iPvfAcUy',1,1,'mifoto.jpg',NULL,'2024-03-12 02:20:13','2024-03-12 02:20:13',NULL),(29,'luis alberto','rico','6621536736','luis.1997@gmail.com',NULL,'$2y$10$xEZUMLsc/Lc96CPHJi2Erum13.BpdNSbr7j1KqOlE3hpnkCu2tZ72',1,1,'placeholder.png',NULL,'2024-03-12 02:43:34','2024-03-12 02:43:34',NULL),(30,'Panfilo','Meno','6621586935','Panfilo@gmail.com',NULL,'$2y$10$83PXmIvwApSk2VYXtbPArephTezdRAe1FCL5sbdqkTsLT1xFHusOy',1,1,'placeholder.png',NULL,'2024-03-12 02:50:00','2024-03-12 02:50:00',NULL),(31,'Antonio','Banderas','548861166','TonyMontana@gmail.com',NULL,'$2y$10$pUFVIKUNxVoN5EhuTKiVse34ECyARAmwp/81ugFdfCsbPQkyxlzuW',1,1,'placeholder.png',NULL,'2024-03-12 02:58:04','2024-03-12 02:58:04',NULL),(32,'Jose','Lopez','6612539436','Jose.Lopez@gmail.com',NULL,'$2y$10$vafEqeXTy2/Sv5RIV7J45O5qDvxslonf1OIwzdswl.fQAtINbrkq2',1,1,'placeholder.png',NULL,'2024-03-12 18:11:41','2024-03-12 18:11:41',NULL),(33,'monje','monje','846383838','monjemon@gmail.com',NULL,'$2y$10$TsqgcnHHn9jLcct7FEdBX.DblTcuVBzpe9QItL3jl9qF9ssuYCrjG',1,1,'placeholder.png',NULL,'2024-03-12 18:16:32','2024-03-12 18:16:32',NULL),(34,'Luis','Acuña','6622289926','luisf@gmail.com',NULL,'$2y$10$G84tEElvx1X8.lihV5QotuA3uRrYp0p91obh32R1knjdk23xsqvFK',1,1,'placeholder.png',NULL,'2024-03-12 18:28:00','2024-03-12 18:28:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

#
# Structure for table "votes"
#

DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `count` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "votes"
#

/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,1,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(2,2,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(3,3,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(4,4,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(5,5,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(6,6,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(7,7,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(8,8,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(9,9,'2024-01-17 22:29:22','2024-01-17 22:29:22'),(10,10,'2024-01-17 22:29:22','2024-01-17 22:29:22');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
