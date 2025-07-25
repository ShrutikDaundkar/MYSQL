DELIMITER //
CREATE PROCEDURE registration(
IN p_username VARCHAR(50),
IN p_password VARCHAR(255),
IN p_email VARCHAR(100),
IN p_address VARCHAR(255)
)
BEGIN
INSERT INTO users( username, password, email, address)
VALUE (p_username ,p_password ,p_email ,p_address);
END //

DELIMITER ;

CALL registration ( 'SHRUTIK' , 'shrutik','shrutik@5115', 'pune')



