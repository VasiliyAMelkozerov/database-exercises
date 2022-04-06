#leedle leedle leedle leedle leedle
use employees;

SELECT 
    *
FROM
    employees
GROUP BY gender;

SELECT DISTINCT
    first_name
FROM
    employees;

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT 
    last_name, first_name
FROM
    employees
GROUP BY first_name , last_name;

SELECT 
    AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM
    salaries;
 
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    gender = 'F';

SELECT DAYNAME('1970-01-01');
SELECT MONTHNAME('2022-03-31');

describe employees;
explain employees;
-- 'emp_no','int','NO','PRI',NULL,''
-- 'birth_date','date','NO','',NULL,''
-- 'first_name','varchar(14)','NO','',NULL,''
-- 'last_name','varchar(16)','NO','',NULL,''
-- 'gender','enum(\'M\',\'F\')','NO','',NULL,''
-- 'hire_date','date','NO','',NULL,''

describe salaries;
describe dept_emp;

CREATE TABLE authors (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (first_name, last_name)
);
