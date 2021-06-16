# Which are the actors whose last names are not repeated?

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

# Which last names appear more than once?

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

# Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;

# Using the film table, find out how many films were released each year.

SELECT release_year, COUNT(film_id)
FROM film
GROUP BY release_year;

# Using the film table, find out for each rating how many films were there.

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

# What is the average length of films for each rating? Round off the average lengths to two decimal places.

SELECT rating, ROUND(AVG(length), 2) AS AVG_Duration
FROM film
GROUP BY rating;

# Which kind of movies (based on rating) have an average duration of two hours or more?

SELECT rating, ROUND(AVG(length), 2) AS AVG_Duration
FROM film
GROUP BY rating
HAVING AVG_Duration > 120.00;