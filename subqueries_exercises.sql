use employees;

select first_name, last_name, hire_date
from employees
#so currently this code works up to a point, the only problem is that it does not have a current running
where hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
);

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM employees
    WHERE emp_no = 101010
);
-- 15:01:15 select employees from employees where hire_date = 
-- (SELECT emp_no     FROM employees     WHERE emp_no = 101010)	
-- Error Code: 1054. Unknown column 'employees' in 'field list' 0.071 sec

#2 Find all the titles ever held by all current employees with the first name Aamod.
select distinct first_name, title
from employees 
join titles on employees.emp_no = titles.emp_no
and to_date > NOW()
where first_name Like 'Aamod';
#join titles on emp_no
#i have it in a join statement but not
SELECT distinct
    title
FROM
    titles
WHERE
    emp_no in (SELECT 
            emp_no
        FROM
            employees
        WHERE
            first_name='Aamod');

#3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- SELECT 
--     CONCAT(first_name, ' ', last_name) AS Name
-- FROM
--     employees
-- WHERE
--     to_date < (SELECT 
--             to_date
--         FROM
--             titles
--         WHERE
--             to_date < NOW());

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            titles
        WHERE
            to_date > CURDATE());

#4 Find all the current department managers that are female. List their names in a comment in your code.
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name,
    dept_name AS Department,
    dept_manager.emp_no,
    gender
FROM
    employees
        JOIN
    dept_manager ON employees.emp_no = dept_manager.emp_no
		JOIN
	departments ON dept_manager.dept_no = departments.dept_no
    and to_date > NOW()
WHERE gender = 'F';

select emp_no
from dept_manager
where to_date > NOW();

select gender, first_name, emp_no
from employees
where emp_no in (select emp_no
from dept_manager
where to_date > NOW()) and gender = 'f';

#5 Find all the employees who currently have a higher salary than the companies overall, historical average salary
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, salary
FROM
    employees
        JOIN
    salaries ON employees.emp_no = salaries.emp_no
        AND to_date > NOW()
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            salaries);
            
#6 How many current salaries are within 1 standard deviation of the current highest salary? 
SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries
where zscore > 1;

#bonus Find the first and last name of the employee with the highest salary.
SELECT CONCAT(first_name, ' ',last_name)
from employees
where emp_no in (select emp_no from salaries where max(salary));

SELECT first_name, last_name, salary
FROM employees
JOIN salaries ON (salaries.emp_no = employees.emp_no)
WHERE salary = (SELECT MAX(salary) FROM salaries
WHERE to_date > NOW());

#bonus 3 Find the department name that the employee with the highest salary works in.
select dept_name, CONCAT(first_name, ' ', last_name) as Name, salary
from employees 
join salaries using (emp_no)
join dept_emp using (emp_no)
join departments using (dept_no)
where salary = (select max(salary) from salaries);

