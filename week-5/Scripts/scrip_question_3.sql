select p.product_name, sum(p.price)
   from products as p
    inner join sales as s
    on s.product_id = p.product_id
  group by p.product_name
  order by 2 desc
  limit 1;