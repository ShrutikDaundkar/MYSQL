create database shopping;
use shopping;

CREATE TABLE Orders (
    OrderId INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(20) DEFAULT 'CREATED'
);

CREATE TABLE Payments (
    PaymentId INT AUTO_INCREMENT PRIMARY KEY,
    OrderId INT,
    CustomerId INT,
    Amount DECIMAL(10,2),
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentStatus VARCHAR(20) DEFAULT 'INITIATED',
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);


CREATE TABLE Shipments (
    ShipmentId INT AUTO_INCREMENT PRIMARY KEY,
    OrderId INT,
    ShipmentDate DATETIME,
    ShipmentStatus VARCHAR(20) DEFAULT 'PENDING',
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);
