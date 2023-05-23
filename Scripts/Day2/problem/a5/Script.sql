-- import 5
USE instagram;

-- 댓글을 가장 많이 작성한 유저는?
SELECT COUNT(*) FROM users, comments WHERE comments.user_id = users.id;

-- 사진을 게시한 유저는 모두 몇명?

-- 3번 댓글이 달린 사진은?
SELECT filename FROM photos WHERE comments.photo_id = 3;

-- 3번 댓글을 달린 사람 닉네임은?

-- DROP TABLE comments, photos;
