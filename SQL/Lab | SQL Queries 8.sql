# we want to rank the clients on the amount borrowed in each district (biggest =1)
#hint: use your clients_loans view

select *, 
rank() over (partition by district_id order by amount desc) as ranking
from clients_loans
order by district_id;

# Use the RANK() and the table of your choice, rank films by length 
# (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.

SELECT title, length, RANK() OVER (ORDER BY length DESC) as 'rank'
FROM film
WHERE length IS NOT NULL AND length <> 0
ORDER BY title;

# Build on top of the previous query and rank films by length within the rating category 
#(filter out the rows that have nulls or 0s in length column). 
# In your output, only select the columns title, length, rating and the rank.

SELECT title, length, rating, RANK() OVER (PARTITION BY rating ORDER BY length DESC) as 'rank'
FROM film
WHERE length IS NOT NULL AND length <> 0
ORDER BY rating;

# How many films are there for each of the categories? 
# Inspect the database structure and use appropriate join to write this query.

SELECT c.name AS  category, COUNT(f.film_id) AS number_of_films
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id
GROUP BY category;

# Which actor has appeared in the most films?

SELECT a.first_name, a.last_name, COUNT(a.actor_id) AS most_appearances
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY most_appearances DESC
LIMIT 1;

# Most active customer (the customer that has rented the most number of films)

SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_movies_rented
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY total_movies_rented DESC
LIMIT 1;

# Bonus: Which is the most rented film? The answer is Bucket Brotherhood 
# This query might require using more than one join statement. Give it a try. 
# We will talk about queries with multiple join statements later in the lessons.

SELECT f.title, COUNT(r.rental_id) AS times_rented
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC
LIMIT 1;