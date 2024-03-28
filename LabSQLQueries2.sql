-- 1. Seleccionamos de la tabla actor los que tengan el first_name = a Scarlett

SELECT 
	*
FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- 2. Seleccionamos de la tabla actor los que tengan el apellido 'Johansson'

SELECT 
	*
FROM sakila.actor
WHERE last_name = 'JOHANSSON';

-- 3. Sacamos el title de las películas que tienen la variable return_date rellena, revisar

SELECT
	title
FROM film
WHERE film_id IN (SELECT 
	DISTINCT film_id
FROM sakila.inventory
WHERE inventory_id NOT IN (SELECT DISTINCT inventory_id FROM rental WHERE return_date IS NULL));

-- 4. Sacamos el title de las películas que tienen la variable rental_date con algún valor que no sea NULL
SELECT
	title
FROM film
WHERE film_id IN (SELECT 
	DISTINCT film_id
FROM sakila.inventory
WHERE inventory_id IN (SELECT DISTINCT inventory_id FROM rental WHERE rental_date IS NOT NULL));

-- 5. Sacamos el máximo y minimo valor de la variable rental_duration de la tabla film
SELECT 
    MAX(rental_duration) AS max_rental_duration,
    MIN(rental_duration) AS min_rental_duration
FROM 
    film;

-- 6. Sacamos el máximo y el mínimo valor de la variable length de la tabla film
SELECT 
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM 
    film;

-- 7. Sacamos el average de la variable length de la tabla film
SELECT AVG(length) AS promedio_length
FROM film;

-- 8. Transformamos 

SELECT 
    CONCAT(
        FLOOR(AVG(length) / 60), ' horas ',
        MOD(AVG(length), 60), ' minutos'
    ) AS promedio_length_formato_horas_minutos
FROM film;

-- 9. Sacamos el nº de películas con más o igual de 180 mins utilizando la variable length de la tabla film
SELECT
	*
FROM film
WHERE length >= 180;

-- 10 Sacamos el first_name, last_name y email de la tabla customer 
SELECT
	first_name, last_name, email
FROM customer;

-- 11 Sacamos el title de las películas que cumplen la subquery de que tengan el length máximo
SELECT 
	title
FROM film
WHERE length = (SELECT MAX(length) FROM film);