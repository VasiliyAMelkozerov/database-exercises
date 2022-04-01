USE employees;

#2 ANSWER: Irena Reutenauer, Vidya Simmen
SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;

#3 ANSWER: Irena Acton, Vidya Zweizig
SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;

#4 ANSWER: Irena Acton, Maya Zyda
SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;

#5 ANSWER:899,10021 RAMZI ERDE, 499648 Tadahiro Erde
SELECT *#COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no; 

#6 ANSWER: 899, Sergi Erde, Teiji Eldridge
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%E'
ORDER BY hire_date DESC; 

#7 ANSWER: 362, Tremaine Eugenio, Gudjon Vakili
SELECT *#COUNT(hire_date)
FROM employees
WHERE hire_date 
LIKE '199%' 
AND birth_date 
LIKE '____-12-25'
ORDER BY birth_date, hire_date DESC;