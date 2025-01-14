/*base de datos northwind*/
/*1-Crear una consulta que muestre nombres de los empleados , cuyo apellido comience con S o H .*/
SELECT first_name,last_name,id 
FROM employees 
WHERE last_name LIKE "S%" or last_name LIKE "H%"; 
/*2-Crear una consulta que muestre el apellido de todos los empleados , cuyos nombres esten comprendidos entre las letras A y J.*/
SELECT last_name,id
FROM employees
WHERE first_name >= "a" AND first_name <= "j";
/*3-Crear una consulta que muestre los nombres de aquellos clientes cuya ciudades sean , Boston , Chicago , Miami.*/
SELECT first_name
FROM customers
WHERE city IN ("Boston", "Chicago", "Miami");
/*4-Crear una consulta que muestre el apellido de empleado , el codigo de pedido y la fecha de pedido que halla tramitado el mismo.*/
SELECT employees.last_name, orders.id, orders.order_date
FROM orders 
JOIN employees ON employees.id = orders.employee_id;
/*5-Crear una consulta que muestre la cantidad de pedidos por cliente .*/
SELECT customer_id, COUNT(*) AS cantidad_pedidos
FROM orders
GROUP BY customer_id;
/*6-Al ejercicio anterior ordenarlo de manera que aparezcan los vendedores con mayores ventas primero.*/
SELECT employee_id, COUNT(*) AS mas_ventas
FROM orders
GROUP BY employee_id
ORDER BY mas_ventas DESC;
/*7-Hacer que muestre del ejercicio anterior solo lo 3 mayores compradores incluyendo (Numero de compras total , id y  su Apellido).*/
SELECT customer_id, COUNT(*) AS cantidad_pedidos, last_name
FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customer_id, last_name
ORDER BY cantidad_pedidos DESC
LIMIT 3;
/*8-Averiguar el producto mas caro , con su nombre , su codigo y su precio de lista.*/
SELECT p.product_name, p.id, p.list_price
FROM products p
WHERE p.list_price = (SELECT MAX(list_price) FROM products);
/*9-Averiguar el articulo mas caro y el mas barato en la misma consulta.*/
SELECT p.product_name, p.id, p.list_price
FROM products p
WHERE p.list_price = (SELECT MIN(list_price)FROM products) OR p.list_price = (SELECT MAX(list_price) FROM products);


