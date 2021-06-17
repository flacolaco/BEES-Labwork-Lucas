# Using the tables address and staff and the JOIN command, display the first names, last names
# and address of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

# Using the tables staff and payment and the JOIN command, display the total payment amount
# by staff member in August of 2005.

SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) as total_payment
FROM staff s
JOIN payment p
ON p.staff_id = s.staff_id
WHERE p.payment_date like '%2005-08%'
GROUP BY staff_id
ORDER BY staff_id;

# Using the tables film and film_actor and the JOIN command, list each film and the number of actors 
# who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) AS total_actors
FROM film f
JOIN film_actor fa
ON fa.film_id = f.film_id
GROUP BY f.title;

# Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
# Order the customers by last name and alphabetically.

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;