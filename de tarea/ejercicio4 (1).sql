SELECT first_name FROM employees
WHERE last_name LIKE 'H%' OR last_name LIKE 'S%';

SELECT last_name FROM employees
WHERE first_name BETWEEN 'A' and 'J' ;

SELECT first_name FROM customers
WHERE city='Boston' OR city='Chicago' OR city='Miami';

SELECT employees.last_name , orders.id , orders.order_date ,orders.shipped_date FROM orders
JOIN employees ON employees.id=orders.employee_id;

SELECT customer_id, COUNT(*) AS Num_de_compras
FROM orders
GROUP BY customer_id;

SELECT customer_id, COUNT(*) AS Num_de_compras
FROM orders
GROUP BY customer_id
ORDER BY COUNT(*) DESC ;

SELECT customers.id , customers.last_name, COUNT(*) AS Num_de_compras FROM orders
JOIN customers ON customers.id=orders.customer_id
GROUP BY customer_id
ORDER BY COUNT(*) DESC
LIMIT 3;

SELECT product_name , product_code , list_price  FROM products
WHERE list_price=(SELECT MAX(list_price) FROM products);

SELECT product_name , product_code , list_price  FROM products
WHERE list_price=(SELECT MAX(list_price) FROM products) OR list_price=(SELECT MIN(list_price) FROM products);










