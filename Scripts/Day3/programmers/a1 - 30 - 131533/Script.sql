-- https://school.programmers.co.kr/learn/courses/30/lessons/131533

USE programmers;

CREATE TABLE c30_l131533_product (
    PRODUCT_ID	INTEGER	NOT NULL,
    PRODUCT_CODE	VARCHAR(8)	NOT NULL,
    PRICE	INTEGER	NOT NULL
);

INSERT INTO c30_l131533_product VALUES
(1, "A1000011", 15000),
(2, "A1000045", 8000),
(3, "C3000002", 42000)
;

CREATE TABLE c30_l131533_offline_sale (
    OFFLINE_SALE_ID	INTEGER	NOT NULL,
    PRODUCT_ID	INTEGER	NOT NULL,
    SALES_AMOUNT	INTEGER	NOT NULL,
    SALES_DATE	DATE	NOT NULL
);

INSERT INTO c30_l131533_offline_sale VALUES
(1, 1, 2, "2022-02-21"),
(2, 1, 2, "2022-03-02"),
(3, 3, 3, "2022-05-01"),
(4, 2, 1, "2022-05-24"),
(5, 1, 2, "2022-07-14"),
(6, 2, 1, "2022-09-22")
;

SELECT *
    FROM c30_l131533_offline_sale
    JOIN c30_l131533_product ON c30_l131533_product.product_id = c30_l131533_offline_sale.product_id;

SELECT
    c30_l131533_product.product_code,
    SUM(c30_l131533_product.price * c30_l131533_offline_sale.SALES_AMOUNT) AS sales
    FROM c30_l131533_offline_sale
    JOIN c30_l131533_product ON c30_l131533_product.product_id = c30_l131533_offline_sale.product_id
    GROUP BY c30_l131533_product.product_code
    ORDER BY sales DESC, c30_l131533_product.product_code;
