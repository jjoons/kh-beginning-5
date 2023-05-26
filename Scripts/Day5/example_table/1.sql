
CREATE DATABASE IF NOT EXISTS day5_1;
USE day5_1;

CREATE TABLE IF NOT EXISTS orders (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(255),
    created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_details (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNSIGNED REFERENCES orders(id),
    count INT
);

CREATE TABLE IF NOT EXISTS beverages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price INT,
    btype VARCHAR(255)
);

ALTER TABLE order_details ADD beverage_id INT UNSIGNED REFERENCES beverages(id);

-- 주문(orders)
INSERT INTO
  orders(status, created_at)
VALUES
  ('DELIVERED', '2022-02-26 8:32:13'),
  ('CANCELLED', '2022-02-26 8:35:27'),
  ('DELIVERED', '2022-02-26 8:44:53'),
  ('DELIVERED', '2022-02-26 9:05:12'),
  ('DELIVERED', '2022-02-26 9:11:35'),
  ('DELIVERED', '2022-02-26 9:14:18'),
  ('DELIVERED', '2022-02-26 9:34:20'),
  ('DELIVERED', '2022-02-26 9:44:27'),
  ('DELIVERED', '2022-02-26 9:48:25'),
  ('DELIVERED', '2022-02-26 11:14:52'),
  ('CANCELLED', '2022-02-26 11:32:13'),
  ('DELIVERED', '2022-02-26 11:55:40'),
  ('DELIVERED', '2022-02-26 12:15:01'),
  ('DELIVERED', '2022-02-26 12:21:52'),
  ('CANCELLED', '2022-02-26 12:29:17')
;
-- 음료(beverages)
INSERT INTO
  beverages(name, price, btype)
VALUES
  ('아메리카노',   4500, 'COFFEE'),
  ('라떼',        5000, 'COFFEE'),
  ('카푸치노',     5000, 'COFFEE'),
  ('카페모카',     5500, 'COFFEE'),
  ('콜드브루',     5200, 'COFFEE'),
  ('레몬 에이드',  3800, 'AID'),
  ('자몽 에이드',  4800, 'AID'),
  ('바닐라 쉐이크', 5800, 'SHAKE')
;
-- 주문내역(order_details)
INSERT INTO
  order_details(order_id, beverage_id, count)
VALUES
  (1,  1, 1),
  (2,  1, 2),
  (2,  2, 3),
  (2,  8, 2),
  (3,  1, 2),
  (4,  8, 1),
  (5,  4, 1),
  (6,  5, 3),
  (7,  1, 3),
  (7,  2, 2),
  (8,  1, 1),
  (9,  5, 1),
  (10, 1, 4),
  (11, 2, 1),
  (12, 3, 1),
  (13, 1, 6),
  (14, 1, 8),
  (14, 2, 2),
  (14, 6, 1),
  (15, 1, 4)
;
