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

/*Table structure for table `food_schedule` */

DROP TABLE IF EXISTS `food_schedule`;

CREATE TABLE `food_schedule` (
  `ID` smallint(6) NOT NULL,
  `FOOD_TYPE` char(50) DEFAULT NULL,
  `TIME_START` time DEFAULT NULL,
  `TIME_END` time DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK-FoodType` (`FOOD_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `food_schedule` */

insert  into `food_schedule`(`ID`,`FOOD_TYPE`,`TIME_START`,`TIME_END`) values (1,'Breakfast','08:00:00','11:00:00'),(2,'Lunch','11:15:00','15:00:00'),(3,'Refreshment','15:15:00','23:00:00'),(4,'Dinner','19:00:00','23:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
