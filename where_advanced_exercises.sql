Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT emp_no, first_name, last_name 
FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya'); 
-- '10200''10397''10610'

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
SELECT * 
FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- '10200','10397','10610'.

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results.
SELECT * 
FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' AND gender = 'm');
-- '10200','10397''10821'

Find all unique last names that start with 'E'.
SELECT last_name 
FROM employees WHERE last_name LIKE 'e%'; 

Find all unique last names that start or end with 'E'.
SELECT DISTINCT last_name 
FROM employees WHERE last_name LIKE '%e' OR 'e%';

Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name 
FROM employees WHERE last_name LIKE '%e' AND LAST_name NOT LIKE 'e%';

Find all unique last names that start and end with 'E'.
SELECT DISTINCT last_name 
FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%';

Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT *
FROM employees WHERE hire_date LIKE '199%';
-- '10008', '10011', '10012'

Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
SELECT last_name, first_name, emp_no 
FROM employees WHERE birth_date LIKE '%12-25'; 
-- '10078', '10115', '10261'.

Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
SELECT last_name, first_name, emp_no 
FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%12-25'; 
-- '10261', '10438', '10681'.

Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name 
FROM employees WHERE last_name LIKE '%q%';

Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT last_name 
FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';