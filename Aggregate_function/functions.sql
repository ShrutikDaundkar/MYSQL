
-- Aggregate function for counting the total number of students in the student table from the city of Pune
select count(*) as total  from student where city='pune';

-- Aggregate function for calculating the total marks of all students
select sum(marks) as total_marks from student;

-- Aggregate function for calculating the average marks of all students
select avg(marks) as average_marks from student;

-- Aggregate function for counting the total number of students in each city by "group by" clause
select city ,count(*) as total from student group by city;

-- Aggregate function for counting total number of students in each city and calculating the
--  average marks of students in each city by "group by" clause and inserting the result into 
-- city_stats table

insert into city_stats(city,total_students ,avg_marks)
select city, count(*),avg(marks)
from student
group by city;

select * from city_stats;

-- Creating a stored procedure to calculate and store the city statistics in the city_stats table
delimiter $$
create procedure store_city_stats()

begin 

insert into city_stats(city,total_students ,avg_marks)
select city, count(*),avg(marks)
from student
group by city;



end $$

delimiter ;

call store_city_stats();
