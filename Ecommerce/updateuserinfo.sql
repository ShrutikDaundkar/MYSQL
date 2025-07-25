--  Creating a Stored Procedure for Updating User Information

DROP PROCEDURE IF EXISTS updateuserinfo

DELIMITER //
CREATE PROCEDURE updateuserinfo(
IN p_user_id INT,
IN p_email VARCHAR(50),
IN p_address VARCHAR (255)
)
BEGIN
UPDATE users 
SET email = p_email ,address =p_address
WHERE id = p_user_id;

END //

DELIMITER ;

 CALL updateuserinfo( 1 ,'user123.com','Khed');
