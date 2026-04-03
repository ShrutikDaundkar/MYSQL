create database school_db;

use school_db;

create table student(
 id int unique key auto_increment,
 name varchar (50),
 marks int,
 city varchar(50) 
 );
 
INSERT INTO student (name, marks, city) VALUES
('Amit', 85, 'Pune'),
('Rahul', 90, 'Mumbai'),
('Sneha', 78, 'Pune'),
('Priya', 92, 'Delhi'),
('Karan', 67, 'Mumbai'); 

CREATE TABLE city_stats (
    city VARCHAR(50),
    total_students INT,
    avg_marks DECIMAL(5,2)
);