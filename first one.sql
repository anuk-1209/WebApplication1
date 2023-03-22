USE mavenmovies;

SELECT* FROM actor;
-- pull the list of the first name, last name, and email of each of our customers

SELECT first_name, last_name, email FROM mavenmovies.customer;

-- pull the records of films and see if there are any other rental durations
-- Rozumiem, że mamy tytuły, które wynajmujemy na okres 3, 5 lub 7 dni.
-- Czy mógłbyś wyciągnąć zapisy naszych filmów i sprawdzić, czy są jakieś inne okresy wypożyczenia

SELECT DISTINCT rental_duration
 FROM film;
 -- DISTINCT pokaże Ci wszystkie możliwe opcje w danej kolumnie
 
 -- I’d like to look at payment records for our long term customers to learn about their purchase patterns. Could you pull all payments fromour first 100 customers (based oncustomer ID)?”
SELECT customer_id, rental_id, amount, payment_date  FROM mavenmovies.payment WHERE customer_id< '101';

SELECT customer_id, rental_id, amount, payment_date FROM payment 
WHERE amount=0.99 AND payment_date>'2006-01-01';

-- “The payment data you gave me on our first 100 customers was great thank you! Now I’d love to see just payments over $5 for those same customers, since January 1, 2006 .”

SELECT customer_id, rental_id, amount, payment_date  FROM mavenmovies.payment 
WHERE customer_id< '101'AND payment_date > '2006-01-01' AND amount>'5';

-- “The data you shared previously on customers 42, 53, 60, and 75 was good to see. Now, could you please write a query to pull all payments from those specific customers along with payments over $5 , from any customer?”

SELECT customer_id, rental_id, amount, payment_date FROM payment WHERE amount>5
OR customer_id=42 OR customer_id=53 OR customer_id=60 OR customer_id=75;

SELECT title, description FROM film WHERE description LIKE '%Dentist%';

-- “We need to understand the special features in our films. Could you pull a list of films which include a Behind the Scenes special feature?”

SELECT title, special_features, description FROM film WHERE special_features LIKE '%Behind the Scenes%';
 
 -- “I need to get a quick overview of how long our movies tend to be rented out for. Could you please pull a count of titles sliced by rental duration ?”

SELECT rental_duration, COUNT(film_id) AS film_rental_duration 
FROM mavenmovies.film GROUP BY rental_duration;

-- “I’m wondering if we charge more for a rental when the replacement cost is higher. Can you help me pull a count of films , along with the average , min , and max rental rate , grouped by replacement cost

SELECT replacement_cost, COUNT(film_id) AS ilosc_filmow , MIN(rental_rate) AS cheapest_rental, MAX(rental_rate) AS most_exp_rental, AVG(rental_rate) 
FROM mavenmovies.film GROUP BY replacement_cost;

-- “I’d like to talk to customers that have not rented much from us to understand if there is something we could be doing better. Could you pull a list of customer_ids with less than 15 rentals all time?”
SELECT customer_id, tot  FROM rental HAVING COUNT(c