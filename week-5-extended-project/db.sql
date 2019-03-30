CREATE TABLE tours (
  id SERIAL PRIMARY KEY,
  name varchar (100),
  days integer,
  price float(2)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name varchar (100),
  city varchar (100),
  state varchar (100),
  country varchar (100)
);

CREATE TABLE agencies (
  id SERIAL PRIMARY KEY,
  name varchar (100),
  contact_name varchar (100)
);

CREATE TYPE payment_type AS ENUM ('Visa','Mastercard', 'Amex', 'Diners');
CREATE TYPE pos_type AS ENUM ('Facebook','Whatsapp', 'Shop', 'Web');

CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  date timestamp,
  payment payment_type,
  pos pos_type,
  tour_id integer REFERENCES tours (id),
  customer_id integer REFERENCES customers (id),
  agency_id integer REFERENCES agencies (id)
);
