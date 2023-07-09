-- SELECT statements
USE sakila;

-- Select all columns from the actor table.
SELECT 
    *
FROM
    actor;

-- Select only the last_name column from the actor table.
SELECT 
    last_name
FROM
    actor;

-- Select only the film_id, title, and release_year columns from the film table.
SELECT 
    film_id, title, release_year
FROM
    film;

-- DISTINCT operator
-- Select all distinct (different) last names from the actor table.
SELECT DISTINCT
    last_name
FROM
    actor;

-- Select all distinct (different) postal codes from the address table.
SELECT DISTINCT
    postal_code
FROM
    address;

-- Select all distinct (different) ratings from the film table.
SELECT DISTINCT
    rating
FROM
    film;

-- WHERE clause
-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.


SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    payment_date >= '2005-05-27 %';

-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    payment_date LIKE '2005-05-27 %';

-- Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
SELECT 
    *
FROM
    customer
WHERE
    last_name LIKE ('sa%')
        AND first_name LIKE ('%n');

-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT 
    *
FROM
    customer
WHERE
    last_update NOT LIKE CURDATE()
        OR last_name LIKE ('m%');

-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
SELECT 
    *
FROM
    category
WHERE
    category_id > 4 AND name LIKE ('c%')
        OR ('s%')
        OR ('t%');

-- Select all columns minus the password column from the staff table for rows that contain a password.
SELECT 
    staff_id,
    first_name,
    last_name,
    address_id,
    picture,
    email,
    store_id,
    active,
    username,
    last_update
FROM
    staff
WHERE
    password IS NOT NULL;


-- Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT 
    staff_id,
    first_name,
    last_name,
    address_id,
    picture,
    email,
    store_id,
    active,
    username,
    last_update
FROM
    staff
WHERE
    password IS NULL;

-- IN operator
-- Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
SELECT 
    phone, district
FROM
    address
WHERE
    district IN ('California' , 'England', 'Taipei', 'West Java');

-- Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    payment_date LIKE '2005-05-25 %'
        OR '2005-05-27 %'
        OR '2005-05-29 %';


-- Select all columns from the film table for films rated G, PG-13 or NC-17.
SELECT 
    *
FROM
    film
WHERE
    rating IN ('G' , 'PG-13', 'NC-17');

-- BETWEEN operator
-- Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
SELECT 
    *
FROM
    payment
WHERE
    payment_date BETWEEN '2005-05-25 %' AND '2005-05-26 23:59:59';

-- Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120.
SELECT 
    film_id, title, description
FROM
    film
WHERE
    length BETWEEN '100' AND '120';

-- LIKE operator
-- Select the following columns from the film table for rows where the description begins with "A Thoughtful".
SELECT 
    description
FROM
    film
WHERE
    description LIKE ('A Thoughtful%');

-- Select the following columns from the film table for rows where the description ends with the word "Boat".
SELECT 
    description
FROM
    film
WHERE
    description LIKE ('%Boat');

-- Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
SELECT 
    description, length
FROM
    film
WHERE
    description LIKE ('%Database%')
        AND length > (3 * 60);

-- LIMIT Operator
-- Select all columns from the payment table and only include the first 20 rows.
SELECT 
    *
FROM
    payment
LIMIT 20;

-- Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.
SELECT 
    payment_date, amount
FROM
    payment
WHERE
    amount > 5
LIMIT 1001 OFFSET 999;

-- Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
SELECT 
    *
FROM
    customer
LIMIT 99 OFFSET 100;

-- ORDER BY statement
-- Select all columns from the film table and order rows by the length field in ascending order.
SELECT 
    *
FROM
    film
ORDER BY length ASC;

-- Select all distinct ratings from the film table ordered by rating in descending order.
SELECT DISTINCT
    rating
FROM
    film
ORDER BY rating DESC;

-- Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
SELECT 
    payment_date, amount
FROM
    payment
ORDER BY amount DESC
LIMIT 20;

-- Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
SELECT 
    title,
    description,
    special_features,
    length,
    rental_duration
FROM
    film
WHERE
    length < (2 * 60)
        AND rental_duration BETWEEN 5 AND 7
ORDER BY length DESC
LIMIT 10;

-- JOINs
-- Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 620
SELECT 
    customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name
FROM
    customer
        LEFT JOIN
    actor ON customer.last_name = actor.last_name;

-- Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200
SELECT 
    customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name
FROM
    customer
        RIGHT JOIN
    actor ON customer.last_name = actor.last_name;

-- Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43
SELECT 
    customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name
FROM
    customer
        INNER JOIN
    actor ON customer.last_name = actor.last_name;

-- Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
-- Returns correct records: 600
SELECT 
    city, country
FROM
    city
        LEFT JOIN
    country ON city.country_id = country.country_id;

-- Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
SELECT 
    title, description, release_year, name
FROM
    film
        LEFT JOIN
    language ON film.language_id = language.language_id;

-- Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2
SELECT 
    first_name,
    last_name,
    address,
    address2,
    city,
    district,
    postal_code
FROM
    staff
        LEFT JOIN
    address ON staff.address_id = address.address_id
        LEFT JOIN
    city ON address.city_id = city.city_id;

-- Display the first and last names in all lowercase of all the actors.
SELECT 
    LOWER(first_name), LOWER(last_name)
FROM
    actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    first_name = 'joe';

-- Find all actors whose last name contain the letters "gen":
SELECT 
    *
FROM
    actor
WHERE
    last_name LIKE '%gen%';

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
SELECT 
    *
FROM
    actor
WHERE
    last_name LIKE '%li%'
ORDER BY last_name , first_name;

-- Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
SELECT 
    *
FROM
    country
WHERE
    country IN ('Afghanistan' , 'Bangladesh', 'China');

-- List the last names of all the actors, as well as how many actors have that last name.
SELECT 
    last_name, COUNT(last_name)
FROM
    actor
GROUP BY last_name;


-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT 
    COUNT(last_name) AS cou
FROM
    actor
GROUP BY last_name
HAVING cou > 2;

-- Use JOIN to display the first and last names, as well as the address, of each staff member.
SELECT 
    first_name, last_name, address
FROM
    staff
        LEFT JOIN
    address ON staff.address_id = address.address_id;

-- Use JOIN to display the total amount rung up by each staff member in August of 2005.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    amount,
    payment_date
FROM
    staff
        LEFT JOIN
    payment ON staff.staff_id = payment.staff_id
WHERE
    payment_date LIKE '2005-08-%'
GROUP BY full_name , amount , payment_date;

-- List each film and the number of actors who are listed for that film.
SELECT 
    title, COUNT(actor_id)
FROM
    film
        LEFT JOIN
    film_actor ON film.film_id = film_actor.film_id
GROUP BY title;

-- How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT 
    title, COUNT(inventory.film_id)
FROM
    inventory
        LEFT JOIN
    film ON inventory.film_id = film.film_id
GROUP BY title
HAVING title LIKE 'HUNCHBACK IMPOSSIBLE';

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT 
    title, language.name
FROM
    film
        JOIN
    language ON film.language_id = language.language_id
HAVING language.name LIKE 'english'
    AND title LIKE 'K%'
    OR title LIKE 'Q%';

-- Use subqueries to display all actors who appear in the film Alone Trip.
SELECT 
    CONCAT(first_name, ' ', last_name), title
FROM
    actor
        LEFT JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
        LEFT JOIN
    film ON film_actor.film_id = film.film_id
GROUP BY title , first_name , last_name
HAVING title LIKE 'Alone Trip';

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
SELECT 
    CONCAT(first_name, ' ', last_name), email
FROM
    customer
        LEFT JOIN
    address ON customer.address_id = address.address_id
        LEFT JOIN
    city ON address.city_id = city.city_id
        LEFT JOIN
    country ON city.country_id = country.country_id
WHERE
    country LIKE 'canada';

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
SELECT 
    title
FROM
    film
        LEFT JOIN
    film_category ON film.film_id = film_category.film_id
        LEFT JOIN
    category ON film_category.category_id = category.category_id
WHERE
    name LIKE 'family';

-- Write a query to display how much business, in dollars, each store brought in.
SELECT 
    store.store_id,
    CONCAT('$', COUNT(amount), '.00') AS dollar_amount
FROM
    store
        LEFT JOIN
    customer ON store.store_id = customer.store_id
        LEFT JOIN
    payment ON customer.customer_id = payment.customer_id
GROUP BY store.store_id;

-- Write a query to display for each store its store ID, city, and country.
SELECT 
    store.store_id, city, country
FROM
    store
        LEFT JOIN
    address ON store.address_id = address.address_id
        LEFT JOIN
    city ON address.city_id = city.city_id
        LEFT JOIN
    country ON city.country_id = country.country_id;

-- List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
SELECT 
    category.name AS genre,
    CONCAT('$', COUNT(amount), '.00') AS gross_revenue
FROM
    category
        LEFT JOIN
    film_category ON category.category_id = film_category.category_id
        LEFT JOIN
    inventory ON film_category.film_id = inventory.film_id
        LEFT JOIN
    rental ON inventory.inventory_id = rental.inventory_id
        LEFT JOIN
    payment ON rental.customer_id = payment.customer_id
GROUP BY category.name
ORDER BY gross_revenue DESC
LIMIT 5;







