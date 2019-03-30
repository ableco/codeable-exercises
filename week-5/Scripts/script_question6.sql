select p.product_name, c.customer_country 
from sales as s 
    inner join customers as c on c.customer_id = s.customer_id 
    inner join products as p on p.product_id = s.product_id 
where p.product_name = 'Caribbean Tour' 
group by p.product_name, c.customer_country 
order by p.product_name, sum (p.price) DESC 
limit 5;

select p.product_name, c.customer_country 
from sales as s 
    inner join customers as c on c.customer_id = s.customer_id 
    inner join products as p on p.product_id = s.product_id 
where p.product_name = 'Inka trail' 
group by p.product_name, c.customer_country 
order by p.product_name, sum (p.price) DESC 
limit 5;

select p.product_name, c.customer_country from sales as s 
    inner join customers as c on c.customer_id = s.customer_id 
    inner join products as p on p.product_id = s.product_id 
where p.product_name = 'Romantic Paris' 
group by p.product_name, c.customer_country 
order by p.product_name, sum (p.price) DESC 
limit 5;