--1--
SELECT contact_name, city, country
FROM customers
ORDER BY contact_name, COALESCE(city,country);
--2--
SELECT product_name, unit_price,
	CASE WHEN unit_price >= 100 THEN 'too expensive'
		 WHEN unit_price >= 50 AND unit_price < 100 THEN 'average'
		 WHEN unit_price < 50 THEN 'low price'
		 END AS price_description
FROM products;
--3--
SELECT contact_name , COALESCE(order_id::text,'no orders')
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL
--4--
SELECT first_name, last_name, 
	COALESCE(NULLIF(title,'Sales Representative'),'Sales Stuff')
FROM employees