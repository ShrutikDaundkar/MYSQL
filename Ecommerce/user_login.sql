DELIMITER //

CREATE PROCEDURE user_login (
IN p_username VARCHAR(50),
IN p_password VARCHAR(255)
)

BEGIN
SELECT username, password, email 
FROM users
WHERE username = p_username AND password = p_password;

END //

DELIMITER ;  

CALL user_login( 'SHRUTIK' , 'shrutik')


