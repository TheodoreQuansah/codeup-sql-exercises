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

-- ORDER BY EXERCISE
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT emp_no, first_name, last_name 
FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;
-- Irena Reutenauer.
-- Vidya Simmen.

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name
FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;
-- Irena Acton, Vidya Zweizig.

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name
FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC; 
-- Irena Acton, Maya Zyda.

Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT DISTINCT *
FROM employees WHERE last_name LIKE 'e%e'
ORDER BY emp_no ASC;
-- 899, 10021-Erde Ramzi. 499648-Erde Tadahiro.

Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT DISTINCT *
FROM employees WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- 899, Teiji Eldridge, Sergi Erde.

Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT *
FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC, hire_date DESC;
-- 362, Khun Bernini, Douadi Pettis.


-- FUNCTIONS EXERCISE

Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT (first_name,' ', last_name) AS full_name FROM employees
WHERE last_name LIKE 'e%e';

Convert the names produced in your last query to all uppercase.
SELECT CONCAT (UPPER(first_name),' ', UPPER(last_name)) AS full_name FROM employees
WHERE last_name LIKE 'e%e';

Use a function to determine how many results were returned from your previous query.
SELECT COUNT(*) AS result_count
FROM employees
WHERE last_name LIKE 'e%e'

Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT *, DATEDIFF(CURDATE(), hire_date) AS daysworked
FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

Find the smallest and largest current salary from the salaries table.
SELECT MIN(salary), MAX(salary) from salaries;

Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
SELECT first_name, last_name, birth_date, 
CONCAT (SUBSTR(LOWER(first_name), 1, 1), 
SUBSTR(LOWER(last_name), 1, 4)
,'_', SUBSTR(REPLACE(birth_date, '-', ''), 5,2), 
SUBSTR(REPLACE(birth_date, '-', ''), 3,2)) 
AS username FROM employees LIMIT 10;
