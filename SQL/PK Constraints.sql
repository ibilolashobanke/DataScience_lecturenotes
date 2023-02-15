DROP TABLE sales;

CREATE TABLE sales
(
  purchase_number INT AUTO_INCREMENT,
  date_of_purchase DATE,
  customer_id INT,
  item_code varchar(10),
  PRIMARY KEY (purchase_number),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE 
  );
  DROP TABLE customers;
  CREATE TABLE customers
  (
  customer_id INT,
  first_name varchar(255),
  last_name varchar(255),
  email_address varchar(255),
  number_of_complaints int DEFAULT 0,
  primary key (customer_id)
  );
  
  CREATE TABLE items
  (
  item_code varchar(255),
  item varchar(255),
  unit_price INT,
  company_id varchar(255),
  primary key (item_code)
  );
  
  CREATE TABLE companies
  (
  company_id varchar(255),
  company_name varchar(255),
  headquaters_phone_number INT(12)
  ); 
  
  CREATE TABLE sales
(
  purchase_number INT AUTO_INCREMENT,
  date_of_purchase DATE,
  customer_id INT,
  item_code varchar(10),
  PRIMARY KEY (purchase_number)
  );
  
  ALTER TABLE sales
  ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
  
  ALTER TABLE sales
  DROP FOREIGN KEY sales_ibfk_1;
  
  ALTER TABLE sales
  ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
  
  ALTER TABLE sales
  DROP FOREIGN KEY sales_ibfk_1;
  