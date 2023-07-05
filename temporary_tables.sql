-- Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
USE somerville_2278;
CREATE TEMPORARY TABLE employees_with_departments( SELECT first_name, last_name, dept_name
FROM employees.employees JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no));

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE employees_with_departments ADD column full_name varchar(50);

-- Update the table so that the full_name column contains the correct data.
UPDATE employees_with_departments 
SET 
    full_name = CONCAT(first_name,
		' ', 
        last_name);
            
-- Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN last_name, DROP COLUMN first_name;

-- What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE temp_employees_with_departments( SELECT CONCAT(first_name, ' ', last_name), dept_name
FROM employees.employees JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no));

-- Create a temporary table based on the payment table from the sakila database.
CREATE TEMPORARY TABLE sakila_theo(SELECT * FROM sakila.payment);

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.


            

           

