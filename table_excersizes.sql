USE employees;
#3this line of code calls the database we want to use and manipulate inthe following lines
SHOW tables;
#4this command lists all tables
DESCRIBE employees;
#5 int's, date's, varchar(14) + 16, enum(M,F)
#6 emp_no is an int/number
#7 first and last name are string type columns
#8 birth date and hire date are date data types
#9 the relationship between employees and department? they are both under employees tables (they're under the same database)
SHOW CREATE TABLE dept_manager;
#10 completed.