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

SELECT departments.dept_name as 'Department', concat(employees.first_name, ' ', employees.last_name) as 'Name', salaries.salary
from departments 
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
join salaries on employees.emp_no = salaries.emp_no
and salaries.to_date > CURDATE()
order by dept_name;
#so currently in this code i am getting many duplicates

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager,
	s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
	AND dm.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#6 ANSWER
SELECT
	d.dept_no,
	d.dept_name,
	COUNT(emp_no) AS num_employees
FROM dept_emp AS de
JOIN departments AS d ON de.dept_no = d.dept_no
	AND de.to_date > CURDATE()
GROUP BY dept_no, dept_name;

#7
SELECT
	d.dept_name,
	ROUND(AVG(salary), 2) AS average_salary
FROM dept_emp AS de
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#8
SELECT
	e.first_name,
	e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

#9
SELECT
	e.first_name,
	e.last_name,
	s.salary,
	d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY s.salary DESC
LIMIT 1;

#10
SELECT d.dept_name, ROUND(AVG(s.salary),0) AS avg_dept_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY avg_dept_salary DESC;

#11
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
	d.dept_name AS 'Department Name',
	m.managers AS 'Manager Name'
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
	AND de.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no 
JOIN (SELECT
		 dm.dept_no,
		 CONCAT(e.first_name, ' ', e.last_name) AS managers
	 FROM employees AS e
	 JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
		 AND to_date > CURDATE()) AS m ON m.dept_no = d.dept_no
ORDER BY d.dept_name;