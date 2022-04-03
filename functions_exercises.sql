use employees;
SELECT 
    CONCAT(first_name, last_name) AS 'full_name'
FROM
    employees
WHERE
    last_name LIKE 'E%E';

SELECT 
    CONCAT(UPPER(first_name), UPPER(last_name)) AS 'full_name'
FROM
    employees
WHERE
    last_name LIKE 'E%E';

SELECT 
    *, DATEDIFF(NOW(), hire_date)
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '____-12-25'
ORDER BY birth_date , hire_date DESC;

SELECT 
    *, DAYNAME(birth_date) AS day_of_birth
FROM
    employees;

SELECT 
    *
FROM
    salaries
ORDER BY salary;

SELECT 
    MAX(salary), MIN(salary)
FROM
    salaries
WHERE
    CURDATE() < to_date
;
SELECT 
    MIN(salary)
FROM
    salaries;

SELECT 
    *
FROM
    employees;
SELECT 
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees;