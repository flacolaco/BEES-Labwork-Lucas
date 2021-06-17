# Get release years
 
 SELECT release_year
 FROM film;
 
 # Get all films with ARMAGEDDON in the title.
 
 SELECT title
 FROM film
 WHERE title like '%ARMAGEDDON%';
 
 # Get all films which title ends with APOLLO.
 
 SELECT title
 FROM film
 WHERE title like '%APOLLO';
 
# Get the 10 longest films.

SELECT title
FROM film
ORDER BY length DESC
LIMIT 10;

# How many films include Behind the Scenes content?

SELECT COUNT(DISTINCT(film_id))
FROM film
WHERE special_features like '%Behind the Scenes%';

# Drop column picture from staff.

ALTER TABLE staff
DROP picture;

# A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

# firts i look for Tammy in the customer table to see if there is any data that can help me when fill in the staff table.
SELECT *
FROM customer 
WHERE first_name = 'TAMMY' and last_name = 'SANDERS';

# Now, i will use the insert statement stored inside the staff table

INSERT INTO `sakila`.`staff`
(`staff_id`,
`first_name`,
`last_name`,
`address_id`,
`email`,
`store_id`,
`active`,
`username`)
VALUES
(3,
'TAMMY',
'SANDERS',
4,
'Tammy.Sanders@sakilastaff.com',
2,
1,
'Tammy');

# Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table

# first i will look for the different ID´s in different columns:

select film_id
from film
where title = 'Academy Dinosaur';
# film_id = 1

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# customer_id = 130

SELECT inventory_id
FROM inventory
where film_id = 1;
# do i need to do table joins to find the inventory_id?

SELECT *
FROM staff;
# staff_id = 1

# I would then insert the ID values into the staff table (to note that i am missing inventory id and that rental_id should be automatically generated)

INSERT INTO rental(rental_date, inventory_id, customer_id, staff_id)
VALUES (curdate(), 1, 130, 1);

# Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

# Check if there are any non-active users

SELECT *
FROM customer;

SELECT *
FROM customer
WHERE active = 0;

# Create a table backup table as suggested: (first i will check data types from existing customer table for the requested columns)

CREATE TABLE `customer` (
  `customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  KEY `idx_last_name` (`last_name`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

# Now I create my new table, "deleted_users" with the new column "deletion_date"

CREATE TABLE `deleted_users`(
`customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
`email` varchar(50) DEFAULT NULL,
`deletion_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`customer_id`)
);

# Insert the non active users in the table backup table

INSERT INTO deleted_users(customer_id, email)
SELECT customer_id, email
FROM customer
WHERE active = 0;

# Delete the non active users from the table customer

DELETE 
FROM customer 
WHERE active = 0;