-- PL/SQL
--   SQL 문장에서 변수, 조건 처리 (if, 반복문 while, for) 등을 지원
--   SQL에서 프로그래밍 언어를 작성할 수 있게 함

-- 변수나 상수를 선언하는 부분

-- 선언부
-- DECLARE SECTION

-- 실행부
-- EXECUTABLE SECTION
--   if 문, while 함수 정의


-- 예외처리부
-- EXCEPTION SECTION
--   예외적인 상황 발생 시 해결하기 위한 문장

-- 프로시저를 사용하여 출력하는 내용을 화면에 보여주게 함
-- 기본값은 "off"로 되어있으며 사용하려면 "on"으로 설정해야 함
SET serveroutput ON;

--BEGIN
--    -- PUT_LINE이라는 프로시저를 이용하여 출력
--    -- DBMS_OUTPUT 패키지에 속해 있음
--    DBMS_OUTPUT.put_line('Hello world');
--END;

-- 기본 특성
--   블록 단위의 실행을 제공한다
--   "BEGIN"과 "END"를 사용한다
--   마지막 라인에 "/"를 입력하면 해당 블록이 실행된다
--   커서를 사용하여 여러 행을 검색하거나 처리

-- 블록의 종류 (block)
--   - 익명 블록: 이름이 없는 PL/SQL Block
--   - 이름이 있는 블록: DB의 객체로 저장되는 블록
--   - 프로시저: 리턴값을 하나 이상 가질 수 있는 프로그램
--   - 함수: 리턴값을 반드시 반환해야 하는 프로그램
--   - 패키지: 하나 이상의 프로시저, 함수, 변수, 예외 등의 묶음을 말한다
--   - 트리거: 지정된 이벤트가 발생하면 자동으로 실행되는 PL/SQL 블록

-- 변수 선언 시 :=
-- 변수명 데이터타입 := 초기값;
-- VAL_NUM NUMBER := 1;
-- VAL_STR CHAR(3) := 'AA';

-- 상수 선언
-- 상수명 constrant 데이터타입 := 상수값;
--DECLARE
--    EMP_ID NUMBER;
--    EMP_NAME VARCHAR2(30);
--    VAR_NUM CONSTANT NUMBER := 1; -- 상수 선언
--BEGIN
--    EMP_ID := 888;
--    EMP_NAME := '이서희';
--    DBMS_OUTPUT.put_line('EMP_ID: ' || EMP_ID);
--    DBMS_OUTPUT.put_line('EMP_NAME: ' || EMP_NAME);
--END;

--DECLARE
--    VAR_NUM3 NUMBER := 5;
--    VAR_NUM2 NUMBER := 5;
--BEGIN
--    DBMS_OUTPUT.put_line(VAR_NUM3 + VAR_NUM2);
--END;


-- 조건문
/*
IF 조건 THEN
    처리문
ELSIF 조건2 THEN
    처리문
ELSE
    처리문
END IF;
 */
--DECLARE
--    POINT NUMBER := 80;
--BEGIN
--    IF POINT >= 90 THEN
--        DBMS_OUTPUT.PUT_LINE('A');
--    ELSIF POINT >= 80 THEN
--        DBMS_OUTPUT.PUT_LINE('B');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('F');
--    END IF;
--END;

-- 뷰 
/*
CASE
    WHEN 조건 THEN
        처리문
    WHEN 조건2 THEN
        처리문
    ELSE
        처리문
END CASE;
 */ 
--DECLARE
--    POINT2 NUMBER := 80;
--BEGIN
--    CASE POINT2
--        WHEN POINT2 >= 90 THEN
--            DBMS_OUTPUT.PUT_LINE('A');
--        WHEN POINT2 >= 80 THEN
--            DBMS_OUTPUT.PUT_LINE('B');
--        ELSE
--            DBMS_OUTPUT.PUT_LINE('F');
--    END CASE;
--END;


-- MOD 함수
--   MOD(M, N): M을 N으로 나눴을 때 나머지 값을 반환한다
--   값을 2로 나눴을 때 짝수
--DECLARE
--    T_NUMBER NUMBER := 10;
--BEGIN
--    IF MOD(T_NUMBER, 2) = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('짝수');
--    END IF;
--END;


-- TRUNC 함수
--   주로 소수점, 날짜의 시간을 없앨 때 사용한다.
--DECLARE
--	  T_NUMBER NUMBER := 55;
--BEGIN
--	CASE TRUNC(T_NUMBER / 10)
--		WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A');
--		WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B');
--		WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C');
--		ELSE DBMS_OUTPUT.PUT_LINE('F');
--	END CASE;
--END;


-- 반복문
--   
/*
LOOP
    처리문;
    EXIT 조건
END LOOP;
 */
--DECLARE
--    T_NUMBER NUMBER := 1; -- 초기값
--BEGIN
--    LOOP -- 반복문 시작
--        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수: ' || T_NUMBER);
--        T_NUMBER := T_NUMBER + 1;
--        EXIT WHEN T_NUMBER > 4; -- 4 이상이면 반복문 종료
--    END LOOP;
--END;
--DECLARE
--    T_NUMBER NUMBER := 0;
--BEGIN
--    WHILE T_NUMBER < 10 LOOP
--        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수: ' || T_NUMBER);
--        T_NUMBER := T_NUMBER + 1;
--    END LOOP;
--END;


-- FOR LOOP 문법
--   반복 횟수 지정할 때
/*
FOR 변수 IN 시작..끝
    처리문
END LOOP;
*/

-- CONTINUE 문
--   오라클 11g 버전부터 사용 가능
BEGIN
    FOR I IN 1..10 LOOP
        CONTINUE WHEN I = 3;
        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수: ' || I);
    END LOOP;
END;


