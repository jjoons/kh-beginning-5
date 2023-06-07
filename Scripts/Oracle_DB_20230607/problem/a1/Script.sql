SET serveroutput ON;

DECLARE
    t_size NUMBER := 53;
    p2_num1 NUMBER := 2;
    p2_num2 NUMBER := 1;
    p2_num3 NUMBER := 5;
    p2_total NUMBER := 0;
    p2_max NUMBER := 0;
    p2_min NUMBER := 0;
    p4_i NUMBER := 1;

BEGIN
    -- 1
    DBMS_OUTPUT.PUT_LINE('===== 1 =====');
    IF ((t_size > 55) OR (t_size <= 51)) THEN
        DBMS_OUTPUT.put_line('제작 불가');
    ELSIF t_size > 54 THEN
        DBMS_OUTPUT.put_line('12호');
    ELSIF t_size > 53 THEN
        DBMS_OUTPUT.put_line('11호');
    ELSIF t_size > 52 THEN
        DBMS_OUTPUT.put_line('10호');
    ELSE
        DBMS_OUTPUT.put_line('9호');
    END IF;


    -- 2
    DBMS_OUTPUT.PUT_LINE('===== 2 =====');
    p2_total := p2_num1 + p2_num2 + p2_num3;

    IF MOD(p2_total, 2) = 0 THEN
        IF p2_num1 >= p2_num2 THEN
            p2_max := p2_num1;
            
            IF p2_num1 >= p2_num3 THEN
                DBMS_OUTPUT.PUT_LINE('합 짝수: ' || p2_total || ', 가장 큰 수: ' || p2_num1);
            ELSE
                DBMS_OUTPUT.PUT_LINE('합 짝수: ' || p2_total || ', 가장 큰 수: ' || p2_num3);
            END IF;
        ELSE
            p2_max := p2_num2;
            
            IF p2_num2 >= p2_num3 THEN
                DBMS_OUTPUT.PUT_LINE('합 짝수: ' || p2_total || ', 가장 큰 수: ' || p2_num2);
            ELSE
                DBMS_OUTPUT.PUT_LINE('합 짝수: ' || p2_total || ', 가장 큰 수: ' || p2_num3);
            END IF;
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('홀수: ' || p2_total);
    END IF;


    -- 3
    DBMS_OUTPUT.PUT_LINE('===== 3 =====');
    FOR i IN 10..20 LOOP
        IF MOD(i, 2) = 1 THEN
            DBMS_OUTPUT.PUT_LINE(i ||' is odd number');
        END IF;
    END LOOP;


    -- 4
    DBMS_OUTPUT.PUT_LINE('===== 4 =====');
    LOOP
        DBMS_OUTPUT.PUT_LINE('나무를 ' || p4_i || '번 찍었다.');
        p4_i := p4_i + 1;
        EXIT WHEN p4_i > 10;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('나무가 넘어갔다');
END;
