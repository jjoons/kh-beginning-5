-- example.1

# 문제) member테이블에서 id가 qwer인 회원의 이름과 비밀번호 가져오기
SELECT member_id, member_pw FROM member WHERE id = 'qwer';

# 문제) book테이블에서 book_kind가 문학(100)인 책정보 가져오기
# 문학 필드(book_kind)
SELECT * FROM book WHERE book_kind = 100;

# 문제) book테이블에서 가격이 15,000원 이하인 책정보 가져오기
# book_reg_data 필드 이용
SELECT * FROM book WHERE book_price <= 15000;

# 문제) book테이블에서 문학(100)이 아닌 책정보만 가져오기
SELECT * FROM book WHERE book_kind <> 100;

# 문제) book테이블에서 2020년 이전에 등록된 책정보만 가져오기
SELECT * FROM book WHERE YEAR(book_reg_date) <= 2020;

# 문제) book테이블에서 컴퓨터(300)이면서 가격이 15,000원 이상인 책정보 가져오기
SELECT * FROM book WHERE book_kind = 300 AND book_price >= 15000;

# 문제) book테이블에서 재고가 없는 책정보 가져오기
# 주의) 같다는 =이 하나이다!
# book_count필드 이용
SELECT * FROM book WHERE book_count = 0;

# 문제) book테이블에서 문학(100)이거나 컴퓨터(300)인 책정보 가져오기
SELECT * FROM book WHERE book_kind = 100 OR book_kind = 300;

# 문제) book테이블에서 할인률이 없는 책정보 가져오기
# book_discount_rate 필드 이용
SELECT * FROM book WHERE book_discount_rate <= 0;

# 문제) book테이블에서 할인률이 있는 책정보 가져오기
SELECT * FROM book WHERE book_discount_rate > 0;

#문제) 책에 통신이 들어가는 책의 정보 중 저자와 책이름만 가져오기 
SELECT book_author, book_title FROM book;

#문제) 책에 시자로 시작하는 책의 이름과 가격정보만 가져오기
SELECT book_title, book_price FROM book WHERE book_title LIKE '시%';

SELECT * FROM member;

#문제) 멤버테이블에서  q가 포함되어있는 멤버와 책의 가격이 이만원 이상이면 책에 타이틀을 가져온다.
#SELECT book_title FROM member WHERE member_id LIKE '%q%' AND ;
