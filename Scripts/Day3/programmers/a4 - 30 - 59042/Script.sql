-- https://school.programmers.co.kr/learn/courses/30/lessons/59042

SELECT
    b.animal_id AS ANIMAL_ID,
    b.name AS ANIMAL_NAME
    FROM animal_ins a
    RIGHT JOIN animal_outs b ON a.animal_id = b.animal_id
    WHERE a.animal_id IS NULL
    ;
