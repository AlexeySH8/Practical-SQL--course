--1--
SELECT customers.company_name, CONCAT(first_name,' ', last_name)
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id)
JOIN shippers ON shipper_id = orders.ship_via
WHERE customers.city = 'London' AND employees.city = 'London'
AND shippers.company_name = 'Speedy Express';
--2--
SELECT product_name, units_in_stock, contact_name, phone
FROM products
JOIN suppliers USING (supplier_id)
JOIN categories USING (category_id)
WHERE discontinued != 1
AND category_name IN ('Beverages','Seafood') 
AND units_in_stock < 20;
--3--
SELECT contact_name, order_id
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL;
--4--
SELECT contact_name, order_id
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL;

