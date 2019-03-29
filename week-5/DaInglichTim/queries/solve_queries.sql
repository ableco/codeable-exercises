-- Show the total amount of sales in January 2009

SELECT COUNT(id_transaction)
FROM transactions;

-- Build a report of number of sales and total amount by each B2B customer

SELECT t.sold_by, COUNT(*), SUM(p.price)
FROM transactions as t
INNER JOIN products as p on t.id_product = p.id_product
GROUP BY t.sold_by;

-- What is your best product?

SELECT p.product, COUNT(*) as counter
FROM transactions as t
INNER JOIN products as p on t.id_product = p.id_product
GROUP BY p.product
ORDER BY counter DESC LIMIT 1;

-- What's the preferred payment type?

SELECT payment_type, COUNT(*) as counter
FROM transactions
GROUP BY payment_type
ORDER BY counter DESC LIMIT 1;

-- Per each tour, where do customers come from? Show the top 5 locations
-- Inka trail

SELECT c.customer_city, COUNT(*) "cantidad"
FROM products p
  INNER JOIN transactions t on t.id_product = p.id_product
  INNER JOIN customers c on c.id_customer = t.id_customer
WHERE p.product = 'Inka trail' 
GROUP BY c.customer_city 
ORDER BY cantidad DESC
LIMIT 5;

-- Caribbean Tour

SELECT c.customer_city, COUNT(*) "cantidad"
FROM products p
  INNER JOIN transactions t on t.id_product = p.id_product
  INNER JOIN customers c on c.id_customer = t.id_customer
WHERE p.product = 'Caribbean Tour' 
GROUP BY c.customer_city 
ORDER BY cantidad DESC
LIMIT 5;

-- Romantic Paris

SELECT p.product ,c.customer_city, COUNT(*) "cantidad"
FROM products p
  INNER JOIN transactions t on t.id_product = p.id_product
  INNER JOIN customers c on c.id_customer = t.id_customer
WHERE p.product = 'Romantic Paris' 
GROUP BY c.customer_city 
ORDER BY cantidad DESC
LIMIT 5;