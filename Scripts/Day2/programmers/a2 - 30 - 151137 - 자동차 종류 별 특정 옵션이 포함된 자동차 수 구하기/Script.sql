-- https://school.programmers.co.kr/learn/courses/30/lessons/151137

USE programmers;

CREATE TABLE c30_l151137 (
	CAR_ID	INTEGER	,
    /*
    '세단', 'SUV', '승합차', '트럭', '리무진'
    */
CAR_TYPE	VARCHAR(255)	,
DAILY_FEE	INTEGER	,
-- '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트'
OPTIONS	VARCHAR(255)	
);

INSERT INTO c30_l151137 VALUES
(1, '세단', 16000, '가죽시트,열선시트,후방카메라'),
(2, 'SUV', 14000, '스마트키,네비게이션,열선시트'),
(3, 'SUV', 22000, '주차감지센서,후방카메라'),
(4, '트럭', 35000, '주차감지센서,네비게이션,열선시트'),
(5, 'SUV', '16000', '가죽시트,네비게이션,열선시트,후방카메라,주차감지센서');

SELECT DISTINCT car_type, COUNT(*) AS 'cars' FROM c30_l151137
	WHERE options LIKE '%통풍시트%'
		OR options LIKE '%열선시트%'
		OR options LIKE '%가죽시트%'
    GROUP BY car_type ORDER BY car_type;
