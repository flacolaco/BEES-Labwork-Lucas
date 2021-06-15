# Select all the actors with the first name ‘Scarlett’.

Select *
from actor
where first_name = 'Scarlett';

# How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(DISTINCT(inventory_id))
FROM inventory;

SELECT COUNT(DISTINCT(rental_id))
FROM rental;

# What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MAX(length) as max_duration, MIN(length) as min_duration
FROM film;

# What's the average movie duration expressed in format (hours, minutes)?

SELECT sec_to_time(avg(length)*60) as average_duration 
FROM film;

# How many distinct (different) actors' last names are there?
 
SELECT COUNT(DISTINCT(last_name))
FROM actor;
  
# Since how many days has the company been operating (check DATEDIFF() function)?

SELECT min(rental_date) as ‘company_start’, max(rental_date) as ‘company_end’, DATEDIFF("2006-06-14","2005-05-24") as number_of_days
FROM rental;

# Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(convert(substring_index(rental_date, ' ', 1), date), '%M') as rental_month, date_format(convert(substring_index(rental_date, ' ', 1), date), '%W') as rental_weekday
FROM rental
LIMIT 20;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, monthname(rental_date) AS month, weekday(rental_date) as weekday,
CASE
WHEN (weekday(rental_date) in (5,6)) then 'weekend'
ELSE 'workday'
END AS day_type
FROM rental;

# How many rentals were in the last month of activity?

SELECT COUNT(rental_id) as rentals_last_month
FROM rental 
WHERE month(rental_date) = (select month(max(rental_date)) from rental);