CREATE DATABASE instagram;
USE instagram;

-- 이메일, 닉네임, id
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY, -- pk 선언
    email VARCHAR(100),
    nickname VARCHAR(50)
);

INSERT INTO users(email, nickname) VALUES
('a@example.com', '예시a'),
('jjoons@jjoons.com', 'JJoonS'),
('fofo@gmail.com', '뽀로로');

SELECT * FROM users;

CREATE TABLE photos (
	id INT AUTO_INCREMENT PRIMARY KEY, -- pk 선언
    filename VARCHAR(255),
    -- user에 대한 정보도 같이 작성
    -- FK: 사진 게시자의 pk로 연결
	-- FOREIGN KEY 
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

SELECT * FROM photos;

INSERT INTO photos(filename, user_id) VALUES
('cat.png', 1),
('dog.png', 1),
('cat2.png', 1),
('cat3.png', 2),
('dog3.png', 3),
('cat2.png', 3);

SELECT * FROM photos;

-- 필드명 타입 작성: REFERENCES 연결할_테이블명(필드명)

-- 게시글 좋아요
CREATE TABLE comments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    body VARCHAR(1000),
    -- FK: 댓글 작성자, 댓글이 달린 사진
    user_id INT,
    photo_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

DROP TABLE comments;

INSERT INTO comments(body, user_id, photo_id) VALUES
-- 1번 사진의 댓글들
('야옹', 1, 1),
('nyaong', 2, 1),
('뭐지?', 3, 1),
-- 2번 사진의 댓글들
('sunset', 1, 2),
('뭐지?왜이래', 3, 2),
-- 3번 사진의 댓글들
('덥다', 1, 3);

SELECT * FROM comments;

