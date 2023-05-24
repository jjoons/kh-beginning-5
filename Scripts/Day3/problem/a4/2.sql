USE day3_shopping;

SELECT
    prod.name AS "상품명",
    prod.price AS "가격",
    SUM(od.count) AS "누적 판매량",
    SUM(p.amount) AS "누적 매출"
    FROM order_details od
    LEFT JOIN payments p ON
        p.order_id = od.order_id
    JOIN products prod ON
        prod.id = od.product_id
    JOIN orders o ON
        o.id = od.order_id
    JOIN users u ON
        u.id = o.user_id
    WHERE p.order_id IS NULL
    GROUP BY prod.name, prod.price
    ORDER BY prod.price;


SELECT
    *
    FROM products pr
    ;
