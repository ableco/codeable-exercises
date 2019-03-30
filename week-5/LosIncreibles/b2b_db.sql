CREATE TABLE products ( 
  id_product SERIAL PRIMARY KEY, 
  name TEXT, 
  days INTEGER, 
  price NUMERIC 
);

CREATE TABLE customer ( 
  id_customer SERIAL PRIMARY KEY, 
  name TEXT, 
  city VARCHAR(50), 
  state VARCHAR(50),
  country VARCHAR(30)
);

CREATE TABLE payment ( 
  id_payment SERIAL PRIMARY KEY, 
  type TEXT
);

CREATE TABLE pos ( 
  id_pos SERIAL PRIMARY KEY, 
  name TEXT 
);

CREATE TABLE business (
  id_business SERIAL PRIMARY KEY,
  name TEXT,
  contact VARCHAR(30)
);
  
CREATE TABLE sales (
  id_sale SERIAL PRIMARY KEY,
  transaction_date TIMESTAMP,
  id_product INTEGER REFERENCES products,
  id_customer INTEGER REFERENCES customer,
  id_payment INTEGER REFERENCES payment,
  id_post INTEGER REFERENCES pos,
  id_business INTEGER REFERENCES business
);

INSERT INTO products (id_product, name, days, price)  VALUES
	(1, 'Caribbean Tour', 9, 1200),
	(2, 'Inka trail', 7, 7500),
	(3, 'Romantic Paris', 3, 3600);
	
INSERT INTO pos (id_pos, name) VALUES
	(1, 'Facebook'),
	(2, 'Shop'),
	(3, 'Web'),
	(4, 'Whatsapp');

INSERT INTO payment (id_payment, type) VALUES
	(1, 'Amex'),
	(2, 'Diners'),
	(3, 'Mastercard'),
	(4, 'Visa');