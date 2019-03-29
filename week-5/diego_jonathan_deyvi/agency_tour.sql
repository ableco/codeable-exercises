

create table Customer
(
  id serial PRIMARY key,
  c_name varchar,
  c_city varchar,
  c_state varchar,
  c_country VARCHAR
);

create table Product
(
  id serial primary key,
  p_name VARCHAR,
  p_days INTEGER,
  p_price INTEGER
);

create table agency
(
  id serial primary key,
  a_name VARCHAR,
  a_contact VARCHAR
);

create table Purchase
(
  id serial primary key,
  purchase_date date,
  payment_type VARCHAR,
  pos VARCHAR,
  customer_id INTEGER REFERENCES customer (id),
  product_id INTEGER REFERENCES product (id),
  agency_id INTEGER REFERENCES agency (id)
);

