UPDATE employees
SET
first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-02-02',
gender = 'F'
WHERE 
emp_no = 999901; 

#to confirm the updated record on the employees table: 
SELECT 
    *
FROM
    employees
WHERE emp_no = 999901; 

SELECT * FROM 
departments_dup 
order by dept_no;
COMMIT;

select* from departments_dup; 

commit; 

update departments_dup
set 
dept_no ='d011',
dept_name = 'Quality control';

ROLLBACK;

#Exercise: Change the 'Business Analysis' department name to 'Data Analysis'

select * from departments;

update departments
set
dept_name = 'Data Analysis'
where 
dept_no = 'd010'; 

