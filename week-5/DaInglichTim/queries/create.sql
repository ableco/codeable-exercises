CREATE TABLE customers (
  	id_customer serial PRIMARY KEY,
  	customer_name text,
  	customer_city text,
  	customer_state text,
  	customer_country text
 );

CREATE TABLE products (
  	id_product serial PRIMARY KEY,
  	product text,
  	days int,
  	price int
 );

CREATE TABLE transactions (
    id_transaction serial PRIMARY KEY,
    id_product serial REFERENCES products (id_product),
  	id_customer serial REFERENCES customers (id_customer),
  	transaction_date timestamp,
  	payment_type text,
  	sold_by text,
  	contact text,
  	pos text
);