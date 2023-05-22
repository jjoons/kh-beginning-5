-- create database book_store;
-- use book_store;


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