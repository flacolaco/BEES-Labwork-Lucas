# 2.Selecting all columns from a few different tables:

SELECT *
FROM address;

SELECT *
FROM actor;

SELECT *
FROM category;

# 3.Select one column from a table. Get film titles. Showing top 1,000 distinct movie titles

SELECT DISTINCT title
FROM film;

# 4.Select one column from a table and alias it. Get unique list of film languages under the alias language.

SELECT DISTINCT name as language
FROM language;

# 5.1 Find out how many stores does the company have?

SELECT COUNT(DISTINCT(store_id))
FROM store;

# 5.2 Find out how many employees staff does the company have?

SELECT COUNT(DISTINCT(staff_id))
FROM staff;

# 5.3 Return a list of employee first names only?

SELECT first_name
FROM staff;

