-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user info',7,'add_userinfo'),(26,'Can change user info',7,'change_userinfo'),(27,'Can delete user info',7,'delete_userinfo'),(28,'Can view user info',7,'view_userinfo'),(29,'Can add address',8,'add_address'),(30,'Can change address',8,'change_address'),(31,'Can delete address',8,'delete_address'),(32,'Can view address',8,'view_address'),(33,'Can add goods',9,'add_goods'),(34,'Can change goods',9,'change_goods'),(35,'Can delete goods',9,'delete_goods'),(36,'Can view goods',9,'view_goods'),(37,'Can add goods capacity',10,'add_goodscapacity'),(38,'Can change goods capacity',10,'change_goodscapacity'),(39,'Can delete goods capacity',10,'delete_goodscapacity'),(40,'Can view goods capacity',10,'view_goodscapacity'),(41,'Can add goods colors picture',11,'add_goodscolorspicture'),(42,'Can change goods colors picture',11,'change_goodscolorspicture'),(43,'Can delete goods colors picture',11,'delete_goodscolorspicture'),(44,'Can view goods colors picture',11,'view_goodscolorspicture'),(45,'Can add goods species',12,'add_goodsspecies'),(46,'Can change goods species',12,'change_goodsspecies'),(47,'Can delete goods species',12,'delete_goodsspecies'),(48,'Can view goods species',12,'view_goodsspecies'),(49,'Can add slideshow picture',13,'add_slideshowpicture'),(50,'Can change slideshow picture',13,'change_slideshowpicture'),(51,'Can delete slideshow picture',13,'delete_slideshowpicture'),(52,'Can view slideshow picture',13,'view_slideshowpicture'),(53,'Can add goods repertory',14,'add_goodsrepertory'),(54,'Can change goods repertory',14,'change_goodsrepertory'),(55,'Can delete goods repertory',14,'delete_goodsrepertory'),(56,'Can view goods repertory',14,'view_goodsrepertory'),(57,'Can add goods details',15,'add_goodsdetails'),(58,'Can change goods details',15,'change_goodsdetails'),(59,'Can delete goods details',15,'delete_goodsdetails'),(60,'Can view goods details',15,'view_goodsdetails');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$6w85NpFxMMUZlhxMbTn5lP$6tcSf5JeW+MyhKaIY872gMKeDQwRG9eQ9LCdzx1dByw=','2021-07-22 06:26:55.721870',1,'djg','','','',1,1,'2021-07-22 06:26:48.696979');
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-07-22 06:27:05.584729','1','苹果',1,'[{\"added\": {}}]',12,1),(2,'2021-07-22 06:27:08.111428','2','华为',1,'[{\"added\": {}}]',12,1),(3,'2021-07-22 06:27:12.226410','3','vivo',1,'[{\"added\": {}}]',12,1),(4,'2021-07-22 06:27:15.436653','4','小米',1,'[{\"added\": {}}]',12,1),(5,'2021-07-22 06:27:17.957607','5','oppo',1,'[{\"added\": {}}]',12,1),(6,'2021-07-22 06:27:21.098532','6','魅族',1,'[{\"added\": {}}]',12,1),(7,'2021-07-22 06:29:31.952126','1','iPhone SE',1,'[{\"added\": {}}]',9,1),(8,'2021-07-22 06:30:07.835362','2','iPhone 11 Pro',1,'[{\"added\": {}}]',9,1),(9,'2021-07-22 06:30:34.447528','3','iPhone 11',1,'[{\"added\": {}}]',9,1),(10,'2021-07-22 06:31:09.133649','4','iPhone 12 mini',1,'[{\"added\": {}}]',9,1),(11,'2021-07-22 06:32:00.983073','5','iPhone 12',1,'[{\"added\": {}}]',9,1),(12,'2021-07-22 06:33:14.997581','6','HUAWEI Mate X2',1,'[{\"added\": {}}]',9,1),(13,'2021-07-22 06:33:37.792090','7','HUAWEI Mate 30E Pro',1,'[{\"added\": {}}]',9,1),(14,'2021-07-22 06:34:12.000392','8','HUAWEI Mate 40 Pro',1,'[{\"added\": {}}]',9,1),(15,'2021-07-22 06:34:59.805462','9','HUAWEI Mate 40 RS',1,'[{\"added\": {}}]',9,1),(16,'2021-07-22 06:35:43.696997','10','HUAWEI nova 7 Pro',1,'[{\"added\": {}}]',9,1),(17,'2021-07-22 06:36:47.854078','11','魅族17 Pro',1,'[{\"added\": {}}]',9,1),(18,'2021-07-22 06:37:14.201107','12','魅族17',1,'[{\"added\": {}}]',9,1),(19,'2021-07-22 06:37:36.580614','13','魅族18 Pro',1,'[{\"added\": {}}]',9,1),(20,'2021-07-22 06:37:52.098986','14','魅族18',1,'[{\"added\": {}}]',9,1),(21,'2021-07-22 06:38:29.922186','15','Redmi K40 Pro',1,'[{\"added\": {}}]',9,1),(22,'2021-07-22 06:38:56.595163','16','Redmi K40',1,'[{\"added\": {}}]',9,1),(23,'2021-07-22 06:39:22.674854','17','Redmi Note 9 Pro',1,'[{\"added\": {}}]',9,1),(24,'2021-07-22 06:40:13.594371','18','Redmi Note 9',1,'[{\"added\": {}}]',9,1),(25,'2021-07-22 06:40:46.082753','19','Redmi Note 10 Pro',1,'[{\"added\": {}}]',9,1),(26,'2021-07-22 06:41:55.813274','20','vivo S9e',1,'[{\"added\": {}}]',9,1),(27,'2021-07-22 06:42:25.153952','21','vivo S9',1,'[{\"added\": {}}]',9,1),(28,'2021-07-22 06:43:02.921654','22','vivo X60 Pro+',1,'[{\"added\": {}}]',9,1),(29,'2021-07-22 06:43:18.404655','23','vivo X60 Pro',1,'[{\"added\": {}}]',9,1),(30,'2021-07-22 06:43:37.556094','24','vivo X60',1,'[{\"added\": {}}]',9,1),(31,'2021-07-22 06:44:22.419325','25','OPPO A93',1,'[{\"added\": {}}]',9,1),(32,'2021-07-22 06:44:53.316747','26','OPPO Find X3',1,'[{\"added\": {}}]',9,1),(33,'2021-07-22 06:45:26.058575','27','OPPO K7x',1,'[{\"added\": {}}]',9,1),(34,'2021-07-22 06:46:06.457480','28','OPPO K9',1,'[{\"added\": {}}]',9,1),(35,'2021-07-22 06:46:38.790779','29','OPPO Reno4 SE',1,'[{\"added\": {}}]',9,1),(36,'2021-07-22 06:47:01.550333','1','6+128GB',1,'[{\"added\": {}}]',10,1),(37,'2021-07-22 06:47:05.347410','2','8+128GB',1,'[{\"added\": {}}]',10,1),(38,'2021-07-22 06:47:09.322903','3','8+256GB',1,'[{\"added\": {}}]',10,1),(39,'2021-07-22 06:47:13.040656','4','8+512GB',1,'[{\"added\": {}}]',10,1),(40,'2021-07-22 06:47:16.244631','5','12+256GB',1,'[{\"added\": {}}]',10,1),(41,'2021-07-22 06:49:00.286589','1','iPhone SE 白色',1,'[{\"added\": {}}]',11,1),(42,'2021-07-22 06:49:27.758313','2','iPhone SE 红色',1,'[{\"added\": {}}]',11,1),(43,'2021-07-22 06:49:52.359265','3','iPhone SE 黑色',1,'[{\"added\": {}}]',11,1),(44,'2021-07-22 06:50:17.383640','4','iPhone 11 Pro Max 暗夜绿色',1,'[{\"added\": {}}]',11,1),(45,'2021-07-22 06:50:34.906250','5','iPhone 11 Pro Max 深空灰色',1,'[{\"added\": {}}]',11,1),(46,'2021-07-22 06:50:57.350590','6','iPhone 11 Pro Max 金色',1,'[{\"added\": {}}]',11,1),(47,'2021-07-22 06:51:25.735848','7','iPhone 11 Pro 暗夜绿色',1,'[{\"added\": {}}]',11,1),(48,'2021-07-22 06:52:01.113380','8','iPhone 11 Pro 深空灰色',1,'[{\"added\": {}}]',11,1),(49,'2021-07-22 06:52:27.159038','9','iPhone 11 Pro 金色',1,'[{\"added\": {}}]',11,1),(50,'2021-07-22 06:52:50.716284','10','iPhone 11 白色',1,'[{\"added\": {}}]',11,1),(51,'2021-07-22 06:53:09.943614','11','iPhone 11 紫色',1,'[{\"added\": {}}]',11,1),(52,'2021-07-22 06:53:44.001639','12','iPhone 11 红色',1,'[{\"added\": {}}]',11,1),(53,'2021-07-22 06:54:16.887401','13','iPhone 12 mini 白色',1,'[{\"added\": {}}]',11,1),(54,'2021-07-22 06:54:34.656808','14','iPhone 12 mini 紫色',1,'[{\"added\": {}}]',11,1),(55,'2021-07-22 06:54:53.464898','15','iPhone 12 mini 红色',1,'[{\"added\": {}}]',11,1),(56,'2021-07-22 06:55:22.935287','16','HUAWEI Mate X2 亮黑色',1,'[{\"added\": {}}]',11,1),(57,'2021-07-22 06:55:56.512415','17','HUAWEI Mate X2 冰晶粉',1,'[{\"added\": {}}]',11,1),(58,'2021-07-22 06:56:16.636249','18','HUAWEI Mate X2 冰晶蓝',1,'[{\"added\": {}}]',11,1),(59,'2021-07-22 06:56:39.094972','19','HUAWEI Mate 30E Pro 丹霞橙',1,'[{\"added\": {}}]',11,1),(60,'2021-07-22 06:57:12.987672','20','HUAWEI Mate 30E Pro 亮黑色',1,'[{\"added\": {}}]',11,1),(61,'2021-07-22 06:57:32.200382','21','HUAWEI Mate 30E Pro 星河银',1,'[{\"added\": {}}]',11,1),(62,'2021-07-22 06:57:55.037035','22','HUAWEI Mate 40 Pro 亮黑色',1,'[{\"added\": {}}]',11,1),(63,'2021-07-22 06:58:14.457226','23','HUAWEI Mate 40 Pro 夏日胡杨',1,'[{\"added\": {}}]',11,1),(64,'2021-07-22 06:58:30.118137','24','HUAWEI Mate 40 Pro 秋日胡杨',1,'[{\"added\": {}}]',11,1),(65,'2021-07-22 06:59:13.822400','25','HUAWEI Mate 40 RS 陶瓷白',1,'[{\"added\": {}}]',11,1),(66,'2021-07-22 06:59:28.541204','26','HUAWEI Mate 40 RS 陶瓷黑',1,'[{\"added\": {}}]',11,1),(67,'2021-07-22 06:59:48.342706','27','HUAWEI nova 7 Pro 亮黑色',1,'[{\"added\": {}}]',11,1),(68,'2021-07-22 07:00:09.892856','28','HUAWEI nova 7 Pro 仲夏紫',1,'[{\"added\": {}}]',11,1),(69,'2021-07-22 07:00:29.838359','29','HUAWEI nova 7 Pro 密语红',1,'[{\"added\": {}}]',11,1),(70,'2021-07-22 07:01:02.401146','30','魅族17 Pro 乌金',1,'[{\"added\": {}}]',11,1),(71,'2021-07-22 07:01:16.954550','31','魅族17 Pro 定白',1,'[{\"added\": {}}]',11,1),(72,'2021-07-22 07:01:31.676012','32','魅族17 十七度灰',1,'[{\"added\": {}}]',11,1),(73,'2021-07-22 07:01:51.843810','33','魅族17 星际灰',1,'[{\"added\": {}}]',11,1),(74,'2021-07-22 07:02:08.546556','34','魅族17 松深入墨',1,'[{\"added\": {}}]',11,1),(75,'2021-07-22 07:02:30.230488','35','魅族 18 Pro 苍穹浩瀚',1,'[{\"added\": {}}]',11,1),(76,'2021-07-22 07:02:47.080079','36','魅族 18 Pro 银河秘境',1,'[{\"added\": {}}]',11,1),(77,'2021-07-22 07:03:04.312023','37','魅族 18 Pro 飞雪流光',1,'[{\"added\": {}}]',11,1),(78,'2021-07-22 07:03:19.903069','38','魅族 18 渡海',1,'[{\"added\": {}}]',11,1),(79,'2021-07-22 07:03:32.668980','39','魅族 18 等风',1,'[{\"added\": {}}]',11,1),(80,'2021-07-22 07:03:46.914364','40','魅族 18 踏雪',1,'[{\"added\": {}}]',11,1),(81,'2021-07-22 07:04:06.465297','41','OPPO A93 极光',1,'[{\"added\": {}}]',11,1),(82,'2021-07-22 07:04:20.451693','42','OPPO A93 炫黑',1,'[{\"added\": {}}]',11,1),(83,'2021-07-22 07:04:33.010800','43','OPPO A93 雅银',1,'[{\"added\": {}}]',11,1),(84,'2021-07-22 07:05:07.198790','44','OPPO Find X3 凝白',1,'[{\"added\": {}}]',11,1),(85,'2021-07-22 07:05:29.033318','45','OPPO Find X3 镜黑',1,'[{\"added\": {}}]',11,1),(86,'2021-07-22 07:05:50.803021','46','OPPO Find X3 雾蓝',1,'[{\"added\": {}}]',11,1),(87,'2021-07-22 07:06:48.875529','47','OPPO K7x 云之彼端',1,'[{\"added\": {}}]',11,1),(88,'2021-07-22 07:07:21.985426','48','OPPO K7x 蓝影',1,'[{\"added\": {}}]',11,1),(89,'2021-07-22 07:07:44.174975','49','OPPO K7x 黑镜',1,'[{\"added\": {}}]',11,1),(90,'2021-07-22 07:08:13.168692','50','OPPO K9 幻彩之翼',1,'[{\"added\": {}}]',11,1),(91,'2021-07-22 07:08:56.014957','51','OPPO K9 黑桃',1,'[{\"added\": {}}]',11,1),(92,'2021-07-22 07:09:27.575954','52','OPPO Reno4 SE 超闪白',1,'[{\"added\": {}}]',11,1),(93,'2021-07-22 07:09:43.639114','53','OPPO Reno4 SE 超闪蓝',1,'[{\"added\": {}}]',11,1),(94,'2021-07-22 07:21:57.314393','54','OPPO Reno4 SE 超闪黑',1,'[{\"added\": {}}]',11,1),(95,'2021-07-22 07:22:36.505276','55','vivo S9 印象拾光',1,'[{\"added\": {}}]',11,1),(96,'2021-07-22 07:22:52.670929','56','vivo S9 子夜蓝',1,'[{\"added\": {}}]',11,1),(97,'2021-07-22 07:23:31.962495','57','vivo S9 朝露白',1,'[{\"added\": {}}]',11,1),(98,'2021-07-22 07:24:02.036169','58','vivo S9e 星夜极光',1,'[{\"added\": {}}]',11,1),(99,'2021-07-22 07:24:27.112846','59','vivo S9e 水光晶钻',1,'[{\"added\": {}}]',11,1),(100,'2021-07-22 07:24:56.444401','60','vivo X60 Pro+ 深海蓝',1,'[{\"added\": {}}]',11,1),(101,'2021-07-22 07:25:17.748635','61','vivo X60 Pro+ 经典橙',1,'[{\"added\": {}}]',11,1),(102,'2021-07-22 07:25:36.279197','62','vivo X60 Pro 华彩',1,'[{\"added\": {}}]',11,1),(103,'2021-07-22 07:25:50.141319','63','vivo X60 Pro 原力',1,'[{\"added\": {}}]',11,1),(104,'2021-07-22 07:26:11.224285','64','vivo X60 华彩',1,'[{\"added\": {}}]',11,1),(105,'2021-07-22 07:26:25.941207','65','vivo/vivo X60 原力',1,'[{\"added\": {}}]',11,1),(106,'2021-07-22 07:26:46.742875','66','Redmi K40 Pro 墨羽',1,'[{\"added\": {}}]',11,1),(107,'2021-07-22 07:27:04.810513','67','Redmi K40 Pro 幻境',1,'[{\"added\": {}}]',11,1),(108,'2021-07-22 07:27:22.158794','68','Redmi K40游戏增强版 光刃',1,'[{\"added\": {}}]',11,1),(109,'2021-07-22 07:27:45.231920','69','Redmi K40游戏增强版 暗影',1,'[{\"added\": {}}]',11,1),(110,'2021-07-22 07:28:05.280708','70','Redmi Note 9 Pro 湖光秋色',1,'[{\"added\": {}}]',11,1),(111,'2021-07-22 07:28:20.566176','71','Redmi Note 9 Pro 碧海星辰',1,'[{\"added\": {}}]',11,1),(112,'2021-07-22 07:28:41.073056','72','Redmi Note 9 云墨灰',1,'[{\"added\": {}}]',11,1),(113,'2021-07-22 07:29:14.231455','73','Redmi Note 9 流影紫',1,'[{\"added\": {}}]',11,1),(114,'2021-07-22 07:29:36.099606','74','Redmi Note 10 Pro 幻青',1,'[{\"added\": {}}]',11,1),(115,'2021-07-22 07:29:59.570801','75','Redmi Note 10 Pro 星纱',1,'[{\"added\": {}}]',11,1),(116,'2021-07-22 07:31:58.257292','1','剩余32',1,'[{\"added\": {}}]',14,1),(117,'2021-07-22 07:32:21.474769','2','剩余34',1,'[{\"added\": {}}]',14,1),(118,'2021-07-22 07:32:43.714243','3','剩余32',1,'[{\"added\": {}}]',14,1),(119,'2021-07-22 07:40:34.265523','4','手机iPhone 11 Pro，剩余43，价格￥3453，颜色iPhone 11 Pro Max 暗夜绿色',1,'[{\"added\": {}}]',14,1),(120,'2021-07-22 07:41:03.539911','5','手机iPhone 11 Pro，剩余35，价格￥5364，颜色iPhone 11 Pro Max 深空灰色',1,'[{\"added\": {}}]',14,1),(121,'2021-07-22 07:41:21.748714','6','手机iPhone 11 Pro，剩余43，价格￥4353，颜色iPhone 11 Pro Max 金色',1,'[{\"added\": {}}]',14,1),(122,'2021-07-22 07:42:24.910269','7','手机iPhone 11，剩余43，价格￥4334，颜色iPhone 11 白色',1,'[{\"added\": {}}]',14,1),(123,'2021-07-22 07:42:45.268627','8','手机iPhone 11，剩余23，价格￥3454，颜色iPhone 11 紫色',1,'[{\"added\": {}}]',14,1),(124,'2021-07-22 07:43:04.573425','9','手机iPhone 11，剩余32，价格￥2332，颜色iPhone 11 红色',1,'[{\"added\": {}}]',14,1),(125,'2021-07-22 07:43:41.943966','6','手机iPhone 11 Pro，剩余43，价格￥4353，颜色iPhone 11 Pro 暗夜绿色',2,'[{\"changed\": {\"fields\": [\"\\u624b\\u673a\\u989c\\u8272id\\u5916\\u952e\"]}}]',14,1),(126,'2021-07-22 07:43:53.879838','5','手机iPhone 11 Pro，剩余35，价格￥5364，颜色iPhone 11 Pro 深空灰色',2,'[{\"changed\": {\"fields\": [\"\\u624b\\u673a\\u989c\\u8272id\\u5916\\u952e\"]}}]',14,1),(127,'2021-07-22 07:44:11.003884','4','手机iPhone 11 Pro，剩余43，价格￥3453，颜色iPhone 11 Pro 金色',2,'[{\"changed\": {\"fields\": [\"\\u624b\\u673a\\u989c\\u8272id\\u5916\\u952e\"]}}]',14,1),(128,'2021-07-22 07:45:35.629562','10','手机iPhone 12 mini，剩余43，价格￥4334，颜色iPhone 12 mini 白色',1,'[{\"added\": {}}]',14,1),(129,'2021-07-22 07:45:57.735037','11','手机iPhone 12 mini，剩余43，价格￥4334，颜色iPhone 12 mini 紫色',1,'[{\"added\": {}}]',14,1),(130,'2021-07-22 07:46:21.421660','12','手机iPhone 12 mini，剩余23，价格￥2354，颜色iPhone 12 mini 红色',1,'[{\"added\": {}}]',14,1),(131,'2021-07-22 07:46:46.500381','13','手机iPhone 12 mini，剩余32，价格￥3245，颜色iPhone 12 mini 红色',1,'[{\"added\": {}}]',14,1),(132,'2021-07-22 07:49:05.594652','14','手机HUAWEI Mate X2，剩余34，价格￥3243，颜色HUAWEI Mate X2 亮黑色',1,'[{\"added\": {}}]',14,1),(133,'2021-07-22 07:49:55.088908','15','手机HUAWEI Mate X2，剩余23，价格￥4334，颜色HUAWEI Mate X2 冰晶粉',1,'[{\"added\": {}}]',14,1),(134,'2021-07-22 07:50:19.117977','16','手机HUAWEI Mate 30E Pro，剩余23，价格￥5234，颜色HUAWEI Mate 30E Pro 丹霞橙',1,'[{\"added\": {}}]',14,1),(135,'2021-07-22 07:50:34.339701','17','手机HUAWEI Mate 30E Pro，剩余23，价格￥6542，颜色HUAWEI Mate 30E Pro 星河银',1,'[{\"added\": {}}]',14,1),(136,'2021-07-22 07:50:58.154336','18','手机魅族17 Pro，剩余23，价格￥4353，颜色魅族17 Pro 乌金',1,'[{\"added\": {}}]',14,1),(137,'2021-07-22 07:51:17.252904','19','手机魅族17 Pro，剩余23，价格￥4323，颜色魅族17 Pro 定白',1,'[{\"added\": {}}]',14,1),(138,'2021-07-22 07:51:46.120082','20','手机魅族18 Pro，剩余23，价格￥2354，颜色魅族 18 Pro 银河秘境',1,'[{\"added\": {}}]',14,1),(139,'2021-07-22 07:52:44.767180','21','手机魅族18，剩余23，价格￥4356，颜色魅族 18 等风',1,'[{\"added\": {}}]',14,1),(140,'2021-07-22 07:53:19.926183','22','手机Redmi K40 Pro，剩余23，价格￥3253，颜色Redmi K40 Pro 墨羽',1,'[{\"added\": {}}]',14,1),(141,'2021-07-22 07:53:44.651840','23','手机Redmi K40，剩余32，价格￥2345，颜色Redmi K40游戏增强版 暗影',1,'[{\"added\": {}}]',14,1),(142,'2021-07-22 07:54:38.142763','24','手机Redmi Note 10 Pro，剩余23，价格￥6544，颜色Redmi Note 10 Pro 幻青',1,'[{\"added\": {}}]',14,1),(143,'2021-07-22 07:55:29.558731','25','手机Redmi Note 9 Pro，剩余12，价格￥4565，颜色Redmi Note 9 Pro 湖光秋色',1,'[{\"added\": {}}]',14,1),(144,'2021-07-22 07:55:56.692514','26','手机vivo S9e，剩余32，价格￥5435，颜色vivo S9e 星夜极光',1,'[{\"added\": {}}]',14,1),(145,'2021-07-22 07:56:21.435693','27','手机vivo X60 Pro+，剩余31，价格￥5412，颜色vivo X60 Pro+ 经典橙',1,'[{\"added\": {}}]',14,1),(146,'2021-07-22 07:56:54.116590','28','手机vivo X60 Pro，剩余21，价格￥5676，颜色vivo X60 Pro 原力',1,'[{\"added\": {}}]',14,1),(147,'2021-07-22 07:57:26.533957','29','手机vivo X60，剩余12，价格￥6475，颜色vivo X60 华彩',1,'[{\"added\": {}}]',14,1),(148,'2021-07-22 07:57:47.575598','30','手机OPPO A93，剩余12，价格￥7656，颜色OPPO A93 极光',1,'[{\"added\": {}}]',14,1),(149,'2021-07-22 07:58:15.598362','31','手机OPPO K9，剩余32，价格￥5687，颜色OPPO K9 幻彩之翼',1,'[{\"added\": {}}]',14,1),(150,'2021-07-22 07:58:35.941688','32','手机OPPO Find X3，剩余23，价格￥5676，颜色OPPO Find X3 凝白',1,'[{\"added\": {}}]',14,1),(151,'2021-07-22 07:59:03.306971','33','手机OPPO Reno4 SE，剩余34，价格￥7656，颜色OPPO Reno4 SE 超闪白',1,'[{\"added\": {}}]',14,1),(152,'2021-07-22 07:59:30.295048','34','手机OPPO K7x，剩余12，价格￥5654，颜色OPPO K7x 蓝影',1,'[{\"added\": {}}]',14,1),(153,'2021-07-22 09:52:52.007553','35','GoodsRepertory object (35)',1,'[{\"added\": {}}]',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'login_register','address'),(7,'login_register','userinfo'),(6,'sessions','session'),(9,'shopping_show','goods'),(10,'shopping_show','goodscapacity'),(11,'shopping_show','goodscolorspicture'),(15,'shopping_show','goodsdetails'),(14,'shopping_show','goodsrepertory'),(12,'shopping_show','goodsspecies'),(13,'shopping_show','slideshowpicture');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-22 06:26:26.142055'),(2,'auth','0001_initial','2021-07-22 06:26:26.437131'),(3,'admin','0001_initial','2021-07-22 06:26:26.529118'),(4,'admin','0002_logentry_remove_auto_add','2021-07-22 06:26:26.538246'),(5,'admin','0003_logentry_add_action_flag_choices','2021-07-22 06:26:26.547018'),(6,'contenttypes','0002_remove_content_type_name','2021-07-22 06:26:26.605263'),(7,'auth','0002_alter_permission_name_max_length','2021-07-22 06:26:26.641348'),(8,'auth','0003_alter_user_email_max_length','2021-07-22 06:26:26.661268'),(9,'auth','0004_alter_user_username_opts','2021-07-22 06:26:26.670241'),(10,'auth','0005_alter_user_last_login_null','2021-07-22 06:26:26.700626'),(11,'auth','0006_require_contenttypes_0002','2021-07-22 06:26:26.704740'),(12,'auth','0007_alter_validators_add_error_messages','2021-07-22 06:26:26.712225'),(13,'auth','0008_alter_user_username_max_length','2021-07-22 06:26:26.751660'),(14,'auth','0009_alter_user_last_name_max_length','2021-07-22 06:26:26.790684'),(15,'auth','0010_alter_group_name_max_length','2021-07-22 06:26:26.807462'),(16,'auth','0011_update_proxy_permissions','2021-07-22 06:26:26.817511'),(17,'auth','0012_alter_user_first_name_max_length','2021-07-22 06:26:26.851360'),(18,'login_register','0001_initial','2021-07-22 06:26:26.917808'),(19,'sessions','0001_initial','2021-07-22 06:26:26.944771'),(20,'shopping_show','0001_initial','2021-07-22 06:26:27.207135'),(21,'shopping_show','0002_rename_goods_colors_picturegoodscapacity_goodsrepertory_goods_colors_picture','2021-07-22 07:38:44.484301');
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
INSERT INTO `django_session` VALUES ('cboo21jjc3yfht0pbpyuxum8i01z0dcu','.eJxVj8EOgyAMht-FszGgCOhx9z0DAVqVzcEimmxZ9u4T52Hrsd_fr-2LaLMuo14TztoD6QgjxW_PGnfFkAFcTBhi6WJYZm_LHCkPmspzBJxOR_ZPMJo0btMVl7WxvBYUFPKmF6qtoQfKrKCyRSc3Dpwz6preScUqZQFrCs4IIWSTpbsumBvmY9a8JWFKPgaNj7ufn6Rj9FsF8UlPcfBhf-j9AdKxSgI:1m6Td8:HYAwmj5ZGSOGMVSeZkt5qEfW8yJOHKAVFBUuQbyb8Y4','2021-11-15 01:47:10.426987');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_register_address`
--

DROP TABLE IF EXISTS `login_register_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_register_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_postcode` varchar(20) NOT NULL,
  `address_address` int NOT NULL,
  `address_addressee_name` varchar(20) NOT NULL,
  `address_address_phone` bigint NOT NULL,
  `is_default_address` bigint NOT NULL,
  `userinfo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_address_phone` (`address_address_phone`),
  KEY `login_register_addre_userinfo_id_aef887d4_fk_login_reg` (`userinfo_id`),
  CONSTRAINT `login_register_addre_userinfo_id_aef887d4_fk_login_reg` FOREIGN KEY (`userinfo_id`) REFERENCES `login_register_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_register_address`
--

LOCK TABLES `login_register_address` WRITE;
/*!40000 ALTER TABLE `login_register_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_register_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_register_userinfo`
--

DROP TABLE IF EXISTS `login_register_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_register_userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_email` varchar(20) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `is_superuser` int NOT NULL,
  `user_privilege` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_register_userinfo`
--

LOCK TABLES `login_register_userinfo` WRITE;
/*!40000 ALTER TABLE `login_register_userinfo` DISABLE KEYS */;
INSERT INTO `login_register_userinfo` VALUES (1,'du','123123a',NULL,NULL,0,1);
/*!40000 ALTER TABLE `login_register_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_goods`
--

DROP TABLE IF EXISTS `shopping_show_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(40) NOT NULL,
  `goods_intro` varchar(300) NOT NULL,
  `evalute_num` int NOT NULL,
  `goods_species_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_show_goods_goods_species_id_ce361916_fk_shopping_` (`goods_species_id`),
  CONSTRAINT `shopping_show_goods_goods_species_id_ce361916_fk_shopping_` FOREIGN KEY (`goods_species_id`) REFERENCES `shopping_show_goodsspecies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_goods`
--

LOCK TABLES `shopping_show_goods` WRITE;
/*!40000 ALTER TABLE `shopping_show_goods` DISABLE KEYS */;
INSERT INTO `shopping_show_goods` VALUES (1,'iPhone SE','apple手机',0,1),(2,'iPhone 11 Pro','apple手机',0,1),(3,'iPhone 11','apple手机',0,1),(4,'iPhone 12 mini','apple手机',0,1),(5,'iPhone 12','apple手机',0,1),(6,'HUAWEI Mate X2','华为手机',0,2),(7,'HUAWEI Mate 30E Pro','华为手机',0,2),(8,'HUAWEI Mate 40 Pro','华为手机',0,2),(9,'HUAWEI Mate 40 RS','华为手机',0,2),(10,'HUAWEI nova 7 Pro','华为手机',0,2),(11,'魅族17 Pro','魅族手机',0,6),(12,'魅族17','魅族手机',0,6),(13,'魅族18 Pro','魅族手机',0,6),(14,'魅族18','魅族手机',0,6),(15,'Redmi K40 Pro','小米手机',0,4),(16,'Redmi K40','小米手机',0,4),(17,'Redmi Note 9 Pro','小米手机',0,4),(18,'Redmi Note 9','小米手机',0,4),(19,'Redmi Note 10 Pro','小米手机',0,4),(20,'vivo S9e','vivo手机',0,3),(21,'vivo S9','vivo手机',0,3),(22,'vivo X60 Pro+','vivo手机',0,3),(23,'vivo X60 Pro','vivo手机',0,3),(24,'vivo X60','vivo手机',0,3),(25,'OPPO A93','oppo手机',0,5),(26,'OPPO Find X3','oppo手机',0,5),(27,'OPPO K7x','oppo手机',0,5),(28,'OPPO K9','oppo手机',0,5),(29,'OPPO Reno4 SE','oppo手机',0,5);
/*!40000 ALTER TABLE `shopping_show_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_goodscapacity`
--

DROP TABLE IF EXISTS `shopping_show_goodscapacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_goodscapacity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_capacity` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_goodscapacity`
--

LOCK TABLES `shopping_show_goodscapacity` WRITE;
/*!40000 ALTER TABLE `shopping_show_goodscapacity` DISABLE KEYS */;
INSERT INTO `shopping_show_goodscapacity` VALUES (1,'6+128GB'),(2,'8+128GB'),(3,'8+256GB'),(4,'8+512GB'),(5,'12+256GB');
/*!40000 ALTER TABLE `shopping_show_goodscapacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_goodscolorspicture`
--

DROP TABLE IF EXISTS `shopping_show_goodscolorspicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_goodscolorspicture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_color_name` varchar(50) NOT NULL,
  `phone_picture_addr` varchar(200) NOT NULL,
  `goods_status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_goodscolorspicture`
--

LOCK TABLES `shopping_show_goodscolorspicture` WRITE;
/*!40000 ALTER TABLE `shopping_show_goodscolorspicture` DISABLE KEYS */;
INSERT INTO `shopping_show_goodscolorspicture` VALUES (1,'iPhone SE 白色','static/sjtp/apple/iPhone SE 白色.jpg',2),(2,'iPhone SE 红色','static/sjtp/apple/iPhone SE 红色.jpg',2),(3,'iPhone SE 黑色','static/sjtp/apple/iPhone SE 黑色.jpg',2),(4,'iPhone 11 Pro Max 暗夜绿色','static/sjtp/apple/iPhone 11 Pro Max 暗夜绿色.jpg',2),(5,'iPhone 11 Pro Max 深空灰色','static/sjtp/apple/iPhone 11 Pro Max 深空灰色.jpg',2),(6,'iPhone 11 Pro Max 金色','static/sjtp/apple/iPhone 11 Pro Max 金色.jpg',2),(7,'iPhone 11 Pro 暗夜绿色','static/sjtp/apple/iPhone 11 Pro 暗夜绿色.jpg',2),(8,'iPhone 11 Pro 深空灰色','static/sjtp/apple/iPhone 11 Pro 深空灰色.jpg',2),(9,'iPhone 11 Pro 金色','static/sjtp/apple/iPhone 11 Pro 金色.jpg',2),(10,'iPhone 11 白色','static/sjtp/apple/iPhone 11 白色.jpg',2),(11,'iPhone 11 紫色','static/sjtp/apple/iPhone 11 紫色.jpg',2),(12,'iPhone 11 红色','static/sjtp/apple/iPhone 11 红色.jpg',2),(13,'iPhone 12 mini 白色','static/sjtp/apple/iPhone 12 mini 白色.jpg',2),(14,'iPhone 12 mini 紫色','static/sjtp/apple/iPhone 12 mini 紫色.jpg',2),(15,'iPhone 12 mini 红色','static/sjtp/apple/iPhone 12 mini 红色.jpg',2),(16,'HUAWEI Mate X2 亮黑色','static/sjtp/huawei/HUAWEI Mate X2 亮黑色.jpg',2),(17,'HUAWEI Mate X2 冰晶粉','static/sjtp/huawei/HUAWEI Mate X2 冰晶粉.jpg',2),(18,'HUAWEI Mate X2 冰晶蓝','static/sjtp/huawei/HUAWEI Mate X2 冰晶蓝.jpg',2),(19,'HUAWEI Mate 30E Pro 丹霞橙','static/sjtp/huawei/HUAWEI Mate 30E Pro 丹霞橙.jpg',2),(20,'HUAWEI Mate 30E Pro 亮黑色','static/sjtp/huawei/HUAWEI Mate 30E Pro 亮黑色.jpg',2),(21,'HUAWEI Mate 30E Pro 星河银','static/sjtp/huawei/HUAWEI Mate 30E Pro 星河银.jpg',2),(22,'HUAWEI Mate 40 Pro 亮黑色','static/sjtp/huawei/HUAWEI Mate 40 Pro 亮黑色.jpg',2),(23,'HUAWEI Mate 40 Pro 夏日胡杨','static/sjtp/huawei/HUAWEI Mate 40 Pro 夏日胡杨.jpg',2),(24,'HUAWEI Mate 40 Pro 秋日胡杨','static/sjtp/huawei/HUAWEI Mate 40 Pro 秋日胡杨.jpg',2),(25,'HUAWEI Mate 40 RS 陶瓷白','static/sjtp/huawei/HUAWEI Mate 40 RS 陶瓷白.jpg',2),(26,'HUAWEI Mate 40 RS 陶瓷黑','static/sjtp/huawei/HUAWEI Mate 40 RS 陶瓷黑.jpg',2),(27,'HUAWEI nova 7 Pro 亮黑色','static/sjtp/huawei/HUAWEI nova 7 Pro 亮黑色.jpg',2),(28,'HUAWEI nova 7 Pro 仲夏紫','static/sjtp/huawei/HUAWEI nova 7 Pro 仲夏紫.jpg',2),(29,'HUAWEI nova 7 Pro 密语红','static/sjtp/huawei/HUAWEI nova 7 Pro 密语红.jpg',2),(30,'魅族17 Pro 乌金','static/sjtp/meizu/.jpg',2),(31,'魅族17 Pro 定白','static/sjtp/meizu/魅族17 Pro 定白.jpg',2),(32,'魅族17 十七度灰','static/sjtp/meizu/魅族17 十七度灰.jpg',2),(33,'魅族17 星际灰','static/sjtp/meizu/魅族17 星际灰.jpg',2),(34,'魅族17 松深入墨','static/sjtp/meizu/魅族17 松深入墨.jpg',2),(35,'魅族 18 Pro 苍穹浩瀚','static/sjtp/meizu/魅族 18 Pro 苍穹浩瀚.jpg',2),(36,'魅族 18 Pro 银河秘境','static/sjtp/meizu/魅族 18 Pro 银河秘境.jpg',2),(37,'魅族 18 Pro 飞雪流光','static/sjtp/meizu/魅族 18 Pro 飞雪流光.jpg',2),(38,'魅族 18 渡海','static/sjtp/meizu/魅族 18 渡海.jpg',2),(39,'魅族 18 等风','static/sjtp/meizu/魅族 18 等风.jpg',2),(40,'魅族 18 踏雪','static/sjtp/meizu/魅族 18 踏雪.jpg',2),(41,'OPPO A93 极光','static/sjtp/oppo/OPPO A93 极光.jpg',2),(42,'OPPO A93 炫黑','static/sjtp/oppo/OPPO A93 炫黑.jpg',2),(43,'OPPO A93 雅银','static/sjtp/oppo/OPPO A93 雅银.jpg',2),(44,'OPPO Find X3 凝白','static/sjtp/oppo/OPPO Find X3 凝白.jpg',2),(45,'OPPO Find X3 镜黑','static/sjtp/oppo/OPPO Find X3 镜黑.jpg',2),(46,'OPPO Find X3 雾蓝','static/sjtp/oppo/OPPO Find X3 雾蓝.jpg',2),(47,'OPPO K7x 云之彼端','static/sjtp/oppo/OPPO K7x 云之彼端.jpg',2),(48,'OPPO K7x 蓝影','static/sjtp/oppo/OPPO K7x 蓝影.jpg',2),(49,'OPPO K7x 黑镜','static/sjtp/oppo/OPPO K7x 黑镜.jpg',2),(50,'OPPO K9 幻彩之翼','static/sjtp/oppo/OPPO K9 幻彩之翼.jpg',2),(51,'OPPO K9 黑桃','static/sjtp/oppo/OPPO K9 黑桃K.jpg',2),(52,'OPPO Reno4 SE 超闪白','static/sjtp/oppo/OPPO Reno4 SE 超闪白.jpg',2),(53,'OPPO Reno4 SE 超闪蓝','static/sjtp/oppo/OPPO Reno4 SE 超闪蓝.jpg',2),(54,'OPPO Reno4 SE 超闪黑','static/sjtp/oppo/OPPO Reno4 SE 超闪黑.jpg',2),(55,'vivo S9 印象拾光','static/sjtp/vivo/vivo S9 印象拾光.jpg',2),(56,'vivo S9 子夜蓝','static/sjtp/vivo/vivo S9 子夜蓝.jpg',2),(57,'vivo S9 朝露白','static/sjtp/vivo/vivo S9 朝露白.jpg',2),(58,'vivo S9e 星夜极光','static/sjtp/vivo/vivo S9e 星夜极光.jpg',2),(59,'vivo S9e 水光晶钻','static/sjtp/vivo/vivo S9e 水光晶钻.jpg',2),(60,'vivo X60 Pro+ 深海蓝','static/sjtp/vivo/vivo X60 Pro+ 深海蓝.jpg',2),(61,'vivo X60 Pro+ 经典橙','static/sjtp/vivo/vivo X60 Pro+ 经典橙.jpg',2),(62,'vivo X60 Pro 华彩','static/sjtp/vivo/vivo X60 Pro 华彩.jpg',2),(63,'vivo X60 Pro 原力','static/sjtp/vivo/vivo X60 Pro 原力.jpg',2),(64,'vivo X60 华彩','static/sjtp/vivo/vivo X60 华彩.jpg',2),(65,'vivo/vivo X60 原力','static/sjtp/vivo/vivo X60 原力.jpg',2),(66,'Redmi K40 Pro 墨羽','static/sjtp/xiaomi/Redmi K40 Pro 墨羽.jpg',2),(67,'Redmi K40 Pro 幻境','static/sjtp/xiaomi/Redmi K40 Pro 幻境.jpg',2),(68,'Redmi K40游戏增强版 光刃','static/sjtp/xiaomi/Redmi K40游戏增强版 光刃.jpg',2),(69,'Redmi K40游戏增强版 暗影','static/sjtp/xiaomi/Redmi K40游戏增强版 暗影.jpg',2),(70,'Redmi Note 9 Pro 湖光秋色','static/sjtp/xiaomi/Redmi Note 9 Pro 湖光秋色.jpg',2),(71,'Redmi Note 9 Pro 碧海星辰','static/sjtp/xiaomi/Redmi Note 9 Pro 碧海星辰.jpg',2),(72,'Redmi Note 9 云墨灰','static/sjtp/xiaomi/Redmi Note 9 云墨灰.jpg',2),(73,'Redmi Note 9 流影紫','static/sjtp/xiaomi/Redmi Note 9 流影紫.jpg',2),(74,'Redmi Note 10 Pro 幻青','static/sjtp/xiaomi/Redmi Note 10 Pro 幻青.jpg',2),(75,'Redmi Note 10 Pro 星纱','static/sjtp/xiaomi/Redmi Note 10 Pro 星纱.jpg',2);
/*!40000 ALTER TABLE `shopping_show_goodscolorspicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_goodsdetails`
--

DROP TABLE IF EXISTS `shopping_show_goodsdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_goodsdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_details_addr` varchar(200) NOT NULL,
  `goods_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_show_goodsd_goods_id_2ba67184_fk_shopping_` (`goods_id`),
  CONSTRAINT `shopping_show_goodsd_goods_id_2ba67184_fk_shopping_` FOREIGN KEY (`goods_id`) REFERENCES `shopping_show_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_goodsdetails`
--

LOCK TABLES `shopping_show_goodsdetails` WRITE;
/*!40000 ALTER TABLE `shopping_show_goodsdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_show_goodsdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_goodsrepertory`
--

DROP TABLE IF EXISTS `shopping_show_goodsrepertory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_goodsrepertory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_num_all` int NOT NULL,
  `goods_price` int NOT NULL,
  `goods_residue` int NOT NULL,
  `goods_id` int NOT NULL,
  `goods_capacity_id` int NOT NULL,
  `goods_colors_picture_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_show_goodsr_goods_id_c50e6a00_fk_shopping_` (`goods_id`),
  KEY `shopping_show_goodsr_goods_capacity_id_73c25772_fk_shopping_` (`goods_capacity_id`),
  KEY `shopping_show_goodsr_goods_colors_picture_2d0cf820_fk_shopping_` (`goods_colors_picture_id`),
  CONSTRAINT `shopping_show_goodsr_goods_capacity_id_73c25772_fk_shopping_` FOREIGN KEY (`goods_capacity_id`) REFERENCES `shopping_show_goodscapacity` (`id`),
  CONSTRAINT `shopping_show_goodsr_goods_colors_picture_2d0cf820_fk_shopping_` FOREIGN KEY (`goods_colors_picture_id`) REFERENCES `shopping_show_goodscolorspicture` (`id`),
  CONSTRAINT `shopping_show_goodsr_goods_id_c50e6a00_fk_shopping_` FOREIGN KEY (`goods_id`) REFERENCES `shopping_show_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_goodsrepertory`
--

LOCK TABLES `shopping_show_goodsrepertory` WRITE;
/*!40000 ALTER TABLE `shopping_show_goodsrepertory` DISABLE KEYS */;
INSERT INTO `shopping_show_goodsrepertory` VALUES (1,32,4532,32,1,2,1),(2,34,3456,34,1,4,2),(3,32,3245,32,1,4,3),(4,43,3453,43,2,4,9),(5,35,5364,35,2,4,8),(6,43,4353,43,2,2,7),(7,43,4334,43,3,3,10),(8,23,3454,23,3,4,11),(9,32,2332,32,3,5,12),(10,43,4334,43,4,3,13),(11,43,4334,43,4,5,14),(12,23,2354,23,4,1,15),(13,32,3245,32,4,3,15),(14,23,3243,34,6,3,16),(15,23,4334,23,6,3,17),(16,23,5234,23,7,2,19),(17,23,6542,23,7,4,21),(18,23,4353,23,11,3,30),(19,23,4323,23,11,4,31),(20,23,2354,23,13,4,36),(21,23,4356,23,14,4,39),(22,23,3253,23,15,3,66),(23,32,2345,32,16,5,69),(24,23,6544,23,19,4,74),(25,12,4565,12,17,5,70),(26,32,5435,32,20,4,58),(27,31,5412,31,22,4,61),(28,21,5676,21,23,2,63),(29,12,6475,12,24,5,64),(30,12,7656,12,25,5,41),(31,32,5687,32,28,3,50),(32,23,5676,23,26,5,44),(33,34,7656,34,29,4,52),(34,12,5654,12,27,3,48),(35,34,8765,34,15,1,69);
/*!40000 ALTER TABLE `shopping_show_goodsrepertory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_goodsspecies`
--

DROP TABLE IF EXISTS `shopping_show_goodsspecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_goodsspecies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `species_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_goodsspecies`
--

LOCK TABLES `shopping_show_goodsspecies` WRITE;
/*!40000 ALTER TABLE `shopping_show_goodsspecies` DISABLE KEYS */;
INSERT INTO `shopping_show_goodsspecies` VALUES (1,'苹果'),(2,'华为'),(3,'vivo'),(4,'小米'),(5,'oppo'),(6,'魅族');
/*!40000 ALTER TABLE `shopping_show_goodsspecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_show_slideshowpicture`
--

DROP TABLE IF EXISTS `shopping_show_slideshowpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_show_slideshowpicture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_picture_addr` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_show_slideshowpicture`
--

LOCK TABLES `shopping_show_slideshowpicture` WRITE;
/*!40000 ALTER TABLE `shopping_show_slideshowpicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_show_slideshowpicture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-22 23:26:48
