SELECT * FROM customers;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT * FROM customers
WHERE city='Las Vegas'AND first_name LIKE 'J%';
SELECT COUNT(city) from customers
WHERE city='Las Vegas';
SELECT COUNT(distinct city) from customers;

