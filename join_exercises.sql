-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;
SHOW TABLES;

SELECT 
    *
FROM
    roles,
    users;

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT 
    *
FROM
    users
        JOIN
    roles ON users.role_id = roles.id;

SELECT 
    *
FROM
    users
        LEFT JOIN
    roles ON users.role_id = roles.id;

SELECT 
    *
FROM
    users
        RIGHT JOIN
    roles ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT 
    COUNT(users.name), roles.name
FROM
    users
        JOIN
    roles ON users.role_id = roles.id
GROUP BY roles.name , users.role_id;

-- Use the employees database.
USE employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT 
    dept_name,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS Department_manager
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
WHERE
    to_date = '9999-01-01'
ORDER BY dept_name ASC;

-- Find the name of all departments currently managed by women.
SELECT 
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS full_name,
    departments.dept_name
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    titles ON titles.emp_no = employees.emp_no
WHERE
    title LIKE '%manager%'
        AND dept_manager.to_date = '9999-01-01'
        AND gender = 'F'
ORDER BY dept_name;

-- Find the current titles of employees currently working in the Customer Service department.
SELECT 
    COUNT(*), titles.title
FROM
    employees
        JOIN
    dept_emp ON dept_emp.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_emp.dept_no
        JOIN
    titles ON titles.emp_no = employees.emp_no
WHERE
    dept_name LIKE '%customer service%'
        AND dept_emp.to_date = '9999-01-01'
        AND titles.to_date = '9999-01-01'
GROUP BY title
ORDER BY title;

-- Find the current salary of all current managers.
SELECT 
    dept_name,
    salary,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS Department_manager
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    salaries ON salaries.emp_no = dept_manager.emp_no
WHERE
    salaries.to_date = '9999-01-01'
        AND dept_manager.to_date = '9999-01-01'
ORDER BY dept_name ASC;

-- Find the number of current employees in each department.
SELECT 
    dept_emp.dept_no,
    COUNT(employees.emp_no) AS num_of_emp,
    dept_name
FROM
    employees
        JOIN
    dept_emp ON dept_emp.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_emp.to_date = '9999-01-01'
        AND dept_emp.to_date = '9999-01-01'
GROUP BY dept_name , dept_emp.dept_no
ORDER BY dept_emp.dept_no ASC;

-- Which department has the highest average salary? Hint: Use current not historic information.*
SELECT 
    dept_name, AVG(salaries.salary) AS avg_salary
FROM
    employees
        JOIN
    dept_emp ON dept_emp.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_emp.dept_no
        JOIN
    salaries ON salaries.emp_no = dept_emp.emp_no
        JOIN
    dept_manager ON dept_manager.to_date = salaries.to_date
WHERE
    dept_emp.to_date >= '2023-06-30'
        AND salaries.to_date >= '2023-06-30'
GROUP BY dept_name
ORDER BY avg_salary DESC
LIMIT 1;

-- Who is the highest paid employee in the Marketing department?
SELECT 
    MAX(salaries.salary) AS max_salary, first_name, last_name
FROM
    employees
        JOIN
    dept_emp ON dept_emp.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_emp.dept_no
        JOIN
    salaries ON salaries.emp_no = dept_emp.emp_no
WHERE
    departments.dept_name = 'marketing'
        AND dept_emp.to_date >= '2023-06-29'
        AND salaries.to_date >= '2023-06-29'
GROUP BY first_name , last_name
ORDER BY max_salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?
SELECT 
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS Department_manager,
    salary,
    dept_name
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    salaries ON salaries.emp_no = dept_manager.emp_no
WHERE
    salaries.to_date = '9999-01-01'
        AND dept_manager.to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 1;

-- Determine the average salary for each department. Use all salary information and round your results.
SELECT 
    ROUND(AVG(salaries.salary)) AS avg_salary, dept_name
FROM
    employees
        JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
        JOIN
    salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY dept_name
ORDER BY avg_salary DESC;