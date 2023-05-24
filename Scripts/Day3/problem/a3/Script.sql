CREATE DATABASE day3_shopping;
USE day3_shopping;


CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(20),
    nickname VARCHAR(30)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    status VARCHAR(10),
    created_at TIMESTAMP,
    user_id INT REFERENCES users(id)
);

CREATE TABLE order_details (
    id INT PRIMARY KEY,
    order_id INT UNIQUE REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    count INT
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    price INT,
    ptype VARCHAR(20)
);

CREATE TABLE payments (
    id INT PRIMARY KEY,
    amount INT,
    ptype VARCHAR(20) REFERENCES products(ptype)
);

INSERT INTO users VALUES();
