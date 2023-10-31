-- MySQL dump 10.13  Distrib 5.6.50, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: asigno
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `getteams`
--

DROP TABLE IF EXISTS `getteams`;
/*!50001 DROP VIEW IF EXISTS `getteams`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getteams` AS SELECT 
 1 AS `users`,
 1 AS `team`,
 1 AS `tName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getunasigned`
--

DROP TABLE IF EXISTS `getunasigned`;
/*!50001 DROP VIEW IF EXISTS `getunasigned`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getunasigned` AS SELECT 
 1 AS `users`,
 1 AS `team`,
 1 AS `tName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `status` enum('Asignada','En proceso','Completada','') DEFAULT 'Asignada',
  `asignment` int(11) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asignment` (`asignment`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`asignment`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (174,'Conseguir la USB','2022-12-05 13:00:00','2022-12-06 09:00:00','Completada',25,'Conseguir la USB'),(194,'Conseguir gafete','2022-12-05 11:00:00','2022-12-06 10:00:00','Completada',25,'Conseguir gafete'),(204,'Probar asigno','2023-06-28 09:00:00','2023-06-29 23:59:00','Completada',25,'Sacar errores del proyecto en productivo'),(214,'Revisar errores en consola','2023-06-28 09:00:00','2023-06-29 23:59:00','Completada',25,'Replicar un error conocido para conocer su origen');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (424,'Administracion'),(414,'Testers');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `pass` varchar(254) NOT NULL,
  `color` varchar(7) NOT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `team` int(11) DEFAULT NULL,
  `photo` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueEmail` (`email`),
  UNIQUE KEY `color` (`color`),
  KEY `fk_idTeam_idx` (`team`),
  CONSTRAINT `fk_idTeam` FOREIGN KEY (`team`) REFERENCES `team` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (25,'Carlos Charly','charly@asigno.com','$2y$10$1ISGrYnNr0E3dMbCknerQu3xb8gKTwJtOC2HOGP/aMQNZyiiw1aUO','#ec1818',1,NULL,'https://res.cloudinary.com/duz7dfwse/image/upload/v1669139217/asigno-user-images/amlnespigz7v7zykp6rn.jpg'),(264,'Tester Gutierrez','testerg@asigno.com','12345678','#FFFFFF',1,NULL,'https://res.cloudinary.com/duz7dfwse/image/upload/v1688054153/asigno-user-images/rjzonhgozs478t40rrxn.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'asigno'
--
/*!50003 DROP PROCEDURE IF EXISTS `addToTeam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addToTeam`(IN idTeam INT(11), IN idUser INT(11))
BEGIN
	SET FOREIGN_KEY_CHECKS = 0;
    IF (idTeam = '') THEN SET idTeam = NULL; END IF;
	UPDATE user SET team = idTeam WHERE id = idUser;
    SET FOREIGN_KEY_CHECKS = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser`(IN `deleteID` INT)
BEGIN



DECLARE admin INT DEFAULT 1;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM user WHERE id = deleteID;

SET admin = (SELECT id FROM user WHERE admin = 1 LIMIT 1);

UPDATE task SET asignment = admin WHERE asignment = deleteID;
SET FOREIGN_KEY_CHECKS = 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(IN `name` VARCHAR(100), IN `email` VARCHAR(254), IN `pass` VARCHAR(254), IN `color` VARCHAR(7), IN `admin` TINYINT(1), IN photo TEXT)
BEGIN
INSERT INTO user(name, email, pass, color, admin, photo) VALUES(name, email, pass, color, admin, photo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `getteams`
--

/*!50001 DROP VIEW IF EXISTS `getteams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getteams` AS select group_concat(concat(`user`.`id`,',',`user`.`name`,',',`user`.`email`,',',`user`.`photo`) separator '|') AS `users`,`team`.`id` AS `team`,`team`.`name` AS `tName` from (`team` left join `user` on(`user`.`team` = `team`.`id`)) group by `team`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getunasigned`
--

/*!50001 DROP VIEW IF EXISTS `getunasigned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getunasigned` AS select group_concat(concat(`user`.`id`,',',`user`.`name`,',',`user`.`email`,',',`user`.`photo`) separator '|') AS `users`,`team`.`id` AS `team`,`team`.`name` AS `tName` from (`user` left join `team` on(`user`.`team` = `team`.`id`)) where `user`.`team` is null group by `team`.`name` */;
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

-- Dump completed on 2023-10-31 10:52:12
