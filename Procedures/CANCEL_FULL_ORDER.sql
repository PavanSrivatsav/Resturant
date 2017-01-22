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

/* Procedure structure for procedure `CANCEL_FULL_ORDER` */

/*!50003 DROP PROCEDURE IF EXISTS  `CANCEL_FULL_ORDER` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CANCEL_FULL_ORDER`(in CANCEL_I_ORDER_ID int)
begin
declare ORDER_STATUS char(12);
if exists(select * from order_details where ORDER_ID = CANCEL_I_ORDER_ID ) then
	#SET ORDER_STATUS=(SELECT o.STATUS FROM order_details o WHERE ORDER_ID=CANCEL_I_ORDER_ID);	
	if exists (SELECT DISTINCT(o.STATUS) FROM ORDER_DETAILS o WHERE o.STATUS='Ordered' AND ORDER_ID=CANCEL_I_ORDER_ID) then
		UPDATE order_details SET STATUS='CANCELLED' WHERE ORDER_ID=CANCEL_I_ORDER_ID;
		UPDATE seats SET STATUS=0 WHERE SEAT_NO=(SELECT orders.`SEAT_NO` FROM order_details 
							  JOIN resturant.`orders` 
							  ON order_details.`ORDER_ID`=orders.`ID`
							  WHERE ORDER_ID=CANCEL_I_ORDER_ID LIMIT 1);
	else
		select 'Invalid Order Number s';
	end if;
else
	select 'Invalid Order Number';
end if;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
