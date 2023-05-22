-- 데이터베이스명: book_store
-- 책 정보 저장하는 테이블: book
--   책이름 (varchar), 가격 (int), 출판사 (varchar), 총 페이지 수 (int), 저자, 출간일 (varchar)
-- 교보문고에서 책 5개 저장

CREATE DATABASE book_store;
USE book_store;

CREATE TABLE book(
	id int,
	name varchar(30),
    price int,
    publisher varchar(10),
    page int,
    author varchar(20),
    release_date varchar(20)
);

INSERT INTO book values
(1, '세이노의 가르침', 6480, '데이원', 360, '세이노', '2023.03.02'),
(2, '최애의 아이 10', 5400, '대원씨아이', 300, 'Aka Akasaka 외', '2023.05.30'),
(3, '사장학개론', 22500, '스노우폭스북스', 1250, '김승호', '2023.04.19'),
(4, '모든 삶은 흐른다', 15120, '피카(FIKA)', 840, '로랑스 드빌레르', '2023.04.03'),
(5, '모성', 15120, '리드리드출판', 840, '미나토 가나에', '2023.06.15');

--   1. 테이블 구조 확인
DESC book;

--   2. 2번째로 저장되는 책의 가격을 만원으로 변경
UPDATE book SET price = 10000 WHERE id = 2;

--   3. 3번째로 삭제
-- 삭제가 어떤 부분을 삭제하는지 모르겠음

--   4. 전체 조회하기
SELECT * FROM book;

--   5. 일부 책의 이름만 가져오기
SELECT name FROM book WHERE name = '모';
