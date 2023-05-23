CREATE DATABASE day2_1;
USE day2_1;

CREATE TABLE book (
	book_id int,
    book_name VARCHAR(30),
    publisher VARCHAR(20),
    price int
);

INSERT INTO book VALUES(1, '축구의 역사', '굿스포츠', 7000),
(2, '축구 아는 여자', '나무수', 7000),
(3, '축구의 이해', '대한미디어', 22000),
(4, '골프 바이블', '대한미디어', 35000),
(5, '피겨 교본', '굿스포츠', 8000),
(6, '역도 단계별 기술', '굿스포츠', 8000),
(7, '야구의 추억', '이상미디어', 20000),
(8, '야구를 부탁해', '이상미디어', 13000),
(9, '올림픽 이야기', '심성당', 7500),
(10, 'Olymplic Champions', 'Pearson', 13000);

SELECT * FROM book;

CREATE TABLE customer (
	cust_id int,
    name VARCHAR(20),
    address VARCHAR(30),
    phone VARCHAR(20)
);

INSERT INTO customer VALUES(1, '박지성', '영국 맨체스터', '000-5000-0001'),
(2, '김연아', '대한민국 서울', '000-6000-0001'),
(3, '장미란', '대한민국 강원도', '000-7000-0001'),
(4, '추신수', '미국 클리블랜드', '000-8000-0001'),
(5, '박세리', '대한민국 대전', NULL);

SELECT * FROM customer;

CREATE TABLE orders (
	order_id int,
    cust_id int,
    book_id int,
    sale_price int,
    order_date DATE
);

-- INSERT INTO orders VALUES(1, 1, 1, 6000, DATE('2020-07-01')),
-- (2, 1, 3, 21000, DATE('2020-07-03')),
-- (3, 2, 5, 8000, DATE('2020-07-03')),
-- (4, 3, 6, 6000, DATE('2020-07-04')),
-- (5, 4, 7, 20000, DATE('2020-07-05')),
-- (6, 1, 2, 12000, DATE('2020-07-07')),
-- (7, 4, 8, 13000, DATE('2020-07-07')),
-- (8, 3, 10, 12000, DATE('2020-07-08')),
-- (9, 2, 10, 13000, DATE('2020-07-09')),
-- (10, 3, 8, 13000, DATE('2020-07-10'));

-- SELECT * FROM orders;

-- UPDATE customer SET phone = '010-0000-0000' WHERE cust_id = 2;

/*
SQL 기능에 따른 분류
  데이터 정의어 (DDL)
    테이블이나 관계의 구조를 생성하는데 사용 (CREATE, ALTER, DROP)
  데이터 조작어 (DML)
    테이블에 데이터를 검색하고 삽입, 수정, 삭제하는데 사용 (SELECT, INSERT, DELETE, UPDATE)
  데이터 제어어 (DCL)
    데이터의 사용 권한을 관리하는데 사용 (GRANT, REVOKE)
*/

/*
키워드
  SELECT: 질의 결과에서 추출되는 속성 리스트를 열거한다
  FROM: 질의 결과에 어느 테이블이 사용되는지 열거한다
  WHERE: 질의의 조건을 작성한다
  []: 예약어를 사용할 수 있다
*/

-- 김연아 고객의 전화번호를 찾으세요
SELECT phone FROM customer WHERE name = '김연아';

SELECT publisher FROM book;
-- 출판사명을 가지고 오는데 중복되는 이름을 제거하고 출력
SELECT DISTINCT publisher FROM book;

-- 가격이 10000원 이상이며 20000원 이하 도서를 검색하세요
SELECT * FROM book WHERE price BETWEEN 10000 AND 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하세요
SELECT * FROM book WHERE publisher IN('굿스포츠', '대한미디어');

-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하세요
SELECT * FROM book WHERE publisher NOT IN('굿스포츠', '대한미디어');

-- 도서 이름에 축구가 포함된 출판사 검색
SELECT book_name, publisher FROM book WHERE book_name LIKE '%축구%';

-- 정렬: ORDER BY
SELECT * FROM book ORDER BY book_name;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색
SELECT * FROM book ORDER BY price, book_name;

-- 도서 가격의 내림차순으로 검색
-- 만약 가격이 같다면 출판사의 오름차순으로 검색
-- DESC: 내림차순 키워드
-- ASC: 오름차순 키워드
-- 기본적으로 ORDER BY는 오름차순으로 설정되어 있어 생략이 가능하다
SELECT * FROM book ORDER BY price DESC, publisher ASC;

-- 집계 함수 SUM()
-- AS: 열의 이름을 부여할 때

-- book 테이블에 있는 도서의 총 금액 구하기
SELECT SUM(price) AS '합계' FROM book;

-- price 기준으로 최고가, 최저가 구하기 (MAX, MIN)
-- ROUND(값, 자릿수): 반올림
SELECT MIN(price) as 'min', MAX(price) as 'max', ROUND(AVG(price), 2) as 'avg' FROM book;

-- 날짜와 시간에 관한 정보 저장하기
-- NOW(): 현재 날짜와 시간 반환
--   YYYY-MM-DD-HH:MM:SS
SELECT NOW();

-- CURDATE(): 날짜만 반환한다
SELECT CURDATE();

-- CURTIME(): 현재 시간만 반환한다
SELECT CURTIME();

-- DATE(): 전달받은 값에 해당하는 날짜 정보를 반환한다
-- MONTH(): 전달받은 값에서 월에 해당하는 값만 반환하며 0~12 사이의 값을 가진다
-- DAY(): 전달받은 값에서 일자에 해당하는 값만 반환하며 0부터 31 사이의 값을 가진다
-- HOUR(): 전달받은 값에서 시간에 해당하는 값만 반환하며 0부터 23사이의 값을 가진다
-- MINUTE(): 시간의 분만 반환하며 0~59 사이의 값을 가진다
SELECT DATE('2016-02-19 12:34:56'),
YEAR('2016-02-19 12:34:56'), MONTH('2016-02-19 12:34:56'), DAY('2016-02-19 12:34:56'),
HOUR('2016-02-19 12:34:56'), MINUTE('2016-02-19 12:34:56'), SECOND('2016-02-19 12:34:56'),
MONTHNAME('2016-02-19 12:34:56'),
DAYNAME('2016-02-19 12:34:56');

-- 연도별, 월별, 주별 일수
-- DAYOFWEEK: 해당 주에서 몇번째 날인지 반환한다. 일요일: 1, 토요일: 7
-- DAYOFMONTH: 해당 월에서 몇번째 날인지 반환한다. 0~31
-- DAYOFYEAR: 해당 연도에서 몇번째 날인지 반환. 1~366 사이의 값을 반환한다
SELECT DAYOFWEEK('2021-05-23'),
DAYOFMONTH('2021-05-23'),
DAYOFYEAR('2021-05-23');

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

-- 서점의 도서 판매 건수를 구하세요
SELECT COUNT(*) FROM orders3;

-- 고객별로 주문한 도서의 총 수량과 총 판매액 구하기
-- GROUP BY 그룹을_지어줄_필드명
SELECT cust_id, COUNT(*) as "도서수량", SUM(sale_price) as "총액" FROM orders3 GROUP BY cust_id;


-- 두 개 이상 테이블에서 조건없이 연결해서 원하는 데이터 가져오기
SELECT * FROM customer, orders3;

-- 고객과 고객의 주문에 관한 데이터를 모두 가져오기
SELECT * FROM customer, orders3 WHERE customer.cust_id = orders3.cust_id;

-- 위에 있는 내용 정렬
SELECT * FROM customer, orders3 WHERE customer.cust_id = orders3.cust_id ORDER BY customer.cust_id;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬
-- 김연아 15000
-- 박지성 39000
-- 장미란 31000
-- 추신수 33000
SELECT name, SUM(sale_price) FROM customer, orders3 WHERE customer.cust_id = orders3.cust_id
GROUP BY customer.name ORDER BY customer.name;
