#INTRODUCTION TO STORED ROUTINES:
#Stored routine is an SQL statement or a set of SQL statements, that can be stored on the DB server.  
#Whenever a user needs to run the query in question, they can call, reference or invoke the routine. 
#We can have 2 types of stored routines: procedures and functions...Functions could be user defined or built in functions.

#MYSQL SYNTAX FOR STORED PROCEDURES: 
USE employees; 

#1. semi-colons: they function as statement terminator. Technically, they can also be called delimiters. 
#...by typing DELIMITER $$, you'll be able to use the dollar symbol as your delimiter. 
#when invoking procedures that use ; as delimiter, the SQL engine will run only the first statement and will move on to the next query that is beyond the procedure; it wont read the code after the first ; (in the procedure). 
#...to avoid this, use a temporary delimiter ($$, //) different from the ; 

#Syntax: 
DELIMITER $$ 
create procedure procedure_name(param_1, param_2)
begin 
select * from employees 
limit 1000; 
end$$

#parameters rep certain values that the procedure will use to complete the caalculation it is supposed to execute. 
#procedures can be created without parameters too; nevertheless, the parentheses must always be attached to its name. 
 
 #STORED PROCEDURES - EXAMPLE
 USE employees; 
 
 #We will devise a nonparameterized procedure that whenever applied, will return the first 1,000 rows from the employees' table: 
 #First, we check and drop (if already exists) the procedure we want to create. 
 
 drop procedure if exists select_employees; 
 
 #When dropping a nonparameterized procedure, we should not write the parentheses at the end.  
 #We then set $$ as a temporary delimiter:
 delimiter $$
 create procedure select_employees()
 begin select * from employees limit 1000;
    end$$
    DELIMITER ;
    
#To verify that the procedure was sucessfully created:
#Referesh the schema, locate stored procedures under the appropriate table and there you'll find the newly created procedure.   

#To invoke the stored procedure: There are 3 main ways to do this:
#1. CALL database_name.procedure_name(); placing () at the end is a matter of preference. However, the () clearly states that the object being called is a stored routine. 
CALL employees.select_employees(); 
#2. CALL procedure_name(); This takes advantage of the fact that we have already selected employees as our default DB, so we can skip the DB name and call the procedure directly. Again, placing () in the query is a mater of preference/ 
CALL select_employees(); 
#3. Click on the tiny lightening symbol that comes up by the select_employees in the schema section. This opens a new tab with a line of code for invoking the stored procedure. 

#Exercise: Create a procedure that will provide the average salary of all employees. Then, call the procedure.
delimiter $$
 create procedure avg_salary()
 begin select AVG(salary) from salaries; 
    end$$
    DELIMITER ;
    #To confirm and invoke the stored procedure: 
    call avg_salary();
    
    #ANOTHER WAY TO CREATE A PROCEDURE IN MYSQL:
    