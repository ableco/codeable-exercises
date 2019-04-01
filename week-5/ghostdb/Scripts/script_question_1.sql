--First solution Diego
SELECT  SUM(p.price) TOTAL_SALES
FROM    sales s
        INNER JOIN products p ON p.product_id = s.product_id
WHERE   EXTRACT(MONTH FROM transaction_date) = 1
        AND EXTRACT(YEAR FROM transaction_date) = 2009;


--Second solution
SELECT  SUM(p.price) TOTAL_SALES
FROM    sales s
        INNER JOIN products p ON p.product_id = s.product_id
WHERE   transaction_date >= CAST('1/1/2009' AS DATE)
        AND transaction_date < CAST('2/1/2009' AS DATE);
