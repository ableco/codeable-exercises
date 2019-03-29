--Query 3
SELECT pro.p_name, COUNT(*)
FROM purchase as pur
INNER JOIN product as pro on pur.product_id = pro.id
GROUP BY pro.p_name
order by count desc
limit 1;

--Query 4
SELECT payment_type, COUNT(payment_type)
FROM purchase
GROUP BY payment_type
ORDER BY count DESC
LIMIT 1;