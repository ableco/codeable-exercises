SELECT s.payment_type, COUNT(s.payment_type)
    FROM sales AS s
    GROUP BY s.payment_type
    ORDER BY 2 DESC
    LIMIT 1;