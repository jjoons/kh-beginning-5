-- https://school.programmers.co.kr/learn/courses/30/lessons/131115

USE programmers;
CREATE TABLE c30_l131115 (
    PRODUCT_ID VARCHAR(10) NOT NULL,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    PRODUCT_CD VARCHAR(10),
    CATEGORY VARCHAR(10),
    PRICE INT
);

INSERT INTO c30_l131115 VALUES
    ("P0018", "맛있는고추기름", "CD_OL00008", "식용유", 6100),
    ("P0019", "맛있는카놀라유", "CD_OL00009", "식용유", 5100),
    ("P0020", "맛있는산초유", "CD_OL00010", "식용유", 6500),
    ("P0021", "맛있는케첩", "CD_OL00001", "소스", 4500),
    ("P0022", "맛있는마요네즈", "CD_OL00002", "소스", 4700)
;

SELECT product_id, product_name, product_cd, category, price AS price FROM c30_l131115
    GROUP BY product_id, product_name, product_cd, category, price HAVING MAX(price);
