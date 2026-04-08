DELIMITER $$
CREATE TRIGGER trg_after_order_insert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Payments
    ( OrderId,CustomerId,Amount,PaymentStatus )
    VALUES ( New.OrderId,New.CustomerId,New.TotalAmount, 'INITIATED');
END$$
DELIMITER ;


DELIMITER $$
CREATE  TRIGGER  trg_after_payment_update
AFTER UPDATE ON Payments
FOR EACH  ROW
BEGIN
IF NEW.PaymentStatus ='SUCCESS' THEN
INSERT INTO Shipments( OrderId, ShipmentDate,ShipmentStatus)
			VALUES(NEW.OrderId, NOW(),'PROCESSING' );
END IF;
END
$$
DELIMITER ;

INSERT INTO Orders(CustomerId, TotalAmount)
VALUES (765, 7444);

UPDATE  Payments SET PaymentStatus='SUCCESS' 
where PaymentId=1;
