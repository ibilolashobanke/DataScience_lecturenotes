CREATE TABLE customers
  (
  customer_id INT AUTO_INCREMENT,
  first_name varchar(255),
  last_name varchar(255),
  email_address varchar(255),
  number_of_complaints int,
  primary key (customer_id)
  ); 
  
  ALTER TABLE customers
  ADD COLUMN gender ENUM('M' , 'F') AFTER last_name;
  INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
  VALUES ('John' , 'Mackinley' , 'M' , 'john.mckinley@365datascience.com' , 0);
  
  DROP INDEX email_address;
    
  ADD UNIQUE KEY (email_address);
  
    DROP TABLE customers;
  