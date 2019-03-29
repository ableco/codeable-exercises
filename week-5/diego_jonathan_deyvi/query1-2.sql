--Query 1
SELECT SUM(pr.p_price)
FROM purchase as pu
INNER JOIN product as pr on pr.id = pu.product_id
where DATE_PART('month', pu.purchase_date) = 1;

--Query 2
select a.a_name "B2B Customer", COUNT(*) "Number of Sales", SUM(pro.p_price) AS "Total Amount"
from agency as a
INNER JOIN purchase as pur on a.id = pur.agency_id
INNER JOIN product as pro on pro.id = pur.product_id
GROUP BY a.a_name;
