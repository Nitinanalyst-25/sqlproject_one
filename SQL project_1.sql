-- Query 1
Create database if not exists employee;
use employee;
-- Query 2 -- attached image for ER Diagram
-- Query 3.
select EMP_ID,FIRST_NAME,FIRST_NAME,GENDER,DEPT from emp_record_table;
-- Query 4
-- when employee rating is less than 2
select EMP_ID,FIRST_NAME,FIRST_NAME,GENDER,DEPT,EMP_RATING from emp_record_table
where 
EMP_RATING <2;
-- when employee rating is greater than four 
select EMP_ID,FIRST_NAME,FIRST_NAME,GENDER,DEPT,EMP_RATING from emp_record_table
where 
EMP_RATING >4;
-- when employee rating is between two and four
select EMP_ID,FIRST_NAME,FIRST_NAME,GENDER,DEPT,EMP_RATING from emp_record_table
where 
EMP_RATING between 2 and 4;
-- Query 5
select FIRST_NAME,LAST_NAME,DEPT, concat(FIRST_NAME,' ',LAST_NAME) as NAME from emp_record_table
where 
DEPT='Finance';
-- Query 6
select EMP_ID,concat(FIRST_NAME,' ',LAST_NAME) as Employee_Name, DEPT from emp_record_table
where
DEPT='Healthcare'
union
select EMP_ID,concat(FIRST_NAME,' ',LAST_NAME) as Employee_Name, DEPT from emp_record_table
where
DEPT='Finance';
-- Query 7
Select Role, max(SALARY) as Maximum_Salry, min(SALARY) as Minimum_Salary from emp_record_table
group by Role;
-- Query 8
-- Assigining rank to each employee based on experience 
Select EMP_ID,concat(FIRST_NAME,' ',LAST_NAME) as Employee_Name,
case
 when EXP>=20 then 'Grandmaster'
 when EXP between 15 and 19 then 'Master'
 when EXP between 10 and 14 then 'Expert'
 when EXP between 5 and 9 then 'Skilled'
 when EXP between 2 and 4 then 'Apprentice'
 else 'Novice'
 end as 'Employee_rank'
 from emp_record_table;
 -- Query 9
 create view view_1
 as
 select concat(FIRST_NAME,' ',LAST_NAME) as Employee_Name ,COUNTRY from emp_record_table
 where SALARY>6000;

select * from view_1;
-- Query 10 
select concat(FIRST_NAME,' ',LAST_NAME) as Employee_Name, EXP from emp_record_table
where EXP>10;
-- Query 11 
USE `employee`;
DROP procedure IF EXISTS `procedure_1`;

DELIMITER $$
USE `employee`$$
CREATE PROCEDURE `procedure_1` ()
BEGIN
 select * from emp_record_table
 where
 EXP>3;
END$$

DELIMITER ;

call procedure_1;
-- Query 12
-- without index
Select * from emp_record_table
where FIRST_NAME='Eric';
create index index_first_name on emp_record_table(FIRST_NAME(100));
Select * from emp_record_table
where FIRST_NAME='Eric';
-- Query 13 bonus for all the employees, based on their ratings and salaries

alter table emp_record_table
add column bonus int;
alter  table emp_record_table
modify column bonus decimal(10,2);
set sql_safe_updates=false;
update emp_record_table
set bonus=((0.005 * SALARY)*EMP_RATING);

select concat(FIRST_NAME,' ',LAST_NAME) as Employee_name , bonus from emp_record_table;
-- Query 14
select avg(salary) as Average_salary, CONTINENT,COUNTRY from emp_record_table
group by country, continent,salary;



 
