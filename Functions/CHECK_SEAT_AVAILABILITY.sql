/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.22 : Database - resturant
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`resturant` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `resturant`;

/* Function  structure for function  `CHECK_SEAT_AVAILABILITY` */

/*!50003 DROP FUNCTION IF EXISTS `CHECK_SEAT_AVAILABILITY` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_SEAT_AVAILABILITY`(FN_IN_SEAT INT,SEAT_AVILABLE BOOLEAN) RETURNS tinyint(1)
BEGIN
DECLARE O_SEAT_NO INT;
IF EXISTS( SELECT SEAT_NO FROM SEATS s WHERE SEAT_NO=FN_IN_SEAT AND s.STATUS=0) THEN
	SET SEAT_AVILABLE=TRUE;
ELSE
	SET SEAT_AVILABLE=FALSE;
	
 END IF;
 RETURN SEAT_AVILABLE;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;