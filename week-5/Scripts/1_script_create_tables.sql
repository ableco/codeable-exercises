create TABLE customers(
  customer_id serial PRIMARY KEY,
  customer_name text,
  customer_city text,
  customer_state text,
  customer_country text
);

create TABLE products(
	product_id serial PRIMARY KEY,
	product_name  text,
	days integer,
	price integer
);

create TABLE sales(
  sale_id serial PRIMARY KEY,
  product_id integer REFERENCES products(product_id),
  customer_id integer REFERENCES customers(customer_id),
  transaction_date date,
  payment_type text,
  sold_by text,
  contact text,
  pos text
);

create TABLE temporal(
  transaction_date date,
  product_name  text,
  days integer,
  price integer,
  payment_type text,
  sold_by text,
  contact text,
  customer_name text,
  customer_city text,
  customer_state text,
  customer_country text,
  pos text
);