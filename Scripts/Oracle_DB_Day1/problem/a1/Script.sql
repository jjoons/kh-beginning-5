CREATE TABLE user_tb_category (
    -- id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR2(10),
    use_yn CHAR(1) DEFAULT 'Y'
);

CREATE TABLE user_tb_class_type (
    no VARCHAR2(5) PRIMARY KEY,
    name VARCHAR2(10)
);

ALTER TABLE user_tb_category ADD PRIMARY KEY(name);

ALTER TABLE user_tb_class_type MODIFY name NOT NULL;

ALTER TABLE user_tb_class_type MODIFY no VARCHAR2(10);
ALTER TABLE user_tb_class_type MODIFY name VARCHAR2(20);
ALTER TABLE user_tb_category MODIFY name VARCHAR2(20);

ALTER TABLE user_tb_category RENAME COLUMN name TO category_name;
ALTER TABLE user_tb_class_type RENAME COLUMN name TO class_type_name;
ALTER TABLE user_tb_class_type RENAME COLUMN no TO class_type_no;

ALTER TABLE user_tb_category RENAME COLUMN category_name TO pk_category_name;
ALTER TABLE user_tb_class_type RENAME COLUMN class_type_no TO pk_class_type_no;

INSERT ALL
    INTO user_tb_category VALUES ('공학', 'Y')
    INTO user_tb_category VALUES ('자연과학', 'Y')
    INTO user_tb_category VALUES ('의학', 'Y')
    INTO user_tb_category VALUES ('예체능', 'Y')
    INTO user_tb_category VALUES ('인문사회', 'Y')
    SELECT * FROM DUAL
;
COMMIT;

ALTER TABLE tb_department ADD fk_department_category VARCHAR2(10);
