 #Self Join: applied when a table must join itself. if you'd like to combine certain rows of a table with other rows of the same table, yoou need a self join. 
 #A self join statement complies with the same logical and syntactic structure as inner join (joining 2 tables together);  
 #however, the 2 tables will be identical to the table you'll be using in the self join. 
#.....think of them as virtual projection of the underlying base table.
#Self join will refernce both implied tables and will treat them as 2 seperate tables in its operations. 
#Also, the data used will come from a single source- the underlying table that stores data physically. 
#Using aliases is obligatory in Self Join 
#these references to the original table let you use different blocks of the available data.   
#you can either filter both in the join, or you can filter one of them in the WHERE clause and the other in the Join.  

#Task 1: From the emp_manager table, extract the record data only of those employees who are managers as well. 
select distinct e1.* from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no;  