-- 홍팍이의 모든 주문 목록은?

select 
	*
from 
	users
join orders on
	orders.user_id = users.id
    
where 
	users.nickname = '홍팍';

-- 홍팍이의 모든 주문 횟수는 ?
select 
	count(*)
    
from 
	users
    
join orders on 
	orders.user_id = user.id
    
where 
	users.nickname ='홍팍'
;

-- 3번 문제 각각의 테이블에서 users 테이블과 orders테이블을 먼저 조인해서 
-- 결제 금액은 payments에 있으니 3개의 테이블을 연결해서 데이터를 가지고 와야된다. 
 
select 
	users.nickname as "주문자명",
    orders.id as "주문번호" ,
    payments.amount as "결제 금액" # 우선 전체적으로 확인 해보고 원하는 내용만 가지고 오기
    
from 
	users
    
join orders on 
	orders.user_id = users.id
    and
    users.nickname ='홍팍'
left join payments on 
	payments.order_id = orders.id
;