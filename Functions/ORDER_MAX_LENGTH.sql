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

/* Function  structure for function  `ORDER_MAX_LENGTH` */

/*!50003 DROP FUNCTION IF EXISTS `ORDER_MAX_LENGTH` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ORDER_MAX_LENGTH`(LENGTH_ITEMS TEXT,LENGTH_QUANTITY TEXT) RETURNS tinyint(1)
BEGIN
DECLARE MAX_LENGTH_EXCEEDED BOOLEAN;
DECLARE ITEMS_COUNT INT;
DECLARE QUANTITY_COUNT INT;
SET ITEMS_COUNT=(SELECT LENGTH(LENGTH_ITEMS) - LENGTH(REPLACE(LENGTH_ITEMS, ',' ,''))+1);
SET QUANTITY_COUNT=(SELECT LENGTH(LENGTH_QUANTITY) - LENGTH(REPLACE(LENGTH_QUANTITY, ',' ,''))+1);
IF ITEMS_COUNT <=(SELECT items_restriction.`ITEM_COUNT` FROM items_restriction WHERE ID=1) AND 
QUANTITY_COUNT <=(SELECT items_restriction.`ITEM_COUNT` FROM items_restriction WHERE ID=1) THEN
	SET MAX_LENGTH_EXCEEDED=FALSE;
ELSE
	SET MAX_LENGTH_EXCEEDED=TRUE;
END IF;
RETURN MAX_LENGTH_EXCEEDED ;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
