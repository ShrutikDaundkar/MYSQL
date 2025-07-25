--  Creating a Stored Procedure for Applying a Discount Code

DELIMITER //

CREATE PROCEDURE applydiscount(
	IN p_order_id INT, 
	IN p_discount_code VARCHAR(50)
)
BEGIN 
	DECLARE v_discount DECIMAL (5,2);
	DECLARE v_total DECIMAL (10,2) ;
 
	SELECT discount_percentage INTO v_discount
	FROM discount_codes 
	WHERE code = p_discount_code AND NOW() BETWEEN start_date AND end_date ;

	IF v_discount IS NOT NULL THEN 
		SELECT total_amount INTO v_total
		FROM  orders
		WHERE id = p_order_id ;
	
		SET v_total = v_total - (v_total*(v_discount/100));
    
		UPDATE orders
		SET total_amount = v_total
		WHERE id = p_order_id;
    
	ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid or expired discount code.';
	END IF ;
END //
 DELIMITER ;
 
SELECT * FROM discount_codes WHERE code = 'INDEPENDENCE23';
CALL applydiscount(1, 'INDEPENDENCE23');


