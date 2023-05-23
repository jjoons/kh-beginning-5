-- https://school.programmers.co.kr/learn/courses/30/lessons/59047

USE programmers;

CREATE TABLE c30_l59047 (
  ANIMAL_ID VARCHAR(10) NOT NULL,
  ANIMAL_TYPE VARCHAR(10) NOT NULL,
  DATETIME DATETIME NOT NULL,
  INTAKE_CONDITION VARCHAR(10) NOT NULL,
  NAME VARCHAR(20),
  SEX_UPON_INTAKE VARCHAR(30) NOT NULL
);

INSERT INTO c30_l59047 VALUES
("A355753", "Dog", "2015-09-10 13:14:00", "Normal", "Elijah", "Neutered Male"),
("A352872", "Dog", "2015-07-09 17:51:00", "Aged", "Peanutbutter", "Neutered Male"),
("A353259", "Dog", "2016-05-08 12:57:00", "Injured", "Bj", "Neutered Male"),
("A373219", "Cat", "2014-07-29 11:43:00", "Normal", "Ella", "Spayed Female"),
("A382192", "Dog", "2015-03-13 13:14:00", "Normal", "Maxwell 2", "Intact Male")
;

SELECT animal_id, name FROM c30_l59047 WHERE LOWER(name) LIKE LOWER("%el%") AND animal_type = "Dog";
