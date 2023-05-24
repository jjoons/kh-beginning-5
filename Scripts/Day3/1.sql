SET SQL_SAFE_UPDATES = 0;
USE instagram;

DROP TABLE likes;
DROP TABLE comments;
DROP TABLE photos;
DROP TABLE users;

-- JOIN
--   여러 테이블에서 가져온 레코드를 조합하여 하나의 테이블로 결과 집합
--   INNER, LEFT, RIGHT, FULL
--     조인하는 테이블의 ON 절 조건이 일치하는 결과만 출력
--     FROM 절에 콤마를 사용하면 INNER JOIN으로 인식한다
--     조인할 때 조건이 일치하지 않으면, null 값이 있을 경우에는 데이터를 가져오지 않는다

-- users 테이블
CREATE TABLE users (
  id       int AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50),
  email    VARCHAR(100)
);
-- photos 테이블
CREATE TABLE photos (
  id       int AUTO_INCREMENT PRIMARY KEY,
  filename VARCHAR(255),
  user_id  INTEGER       REFERENCES users(id)
);
-- comments 테이블
CREATE TABLE comments (
  id       int AUTO_INCREMENT PRIMARY KEY,
  body     VARCHAR(1000),
  user_id  INTEGER        REFERENCES users(id),
  photo_id INTEGER        REFERENCES photos(id)
);
-- settings 테이블
CREATE TABLE settings (
  id           int AUTO_INCREMENT PRIMARY KEY,
  private       BOOLEAN,
  adding_photos VARCHAR(15),
  user_id       INTEGER      UNIQUE REFERENCES users(id)
);
-- likes 테이블 생성(사용자와 사진을 다대다 연결)
CREATE TABLE likes (
  id       int AUTO_INCREMENT PRIMARY KEY,
  user_id  INTEGER REFERENCES users(id),
  photo_id INTEGER REFERENCES photos(id)
);


-- users 레코드
INSERT INTO
  users(nickname, email)
VALUES
  ('cloudstudying_kr', 'mail@cloudstudying.kr'),
  ('hongpark_cs',      'sehongpark@cloudstudying.kr'),
  ('haesamq',          'haesamq@naver.com')
;
-- photos 레코드
INSERT INTO
  photos(filename, user_id)
VALUES
  ('cat-on-road.jpg',           1),
  ('sunset-over-the-ocean.jpg', 1),
  ('andromeda-galaxy.jpg',      1),
  ('white-tiger.jpg',           2),
  ('nero-the-black-cat.jpg',    2),
  ('deleted-image.jpg',         NULL),
  ('blocked-image.jpg',         NULL)
;
-- comments 레코드
INSERT INTO
  comments(body, user_id, photo_id)
VALUES
  ('meow',             1, 1),
  ('nyaong',           2, 1),
  ('냐옹',              3, 1),
  ('sunset',           1, 2),
  ('falling slowly',   2, 2),
  ('Andromeda galaxy', 1, 3),
  ('mysteriouse..!',   3, 3),
  ('wow..!',           3, NULL),
  ('oh..!',            3, NULL)
;
-- settings 레코드
INSERT INTO
  settings(private, adding_photos, user_id)
VALUES
  (FALSE, 'MANUAL', 1),
  (FALSE, 'AUTO',   2),
  (TRUE,  'AUTO',   3)
;
-- likes 레코드
INSERT INTO
  likes(user_id, photo_id)
VALUES
  (1,    1),
  (2,    1),
  (1,    2),
  (2,    2),
  (3,    2),
  (1,    3),
  (3,    3),
  (NULL, 6),
  (NULL, 7)
;

SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;
SELECT * FROM settings;
SELECT * FROM likes;

-- 사진이 첫번째로 달린 모든 댓글 내용과 작성자 닉네임 조회
SELECT comments.body, users.nickname
    FROM comments -- 1. 댓글 테이블 가져오기
    JOIN users -- 2. 연결할 테이블
        ON users.id = comments.user_id
    WHERE comments.photo_id = 1; -- 3. 연결한 테이블에서 조건


-- 사진 5번째의 파일명과 사진 게시자의 닉네임 조회하기
--   1. FROM을 이용해서 테이블 가져오기
--   2. JOIN 연결할 테이블
--   3. ON 조건에 맞는 테이블 선택
--   4. 원하는 정보를 SELECT로 출력
SELECT photos.filename, users.nickname FROM photos JOIN users ON users.id = photos.user_id WHERE photos.id = 5;

-- 사진 2번 좋아요를 누른 사용자의 닉네임과 대상 사진의 파일명
-- 여러개를 적는다. JOIN ON IF문처럼 붙이기
SELECT users.nickname, photos.filename FROM likes
    JOIN users ON users.id = likes.user_id
    JOIN photos ON photos.id = likes.photo_id
    WHERE photos.id = 2;

