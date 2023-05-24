USE instagram;

-- LEFT 조인
--   좌측 테이블 데이터에 추가로 우측 정보를 조인하는 문법이다
--   순서에 따라서 조회되는 행과 구성 등이 달라질 수 있기 때문에 순서가 중요하다
--   첫번째 테이블로 SELECT문에 가장 많은 열을 가져와야 할 테이블을 우선적으로 적어준다
--   테이블을 우선적으로 적는다
--   좌측 테이블 기준으로 다 가지고 오며, 우측 테이블에는 조건이 일치하는 값만 가져온다

-- RIGHT 조인
--   우측 테이블 데이터에 추가로 왼쪽 정보를 조인하는 문법

-- 조인할 때 데이터가 없으면 null 값으로 채운다

-- 3중 조인
--   원하는 정보가 테이블 3개로 흩어져있을 때 OUTER JOIN을 연속으로 3번 사용하는 것도 좋다

-- 모든 사진의 "파일명"을 조회하고 게시자 "닉네임"은 옵션
SELECT photos.filename, users.nickname FROM photos
    LEFT JOIN users ON users.id = photos.user_id;

-- 모든 댓글의 "내용" 조회, 댓글이 달린 사진 "파일명"은 옵션
SELECT comments.body, photos.filename FROM comments 
    LEFT JOIN photos ON photos.user_id = comments.photo_id;
