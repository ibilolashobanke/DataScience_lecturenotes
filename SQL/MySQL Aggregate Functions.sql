#Aggregate functions (Summarizing functions): They gather data from many rows of a table, then aggregate it into a single value.
#They are a response to organization's information requirements; top management executives are typically interested in summarized figures and rarely in detailed data.    

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

#COUNT(): counts the number of non-null records in a field; applicable to both numeric and non-numeric data. 
SELECT 
    COUNT(salary)
FROM
    salaries; 
    
    SELECT 
    COUNT(from_date)
FROM
    salaries; 
    
   #COUNT(DISTINCT): helps us find the number of times unique values are encountered in a given column. 
    SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries; 
    
    #COUNT(*): returns the number of all rows of the table, NULL values included. * only works well with the COUNT function. 
    
#SUM(): sums all the non-null values in a specified column; works only with numeric data . 
SELECT 
    SUM(salary)
FROM
    salaries; 
    
    #MAX() and MIN(): returns the maximum and minimum values of a column
    
    SELECT 
    MAX(salary)
FROM
    salaries; 
    
    SELECT 
    MIN(salary)
FROM
    salaries; 
    
    #Exercises: which is the lowest and highest employee number in the database?
   
   select MIN(emp_no) 
    from employees; 
    
    select max(emp_no)
    from employees; 

#AVG(): extracts the average value of all non-null values in a field.

SELECT 
    AVG(salary)
FROM
    salaries; 
    
    #Exercise: What is the avg annual salary paid to employees who started after the 1st of January 1997?
    
    SELECT 
    AVG(salary)
FROM
    salaries
    group by from_date > 1997-01-01; 
    
    #ROUND(#, decimal_places): a numeric or math function you can use; usually applied to single values that aggregate functions return. 
SELECT 
    ROUND(AVG(salary))
FROM
    salaries; 
    
    #You can specify the number of decimal places you want your value rounded to. 
    SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries; 
    
    #Exercise:Round  the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents. 
    SELECT 
   ROUND(AVG(salary),2)
FROM
    employees.salaries
    WHERE from_date > 1997-01-01; 

   