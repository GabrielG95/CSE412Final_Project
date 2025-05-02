-- MySQL dump 10.13  Distrib 8.0.41, for macos15.2 (arm64)
--
-- Host: database-1.cj42mqssetml.us-east-2.rds.amazonaws.com    Database: messaging_app
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add friend request',8,'add_friendrequest'),(30,'Can change friend request',8,'change_friendrequest'),(31,'Can delete friend request',8,'delete_friendrequest'),(32,'Can view friend request',8,'view_friendrequest'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add Thread',10,'add_thread'),(38,'Can change Thread',10,'change_thread'),(39,'Can delete Thread',10,'delete_thread'),(40,'Can view Thread',10,'view_thread'),(41,'Can add Message',11,'add_message'),(42,'Can change Message',11,'change_message'),(43,'Can delete Message',11,'delete_message'),(44,'Can view Message',11,'view_message'),(45,'Can add chat thread',12,'add_chatthread'),(46,'Can change chat thread',12,'change_chatthread'),(47,'Can delete chat thread',12,'delete_chatthread'),(48,'Can view chat thread',12,'view_chatthread');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$By08zzcHp4QlstggkQ7ZoA$Yv8+vIFucEumJMg8ZI+JV9GxQQsT9SvaQB5/CtvdX9Q=','2025-04-19 18:08:00.215645',0,'GabirelG','','','',0,1,'2025-04-19 18:07:58.424494'),(2,'pbkdf2_sha256$870000$lDxco36AgpuRayBTUX07rB$F/JgU1SlreFNyJvJn9/RYyNTPjbu8I+RjdvygWUGFzI=','2025-05-02 03:05:27.585871',0,'Gabriel_','','','',0,1,'2025-04-19 18:35:48.003062'),(3,'pbkdf2_sha256$870000$OA1oWX8UcFEFwFxBLs9Vqt$HbxgNOQrCuIvFC6Q39xhmu6cGap2HGjkhxQpkRL0ymg=','2025-05-02 03:03:34.804583',0,'Gbro_','','','',0,1,'2025-04-20 05:32:50.690274'),(4,'pbkdf2_sha256$870000$L7XmhrWKjQ54AUylssF28I$b/yUmRVoaUs2ALe2MjbG/tw8VyeBHDK5KtADLdwAcBE=','2025-04-23 06:41:48.358959',0,'New_User123','','','',0,1,'2025-04-21 22:39:19.890706');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chatthread`
--

DROP TABLE IF EXISTS `chat_chatthread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_chatthread` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_chatthread_created_by_id_4e7078c2_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `chat_chatthread_created_by_id_4e7078c2_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chatthread`
--

LOCK TABLES `chat_chatthread` WRITE;
/*!40000 ALTER TABLE `chat_chatthread` DISABLE KEYS */;
INSERT INTO `chat_chatthread` VALUES (1,'Linux','2025-05-01 18:43:36.348914',4),(2,'Gaming','2025-05-01 20:53:42.150102',4),(3,'Computers ','2025-05-01 20:57:27.311163',NULL),(4,'Keyboards','2025-05-02 16:10:41.493922',NULL);
/*!40000 ALTER TABLE `chat_chatthread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_friendrequest`
--

DROP TABLE IF EXISTS `chat_friendrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_friendrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_accepted` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_friendrequest_from_user_id_to_user_id_d4fea327_uniq` (`from_user_id`,`to_user_id`),
  KEY `chat_friendrequest_to_user_id_4fde5451_fk_auth_user_id` (`to_user_id`),
  CONSTRAINT `chat_friendrequest_from_user_id_6120ac7b_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `chat_friendrequest_to_user_id_4fde5451_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_friendrequest`
--

LOCK TABLES `chat_friendrequest` WRITE;
/*!40000 ALTER TABLE `chat_friendrequest` DISABLE KEYS */;
INSERT INTO `chat_friendrequest` VALUES (1,1,'2025-04-21 04:09:27.678862',2,3),(2,1,'2025-04-21 04:18:34.544967',3,2),(3,1,'2025-04-21 22:40:18.664521',3,4),(4,1,'2025-04-21 22:40:40.827724',4,3);
/*!40000 ALTER TABLE `chat_friendrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `author_id` int DEFAULT NULL,
  `date_posted` datetime(6) NOT NULL,
  `username` varchar(30) NOT NULL,
  `thread_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_message_author_id_923569d5_fk_auth_user_id` (`author_id`),
  KEY `chat_message_thread_id_6a43dfba_fk_chat_chatthread_id` (`thread_id`),
  CONSTRAINT `chat_message_author_id_923569d5_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `chat_message_thread_id_6a43dfba_fk_chat_chatthread_id` FOREIGN KEY (`thread_id`) REFERENCES `chat_chatthread` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (1,'asdfasdfasd',NULL,'2025-04-14 21:19:03.781222','Anonymous',NULL),(2,'asdfasdfasdfasdf',NULL,'2025-04-14 21:19:09.785581','Anonymous',NULL),(3,'asdfasdf',NULL,'2025-04-14 21:21:49.524833','Anonymous',NULL),(4,'asdfasdf',NULL,'2025-04-14 21:22:15.078007','Anonymous',NULL),(5,'asdf',NULL,'2025-04-14 21:22:19.388746','Anonymous',NULL),(6,'Hello, World!',NULL,'2025-04-14 21:22:28.511946','Anonymous',NULL),(7,'hello!!!',NULL,'2025-04-14 21:29:06.631537','Anonymous',NULL),(8,'What is going on ?',NULL,'2025-04-14 21:32:35.459509','Anonymous',NULL),(9,'Hello guys!',NULL,'2025-04-14 21:33:00.779726','Anonymous',NULL),(10,'asdf',NULL,'2025-04-14 21:38:04.553756','Anonymous',NULL),(11,'Sup!',NULL,'2025-04-14 21:38:18.679645','Anonymous',NULL),(12,'Hey!',NULL,'2025-04-14 21:41:05.034812','Anonymous',NULL),(13,'Not much!',NULL,'2025-04-14 21:41:24.538869','Anonymous',NULL),(14,'wby??',NULL,'2025-04-14 21:54:35.764452','Anonymous',NULL),(15,'Okay.....',NULL,'2025-04-14 21:57:26.187648','Anonymous',NULL),(16,'... ?',NULL,'2025-04-15 04:56:32.444282','Anonymous',NULL),(17,'What\'s with the dots ?',NULL,'2025-04-15 05:06:33.545580','Anonymous',NULL),(18,'Hello!',NULL,'2025-04-18 18:34:02.796310','Anonymous',NULL),(19,'What\'s going on ?',NULL,'2025-04-18 18:37:34.236665','Anonymous',NULL),(20,'Not much!!!',NULL,'2025-04-18 18:38:02.465176','Anonymous',NULL),(21,'What is going on with you ?',NULL,'2025-04-18 18:38:17.366611','Anonymous',NULL),(22,'Hey guys!',NULL,'2025-04-18 19:07:26.012102','Anonymous',NULL),(23,'Hey!',NULL,'2025-04-18 19:08:14.792038','Anonymous',NULL),(24,'k',NULL,'2025-04-18 19:12:10.400412','Anonymous',NULL),(25,'Hello!',NULL,'2025-04-18 19:19:57.794338','Anonymous',NULL),(26,'Hello!!',NULL,'2025-04-18 19:28:24.657074','adddd',NULL),(27,'Hey!',NULL,'2025-04-18 20:32:54.845675','adddd',NULL),(28,'What\'s going on ?',NULL,'2025-04-18 20:35:13.358814','Anonymous',NULL),(29,'Not much, you ?',NULL,'2025-04-18 20:35:32.324827','Billy Bob',NULL),(30,'Cool!',NULL,'2025-04-18 20:35:47.251032','Anonymous',NULL),(31,'Is this a random username ?',NULL,'2025-04-18 20:45:03.239994','wpLXO96816',NULL),(32,'Making sure random username didn\'t get saved.',NULL,'2025-04-18 20:47:42.887638','wpLXO96816',NULL),(33,'Checking again....',NULL,'2025-04-18 20:48:01.908458','wpLXO96816',NULL),(34,'??',NULL,'2025-04-18 20:51:27.866974','Anonymous',NULL),(35,'?_?',NULL,'2025-04-18 20:51:41.664804','mfsML68114',NULL),(36,'Random gone ?',NULL,'2025-04-18 20:52:04.796090','mfsML68114',NULL),(37,'dd',NULL,'2025-04-18 20:52:41.387402','Anonymous',NULL),(38,'Testing cache clearing',NULL,'2025-04-18 20:55:09.032565','Anonymous',NULL),(39,'Random username chatting.',NULL,'2025-04-18 20:55:26.948293','hsGHf64068',NULL),(40,'After clicking back button, making sure random username is cleared.',NULL,'2025-04-18 20:55:53.468058','Anonymous',NULL),(41,'Checking Login username info',2,'2025-04-19 18:36:04.103713','Gabriel_',NULL),(42,'Testing login with a redirect to home page..',2,'2025-04-19 18:49:45.820260','Gabriel_',NULL),(43,'Hello, I\'m a random user!',NULL,'2025-04-19 22:58:24.430535','Random_user123',NULL),(44,'Hello, I\'m a random generated username!',NULL,'2025-04-19 22:58:54.852946','jsZfg84941',NULL),(45,'Checking other created username.',3,'2025-04-20 05:33:08.754722','Gbro_',NULL),(46,'Testing different user logins to add as friend.',2,'2025-04-20 22:56:04.769133','Gabriel_',NULL),(47,'Hello ?',2,'2025-04-20 23:12:22.028216','Gabriel_',NULL),(48,'Test, test',2,'2025-04-20 23:43:39.226091','Gabriel_',NULL),(49,'Hello, I\'m a new user.',4,'2025-04-21 22:39:42.176920','New_User123',NULL),(50,'Test adding new user as a friend.',3,'2025-04-21 22:40:03.968256','Gbro_',NULL),(51,'Testing username color change feature.',4,'2025-04-21 22:44:53.904721','New_User123',NULL),(52,'Testing username color change.',4,'2025-04-21 23:01:28.266941','New_User123',NULL),(53,'Making sure everything is working thus far..',4,'2025-04-23 06:44:32.097228','New_User123',NULL),(54,'Testing created user, making sure logged in user can\'t try to add as a friend.',NULL,'2025-04-23 16:45:26.149097','created_username123',NULL),(55,'Random user, making sure logged in user can\'t try to add as a friend.',NULL,'2025-04-23 16:58:56.381136','dINjq34978',NULL),(56,'Test, test',NULL,'2025-04-23 17:44:01.975463','dINjq34978',NULL),(57,'Logged in user, running another test...',4,'2025-04-26 19:19:35.312455','New_User123',NULL),(58,'Hello, I like Linux. ',4,'2025-05-01 18:49:01.101605','New_User123',1),(59,'I too like Linux, I currently have Fedora 40 installed on another machine. ',NULL,'2025-05-01 18:49:31.433621','Anonymous',1),(60,'Hello?',4,'2025-05-01 20:14:05.465371','New_User123',1),(61,'Hello?',4,'2025-05-01 20:14:28.575126','New_User123',1),(62,'Testing real time update ',4,'2025-05-01 20:18:04.829922','New_User123',1),(63,'What games do you like ?',4,'2025-05-01 20:56:20.102397','New_User123',2),(64,'Do you like computers ?',4,'2025-05-01 23:26:13.384383','New_User123',3),(65,'Testing thread with two logged in users. ',3,'2025-05-02 03:04:16.325506','Gbro_',3),(66,'Hello ?',2,'2025-05-02 03:05:42.170653','Gabriel_',3),(67,'Testing name color change.',2,'2025-05-02 16:09:55.351248','Gabriel_',NULL);
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_profile`
--

DROP TABLE IF EXISTS `chat_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username_color` varchar(30) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `chat_profile_user_id_2bc96f8e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_profile`
--

LOCK TABLES `chat_profile` WRITE;
/*!40000 ALTER TABLE `chat_profile` DISABLE KEYS */;
INSERT INTO `chat_profile` VALUES (1,'#008000',4),(2,'#ff0000',3),(3,'#800080',2);
/*!40000 ALTER TABLE `chat_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_ai_assistant_message`
--

DROP TABLE IF EXISTS `django_ai_assistant_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_ai_assistant_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` json NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `thread_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_ai_assistant__thread_id_d4b13e0d_fk_django_ai` (`thread_id`),
  KEY `message_created_at` (`created_at`),
  CONSTRAINT `django_ai_assistant__thread_id_d4b13e0d_fk_django_ai` FOREIGN KEY (`thread_id`) REFERENCES `django_ai_assistant_thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_ai_assistant_message`
--

LOCK TABLES `django_ai_assistant_message` WRITE;
/*!40000 ALTER TABLE `django_ai_assistant_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_ai_assistant_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_ai_assistant_thread`
--

DROP TABLE IF EXISTS `django_ai_assistant_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_ai_assistant_thread` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `assistant_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_ai_assistant__created_by_id_fd2487da_fk_auth_user` (`created_by_id`),
  KEY `thread_created_at_desc` (`created_at` DESC),
  CONSTRAINT `django_ai_assistant__created_by_id_fd2487da_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_ai_assistant_thread`
--

LOCK TABLES `django_ai_assistant_thread` WRITE;
/*!40000 ALTER TABLE `django_ai_assistant_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_ai_assistant_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'chat','chatthread'),(8,'chat','friendrequest'),(7,'chat','message'),(9,'chat','profile'),(5,'contenttypes','contenttype'),(11,'django_ai_assistant','message'),(10,'django_ai_assistant','thread'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-22 07:13:15.608221'),(2,'auth','0001_initial','2025-03-22 07:13:18.479149'),(3,'admin','0001_initial','2025-03-22 07:13:19.224509'),(4,'admin','0002_logentry_remove_auto_add','2025-03-22 07:13:19.383000'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-22 07:13:19.607067'),(6,'contenttypes','0002_remove_content_type_name','2025-03-22 07:13:20.212983'),(7,'auth','0002_alter_permission_name_max_length','2025-03-22 07:13:20.578108'),(8,'auth','0003_alter_user_email_max_length','2025-03-22 07:13:20.805215'),(9,'auth','0004_alter_user_username_opts','2025-03-22 07:13:20.956247'),(10,'auth','0005_alter_user_last_login_null','2025-03-22 07:13:21.304953'),(11,'auth','0006_require_contenttypes_0002','2025-03-22 07:13:21.447093'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-22 07:13:21.623937'),(13,'auth','0008_alter_user_username_max_length','2025-03-22 07:13:21.922699'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-22 07:13:22.215900'),(15,'auth','0010_alter_group_name_max_length','2025-03-22 07:13:22.450833'),(16,'auth','0011_update_proxy_permissions','2025-03-22 07:13:22.882518'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-22 07:13:23.257705'),(18,'sessions','0001_initial','2025-03-22 07:13:23.721788'),(19,'chat','0001_initial','2025-03-22 20:18:34.751687'),(20,'chat','0002_remove_message_receiver_remove_message_sender_and_more','2025-04-14 21:18:46.114931'),(21,'chat','0003_message_username','2025-04-18 19:24:00.743228'),(22,'chat','0004_friendrequest','2025-04-21 04:09:00.941292'),(23,'chat','0005_profile','2025-04-21 20:45:46.848591'),(24,'django_ai_assistant','0001_initial','2025-04-26 20:08:06.260554'),(25,'django_ai_assistant','0002_assistant_cls_synced_at_assistant_openai_synced_at','2025-04-26 20:08:06.537665'),(26,'django_ai_assistant','0003_message_delete_assistant_remove_thread_openai_id_and_more','2025-04-26 20:08:07.252430'),(27,'django_ai_assistant','0004_remove_message_message_created_at_desc_and_more','2025-04-26 20:08:07.497412'),(28,'django_ai_assistant','0005_alter_message_options','2025-04-26 20:08:07.576313'),(29,'django_ai_assistant','0006_thread_assistant_id','2025-04-26 20:08:07.833843'),(30,'chat','0006_chatthread_message_thread','2025-05-01 17:36:46.831355'),(31,'chat','0007_alter_chatthread_created_by','2025-05-01 20:57:12.228134');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('b1dg77vapj6e6had2a3nzt1x3nukfg7o','.eJxVjDsOwjAQBe_iGln2ruMPJT1niNbeNQ6gRMqnQtwdIqWA9s3Me6metrX12yJzP7A6K6dOv1um8pBxB3yn8TbpMo3rPGS9K_qgi75OLM_L4f4dNFrat47BFAyQnHAmcogoXbYVCnhB4QIusVhrwDsG7GqO1hckk6IJNWFV7w_fnTeb:1u7Tno:XIE7uzSL40J-ctGernwoetfU7YhaNbsDBwBgkAnzsFU','2025-05-07 06:41:48.435631');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02  9:38:15
