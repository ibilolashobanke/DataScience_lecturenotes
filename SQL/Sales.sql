DROP DATABASE sales;
DROP DATABASE sales_margin;

CREATE DATABASE IF NOT EXISTS sales;
USE sales;
CREATE TABLE sales
(
  purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  date_of_purchase DATE NOT NULL,
  customer_id INT,
  item_code varchar(10) not null
  );
  
  CREATE TABLE customers
  (
  customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  email_address varchar(255) NOT NULL,
  number_of_complaints int
  );
  USE sales;
  SELECT * FROM customers;
  
  SELECT * FROM sales.customers;
  
  USE sales;
  SELECT * FROM sales;
  SELECT * FROM sales.sales;
  
  DROP TABLE sales;
  DROP TABLE customers;
  DROP TABLE items;
  DROP TABLE companies;
  
  