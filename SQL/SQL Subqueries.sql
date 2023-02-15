#SUBQUERIES WITH IN NESTED INSIDE WHERE:
#Subqueries = inner queries = nested queries = inner select: are queries embedded in a query. they are part of another query, called an OUTER query. 

#Select the first and last name from the 'employees' table for the same employee numbers that can be found in the 'department manager' table. 
select e.first_name, e.last_name
from employees e
where e.emp_no in (select dm.emp_no from dept_manager dm); 

#We can run the subquery as a stand alone query:
select dm.emp_no from dept_manager dm;

#A subquery should always be placed within parentheses. 
#How suqueries are processed...
#1. the SQL engine starts by running the inner query.
#2. then it uses its returned output, which is intermediate, to execute the outer query.
 
 #A subquery may return a single value (scalar), a single row, single column or an entire table. 
 #We can have a lot more than one subquery in our outer query. 
 #It is possible to nest inner queries within other inner queries...in this case, the SQL engine would execute the innermost query first and then each subsequent query till the last. 
 
 #Exercise: Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
 select dm.emp_no, dm.dept_no, dm.from_date, dm.to_date
 from dept_manager dm
 where dm.emp_no in (select e.hire_date between '1990-01-01' and '1995-01-01' from employees e);



#SQL Subqueries with EXISTS-NOT EXISTS nested inside WHERE:
#EXISTS: checks whether certain row values are found within a subquery. This check is conducted row by row and returns a boolean value. 
#If a row value of a subquery exists, it returns TRUE, and the corresponding record of the outer query is extracted. 
#When a row value of a subquery doesnt exist, it returns FALSE and no row value from the outer query is extracted. 
 
select e.first_name, e.last_name
from employees e
where exists (select * from dept_manager dm where dm.emp_no = e.emp_no);

#While IN searches among values, EXISTS tests row values for existence.
#While IN works faster with smaller datasets, EXISTS is quicker in returning large amounts of data. 

#Adding ORDER BY....In MYSQL, you can add the ORDER BY clause within the subquery. 
select e.first_name, e.last_name
from employees e
where exists (select * from dept_manager dm where dm.emp_no = e.emp_no order by emp_no);
 
 #It is however more professional to add the ORDER BY clause in the OUTER QUERY : 
 select e.first_name, e.last_name
from employees e
where exists (select * from dept_manager dm where dm.emp_no = e.emp_no)
order by emp_no;
#It is more acceptable logically to sort the final version of your dataset and not versions preceeding the final one/ 
 #Important notes: 
 #some, though not all nested queries can be rewritten using JOINS, which are more efficient in general. 
 #This is true for inner queries using the WHERE clause
 #Subqueries allow for better structuring of the outer query; thus, each inner query can be thought of in isolation; hence the name Structured Query Language: SQL.    
 #In some situations, the use of subqueries is much more intuitive compared to the use of complex joins and unions. 
 #Many users prefer subqueries simply because they offer enhanced code readability. 
 
#Exercise: Select the entire information for all employees whose job title is "Assistant Engineer".
select e.*, t.title
from employees e, titles t 
where e.emp_no = t.emp_no 
and exists (select * from titles where t.title = 'Assistant Engineer');  

#OR using the join syntax:
select e.*, t.title from employees e
        join titles t on e.emp_no = t.emp_no
        where title = 'Assistant Engineer';


#SQL SUBQUERIES NESTEDIN SELECT AND FROM
#Task 1: Assign employee number 110022 as a manager to all employees from 10001 to 10020, and employee number 110039 as a manager to all employees from 10021 to 10040.
#Subset A (10001 to 10020) UNION Subset B (10021 to 10040)
#We start with the innermost query of the first block.....
select emp_no from dept_manager where emp_no = 110022; 
#We then add this inner query to the select statement of an outer query.....

Select A.* from
(select e.emp_no as employee_id, min(de.dept_no) as dept_code,
(select emp_no from dept_manager where emp_no = 110022) as manager_id
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no <= 10020
group by e.emp_no
order by e.emp_no) as A
UNION Select B.* from
(select e.emp_no as employee_id, min(de.dept_no) as dept_code,
(select emp_no from dept_manager where emp_no = 110039) as manager_id
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no >= 10020
group by e.emp_no
order by e.emp_no limit 20) as B; 

#Exercise: 
CREATE TABLE emp_manager
(emp_no int(11) not null,
dept_no char(4) null,
manager_no int(11) not null); 

INSERT INTO emp_manager SELECT U.* from 
(Select A.* from
(select e.emp_no as employee_id, min(de.dept_no) as dept_code,
(select emp_no from dept_manager where emp_no = 110022) as manager_id
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no <= 10020
group by e.emp_no
order by e.emp_no) as A
UNION Select B.* from
(select e.emp_no as employee_id, min(de.dept_no) as dept_code,
(select emp_no from dept_manager where emp_no = 110039) as manager_id
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no >= 10020
group by e.emp_no
order by e.emp_no limit 20) as B
UNION Select C.* from
(select e.emp_no as employee_id, min(de.dept_no) as dept_code,
(select emp_no from dept_manager where emp_no = 110039) as manager_id
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no =110022
group by e.emp_no
order by e.emp_no) as C
UNION Select D.* from
(select e.emp_no as employee_id, min(de.dept_no) as dept_code,
(select emp_no from dept_manager where emp_no = 110022) as manager_id
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no = 110039
group by e.emp_no
order by e.emp_no) as D) as U; 

Select * from emp_manager; 
 
#Union allows you to combine the result of 2 select statements.