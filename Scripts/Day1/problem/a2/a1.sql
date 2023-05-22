create database Stu;
use Stu;
-- 학생 테이블 생성
CREATE TABLE students (
  id INTEGER,                -- 학생 id
  nickname VARCHAR(50),      -- 닉네임
  math_score INTEGER,        -- 수학 성적
  english_score INTEGER,     -- 영어 성적
  programming_score INTEGER  -- 프로그래밍 성적
);
-- 학생 레코드 추가
INSERT INTO
  students(id, nickname, math_score, english_score, programming_score)
VALUES
  (1, 'Sparkles', 98, 96, 93),
  (2, 'Soldier', 82, 66, 98),
  (3, 'Lapooheart', 84, 70, 82),
  (4, 'Slick', 87, 99, 98),
  (5, 'Smile', 75, 73, 70),
  (6, 'Jellyboo', 84, 82, 70),
  (7, 'Bagel', 97, 91, 87),
  (8, 'Queen', 99, 100, 88)
;


select * from students;


/*

모든 과목 성적이 다 90점 이상인 학생 정보
75점 미만 과목이 하나라도 있는 학생 정보

모든 학생별 정보와 성적 총점
모든 학생별 정보와 성적 평균
총점이 270 이상인 학생의 닉네임, 성적 총점, 성적 평균
*/

SELECT * FROM students WHERE math_score >= 90 AND english_score >= 90 AND programming_score >= 90;

SELECT * FROM students WHERE math_score < 75 OR english_score < 75 OR programming_score < 75;

SELECT nickname, math_score + english_score + programming_score, (math_score + english_score + programming_score) / 3 FROM students
WHERE math_score + english_score + programming_score >= 270;
