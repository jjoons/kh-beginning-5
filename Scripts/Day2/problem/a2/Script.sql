-- import 1
USE day2_1;

-- 서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--   (1) 도서번호가 1인 도서의 이름
SELECT book_name FROM book WHERE book_id = 1;

--   (2) 가격이 20,000원 이상인 도서의 이름
SELECT book_name FROM book WHERE price >= 20000;

--   (3) 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
SELECT sum(sale_price) FROM orders3 WHERE cust_id = 1;

--   (4) 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
SELECT COUNT(*) FROM orders3 WHERE cust_id = 1;

-- 서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- (1) 마당서점 도서의 총 개수
SELECT COUNT(*) FROM orders3;

-- (2) 마당서점에 도서를 출고하는 출판사의 총 개수
SELECT COUNT(DISTINCT publisher) FROM book;

-- (3) 모든 고객의 이름, 주소
SELECT name, address FROM customer;

-- (4) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서의 주문번호
SELECT order_id FROM orders3 WHERE order_date BETWEEN DATE('2020-07-04') AND DATE('2020-07-07');

-- (5) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
SELECT order_id FROM orders3 WHERE order_date NOT BETWEEN DATE('2020-07-04') AND DATE('2020-07-07');

-- (6) 성이 ‘김’ 씨인 고객의 이름과 주소
SELECT name, address FROM customer WHERE name LIKE '김%';

-- (7) 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
SELECT name, address FROM customer WHERE name LIKE '김%아';
