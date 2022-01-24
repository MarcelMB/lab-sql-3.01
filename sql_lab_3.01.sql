USE sakila;

-- 1. Drop column picture from staff

ALTER TABLE staff
  DROP COLUMN picture;
  
SELECT * FROM staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer

-- look at data about tammy that we have
SELECT * FROM customer
WHERE last_name='sanders';

INSERT INTO staff (first_name,last_name,address_id,email,store_id,username,last_update)
VALUES
('Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,'Tammy',now());

SELECT * FROM staff; -- check what happened

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.

Select * FROM rental; -- look what we need
-- we need inventory_id, cutsomer_id, staff_id

SELECT film_id FROM film
WHERE title='Academy Dinosaur';

-- get inventory Ids with film id and the store_id
SELECT inventory_id FROM inventory
WHERE film_id=1 AND store_id=1;

-- get customer_id
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';


INSERT INTO rental(rental_date,inventory_id,customer_id,staff_id,last_update)
VALUES
(now(),1,130,1,now());

Select * FROM rental; -- check last row if everything is added 

