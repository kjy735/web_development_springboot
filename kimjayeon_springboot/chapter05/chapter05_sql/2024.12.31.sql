-- 주석 처리 하는 방법
-- 1. SELECT : 보여달라 / 조회해라
select "Hello, SQL!";
-- select : 보여달라 / Hello, SQL! 이라는 string
select 12 + 7; -- SQL문을 통한 연산이 가능

-- 결과 창의 첫 행에 각각 Find, Insight, with SQL을 3 개의 칸에
-- 걸쳐 순서대로 출력하는데, 컬럼명을 순서대로 First, Second, Third로 출력
select 
	"Find" as 'First',
	'Insight' as 'Second',
	'with SQL' as Third;
-- 이런 식으로 작성하는 이유는 모두가 사람이 알아보기 쉽게 하기 위해서이다.
-- as : alias 알리아스라고 발음하는데, 데이터가 들어가는 부분에 대해서 컬럼에 대한 별칭을
-- 붙일 때 사용하는 구문
-- 쉼표(,)의 역할 : 나열할 때 사용
-- SQL문의 특징 : 큰따옴표, 작은따옴표, 따옴표없음을 구분하지 않음

-- 연습문제
-- 1. SELECT를 이용하여 28 + 891의 결과를 표시하라
-- 2. SELECT를 이용하여 19 x 27의 결과를 표시하라. 단, 컬럼명은 Result로 표시하라.
-- 3. SELECT를 이용하여 다음 세 가지 결과를 각각 다른 컬럼으로 결과 창에 표시하라
-- 37 + 172(단, 컬럼명은 Plus)
-- 25 x 78(컬럼명은 Times)
-- I love SQL(컬럼명은 Result)

select 28 + 891;
select 19*27 as result;
select 
	37 + 172 as Plus,
	25 * 78 as Times,
	"I love SQL" as "result";

-- 2. FROM : -로 부터 + 테이블명
-- FROM은 데이터가 저장된 위치를 나타냄.
select *
	from users;
-- users.csv 파일에 있있던 모든 테이블과 컬럼과 값이 출력이 됐음을 확인 가능
-- * : asterisk = all : 와일드카드라는 표시 // java
-- select * from users; : users 테이블에 있는 모든 컬럼의 값을 조회하라

-- 연습문제 2 : 제품 정보 테이블 products에 있는 모든 데이터를 출력하시오.
select * from products;
-- 한 줄로 쓰는 것도 가능 -> 긴 쿼리문을 쓸 때는 가독성 때문에 개행을 하게 되는데,
-- 차근차근 연습하기 위해서 한 줄로 쓸 때도 있고 나눌 때도 있을 예정
-- 원래 제가 쿼리문 명령어에 해당하는 부분은 가독성 때문에 대문자를 쓸 예정이었는데
-- 얘가 지혼자서 소문자로 바뀌어가지고 미리 설명드리는데
-- 얘는 대소문자를 구분하지 않습니다.
-- LIMIT : 개수 제한을 거는 명령어(IDE를 쓰냐에 따라서 TOP일 때도 있습니다)
select * from products limit 3;	-- 상위 3개를 가지고 온다 select * = findAll
-- 이렇게 *를 사용해서 전체 정보를 조회하는 것을 full scan을 쓰는데, 빈도가 높지 않습니다
-- 물론 시험에도 자주 나오지 않습니다.

-- 개수 제한을 걸기 위한 LIMIT와 특정 컬럼을 조회하는 형태로 수업을 하도록 하겠습니다.

-- SELECT 컬럼명1, 컬럼명2 from 테이블명;
-- 제품 정보 테이블인 products에서 제품 아이디(id), 제품명(name) 컬럼만 출력합니다.
select id, name from products;
-- products에서 가격(price), 할인가(discount_price) 컬럼을 10개만 출력합니다.
select price, discount_price from products limit 10;
-- SQL문의 경우에는 순서가 매우 정확하게 정해져있는 편이기 때문에
-- 읽기는 쉽지만 익숙해지기 전까지 직접 작성하는 것이 까다로운 편

-- orderdetails의 모든 정보 표시하세요
SELECT * FROM ORDERDETAILS;
-- 회원 정보 테이블 users에서 상위 7건만 표시하세요(전부 다요)
SELECT * FROM  USERS limit 7;
-- orders에서 id, user_id, order_date 컬럼의 데이터를 모두 표시하세요.
SELECT id, user_id, order_date from ORDERS; 


-- --------------------------------------------------------------------- 2025.01.01-01

SELECT  * FROM users;
-- WHERE : 어떤 조건에 합치하는 것을 고를까(조건문과 유사)
-- 이전까지는 테이블 전체거나 혹은 특정 컬럼에 관련된 부분들을 조회했지만
-- 현업에서는 데이터의 일부 컬럼을 가져오거나 상위 n의 데이터를 조회하는 것
-- 뿐만 아니라 특정 컬럼의 값이 A인 데이터만 가져오는 등 복잡한 쿼리를
-- 작성할 일이 있습니다

-- 회원 정보 테이블 user에서 거주 국가(country)가 한국(Korea)인
-- 회원만 추출하는 쿼리문
SELECT * FROM users WHERE country = "Korea";

-- 거주 국가가 한국이 아닌 회원만 추출하는 쿼리문을 작성하시오.
SELECT * FROM users WHERE country != "Korea";

-- != ~가 아닌

-- 거주 국가가 한국이면서 회원 아이디가 10인 회원만 추출
SELECT * 
	FROM users 
	WHERE country = "USA" AND id = 10;	-- id가 PK이기 때문에
	
-- WHERE 절에서는 여러 조건을 동시에 적용할 수 있고, 조건의 개수에
-- 제한은 없음. 논리 연산 AND / OR / BETWEEN
	
-- 예제 : 회원 정보 테이블 users에서 가입 일시(created _at)가
	-- 2010-12-01부터 2011-01-01까지인 회원 정보를 출력해보세요.
	
SELECT *
	FROM users
	WHERE created_at BETWEEN "2010-12-10" AND "2011-01-01"
	;
-- WHERE절을 작성하는데 있어서 컬럼명이 먼저 나오고 =, !=, between등을 적용
-- select절 + from 테이블명 + where
-- between : 시작값과 종료 값을 '포함'하는 범위 내의 데이터를 조회
--			시간 값을 조회할 때는 [컬럼명] BETWEEN [시작날짜] AND [종료날짜]
--			마찬가지로 시작날짜와 종료날짜를 포함한 모든 것을 출력해준다.

-- 예제 : 가입일시가 2010-12-01부터 2011-01-01까지인 회원정보 출력
-- (BETWEEN을 사용하지 않고)

SELECT *
	FROM users
	WHERE created_at >= "2010-12-01" AND created_at <= "2011-01-01"
	;

-- 이상의 쿼리를 작성한 이유는 : BETWEEN A AND B구문이
-- [초과/미만]이 아니라 [이상/이하]임을 증명하기 위해서

-- 응용 : users에서 거주 국가가 Korea, USA, UK인 회원정보를 추출하세요.
SELECT *
	FROM users
	WHERE country = "Korea" OR country = "USA" OR country = "UK"
	;

SELECT *
	FROM users
	WHERE country IN ("Korea", "USA", "UK")	-- 3개 중에 하나라도 포함된다면 추출해라
	;

-- 응용 : users에서 거주국가가 Korea, USA, UK가 아닌 회원 정보를 추출하세요.
SELECT *
	FROM users
	WHERE country != AND country != "USA" AND country != "UK"
	;

SELECT *
	FROM users
	WHERE country NOT IN ("Korea", "USA", "UK")
	;

-- LIKE : 해당 전치사 뒤의 작은따옴표/큰따옴표 내에서는 와일드카드를 사용 가능
-- SQL을 해석하는 컴퓨터가 LIKE 코드를 읽는 순간 와일드카드를 감지하는데
-- SQL에서의 와일드 카드는 '%'로 0개 이상의 임의의 문자열을 의미하는
-- 메타문자(metacharacter)로 사용됨

-- 예제 users에서 country의 이름이 S로 시작하는 회원 정보를 추출
SELECT *
	FROM users
	WHERE country LIKE "S%"
	;
-- 거주국가 S로 시작하는 (ex)South Korea) 모두를 출력

-- 거주국가가 S로 끝나는 국가 정보 모두 출력
SELECT *
	FROM users
	WHERE country LIKE "%S"
	;

-- 거주 국가명에 S가 들어가기만 하면 다 출력하는 쿼리
SELECT *
	FROM users
	WHERE country LIKE "%S%"
	;

-- 응용 : users에서 country 이름이 S로 시작하지 않는 회원 정보만 추출
SELECT *
	FROM users
	WHERE country NOT LIKE "S%"
	;

-- IS : 
-- 예제 : users에서 created_at 컬럼의 값이 null인 결과 출력
SELECT *
	FROM users
	WHERE created_at IS null; 
--	WHERE created_at = null; 안나옴!

SELECT *
	FROM users
	WHERE created_at IS NOT null;	-- 참고
	
-- 연습 문제
		-- 1. users에서 country가 Mexico인 회원 정보 추출
			-- 단, created_at, phone, city, country 컬럼만 추출할 것.
SELECT created_at, phone, city, country
	FROM users
	WHERE country = "Mexico"
	;
	
		-- 2. products에서 id가 10이하이고 price는 30 이상인 제품 정보 출력
			-- 단 기존 컬럼 전부 출력하고, 정상 가격에서 얼마나 할인 되었는지를
			-- (price - discount_price)
			-- discount_amount라는 컬럼명으로 추출할 것.
SELECT * ,				-- 전부 다의 기준은 기존 컬럼
	(price - discount_price) as "discout_amount"	-- 새로운 컬럼을 재정의한 것	
	FROM products
	WHERE id <= 10 AND price >= 30
	;

		-- 3. users에서 country가 Korea, Canada, Belgium도 아닌 회원의
			-- 정보를 모두 추출할 것.
			-- 단, OR 연산자를 사용하지 않고 출력할 것.
SELECT *
	FROM users
	WHERE country NOT IN ("Korea,", "Canada", "Belgium")
	; 
		
		-- 4. products에서 name이 N으로 시작하는 제품 정보를 전부 출력할 것.
			-- 단, id, name, price컬럼만 출력할 것
SELECT id, name, price
	from products
	WHERE name LIKE "N%"
	;

		-- 5. orders에서 order_date가 2015-07-01부터 2015-10-31까지가
			-- 아닌 정보만 출력할 것.
SELECT *
	FROM orders
	WHERE order_date NOT BETWEEN "2015-07-01" AND "2015-10-31"
	;
-- NOT BETWEEN 순인 것만 아시면 됩니다.
		
-- ORDER BY 
-- 현재까지 WHERE을 이용해서 특정한 조건에 합치하는 데이터들을 조회하는 SQL문에 대해서 학습했습니다.
		
-- 이상의 경우 저장된 순서대로 정렬된 결과만 볼 수 있습니다. -> id라는 PK값에 따라
		
-- 이번에는 가져온 데이터를 원하는 순서대로 정렬하는 방법에 관한 것입니다.
		
-- 예제 : user에서 id를 기준으로 오름차순 정렬 후 출력
SELECT *
	FROM users
	order by id ASC 	-- asc : Ascending의 의미로 '오름차순'
	;	

-- 예제 : users에서 id를 기준으로 내림차순 정렬 후 출력
SELECT *
	FROM users
	order by id DESC 	-- desc : Descending의 축약어로 '내림차순'
	;	
	
-- 이상에서 볼 수 있듯이 ORDER BY는 컬럼을 기준으로 행 데이터를 ASC 혹은 DESC로
-- 정렬할 때 사용 : 숫자의 경우는 쉽게 알 수 있지만. 문자의 경우는
-- 아스키 코드(ASCII Code)를 기준으로 합니다
	
-- 예제 : users에서 city를 기준으로 내림차순 하여 전체 정보 출력해보세요.
SELECT *
	FROM users
	order by city DESC 
	;

-- 예제 : users에서 created_at를 기준으로 오름차순 하여 전체 정보를 출력해보세요.
SELECT *
	FROM users
	order by created_at ASC 
	;

-- 예제 : users에서 첫 번째 컬럼 기준으로 오름차순 정렬하여 출력
SELECT *
	FROM users
	order by 1 ASC 
	;

-- ORDER BY의 특징 : 컬럼명 대신에 컬럼 순서를 기준으로 하여 정렬이 가능.
	-- 컬럼명을 몰라도 정렬할 수 있다는 장점이 있지만 주의할 필요가 있음

-- 예제 : users에서 username, phone, city, country, id 컬럼을 순서대로 출력
-- 하는데, 첫 번째 컬럼 기준으로 오름차순 정렬 해보세요.
SELECT username, phone, city, country, id
	from users
	order by 1 ASC 
	;
-- 아까와 같이 ORDER BY 1 ASC로 했지만 정렬이 id가 아닌 username을 기준으로
-- ASCII Code가 적용되어 정렬 방식이 달라졌음을 확인 가능.
-- 즉, ORDER BY는 데이터 추출이 끝난 후를 기점으로 적용이 된다는 점을 명심해야 합니다.

-- 예제 : users에서 city, id 컬럼만 출력하는데, city 기준 내림차순
--	id 기준 오름차순으로 정렬
SELECT city, id
	from users
	order by city DESC, id ASC
	;

-- 컬럼별로 다양하게 오름차순 혹은 내림차순 적용이 가능

-- ORDER BY 정리
-- 1. 데이터를 가져올 때 지정된 컬럼음 기준으로 정렬함.
-- 2. 형식 : ORDER BY '컬럼명' ASC/DESC
-- 3. 2개 이상의 정렬 기준을 쉼표(,)를 기준으로 합쳐서 지정 가능
	-- 이상의 경우 먼저 지정된 컬럼이 우선하여 정렬됨.
-- 4. 2개의 이상의 정렬 기준을 지정할 때 각각 지정 가능
	-- 이상의 경우 각 컬럼 당 명시적으로 ASC 혹은 DESC를 지정 해줘야 함.
	-- 하지만 지정하지 않을 경우 default로 ASC 적용

-- 연습 문제
-- 1. products에서 price가 비싼 제품부터 순서대로 모든 컬럼 출력
SELECT  *
	FROM products
	order by price DESC 
	;

-- 2. orders에서 order_date 기준 최신순으로 모든 컬럼 출력
SELECT *
	from orders
	order by order_date DESC 
	;

-- 3. orderdetails에서 product_id를 기준 내림차순, 같은 제품 아이디 내에서는
-- quantity 기준 오름차순으로 모든 컬럼 출력
SELECT *
	FROM orderdetails
	order by product_id DESC, quantity ASC		-- ASC 적어도 되고 안적어도 됨 
	;

-- 여태까지 배운 것을 기준으로 실무에서는 어떤 방시으로 데이터를 추출해서 사용하는지 예시
-- 실무에서는 select, where, order by를 사용해 다양한 데이터를 추출하는데,

-- 1. 배달 서비스 예시
	-- 1) 2023-08-01에 주문한 내역 중 쿠폰 할인이 적용된 내역 추출
SELECT *
	FROM 주문일자
	WHERE 주문일자 = '2023-08-01'
		AND 쿠폰할인금액 > 0
	;

	-- 2) 마포구에서 1인분 배달이 가능한 배달 음식점 추출
SELECT *
	FROM 음식점정보
	WHERE 지역 = "마포구"
		AND 1인분가능여부 = 1;		-- 1을 쓸 경우에는 True의미 / 0은 false 의미

		
-- ---------------------------------------------------------------------- 2025.01.01-02
-- 데이터를 그룹화하고, 함수로 계산하는 방법 학습 예정.
-- 그룹화(grouping)는 조건에 따라 데이터를 그룹으로 묶는 것으로(WHERE과는 차이가 있음),
-- 데이터를 그룹화하면 함수로 원하는 계산이 가능

-- 예를 들어 실습 데이터에서 회원 수를 구하려면 어떡해야할까, 전체 회원 수가 아니라,
-- 국가별 회원 수를 구하는 방법, 제품별 매출을 구하는 방법 등을 실제로 알아볼 수 있음.

-- SQL내에서 사용하는 함수들은 주로 평균, 개수, 합계 등을 구하는 '집계 함수',
-- 문자열을 원하는 만큼 잘라내거나 대/소문자를 변경하는 등의 기능을 수행하는 '일반 함수'
-- 등으로 나눌 수 있다.

-- 함수를 적용하기 위한 전제 조건 : GROUP BY
-- 전체 데이터를 째로 함수 적용하는 경우도 있지만, 그룹별로 수치를 도출하는 일도 있는데,
-- 이를 이용해 데이터를 그룹으로 묶은 후 필요 함수 적용 가능
-- 예를 들어 '국가별 회원 수를 구하라' 혹은 '일별 매출 계산하라'와 같은
-- 그룹화 기준을 지정해서 원하는 계산을 수행할 수 있음.

-- GROUP BY로 계산한 결과를 필터링하는 HAVING 명령어
-- GROUP BY를 적용해서 '국가별 회원 수를 구하고' 이후에 '그리고 회원 수가 10명 이상인'
-- '국가만 도출하라'는 등 집계 함수로 게산한 결과 중 조건에 맞는 데이터만 필요한 경우에는
-- WHERE을 쓰는 것이 아니라 'HAVING'을 사용합니다.

-- 집계 함수 예시
-- 예제 : users에서 모든 행 수를 세어봅니다 : COUNT
SELECT *
	FROM users
	;

SELECT COUNT(*)		-- COUNT(컬럼명, 사실 *) 집계함수에 해당
	from users		-- 대상 테이블 전체 행의 개수를 세는 역할
	;

-- users에서 존재하는 country 컬럼의 데이터 개수
SELECT COUNT(coutry)	-- country 컬럼에서 null이 아닌 값의 개수, 즉 중복 계산
	from users
	;

SELECT *
	FROM users
	WHERE country IS NULL 
	;

-- country의 데이터값의 종류를 계산하고 싶다면?
SELECT COUNT(distinct country)		-- 중복을 제거하기 위해서는 distinct
	from users
	;

-- DISTINCT : 중복 값을 제거하여 고유한 값만 반환하는 키워드 / SELECT와 함께 사용

SELECT COUNT(1)		-- COUNT(컬럼숫자) 가능
	from users
	;

-- MIN / MAX / COUNT / SUM / AVG

-- products에서 최저가를 구하시오(price 컬럼 이용)
SELECT MIN(price)
	from products
	;

-- products에서 최대가를 구하시오(price 컬럼 이용)
SELECT MAX(price)
	from products
	;

-- products에서 전체 데이터 가격의 합 구하시오(price 컬럼 이용)
SELECT SUM(price)
	from products
	;

-- products에서 price의 평균(단, 결과값의 컬럼명을 avgPrice로 변경)
SELECT ROUND(AVG(price), 2) 
	as "avgPrice"
	from products
	;
-- ROUND(집계함수결과, 소수점 몇째자리까지인지)


SUM : 합계 : SUM(컬럼명)
AVG : 평균 : AVG(컬럼명)
MIN : 최소값 : MIN(컬럼명)
MAX : 최대값 : MAX(컬럼명)
COUNT : 개수 : COUNT(컬럼명)

일반 함수 예시

ROUND(컬럼명, 소수점자리수) : 소수점자리를 지정한 자릿수까지 반올림하여 반환
SUBSTR(컬럼명, 시작위치, 가져올문자개수) : 문자열을 지정한 시작 위치부터 지정한 문자 개수만큼 추출
LENGTH(컬럼명) : 문자열의 길이 반환
UPPER(컬럼명) : 알파벳 문자열을 대문자로 반환
LOWER(컬럼명) : 알파벳 문자열을 소문자로 반환

집계 함수는 여러 행의 데이터를 '하나의 결과값'으로 집계하는 반면, 일반 함수는
한 행의 데이터에 하나의 결과값을 반환한다.
이상의 이유로 집계 함수는 SELECT에서만 사용가능
일반 함수는 SELECT뿐만 아니라 WHERE에서도 사용가능.
이상의 함수 예시들은 전부 다가 아니라 일부이므로 필요시마다 소개하도록 하겠습니다.

group by
	-- 어떤 기준으로 묶어서 게산하느냐와 관련있는 키워드로,
-- 집계 함수만으로 원하는 결과르 얻을 수 없을 때(데이터 전체가 아니라, 원하는 기준으로
-- 그룹을 나눈 상태에서 계산으 해야할 때를 의미)가 있습니다.
-- 예를 들어, 전체 회원 수가 아닌 국가별 회원 수를 나누어 계산하기도 하며,
-- 월별로 갑입한 회원 수를 집계하기도 하기 때문.
-- 즉, 특정 조건으로 나눈 그룹별 계산을 수행할 때는 먼저 그룹화를 선행해야 합니다.
-- 그 후 집계 함수는 특정 컬럼을 기준으로 데이터를 그룹화 한 후에, 그룹별로 집계 함수를
-- 적용해야 합니다.

-- 예제 : users에서 country가 Korea인 회원 수를 출력
SELECT COUNT(id)
	from users
	WHERE country = "Korea"
	;
-- 이상의 경우에 country = "Korea"인 경우는 출력할 수 있는데,
SELECT COUNT(DISTINCT country)
	from users
	;
-- 를 확인해보면 count(DISTINCT country)의 결과값이 17dlamfh
-- 모든 국가를 대상으로 회원 수를 확인해보기 위해서는 국가별로 즉, 총 17번의
-- SQL문을 작성해야 합니다.
-- 국가 수가 적지도 않고, 실제 환경에서는 훨씬 더 많은 데이터를 다루는데, 조건을 일일이
-- 적용하기에는 비효율적입니다.
-- 즉, where절에서 country =의 값을 매번 바꾸는 방식은 사용하지 않습니다.

-- 다음 시간에 저희는 GROUP BY를 통해 어떻게 묶을지 학습하도록 하겠습니다.


-- ---------------------------------------------------------------------- 2025.01.03

-- users에서 country별 회원 수 구하기 쿼리
SELECT country, COUNT(distinct id) as uniqueUserCnt
	from users
	group by country
	;
-- ----------> 뒤에 나오는 컬러명을 기준으로 그룹화해서
-- country를 표시하고, COUNT() 적용한 컬럼도 표시해서 조회해줘.

SELECT * FROM users;

-- users에서 country가 Korea인 회원 중에서 마케팅 수신에 동의한 회원 수를 구해 출력
-- 표시 컬럼은 country, UniqueUserCnt 두 컬럼으로 구성돼있습니다. (GROUP BY - x)
SELECT COUNTRY , COUNT(DISTINCT ID) AS UniqueUserCnt
	from USERS
	WHERE COUNTRY = "Korea" AND IS_MARKETING_AGREE = 1
	;

-- users에서 country별로 마케팅 수신 동의한 회원 수와 동의하지 않은 회원 수를 구해 출력
-- 표시 컬럼 country, UniqueUserCnt(GROUP BY - o)
SELECT country, IS_MARKETING_AGREE, COUNT(distinct ID) as uniqueUserCnt 
	from USERS 
	group by COUNTRY, IS_MARKETING_AGREE 
	ORDER BY COUNTRY , UniqueUserCnt DESC 
	;
-- 			국가별로는 오름차순(default라서 미표기), uniqueUserCnt를 기준으로는 내림차순
-- select절 - from 테이블명 - group by절 - order by 절 : 순서

group BY에 두 개 이상의 기준 컬럼을 추가하면 데이터가 여러 그룹으로 나뉨.
아르헨티나를 기준으로 했을 때 마케팅 수신 동의 여부가 0인 회원 수와 마케딩 수신 여부가 1인
회원수를 기준으로 나위어져 있음을 알 수 있음.

예를 들어서 위의 쿼리문의 경우, country를 기준으로 먼저 그룹화가 이루어지고, 
그 후에 is_marketing_agree를 기준으로 그룹화됐다.

그래서 group by에 여러 기준을 설정하면, 컬럼 순서에 따라 결과가 달라짐.
따라서 '중요한 기준을 앞에 배치'해서 시각화와 그룹화에 대한 우선순위를 결정할 필요 있음.

-- GROUP BY 정리
-- 1) 주어진 컬럼을 기준으로 데이터를 그룹화하여 '집계함수'와 함께 사용
-- 2) GROUP BY 뒤에는 그룹화할 컬럼명을 입력. 그룹화한 컬럼에 집계 함수를 적용하여
	-- 그룹별 계산을 수행
-- 3) 형식 : GROUP BY 컬럼명1, 컬럼명2 ....
-- 4) GROUP BY에서 두 개 이상의 기준 컬럼을 조건으로 추가하여 여러 그룹으로
-- 		분할 가능한데, 컬럼 순서에 따라 결과에 영향을 미치므로 우선순위를 생각할 필요 있음.

-- users에서 국가(country) 내 도시 (city)별 회원수를 구하여 출력.
-- 단, 국가명은 알파벳 순서대로 정렬, 같은 국가 내에서는 회원 수 기준으로 내림 차순 정렬
-- 표시 컬럼 country, city, uniqueUserCnt
SELECT country, city, COUNT(distinct id) as uniqueUserCnt
	from USERS
	group by COUNTRY , CITY 
	order by COUNTRY, uniqueUserCnt DESC 
	;

SELECT *
	from users;
-- SUBSTR(컬럼명, 시작값, 글자개수)
-- users에서 월별(e.g. 2013-10) 가입 회원 수를 출력할 것.
-- 가입일시 컬럼 활용하고, 최신순으로 정렬
SELECT SUBSTR(CREATED_AT, 1, 7) as month, COUNT(distinct id) as uniqueUserCnt
	from USERS
	group by SUBSTR(CREATED_AT, 1, 7) 
	ORDER BY MONTH desc
	;



