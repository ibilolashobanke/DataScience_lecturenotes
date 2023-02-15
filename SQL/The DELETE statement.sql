USE employees; 
COMMIT;
SELECT * FROM EMPLOYEES  
WHERE 
EMP_NO = 999907; 

SELECT * FROM TITLES 
WHERE 
EMP_NO = 999907; 

#To delete employee 999907 record: 
DELETE FROM EMPLOYEES
WHERE 
EMP_NO = 999907; 

#To undo the DELETE function:
ROLLBACK;

#To verify ROLLBACK function:
SELECT * FROM EMPLOYEES  
WHERE 
EMP_NO = 999907; 

SELECT * FROM TITLES  
WHERE 
EMP_NO = 999907; 

#Example 2: 
USE employees; 
COMMIT; 

select * from employees
where 
emp_no = 999906; 

select * from titles
where 
emp_no = 999906; 

DELETE FROM employees
WHERE 
emp_no = 999906;

#To rollback delete function: 
ROLLBACK; 

select * from employees
where 
emp_no = 999906; 

select * from titles
where 
emp_no = 999906; 

#DELETE STATEMENT- PART 2
#The 'WHERE' clause in the DELETE statement is extremely important. if not specified, the command deletes the entire table. 

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

#Execute delete statement without specifying the where condition:

DELETE FROM departments_dup; 
#This deletes the entire table. 

#To undo the delete function:
ROLLBACK; 

#Exercise: Remove the department number 10 record from the 'departments' table. 

select * from departments; 

delete from departments
where 
dept_no = 'd010'; 

#DROP VS TRUNCATE VS DELETE
#Drop: This removes all records, structure and related objects(indexes & constraints). only use DROP when you are sure you arent going to use the table anymore, as you wont be able to rollback changes. 
#Truncate: removes all records, but leaves the table intact. when truncating, auto_increment will be reset. 
#Delete: removes records row by row; only records specified in the WHERE conditions will be deleted. auto_increment values are not reset wit DELETE. 

