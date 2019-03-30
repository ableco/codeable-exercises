-- Show the total amount of sales in January 2009
select t.name, sum(t.price) as "total" from sales as s
inner join tours as t on t.id = s.tour_id
group by t.id;
