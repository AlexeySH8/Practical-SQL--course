--1--
SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < ALL(SELECT AVG (quantity)
						    FROM order_details
						   GROUP BY product_id);
--2--
SELECT customer_id, SUM(freight) AS freight_sum
FROM orders
INNER JOIN (SELECT customer_id, AVG(freight) AS freight_avg
		   FROM orders
		   GROUP BY customer_id)	
USING(customer_id)
WHERE freight > freight_avg AND shipped_date BETWEEN '1996-07-16' AND '1996-07-31'
GROUP BY customer_id
ORDER BY freight_sum;
--3--
SELECT customer_id, ship_country, SUM(unit_price * quantity * (1 - discount)) AS order_price
FROM orders
JOIN order_details USING (order_id)
WHERE ship_country IN ('Argentina', 'Brazil', 'Venezuela') 
AND order_date >= '1997-09-01' 
GROUP BY order_id
ORDER BY order_price DESC
LIMIT 3;
--4--
SELECT product_name
FROM products
WHERE product_id = ANY (SELECT product_id
		                FROM order_details
		                WHERE quantity = 10)