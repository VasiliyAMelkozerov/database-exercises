#1
use employees;

SELECT *
FROM employees
LIMIT 100;

-- SELECT * FROM
-- employees WHERE hire_date = "1985-01-01";
SHOW CREATE TABLE employees;

SELECT DISTINCT * FROM employees WHERE hire_date LIKE "1985-__-01";

#2 ANSWER: 709
SELECT COUNT(first_name) 
FROM employees
-- WHERE first_name = 'Irena'
-- 	or first_name = 'Vidya'
-- 	or first_name = 'Maya';
WHERE first_name IN ('Irena','Vidya','Maya');

#3 ANSWER: 709
SELECT COUNT(first_name) 
FROM employees
WHERE first_name = 'Irena'
	or first_name = 'Vidya'
	or first_name = 'Maya';
    
#4 ANSWER: 619
SELECT COUNT(first_name) 
FROM employees
WHERE first_name = 'Irena'
	or first_name = 'Vidya'
	or first_name = 'Maya'
    and gender = 'M';
    
#5 ANSWER: 7330
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%';

#6 ANSWER: 30723/23393
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%'; 

#6/7 ANSWER 24292 END WITH E

#7 ANSWER: 899
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%E'; 
# 'E%' AND last_name LIKE '%E';

#8 ANSWER: 135214
SELECT COUNT(hire_date)
FROM employees
WHERE hire_date LIKE '199%'; #'199_-__-__'
#BETWEEN '1990-01-01' AND '1999-12-31';

#9 ANSWER: 842
SELECT COUNT(hire_date)
FROM employees
WHERE birth_date LIKE "____-12-25";

#10 ANSWER:362
SELECT COUNT(hire_date)
FROM employees
WHERE birth_date LIKE "____-12-25" AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';

#11 ANSWER: 1873
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%Q%';

#12 ANSWER: 547
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%Q%' 
AND NOT last_name LIKE '%QU%';