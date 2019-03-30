-- Show the total amount of sales in January 2009

SELECT SUM(p.price)
FROM transactions as t
INNER JOIN products as p ON p.id = t.product_id;

-- Build a report of number of sales and total amount by each B2B customer

SELECT t.seller, COUNT(*) as count_sell, sum(p.price) as amount_sell
FROM transactions as t
inner join products as p on t.product_id = p.id
group by t.seller
order by t.seller;

-- What is your best product?

select p.name, count(*) as quantity
from transactions as t
inner join products as p on t.product_id = p.id
group by p.id order by quantity desc limit 1;

-- What's the preferred payment type?
select payment, count(*) as quantity
from transactions
group by payment order by quantity desc limit 1

-- What are the number and amount of sales per POS? Is there a clear channel where we should focus our efforts?
select t.pos, count(*) as quantity, sum(p.price) as amount
from transactions as t
inner join products as p on p.id = t.product_id
group by t.pos order by amount desc

-- Per each tour, where do customers come from? Show the top 5 locations
select p.name, c.country, count(c.country) as quantity_country
from transactions as t
inner join products as p on p.id = t.product_id
inner join customers as c on t.customer_id = c.id
group by p.name ,c.country
having p.name = 'Caribbean Tour'
order by quantity_country desc limit 5;

select p.name, c.country, count(c.country) as quantity_country
from transactions as t
inner join products as p on p.id = t.product_id
inner join customers as c on t.customer_id = c.id
group by p.name ,c.country
having p.name = 'Inka trail'
order by quantity_country desc limit 5;

select p.name, c.country, count(c.country) as quantity_country
from transactions as t
inner join products as p on p.id = t.product_id
inner join customers as c on t.customer_id = c.id
group by p.name ,c.country
having p.name = 'Romantic Paris'
order by quantity_country desc limit 5;
