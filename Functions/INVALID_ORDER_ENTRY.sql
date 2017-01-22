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

/* Function  structure for function  `INVALID_ORDER_ENTRY` */

/*!50003 DROP FUNCTION IF EXISTS `INVALID_ORDER_ENTRY` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `INVALID_ORDER_ENTRY`(ITEMS TEXT,QUANTITY TEXT) RETURNS tinyint(1)
begin
DECLARE INVALID_ENTRY BOOLEAN;
DECLARE GIVEN_ITEMS_LENGTH INT;
DECLARE GIVEN_QUANTITY_LENGTH INT;
SET GIVEN_ITEMS_LENGTH=(SELECT LENGTH(ITEMS) - LENGTH(REPLACE(ITEMS, ',' ,''))+1);
SET GIVEN_QUANTITY_LENGTH=(SELECT LENGTH(QUANTITY) - LENGTH(REPLACE(QUANTITY, ',' ,''))+1);
IF GIVEN_ITEMS_LENGTH != GIVEN_QUANTITY_LENGTH THEN
	SET INVALID_ENTRY=FALSE;
ELSE
	SET INVALID_ENTRY=TRUE;
END IF;
RETURN INVALID_ENTRY ;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;