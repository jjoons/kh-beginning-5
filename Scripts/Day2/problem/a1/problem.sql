-- 날짜를 이용해서 테이블 생성
CREATE TABLE orders3 (
	order_id INT,
	cust_id INT,
    book_id INT,
    sale_price INT,
    order_date DATE
);

INSERT INTO orders3 VALUES(1, 1, 1, 6000, '2020-07-01'),
(2, 1, 3, 21000, '2020-07-03'),
(3, 2, 5, 8000, '2020-07-03'),
(4, 3, 6, 6000, '2020-07-04'),
(5, 4, 7, 20000, '2020-07-05'),
(6, 1, 2, 12000, '2020-07-07'),
(7, 4, 8, 13000, '2020-07-07'),
(8, 3, 10, 12000, '2020-07-08'),
(9, 2, 10, 7000, '2020-07-09'),
(10, 3, 8, 13000, '2020-07-10');

SELECT * FROM orders3;

-- orders3 테이블에서 총 매출 구하기
SELECT SUM(sale_price) FROM orders3;

-- orders3 테이블에서 2번 김연아 고객이 주문한 도서의 총 판매액 구하기
-- SELECT sale_price FROM orders3 WHERE cust_id = 2;
SELECT SUM(sale_price) FROM orders3 WHERE cust_id = 2;
