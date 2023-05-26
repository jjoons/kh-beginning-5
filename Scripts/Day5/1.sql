-- 서브쿼리 (sub query)
--   쿼리 속에 다른 쿼리가 들어가 있다 (ALTER)
--   서브쿼리는 먼저 수행된 쿼리 결과를 가지고 다시 쿼리를 수행할 때 사용한다

-- 서브쿼리 실행 순서
--   서브쿼리 먼저 실행된 다음 메인(부모) 쿼리 실행

-- 서브쿼리를 작성할 때 "()" 안에 들어가 있는 쿼리를 서브쿼리라고 한다
-- 서브쿼리(=자식쿼리, 내부쿼리): 메인 쿼리 컬럼 사용 가능
-- 메인쿼리(=부모쿼리, 외부쿼리): 서브 쿼리 컬럼 사용 불가능

-- 서브쿼리가 자바의 상속 개념과 비슷하다

-- 서브쿼리를 사용할 수 있는 키워드
--   SELECT: 스칼라 서브 쿼리: 하나의 컬럼처럼 사용 표현 용도
--   FROM: 인라인 뷰: 하나의 테이블처럼 사용
--   WHERE: 일반 서브쿼리: 하나의 변수(상수)처럼 사용
--   JOIN

CREATE DATABASE sub_query_test;
USE sub_query_test;

CREATE TABLE employee (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64),
  salary INT,
  office_worker VARCHAR(64)
);

INSERT INTO employee VALUES(1,'허사장',20000000,'사장');

INSERT INTO employee (name,salary,office_worker) VALUES('유부장',10000000,'부장');
INSERT INTO employee (name,salary,office_worker) VALUES('박차장',5000000,'차장');
INSERT INTO employee (name,salary,office_worker) VALUES('정과장',4000000,'과장');
INSERT INTO employee (name,salary,office_worker) VALUES('정대리',3895000,'대리');
INSERT INTO employee (name,salary,office_worker) VALUES('노사원',2500000,'사원');
INSERT INTO employee (name,salary,office_worker) VALUES('하사원',2000000,'사원');
INSERT INTO employee (name,salary,office_worker) VALUES('길인턴',1000000,'인턴');

select * from employee;

-- WHERE 절에서 서브쿼리를 사용할 때
-- 단일 행

-- 정대리라는 사람의 직급 구하기

SELECT office_worker
FROM employee
WHERE office_worker = (
    SELECT office_worker
    FROM employee
    WHERE name = '정대리'
)
;

-- 정대리보다 급여가 높은 사람들 찾기
SELECT * FROM employee
WHERE salary > (
    SELECT salary FROM employee WHERE name = '정대리'
)
;

-- 직급이 사원인 사람들 찾기
SELECT * FROM employee
WHERE office_worker IN (
    SELECT office_worker FROM employee
    WHERE office_worker = '사원'
);

-- IN: 서브쿼리의 결과에 존재하는 임의의 값과 동일한 조건을 의미한다
-- ALL: 서브쿼리의 결과에 존재하는 모든 값을 만족한다
-- ANY: 서브쿼리의 결과에 존재하는 어느 하나라도 만족하는 조건이다


-- 인라인 뷰 (Inline view)
--   키워드 AS
--   파생 테이블에는 별칭을 정해야 한다
--     FROM 절에서 서브쿼리를 사용할 때

-- 직급이 사원인 사람들의 이름과 급여 구하기
SELECT name, salary
FROM (
    SELECT name, salary FROM employee e1
    WHERE e1.office_worker = '사원'
) AS e
;

-- FROM 절에서 나온 테이블의 결과에 별칭을 달지 않으면 오류가 발생할 수 있다

-- 스칼라 서브쿼리 (scalar subquery)
-- 정대리의 급여와 테이블 전체 평균 급여 구하기
SELECT name, salary, (
    SELECT ROUND(AVG(salary), -1) FROM employee
) AS '평균 급여'
FROM employee
WHERE name = '정대리'
;


create table table2(
    id int ,
    pw int
);

create table table1(
    id int auto_increment primary key,
    pw int
);

-- INSERT INTO 문에도 서브쿼리를 적용할 수 있음
INSERT INTO table1(pw) VALUES(1111);
INSERT INTO table2(pw) VALUES(2222);

-- 테이블2의 정보를 뽑아서 그 데이터를 테이블1에 넣어준다
INSERT INTO table1 (
    SELECT * FROM table2
);

SELECT * FROM table1;
