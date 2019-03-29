create table products(
	id serial primary key,
	name varchar (50) UNIQUE not null,
	days integer not null,
	price integer
  );

create table customers(
  id serial primary key,
  name varchar(50) not null,
  country varchar(50) not null,
  state varchar(50) not null,
  city varchar(50) not null
  );

create table transactions(
  id serial primary key,
  date_time date,
  product_id integer references products,
  payment varchar(50),
  pos varchar(50),
  customer_id integer references customers,
  seller varchar(50),
  contact varchar(50)
);

