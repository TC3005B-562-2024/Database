CREATE DATABASE  IF NOT EXISTS `aci` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aci`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 34.27.208.49    Database: aci
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `identifier` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection_identifier` int unsigned NOT NULL,
  `insight_identifier` smallint unsigned NOT NULL,
  `training_identifier` smallint unsigned DEFAULT NULL,
  `resource` varchar(200) NOT NULL,
  `date_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_solved` tinyint unsigned NOT NULL DEFAULT '0',
  `date_training_completed` datetime DEFAULT NULL,
  `has_training` tinyint unsigned GENERATED ALWAYS AS (if((`training_identifier` is not null),1,0)) VIRTUAL,
  `is_training_completed` tinyint unsigned GENERATED ALWAYS AS (if((`date_training_completed` is not null),1,0)) VIRTUAL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`),
  KEY `fk_alert_connection1_idx` (`connection_identifier`),
  KEY `fk_alert_training1_idx` (`training_identifier`),
  KEY `fk_alert_insight1_idx` (`insight_identifier`),
  KEY `resource_INDEX` (`resource`) /*!80000 INVISIBLE */,
  KEY `date_updated_INDEX` (`date_updated`) /*!80000 INVISIBLE */,
  KEY `is_solved_INDEX` (`is_solved`),
  CONSTRAINT `fk_alert_connection1` FOREIGN KEY (`connection_identifier`) REFERENCES `connection` (`identifier`),
  CONSTRAINT `fk_alert_insight1` FOREIGN KEY (`insight_identifier`) REFERENCES `insight` (`identifier`),
  CONSTRAINT `fk_alert_training1` FOREIGN KEY (`training_identifier`) REFERENCES `training` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`34.27.208.49`*/ /*!50003 TRIGGER `update_alert_date_updated` BEFORE UPDATE ON `alert` FOR EACH ROW BEGIN
    SET NEW.date_updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `all_alerts`
--

DROP TABLE IF EXISTS `all_alerts`;
/*!50001 DROP VIEW IF EXISTS `all_alerts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_alerts` AS SELECT 
 1 AS `identifier`,
 1 AS `connection_identifier`,
 1 AS `insight_identifier`,
 1 AS `training_identifier`,
 1 AS `resource`,
 1 AS `date_registered`,
 1 AS `date_updated`,
 1 AS `is_solved`,
 1 AS `date_training_completed`,
 1 AS `has_training`,
 1 AS `is_training_completed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_alerts_with_training`
--

DROP TABLE IF EXISTS `all_alerts_with_training`;
/*!50001 DROP VIEW IF EXISTS `all_alerts_with_training`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_alerts_with_training` AS SELECT 
 1 AS `identifier`,
 1 AS `denomination`,
 1 AS `alert.identifier`,
 1 AS `alert.is_solved`,
 1 AS `alert.date_registered`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_categories`
--

DROP TABLE IF EXISTS `all_categories`;
/*!50001 DROP VIEW IF EXISTS `all_categories`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_categories` AS SELECT 
 1 AS `identifier`,
 1 AS `denomination`,
 1 AS `description`,
 1 AS `priority`,
 1 AS `date_registered`,
 1 AS `date_updated`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_connections`
--

DROP TABLE IF EXISTS `all_connections`;
/*!50001 DROP VIEW IF EXISTS `all_connections`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_connections` AS SELECT 
 1 AS `identifier`,
 1 AS `denomination`,
 1 AS `description`,
 1 AS `date_joined`,
 1 AS `date_updated`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_insights`
--

DROP TABLE IF EXISTS `all_insights`;
/*!50001 DROP VIEW IF EXISTS `all_insights`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_insights` AS SELECT 
 1 AS `identifier`,
 1 AS `category_identifier`,
 1 AS `denomination`,
 1 AS `description`,
 1 AS `date_registered`,
 1 AS `date_updated`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_insights_with_category`
--

DROP TABLE IF EXISTS `all_insights_with_category`;
/*!50001 DROP VIEW IF EXISTS `all_insights_with_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_insights_with_category` AS SELECT 
 1 AS `identifier`,
 1 AS `denomination`,
 1 AS `insight.identifier`,
 1 AS `insight.denomination`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_trainings`
--

DROP TABLE IF EXISTS `all_trainings`;
/*!50001 DROP VIEW IF EXISTS `all_trainings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_trainings` AS SELECT 
 1 AS `identifier`,
 1 AS `denomination`,
 1 AS `description`,
 1 AS `date_registered`,
 1 AS `date_updated`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `identifier` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `denomination` varchar(100) NOT NULL,
  `description` tinytext,
  `priority` tinyint unsigned NOT NULL,
  `date_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`),
  UNIQUE KEY `denomination_UNIQUE` (`denomination`),
  KEY `priority_INDEX` (`priority`) /*!80000 INVISIBLE */,
  KEY `date_updated_INDEX` (`date_updated`) /*!80000 INVISIBLE */,
  KEY `is_active_INDEX` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'training','The agents have to attend to specialized courses.',1,'2024-04-28 18:01:50','2024-05-01 23:19:07',1),(7,'intervene','Supervisor must barge into the call to calm things up.',3,'2024-04-28 18:06:52','2024-05-01 23:19:35',1),(9,'transfer','Move an agent to a resource where its help is needed',2,'2024-04-28 18:22:01','2024-05-01 23:20:00',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`34.27.208.49`*/ /*!50003 TRIGGER `update_category_date_updated` BEFORE UPDATE ON `category` FOR EACH ROW BEGIN
    SET NEW.date_updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `identifier` int unsigned NOT NULL AUTO_INCREMENT,
  `denomination` varchar(100) NOT NULL,
  `description` tinytext,
  `date_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`),
  UNIQUE KEY `denomination_UNIQUE` (`denomination`) /*!80000 INVISIBLE */,
  KEY `date_updated_INDEX` (`date_updated`) /*!80000 INVISIBLE */,
  KEY `is_active_INDEX` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`34.27.208.49`*/ /*!50003 TRIGGER `update_connection_date_updated` BEFORE UPDATE ON `connection` FOR EACH ROW BEGIN
        SET NEW.date_updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insight`
--

DROP TABLE IF EXISTS `insight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insight` (
  `identifier` smallint unsigned NOT NULL AUTO_INCREMENT,
  `category_identifier` tinyint unsigned NOT NULL,
  `denomination` varchar(100) NOT NULL,
  `description` text,
  `date_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`),
  UNIQUE KEY `denomination_UNIQUE` (`denomination`),
  KEY `fk_insight_category_idx` (`category_identifier`),
  KEY `date_updated_INDEX` (`date_updated`) /*!80000 INVISIBLE */,
  KEY `is_active_INDEX` (`is_active`),
  CONSTRAINT `fk_insight_category` FOREIGN KEY (`category_identifier`) REFERENCES `category` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insight`
--

LOCK TABLES `insight` WRITE;
/*!40000 ALTER TABLE `insight` DISABLE KEYS */;
INSERT INTO `insight` VALUES (10,6,'Clear Communication and Documentation Familiarity','The extended call times and excessive hold times indicate that agents may struggle with maintaining concise and efficient conversations. Moreover, the disparity between personal AHT and skill-based AHT, as well as personal Hold Time exceeding Hold Time by skill, suggests that agents may not be effectively utilizing available resources or are unfamiliar with necessary documentation. A focused training is needed to enhance agents\' ability to communicate clearly and concisely, as well as to improve their familiarity with relevant documentation to reduce wait times and enhance call handling efficiency.','2024-05-01 16:35:51','2024-05-01 16:35:51',1),(11,6,'Improving Schedule Adherence by Reducing Disconnects','The schedule adherence rate falling below 90% indicates that agents are disconnecting from their schedules frequently. To address this issue, agents need to minimize the number of disconnections and adhere more closely to their assigned schedules.','2024-05-01 16:38:08','2024-05-01 16:38:08',1),(12,6,'Enhancing Response Time and Interface Familiarity for Improved ASA','The high Average Speed of Answer (ASA) with personal ASA exceeding skill-based ASA indicates that agents need to respond faster. Additionally, with personal ASA at or below 5 seconds, agents should be more familiar with the documentation interface. Training should focus on improving response times and ensuring agents are adept at navigating documentation interfaces to maintain high service levels.','2024-05-01 16:39:16','2024-05-01 16:39:16',1),(13,7,'Addressing High Call Times and Negative Contact Lens','The situation where personal Average Handling Time (AHT) exceeds skill-based AHT, along with contact lenses indicating anger, calls for intervention. Agents need assistance in managing both call times and effectively handling irate contact lenses.','2024-05-01 16:41:18','2024-05-01 16:41:18',1),(14,9,'Optimizing Agent Skill Allocation for Improved SL','To maintain a high Service Level (SL), agents from Skill A should be moved to Skill B if the SL of Skill A falls below 80% within 20 seconds, provided that Skill B has an SL greater than 80% within the same timeframe. This proactive adjustment can ensure better service delivery and optimize resource allocation.','2024-05-01 16:45:16','2024-05-01 16:45:16',1),(15,9,'Optimizing Agent Skill Allocation for Improved ACR','To address high Average Call Resolution (ACR) rates, agents from Skill A should be moved to Skill B if the ACR of Skill A exceeds 5%. This transfer should be made to a skill with an SL greater than 80%. By reallocating agents based on ACR performance, overall efficiency and customer satisfaction can be enhanced.','2024-05-01 16:46:20','2024-05-01 16:46:20',1),(16,9,'Optimizing Agent Skill Allocation for High Occupancy','When the average occupancy of Skill A exceeds 95%, agents should be moved from Skill A to Skill B, which has a lower average occupancy. This proactive reallocation ensures that agents are distributed effectively to maintain optimal occupancy levels across skills.','2024-05-01 16:47:04','2024-05-01 16:47:04',1);
/*!40000 ALTER TABLE `insight` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`34.27.208.49`*/ /*!50003 TRIGGER `update_insight_date_updated` BEFORE UPDATE ON `insight` FOR EACH ROW BEGIN
    SET NEW.date_updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `identifier` smallint unsigned NOT NULL AUTO_INCREMENT,
  `denomination` varchar(100) NOT NULL,
  `description` text,
  `date_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`),
  UNIQUE KEY `denomination_UNIQUE` (`denomination`) /*!80000 INVISIBLE */,
  KEY `date_updated_INDEX` (`date_updated`) /*!80000 INVISIBLE */,
  KEY `is_active_INDEX` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,'Software Development','Training program for software development','2024-04-10 00:00:00','2024-04-15 00:00:00',1),(2,'Quality Control','Training program for quality control in manufacturing','2024-04-12 00:00:00','2024-04-16 00:00:00',1),(3,'Project Management','Training program for project management','2024-04-14 00:00:00','2024-04-18 00:00:00',1),(4,'Renewable Energy Technologies','Training program for renewable energy technologies','2024-04-15 00:00:00','2024-04-19 00:00:00',1),(5,'Software Development 1','Training program for software development','2024-04-25 00:00:00','2024-04-25 00:00:00',0),(6,'Software Development 2','Training program for software development','2024-04-25 00:00:00','2024-04-25 00:00:00',1),(7,'Software Development 3','Training program for software development 3','2024-04-25 00:00:00','2024-04-25 00:00:00',1),(8,'Software Development 4','Training program for software development 4','2024-04-25 00:00:00','2024-04-25 00:00:00',0),(9,'Software Development 5','Training program for software development','2024-04-25 00:00:00','2024-04-25 00:00:00',0),(10,'Spring Boot basics','The basics of Spring Boot development','2024-04-30 14:43:01','2024-04-30 14:43:01',1);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`34.27.208.49`*/ /*!50003 TRIGGER `update_training_date_updated` BEFORE UPDATE ON `training` FOR EACH ROW BEGIN
    SET NEW.date_updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'aci'
--

--
-- Dumping routines for database 'aci'
--
/*!50003 DROP PROCEDURE IF EXISTS `complete_alert_training` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `complete_alert_training`(IN alert_identifier_value BIGINT UNSIGNED)
BEGIN
UPDATE alert SET date_training_completed = NOW() WHERE identifier = alert_identifier_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_alert_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_alert_by_identifier`(IN id BIGINT UNSIGNED)
BEGIN
    SELECT connection_identifier, insight_identifier, training_identifier, date_registered, is_solved, date_training_completed FROM alert WHERE identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_alert_with_training_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_alert_with_training_by_identifier`(IN id BIGINT UNSIGNED)
BEGIN
SELECT training.identifier, training.denomination, alert.identifier as "alert.identifier", alert.is_solved AS "alert.is_solved", alert.date_registered AS "alert.date_registered"
FROM training LEFT JOIN alert ON alert.training_identifier = training.identifier WHERE alert.identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_alerts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_all_alerts`()
BEGIN
    SELECT * FROM all_alerts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_all_categories`()
BEGIN
    SELECT * FROM all_categories;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_connections` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_all_connections`()
BEGIN
    SELECT * FROM all_connections;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_insights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_all_insights`()
BEGIN
    SELECT * FROM all_insights;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_trainings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_all_trainings`()
BEGIN
    SELECT * FROM all_trainings;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_category_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_category_by_identifier`(IN id TINYINT UNSIGNED)
BEGIN
    SELECT denomination, description, priority, date_registered FROM insight WHERE identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_connection_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_connection_by_identifier`(IN id INT UNSIGNED)
BEGIN
    SELECT denomination, description, date_joined FROM connection WHERE identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_insight_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_insight_by_identifier`(IN id SMALLINT UNSIGNED)
BEGIN
    SELECT denomination, description, date_registered FROM insight WHERE identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_insight_with_category_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_insight_with_category_by_identifier`(IN id TINYINT UNSIGNED)
BEGIN
    SELECT category.identifier, category.denomination, insight.identifier as "insight.identifier", insight.denomination AS "insight.denomination" FROM insight
LEFT JOIN category ON insight.category_identifier = category.identifier WHERE category.identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_training_by_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `get_training_by_identifier`(IN id SMALLINT UNSIGNED)
BEGIN
    SELECT denomination, description, date_joined FROM training WHERE identifier = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_alert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `insert_alert`(IN connection_identifier_value INT UNSIGNED, IN insight_identifier_value SMALLINT UNSIGNED, IN training_identifier_value SMALLINT UNSIGNED, IN resource_value VARCHAR(200))
BEGIN
INSERT INTO alert(connection_identifier, insight_identifier, training_identifier, resource) VALUE (connection_identifier_value, insight_identifier_value, training_identifier_value, resource_value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `insert_category`(IN denomination_value VARCHAR(100), IN description_value TINYTEXT, IN priority_value TINYINT UNSIGNED)
BEGIN
INSERT INTO category(denomination, description, priority) VALUE (denomination_value, description_value, priority_value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_connection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `insert_connection`(IN denomination_value VARCHAR(100), IN description_value TINYTEXT)
BEGIN
INSERT INTO connection(denomination, description) VALUE (denomination_value, description_value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_insight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `insert_insight`(IN category_identifier_value TINYINT UNSIGNED, IN denomination_value VARCHAR(100), IN description_value TEXT)
BEGIN
INSERT INTO insight(category_identifier, denomination, description) VALUE (category_identifier_value, denomination_value, description_value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_training` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`34.27.208.49` PROCEDURE `insert_training`(IN denomination_value VARCHAR(100), IN description_value TEXT)
BEGIN
INSERT INTO training(denomination, description) VALUE (denomination_value, description_value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `all_alerts`
--

/*!50001 DROP VIEW IF EXISTS `all_alerts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_alerts` AS select `alert`.`identifier` AS `identifier`,`alert`.`connection_identifier` AS `connection_identifier`,`alert`.`insight_identifier` AS `insight_identifier`,`alert`.`training_identifier` AS `training_identifier`,`alert`.`resource` AS `resource`,`alert`.`date_registered` AS `date_registered`,`alert`.`date_updated` AS `date_updated`,`alert`.`is_solved` AS `is_solved`,`alert`.`date_training_completed` AS `date_training_completed`,`alert`.`has_training` AS `has_training`,`alert`.`is_training_completed` AS `is_training_completed` from `alert` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_alerts_with_training`
--

/*!50001 DROP VIEW IF EXISTS `all_alerts_with_training`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_alerts_with_training` AS select `training`.`identifier` AS `identifier`,`training`.`denomination` AS `denomination`,`alert`.`identifier` AS `alert.identifier`,`alert`.`is_solved` AS `alert.is_solved`,`alert`.`date_registered` AS `alert.date_registered` from (`training` left join `alert` on((`alert`.`training_identifier` = `training`.`identifier`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_categories`
--

/*!50001 DROP VIEW IF EXISTS `all_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_categories` AS select `category`.`identifier` AS `identifier`,`category`.`denomination` AS `denomination`,`category`.`description` AS `description`,`category`.`priority` AS `priority`,`category`.`date_registered` AS `date_registered`,`category`.`date_updated` AS `date_updated`,`category`.`is_active` AS `is_active` from `category` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_connections`
--

/*!50001 DROP VIEW IF EXISTS `all_connections`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_connections` AS select `connection`.`identifier` AS `identifier`,`connection`.`denomination` AS `denomination`,`connection`.`description` AS `description`,`connection`.`date_joined` AS `date_joined`,`connection`.`date_updated` AS `date_updated`,`connection`.`is_active` AS `is_active` from `connection` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_insights`
--

/*!50001 DROP VIEW IF EXISTS `all_insights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_insights` AS select `insight`.`identifier` AS `identifier`,`insight`.`category_identifier` AS `category_identifier`,`insight`.`denomination` AS `denomination`,`insight`.`description` AS `description`,`insight`.`date_registered` AS `date_registered`,`insight`.`date_updated` AS `date_updated`,`insight`.`is_active` AS `is_active` from `insight` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_insights_with_category`
--

/*!50001 DROP VIEW IF EXISTS `all_insights_with_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_insights_with_category` AS select `category`.`identifier` AS `identifier`,`category`.`denomination` AS `denomination`,`insight`.`identifier` AS `insight.identifier`,`insight`.`denomination` AS `insight.denomination` from (`insight` left join `category` on((`insight`.`category_identifier` = `category`.`identifier`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_trainings`
--

/*!50001 DROP VIEW IF EXISTS `all_trainings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`34.27.208.49` SQL SECURITY DEFINER */
/*!50001 VIEW `all_trainings` AS select `training`.`identifier` AS `identifier`,`training`.`denomination` AS `denomination`,`training`.`description` AS `description`,`training`.`date_registered` AS `date_registered`,`training`.`date_updated` AS `date_updated`,`training`.`is_active` AS `is_active` from `training` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-03 17:52:38
