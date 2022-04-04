use employees; 

#2 answer: 7
SELECT DISTINCT title FROM titles;

-- SELECT * from titles;
-- #select distinct titles from titles;
-- select * from distinct titles;

#3 answer 5
SELECT DISTINCT
    last_name, COUNT(last_name)
FROM
    employees
WHERE
    last_name like 'e%e'
group by
	last_name;
#its seems to me that when we use group we have to tie it to what is in the select line
#4 answer 4
SELECT DISTINCT
    last_name, first_name
FROM
    employees
WHERE
    last_name like 'e%e'
group by first_name, last_name;
    
#5 answer:Chleq Lindqvist Qiwen
SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
#6 answer 547: Cleq
SELECT DISTINCT
   last_name, count(last_name) as "number of employees"
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
	group by last_name;
        
#7 answer
SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
group by gender;

#7 answer
SELECT gender, first_name, COUNT(first_name) 
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
    group by gender, first_name;
    
#8 answer  300024,300018
SELECT DISTINCT
    LOWER(CONCAT((SUBSTR(first_name, 1, 1)),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees;
    
SELECT 
	LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1),
				SUBSTR(last_name, 1, 4),
				'_',
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)
				)
			) AS username,
            count(*) as count_of_users
FROM employees
group by username;
#returns 285872
SELECT 
	LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1),
				SUBSTR(last_name, 1, 4),
				'_',
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)
				)
			) AS username,
            count(*) as count_of_users
FROM employees
group by username
having count_of_users > 1;
#returns 13251
#9 ANSWER
-- Determine the historic average salary for each employee. 
-- When you hear, read, or think "for each" with regard to SQL, 
-- you'll probably be grouping by that exact column. 

select sum(t.count_of_users) as 'total_duplicates',
count(t.count_of_users) as 'number_of_unique_duplicates'
from (SELECT 
	LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1),
				SUBSTR(last_name, 1, 4),
				'_',
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)
				)
			) AS username,
            count(*) as count_of_users
FROM employees
group by username
having count_of_users > 1) as t;
#returns: 27403,13251

SELECT * FROM salaries;