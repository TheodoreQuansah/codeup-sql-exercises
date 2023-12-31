-- List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT
    last_name
FROM
    employees
ORDER BY last_name DESC
LIMIT 10;
-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche ,Zongker

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25'
ORDER BY hire_date ASC
LIMIT 5;
-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup.

-- Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25'
ORDER BY hire_date ASC
LIMIT 5 OFFSET 45;
-- OFFSET = (LIMIT * PAGE#) - LIMIT
