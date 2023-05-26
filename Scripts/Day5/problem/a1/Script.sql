# import example_table/1.sql

USE day5_1;

#음료(beverages)의 이름 및 가격과 함께, 가장 비싼 음료와의 가격 차이를 조사하려 한다.
#주어진 두 쿼리를 조합하여 이를 구하시오. (SELECT 절 서브쿼리를 사용할 것)
SELECT name "음료명", price "가격", (
    SELECT - MAX(price)
    FROM beverages
) + price AS '최대 가격과의 차이' FROM beverages;


#주문내역(order_details)로부터 주문 별 음료 개수의 평균을 조회하려 한다.
#주어진 쿼리를 조합하여 이를 구하시오. (FROM 절 서브쿼리를 사용할 것)
SELECT AVG(t1.average) "주문별 음료 개수 평균" FROM (
    SELECT order_id, AVG(count) average
    FROM order_details
    GROUP BY order_id
) AS t1;

#주문내역(order_details)로부터 음료 별 주문 개수를 조회하려 한다.
# 주어진 두 쿼리를 조합하여 이를 구하시오. (JOIN 절 서브쿼리를 활용할 것)
SELECT b.name "음료명", SUM(d.count) "주문개수"
FROM order_details d
RIGHT JOIN (
    SELECT id, name
    FROM beverages
) b ON b.id = d.beverage_id
GROUP BY b.id
;

#평균 가격보다 비싼 음료(beverages)를 다음과 같이 조회하려 한다.
#주어진 두 쿼리를 조합하여 이를 구하시오. (WHERE 절 서브쿼리를 사용할 것)
SELECT name, price FROM beverages b
WHERE b.price > (
    SELECT AVG(price) FROM beverages b2
);
