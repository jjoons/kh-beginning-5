-- import example_table/2.sql
USE day5_2;

-- 1
SELECT
    *
FROM (
    SELECT student_id, course_id, exam_score, grade FROM grades
) g
ORDER BY g.exam_score DESC
;

-- 2
SELECT c.title "과목명",
    ROUND(AVG(g.exam_score), 2) "평균 시험점수"
FROM grades g JOIN (
    SELECT * FROM courses
) c ON c.id = g.course_id
GROUP BY c.title
;


-- 3
SELECT
    s.nickname "닉네임",
    ROUND(AVG(p.point), 2) AS "평균 학점"
FROM (
    SELECT student_id, grade FROM grades
) g
JOIN (
    SELECT * FROM grade_points gp
) p ON p.grade = g.grade
JOIN students s ON s.id = g.student_id
GROUP BY s.nickname
HAVING `평균 학점` < 3.5
;


-- 4
SELECT
    cp.title '강의명',
    ROUND(AVG(cp.point), 2) AS '평균 학점'
FROM (
    SELECT ct.title, pt.point FROM grades gt
    JOIN grade_points pt ON pt.grade = gt.grade
    JOIN courses ct ON ct.id = gt.course_id
) cp
GROUP BY cp.title
ORDER BY `평균 학점` DESC
LIMIT 3
;
