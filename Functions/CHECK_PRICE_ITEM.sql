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

/* Function  structure for function  `CHECK_PRICE_ITEM` */

/*!50003 DROP FUNCTION IF EXISTS `CHECK_PRICE_ITEM` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_PRICE_ITEM`(I__ITEM_NAME char(30)) RETURNS varchar(300) CHARSET latin1
begin
DECLARE ITEM_COST varchar(300);
declare VALID_ITEM Boolean;
declare msg text;
set VALID_ITEM=ITEM_VALIDATION(I__ITEM_NAME);
if VALID_ITEM then
set ITEM_COST =  (select PRICE from food_items where ITEM=I__ITEM_NAME);
else
set msg='This item is not made in this hotel';
set ITEM_COST= msg;
end if;
return ITEM_COST;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
