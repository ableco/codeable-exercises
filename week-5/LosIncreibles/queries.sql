--Show the total amount of sales in January 2009
select SUM(p.price)as total
from product as p
inner join sales as s on p.id_product=s.id_product
group by p.price,s.transaction_date
having s.transaction_date<to_date('2009-02-01','YYYY-MM-DD') AND
 s.transaction_date>=to_date('2019-01-01','YYYY-MM-DD')

 --Build a report of number of sales and total amount by each B2B customer
select b.id_business, b.name, SUM(p.price), COUNT(b.id_business)
FROM business as b
inner JOIN sales as s on a.id_business= b.id_business
inner JOIN product as p on b.id_product= p.id_product
group by b.id_business --semana mes año
order by count DESC;

--What is your best product?
select p.id_product,p.name,  COUNT(p.id_product)
FROM sales as s
inner JOIN product as p on p.id_casete= a.id_casete
group by p.id_product --semana mes año
order by count DESC
limit 1;

--What's the preferred payment type?
select p.id_payment,p.type,  COUNT(p.id_payment)
FROM payment as p
inner JOIN sales as s on s.id_payment= p.id_payment
group by p.id_payment --semana mes año
order by count DESC
limit 1;

--What are the number and amount of sales per POS? Is there a 
--clear channel where we should focus our efforts? 
select po.id_pos, po.name, SUM(p.price), COUNT(po.id_pos)
FROM pos as po
inner JOIN sales as s on po.id_pos= s.id_pos
inner JOIN product as p on s.id_product= p.id_product
group by po.id_pos 
order by count DESC
limit 3;

--Per each tour, where do customers come from? Show the top 5 locations
select p.id_product,p.name, c.city COUNT(c.city)
FROM product as p
inner JOIN sales as s on p.id_product= s.id_product
inner JOIN customer as c on c.id_customer= s.id_customer
group by c.city 
order by count DESC
limit 5;