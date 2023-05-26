CREATE DATABASE IF NOT EXISTS day5_2;
USE day5_2;

CREATE TABLE IF NOT EXISTS students (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS grades (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED REFERENCES students(id)
);

CREATE TABLE IF NOT EXISTS courses (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS grade_points (
    grade VARCHAR(255) PRIMARY KEY,
    point DECIMAL(2, 1)
);
ALTER TABLE grades
    ADD COLUMN course_id INT UNSIGNED REFERENCES courses(id),
    ADD COLUMN exam_score INT UNSIGNED,
    ADD COLUMN grade VARCHAR(255) REFERENCES grade_points(grade);

/* 레코드 등록 */
-- 학생
INSERT INTO
  students(nickname)
VALUES
  ('홍팍'),
  ('쿠마'),
  ('호크'),
  ('젤리'),
  ('알파고'),
  ('베이글'),
  ('라이언')
;
-- 과목
INSERT INTO
  courses(title)
VALUES
  ('프로그래밍'),
  ('대학 수학'),
  ('영작문'),
  ('글쓰기'),
  ('물리와 실험'),
  ('사고와 표현'),
  ('공학 윤리')
;
-- 등급 점수
INSERT INTO
  grade_points(grade, point)
VALUES
  ('A+', 4.5),
  ('A0', 4.0),
  ('B+', 3.5),
  ('B0', 3.0),
  ('C+', 2.5),
  ('C0', 2.0),
  ('D0', 1.5),
  ('F',  0.0)
;
-- 수강성적
INSERT INTO
  grades(student_id, course_id, exam_score, grade)
VALUES
  (1, 1, 90,  'A0'),
  (2, 1, 97,  'A+'),
  (3, 1, 100, 'A+'),
  (4, 1, 98,  'A+'),
  (5, 1, 64,  'D0'),
  (6, 1, 81,  'B+'),
  (7, 1, 79,  'B+'),
  (1, 2, 88,  'A0'),
  (2, 2, 99,  'A+'),
  (3, 2, 82,  'B+'),
  (4, 2, 68,  'C+'),
  (5, 2, 76,  'B0'),
  (6, 2, 63,  'C0'),
  (7, 2, 71,  'C+'),
  (1, 3, 76,  'B+'),
  (2, 3, 72,  'B+'),
  (3, 3, 79,  'B+'),
  (4, 3, 83,  'A0'),
  (5, 3, 91,  'A+'),
  (6, 3, 69,  'B0'),
  (7, 3, 84,  'A0'),
  (1, 4, 90,  'A0'),
  (2, 4, 82,  'B+'),
  (3, 4, 88,  'A0'),
  (4, 4, 99,  'A+'),
  (5, 4, 68,  'C+'),
  (6, 4, 94,  'A+'),
  (7, 4, 60,  'C0'),
  (1, 5, 66,  'B0'),
  (2, 5, 78,  'A0'),
  (3, 5, 73,  'B+'),
  (4, 5, 84,  'A+'),
  (5, 5, 76,  'A0'),
  (6, 5, 84,  'A+'),
  (7, 5, 71,  'B+'),
  (1, 6, 79,  'B+'),
  (2, 6, 89,  'A0'),
  (3, 6, 96,  'A+'),
  (4, 6, 82,  'B+'),
  (5, 6, 91,  'A0'),
  (6, 6, 100, 'A+'),
  (7, 6, 70,  'C+'),
  (1, 7, 99,  'A+'),
  (2, 7, 94,  'A0'),
  (3, 7, 60,  'C0'),
  (4, 7, 68,  'C+'),
  (5, 7, 75,  'B0'),
  (6, 7, 81,  'B0'),
  (7, 7, 89,  'B+')
;
