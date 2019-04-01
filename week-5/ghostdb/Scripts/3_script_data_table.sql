--INSERT DATA IN TABLE PRODUCTS
insert into products(product_name, days, price)
select distinct product_name, days, price from temporal;

--INSERT DATA IN TABLE CUSTOMERS
insert into customers(customer_name, customer_city, customer_state, customer_country)
select distinct customer_name, customer_city,customer_state,customer_country
from   temporal;

--INSERT DATA IN TABLE SALES
insert into sales(product_id, customer_id,transaction_date,payment_type,sold_by,contact,pos)
select 	p.product_id,
		c.customer_id,
		t.transaction_date,
		t.payment_type,
		t.sold_by,
		t.contact,
		t.pos
from 	temporal t
inner join products p on t.product_name = p.product_name and t.days = p.days and t.price = p.price
inner join customers c on t.customer_name = c.customer_name 
					  and t.customer_city = c.customer_city
					  and t.customer_state = c.customer_state
					  and t.customer_country = c.customer_country;
