use employees;

select first_name, last_name, hire_date
from employees
#so currently this code works up to a point, the only problem is that it does not have a current running
where hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
);

#is the same as employee with (emp_no = 101010)

SELECT hire_date
    FROM employees
    WHERE emp_no = 101010;
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