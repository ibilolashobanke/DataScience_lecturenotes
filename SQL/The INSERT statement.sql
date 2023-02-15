SELECT * FROM employees 
order by emp_no desc 
limit 10; 
INSERT INTO employees
(
emp_no,
birth_date,
first_name,
last_name,
gender,
hire_date
) VALUES
(
999901,
'1986-04-21',
'John',
'Smith',
'M',
'2011-01-01'
); 

INSERT INTO employees
(
birth_date,
emp_no,
first_name,
last_name,
hire_date,
gender
) VALUES
(
'1989-04-25',
999905,
'Julia',
'Stone',
'2011-01-01',
'F'
); 

INSERT INTO employees
 VALUES
(
999907,
'1987-06-21',
'Johnson',
'Osuntade',
'M',
'2012-01-01'
); 

#Exercise 2 

select * from titles
where emp_no ='999903'; 

INSERT INTO employees.titles
(
emp_no,
title,
from_date,
to_date
)
VALUES
(
999903,
'Senior Engineer',
'1997-10-01',
'9999-01-01'
); 

#Created a new record for employee in titles table: 
INSERT INTO employees
 VALUES
(
999906,
'1984-05-21',
'Bolaji',
'Aduloju',
'M',
'2019-01-01'
); 

INSERT INTO employees.titles
(
emp_no,
title,
from_date,
to_date
)
VALUES
(
999906,
'Senior Executive',
'1981-11-21',
'9999-01-01'
); 


# Inserting Data INTO a new table

SELECT * FROM departments LIMIT 10; 

CREATE TABLE departments_dup AS SELECT * FROM departments;
SELECT *FROM DEPARTMENTS_DUP; 
 
DROP TABLE departments_dup; 

select* from departments; 

# Exercise 3
INSERT INTO departments
 VALUES
(
'd010',
'Business Analysis'
); 