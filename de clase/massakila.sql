/*1. Actores que tienen de primer nombre ‘Scarlett’.*/

SELECT *
FROM actor
WHERE first_name = "Scarlett";

/*2. Actores que tienen de apellido ‘Johansson’.*/

SELECT *
FROM actor
WHERE last_name = "Johansson";

/*3. Actores que contengan una ‘O’ en su nombre.*/

SELECT *
FROM actor
WHERE first_name LIKE "%O%";

/*4. Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.*/

SELECT *
FROM actor
WHERE first_name LIKE "%O%" and last_name LIKE "%A%";

/*5. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.*/
SELECT *
FROM actor
WHERE first_name LIKE "%O%O%" and last_name LIKE "%A%";

/*6. Actores donde su tercera letra sea ‘B’.*/
SELECT *
FROM actor
WHERE first_name LIKE "__B%";

/*7. Ciudades que empiezan por ‘a’.*/

SELECT *
FROM city
WHERE city LIKE "A%";

/*8.Ciudades que acaban por ‘s’.*/
SELECT *
FROM city
WHERE city LIKE "%S";

/*9. Ciudades del country 61.*/

SELECT *
FROM city
WHERE country_id= 61;

/*10. Ciudades del country ‘Spain’.*/

SELECT *
FROM city
JOIN country ON city.country_id = country.country_id
WHERE country= "spain";

/*11. Ciudades con nombres compuestos.*/
SELECT *
FROM city
WHERE city LIKE "% %";

/*12. Películas con una duración entre 80 y 100.*/

SELECT *
FROM film
WHERE length between 80 and 100
order by length;

/*13. Peliculas con un rental_rate entre 1 y 3.*/

SELECT *
FROM film
WHERE rental_rate between 1 and 3
order by rental_rate;

/*14. Películas con un titulo de más de 12 letras.*/

SELECT title , length(title)
FROM film
WHERE length(title) > 12;

/*15. Peliculas con un rating de PG o G.*/

SELECT COUNT(title) as CANTIDAD_PELICULAS
FROM film
WHERE rating = "PG" or rating = "G";

/*16. Peliculas que no tengan un rating de NC-17.*/

SELECT *
FROM film
WHERE rating != "NC-17";

/*17. Peliculas con un rating PG y duracion de más de 120.*/
SELECT *
FROM film
WHERE rating = "PG" AND length >120;

/*18. ¿Cuantos actores hay?*/

SELECT count(*) AS Cantidad_Actores
FROM actor;


/*26. Mostrar el nombre de la película y el nombre de los actores.*/

SELECT film.title AS PELICULA, actor.first_name AS NOMBRE, actor.last_name AS APELLIDO
FROM film_actor
JOIN actor on actor.actor_id = film_actor.actor_id
JOIN film on film.film_id = film_actor.film_id
ORDER BY PELICULA;

SELECT film.title, actor.first_name, actor.last_name
FROM film, actor, film_actor
WHERE film.film_id = film_actor.film_id 
AND actor.actor_id = film_actor.actor_id
ORDER BY film.title;














