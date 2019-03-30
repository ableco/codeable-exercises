--Query 5
select pur.pos, COUNT(*), SUM(pro.p_price)
FROM purchase as pur
  INNER JOIN product as pro on pro.id = pur.product_id
GROUP BY pur.pos
ORDER BY sum DESC
LIMIT 1;

--Query 6
(SELECT pro
.p_name, cus.c_country, COUNT
(cus.c_country)
FROM customer as cus
INNER JOIN purchase as pur on cus.id = pur.customer_id
INNER JOIN product as pro on pur.product_id = pro.id
where pro.id = 1
GROUP BY pro.p_name, cus.c_country
ORDER BY count DESC
LIMIT 5)
UNION ALL
(SELECT pro.p_name, cus.c_country, COUNT(cus.c_country)
FROM customer as cus
  INNER JOIN purchase as pur on cus.id = pur.customer_id
  INNER JOIN product as pro on pur.product_id = pro.id
where pro.id = 2
GROUP BY pro.p_name, cus.c_country
ORDER BY count DESC
LIMIT 5)
UNION ALL
(SELECT pro
.p_name, cus.c_country, COUNT
(cus.c_country)
FROM customer as cus
INNER JOIN purchase as pur on cus.id = pur.customer_id
INNER JOIN product as pro on pur.product_id = pro.id
where pro.id = 3
GROUP BY pro.p_name, cus.c_country
ORDER BY count DESC
LIMIT 5);