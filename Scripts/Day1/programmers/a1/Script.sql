-- https://school.programmers.co.kr/learn/courses/30/lessons/164672

CREATE DATABASE programmers;
USE programmers;

CREATE TABLE USED_GOODS_BOARD (
    BOARD_ID VARCHAR(5),
    WRITER_ID VARCHAR(50),
    TITLE VARCHAR(100),
    CONTENTS VARCHAR(1000),
    PRICE INT,
    CREATED_DATE DATE,
    STATUS VARCHAR(10)
);
