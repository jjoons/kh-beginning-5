-- A. 거래 내역의 총합은?
SELECT COUNT(*) FROM transactions;

-- B. 최대 거래 금액과 최저 거래 금액은?
SELECT MAX(amount), MIN(amount) FROM transactions;

-- C. “Google”과 거래한 총 횟수는?
SELECT COUNT(*) FROM transactions WHERE msg = 'Google';

-- D. 거래 내역의 평균 금액은?
SELECT AVG(amount) FROM transactions;

-- E. 거래 메시지 목록을 중복되지 않게 추출하면?
SELECT DISTINCT msg FROM transactions;

-- F. 거래 내역의 입금 총액은?
SELECT SUM(amount) FROM transactions WHERE amount > 0;
