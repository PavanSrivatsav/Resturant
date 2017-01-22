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

/*Table structure for table `seed_seats` */

DROP TABLE IF EXISTS `seed_seats`;

CREATE TABLE `seed_seats` (
  `ID` smallint(6) NOT NULL,
  `SEAT_NO` smallint(6) DEFAULT NULL,
  `STATUS` binary(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK-SeatNo` (`SEAT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `seed_seats` */

insert  into `seed_seats`(`ID`,`SEAT_NO`,`STATUS`) values (1,1,'0'),(2,2,'0'),(3,3,'0'),(4,4,'0'),(5,5,'0'),(6,6,'0'),(7,7,'0'),(8,8,'0'),(9,9,'0'),(10,10,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
