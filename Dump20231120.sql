-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: demo22
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `score` decimal(2,0) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `release_year` smallint(6) DEFAULT NULL,
  `release_month` tinyint(4) DEFAULT NULL,
  `release_day` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `Q` (`release_day`,`release_month`,`release_year`),
  KEY `DQSDQSDQSD` (`release_year`,`release_month`),
  KEY `QSDQSD` (`release_year`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `view_who_viewed_what`
--

DROP TABLE IF EXISTS `view_who_viewed_what`;
/*!50001 DROP VIEW IF EXISTS `view_who_viewed_what`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_who_viewed_what` (
  `name` tinyint NOT NULL,
  `naam` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_who_what_after_2000`
--

DROP TABLE IF EXISTS `view_who_what_after_2000`;
/*!50001 DROP VIEW IF EXISTS `view_who_what_after_2000`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_who_what_after_2000` (
  `name` tinyint NOT NULL,
  `release_year` tinyint NOT NULL,
  `release_month` tinyint NOT NULL,
  `release_day` tinyint NOT NULL,
  `naam` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `viewed`
--

DROP TABLE IF EXISTS `viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `test` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_viewed_movies_users` (`movie_id`),
  KEY `viewed_users_null_fk` (`user_id`),
  CONSTRAINT `fk_viewed_movies_users` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`pk_id`),
  CONSTRAINT `viewed_users_null_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `view_who_viewed_what`
--

/*!50001 DROP TABLE IF EXISTS `view_who_viewed_what`*/;
/*!50001 DROP VIEW IF EXISTS `view_who_viewed_what`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_who_viewed_what` AS select `mo`.`name` AS `name`,`us`.`naam` AS `naam` from ((`movies` `mo` join `viewed` `vw` on(`mo`.`pk_id` = `vw`.`movie_id`)) join `users` `us` on(`us`.`id` = `vw`.`user_id`)) order by `mo`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_who_what_after_2000`
--

/*!50001 DROP TABLE IF EXISTS `view_who_what_after_2000`*/;
/*!50001 DROP VIEW IF EXISTS `view_who_what_after_2000`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_who_what_after_2000` AS select `m`.`name` AS `name`,year(`m`.`release_date`) AS `release_year`,month(`m`.`release_date`) AS `release_month`,dayofmonth(`m`.`release_date`) AS `release_day`,`u`.`naam` AS `naam` from ((`movies` `m` join `viewed` `v` on(`v`.`movie_id` = `m`.`pk_id`)) join `users` `u` on(`u`.`id` = `v`.`user_id`)) where year(`m`.`release_date`) >= 2000 */;
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

-- Dump completed on 2023-11-20 11:42:11
