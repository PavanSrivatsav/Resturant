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

/*Table structure for table `items_category` */

DROP TABLE IF EXISTS `items_category`;

CREATE TABLE `items_category` (
  `ID` smallint(6) NOT NULL,
  `FOOD_ITEM_ID` smallint(6) DEFAULT NULL,
  `FOOD_CATEGORY_ID` smallint(6) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk-foodItemID` (`FOOD_ITEM_ID`),
  KEY `fk-foodCategoryID` (`FOOD_CATEGORY_ID`),
  CONSTRAINT `fk-foodCategoryID` FOREIGN KEY (`FOOD_CATEGORY_ID`) REFERENCES `food_schedule` (`ID`),
  CONSTRAINT `fk-foodItemID` FOREIGN KEY (`FOOD_ITEM_ID`) REFERENCES `food_items` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `items_category` */

insert  into `items_category`(`ID`,`FOOD_ITEM_ID`,`FOOD_CATEGORY_ID`,`QUANTITY`) values (1,1,1,100),(2,2,1,100),(3,3,1,100),(4,4,1,100),(5,5,1,100),(6,6,1,100),(7,7,1,100),(8,8,2,75),(9,9,2,75),(10,10,2,75),(11,6,3,200),(12,7,3,200),(13,11,3,200),(14,12,4,100),(15,13,4,100),(16,14,4,100);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
