--1--
CREATE OR REPLACE VIEW c_e_order AS
SELECT order_date, required_date, 
shipped_date, ship_postal_code, company_name, 
contact_name, phone, last_name, first_name, title
FROM orders
JOIN employees USING (employee_id)
JOIN customers USING (customer_id);

SELECT *
FROM c_e_order
WHERE order_date > '1997-01-01';
--2--
CREATE OR REPLACE VIEW e_c_order AS
SELECT order_date, required_date, 
shipped_date, ship_postal_code, ship_country, 
company_name, contact_name, phone, last_name, 
first_name, title
FROM orders
JOIN employees USING (employee_id)
JOIN customers USING (customer_id);

ALTER VIEW e_c_order RENAME TO old_e_c_order;

CREATE OR REPLACE VIEW e_c_order AS
SELECT order_date, required_date, 
shipped_date, ship_postal_code, ship_country, 
company_name, contact_name, phone, last_name, 
first_name, title , reports_to ,customers.postal_code
FROM orders
JOIN employees USING (employee_id)
JOIN customers USING (customer_id);

SELECT *
FROM e_c_order
ORDER BY ship_country;
--3--
CREATE OR REPLACE VIEW active_products AS
SELECT *
FROM products
WHERE discontinued = 0
WITH LOCAL CHECK OPTION;

INSERT INTO active_products
VALUES(78, 'abc', 1, 1, 'abc', 1, 1, 1, 1, 1);

