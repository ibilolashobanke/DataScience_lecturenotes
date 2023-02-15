SELECT 
    first_name, last_name
FROM
    employees;
    SELECT 
    *
FROM
    employees;
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Dennis';
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' AND gender ='F';
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Christian';
     SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender ='F';
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND first_name = 'Elvis';
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND (gender ='M' OR gender = 'F');
    
    SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND (first_name = 'Kellie' OR 'Aruna');
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
    OR first_name = 'Mark'
    OR first_name = 'Nathan';
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie', 'Mark', 'Nathan');
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis', 'Elvis');
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John', 'Mark', 'Jacob');
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Mar_');
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Jack%');
    
    SELECT 
    *
FROM
    employees
WHERE
    hire_date  NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
     SELECT 
    *
FROM
    employees
WHERE
    salaries BETWEEN '$66,000' AND '$70,000';
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
    SELECT 
    *
FROM
    employees
WHERE
     department_no IS NOT NULL;
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';
    
    SELECT 
    *
FROM
    employees
WHERE
    hire_date >'2000-01-01';
    
    SELECT 
    *
FROM
    employees
WHERE
    hire_date <-'1985-02-01';
    
     SELECT 
    *
FROM
    employees
WHERE
    hire_date >'2000-01-01' AND gender = 'F'; 
    
    SELECT 
    *
FROM
    employees
WHERE
    salaries > '$150,000';
    
    SELECT 
    gender
FROM
    employees;
    
    SELECT DISTINCT
    gender
FROM
    employees;
    
    SELECT 
    hire_date
FROM
    employees;
    SELECT 
    COUNT(emp_no)
FROM
    employees;
    USE employees; 
    SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
    SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

 SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

 SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

 SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

 SELECT first_name FROM  employees;
 
  SELECT 
   first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;
SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    *, AVG(salaries)
FROM
    employees
GROUP BY AVG(salaries)
HAVING AVG(salaries) > 120000
ORDER BY emp_no;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;
select * from dept_emp order by emp_no desc;