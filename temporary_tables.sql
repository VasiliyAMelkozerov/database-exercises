use jemison_1766;

-- Use the read_only database
-- This avoids needing to re-type the db_name in front of every table_name
#USE employees;

-- Specify the db where you have permissions and add the temp table name.
-- Replace "my_database_with_permissions"" with the database name where you have appropriate permissions. It should match your username.
-- CREATE TEMPORARY TABLE my_database_with_permissions.employees_with_salaries AS 
-- SELECT * FROM employees JOIN salaries USING(emp_no);

-- Change the current db.
USE my_database_with_permissions;
SELECT * FROM employees_with_salaries;

drop table if exists jemison_1766.employees_with_departments;

#CREATE TEMPORARY TABLE employees_with_departments AS
#SELECT emp_no, first_name, last_name, dept_no, dept_name
#FROM employees
#JOIN dept_emp USING(emp_no)
#JOIN departments USING(dept_no)
#LIMIT 100;
#Error Code: 1146. Table 'jemison_1766.employees' doesn't exist
#Error Code: 1050. Table 'employees_with_departments' already exists

-- a simple example where we want the email address to be just the first name
UPDATE jemison_1766.employees_with_departments
#Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
SET full_name = CONCAT(first_name, ' ' ,last_name);

#Error Code: 1146. Table 'jemison_1766.employees' doesn't exist
#Error Code: 1146. Table 'jemison_1766.employees' doesn't exist
#Error Code: 1146. Table 'jemison_1766.employees' doesn't exist

CREATE TEMPORARY TABLE jemison_1766.employees_with_departments 
as select first_name, last_name, dept_name
from employees.employees
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no);

#this is used to delet columns
ALTER TABLE jemison_1766.employees_with_departments 
DROP COLUMN first_name,
DROP COLUMN last_name;

#this is used to creat columns
ALTER TABLE jemison_1766.employees_with_departments ADD full_name VARCHAR(30);
#the code is now giving me an error stating that carchar length is stay at 100: FIXED
describe jemison_1766.employees_with_departments;

select * from jemison_1766.employees_with_departments;

CREATE TEMPORARY TABLE my_numbers(
    n INT UNSIGNED NOT NULL 
);

INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers;

use sakila;
select * from amount;