use employees;
#1
select * from employees;

SELECT 
    emp_no,
    first_name,
    last_name,
    dept_no,
    salaries.from_date,
    salaries.to_date,
    IF(salaries.to_date > NOW(), 1, 0) AS is_employed
FROM
    employees
        JOIN
    salaries USING (emp_no)
        JOIN
    dept_emp USING (emp_no);
    
#2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H'
#'I-Q', or 'R-Z' depending on the first letter of their last name
SELECT 
    emp_no,
    CONCAT(first_name, ' ', last_name),
    CASE
    WHEN last_name REGEXP '^[A-H]' THEN 'A-H'
    WHEN last_name REGEXP '^[I-Q]' THEN 'I-Q'
    WHEN last_name REGEXP '^[R-Z]' THEN 'R-Z'
    END AS alpha_group
	FROM employees;

#3 How many employees were born in each decade

SELECT 
    CONCAT(first_name, ' ', last_name),
    birth_date,
    CASE
        WHEN YEAR(birth_date) BETWEEN 1940 AND 1949 THEN '1940s'
        WHEN YEAR(birth_date) BETWEEN 1950 AND 1959 THEN '1950s'
        WHEN YEAR(birth_date) BETWEEN 1960 AND 1969 THEN '1960s'
        WHEN YEAR(birth_date) BETWEEN 1970 AND 1979 THEN '1970s'
        WHEN YEAR(birth_date) BETWEEN 1980 AND 1989 THEN '1980s'
        WHEN YEAR(birth_date) BETWEEN 1990 AND 1999 THEN '1990s'
    END AS decades
FROM
    employees;

#4 What is the current average salary for each of the following department groups: 
#R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

DESCRIBE departments;
select dept_name from departments;

SELECT 
    dept_name,
    salaries.emp_no,
    dept_name,
    salaries.salary,
    CASE
        WHEN dept_name IN ('Research' , 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales' , 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production' , 'Quality Management') THEN 'Production & Quality Management'
        WHEN dept_name IN ('Finance' , 'Human resources') THEN 'Finance & Human Resources'
        WHEN dept_name IN ('Customer Servive') THEN 'Customer Service'
    END AS 'Department Groups'
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
        JOIN
    salaries ON dept_emp.emp_no = salaries.emp_no
        AND salaries.to_date > NOW()
ORDER BY emp_no;

describe dept_emp;
use employees;
#SELECT student_name, COUNT(*) FROM students GROUP BY class_type
#Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'employees.employees.first_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

select first_name, count(*) from employees group by gender;
select * from salaries where emp_no + 2 > 10000 AND salary < 80000;
select distinct emp_no;





