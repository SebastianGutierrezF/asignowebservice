-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: asigno
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE heroku_3961ccb6d887274;
--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (73,'Pagar nomina','2022-09-01 09:00:00','2022-09-05 23:59:00','Asignada',26,'La de este mes y los adeudos de Nam Simran'),(76,'Revisar declaración','2022-09-02 10:00:00','2022-09-04 23:59:00','Asignada',25,'Toda la información esta en sat.gob.mx. Ya te la sabes.'),(77,'Llevar mercancia','2022-09-05 08:00:00','2022-09-06 19:00:00','Completada',37,'Necesitas pasar a punto 16, amatte, waffleria de allende, y si te acuerdas de otro aprovecha la ruta para ir. A las 7 te necesito de vuelta en la oficina.'),(78,'Comprar hojas','2022-09-03 10:00:00','2022-09-06 16:30:00','Completada',25,'kajaja'),(79,'Hacer tandas locas','2022-09-03 09:00:00','2022-09-06 08:00:00','Asignada',38,'Para sacar 10');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (25,'Pedro Gonzalez','pgonzalez@gmail.com','$2y$10$k28QKMCMST0h4VYQ0b3UG.O1fMSNiBQdjah6ta6RVxr2QkTkSEgq.','#ce2799',1),(26,'Sebastian Barrera','sbarrera@gmail.com','$2y$10$BY6iHOrc6JaJStIOssSiWu8RhMcioa0pxLugUP4hlPe2PfAuUuxki','#00b3ff',0),(36,'Nam Simran','ns@gmail.com','$2y$10$1ISGrYnNr0E3dMbCknerQu3xb8gKTwJtOC2HOGP/aMQNZyiiw1aUO','#fcff2e',0),(37,'Emilia Leyva','emley@gmail.com','$2y$10$bXrhp3fNxQGqV9CIkS/9yOanUD92K9yWrscHUeRCrETvazHPbcUve','#1e942c',0),(38,'Fanny Alvarez','fa@gmail.com','$2y$10$my0iCOA6SoNk85YVUft9Q.b2C3Z0uswL2F9RCEcYNwsv5vOqHORVq','#72a1fd',0),(39,'Moises','moig@gmail.com','$2y$10$xwW58nrO02z25YJQStEfYeZt3FWRbAuFV2Y/vAds9wlnPZMR.Xsse','#FFFF',0),(40,'Roberto','robert@gmail.com','$2y$10$.rlwPZquVlf0KqUJ3r2eD.6CHtvYgTnN8nWwMYPNuNLjWOUX78Xq2','#FFF5',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `userviews`
--

LOCK TABLES `userviews` WRITE;
/*!40000 ALTER TABLE `userviews` DISABLE KEYS */;
INSERT INTO `userviews` VALUES (10,25,25),(12,26,25),(11,26,26),(22,36,36),(23,37,37),(24,38,38),(25,39,39),(26,40,40);
/*!40000 ALTER TABLE `userviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 20:32:10
