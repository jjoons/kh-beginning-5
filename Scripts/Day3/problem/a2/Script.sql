-- import Day1/example/1

-- db2_book_store 데이터베이스가 존재하는지 확인
USE db2_book_store;

# 문제) cart테이블에서 buyer의 이름과 cart의 가격 가져오기
SELECT buyer, buy_price FROM cart;

# 문제) cart테이블에서 회원이 구매한 도서의 할인되기 전의 가격과 할인율 가져오기
SELECT book.book_price, book.book_discount_rate FROM cart
    JOIN book ON cart.book_no = book.book_no;

# 문제) cart테이블에서 회원이 구매한 도서의 할인되기 전의 가격이 2만원 이상인 도서정보와 할인율 가져오기
SELECT book.book_title, book.book_discount_rate FROM cart
    JOIN book ON cart.book_no = book.book_no
    WHERE book.book_price >= 20000;
