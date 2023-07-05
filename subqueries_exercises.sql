USE employees;

-- Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT 
    *
FROM
    dept_emp
WHERE
    from_date LIKE (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no LIKE '101010')
        AND to_date > CURDATE();

-- Find all the titles ever held by all current employees with the first name Aamod.
SELECT DISTINCT
    (title)
FROM
    titles
        JOIN
    employees ON employees.emp_no = titles.emp_no
WHERE
    employees.emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            first_name LIKE 'Aamod')
        AND to_date > CURDATE()
;

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT 
    COUNT(emp_no)
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            to_date > CURDATE());
-- 59900

SELECT 
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS female_managers,
    gender
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            to_date > CURDATE())
        AND gender LIKE 'F';
-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil.

SELECT 
    COUNT(*)
FROM
    employees
        JOIN
    salaries ON salaries.emp_no = employees.emp_no
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            salaries)
        AND salaries.to_date > CURDATE()
ORDER BY salary ASC;

-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary > (SELECT 
            (MAX(salary) - STDDEV(salary))
        FROM
            salaries
        WHERE
            to_date > CURDATE())
        AND to_date > CURDATE();

SELECT 
    ((SELECT 
            COUNT(salary)
        FROM
            salaries
        WHERE
            salary > (SELECT 
                    (MAX(salary) - STDDEV(salary))
                FROM
                    salaries
                WHERE
                    to_date > CURDATE())
                AND to_date > CURDATE()) / (SELECT 
            COUNT(salary)
        FROM
            salaries
        WHERE
            to_date > CURDATE())) * 100 AS perc_of_sal;






