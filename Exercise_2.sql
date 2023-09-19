-- Active: 1694600651436@@127.0.0.1@5432@Northwind@public

-- Exercise 1
SELECT company_name
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL 

-- Exercise 2
SELECT company_name, COUNT(orders.order_id) AS amountOfOrders
FROM customers  INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY company_name
HAVING COUNT(orders.order_id) >= 10

-- Exercise 3
SELECT product_name
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM products
)


-- Exercise 4
SELECT product_name
FROM products LEFT OUTER JOIN order_details
ON products.product_id = order_details.product_id
WHERE products.product_id IS NULL

-- Exercise 5
SELECT country, COUNT(customer_id) AS amountOfCostumers
FROM customers
GROUP BY country
HAVING COUNT(customer_id) >= 5

-- Exercise 6
SELECT company_name
FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
WHERE EXTRACT(YEAR FROM order_date) NOT IN (1998)

-- Exercise 7
SELECT company_name
FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
WHERE EXTRACT(YEAR FROM order_date) NOT IN (1998) AND country = 'USA'

-- Exercise 8
SELECT company_name, COUNT(order_id)
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY company_name
HAVING COUNT(order_id) = 3

-- Exercise 10
SELECT country, COUNT(product_id)
FROM suppliers JOIN products
ON suppliers.supplier_id = products.supplier_id
GROUP BY country
HAVING  COUNT(product_id) > 1