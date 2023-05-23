-- 만약 값이 없으면 0을 반환한다
-- 문자열 첫 인덱스가 1부터 시작

-- 중복되는 값이 있을 때 자리수 지정
SELECT LOCATE('abc', 'abceddfag');
SELECT LOCATE('abc', 'abcedabcg', 4);

-- 문자열 추출 LEFT(), RIGHT()
--   전달받은 문자열의 왼쪽부터 개수만큼 문자를 반환하며 오른쪽부터 개수만큼 문자를 반환한다
SELECT LEFT("Mysql php html java", 10);
SELECT RIGHT("Mysql php html java", 10);

-- 문자열 추출 (특정 부분 가져오기)
--   SUBSTRING(문자열, 시작번호, 길이)
SELECT SUBSTRING('가나바다라마사아', 3, 2);

-- 문자열 구분자로 끊어서 가져오기
--   문자열에 음수를 집어넣으면 오른쪽부터 반대로 문자열 반환
SELECT SUBSTRING_INDEX("[www.google.com](http://www.google.com)", '.', 3);
SELECT SUBSTRING_INDEX("[www.google.com](http://www.google.com)", '.', -3);

-- 대소문자 변경
SELECT LOWER('ABCD');
SELECT UPPER('ABBccccc');

-- 문자열 대체
--   문자열 주고, 찾을 단어 주고, 변경할 단어 주기
SELECT REPLACE('Mysql', 'My', 'Ms');

-- 문자열 다듬기
--   특정 문자를 없애거나 앞이나 뒤
--   기본적으로 전달받은 문자열 앞끝에 있는 공백 제거
--   LEADING: 전달받은 문자 앞쪽 제거
--   TRAILING: 전달받은 문자 뒤쪽 제거
SELECT TRIM('   !!!!!mysql php html java!!!!   ');
SELECT TRIM(LEADING '!' FROM '!!!!!mysql php html java!!!!');
SELECT TRIM(TRAILING '!' FROM '!!!!!mysql php html java!!!!');
