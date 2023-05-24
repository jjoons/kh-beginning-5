-- HAVING: 분류된 그룹 중 특정 조건을 만족하는 것만 가져오기
--   그룹이 꼭 되어있어야 한다

-- LIMIT: 조회 개수 제한
--   정렬이랑 같이 쓰이는 경우가 많다. 가져올 레코드(필드) 수를 제한하는 키워드

USE day3_shopping;
SELECT * FROM payments;

SELECT
    ptype AS "결제 수단",
    ROUND(AVG(amount), 2) AS "평균 결제금액"
    FROM payments
    GROUP BY ptype
    HAVING AVG(amount) >= 36000
    ;


-- 상품명과 가격을 기준으로 누적 판매 정보(판매량, 매출)를 조회한다
SELECT
    products.name AS "상품명",
    products.price AS "가격",
    SUM(order_details.count) AS "누적 판매량",
    SUM(products.price * order_details.count) AS "누적 매출"
    FROM products
    LEFT JOIN order_details od ON
        od.product_id = products.id
    GROUP BY products.name, products.price
    ;
