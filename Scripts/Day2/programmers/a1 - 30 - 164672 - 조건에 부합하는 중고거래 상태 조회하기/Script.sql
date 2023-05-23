-- https://school.programmers.co.kr/learn/courses/30/lessons/164672

USE programmers;

CREATE TABLE l164672 (
	BOARD_ID	VARCHAR(5),
	WRITER_ID	VARCHAR(50),
	TITLE	VARCHAR(100),
	CONTENTS	VARCHAR(1000),
	PRICE	INT, -- NUMBER
	CREATED_DATE	DATE,
	STATUS	VARCHAR(10),
	VIEWS	INT -- NUMBER	
);

INSERT INTO l164672 VALUES
('B0007', 's2s2123', '커피글라인더', '새상품처럼 깨끗합니다.', 7000, '2022-10-04', 'DONE', 210),
('B0008', 'hong02', '자전거 판매합니다', '출퇴근용으로 구매했다가 사용하지 않아서 내놔요', 40000, '2022-10-04', 'SALE', 301),
('B0009', 'yawoong67', '선반 팝니다', '6단 선반. 환불 반품 안됩니다.', 12000, '2022-10-05', 'DONE', 202),
('B0010', 'keel1990', '철제선반5단', '철제선반 5단 조립식 팜', 10000, '2022-10-05', 'SALE', 194);

SELECT board_id, writer_id, title, price,
		CASE
			WHEN status = 'SALE' THEN '판매중'
			WHEN status = 'RESERVED' THEN '예약중'
			WHEN status = 'DONE' THEN '거래완료'
		END AS 'status'
	FROM l164672 WHERE CREATED_DATE = '2022-10-05' ORDER BY board_id DESC;
