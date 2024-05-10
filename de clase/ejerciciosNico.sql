/*A. Ejercicios Select “simples”*/
/*base de datos sakila*/
/*1. Obtener el nombre y apellido de los primeros 5 actores disponibles, utilizar aliases para mostrar los
nombres de las columnas en español.*/
SELECT first_name AS Nombre,last_name AS Apellido
FROM actor
limit 5;

/*2. Obtener un listado que incluya nombre, apellido y correo electrónico de los clientes (customers)
INACTIVOS, utilizar aliases para mostrar los nombres de las columnas en español.*/
SELECT first_name AS Nombre, last_name AS Apellido, email
FROM customer
WHERE active = 0;

/*3. Obtener un listado de films incluyendo título, año y descripción de los films que tienen un
rental_duration mayor a cinco. Ordenar por rental_duration de mayor a menor y utilizar aliases para
mostrar los nombres de las columnas en español*/
SELECT title AS Titulo, release_year AS Anio, description, rental_duration AS Alquiler 
FROM film
WHERE rental_duration > 5
ORDER BY Alquiler asc;

/*4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de Mayo de 2005, incluir en el
resultado todas las columnas disponibles.*/
SELECT *
FROM rental
WHERE MONTH(rental_date) = 5 AND YEAR(rental_date) = 2005;

/*B. Ejercicios Select Con Agregación*/
/*5. Obtener la cantidad TOTAL de alquileres (rentals), utilizar un alias para mostrarlo en una columna llamada “cantidad”*/
SELECT count(rental_id) AS Alquileres
FROM rental;

/*6. Obtener la suma TOTAL de todos los pagos (payments), utilizar un alias para mostrarlo en una columna llamada
“total”, una columna con la cantidad de alquileres con el alias “Cantidad”, y una columna que indique el “Importe
promedio” por alquiler.*/
SELECT sum(amount) AS Total_pagos,count(rental_id) AS Cantidad_Alquileres, avg(amount) AS Importe_Promedio 
FROM payment;


/*7. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuantos
alquileres lo hacen?*/
SELECT customer.customer_id AS N°_Cliente, customer.first_name AS Nombre, customer.last_name AS Apellido, COUNT(payment.rental_id) AS Cantidad_Alquileres, SUM(payment.amount) AS Monto_Total
FROM customer 
JOIN payment  ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id,customer.first_name, customer.last_name
ORDER BY Monto_Total desc
limit 10;

/*8. Generar un reporte que indique: id de cliente, cantidad de alquileres y monto total para todos los clientes que hayan
gastado más de 150 dólares en alquileres*/
SELECT customer.customer_id AS ID_Cliente, COUNT(payment.rental_id) AS Cantidad_Alquileres, SUM(payment.amount) AS Monto_Total
FROM customer 
JOIN payment  ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING Monto_Total > 150
ORDER BY Monto_Total asc;

/*9. Generar un reporte que responda a la pregunta: ¿cómo se distribuyen la cantidad y el monto total de alquileres en los
meses pertenecientes al año 2005? (tabla payment)*/
SELECT MONTH(payment_date) AS Mes, COUNT(rental_id) AS Cantidad_Alquileres, SUM(amount) AS Monto_Total
FROM payment
WHERE YEAR(payment_date) = 2005
GROUP BY MONTH(payment_date)
ORDER BY Mes;

/*10. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? (columna inventory_id
en la tabla rental) para cada una de ellas indicar la cantidad de alquileres*/
SELECT inventory_id, COUNT(*) AS Cantidad_Alquileres
FROM rental
GROUP BY inventory_id
ORDER BY Cantidad_Alquileres DESC
LIMIT 5;

/*C. Ejercicios JOIN y GROUP BY*/
/*11. Repetir los ejercicios anteriores del 7 al 10, reemplazar las columnas que muestran IDs por
algún campo representativo de la tabla a la que hacen referencia.*/



/*12. Por ejemplo, si quiero mostrar un reporte de películas más alquiladas en lugar de mostrar el
ID de película debemos mostrar el título.*/
SELECT film.title AS Título_Película, COUNT(rental.rental_id) AS Cantidad_Alquileres
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY Cantidad_Alquileres;

/*13. Generar un reporte que responda a la pregunta: Para cada tienda (store) ¿cual es la cantidad
de alquileres y el monto total del dinero recaudado por mes?*/
SELECT MONTH(payment.payment_date) AS Mes,store.store_id AS N°_Tienda,COUNT(payment.rental_id) AS Cantidad_Alquileres,SUM(payment.amount) AS Monto_Total_Recaudado
FROM store 
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY MONTH(payment.payment_date), store.store_id
ORDER BY N°_Tienda;

/*14. Generar un reporte que responda a la pregunta: ¿cuáles son los 10 PELÍCULAS que generan
más ingresos? ¿ Y cuáles las que generan menos ingresos? Para cada una de ellas indicar la
cantidad de alquileres*/
SELECT film.title AS Titulo_Pelicula, COUNT(payment.rental_id) Cantidad_Alquileres, sum(payment.amount) AS Monto_Total_Recaudado
FROM film 
JOIN inventory ON film.film_id = inventory.film_id 
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN payment ON payment.rental_id = payment.payment_id
GROUP BY film.title
ORDER BY Monto_Total_Recaudado desc
limit 10;

SELECT film.title AS Titulo_Pelicula, COUNT(payment.rental_id) Cantidad_Alquileres, sum(payment.amount) AS Monto_Total_Recaudado
FROM film 
JOIN inventory ON film.film_id = inventory.film_id 
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN payment ON payment.rental_id = payment.payment_id
GROUP BY film.title
ORDER BY Monto_Total_Recaudado asc
limit 10;

/*15. Generar un reporte que muestre el dinero recaudado por tienda (store), que compare en dos
columnas junio y julio de 2005*/
SELECT MONTH(payment.payment_date) AS Mes,store.store_id AS N°_Tienda,COUNT(payment.rental_id) AS Cantidad_Alquileres,SUM(payment.amount) AS Monto_Total_Recaudado
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
WHERE YEAR(payment.payment_date) = 2005 AND MONTH(payment.payment_date) IN (6, 7)
GROUP BY Mes, store.store_id
ORDER BY Mes;


