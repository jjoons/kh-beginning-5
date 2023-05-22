-- 주석!!
-- SQL: 데이터 관리용 언어!
-- DB는 데이터를 저장하는 창고
--   유튜브 영상, 인스타그램 사진, 댓글, 좋아요

-- 테이블
--   - 물건을 저장하려면 적당한 박스가 필요하듯 데이터를 저장하는 틀
--   데이터의 저장 단위: 행(row), 열(column)

-- CRUD
--   데이터 생성 (Create)
--   데이터 조회 (Read)
--   데이터 수정 (Update)
--   데이터 삭제 (Delete)


-- Query: 데이터베이스에 명령한다

-- 키워드
-- table

-- 데이터베이스 생성
-- CREATE DATABASE Members;

-- -- 만들어진 데이터베이스 선택
-- USE Members;

-- -- 데이터를 저장하는 테이블 생성
-- --   어떤 내용을 저장할지 써 주기! 타입
-- --   정수: int, 문자 varchar, 실수 real
-- --   날짜와 시간: Date, datetime
-- --   json (배열 타입의 key, value)
-- CREATE TABLE member (
-- 	id int,
--     pw varchar(20),
-- 	name varchar(20)
-- );

-- 데이터 저장 (테이블에 저장)
-- INSERT INTO 테이블명 values(속성1, 속성2, 속성3)

-- INSERT INTO member values(1111, '1111', '이서희');
-- INSERT INTO
-- member(id, pw, name)
-- values(2222, '2222', '하하');

-- 조회
--   키워드: SELECT
--   "*": 전부 (모두) 조회
--   SELECT * FROM 테이블명;
SELECT * FROM member;
