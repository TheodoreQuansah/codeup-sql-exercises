-- List all the databases
SHOW DATABASES;
-- Write the SQL code necessary to use the albums_db database
USE albums_db;
-- Show the currently selected database
SELECT database();
-- List all tables in the database
SHOW TABLES;
-- Write the SQL code to switch the employees database
USE employees;
-- Show the currently selected database
SELECT database();
-- List all the tables in the database
SHOW TABLES;
-- Explore the employees table. What different data types are present on this table?
-- INT/number,DATE/number,VARCHAR/string,VARCHAR/string,eum/character,DATE/number.
-- Which table(s) do you think contain a numeric type column?
-- DEPT_EMP,DEPT_MANAGER,EMPLOYEES,TITLES,SALARIES.
-- Which table(s) do you think contain a string type column? 
-- DEPARTMENTS,DEPT_EMP,DEPT_MANAGER,EMPLOYEES,TITLES,.
-- Which table(s) do you think contain a date type column? 
-- DEPT_EMP,DEPT_MANAGER,EMPLOYEES,TITLES,SALARIES.
-- What is the relationship between the employees and the departments tables?
-- There is no direct relationship
-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;