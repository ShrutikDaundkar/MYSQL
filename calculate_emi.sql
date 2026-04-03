-- Create Database
CREATE DATABASE IF NOT EXISTS banking_db;
USE banking_db;

-- Drop tables if already exist (to avoid errors)
DROP TABLE IF EXISTS emi;
DROP TABLE IF EXISTS homeloan;

-- Create homeloan table
CREATE TABLE homeloan ( 
    load_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    principal DECIMAL(10,2),
    interestrate DECIMAL(5,2),
    months INT
);

-- Insert data
INSERT INTO homeloan (load_id, name, principal, interestrate, months) VALUES 
(1, 'sumit', 10000, 10.7, 24),
(2, 'aditya', 200000, 5.7, 12),
(3, 'parikshit', 50000, 7.7, 15);

-- Create emi table
CREATE TABLE emi (
    load_id INT,
    name VARCHAR(100),
    emi DECIMAL(12,2)
);

-- Drop procedure if exists
DROP PROCEDURE IF EXISTS Calculate_emi;

-- Create Procedure
DELIMITER $$

CREATE PROCEDURE Calculate_emi()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE l_id INT;
    DECLARE l_name VARCHAR(100);
    DECLARE p DECIMAL(12,2);
    DECLARE r DECIMAL(10,6);
    DECLARE n INT;
    DECLARE monthly_rate DECIMAL(10,6);
    DECLARE emi_amount DECIMAL(12,2);

    DECLARE loan_cursor CURSOR FOR 
        SELECT load_id, name, principal, interestrate, months FROM homeloan;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN loan_cursor;

    read_loop: LOOP
        FETCH loan_cursor INTO l_id, l_name, p, r, n;

        IF done = 1 THEN 
            LEAVE read_loop;
        END IF;

        SET monthly_rate = r / 12 / 100;

        SET emi_amount = (p * monthly_rate * POW(1 + monthly_rate, n)) /
                         (POW(1 + monthly_rate, n) - 1);

        INSERT INTO emi(load_id, name, emi)
        VALUES (l_id, l_name, emi_amount);

    END LOOP;

    CLOSE loan_cursor;

END $$

DELIMITER ;

-- Call Procedure
CALL Calculate_emi();

-- Check Result
SELECT * FROM emi;