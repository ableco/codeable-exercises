SELECT p.product_name, SUM(p.price)
   FROM products AS p
    INNER JOIN sales AS s
    ON s.product_id = p.product_id
  GROUP BY p.product_name
  ORDER BY 2 DESC
  LIMIT 1;