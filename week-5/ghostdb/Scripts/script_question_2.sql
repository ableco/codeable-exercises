SELECT  sold_by, COUNT(1) NUMBER_SALES, SUM(p.price) TOTAL_SALES
FROM    sales s
        INNER JOIN products p ON s.product_id = p.product_id
GROUP BY sold_by
ORDER BY 3 DESC, 2 DESC;