select s.payment_type, count(s.payment_type)
    from sales as s
    group by s.payment_type
    order by 2 desc
    limit 1;