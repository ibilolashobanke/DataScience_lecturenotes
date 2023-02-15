 #IFNULL() and COALESCE(): Used when null values are dispersed in your data table and you would like to substitute the null values with another value.  substitute values with null values found in the table. 
 
 select * from departments;
 
 #To see how this works, we will ALTER the departments table to include null values in the 'dept_name' column, which we will then substitute with values using the IFNULL() and COLESCE()   
    
ALTER TABLE departments
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

#We will then insert a couple of data values (d010 and d011) into the dept_no column, leaving the dept_name column blank (null). this will only happen because we allowed for null values to exist in the 'department_name' field. 

INSERT INTO departments(dept_no) VALUES ('d010'), ('d011'); 

#check the state of the 'departments' table now:
select * from departments; 

#Next, we add a third column called 'dept_manager'(after the dept_name column), which we will leave empty for now and will add the NULL constraint. 

ALTER TABLE employees.departments
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

#check the state of the 'departments' table now: 
select * from departments
order by dept_no asc; 

#To save the 'departments' table in its current state, execute a COMMIT statement: 
COMMIT;

#To have a different sign or text (e.g. department name not provided) displayed when theres a missing value in your table, a function called IFNULL() can be employed within the SELECT block and needs only 2 arguments within its parenthese:
#IFNULL(expression_1, expression_2)
#expression_1 is returned if the data value found in the table is not null i.e its original/initial value will be displayed.  
#expression_2 is returned if there is a null value, then prints expression_2 value in the output column.
 
 SELECT 
    dept_no,
    IFNULL(dept_name,
            'department name not provided') as dept_name 
FROM
    departments; 
    
    #IFNULL() however has its limitation; it cannot contain more than two parameters. This is where the COALESCE() function steps in. 
    #COALESCE(expression_1, expression_2,..., expression_n)
    #Actually, while IFNULL() can only have 2 arguments, COALESCE() can have one, two or more arguments. 
    #COALESCE() = IFNULL() with more than two parameters. 
    
    #COALESCE will always return a single value of the ones within the parentheses, and this value will be the first non-null value of the list, reading from left to right. 
        
    select
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') as dept_manager
    from
    departments
    order by dept_no asc; 
    
    #the above syntax returns into each cell of the 3rd column:
    #the initial value of that cell (dept_manager) if it is NOT NULL;
    #the dept_name (2nd designated) value if it is NULL;
    #'N/A' if the 2nd designated value (dept_name) is NULL. 
          
    #IFNULL() and COALESCE() do not make any changes to the dataset. They merely create an output where certain data values appear in place of NULL values. 
    
    #ALTERNATIVE USE OF COALESCE():
    #COALESCE() with a single argument
    
    SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    departments; 
    
    #Technically, COALESCE was used to show one additional column in the output. 
    #Practitioners find this trick useful when some hypothetical results must be provided in a supplementary column.
    #If you are still building a table or DB, COALESCE() can help you visualize a prototype of the table's final version.  
    
    #Exercise
    #Task 1:
    select *
    from departments; 
    
ALTER TABLE employees.departments
ADD COLUMN dept_info VARCHAR(255) NULL AFTER dept_name;

ROLLBACK;

select
    dept_no,
    dept_name,
    COALESCE(dept_info, dept_no, dept_name, 'N/A') as dept_info
    from
    departments
    order by dept_no asc; 
    
    #Task 2:
    SELECT 
    dept_no,
    IFNULL(dept_name,
            'department name not provided') as dept_name 
FROM
    departments; 
    