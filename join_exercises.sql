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

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS "full name", departments.dept_name as department_name, employees.emp_no as employees_number
FROM employees #AS e
JOIN dept_emp #AS de
  ON dept_emp.emp_no = employees.emp_no
JOIN departments #AS d
  ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date = '9999-01-01'; 


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


select * from titles;
#4 ANSWER
SELECT 
    titles.title AS 'Title', COUNT(dept_emp.emp_no) as Count
FROM
    dept_emp
        JOIN
    titles ON dept_emp.emp_no = titles.emp_no
    	AND titles.to_date > CURDATE()
		AND dept_emp.to_date > CURDATE()
        JOIN
    employees ON titles.emp_no = employees.emp_no
group by titles.title;

#5 ANSWER
-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510
-- Finance            | Isamu Legleitner  |  83457
-- Human Resources    | Karsten Sigstam   |  65400
-- Marketing          | Vishwani Minakawa | 106491
-- Production         | Oscar Ghazalie    |  56654
-- Quality Management | Dung Pesch        |  72876
-- Research           | Hilary Kambil     |  79393
-- Sales              | Hauke Zhang       | 101987
select * from departments;
describe departments;
describe employees;
describe dept_emp;
SELECT departments.dept_name as 'Department', concat(first_name, ' ', last_name), salaries.salary
from departments 
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
join salaries on employees.emp_no = salaries.emp_no