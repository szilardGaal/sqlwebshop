-- Database: webshop sql

-- DROP DATABASE "webshop sql";
	
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Orders_detail;
DROP TABLE IF EXISTS Product;

CREATE TABLE Customer (
	customer_id int NOT NULL,
	company_name character varying(30),
	contact_name character varying(30) NOT NULL,
	contact_title character varying(10),
	address character varying(60) NOT NULL,
	city character varying(20) NOT NULL,
	region character varying(20) NOT NULL,
	postal_code int NOT NULL CHECK(postal_code BETWEEN 1000 AND 9999),
	country character varying(20) NOT NULL,
	phone character varying(15),
	fax character varying(15),
	PRIMARY KEY(customer_id)
);

CREATE TABLE Orders (
	order_id smallint NOT NULL,
	customer_id int,
	emlpoyee_id smallint,
	oder_date date,
	required_date date,
	shipped_date date,
	ship_via int,
	freight real,
	ship_name character varying(40),
	ship_address character varying(60),
	ship_city character varying(15),
	ship_region character varying(15),
	ship_postal_code character varying(10),
	ship_country character varying(15),
	PRIMARY KEY(order_id),
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Products (
	product_id smallint NOT NULL,
	product_name character varying(40) NOT NULL,
	supplier_id smallint,
	category_id smallint,
	quantity_per_unit character varying(20),
	unit_price real,
	units_in_stock smallint,
	units_on_order smallint,
	reorder_level smallint,
	discontinued integer NOT NULL,
	PRIMARY KEY(product_id)
);

CREATE TABLE Order_details (
	order_id smallint NOT NULL,
	product_id smallint NOT NULL,
	unit_price real NOT NULL,
	quantity smallint NOT NULL,
	discount real NOT NULL,
	FOREIGN KEY(order_id) REFERENCES Orders(order_id),
	FOREIGN KEY(product_id) REFERENCES Products(product_id)
);




INSERT INTO Customer VALUES (1, 'Hal kft', 'Keszeg Béla', 'Úr', 'Horgász u. 13.', 'Damilcity', 'aha', 2345, 'Csukamegye', 0630-1234-231, 0646-123-123);
INSERT INTO Customer VALUES (2, 'Puskatus bt', 'Vadász István', 'Hölgy', 'Sörét köz 1.', 'Lőpor', 'nem', 3451, 'Bak', 0670-1234-762, 0);

INSERT INTO Orders VALUES (10250, 1, 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.3800011, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO Orders VALUES (10251, 2, 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6099997, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');

INSERT INTO Products VALUES (1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO Products VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);

INSERT INTO Order_details VALUES (10250, 1, 16.7999992, 15, 0.150000006);
INSERT INTO Order_details VALUES (10251, 2, 16.7999992, 6, 0.0500000007);


	
