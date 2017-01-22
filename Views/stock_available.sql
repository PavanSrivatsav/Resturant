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

/*View structure for view stock_available */

/*!50001 DROP TABLE IF EXISTS `stock_available` */;
/*!50001 DROP VIEW IF EXISTS `stock_available` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_available` AS (select `food_items`.`ITEM` AS `ITEM`,`food_schedule`.`FOOD_TYPE` AS `FOOD_TYPE`,(`items_category`.`QUANTITY` - ifnull((select sum(`order_details`.`QUANTITY`) from `order_details` where ((`order_details`.`STATUS` = 'ORDERED') and (cast(`order_details`.`TIME_OF_ORDER` as date) = curdate()) and (`order_details`.`ITEM_ID` = `items_category`.`FOOD_ITEM_ID`) and (cast(`order_details`.`TIME_OF_ORDER` as time) between `food_schedule`.`TIME_START` and `food_schedule`.`TIME_END`))),0)) AS `QUANTITY_REMAINING` from ((`items_category` left join `food_schedule` on((`food_schedule`.`ID` = `items_category`.`FOOD_CATEGORY_ID`))) left join `food_items` on((`food_items`.`ID` = `items_category`.`FOOD_ITEM_ID`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
