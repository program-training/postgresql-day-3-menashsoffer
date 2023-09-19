-- Active: 1694600651436@@127.0.0.1@5432@Northwind@public

-- Exercise 1
SELECT first_name ||' '|| last_name AS employee_name, COUNT(order_id) AS num_of_orders
FROM  employees INNER JOIN orders
ON orders.employee_id = employees.employee_id
GROUP BY employee_name

-- Exercise 2
SELECT category_name,  sum(quantity * order_details.unit_price * (1 - discount)) AS sum_of_orders
FROM categories INNER JOIN products 
ON categories.category_id = products.category_id
INNER JOIN order_details
ON products.product_id = order_details.product_id
GROUP BY category_name
ORDER BY sum_of_orders DESC

-- Exercise 3
SELECT contact_name, AVG(quantity * order_details.unit_price * (1 - discount)) AS average
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY contact_name
ORDER BY average DESC

-- Exercise 4
SELECT company_name, SUM(quantity * order_details.unit_price * (1 - discount)) AS sum_of_orders
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY company_name
ORDER BY sum_of_orders DESC LIMIT 10


-- Exercise 5
SELECT EXTRACT(MONTH FROM order_date) AS month_order, SUM(quantity * unit_price * (1 - discount)) AS sale
FROM orders INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY month_order
ORDER BY month_order ASC


-- Exercise 6
SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < 10 AND units_in_stock > 0


-- Exercise 7
SELECT company_name, MAX(quantity * order_details.unit_price * (1 - discount)) AS maxOfOrder
FROM customers INNER JOIN orders 
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY company_name
ORDER BY maxOfOrder DESC LIMIT 1

-- Exercise 8
SELECT country, SUM(order_details.quantity * order_details.unit_price * (1 - order_details.discount)) AS revenue
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details 
ON orders.order_id = order_details.order_id
GROUP BY country
ORDER BY revenue 

-- Exercise 9
SELECT company_name, COUNT(order_id) AS numOfOrder
FROM shippers INNER JOIN orders
ON shippers.shipper_id = orders.ship_via
GROUP BY company_name
ORDER BY numOfOrder DESC LIMIT 1

-- Exercise 10
SELECT product_name
FROM products LEFT OUTER JOIN order_details
ON products.product_id = order_details.product_id
WHERE order_details.product_id = NULL 