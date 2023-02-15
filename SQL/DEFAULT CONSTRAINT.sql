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
  customer_id INT NOT NULL AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  email_address varchar(255) NOT NULL,
  number_of_complaints int default 0,
  primary key (customer_id)
  );
  
  ALTER TABLE customers
  CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;
  ALTER TABLE customers
  ADD COLUMN gender ENUM('M' , 'F') AFTER last_name;
  
  INSERT INTO customers (first_name, last_name, gender, email_address)
  VALUES ('Peter' , 'Figaro' , 'M' , 'peter.figaro@365datascience.com');

  SELECT * FROM customers;
  
  ALTER TABLE customers
  ALTER COLUMN number_of_complaints DROP DEFAULT;
  SELECT * FROM customers;
  
  CREATE TABLE companies
  (
  company_id varchar(255),
  company_name varchar(255) NOT NULL,
  headquaters_phone_number varchar(255),
  primary key (company_id),
  unique key (headquaters_phone_number)
  );
  ALTER TABLE companies
  MODIFY company_name varchar(255) NULL;
  
  ALTER TABLE companies
  CHANGE COLUMN company_name company_name varchar(255) NOT NULL;
SELECT * FROM companies;