use jemison_1766;

-- Change the current db.
USE my_database_with_permissions;
SELECT * FROM employees_with_salaries;

drop table if exists jemison_1766.employees_with_departments;

-- a simple example where we want the email address to be just the first name
UPDATE jemison_1766.employees_with_departments
SET full_name = CONCAT(first_name, ' ' ,last_name);

CREATE TEMPORARY TABLE jemison_1766.employees_with_departments 
as select first_name, last_name, dept_name
from employees.employees
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no);

select * from jemison_1766.employees_with_departments;

#this is used to delet columns
ALTER TABLE jemison_1766.employees_with_departments 
DROP COLUMN first_name,
DROP COLUMN last_name;

#this is used to creat columns
ALTER TABLE jemison_1766.employees_with_departments ADD full_name VARCHAR(30);
#the code is now giving me an error stating that carchar length is stay at 100: FIXED
describe jemison_1766.employees_with_departments;


CREATE TEMPORARY TABLE my_numbers(
    n INT UNSIGNED NOT NULL 
);

INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers;
#Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that 
#it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

use sakila;
select * from payment;
#Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INTEGER) from skali.payment' at line 1
select(amount) from payment;
select (amount * 100) from payment;

use jemison_1766;
create temporary table jemison_1766.sakila_amount
as select payment_id, amount 
from payment
where amount;

show create table jemison_1766.sakila_amount;
select * from jemison_1766.sakila_amount;

alter table jemison_1766.sakila_amount modify amount decimal (6, 2);

alter table jemison_1766.sakila_amount modify amount INT;

update jemison_1766.sakila_amount 
set amount = amount * 100;
#describe sakila.payment;


#3 three tres
-- Find out how the current average pay in each department compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries. 
-- In terms of salary, what is the best department right now to work for? The worst?

#this seems to be implying the use of the employees database so we can find salary
#now i am in the database and have salaries pulled up
use employees;
select * from salaries;

SELECT 
    emp_no,
    salary,
    (SELECT 
            AVG(salary)
        FROM
            salaries) as 'global average',
    (SELECT 
            AVG(salary)
        FROM
            salaries) - salary AS difference,
    (salary - (SELECT 
            AVG(salary)
        FROM
            salaries)) / (SELECT 
            STDDEV(salary)
        FROM
            salaries) AS zscore,
    dept_name
FROM
    salaries
        JOIN
    dept_emp USING (emp_no)
        JOIN
    departments USING (dept_no)
ORDER BY dept_name, difference
limit 10;



describe salaries;
