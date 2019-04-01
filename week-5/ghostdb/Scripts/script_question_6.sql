SELECT p.product_name, c.customer_country 
FROM sales AS s 
    INNER JOIN customers AS c ON c.customer_id = s.customer_id 
    INNER JOIN products AS p ON p.product_id = s.product_id 
WHERE p.product_name = 'Caribbean Tour' 
GROUP BY p.product_name, c.customer_country 
ORDER BY p.product_name, sum (p.price) DESC 
LIMIT 5;

SELECT p.product_name, c.customer_country 
FROM sales AS s 
    INNER JOIN customers AS c ON c.customer_id = s.customer_id 
    INNER JOIN products AS p ON p.product_id = s.product_id 
WHERE p.product_name = 'Inka trail' 
GROUP BY p.product_name, c.customer_country 
ORDER BY p.product_name, sum (p.price) DESC 
LIMIT 5;

SELECT p.product_name, c.customer_country FROM sales AS s 
    INNER JOIN customers AS c ON c.customer_id = s.customer_id 
    INNER JOIN products AS p ON p.product_id = s.product_id 
WHERE p.product_name = 'Romantic Paris' 
GROUP BY p.product_name, c.customer_country 
ORDER BY p.product_name, sum (p.price) DESC 
LIMIT 5;