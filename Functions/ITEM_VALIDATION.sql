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

/* Function  structure for function  `ITEM_VALIDATION` */

/*!50003 DROP FUNCTION IF EXISTS `ITEM_VALIDATION` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ITEM_VALIDATION`(I_ITEM_NAME char(50)) RETURNS tinyint(1)
begin
declare VALID_ITEM boolean;
declare CATEGORY_ID int;
if exists( select ITEM from food_items where ITEM=I_ITEM_NAME) then
	
	SET VALID_ITEM=true;
else
	SET VALID_ITEM=FALSE;
end if;
return VALID_ITEM;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
