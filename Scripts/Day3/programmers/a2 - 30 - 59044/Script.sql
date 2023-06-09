-- https://school.programmers.co.kr/learn/courses/30/lessons/59044

USE programmers;

CREATE TABLE c30_l59044_ANIMAL_INS (
    ANIMAL_ID   VARCHAR(50)  NOT NULL,
    ANIMAL_TYPE VARCHAR(50)  NOT NULL,
    DATETIME    DATETIME    NOT NULL,
    INTAKE_CONDITION    VARCHAR(50)  NOT NULL,
    NAME    VARCHAR(50) ,
    SEX_UPON_INTAKE VARCHAR(50)  NOT NULL
);

CREATE TABLE c30_l59044_ANIMAL_OUTS (
    ANIMAL_ID   VARCHAR(50)  NOT NULL REFERENCES c30_l59044_animal_ins(animal_id),
    ANIMAL_TYPE VARCHAR(50)  NOT NULL,
    DATETIME    DATETIME    NOT NULL,
    NAME    VARCHAR(50) ,
    SEX_UPON_OUTCOME    VARCHAR(50)  NOT NULL
);

INSERT INTO C30_L59044_ANIMAL_INS VALUES
    ("A352713", "Cat", "2017-04-13 16:29:00", "Normal", "Gia ", "Spayed Female"),
    ("A350375", "Cat", "2017-03-06 15:01:00", "Normal", "Meo ", "Neutered Male")
;

INSERT INTO C30_L59044_ANIMAL_OUTS VALUES
    ("A349733", "Dog", "2017-09-27 19:09:00", "Allie",   "Spayed Female"),
    ("A352713", "Cat", "2017-04-25 12:25:00", "Gia", "Spayed Female"),
    ("A349990", "Cat", "2018-02-02 14:18:00", "Spice",   "Spayed Female")
;

SELECT * FROM C30_L59044_ANIMAL_INS A
    LEFT JOIN C30_L59044_ANIMAL_OUTS B ON
        A.ANIMAL_ID = B.ANIMAL_ID
    WHERE B.DATETIME IS NULL
    ORDER BY A.DATETIME
    LIMIT 3
;
