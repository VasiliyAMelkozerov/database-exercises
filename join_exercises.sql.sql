use join_example_db;


describe roles;
SELECT * FROM roles;

-- field, type, null, key, default, extra
-- 'id','int unsigned','NO','PRI',NULL,'auto_increment'
-- 'name','varchar(100)','NO','',NULL,''

describe users;
SELECT * FROM users;

-- field, type, null, key, default, extra
-- 'id','int unsigned','NO','PRI',NULL,'auto_increment'
-- 'name','varchar(100)','NO','',NULL,''
-- 'email','varchar(100)','NO','',NULL,''
-- 'role_id','int unsigned','YES','MUL',NULL,''

SELECT join_example_db
FROM roles as roles
JOIN users as users ON roles.id = users.fk_id;

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

use employees;
#%%%%%%%%%%%%%%%%%%%%%%%%%% from ciriculumn
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;
#%%%%%%%%%%%%%%%%%%%%%%%%%%

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS "full name", departments.dept_name as department_name, employees.emp_no as employees_number
FROM employees #AS e
JOIN dept_emp #AS de
  ON dept_emp.emp_no = employees.emp_no
JOIN departments #AS d
  ON departments.dept_no = dept_emp.dept_no
  #group by last_name:
WHERE dept_emp.to_date = '9999-01-01'; #AND e.emp_no = 10001;


SELECT employees.first_name, employees.emp_no, dept_manager.dept_no
from employees 
join dept_manager 
on dept_manager.emp_no=employees.emp_no;

describe dept_manager;
select * from dept_manager;

describe departments;
select * from departments;

#2 COMPLETED
SELECT 
    departments.dept_name AS 'Department Name',
--     departments.dept_no,
--     dept_manager.dept_no,
--     dept_manager.emp_no,
--     employees.emp_no,
#commented out to show that I dont not have to start it at the select statement to be able to each other
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Deparment Manager'
FROM
    departments
        JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
    where to_date > NOW();
    
#3 COMPLETED
SELECT 
    departments.dept_name AS 'Department Name',
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Deparment Manager',
    gender
FROM
    departments
        JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
WHERE
    to_date > NOW() AND gender = 'F'
ORDER BY dept_name;

#4 
SELECT departments.dept AS 'Title';
Select * from titles;