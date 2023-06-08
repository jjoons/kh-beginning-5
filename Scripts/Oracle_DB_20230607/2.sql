SET SERVEROUTPUT ON;

/*함수(Function)이란?
 데이터베이스에서 함수는 일반적인 프로그래밍에서의 함수와 동일합니다.
 매개변수를 받아 특정 계산(작업)을 수행하고 결과를 반환하는 구조로 되어 있습니다.
 즉, 특정 동작을 수행하는 코드 부분을 의미합니다.
 데이터베이스 내에서는 특정 값(매개변수)을 입력 받아 여러 쿼리문을 작업한 뒤 반환하는
 기능을 의미합니다.
 
오라클에서 제공하는 함수는 내장함수 
사용자 정의 함수
 

CREATE OR REPLACE FUNCTION 함수이름(파라미터1이름 타입, 파라미터2이름 타입...)
RETURN 반환할타입
IS
	변수 선언
BEGIN
	실행문 작성
	RETURN 반환할값
END;
 */

/*
함수 생성
  CREATE OR REPLACE FUNCTION

매개 변수: 함수로 전달되는 매개 변수로(이름 타입) 매개 변수 생략 가능
 */

--CREATE OR REPLACE FUNCTION my_mod(num1 NUMBER, num2 NUMBER)
--RETURN NUMBER -- NUMBER 타입으로 반환
--IS
--    var_rem NUMBER := 0; -- 반환할 나머지
--    var_quo NUMBER := 0;
--BEGIN
--    var_quo := FLOOR(num1 / num2);
--
--    RETURN var_quo;
--END;
--/

-- 호출
--SELECT my_mod(14, 3) FROM DUAL;

/*
함수는 특정 연산을 수행한 뒤 결과 값을 반환하지만
프로시저는 특정 로직만 처리하고 결과값을 반환하지 않는 서브

프로시저
  데이터베이스에 대한 일련의 작업을 정리한 절차를
  관계형 데이터베이스 관리 시스템에 저장한 것으로
  영구저장모듈(Persistent Storage Module)이라고도 불립니다.
  보통 저장 프로시저를 프로시저라고 부르며,
  일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합입니다.
  즉, 특정 작업을 위한 쿼리들의 블록입니다.

    CREATE OR REPLACE PROCEDURE 프로시저 이름
        (매개변수명1[IN |OUT | IN OUT] 데이터타입[:= 디폴트 값],
         매개변수명2[IN |OUT | IN OUT] 데이터타입[:= 디폴트 값],
         ...
        )
    IS[AS]
      변수, 상수 등 선언
    BEGIN
      실행부
    　
    [EXCEPTION
      예외 처리부]
    END [프로시저 이름];
    
  CREATE OR REPLACE PROCEDURE
  매개 변수: IN 입력, OUT 출력. IN OUT. 입출력.
    아무 것도 작성하지 않으면 기본적으로 IN이 적용됨
  변수: 저장 프로시저나 트리거 내에서 사용하는 값
    특정 작업을 수행하는 이름이 있는 PL/SQL 블록
*/

CREATE TABLE CAFE20230607 (
    CAFEID NUMBER(20), 
    CAFENAME VARCHAR2(20), 
    CORPORATION VARCHAR2(20),
    PRICE NUMBER(10)
);
 
CREATE OR REPLACE PROCEDURE INSERTCAFE(
    mCAFEID IN NUMBER,
    mCAFENAME IN VARCHAR2,
    mCORPORATION IN VARCHAR2,
    mPRICE IN NUMBER
) AS
BEGIN
    INSERT INTO CAFE20230607(CAFEID, CAFENAME, CORPORATION, PRICE)
    VALUES (mCAFEID, mCAFENAME, mCORPORATION, mPRICE);
END;
/
 
EXEC INSERTCAFE(14, '스타벅스', '신세계', 7000);
EXEC INSERTCAFE(20, '이디야', '이디야', 4500);
EXEC INSERTCAFE(03, '빽다방', '백종원', 3000);
SELECT * FROM CAFE20230607;

/*
자신을 호출한 곳으로 리턴 해주는 값은 없고 호출되어 실행만 된다.

n  실행환경과 Stored Program 사이에 값을 전달하기 위해 파라미터를 사용한다.

n  파라미터 종류

IN : 호출하는 곳에서 함수 or 프로시저로 값을 전달

OUT : 함수 or 프로시저에서 호출한 곳으로 값을 전달

IN OUT : 호출하는 곳에서 함수 or 프로시저로 값을 전달하고 동시에 함수 or

프로시저에서 호출한 곳으로 값을 전달하는 변수.

n  프러시저 Header의 끝에는 IS[AS]가 와야하고 Is와 Begin사이에 Begin ~ End에서 사용할

변수를 선언한다.

n  자신의 스키마에서 프로시저를 만들기 위해서는 CREATE PROCEDURE 시스템권한이

있어야 하며 다른 스키마 계정에서 프로시저를 만들기 위해서는

CREATE ANY PROCEDURE 시스템 권한이 이 있어야 한다.
*/
