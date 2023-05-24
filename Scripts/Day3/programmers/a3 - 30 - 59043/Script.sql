-- https://school.programmers.co.kr/learn/courses/30/lessons/59043

SELECT
    a.animal_id AS ANIMAL_ID,
    a.name AS NAME FROM animal_ins a
    JOIN animal_outs b ON a.animal_id = b.animal_id
    WHERE a.datetime > b.datetime
    ORDER BY a.datetime
;
