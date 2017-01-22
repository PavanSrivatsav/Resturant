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

/* Function  structure for function  `CHECK_BREAK_TIME` */

/*!50003 DROP FUNCTION IF EXISTS `CHECK_BREAK_TIME` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_BREAK_TIME`() RETURNS text CHARSET latin1
begin
IF (CURTIME() between '11:00:00' and '11:15:00') THEN
	SET @COMEBACK_AT= 'Sorry Hotel Closed, Come back at 11:15 AM';
END IF;
IF (CURTIME() BETWEEN '15:00:00' AND '15:15:00') THEN
	SET @COMEBACK_AT='Sorry Hotel Closed, Come back at 03:15 PM';
END IF;
IF (CURTIME() > '23:00:00' OR CURTIME() < '08:00:00') THEN
	SET @COMEBACK_AT= 'Sorry Hotel Closed, Come back morning at 08:00 AM ' ;
END IF;
return @COMEBACK_AT;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
