-- https://school.programmers.co.kr/learn/courses/30/lessons/131536

USE programmers;
CREATE TABLE c30_l131536 (
	ONLINE_SALE_ID	INTEGER	,
	USER_ID	INTEGER	,
	PRODUCT_ID	INTEGER	,
	SALES_AMOUNT	INTEGER	,
	SALES_DATE	DATE
);

INSERT INTO c30_l131536 VALUES
(1, 1, 3, 2, '2022-02-25'),
(2, 1, 4, 1, '2022-03-01'),
(4, 2, 4, 2, '2022-03-12'),
(3, 1, 3, 3, '2022-03-31'),
(5, 3, 5, 1, '2022-04-03'),
(6, 2, 4, 1, '2022-04-06'),
(2, 1, 4, 2, '2022-05-11');

SELECT user_id, product_id FROM c30_l131536;
SELECT user_id, product_id FROM c30_l131536 GROUP BY user_id, product_id HAVING COUNT(*) > 1;
