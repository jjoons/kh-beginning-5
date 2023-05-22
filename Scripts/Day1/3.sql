create database book_store_2;
use book_store_2;

-- 책정보 테이블 생성하기
CREATE TABLE book(

    book_name VARCHAR(40),
    price INT,
    publishing VARCHAR(40),
    Total_pages int,
    author VARCHAR(40),
    publication varchar(40)
);

INSERT INTO book VALUES('나미야 잡화점의 기적', 15000, '현대문학',900,'히가시노 게이고','2019-10-04');
INSERT INTO book VALUES('java의 정석', 27000, '한빛미디어',1000,'남궁성','2012-01-25');
INSERT INTO book VALUES('혼자 공부하는 자바스크립트', 24000,'한빛미디어', 1200, '윤인성', '2021-01-04');
INSERT INTO book VALUES('모던 자바 인 액션', 34000,'한빛미디어', 5000, '라울',  '2019-08-01');
INSERT INTO book VALUES('컴퓨터 비전과 딥러닝', 35000,'에이콘',300, '라쟈링가파 샨무갸마니',  '2018-02-18');

select * from book;

-- 필터링 연산자 사용하기
--   비교 연산자 >=, 

SELECT * FROM book WHERE price >= 30000;
SELECT * FROM book WHERE total_pages >= 200;

-- 각 도서의 가격을 10% 인상한 금액 출력
SELECT book_name, price, price * 2 * 0.1 FROM book;

SELECT 20 + 20;
SELECT 20 - 20;

#  <> 다르다
SELECT * FROM book WHERE price <> 15000;

SELECT * FROM book;

-- 출판사 이름이 한빛미디어이면서 남궁선 저자인 정보를 가져오기
SELECT * FROM book WHERE publishing = '한빛미디어' and author = '남궁성';

-- 출판사명이 현대문학 또는 가격이 30000원 이상인 도서를 검색하기
SELECT * FROM book WHERE publishing = '현대문학' OR price >= 30000;

-- 출판사명이 한빛미디어이면서 페이지 수가 1000 이상인 책의 이름만 가져오기
SELECT * FROM book WHERE publishing = '한빛미디어' AND total_pages >= 1000;
