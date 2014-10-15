CREATE DATABASE restaurant_db;

\c restaurant_db

CREATE TABLE foods (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
price INTEGER,
course VARCHAR(255),
any_allergens boolean
);

CREATE TABLE parties (
id SERIAL PRIMARY KEY,
table_num INTEGER,
guests INTEGER,
payment_complete boolean
);

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
food_id INTEGER,
party_id INTEGER
);