-- 햄버거에 대한 정보를 저장하는 데이터베이스 생성
-- 데이터베이스명: burgurs
-- 테이블명: burgur
--   저장해야하는 내용들: id, name, price, kcal
--     id int, name varchar(저장할공간크기), price int, kcal int

CREATE DATABASE burgurs;

USE burgurs;

CREATE TABLE burgur (
	id int,
    name varchar(30),
    price int,
    kcal int
);

INSERT INTO burgur values(1, "상하이버거", 4000, 1000);

INSERT INTO burgur values
(2, "빅맥", 6000, 1050),
(3, "트리플 치즈버거", 5800, 1100),
(4, "빅맥", 6800, 1200);

SELECT * FROM burgur;

-- 일부 행들만 조회
SELECT id from burger;

SELECT name from burgur;

-- 테이블 전체 구조 확인
desc burgur;

SET sql_safe_updates = 0;

-- WHERE: 일부만 변경
--   WHERE 컬럼명 = 값;
UPDATE burgur SET name = '상하이버거' WHERE id = 2;

-- UPDATE: 수정
--   테이블명
UPDATE burgur SET price = 1000;
SELECT * FROM burgur;

-- 테이블 삭제
DROP TABLE burgur;

-- 데이터베이스 삭제
DROP DATABASE members;
