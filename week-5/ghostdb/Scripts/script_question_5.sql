SELECT  s.pos, COUNT(1) NUMBER_SALES ,SUM(p.price) TOTAL_SALES
FROM    sales s
        INNER JOIN products p ON s.product_id = p.product_id
GROUP BY s.pos
ORDER BY 3 DESC,2 DESC;

--According to the result, there is more income in sales by Facebook but there is more purchases by Web