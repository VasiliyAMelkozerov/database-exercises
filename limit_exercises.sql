USE employees;

#SELECT DISTINCT title FROM titles;

SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date ORDER BY birth_date, hire_date LIMIT 5;

-- SELECT DISTINCT last_name
-- FROM employees
-- ORDER BY 