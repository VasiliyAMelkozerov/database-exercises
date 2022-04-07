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