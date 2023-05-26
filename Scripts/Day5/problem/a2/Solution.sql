USE day5_2;

SELECT * FROM grades;
SELECT * FROM students;
SELECT * FROM grade_points;
SELECT * FROM courses;

-- 1
SELECT
    students.nickname, courses.title, grades.exam_score, grade_points.grade,
    grade_points.point
FROM students
JOIN grades ON grades.student_id = students.id
JOIN courses ON courses.id = grades.course_id
JOIN grade_points ON grade_points.grade = grades.grade
WHERE (students.nickname, courses.title, grades.exam_score, grades.grade, grade_points.point) IN (
    ('홍팍', '프로그래밍', 80, 'A0', 4.0),
    ('라이언', '프로그래밍', 79, 'B+', 3.5),
    ('젤리', '대학 수학', 68, 'C+', 2.5),
    ('알파고', '영작문', 91, 'A+', 5.0)
)
;


-- 2
-- 강의 테이블과 집계 결과를 이용해서 구하기
SELECT
    c.title AS "타이틀",
    avg_exam_score.round AS "평균 시험점수"
FROM courses c
JOIN (
    SELECT course_id,
        ROUND(AVG(exam_score), 2) AS round
    FROM grades
    GROUP BY course_id
) avg_exam_score ON
    avg_exam_score.course_id = c.id
;


-- 3
SELECT
    g.student_id,
    ROUND(AVG(p.point), 2) AS ROUND
FROM grades g
JOIN grade_points p ON
    g.grade = p.grade
GROUP BY g.student_id
HAVING AVG(p.point) < 3.5
;


-- 4
SELECT 
    courses.title,
    round(AVG(grade_points.point), 2) AS ROUND
    
FROM
    courses
JOIN    grades ON 
    courses.id = grades.course_id

JOIN    grade_points ON 
	grades.grade = grade_points.grade
GROUP BY 
	courses.title
ORDER BY 
	ROUND DESC
LIMIT 
	3;
