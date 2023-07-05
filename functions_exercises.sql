-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT 
    emp_no, first_name, last_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');
-- '10200''10397''10610'

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya';
-- '10200','10397','10610'.

SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya' AND gender = 'm');
-- '10200','10397''10821'

SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE 'e%';

-- Find all unique last names that start or end with 'E'.
SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%e' OR 'e%';

-- Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND LAST_name NOT LIKE 'e%';

-- Find all unique last names that start and end with 'E'.
SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'e%';

-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%';
-- '10008', '10011', '10012'

SELECT 
    last_name, first_name, emp_no
FROM
    employees
WHERE
    birth_date LIKE '%12-25';
-- '10078', '10115', '10261'.

SELECT 
    last_name, first_name, emp_no
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '1999-12-31'
        AND birth_date LIKE '%12-25';
-- '10261', '10438', '10681'.

SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%';

-- Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';

-- ORDER BY EXERCISE
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT 
    emp_no, first_name, last_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name ASC;
-- Irena Reutenauer.
-- Vidya Simmen.

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name ASC , last_name ASC;
-- Irena Acton, Vidya Zweizig.

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY last_name ASC , first_name ASC;
-- Irena Acton, Maya Zyda.

SELECT DISTINCT
    *
FROM
    employees
WHERE
    last_name LIKE 'e%e'
ORDER BY emp_no ASC;
-- 899, 10021-Erde Ramzi. 499648-Erde Tadahiro.

SELECT DISTINCT
    *
FROM
    employees
WHERE
    last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- 899, Teiji Eldridge, Sergi Erde.

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC , hire_date DESC;
-- 362, Khun Bernini, Douadi Pettis.


SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'e%e';

-- Convert the names produced in your last query to all uppercase.
SELECT 
    CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'e%e';

-- Use a function to determine how many results were returned from your previous query.
SELECT COUNT(*) AS result_count
FROM employees
WHERE last_name LIKE 'e%e'

-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT *, DATEDIFF(CURDATE(), hire_date) AS daysworked
FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- Find the smallest and largest current salary from the salaries table.
SELECT 
    MIN(salary), MAX(salary)
FROM
    salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
SELECT 
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) AS user_name
FROM
    employees
GROUP BY user_name
