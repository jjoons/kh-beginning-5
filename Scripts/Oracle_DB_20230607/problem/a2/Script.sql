SELECT
    student_no, MAX(point) point
FROM tb_grade
WHERE class_no = 'C3118100'
    AND term_no = '200402'
GROUP BY student_no
ORDER BY point DESC, student_no
;

SELECT s.student_no, s.student_name, d.department_name FROM tb_student s, (
    SELECT department_no, department_name FROM tb_department
) d
WHERE s.department_no = d.department_no
ORDER BY s.student_name
;

