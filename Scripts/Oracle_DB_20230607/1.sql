-- PL/SQL
--   SQL ���忡�� ����, ���� ó�� (if, �ݺ��� while, for) ���� ����
--   SQL���� ���α׷��� �� �ۼ��� �� �ְ� ��

-- ������ ����� �����ϴ� �κ�

-- �����
-- DECLARE SECTION

-- �����
-- EXECUTABLE SECTION
--   if ��, while �Լ� ����


-- ����ó����
-- EXCEPTION SECTION
--   �������� ��Ȳ �߻� �� �ذ��ϱ� ���� ����

-- ���ν����� ����Ͽ� ����ϴ� ������ ȭ�鿡 �����ְ� ��
-- �⺻���� "off"�� �Ǿ������� ����Ϸ��� "on"���� �����ؾ� ��
SET serveroutput ON;

--BEGIN
--    -- PUT_LINE�̶�� ���ν����� �̿��Ͽ� ���
--    -- DBMS_OUTPUT ��Ű���� ���� ����
--    DBMS_OUTPUT.put_line('Hello world');
--END;

-- �⺻ Ư��
--   ��� ������ ������ �����Ѵ�
--   "BEGIN"�� "END"�� ����Ѵ�
--   ������ ���ο� "/"�� �Է��ϸ� �ش� ����� ����ȴ�
--   Ŀ���� ����Ͽ� ���� ���� �˻��ϰų� ó��

-- ����� ���� (block)
--   - �͸� ���: �̸��� ���� PL/SQL Block
--   - �̸��� �ִ� ���: DB�� ��ü�� ����Ǵ� ���
--   - ���ν���: ���ϰ��� �ϳ� �̻� ���� �� �ִ� ���α׷�
--   - �Լ�: ���ϰ��� �ݵ�� ��ȯ�ؾ� �ϴ� ���α׷�
--   - ��Ű��: �ϳ� �̻��� ���ν���, �Լ�, ����, ���� ���� ������ ���Ѵ�
--   - Ʈ����: ������ �̺�Ʈ�� �߻��ϸ� �ڵ����� ����Ǵ� PL/SQL ���

-- ���� ���� �� :=
-- ������ ������Ÿ�� := �ʱⰪ;
-- VAL_NUM NUMBER := 1;
-- VAL_STR CHAR(3) := 'AA';

-- ��� ����
-- ����� constrant ������Ÿ�� := �����;
--DECLARE
--    EMP_ID NUMBER;
--    EMP_NAME VARCHAR2(30);
--    VAR_NUM CONSTANT NUMBER := 1; -- ��� ����
--BEGIN
--    EMP_ID := 888;
--    EMP_NAME := '�̼���';
--    DBMS_OUTPUT.put_line('EMP_ID: ' || EMP_ID);
--    DBMS_OUTPUT.put_line('EMP_NAME: ' || EMP_NAME);
--END;

--DECLARE
--    VAR_NUM3 NUMBER := 5;
--    VAR_NUM2 NUMBER := 5;
--BEGIN
--    DBMS_OUTPUT.put_line(VAR_NUM3 + VAR_NUM2);
--END;


-- ���ǹ�
/*
IF ���� THEN
    ó����
ELSIF ����2 THEN
    ó����
ELSE
    ó����
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

-- �� 
/*
CASE
    WHEN ���� THEN
        ó����
    WHEN ����2 THEN
        ó����
    ELSE
        ó����
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


-- MOD �Լ�
--   MOD(M, N): M�� N���� ������ �� ������ ���� ��ȯ�Ѵ�
--   ���� 2�� ������ �� ¦��
--DECLARE
--    T_NUMBER NUMBER := 10;
--BEGIN
--    IF MOD(T_NUMBER, 2) = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('¦��');
--    END IF;
--END;


-- TRUNC �Լ�
--   �ַ� �Ҽ���, ��¥�� �ð��� ���� �� ����Ѵ�.
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


-- �ݺ���
--   
/*
LOOP
    ó����;
    EXIT ����
END LOOP;
 */
--DECLARE
--    T_NUMBER NUMBER := 1; -- �ʱⰪ
--BEGIN
--    LOOP -- �ݺ��� ����
--        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ��: ' || T_NUMBER);
--        T_NUMBER := T_NUMBER + 1;
--        EXIT WHEN T_NUMBER > 4; -- 4 �̻��̸� �ݺ��� ����
--    END LOOP;
--END;
--DECLARE
--    T_NUMBER NUMBER := 0;
--BEGIN
--    WHILE T_NUMBER < 10 LOOP
--        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ��: ' || T_NUMBER);
--        T_NUMBER := T_NUMBER + 1;
--    END LOOP;
--END;


-- FOR LOOP ����
--   �ݺ� Ƚ�� ������ ��
/*
FOR ���� IN ����..��
    ó����
END LOOP;
*/

-- CONTINUE ��
--   ����Ŭ 11g �������� ��� ����
BEGIN
    FOR I IN 1..10 LOOP
        CONTINUE WHEN I = 3;
        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ��: ' || I);
    END LOOP;
END;


