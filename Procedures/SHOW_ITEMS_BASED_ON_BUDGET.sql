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

/* Procedure structure for procedure `SHOW_ITEMS_BASED_ON_BUDGET` */

/*!50003 DROP PROCEDURE IF EXISTS  `SHOW_ITEMS_BASED_ON_BUDGET` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SHOW_ITEMS_BASED_ON_BUDGET`(in AMOUNT_YOU_HAVE int)
begin
declare NO_OF_ITEMS int;
SELECT COUNT(ITEM) into NO_OF_ITEMS FROM food_items WHERE PRICE <=AMOUNT_YOU_HAVE ;
if AMOUNT_YOU_HAVE <= 0  then
	select ' Please enter a valid budget amount';
elseif  !NO_OF_ITEMS   then
	select 'Sorry no items avilable at that budget';
else
	select ITEM,PRICE from food_items where PRICE <=AMOUNT_YOU_HAVE;
end if;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
