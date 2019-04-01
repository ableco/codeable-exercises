--Show the total amount of sales in January 2009
SELECT sum(t.price) from tours  as t 
INNER JOIN sales as s on t.id = s.tour_id
WHERE DATE_PART('month', s.date) = 1;

--Build a report of number of sales and total amount by each B2B customer
--(contact name) A[ 6] Contact: Business contact from our customer
select a.contact_name , count(s.id) , sum(t.price)total from agencies as a
inner join sales as s on s.agency_id = a.id
inner join tours as t on s.tour_id = t.id
group by a.contact_name;


--What is your best product?
select t.name count(s.id), from sales as s
inner join tour as t on s.tour_id = t.id
group by t.name desc limit 1;


--What's the preferred payment type?
SELECT payment, count(payment) "count" from sales
GROUP BY payment
ORDER BY count(payment) DESC
LIMIT 1;


--What are the number and amount of sales per POS? Is there a clear channel where we should focus our efforts?
-- Whatsapp is the channel where the organization must put all its efforts.
SELECT s.pos, count(s.id), sum(t.price) as SALES from sales as s
inner join tours as t on s.tour_id = t.id
group by pos
order by SALES desc;

--Per each tour, where do customers come from? Show the top 5 locations
select * from
(select tmp.name, tmp.country, tmp.top, 
 row_number() over (partition by tmp.name order by top desc) as rownum from 
(select t.name, c.country, count(s.id) as top from sales as s inner join tours as t on s.tour_id = t.id inner join customers as c on s.customer_id=c.id group by t.name, c.country)tmp
)tmp2
where rownum <6;
