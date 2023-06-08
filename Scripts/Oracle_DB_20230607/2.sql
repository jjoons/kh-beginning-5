SET SERVEROUTPUT ON;

/*�Լ�(Function)�̶�?
 �����ͺ��̽����� �Լ��� �Ϲ����� ���α׷��ֿ����� �Լ��� �����մϴ�.
 �Ű������� �޾� Ư�� ���(�۾�)�� �����ϰ� ����� ��ȯ�ϴ� ������ �Ǿ� �ֽ��ϴ�.
 ��, Ư�� ������ �����ϴ� �ڵ� �κ��� �ǹ��մϴ�.
 �����ͺ��̽� �������� Ư�� ��(�Ű�����)�� �Է� �޾� ���� �������� �۾��� �� ��ȯ�ϴ�
 ����� �ǹ��մϴ�.
 
����Ŭ���� �����ϴ� �Լ��� �����Լ� 
����� ���� �Լ�
 

CREATE OR REPLACE FUNCTION �Լ��̸�(�Ķ����1�̸� Ÿ��, �Ķ����2�̸� Ÿ��...)
RETURN ��ȯ��Ÿ��
IS
	���� ����
BEGIN
	���๮ �ۼ�
	RETURN ��ȯ�Ұ�
END;
 */

/*
�Լ� ����
  CREATE OR REPLACE FUNCTION

�Ű� ����: �Լ��� ���޵Ǵ� �Ű� ������(�̸� Ÿ��) �Ű� ���� ���� ����
 */

--CREATE OR REPLACE FUNCTION my_mod(num1 NUMBER, num2 NUMBER)
--RETURN NUMBER -- NUMBER Ÿ������ ��ȯ
--IS
--    var_rem NUMBER := 0; -- ��ȯ�� ������
--    var_quo NUMBER := 0;
--BEGIN
--    var_quo := FLOOR(num1 / num2);
--
--    RETURN var_quo;
--END;
--/

-- ȣ��
--SELECT my_mod(14, 3) FROM DUAL;

/*
�Լ��� Ư�� ������ ������ �� ��� ���� ��ȯ������
���ν����� Ư�� ������ ó���ϰ� ������� ��ȯ���� �ʴ� ����

���ν���
  �����ͺ��̽��� ���� �Ϸ��� �۾��� ������ ������
  ������ �����ͺ��̽� ���� �ý��ۿ� ������ ������
  ����������(Persistent Storage Module)�̶�� �Ҹ��ϴ�.
  ���� ���� ���ν����� ���ν������ �θ���,
  �Ϸ��� ������ ��ġ �ϳ��� �Լ�ó�� �����ϱ� ���� ������ �����Դϴ�.
  ��, Ư�� �۾��� ���� �������� ����Դϴ�.

    CREATE OR REPLACE PROCEDURE ���ν��� �̸�
        (�Ű�������1[IN |OUT | IN OUT] ������Ÿ��[:= ����Ʈ ��],
         �Ű�������2[IN |OUT | IN OUT] ������Ÿ��[:= ����Ʈ ��],
         ...
        )
    IS[AS]
      ����, ��� �� ����
    BEGIN
      �����
    ��
    [EXCEPTION
      ���� ó����]
    END [���ν��� �̸�];
    
  CREATE OR REPLACE PROCEDURE
  �Ű� ����: IN �Է�, OUT ���. IN OUT. �����.
    �ƹ� �͵� �ۼ����� ������ �⺻������ IN�� �����
  ����: ���� ���ν����� Ʈ���� ������ ����ϴ� ��
    Ư�� �۾��� �����ϴ� �̸��� �ִ� PL/SQL ���
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
 
EXEC INSERTCAFE(14, '��Ÿ����', '�ż���', 7000);
EXEC INSERTCAFE(20, '�̵��', '�̵��', 4500);
EXEC INSERTCAFE(03, '���ٹ�', '������', 3000);
SELECT * FROM CAFE20230607;

/*
�ڽ��� ȣ���� ������ ���� ���ִ� ���� ���� ȣ��Ǿ� ���ุ �ȴ�.

n  ����ȯ��� Stored Program ���̿� ���� �����ϱ� ���� �Ķ���͸� ����Ѵ�.

n  �Ķ���� ����

IN : ȣ���ϴ� ������ �Լ� or ���ν����� ���� ����

OUT : �Լ� or ���ν������� ȣ���� ������ ���� ����

IN OUT : ȣ���ϴ� ������ �Լ� or ���ν����� ���� �����ϰ� ���ÿ� �Լ� or

���ν������� ȣ���� ������ ���� �����ϴ� ����.

n  �������� Header�� ������ IS[AS]�� �;��ϰ� Is�� Begin���̿� Begin ~ End���� �����

������ �����Ѵ�.

n  �ڽ��� ��Ű������ ���ν����� ����� ���ؼ��� CREATE PROCEDURE �ý��۱�����

�־�� �ϸ� �ٸ� ��Ű�� �������� ���ν����� ����� ���ؼ���

CREATE ANY PROCEDURE �ý��� ������ �� �־�� �Ѵ�.
*/
