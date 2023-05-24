USE day3_shopping;

SELECT
    prod.name AS "상품명",
    prod.price AS "가격",
    SUM(od.count) AS "누적 판매량",
    SUM(prod.price * od.count) AS "누적 매출"
    FROM order_details od
    JOIN orders o ON
        o.id = od.order_id
    JOIN payments pay ON
        pay.order_id = od.order_id
    JOIN products prod ON
        prod.id = od.product_id
    GROUP BY prod.name, prod.price
    HAVING SUM(prod.price * od.count) >= 35000
    ORDER BY prod.name
    ;

SELECT
    prod.name AS "상품명",
    prod.price AS "가격",
    SUM(od.count) AS "누적 판매량",
    SUM(prod.price * od.count) AS "누적 매출"
    FROM order_details od
    JOIN orders o ON
        o.id = od.order_id
    JOIN payments pay ON
        pay.order_id = od.order_id
    JOIN products prod ON
        prod.id = od.product_id
    GROUP BY prod.name, prod.price
    HAVING SUM(prod.price * od.count) >= 20000
        AND SUM(od.count) >= 10
    ORDER BY prod.name
    ;
