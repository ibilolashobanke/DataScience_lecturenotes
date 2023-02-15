#Joins are SQL tools that allow us construct relationship between objects. A join shows a RESULT SET, containing fields derived from 2 or more tables. 
#The first step is to find a related column from the 2 tables that contain the same type of data, we are then free to add columns from these 2 tables to our output(as long as the columns you use to relate the tables represent the same object). 

#To create a departments_dup table that contains some records as the departments table:
CREATE TABLE departments_dups AS SELECT * FROM departments;
#Exercises:
insert into departments_dups(dept_no, dept_name) values ('null', 'Public Relations'); 

#To check the records on the departments_dups table:
SELECT *FROM departments_dups
order by dept_no; 

#To create a dup dept_manager table with column specifications:
create table dept_manager_dup (
emp_no int(11) not null,
dept_no char(4) null,
from_date date not null,
to_date date null
); 

#To insert all records from dept_manager to its dup table. Records exactly same as the original table.
insert into dept_manager_dup
select * from dept_manager; 

#To check the records of the dept_manager and its dup tables: 
select * from dept_manager; 
select * from dept_manager_dup
order by dept_no; 

#We then make some changes to the dup tables (dept_manager_dup and departments_dups) to perform our join operations: 
delete from dept_manager_dup
where dept_no = 'd001';

insert into departments_dups (dept_no, dept_name)
values ('d010', null),
('d011', null); 

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
	   (999905, '2017-01-01'),
		(999906, '2017-01-01'),
		(999907, '2017-01-01');

#INNER JOINS
#Follows the representation of a Venn diagram- a math tool representing all possible and logical relations between a finite collection of sets. The area representing all records belonging to both tables (matching values/records) is called a RESULT SET. 
#syntax: SELECT t1.column_name(s), t2.column_name(s) FROM t1 JOIN t2 ON t1.column_name = t2.column_name;   

#To check the records of the dept_manager_dup and departments_dups tables after the changes made to them: 
select * from dept_manager_dup
order by dept_no; 

SELECT *FROM departments_dups
order by dept_no;

#To perform an inner join (join) between both tables...
select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join
departments_dups d on m.dept_no = d.dept_no
order by m.dept_no;

#Inner joins extract only the records in which the values in the related columns match.Null values, or values appearing in just one of the two tables and not appearing in the other, are not displayed.  

#Exercise: extract a list containing info abt all manager's emp_no, first and last_name, dept_no and hire_date.
select d.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
from dept_manager_dup d
inner join
employees e on d.emp_no = e.emp_no
order by d.emp_no;

#Notes on Using Joins:
#1. We may add any combinations of columns we like on our output, the only condition is that each column must be part of one of the join tables.
#2. Typing INNER JOIN or JOIN in your query gives the same output. 
#3. The equality clause in the join syntax can follow either pattern i.e d.dept_no = m.dept_no IS THE SAME AS m.dept_no = d.dept_no. 
#4. The order by clause will work if your remove the table indication alias (m. or d. or e.)
#5. writing a JOIN syntax without the ON clause is not considered best practice. 

#Duplicate Records: Identical rows in an SQL table i.e for a pair of duplicate records, the values in each column coincide. 
 #We have a clean DB, so we'll insert duplicate records into our dups tables to see how to navigate this. 
  insert into dept_manager_dup
 values ('110228', 'd003', '1992-03-21', '9999-01-01');
 
 insert into departments_dups
 values ('d009', 'Customer Service');
 
 #Check the changes made to the 2 tables: 
 SELECT *FROM departments_dups
order by dept_no; 
select * from dept_manager_dup
order by dept_no; 

#We'll rerun the join query for the 2 tables
select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
join departments_dups d on m.dept_no = d.dept_no
order by m.dept_no;

#To handle duplicate records, GROUP BY the field that differs most among records 
select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
join departments_dups d on m.dept_no = d.dept_no
group by m.emp_no
order by m.dept_no;

#Never assume there are no duplicate rows in your data; it will be good to get used to grouping the joins by the field that differ most among the records.   
#LEFT JOIN: This contains all values from the left table that match no values from the right table. 
#First, we remove all duplicate records that were inserted previously. 
delete from dept_manager_dup
where emp_no ='110228'; 

delete from departments_dups
where dept_no = 'd009'; 
#MySQL deletes all records of '110228' and 'd009', so we must add back the initial single records. 

insert into dept_manager_dup
 values ('110228', 'd003', '1992-03-21', '9999-01-01');
 
 insert into departments_dups
 values ('d009', 'Customer Service');
 #Left Join
 select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
left join
departments_dups d on m.dept_no = d.dept_no
order by m.dept_no;

#Important Notes:
#1. Unlike what we had with inner joins, when working with left joins, the order in which you join tables matter. 
#Lets reverse the order of the tables:

select d.dept_no, m.emp_no, d.dept_name
from departments_dups d
left join
dept_manager_dup m on m.dept_no = d.dept_no
order by d.dept_no;

#Exercise:
#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.

select d.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
from employees e
join dept_manager d on e.emp_no = d.emp_no
where last_name = 'Markovitch'
order by d.emp_no;

#RIGHT JOIN: Their functionality is identical to LEFT JOINS, with the only difference being that the direction of the operation is inverted.  
#This means applying a RIGHT JOIN, displays all records from the right table in the result set. values from the left table will be included only if their linking column contains a value coinciding with a value from the linking column of the right table. 
#LEFT and RIGHT joins are a perfect example of one-to-many relationships in MYSQL. 
select d.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
right join
departments_dups d on m.dept_no = d.dept_no
order by dept_no;

#whether we run a RIGHT JOIN or a LEFT JOIN with an inverted table order, we will obtain the same output!
#Right joins are seldom applied in practice. 
select d.dept_no, m.emp_no, d.dept_name
from departments_dups d
left join
dept_manager_dup m on m.dept_no = d.dept_no
order by dept_no;

#The New and Old Join Syntax: 
#The WHERE (Old join syntax): select t1.column-name, t2.column_name from table_1 t1, table_2 t2 where t1.column_name = t2.column_name;

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m, departments_dups d
where m.dept_no = d.dept_no
order by m.dept_no;

#JOIN or WHERE?
# 1. the retrieved output is identical...
#2. using WHERE is more time-consuming
#3. the WHERE syntax is perceived as morally old and is rarely employed by professionals. 
#4. the JOIN syntax allows you to modify connection between tables easily...you can apply a left or right join easily. 

#Exercise: Extract a list containing information about all managers' employee number, first and last name, department number, and hire date. Use the old type of join syntax to obtain the result.

select d.emp_no, m.first_name, m.last_name, d.dept_no, m.hire_date
from employees m, dept_manager_dup d
where m.emp_no = d.emp_no
order by d.emp_no;

#JOIN and WHERE used together: 
#JOIN is used for connecting the 'employees' and 'salaries' tables.
#WHERE is used to define the condition that will determine which will be the connecting points between the two tables. 

select e.emp_no, e.first_name, e.last_name, s.salary
from employees e 
join salaries s on e.emp_no = s.emp_no
where s.salary > 145000; 

#Exercise: select the first and last name, the hire date, and the job title of all employees whose first name is "Margareta" and have the last name "Markovitch".
select e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
from employees e 
join titles t on e.emp_no = t.emp_no
where (first_name, last_name) = ('Margareta', 'Markovitch');  

#CROSS JOIN: This connects all the values from a table with other tables we want to join it with; connects ALL the values, no just those that match. 
#The cartesian product of the values of 2 or more sets. a cross join is not useful when the tables in a DB are not well connected. 

select dm.*, d.*
from dept_manager dm
cross join departments d
order by dm.emp_no, d.dept_no;

#Another way we can run a Cross join (summation of all tables) is: #The Old Join Syntax
select dm.*, d.*
from dept_manager dm,
departments d
order by dm.emp_no, d.dept_no;

#The query can also be run without the 'cross' word and it will give us the same response.  #Inner Join. 
select dm.*, d.*
from dept_manager dm
join departments d
order by dm.emp_no, d.dept_no;

select dm.*, d.*
from departments d
cross join dept_manager dm
where d.dept_no <> dm.dept_no 
order by dm.emp_no, d.dept_no;

#CROSS JOIN = INNER JOIN =OLD JOIN SYNTAX
#JOIN + ON CLAUSE = CROSS JOIN + WHERE 
#We can CROSS JOIN more than 2 tables, but caution must be taken because the result might become too big and MYSQL wont be able to execute the query. 

#Combining CROSS JOIN with an INNER JOIN: say we want more info abt the dept_managers e.g. first_name, hire_date...these info can be found in the employees table:
select e.*, d.*
from departments d
cross join dept_manager dm
join employees e on dm.emp_no = e.emp_no
where d.dept_no <> dm.dept_no
order by dm.emp_no, d.dept_no;

#Exercise:
#1. Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
select dm.*, d.*
from departments d
cross join dept_manager dm
where d.dept_no = 'd009'
order by dm.emp_no, d.dept_no;

#2. Return a list with the first 10 employees with all the departments they can be assigned to.
select e.*, d.* 
from employees e
cross join departments d
where e.emp_no < '10011'
order by e.emp_no; 

#USING AGGREGATE FUNCTIONS WITH JOINS: 
select e.gender, avg(s.salary) as average_salary
from employees e
join salaries s on e.emp_no = s.emp_no
group by gender; 

#JOIN MORE THAN TWO TABLES IN SQL:
#When creating a query that joins multiple tables, you must back it with strong intuition and a crystal clear idea of how you would like the tables to be connected. 

#To select all employees' fs, ls, hd, fd, dn...these records can be gotten from 3 tables (employees, department manager and departments).
select e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
from employees e 
join dept_manager m on e.emp_no = m.emp_no 
join departments d on m.dept_no = d.dept_no; 
#Note that this order can be inverted, as long as the connecting keys are well specified. 

#Exercise: Select all managers' first and last name, hire date, job title, start date, and department name.
select e.first_name, e.last_name, e.hire_date, t.title, t.from_date, d.dept_name
from employees e 
join titles t on e.emp_no = t.emp_no 
cross join departments d; 

#TIPS AND TRICKS FOR JOINS:
#1. one should look for key columns which are common between the tables involved in the analysis and are necessary to solve the task at hand. 
#...these columns do not need to be foreign or private keys. 

select d.dept_name, avg(salary) as average_salary
from departments d 
join dept_manager m on d.dept_no = m.dept_no
join salaries s on m.emp_no = s.emp_no
group by d.dept_name
having average_salary > 60000
order by average_salary desc; 

#Exercise: How many male and how many female managers do we have in the "employees" database?
select count(gender)
from employees e 
join dept_manager d on e.emp_no = d.emp_no
group by gender;  

#UNION VS UNION ALL:
#We create employees_dup table:
create table employees_dup (
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum ('M', 'F'),
hire_date date); 

#We then duplicate the structure of the employees' table:
insert into employees_dup select e.* from employees e limit 20; 

#To confirm the records in the employee_dup table:
select * from employees_dup; 

#We insert a duplicate of the first row...to create duplicate records. 
insert into employees_dup values ('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'); 

#UNION ALL: Used to combine a few SELECT statements in a single output. 
#you can think of it as a tool that allows you unify tables. 
#Syntax: SELECT N columns FROM table_1 UNION ALL SELECT N columns FROM table_2; 
#The number of columns from each table have to be the same; and these columns should have the same name, be in the same order and contain related data types.
#To satisfy these conditions with our existing tables, we must add all missing columns to each table. 
  
  select e.emp_no, e.first_name, e.last_name, null as dept_no, null as from_date
  from employees_dup e
  where e.emp_no = 10001
  union select null as emp_no, null as first_name, null as last_name, m.dept_no, m.from_date
  from dept_manager m; 
  
  #When uniting 2 identicaly organized tables....
  #UNION displays only distinct values in the output; uses more MYSQL resources (computational power and storage space)
  #UNION ALL retrieves the duplicates as well. 
  #when looking for better results, avoid duplicates and use UNION. 
  #However, when seeking to optimize performance, opt for UNION ALL. 

