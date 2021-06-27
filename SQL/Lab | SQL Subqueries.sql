# How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT COUNT(inventory_id) as total_copies
FROM inventory
WHERE film_id =
(
SELECT film_id
FROM film
WHERE title = 'Hunchback Impossible'
);

# List all films whose length is longer than the average of all the films.

SELECT ROUND(AVG(length)) as avglength
FROM film;

SELECT title, length
FROM film
WHERE length >
(
SELECT ROUND(AVG(length)) as avglength
FROM film
)
ORDER BY length;

# Use subqueries to display all actors who appear in the film Alone Trip.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
SELECT actor_id
FROM film_actor
WHERE film_id =
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));

# Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
# Identify all movies categorized as family films.

SELECT title
FROM film
WHERE film_id IN
(
SELECT film_id
FROM film_category
WHERE category_id =
(
SELECT category_id
FROM category
WHERE name = 'Family'
));

# Get name and email from customers from Canada using subqueries. 
# Do the same with joins. Note that to create a join, you will have to identify the correct tables with 
# their primary keys and foreign keys, that will help you get the relevant information.

SELECT CONCAT(first_name, ' ', last_name) AS customer_name, email
FROM customer
WHERE address_id IN
(
SELECT address_id
FROM address
WHERE city_id IN
(
SELECT city_id
FROM city
WHERE country_id IN
(
SELECT country_id
FROM country
WHERE country = 'CANADA'
)));

# Which are films starred by the most prolific actor? Most prolific actor is defined as the actor 
# that has acted in the most number of films. First you will have to find the most prolific actor 
# and then use that actor_id to find the different films that he/she starred.

SELECT CONCAT(first_name, ' ', last_name) as actor_name , title
FROM actor
JOIN film_actor
USING (actor_id)
JOIN film
USING (film_id)
WHERE actor_id =
(
SELECT actor_id
FROM actor
JOIN film_actor
USING (actor_id)
JOIN film
USING (film_id)
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1)
ORDER BY actor_name;

# Films rented by most profitable customer. You can use the customer table and payment table to find 
# the most profitable customer ie the customer that has made the largest sum of payments.

SELECT film_id, title, amount
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
WHERE rental.customer_id =
(
SELECT customer_id
FROM customer
JOIN payment USING (customer_id)
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1
)
ORDER BY rental_date DESC;

# Customers who spent more than the average payments.

SELECT DISTINCT(CONCAT(first_name, ' ', last_name)) as customer_name, amount
FROM customer
JOIN payment USING (customer_id)
WHERE amount >
(
SELECT ROUND(AVG(amount),2)
FROM payment)
ORDER BY amount DESC;

SELECT customer_id, SUM(amount) AS payment
FROM customer
JOIN payment USING (customer_id)
GROUP BY customer_id
HAVING SUM(amount) >
(
SELECT AVG(total_payment)
FROM 
(
SELECT customer_id, SUM(amount) total_payment
FROM payment
GROUP BY customer_id) t)
ORDER BY payment DESC;