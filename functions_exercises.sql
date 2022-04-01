use employees;
#2 ANSWER
SELECT CONCAT(first_name, last_name)
AS "full_name"
FROM employees
WHERE last_name LIKE 'E%E';

#3 ANSWER
SELECT CONCAT(UPPER(first_name), UPPER(last_name))
as "full_name"
FROM employees
WHERE last_name LIKE 'E%E';

#4 ANSWER
SELECT 
    *, DATEDIFF(NOW(), hire_date)
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '____-12-25'
ORDER BY birth_date , hire_date DESC;

#CURDATE() datediff() NOW()

select *,  dayname(birth_date) as day_of_birth from employees;

#5 QUESTION
SELECT * FROM salaries ORDER BY salary;

#5 158220
SELECT 
    MAX(salary), MIN(salary)
FROM
    salaries
WHERE
    CURDATE() < to_date
    ;
#5 38623
SELECT MIN(salary) FROM salaries;

SELECT * FROM employees;
#6 QUESTION gface_0953
SELECT 
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
            ) AS username,
            first_name,
            last_name,
            birth_date
FROM
    employees;
#make a username that
SELECT REPLACE('abcdefg', 'd', '123');
