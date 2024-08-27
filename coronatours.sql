-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: corona_tours
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Vehiculo',7,'add_vehiculos'),(26,'Can change Vehiculo',7,'change_vehiculos'),(27,'Can delete Vehiculo',7,'delete_vehiculos'),(28,'Can view Vehiculo',7,'view_vehiculos'),(29,'Can add Reserva',8,'add_reserver'),(30,'Can change Reserva',8,'change_reserver'),(31,'Can delete Reserva',8,'delete_reserver'),(32,'Can view Reserva',8,'view_reserver'),(33,'Can add Hotel',9,'add_hotellist'),(34,'Can change Hotel',9,'change_hotellist'),(35,'Can delete Hotel',9,'delete_hotellist'),(36,'Can view Hotel',9,'view_hotellist'),(37,'Can add Aeropuerto/Terminal',10,'add_airportorterminal'),(38,'Can change Aeropuerto/Terminal',10,'change_airportorterminal'),(39,'Can delete Aeropuerto/Terminal',10,'delete_airportorterminal'),(40,'Can view Aeropuerto/Terminal',10,'view_airportorterminal'),(41,'Can add Zona',11,'add_zone'),(42,'Can change Zona',11,'change_zone'),(43,'Can delete Zona',11,'delete_zone'),(44,'Can view Zona',11,'view_zone'),(45,'Can add Destino',12,'add_destination'),(46,'Can change Destino',12,'change_destination'),(47,'Can delete Destino',12,'delete_destination'),(48,'Can view Destino',12,'view_destination'),(49,'Can add Barrio',13,'add_barriolist'),(50,'Can change Barrio',13,'change_barriolist'),(51,'Can delete Barrio',13,'delete_barriolist'),(52,'Can view Barrio',13,'view_barriolist'),(53,'Can add tours',14,'add_tours'),(54,'Can change tours',14,'change_tours'),(55,'Can delete tours',14,'delete_tours'),(56,'Can view tours',14,'view_tours'),(57,'Can add exclusiones',15,'add_exclusiones'),(58,'Can change exclusiones',15,'change_exclusiones'),(59,'Can delete exclusiones',15,'delete_exclusiones'),(60,'Can view exclusiones',15,'view_exclusiones'),(61,'Can add inclusiones',16,'add_inclusiones'),(62,'Can change inclusiones',16,'change_inclusiones'),(63,'Can delete inclusiones',16,'delete_inclusiones'),(64,'Can view inclusiones',16,'view_inclusiones'),(65,'Can add booking',17,'add_booking'),(66,'Can change booking',17,'change_booking'),(67,'Can delete booking',17,'delete_booking'),(68,'Can view booking',17,'view_booking');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$qjfzeBh15D0IvNtmGCpGLv$ArKUgGUTmyPSG7MHsAYHvnRrgD7AfBOJikfPPQB1dw0=','2024-07-13 19:03:49.397840',1,'sadonfa','','','sadonfa@gmail.com',1,1,'2023-08-10 19:28:53.644616'),(2,'pbkdf2_sha256$600000$uVUcUFg8TOcXjBY5HzlHZf$OioJctAduELTYq3/aari+4yEeof+VdQIQ+xTV0GDxkw=','2024-08-13 02:35:09.259382',1,'admin_coronatours','','','gegovaceo@gmail.com',1,1,'2024-08-13 02:34:38.962502');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_booking`
--

DROP TABLE IF EXISTS `booking_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `phone` longtext NOT NULL,
  `mail` varchar(200) NOT NULL,
  `contry` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `hotel` varchar(200) NOT NULL,
  `tour` varchar(200) NOT NULL,
  `adults` varchar(100) NOT NULL,
  `childre` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `cash` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `air` varchar(200) NOT NULL,
  `nair` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_booking`
--

LOCK TABLES `booking_booking` WRITE;
/*!40000 ALTER TABLE `booking_booking` DISABLE KEYS */;
INSERT INTO `booking_booking` VALUES (1,'Andres sanchy','Ayerbe ','3162203798','andresss360@hotmail.com','Colombiana ','Bogota','','Suzuki Vitara (Compartido)','3','0','2024-02-02 18:45:01.450335','2024-02-02 18:45:01.450391',45000.00,135000.00,'Avianca ','9502'),(2,'','','','','','','','Renaul Master (Compartido)','4','0','2024-02-08 20:51:46.338988','2024-02-08 20:51:46.339019',100000.00,400000.00,'',''),(3,'Adrian','Sterling','6472382053','adrian_sterling94@live.com','Canadian','Toronto','','Mercedes Sprinter (Shared)','1','0','2024-02-11 20:14:54.358884','2024-02-11 20:14:54.358922',15000.00,15000.00,'Air Transat','TS 158'),(4,'Adrian','Sterling','6472382053','adrian_sterling94@live.com','Canadian','Toronto','','Mercedes Sprinter (Shared)','1','0','2024-02-11 22:15:59.056429','2024-02-11 22:15:59.056461',15000.00,15000.00,'Air Transat','TS 158'),(5,'Adrian','Sterling','6472382053','adrian_sterling94@live.com','Canadian','Toronto','','Mercedes Sprinter (Shared)','1','0','2024-02-11 22:20:01.042432','2024-02-11 22:20:01.042467',15000.00,15000.00,'Air Transat','TS 158'),(6,'Adrian','Sterling','6472382053','adrian_sterling94@live.com','Canadian','Toronto','','Mercedes Sprinter (Shared)','1','0','2024-02-12 00:02:24.636016','2024-02-12 00:02:24.636058',15000.00,15000.00,'Air Transat','TS 158'),(7,'elizabeth','ayerbe','3162203798','andresss360@hotmail.com','colombiano','bogota','','Suzuki Vitara (Compartido)','2','0','2024-02-12 14:06:55.035789','2024-02-12 14:06:55.035820',45000.00,90000.00,'avianca','9504'),(8,'elizabeth','ayerbe','','andresss360@hotmail.com','colombiano','bogota','','Suzuki Vitara (Compartido)','2','1','2024-02-12 14:09:40.325999','2024-02-12 14:09:40.326031',45000.00,90000.00,'avianca','9504'),(9,'elizabeth','ayerbe','','andresss360@hotmail.com','colombiano','bogota','','Suzuki Vitara (Compartido)','2','3','2024-02-12 14:09:51.835273','2024-02-12 14:09:51.835312',45000.00,90000.00,'avianca','9504'),(10,'Andres ','Sanchez','3162203798','andresss360@hotmail.com','Colombiana ','Bogota','','Suzuki Vitara (Compartido)','3','2','2024-02-19 13:05:12.249744','2024-02-19 13:05:12.249785',45000.00,135000.00,'Avianca ','9502'),(11,'fwsfsw','vsvasvs','1066504684','ahklcdba@aiausgh','gkj gui','i guigiu','','Suzuki Vitara (Compartido)','2','0','2024-02-20 02:51:15.531450','2024-02-20 02:51:15.531495',45000.00,90000.00,'ig uig','bg uig'),(12,'Gerlin','Valenzuela','3138324950','sadonfa@gmail.com','Colombia','Cartagena','','Suzuki Vitara (Compartido)','1','1','2024-02-21 14:43:42.849809','2024-02-21 14:43:42.849847',45000.00,45000.00,'avianca','f65321'),(13,'Gerlin','Valenzuela','','sadonfa@gmail.com','Colombia','Cartagena','','Suzuki Vitara (Compartido)','1','1','2024-02-21 14:44:11.905450','2024-02-21 14:44:11.905484',45000.00,45000.00,'avianca','f65321'),(14,'elizabeth','ayerbe','','andresss360@hotmail.com','colombiana','bogota','','Suzuki Vitara (Compartido)','2','0','2024-02-26 15:55:35.822113','2024-02-26 15:55:35.822155',45000.00,90000.00,'avianca','9504'),(15,'Schaina Gilot','Gilot','USA_1','sgilot1@gmail.com','USA','Brooklyn','','Mercedes Sprinter (Compartido)','4','0','2024-02-28 05:24:56.196481','2024-02-28 05:24:56.196518',60000.00,240000.00,'Jet Blue',''),(16,'Andrew ','Heron ','8764724322','bookings.exclusivetraveldeals@gmail.com','Jamaican','Kingston ','','Suzuki Vitara (Compartido)','2','0','2024-03-01 14:04:05.220321','2024-03-01 14:04:05.220364',45000.00,90000.00,'Arajet Airlines ','3440'),(17,'Lena','Lagast','0493073810','lenalagast@hotmail.com','Belgíca','Brujas','','Mercedes Sprinter (Compartido)','1','0','2024-03-02 19:48:01.584730','2024-03-02 19:48:01.584780',25000.00,25000.00,'Avianca','AV9822'),(18,'Lena','Lagast','0493073810','lenalagast@hotmail.com','Belgíca','Loppem','','Mercedes Sprinter (Compartido)','1','0','2024-03-02 19:51:10.904276','2024-03-02 19:51:10.904314',25000.00,25000.00,'Avianca','AV9822'),(19,'Any ','Monterrozo','','anyminerrrrrr@gmail.com','american ','St George ','','Mercedes Sprinter (Compartido)','4','1','2024-03-10 20:25:41.764308','2024-03-10 20:25:41.764342',125000.00,500000.00,'',''),(20,'Andres ','Sánchez ','','andresss360@hotmail.com','Colombiana ','Bogotá ','','Suzuki Vitara (Compartido)','3','0','2024-03-18 23:54:51.130787','2024-03-18 23:54:51.130818',45000.00,135000.00,'Avianca','9502'),(21,'NESTOR','MORENO','3125049777','nimoreno4@gmail.com','Colombiano','Bogotá','','Suzuki Vitara (Compartido)','3','0','2024-03-19 17:44:04.166713','2024-03-19 17:44:04.166745',45000.00,135000.00,'Avianca','AV9374'),(22,'NESTOR','MORENO','3125049777','nimoreno4@gmail.com','Colombiano','Bogotá','','Mercedes Sprinter (Compartido)','3','0','2024-03-19 17:44:38.406597','2024-03-19 17:44:38.406631',45000.00,135000.00,'Avianca','AV9374'),(23,'carlos ','perez','301215487','andresss360@hotmail.com','colombiano','bogota','','Suzuki Vitara (Compartido)','3','0','2024-03-21 14:29:56.052123','2024-03-21 14:29:56.052157',45000.00,135000.00,'av','9504'),(24,'Andre ','Sanchez','','','Colombia','','','Suzuki Vitara (Compartido)','3','0','2024-03-26 23:34:59.145954','2024-03-26 23:34:59.145986',45000.00,135000.00,'Avianca',''),(25,'elizabeth','ayerbe','3162203798','andresss360@hotmail.com','colombiano','bogota','','Suzuki Vitara (Compartido)','2','0','2024-04-04 23:15:19.859668','2024-04-04 23:15:19.859703',65000.00,130000.00,'avianca','9542'),(26,'elizabeth','ayerbe','3162203798','andresss360@hotmail.com','colombiano','bogota','','Mercedes Sprinter (Compartido)','4','0','2024-06-24 15:00:21.927822','2024-06-24 15:00:21.927855',30000.00,120000.00,'avianca','9504'),(27,'elizabeth','ayerbe','','andresss360@hotmail.com','colombiano','bogota','','Mercedes Sprinter (Compartido)','3','0','2024-06-24 15:00:42.238054','2024-06-24 15:00:42.238099',30000.00,90000.00,'avianca','9504'),(28,'Gerlin','Gonzalez','3138324950','sadonfa@gmail.com','Colombia','Cartagena','','Hyundai H1 (Compartido)','4','2','2024-06-24 21:11:31.873578','2024-06-24 21:11:31.873616',85000.00,85000.00,'avianca','L654'),(29,'Gerlin','Gonzalez','3138324950','sadonfa@gmail.com','Colombia','Cartagena','','Hyundai H1 (Compartido)','4','2','2024-06-24 21:13:42.674325','2024-06-24 21:13:42.674362',85000.00,85000.00,'avianca','L654'),(30,'Gerlin','Gonzalez','3138324950','sadonfa@gmail.com','Colombia','Cartagena','','Hyundai H1 (Compartido)','4','2','2024-06-24 21:19:15.977017','2024-06-24 21:19:15.977060',85000.00,85000.00,'avianca','L654'),(31,'Andres ','Sanchez','316494948499','andresss360@hotmail.com','Colombia ','Cartagena ','','Suzuki Vitara (Compartido)','2','0','2024-06-24 21:41:26.586962','2024-06-24 21:41:26.586997',45000.00,45000.00,'Avianca','87638'),(32,'RODRIGO LEON','ALZATE','310 4554870','GERENCIAAVIOA@GMAIL.COM','COLOMBIA','MEDELLIN','','Mercedes Sprinter','1','0','2024-06-25 18:38:50.852587','2024-06-25 18:38:50.852620',50000.00,50000.00,'AVIANCA','8586'),(33,'RODRIGO LEON','ALZATE','','GERENCIAAVIOA@GMAIL.COM','COLOMBIA','MEDELLIN','','Mercedes Sprinter','2','0','2024-06-25 18:39:07.107987','2024-06-25 18:39:07.108025',50000.00,50000.00,'AVIANCA','8586'),(34,'andres ','sanchez','3162203154','andresss360@hotmail.com','colombiano','bogota','','Mercedes Sprinter','12','5','2024-06-26 18:32:18.300111','2024-06-26 18:32:18.300147',120000.00,120000.00,'avianca','8888'),(35,'andres ','sanchez','','andresss360@hotmail.com','colombiano','bogota','','Mercedes Sprinter','15','5','2024-06-26 18:32:31.720428','2024-06-26 18:32:31.720463',120000.00,120000.00,'avianca','8888'),(36,'andres ','sanchez','3162201244','andresss360@hotmail.com','colombiano','cartagena','','Suzuki Vitara','2','0','2024-06-26 18:36:27.707744','2024-06-26 18:36:27.707774',45000.00,45000.00,'avianca','9502'),(37,'andres ','ayerbe','3162001245','andresss360@hotmail.com','asqa','yfyf','','Suzuki Vitara','2','0','2024-06-26 18:48:19.181650','2024-06-26 18:48:19.181684',45000.00,45000.00,'yfyf','yfyf'),(38,'Claudia Lorena','Morales Bedoya','959954932','lorenamoralesb25@gmail.com','Colombiana','Pereira','','Mercedes Sprinter','2','0','2024-06-27 09:47:40.170157','2024-06-27 09:47:40.170195',15000.00,15000.00,'Latam','LA4119'),(39,'Claudia Lorena','Morales Bedoya','959954932','lorenamoralesb25@gmail.com','Colombiana','Pereira','','Mercedes Sprinter','2','0','2024-06-27 09:51:36.101147','2024-06-27 09:51:36.101185',15000.00,15000.00,'Latam','LA4119'),(40,'Claudia Lorena','Morales Bedoya','959954932','lorenamoralesb25@gmail.com','Colombiana','Pereira','','Mercedes Sprinter','2','0','2024-06-27 09:52:49.122842','2024-06-27 09:52:49.122873',15000.00,15000.00,'Latam','LA4119'),(41,'','','','','','','','Suzuki Vitara','3','','2024-07-14 14:59:30.360419','2024-07-14 14:59:30.360464',90000.00,90000.00,'',''),(42,'','','','','','','','Suzuki Vitara','3','','2024-07-15 15:33:42.177547','2024-07-15 15:33:42.177582',45000.00,45000.00,'',''),(43,'','','','','','','','Suzuki Vitara','2','','2024-07-15 15:33:48.533587','2024-07-15 15:33:48.533617',45000.00,45000.00,'',''),(44,'','','','','','','','Hyundai H1','4','','2024-07-15 15:34:10.187229','2024-07-15 15:34:10.187259',85000.00,85000.00,'',''),(45,'','','','','','','','Hyundai H1','7','','2024-07-15 15:34:16.603649','2024-07-15 15:34:16.603689',85000.00,85000.00,'',''),(46,'','','','','','','','Renaul Master','12','','2024-07-15 15:34:30.658642','2024-07-15 15:34:30.658673',100000.00,100000.00,'',''),(47,'','','','','','','','Hiunday County','17','','2024-07-15 15:36:58.446990','2024-07-15 15:36:58.447021',170000.00,170000.00,'',''),(48,'','','','','','','','Bus','0','','2024-07-15 15:37:17.516287','2024-07-15 15:37:17.516324',200000.00,200000.00,'',''),(49,'','','','','','','','Bus','16','','2024-07-15 15:37:22.526096','2024-07-15 15:37:22.526128',200000.00,200000.00,'',''),(50,'','','','','','','','SUV Fortuner Toyota','3','','2024-07-15 15:37:30.952002','2024-07-15 15:37:30.952034',150000.00,150000.00,'',''),(51,'asasf','afas','','','sdfs','sdfs','','Suzuki Vitara','1','','2024-07-15 15:38:59.517582','2024-07-15 15:38:59.517612',65000.00,65000.00,'',''),(52,'asasf','afas','','','sdfs','sdfs','','Suzuki Vitara','1','','2024-07-15 15:48:02.637826','2024-07-15 15:48:02.637879',65000.00,65000.00,'',''),(53,'','','','','','','','Hyundai H1','0','','2024-07-15 15:48:13.488925','2024-07-15 15:48:13.488954',105000.00,105000.00,'',''),(54,'','','','','','','','Renaul Master','0','','2024-07-15 15:48:25.071154','2024-07-15 15:48:25.071185',120000.00,120000.00,'',''),(55,'','','','','','','','Hiunday County','16','','2024-07-15 15:48:43.293341','2024-07-15 15:48:43.293382',190000.00,190000.00,'',''),(56,'','','','','','','','Hiunday County','16','','2024-07-15 15:54:26.525601','2024-07-15 15:54:26.525652',190000.00,190000.00,'',''),(57,'','','','','','','','Bus','15','','2024-07-15 15:54:37.437880','2024-07-15 15:54:37.437918',220000.00,220000.00,'',''),(58,'','','','','','','','SUV Fortuner Toyota','0','','2024-07-15 15:54:43.172425','2024-07-15 15:54:43.172458',170000.00,170000.00,'',''),(59,'','','','','','','','Van Compartida','13','','2024-07-15 16:00:33.698243','2024-07-15 16:00:33.698272',240000.00,240000.00,'',''),(60,'','','','','','','','Van Compartida','16','','2024-07-15 16:00:40.850257','2024-07-15 16:00:40.850286',240000.00,240000.00,'',''),(61,'','','','','','','','Van Compartida','15','','2024-07-15 16:03:01.090696','2024-07-15 16:03:01.090737',300000.00,300000.00,'',''),(62,'','','','','','','','Suzuki Vitara','3','','2024-07-15 16:05:56.341905','2024-07-15 16:05:56.341935',90000.00,90000.00,'',''),(63,'','','','','','','','Hyundai H1','0','','2024-07-15 16:09:33.754120','2024-07-15 16:09:33.754155',170000.00,170000.00,'',''),(64,'','','','','','','','Renaul Master','0','','2024-07-15 16:09:39.902878','2024-07-15 16:09:39.902915',200000.00,200000.00,'',''),(65,'','','','','','','','Hiunday County','0','','2024-07-15 16:09:50.521020','2024-07-15 16:09:50.521059',340000.00,340000.00,'',''),(66,'','','','','','','','Bus','0','','2024-07-15 16:10:00.204707','2024-07-15 16:10:00.204737',400000.00,400000.00,'',''),(67,'','','','','','','','SUV Fortuner Toyota','0','','2024-07-15 16:10:06.529832','2024-07-15 16:10:06.529866',300000.00,300000.00,'',''),(68,'','','','','','','','Suzuki Vitara','0','','2024-07-15 16:14:08.664202','2024-07-15 16:14:08.664246',110000.00,110000.00,'',''),(69,'','','','','','','','Hyundai H1','0','','2024-07-15 16:14:14.679507','2024-07-15 16:14:14.679541',190000.00,190000.00,'',''),(70,'','','','','','','','Suzuki Vitara','0','','2024-07-15 16:14:52.684712','2024-07-15 16:14:52.684745',110000.00,110000.00,'',''),(71,'','','','','','','','Hyundai H1','0','','2024-07-15 16:14:58.161281','2024-07-15 16:14:58.161347',190000.00,190000.00,'',''),(72,'','','','','','','','Renaul Master','0','','2024-07-15 16:15:02.592681','2024-07-15 16:15:02.592729',220000.00,220000.00,'',''),(73,'','','','','','','','Hiunday County','0','','2024-07-15 16:15:13.640699','2024-07-15 16:15:13.640731',360000.00,360000.00,'',''),(74,'','','','','','','','Bus','0','','2024-07-15 16:15:18.925659','2024-07-15 16:15:18.925695',420000.00,420000.00,'',''),(75,'','','','','','','','SUV Fortuner Toyota','0','','2024-07-15 16:15:31.425447','2024-07-15 16:15:31.425492',320000.00,320000.00,'',''),(76,'','','','','','','','Suzuki Vitara','2','','2024-07-15 16:17:53.272875','2024-07-15 16:17:53.272909',130000.00,130000.00,'',''),(77,'','','','','','','','Hyundai H1','0','','2024-07-15 16:18:05.555412','2024-07-15 16:18:05.555447',210000.00,210000.00,'',''),(78,'','','','','','','','Renaul Master','10','','2024-07-15 16:18:20.361044','2024-07-15 16:18:20.361075',240000.00,240000.00,'',''),(79,'ada','ada','','','ada','ada','','Hiunday County','0','','2024-07-15 16:19:04.502803','2024-07-15 16:19:04.502833',380000.00,380000.00,'',''),(80,'','','','','','','','Bus','16','','2024-07-15 16:19:15.400971','2024-07-15 16:19:15.401002',440000.00,440000.00,'',''),(81,'','','','','','','','SUV Fortuner Toyota','2','','2024-07-15 16:19:21.797852','2024-07-15 16:19:21.797881',340000.00,340000.00,'',''),(82,'victor alberto','pabon rico','3123075889','xpresstours.cucuta@gmail.com','colombiano','cucuta','','Van Compartida','2','','2024-07-15 16:41:32.862436','2024-07-15 16:41:32.862476',50000.00,50000.00,'jetsmart','JA5521'),(83,'victor alberto','pabon rico','3170068494','xpresstours.cucuta@gmail.com','colombiano','cucuta','','Van Compartida','2','','2024-07-15 17:06:38.353678','2024-07-15 17:06:38.353720',50000.00,50000.00,'jetsmart','JA5521'),(84,'','','','','','','','Van Compartida','0','','2024-07-17 15:03:44.958701','2024-07-17 15:03:44.958735',135000.00,135000.00,'',''),(85,'','','','','','','','Suzuki Vitara','2','','2024-07-17 15:03:53.746600','2024-07-17 15:03:53.746631',45000.00,45000.00,'',''),(86,'','','','','','','','Hyundai H1','5','','2024-07-17 15:05:14.564999','2024-07-17 15:05:14.565030',85000.00,85000.00,'',''),(87,'','','','','','','','Renaul Master','9','','2024-07-17 15:05:41.760771','2024-07-17 15:05:41.760803',100000.00,100000.00,'',''),(88,'','','','','','','','Hiunday County','0','','2024-07-17 15:36:15.252364','2024-07-17 15:36:15.252397',170000.00,170000.00,'',''),(89,'','','','','','','','Bus','0','','2024-07-17 15:36:20.920525','2024-07-17 15:36:20.920554',200000.00,200000.00,'',''),(90,'DIANA','ARIAS','3027873424','rplegallamundial@gmail.com','COL','MDE','','Renaul Master','8','','2024-07-20 17:58:04.669234','2024-07-20 17:58:04.669272',280000.00,280000.00,'LATAM','01523'),(91,'','','','','','','','Renaul Master','0','','2024-07-24 20:32:32.412608','2024-07-24 20:32:32.412654',200000.00,200000.00,'',''),(92,'','','','','','','','Renaul Master','8','','2024-07-24 20:32:39.053722','2024-07-24 20:32:39.053755',200000.00,200000.00,'',''),(93,'Gerlin ','González ','3138324950','sadonfa@gmail.com','colombiana ','Cartagena ','','Suzuki Vitara','2','','2024-07-26 04:12:26.699298','2024-07-26 04:12:26.699337',45000.00,45000.00,'avianca','l683'),(94,'Diego','Guillen','0996959801','diego.guillen.l@gmail.com','Ecuatoriano','Cuenca','','Suzuki Vitara','2','','2024-07-28 01:41:03.462529','2024-07-28 01:41:03.462568',45000.00,45000.00,'Avianca','AV 1605'),(95,'Diego','Guillen','0996959801','diego.guillen.l@gmail.com','Ecuatoriano','Cuenca','','Suzuki Vitara','2','','2024-07-28 02:11:19.094197','2024-07-28 02:11:19.094226',45000.00,45000.00,'Avianca','AV 1605'),(96,'GLORIA NAIVI','MENDOZA LANDA','9842777904','malu880527@outlook.com','Mexicana','Lazaro Cardenas, Mich.','','Suzuki Vitara','2','','2024-08-13 18:30:41.130438','2024-08-13 18:30:41.130477',80000.00,80000.00,'AEROMEXICO','AM 798'),(97,'DIANA','ARIAS','3027873424','rplegallamundial@gmail.com','colombiana','itagui','','Renaul Master','8','','2024-08-23 14:16:49.422076','2024-08-23 14:16:49.422118',280000.00,280000.00,'jetsmart y latam','021552');
/*!40000 ALTER TABLE `booking_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coronavip_vehiculosvip`
--

DROP TABLE IF EXISTS `coronavip_vehiculosvip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coronavip_vehiculosvip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  `Number_passengers` int(11) NOT NULL,
  `amount_luggage` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coronavip_vehiculosvip_user_id_26f601c6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `coronavip_vehiculosvip_user_id_26f601c6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coronavip_vehiculosvip`
--

LOCK TABLES `coronavip_vehiculosvip` WRITE;
/*!40000 ALTER TABLE `coronavip_vehiculosvip` DISABLE KEYS */;
INSERT INTO `coronavip_vehiculosvip` VALUES (1,'mercedes benz clase E','vehiculo_lujo',2,2,'articles/RT_V_19c1891d3cc248969ec93e739275b420.png',1,'2024-07-29 01:10:37.773231','2024-07-31 00:55:45.629244',1),(2,'mercedes vito de lujo','mini_van_lujo',5,5,'articles/MB_ClaseV_exterior_1_485x366.png',2,'2024-07-29 01:12:55.146916','2024-07-31 01:00:07.117239',1),(3,'mercedes sprinter de lujo','van_lujo',15,15,'articles/file_20201014133116.jpg',3,'2024-07-29 01:15:02.129284','2024-07-31 01:03:34.965146',1),(4,'toyota prado / fortune expedisi','camioneta',3,3,'articles/4.PRADO-GRIS-METALICO.jpg',0,'2024-07-30 22:45:45.000083','2024-07-31 01:10:08.339131',1),(5,'audi a8','lujo',2,2,'articles/RT_V_23a9abb1e6db429f8d8c88439ed32bdc.png',0,'2024-07-30 22:49:13.406168','2024-07-31 01:14:04.913853',1);
/*!40000 ALTER TABLE `coronavip_vehiculosvip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-13 02:35:26.655996','7','SUV Fortuner Toyota',3,'',7,2),(2,'2024-08-13 02:35:37.285844','6','Bus',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',7,2),(3,'2024-08-13 02:39:27.480621','2','Suzuki Vitara',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(4,'2024-08-13 02:39:36.758821','4','Hyundai H1',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(5,'2024-08-13 02:39:58.774901','3','Renaul Master',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(6,'2024-08-13 02:40:06.168214','1','Mercedes Sprinter',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(7,'2024-08-13 02:40:24.538536','5','Hiunday County',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(8,'2024-08-13 02:40:33.826554','6','Bus',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(9,'2024-08-13 02:42:23.398653','2','Suzuki Vitara',2,'[]',7,2),(10,'2024-08-13 02:43:00.996849','2','Suzuki Vitara',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(11,'2024-08-13 02:43:09.277989','4','Hyundai H1',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(12,'2024-08-13 02:43:17.201670','3','Renaul Master',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(13,'2024-08-13 02:43:27.036744','1','Mercedes Sprinter',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(14,'2024-08-13 02:43:38.545388','5','Hiunday County',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2),(15,'2024-08-13 02:43:46.957778','6','Bus',2,'[{\"changed\": {\"fields\": [\"Orden\"]}}]',7,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(17,'booking','booking'),(5,'contenttypes','contenttype'),(10,'reserve','airportorterminal'),(13,'reserve','barriolist'),(12,'reserve','destination'),(9,'reserve','hotellist'),(8,'reserve','reserver'),(7,'reserve','vehiculos'),(11,'reserve','zone'),(6,'sessions','session'),(15,'tours','exclusiones'),(16,'tours','inclusiones'),(14,'tours','tours');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-10 16:53:35.027864'),(2,'auth','0001_initial','2023-08-10 16:53:35.132983'),(3,'admin','0001_initial','2023-08-10 16:53:35.156896'),(4,'admin','0002_logentry_remove_auto_add','2023-08-10 16:53:35.162119'),(5,'admin','0003_logentry_add_action_flag_choices','2023-08-10 16:53:35.166923'),(6,'contenttypes','0002_remove_content_type_name','2023-08-10 16:53:35.187397'),(7,'auth','0002_alter_permission_name_max_length','2023-08-10 16:53:35.199635'),(8,'auth','0003_alter_user_email_max_length','2023-08-10 16:53:35.212281'),(9,'auth','0004_alter_user_username_opts','2023-08-10 16:53:35.217109'),(10,'auth','0005_alter_user_last_login_null','2023-08-10 16:53:35.228452'),(11,'auth','0006_require_contenttypes_0002','2023-08-10 16:53:35.229427'),(12,'auth','0007_alter_validators_add_error_messages','2023-08-10 16:53:35.235312'),(13,'auth','0008_alter_user_username_max_length','2023-08-10 16:53:35.244849'),(14,'auth','0009_alter_user_last_name_max_length','2023-08-10 16:53:35.254901'),(15,'auth','0010_alter_group_name_max_length','2023-08-10 16:53:35.271260'),(16,'auth','0011_update_proxy_permissions','2023-08-10 16:53:35.276604'),(17,'auth','0012_alter_user_first_name_max_length','2023-08-10 16:53:35.286512'),(18,'booking','0001_initial','2023-08-10 16:53:35.291825'),(19,'booking','0002_booking_cash','2023-08-10 16:53:35.300899'),(20,'booking','0003_booking_total_alter_booking_cash','2023-08-10 16:53:35.317104'),(21,'reserve','0001_initial','2023-08-10 16:53:35.383303'),(22,'reserve','0002_remove_reserver_user_alter_reserver_hour','2023-08-10 16:53:35.416624'),(23,'reserve','0003_reserver_ve_name_reserver_ve_value','2023-08-10 16:53:35.433583'),(24,'reserve','0004_zone','2023-08-10 16:53:35.439548'),(25,'reserve','0005_rename_crated_at_zone_created_at_zone_hotel','2023-08-10 16:53:35.480337'),(26,'reserve','0006_zone_value_tour_alter_reserver_ve_value_and_more','2023-08-10 16:53:35.530283'),(27,'reserve','0007_hotellist_zona_ind_alter_vehiculos_value_tour_and_more','2023-08-10 16:53:35.569255'),(28,'reserve','0008_remove_hotellist_zona_ind_hotellist_price1_and_more','2023-08-10 16:53:35.602838'),(29,'reserve','0009_airportorterminal_price1_airportorterminal_price2_and_more','2023-08-10 16:53:35.636414'),(30,'reserve','0010_remove_vehiculos_value_tour_destination','2023-08-10 16:53:35.671133'),(31,'reserve','0011_alter_destination_options','2023-08-10 16:53:35.680481'),(32,'reserve','0012_zone_update_at','2023-08-10 16:53:35.692176'),(33,'reserve','0013_barriolist_remove_zone_hotel_remove_zone_value_tour_and_more','2023-08-10 16:53:35.739105'),(34,'reserve','0014_remove_zone_barrio_zone_barrios','2023-08-10 16:53:35.770632'),(35,'reserve','0015_remove_destination_price1_remove_destination_price2_and_more','2023-08-10 16:53:35.825400'),(36,'reserve','0016_remove_zone_barrios','2023-08-10 16:53:35.862930'),(37,'reserve','0017_remove_destination_zone_destination_barrio','2023-08-10 16:53:35.887692'),(38,'reserve','0018_remove_reserver_email_remove_reserver_fullname_and_more','2023-08-10 16:53:35.907641'),(39,'reserve','0019_vehiculos_tipo','2023-08-10 16:53:35.923283'),(40,'sessions','0001_initial','2023-08-10 16:53:35.935163'),(41,'tours','0001_initial','2023-08-10 16:53:35.941697'),(42,'tours','0002_exclusiones_inclusiones_remove_tours_include_and_more','2023-08-10 16:53:36.027240'),(43,'tours','0003_tours_cash','2023-08-10 16:53:36.040432'),(44,'tours','0004_alter_tours_cash','2023-08-10 16:53:36.052059'),(45,'tours','0005_alter_tours_cash','2023-08-10 16:53:36.064284'),(46,'booking','0004_booking_air_booking_nair','2024-01-05 12:48:57.088156');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f7djcmkh6pbygo6jyh3egl387u1gj5gr','.eJxVjMsOwiAQRf-FtSEMjwZcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuzAHH63RLSg9sO8h3brUvqbV3mJHdFHnTIa8_8vBzu30HFUb_1RATaAHhLUygeQ6AACE5nj86ExCqrpJItWhXvQWdWxRmr2WqHZJV4fwDP7Tdd:1sSi29:Ub6Wb4GSHsiRLbYGsQUV3jN2Wz0xRhvsaFAaIzwrsL0','2024-07-27 19:03:49.399107'),('gc8v1lssq9ybuiayxea9ndd0myi2tnfq','.eJxVjMsOwiAQRf-FtSEMjwZcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuzAHH63RLSg9sO8h3brUvqbV3mJHdFHnTIa8_8vBzu30HFUb_1RATaAHhLUygeQ6AACE5nj86ExCqrpJItWhXvQWdWxRmr2WqHZJV4fwDP7Tdd:1qUCvI:DimZ6YgDnoziVqW8SBVmmXLzRFQuK5e_3pnPenCPH8k','2023-08-24 21:10:24.770922'),('gegmntzw8j2fwneehcvsx4zcgo1notor','.eJxVjE0OwiAYBe_C2hBA-Aou3fcM5PGjVA0kpV0Z726bdKHbNzPvzTzWpfi159lPiV2YYqffLSA-c91BeqDeG4-tLvMU-K7wg3Y-tpRf18P9OyjoZauhyQqlKdBNGkAbqZBNFokUDQRjBKTMklwwLjnozQhCRGtJnYEwsM8Xw943KA:1sdhNN:G1fb8SViozQetVSmmLvlQvrXerhCb9rSjTC-bv9-B44','2024-08-27 02:35:09.261124'),('itewyh9mue4go9mwkcqzx5blyixy7g5c','.eJxVjMsOwiAQRf-FtSEMjwZcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuzAHH63RLSg9sO8h3brUvqbV3mJHdFHnTIa8_8vBzu30HFUb_1RATaAHhLUygeQ6AACE5nj86ExCqrpJItWhXvQWdWxRmr2WqHZJV4fwDP7Tdd:1qUBLW:w8f1XRh8Heu_EDHbvOr4m7N6LMq7fDPiNPDQMxVHmLk','2023-08-24 19:29:22.907736');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_airportorterminal`
--

DROP TABLE IF EXISTS `reserve_airportorterminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_airportorterminal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `value` varchar(300) NOT NULL,
  `address_URL` varchar(400) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price1` varchar(300) DEFAULT NULL,
  `price2` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reserve_airportorterminal_user_id_aea861b1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reserve_airportorterminal_user_id_aea861b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_airportorterminal`
--

LOCK TABLES `reserve_airportorterminal` WRITE;
/*!40000 ALTER TABLE `reserve_airportorterminal` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_airportorterminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_barriolist`
--

DROP TABLE IF EXISTS `reserve_barriolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_barriolist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_barriolist`
--

LOCK TABLES `reserve_barriolist` WRITE;
/*!40000 ALTER TABLE `reserve_barriolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_barriolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_destination`
--

DROP TABLE IF EXISTS `reserve_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_destination` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `value` varchar(300) NOT NULL,
  `address_URL` varchar(400) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barrio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserve_destination_user_id_74dcf9c4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reserve_destination_user_id_74dcf9c4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_destination`
--

LOCK TABLES `reserve_destination` WRITE;
/*!40000 ALTER TABLE `reserve_destination` DISABLE KEYS */;
INSERT INTO `reserve_destination` VALUES (1,'Hilton Cartagena','Hilton Cartagena','https://maps.google.com/maps?ll=10.400107,-75.555987&z=15&t=m&hl=es-CO&gl=US&mapclient=apiv3&cid=680520566149475741',2,'2023-08-10 16:25:32.000000','2023-08-10 16:25:32.000000',1,'Bocagrande'),(2,'Inter Continental Cartagena de Indias','Inter Continental Cartagena de Indias','https://maps.google.com/maps?ll=10.400107,-75.555987&z=15&t=m&hl=es-CO&gl=US&mapclient=apiv3&cid=12090906177046963769',3,'2023-08-10 16:25:32.000000','2023-08-10 16:25:32.000000',1,'Bocagrande'),(3,'Aeropuerto Rafael Nuñez','Aeropuerto Rafael Nuñez','https://goo.gl/maps/QKGsUySSwxgc8bV16?coh=178571&entry=tt',1,'2023-08-10 16:27:46.000000','2023-08-10 16:27:46.000000',1,'Crespo'),(4,'hotel cartagena premium','hotel cartagena premium','https://maps.google.com/maps?ll=10.409601,-75.552756&z=16&t=m&hl=es-CO&gl=US&mapclient=apiv3&cid=16954714968242909162',4,'2023-08-10 16:29:00.000000','2023-08-10 16:29:00.000000',1,'Bocagrande');
/*!40000 ALTER TABLE `reserve_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_hotellist`
--

DROP TABLE IF EXISTS `reserve_hotellist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_hotellist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `value` varchar(300) NOT NULL,
  `address_url` varchar(400) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price1` varchar(300) DEFAULT NULL,
  `price2` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reserve_hotellist_user_id_1cbf2b1b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reserve_hotellist_user_id_1cbf2b1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_hotellist`
--

LOCK TABLES `reserve_hotellist` WRITE;
/*!40000 ALTER TABLE `reserve_hotellist` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_hotellist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_reserver`
--

DROP TABLE IF EXISTS `reserve_reserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_reserver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_and_route` varchar(200) NOT NULL,
  `end_and_route` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `hour` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `ve_name` varchar(300) NOT NULL,
  `ve_value` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_reserver`
--

LOCK TABLES `reserve_reserver` WRITE;
/*!40000 ALTER TABLE `reserve_reserver` DISABLE KEYS */;
INSERT INTO `reserve_reserver` VALUES (1,'Aeropuerto Rafael Nuñez','Hilton Cartagena','2023-08-11','18:32','2023-08-10 21:30:20.649379','2023-08-10 21:30:20.650913','null','null'),(2,'Aeropuerto Rafael Nuñez','Hilton Cartagena 1','2023-08-10','05:47','2023-08-10 21:46:38.360018','2023-08-10 21:46:38.360048','null','null'),(3,'Aeropuerto Rafael Nuñez','Hilton Cartagena','2023-08-11','20:50','2023-08-10 21:47:36.078803','2023-08-10 21:47:36.078824','null','null'),(4,'Aeropuerto Rafael Nuñez','hotel capilla del mar','2023-08-13','17:30','2023-08-10 23:29:21.705284','2023-08-10 23:29:21.705305','null','null'),(5,'Aeropuerto Rafael Nuñez','hotel capilla del mar','2023-08-13','17:30','2023-08-10 23:29:26.414378','2023-08-10 23:29:26.414435','null','null'),(6,'Aeropuerto Rafael Nuñez','Bahia de Castillo Grande','2023-08-18','19:43','2023-08-11 21:40:35.143701','2023-08-11 21:40:35.143728','null','null'),(7,'Aeropuerto Rafael Nuñez','Casa Claver Loft Boutique Hotel','2023-12-10','14:20','2023-08-15 18:39:04.693212','2023-08-15 18:39:04.693480','null','null'),(8,'Aeropuerto Rafael Nuñez','hotel dann ','2023-11-30','21:30','2023-08-16 01:08:16.591110','2023-08-16 01:08:16.591134','null','null'),(9,'Aeropuerto Rafael Nuñez','Hilton Cartagena','2023-11-30','21:30','2023-08-16 01:08:37.094300','2023-08-16 01:08:37.094321','null','null'),(10,'san andres','san andres','2023-09-14','06:09','2023-08-16 19:10:09.255603','2023-08-16 19:10:09.255634','null','null'),(11,'Aeropuerto Rafael Nuñez','Inter Continental Cartagena de Indias','2023-08-19','09:37','2023-08-18 13:57:51.866442','2023-08-18 13:57:51.866466','null','null'),(12,'Aeropuerto Rafael Nuñez','hotel playa club','2023-09-15','16:45','2023-08-21 15:41:48.312960','2023-08-21 15:41:48.312999','null','null');
/*!40000 ALTER TABLE `reserve_reserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_vehiculos`
--

DROP TABLE IF EXISTS `reserve_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_vehiculos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `Number_passengers` int(11) NOT NULL,
  `amount_luggage` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserve_vehiculos_user_id_f6009dd7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reserve_vehiculos_user_id_f6009dd7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_vehiculos`
--

LOCK TABLES `reserve_vehiculos` WRITE;
/*!40000 ALTER TABLE `reserve_vehiculos` DISABLE KEYS */;
INSERT INTO `reserve_vehiculos` VALUES (1,'Mercedes Sprinter',17,17,'articles/mercedezsprinter.png',4,'2023-08-10 16:12:51.000000','2024-08-13 02:43:27.035808',1,'micro_bus'),(2,'Suzuki Vitara',3,3,'articles/pngwing.com.png',1,'2023-08-10 16:12:51.000000','2024-08-13 02:43:00.996006',1,'standar'),(3,'Renaul Master',12,12,'articles/kisspng-renault-master-van-renault-z-e-car-renault-5accdebc5470d4.0900816915233_LgtnLiQ.png',3,'2023-08-10 16:16:47.000000','2024-08-13 02:43:17.201040',1,'van_standar'),(4,'Hyundai H1',7,7,'articles/pngegg.png',2,'2023-08-10 16:16:47.000000','2024-08-13 02:43:09.277386',1,'mini_van'),(5,'Hiunday County',22,22,'articles/kisspng-minibus-toyota-hiace-car-coach-coaster-5b0cad5ba41174.246291591527557467672.png',5,'2023-08-10 16:18:55.000000','2024-08-13 02:43:38.544716',1,'buseta'),(6,'Bus',30,30,'articles/White-Bus-Transparent-Background.png',6,'2023-08-10 16:18:55.000000','2024-08-13 02:43:46.957116',1,'bus'),(8,'Van Compartida',17,17,'articles/mercedezsprinter_zysN4wP.png',0,'2024-07-13 18:50:23.477075','2024-07-13 18:50:50.509776',1,'mini_van');
/*!40000 ALTER TABLE `reserve_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_zone`
--

DROP TABLE IF EXISTS `reserve_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_zone`
--

LOCK TABLES `reserve_zone` WRITE;
/*!40000 ALTER TABLE `reserve_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_exclusiones`
--

DROP TABLE IF EXISTS `tours_exclusiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours_exclusiones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_exclusiones`
--

LOCK TABLES `tours_exclusiones` WRITE;
/*!40000 ALTER TABLE `tours_exclusiones` DISABLE KEYS */;
INSERT INTO `tours_exclusiones` VALUES (1,'Tasa portuaria ( $25.000 COP )','2023-08-10 15:24:01.000000','2023-08-10 15:24:01.000000'),(2,'Mujer Embarazada','2023-08-10 15:24:01.000000','2023-08-10 15:24:01.000000'),(3,'Persona con problema de espalda','2023-08-10 15:24:52.000000','2023-08-10 15:24:52.000000'),(4,'Traslado del muelle al hotel','2023-08-10 15:24:52.000000','2023-08-10 15:24:52.000000'),(5,'Baños ( con costo adicional )','2023-08-10 15:25:36.000000','2023-08-10 15:25:36.000000'),(6,'sillas asoliadoras','2023-08-10 15:25:57.000000','2023-08-10 15:25:57.000000'),(7,'Carpas','2023-08-10 15:26:15.000000','2023-08-10 15:26:15.000000'),(8,'Ingreso al acuario ( Valor adicional)','2023-08-10 15:26:15.000000','2023-08-10 15:26:15.000000');
/*!40000 ALTER TABLE `tours_exclusiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_inclusiones`
--

DROP TABLE IF EXISTS `tours_inclusiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours_inclusiones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_inclusiones`
--

LOCK TABLES `tours_inclusiones` WRITE;
/*!40000 ALTER TABLE `tours_inclusiones` DISABLE KEYS */;
INSERT INTO `tours_inclusiones` VALUES (1,'Muestra musical en Vivo.','2023-08-10 15:12:36.000000','2023-08-10 15:12:36.000000'),(2,'Recogida en hoteles ( Bocagrande,Laguito, Centro); Zona norte (Marbella, Crespo, La boquilla).','2023-08-10 15:14:47.000000','2023-08-10 15:14:47.000000'),(3,'Coctel de bienvenida','2023-08-10 15:14:47.000000','2023-08-10 15:14:47.000000'),(4,'Traslado lancha rapida ida y vuelta','2023-08-10 15:15:47.000000','2023-08-10 15:15:47.000000'),(5,'Asoliadoras','2023-08-10 15:16:02.000000','2023-08-10 15:16:02.000000'),(6,'Carpas en la playa','2023-08-10 15:16:31.000000','2023-08-10 15:16:31.000000'),(7,'Translados in/out Bocagramde','2023-08-10 15:17:04.000000','2023-08-10 15:17:04.000000'),(8,'Almuerzo Tipico','2023-08-10 15:17:28.000000','2023-08-10 15:17:29.000000'),(9,'Recogida hotel ( Bocagrande, Laguito )','2023-08-10 15:17:29.000000','2023-08-10 15:17:29.000000'),(10,'Panoramico Por Ciudad En Chiva Tipica','2023-08-10 15:18:23.000000','2023-08-10 15:18:23.000000'),(11,'Ingreso Al Fuerte San Felipe','2023-08-10 15:18:23.000000','2023-08-10 15:18:23.000000');
/*!40000 ALTER TABLE `tours_inclusiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_tours`
--

DROP TABLE IF EXISTS `tours_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours_tours` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `image4` varchar(100) NOT NULL,
  `info` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `cash` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_tours`
--

LOCK TABLES `tours_tours` WRITE;
/*!40000 ALTER TABLE `tours_tours` DISABLE KEYS */;
INSERT INTO `tours_tours` VALUES (3,'Playa Tranquila','Las playas de Barú son indiscutiblemente las playas más hermosas de Cartagena de Indias','Imagen 1/IM_5_.jpg','Imagen 2/IM_2_.jpg','Imagen 3/IM_3_.jpg','Imagen 4/IM_4.jpg','<p>Las playas de Bar&uacute; son indiscutiblemente las playas m&aacute;s hermosas de Cartagena de Indias y desde la construcci&oacute;n del nuevo puente que conecta la isla de Bar&uacute; con Cartagena, se convierte en una maravillosa opci&oacute;n para quienes prefieren viajar por tierra y no sentir las olas o la turbulencia de las embarcaciones marinas. &nbsp;Cuando llegues Bar&uacute; seras transportado a un sector playa tranquila en el cual gozar&aacute; de un espacio menos concurrido y podr&aacute;s disfrutar del paisaje.&nbsp;</p>','2023-08-10 15:30:25.000000','2023-08-10 15:30:25.000000',100000),(4,'Baru - Playa blanca via Lancha','Las bellas Islas del Rosario son un sitio hermoso para visitar, consideradas una maravilla de la naturaleza.','Imagen 1/img_1_.jpg','Imagen 2/baru_2.png','Imagen 3/baru_3.png','Imagen 4/baru_4.png','\"<p>Las bellas Islas del Rosario son un sitio hermoso para visitar, consideradas una maravilla de la naturaleza. Sus paisajes naturales, el agua cristalina y las formaciones coralinas muestran un ecosistema &uacute;nico en el mundo. Visitarlas es un paseo muy divertido no solo para los adultos, tambi&eacute;n para los ni&ntilde;os puesto que tienen la oportunidad de visitar el oceanario llamado san Martin de pajarales, el cual se encuentra ubicado en el centro de las islas del Rosario, las cuales en el recorrido van a poder observar panor&aacute;micamente.<br />\r\nPara las personas que deseen entrar al acuario podr&aacute;n hacerlo por un valor de $ 35.000 por persona<br />\r\ny podr&aacute;n ver la variedad de especies marinas, adicional a esto habr&aacute; un show de delfines.</p>','2023-08-10 15:38:19.000000','2023-08-10 15:38:19.000000',100000),(5,'San Basilio de Palenque','En Colombia se preserva intacto el primer pueblo libre de América,','Imagen 1/palenque_bienvenido.jpg','Imagen 2/experiencia_U3NUTtk.jpg','Imagen 3/almuerzo.jpg','Imagen 4/pal.jpg','<p>En Colombia se preserva intacto el primer pueblo libre de Am&eacute;rica, fundado por cimarrones que huyeron de la esclavitud en &eacute;poca colonial. Un lugar &uacute;nico en el mundo, detenido en el tiempo; famoso por su cultura, su lengua, su gastronom&iacute;a y su historia.</p>\r\n\r\n<p>M&aacute;s de 200 a&ntilde;os antes de que Colombia se independizara de Espa&ntilde;a, se fundaron las tierras libres de San Basilio de Palenque. En 1603 se firm&oacute; la capitulaci&oacute;n de paz entre cimarrones y espa&ntilde;oles. A&ntilde;os m&aacute;s tarde, en 1713, la Corona de Espa&ntilde;a emiti&oacute; el Decreto Real declarando aquel palenque libre de esclavitud. A la postre, En 2005, el lugar fue declarado Obra Maestra del Patrimonio Oral e Inmaterial de la Humanidad por la UNESCO, ya que por suerte su cultura y sus&nbsp;tradiciones africanas&nbsp;se han preservado intactas en el tiempo. Un lugar &uacute;nico en el mundo, donde la gastronom&iacute;a, el idioma, la m&uacute;sica, la cultura, la medicina y la organizaci&oacute;n social tienen su propia significaci&oacute;n.</p>','2023-08-10 15:55:12.000000','2023-08-10 15:55:12.000000',300000),(6,'City Tour Express (Minimo 2 personas)','Tour en vehículo climatizado y compartido express, el tour ideal para las personas que desean conocer la ciudad sin tener que ingresar a los monumentos.','Imagen 1/img_1.jpg','Imagen 2/img_2.jpg','Imagen 3/img_3.jpg','Imagen 4/img_4.jpg','<p>Tour en veh&iacute;culo climatizado y compartido express, el tour ideal para las personas que desean conocer la ciudad sin tener que ingresar a los monumentos. En este recorrido conocer&aacute;s panor&aacute;micamente Barrios residenciales como Bocagrande, Castillogrande y el barrio republicano de Manga donde se pueden apreciar las casonas de la &eacute;poca Colonial y republicana, pasamos por el Fuerte de San Felipe de Barajas declarado patrimonio de la humanidad por la UNESCO, luego iremos al centro<br />\r\nhist&oacute;rico donde visitaremos las b&oacute;vedas situadas entre las murallas de Santa Clara y Santa Catalina donde si lo deseas podr&aacute;s comprar souvenirs, Al terminar el recorrido las personas pueden quedarse en el Centro o los trasladamos de vuelta a su hotel.</p>','2023-08-10 15:55:12.000000','2023-08-10 15:55:12.000000',80000),(7,'Excursión Tierra Bomba','Experimente la paz de la isla de Tierra Bomba. Maravíllese ante el histórico fuerte militar de San Fernando.','Imagen 1/playa_morena.jpg','Imagen 2/instalaciones.jpg','Imagen 3/panoramica_fuerte.jpg','Imagen 4/fuerte_1.jpg','<p>Experimente la paz de la isla de Tierra Bomba. Marav&iacute;llese ante el hist&oacute;rico fuerte militar de San Fernando. Tome el sol en el Beach club de Playa Morena y haga uso de sus instalaciones. Disfrute de un exquisito almuerzo.&nbsp;<br />\r\nLlegada al punto de encuentro en el muelle de la Bodeguita a las 8:00 de la ma&ntilde;ana. Re&uacute;nase con el personal de Playa Morena y pague la tasa portuaria. Esperamos el zarpe y una vez llegue a la isla lo recibe nuestro gu&iacute;a con el cual realizar&aacute; &nbsp;walking tour por el fuerte y luego disfrutar&aacute; las instalaciones del club, que incluyen sillas, camas asoleadoras y boh&iacute;os. Pase un rato en la playa. Disfrute de un delicioso almuerzo. Vuelva a Cartagena a las 15:00 y termine su excursi&oacute;n cuando llegue al muelle de la Bodeguita.&nbsp;</p>','2023-08-10 15:58:33.000000','2023-08-10 15:58:33.000000',130000),(8,'Volcan del Totumo','A tan solo 40 minutos de la ciudad está ubicado el volcán del totumo, Este gran atractivo turístico, considerado','Imagen 1/png_6.png','Imagen 2/img_2_JZ2Acwa.jpg','Imagen 3/png_2.png','Imagen 4/png_3.png','<p>A tan solo 40 minutos de la ciudad est&aacute; ubicado el volc&aacute;n del totumo, Este gran atractivo tur&iacute;stico, considerado<br />\r\ncomo una maravilla ex&oacute;tica y natural tiene aproximadamente 20 metros de altura, lodo fluyendo permanentemente, tibio y denso, que adem&aacute;s cuenta con propiedades medicinales.<br />\r\nEs un plan diferente y se recomienda a todo tipo de p&uacute;blico, Seguidamente nos trasladamos a la zona pesquera de la Boquilla o Manzanillo del Mar donde podr&aacute; disfrutar sus tranquilas playas y deleitarse con un t&iacute;pico almuerzo caribe&ntilde;o.</p>','2023-08-10 15:58:33.000000','2023-08-10 15:58:33.000000',95000),(9,'Baru - Playa Blanca Via Terrestre (Compartido)','Es una nueva forma de conocer la famosa isla y disfrutar de un hermoso paisaje que se encuentra a sólo 1 hora de la ciudad.','Imagen 1/IMG_1.jpg','Imagen 2/img_4_.jpg','Imagen 3/img_5_.jpg','Imagen 4/IMG_7.jpg','<p>Las playas de Bar&uacute; son indiscutiblemente las playas m&aacute;s hermosas de Cartagena de Indias y desde la construcci&oacute;n del nuevo puente que conecta la isla de Bar&uacute; con Cartagena, se convierte en una maravillosa opci&oacute;n para quienes prefieren viajar por tierra y no sentir las olas o la turbulencia de las embarcaciones marinas. Es una nueva forma de conocer la famosa isla y disfrutar de un hermoso paisaje que se encuentra a s&oacute;lo 1 hora de la ciudad. Es la isla favorita tanto de turistas como de nativos de la ciudad de Cartagena. Bar&uacute; se puede disfrutar de un delicioso almuerzo t&iacute;pico, recomendamos hacer este tour entre semana.</p>','2023-08-10 16:01:08.000000','2023-08-10 16:01:08.000000',45000),(10,'Isla del Sol','Isla del sol ubicados a 55 minutos de Cartagena de Indias contamos con 9 habitaciones tipo Bungalow Deluxe, Estándar y Clásica;','Imagen 1/Pasadia.jpg','Imagen 2/IMG_0423.jpg','Imagen 3/image00025.jpeg','Imagen 4/IMG_20210330_111324.jpg','<p><strong>Isla del sol</strong>&nbsp;ubicados a 55 minutos de&nbsp;<strong>Cartagena de Indias</strong>&nbsp;contamos con 9 habitaciones tipo Bungalow Deluxe, Est&aacute;ndar y Cl&aacute;sica; &aacute;reas sociales y una playa privada lo que se convierte en una verdadera experiencia, un mundo por explorar en el Parque Nacional Corales del Rosario y San Bernardo &ndash;&nbsp;<strong>Islas del Rosario.</strong></p>\r\n\r\n<p>En el hotel&nbsp;<strong>isla del sol</strong>&nbsp;se pueden contratar durante el d&iacute;a actividades como buceo con tanque, snorkel, caminatas ecol&oacute;gicas, tour por los manglares, visita al acuario y masajes relajantes.</p>','2023-08-10 16:01:08.000000','2023-08-10 16:01:08.000000',270000),(11,'City Tour Entrada Castillo','Si estás interesado en conocer Cartagena y conocer gran parte de su historia.','Imagen 1/img_2.jpg','Imagen 2/city_tour.jpg','Imagen 3/png_6.png','Imagen 4/png_4.png','<p>Si est&aacute;s interesado en conocer Cartagena y conocer gran parte de su historia. Este es el tour ideal para hacerlo, pues no solo conocer&aacute;s los principales monumentos culturales de la ciudad, sino que tendr&aacute;s la oportunidad de adentrarte en ellos. Conoceremos los barrios como Bocagrande, El laguito, Castillogrande, Manga y parte del Centro Hist&oacute;rico en el cual se dar&aacute; un tiempo libre para que puedan realizar compra de recuerdos y esparcimiento libre.</p>','2023-08-10 16:03:25.000000','2023-08-10 16:03:25.000000',60000),(12,'Isla del encanda','Un hermoso paisaje ubicado dentro del Parque Corales del Rosario a 60 minutos en lancha desde la fantástica Cartagena de Indias','Imagen 1/WhatsApp_Image_2023-07-14_at_12.34.21_PM_1.jpeg','Imagen 2/WhatsApp_Image_2023-07-14_at_12.34.18_PM.jpeg','Imagen 3/WhatsApp_Image_2023-07-14_at_12.34.19_PM_1.jpeg\"','\"Imagen 4/WhatsApp_Image_2023-07-14_at_12.34.20_PM_2.jpeg','<p>Un hermoso paisaje ubicado dentro del Parque Corales del Rosario a 60 minutos en lancha desde la fant&aacute;stica Cartagena de Indias. La Isla del Encanto es el sitio donde el excelente servicio y el relax se combinan para brindarte una experiencia memorable y as&iacute; disfrutar intensamente de tus vacaciones.</p>','2023-08-10 16:03:25.000000','2023-08-10 16:03:25.000000',280000);
/*!40000 ALTER TABLE `tours_tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_tours_include`
--

DROP TABLE IF EXISTS `tours_tours_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours_tours_include` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tours_id` bigint(20) NOT NULL,
  `inclusiones_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tours_tours_include_tours_id_inclusiones_id_ceb14f64_uniq` (`tours_id`,`inclusiones_id`),
  KEY `tours_tours_include_inclusiones_id_5ee65475_fk_tours_inc` (`inclusiones_id`),
  CONSTRAINT `tours_tours_include_inclusiones_id_5ee65475_fk_tours_inc` FOREIGN KEY (`inclusiones_id`) REFERENCES `tours_inclusiones` (`id`),
  CONSTRAINT `tours_tours_include_tours_id_5bd8a82e_fk_tours_tours_id` FOREIGN KEY (`tours_id`) REFERENCES `tours_tours` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_tours_include`
--

LOCK TABLES `tours_tours_include` WRITE;
/*!40000 ALTER TABLE `tours_tours_include` DISABLE KEYS */;
/*!40000 ALTER TABLE `tours_tours_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_tours_noinclude`
--

DROP TABLE IF EXISTS `tours_tours_noinclude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours_tours_noinclude` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tours_id` bigint(20) NOT NULL,
  `exclusiones_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tours_tours_noinclude_tours_id_exclusiones_id_9c3dc3eb_uniq` (`tours_id`,`exclusiones_id`),
  KEY `tours_tours_noinclud_exclusiones_id_ed3bd1f4_fk_tours_exc` (`exclusiones_id`),
  CONSTRAINT `tours_tours_noinclud_exclusiones_id_ed3bd1f4_fk_tours_exc` FOREIGN KEY (`exclusiones_id`) REFERENCES `tours_exclusiones` (`id`),
  CONSTRAINT `tours_tours_noinclude_tours_id_c13e675c_fk_tours_tours_id` FOREIGN KEY (`tours_id`) REFERENCES `tours_tours` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_tours_noinclude`
--

LOCK TABLES `tours_tours_noinclude` WRITE;
/*!40000 ALTER TABLE `tours_tours_noinclude` DISABLE KEYS */;
/*!40000 ALTER TABLE `tours_tours_noinclude` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 14:55:02
