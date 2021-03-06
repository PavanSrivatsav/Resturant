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

/* Procedure structure for procedure `TAKE_ORDER` */

/*!50003 DROP PROCEDURE IF EXISTS  `TAKE_ORDER` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TAKE_ORDER`(IN ITEMS_LIST MEDIUMTEXT,IN QUANTITY_LIST MEDIUMTEXT,IN I_SEAT_NO INT)
BEGIN
          DECLARE ITEM_OBTAINED TEXT DEFAULT NULL ;
          DECLARE ITEM_LENGTH_OBTAINED INT DEFAULT NULL;
          DECLARE FINAL_ITEM TEXT DEFAULT NULL;
          DECLARE QUANTITY_OBTAINED TEXT DEFAULT NULL ;
          DECLARE QUANTITY_LENGTH_OBTAINED INT DEFAULT NULL;
          DECLARE FINAL_QUANTITY TEXT DEFAULT NULL;
          DECLARE ITEM_COUNT INT;                  
          DECLARE SEAT_CHECK BOOLEAN;
          DECLARE REMAINING_QUANTITY INT;
          DECLARE INVALID_ENNTRY BOOLEAN;
          DECLARE INVALID_LENGTH BOOLEAN;
          DECLARE ORD_NO INT;
          SET INVALID_ENNTRY= INVALID_ORDER_ENTRY(ITEMS_LIST,QUANTITY_LIST);
          SET INVALID_LENGTH=ORDER_MAX_LENGTH(ITEMS_LIST,QUANTITY_LIST);
	IF INVALID_ENNTRY THEN
		IF !INVALID_LENGTH THEN	
	SET @CHECK_SESSION= IS_VALID_SESSION();# break time check
	IF @CHECK_SESSION THEN
	IF NOT EXISTS (SELECT SEAT_NO FROM SEATS s WHERE s.STATUS=0 ) THEN # ALL SEATS OCCUPIED
	SELECT 'Sorry all seats are occupied , Please wait for sometime ';
	END IF;
	
	SET SEAT_CHECK= CHECK_SEAT_AVAILABILITY(I_SEAT_NO,@SEAT);# check seat avilability
	IF SEAT_CHECK THEN  		
		UPDATE SEATS s SET s.STATUS=1 WHERE SEAT_NO=I_SEAT_NO;
		INSERT INTO orders(SEAT_NO)VALUES(I_SEAT_NO);
		SELECT LAST_INSERT_ID() INTO ORD_NO;						
         ITERATOR :
         LOOP    
            IF LENGTH(TRIM(ITEMS_LIST)) = 0 OR ITEMS_LIST IS NULL OR LENGTH(TRIM(QUANTITY_LIST)) = 0 OR QUANTITY_LIST IS NULL THEN
              LEAVE iterator;
              END IF;              	              
              	
		# Item Name
                 SET ITEM_OBTAINED = SUBSTRING_INDEX(ITEMS_LIST,',',1);
                 SET ITEM_LENGTH_OBTAINED = LENGTH(ITEM_OBTAINED);
                 SET FINAL_ITEM = TRIM(ITEM_OBTAINED); 
                 SET @LENTH=(SELECT LENGTH(ITEMS_LIST) - LENGTH(REPLACE(ITEMS_LIST, ',' ,''))+1);                               
                  
                 # Quantity
                 SET QUANTITY_OBTAINED = SUBSTRING_INDEX(QUANTITY_LIST,',',1);
                 SET QUANTITY_LENGTH_OBTAINED = LENGTH(QUANTITY_OBTAINED);
                 SET FINAL_QUANTITY = TRIM(QUANTITY_OBTAINED);  
			                  		                           
			SET @ITEM_VALID=ITEM_VALIDATION(FINAL_ITEM);
			IF @ITEM_VALID  THEN 
	 SET @QUANTITY_FLAG=CHECK_QUANTITY_AVILABILITY(FINAL_ITEM,FINAL_QUANTITY);			    	 	 		 	
	 IF EXISTS ( SELECT FOOD_ITEM_ID FROM ITEMS_CATEGORY WHERE FOOD_CATEGORY_ID=@V_CATEGORY_ID AND
		FOOD_ITEM_ID=(SELECT ID FROM FOOD_ITEMS WHERE ITEM=FINAL_ITEM)) THEN				  						   		
			   SET REMAINING_QUANTITY= (SELECT QUANTITY_REMAINING FROM STOCK_AVAILABLE
			   WHERE ITEM=FINAL_ITEM AND FOOD_TYPE=(SELECT FOOD_TYPE FROM FOOD_SCHEDULE WHERE ID=@V_CATEGORY_ID));			   			   
			     IF @QUANTITY_FLAG  THEN	 # check quantity avilability 			
				#UPDATE SEATS s SET s.STATUS=1 WHERE SEAT_NO=I_SEAT_NO;
			
				IF FINAL_QUANTITY=0 OR FINAL_QUANTITY <0 THEN
				SELECT 'INVALID ORDER';
				ELSE
				INSERT INTO order_details(ORDER_ID,ITEM_ID,QUANTITY) VALUES
				(ORD_NO,(SELECT ID FROM food_items WHERE ITEM=ITEM_OBTAINED) ,
				FINAL_QUANTITY) ;				
				UPDATE ORDERS o SET o.STATUS = 'SERVED' WHERE ID=ORD_NO AND SEAT_NO=I_SEAT_NO AND STATUS='REQUESTED';					
				SET ITEM_COUNT=ITEM_COUNT+1;										    
				SET @LENTH=@LENTH-1;
				END IF;	
				IF @LENTH=0 THEN	
				#UPDATE ORDERS o SET o.STATUS = 'SERVED' WHERE ID=ORD_NO AND SEAT_NO=I_SEAT_NO AND STATUS='REQUESTED';	
				SELECT CONCAT('SEAT NO: ',I_SEAT_NO,' ORDER NO: ',ORD_NO);
				END IF;
				ELSE
				SELECT CONCAT('Sorry Available quantity for ',FINAL_ITEM,' is ',REMAINING_QUANTITY) AS 'AVAILABLE_QUANTITY';
				UPDATE SEATS s SET s.STATUS=0 WHERE SEAT_NO=I_SEAT_NO;
				#LEAVE ITERATOR;
			END IF;				
				ELSE 
				SELECT ITEM AS 'Sorry Items available now are:-' FROM food_items WHERE ID IN
				(SELECT FOOD_ITEM_ID FROM items_category WHERE FOOD_CATEGORY_ID IN
				( SELECT ID FROM food_schedule WHERE CURTIME() BETWEEN TIME_START AND TIME_END)) ;
				UPDATE SEATS s SET s.STATUS=0 WHERE SEAT_NO=I_SEAT_NO;
	LEAVE ITERATOR;		
	END IF;
			ELSE
				SELECT CONCAT(FINAL_ITEM,' item is not made in this hotel') AS Message;
			END IF;		              
                   SET ITEMS_LIST = INSERT(ITEMS_LIST,1,ITEM_LENGTH_OBTAINED + 1,'');
                   SET QUANTITY_LIST = INSERT(QUANTITY_LIST,1,QUANTITY_LENGTH_OBTAINED + 1,'');                
         END LOOP;   
ELSEIF NOT EXISTS( SELECT SEAT_NO FROM SEATS WHERE SEAT_NO=I_SEAT_NO) THEN
	SELECT ' INVALID SEAT NO';
#	LEAVE ITERATOR;
	#END IF;  	
ELSE	
	SELECT 'Please wait the seat is busy!';
END IF;  
ELSE
SELECT CHECK_BREAK_TIME();
UPDATE SEATS s SET s.STATUS=0 WHERE SEAT_NO=I_SEAT_NO;
END IF;
ELSE
SELECT 'Item limit is 5!';
UPDATE SEATS s SET s.STATUS=0 WHERE SEAT_NO=I_SEAT_NO;
END IF;
ELSE
SELECT ' Please check the count of quantity or items entered'; 
UPDATE SEATS s SET s.STATUS=0 WHERE SEAT_NO=I_SEAT_NO;
END IF;
IF EXISTS(SELECT SEAT_NO FROM ORDERS WHERE SEAT_NO=I_SEAT_NO AND ID=ORD_NO and STATUS='SERVED') THEN
UPDATE SEATS s SET s.STATUS=0 WHERE SEAT_NO=I_SEAT_NO;
END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
