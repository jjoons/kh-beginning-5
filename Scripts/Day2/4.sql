-- 데이터베이스끼리 관계성을 주기 위해 key 설정
-- 가장 기본키 혹은 대표키 (PRIMARY KEY)
--   ex) 주민등록증, 주민번호
--     설정할 때 중복되면 안 된다. 유니크 (UNIQUE)
--     저장할 때 값이 비어있으면 안 된다. (NOT NULL)
CREATE DATABASE test2;
USE test2;

DROP TABLE test2;

-- AUTO_INCREMENT: 자동으로 값을 증가시키며 타입은 정수다
CREATE TABLE test2 (
	id INT AUTO_INCREMENT PRIMARY KEY
);

-- INSERT INTO test VALUES(111, 111);
-- INSERT INTO test2 values();
-- SELECT * FROM test2;

-- 외래키, 외부키 (FOREGIN KEY): 테이블끼리 연결해서 사용할 때 사용
