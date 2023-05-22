-- example.1 불러오기 필요

-- LIKE
--   문자열 패턴이 일치하는지 검사
-- %
-- SELECT * FROM 테이블명
--   WHERE 필드명 LIKE "_영_" : 가운데 글자가 "영"인 사람
--   WHERE 필드명 LIKE "이%" : 성이 이씨인 사람
--   WHERE 필드명 LIKE "_종신" : 이름이 종신인 성씨 아무거나
--   WHERE 필드명 LIKE "20__" : 2000, 2002 같은 네자리 숫자만

-- book 테이블에서 책 제목에 'java'가 포함되어 있는 책 정보 가져오기
SELECT * FROM book WHERE book_title LIKE '%java%';
SELECT * FROM book WHERE book_title LIKE '%자바%';

-- book 테이블에서 책 제목이 '나'로 시작되는 책 정보 가져오기
SELECT * FROM book WHERE book_title LIKE '나%';

-- 책 제목이 외국어로 끝나는 책 정보 가져오기
SELECT * FROM book WHERE book_title LIKE '%외국어';

-- member 테이블에서 이름이 4글자인 회원 정보 가져오기
SELECT * FROM member WHERE member_name LIKE '____';
