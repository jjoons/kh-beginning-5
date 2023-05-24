-- import 1
USE instagram;

-- 사진 5번째의 파일명과 사진 게시자의 닉네임 조회하기
--   1. FROM을 이용해서 테이블 가져오기
--   2. JOIN 연결할 테이블
--   3. ON 조건에 맞는 테이블 선택
--   4. 원하는 정보를 SELECT로 출력
SELECT comments.filename, users.nickname FROM  JOIN 
