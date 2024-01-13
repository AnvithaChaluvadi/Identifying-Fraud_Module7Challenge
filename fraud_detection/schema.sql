-- Creating tables that includes columns
CREATE TABLE card_holder (
	id INT NOT NULL,
	name VARCHAR(20),
	PRIMARY KEY (id)
);

CREATE TABLE credit_card (
	card VARCHAR(20) NOT NULL,
	cardholder_id INT NOT NULL,
	PRIMARY KEY (card),
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

CREATE TABLE merchant_category (
	id INT NOT NULL, 
	name VARCHAR (20),
	PRIMARY KEY (id)
);

CREATE TABLE merchant (
	id INT NOT NULL,
	name VARCHAR(50),
	id_merchant_category INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction (
	id INT NOT NULL,
	date TIMESTAMP,
	amount FLOAT, 
	card VARCHAR(20),
	id_merchant INT,
	PRIMARY KEY (id),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);


--Previewing tables to ensure data values, etc.
SELECT * 
FROM card_holder;

SELECT *
FROM credit_card;

SELECT * 
FROM merchant_category;

SELECT *
FROM merchant;

SELECT *
FROM transaction;


--Dropping Tables (if necessary)
DROP TABLE card_holder;
DROP TABLE credit_card;
DROP TABLE merchant_category;
DROP TABLE merchant;
DROP TABLE transaction; 