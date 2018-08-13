--한줄 주석
/*
    여러줄 주석
*/
SELECT  FIRST_NAME
        ,LAST_NAME
FROM    EMPLOYEES
;

SELECT  *
FROM    EMPLOYEES
;

SELECT  CITY
FROM    LOCATIONS
;

SELECT  DEPARTMENT_NAME
FROM    DEPARTMENTS
;

SELECT  COUNTRY_ID
        ,COUNTRY_NAME
FROM    COUNTRIES
;

SELECT  DISTINCT    MANAGER_ID --가져온 로우들 중에서 정렬하는것
        , FIRST_NAME
FROM    EMPLOYEES
ORDER   BY MANAGER_ID  DESC --테이블에 있는 컬럼 아무거나 쓸 수 있음
;

/*
    EMPLOYEES 테이블의 모든 컬럼을 조회한다.
    EMPLOYEE_ID 기준 오름차순으로 정렬한다.
*/
SELECT  *
FROM    EMPLOYEES
ORDER   BY EMPLOYEE_ID ASC
;

/*
    EMPLOYEES 테이블에서 모든 컬럼을 조회한다.
    단, SALARY가 가장 높은 ROW부터 출력한다.
*/
SELECT  *
FROM    EMPLOYEES
ORDER   BY SALARY   DESC
;

/*
    입사일 : HIRE_DATE
    먼저 입사한 순서부터 모든 사원들의 모든 정보를 출력한다.
*/
SELECT  *
FROM    EMPLOYEES
ORDER   BY HIRE_DATE ASC
;

--2차 정렬
SELECT  *
FROM    EMPLOYEES
ORDER   BY HIRE_DATE ASC -- 실행속도 때문에 신중해서 사용해야함 웬만하면 정렬은 PK에게 맡긴다.
        , SALARY DESC
;

--오라클이 좋은 이유 : 문자도 정렬됨
SELECT  FIRST_NAME
FROM    EMPLOYEES
ORDER   BY FIRST_NAME
;

SELECT  *
FROM    EMPLOYEES
WHERE   SALARY = 24000
AND EMPLOYEE_ID = 100
;

SELECT  *
FROM    EMPLOYEES
WHERE   FIRST_NAME = 'Steven'
AND     SALARY = 2200
;
/*
    비교연산 종류
    = 같다
    > 크다
    < 작다
    >= 크거나 같다.
    <= 작거나 같다.
*/

/*
국가 코드가 JP, CA인 모든 것들의 정보 출력
*/
--문자는 홑따움표

SELECT *
FROM    LOCATIONS
WHERE   COUNTRY_ID = 'JP'
OR COUNTRY_ID ='CA'
;

/*
90. 60, 100번 부서에서 일을 하는 사원들 중
직무명(JOB_ID)이 IT_PROG 인 사원들의 모든 정보를 출력
(사원번호:EMPLOYEE_ID로 오름차순 정렬)
*/

SELECT  *
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID   IN (90, 60, 100)
AND     JOB_ID = 'IT_PROG'
ORDER   BY EMPLOYEE_ID
;

--값이 없는 건 연산조차 안됨
SELECT  *
FROM    EMPLOYEES
--WHERE   MANAGER_ID !=0 --값이 없는 건 연산조차 안됨 (NULL)
WHERE MANAGER_ID IS NOT NULL
;

/*
    국가 코드가 JP, US, CA, UK 인 도시 중
    STATE_PROVINCE의 값이 있는 도시명만 조회
    (국가코드 오름차순, 도시명 내림차순 정렬)
*/
SELECT  CITY
FROM    LOCATIONS
WHERE   COUNTRY_ID IN ('JP', 'US', 'CA', 'UK')
AND     STATE_PROVINCE IS NOT NULL
ORDER   BY COUNTRY_ID
, CITY DESC
;

--FIRST_NAME의 값이 'S'로 시작하는 모든 사원들 조회
SELECT  *
FROM    EMPLOYEES
WHERE   fIRST_NAME LIKE 'S%' --대소문자 구분함
AND     LAST_NAME LIKE 'S%'
;

--FIRST_NAME 혹은 LAST_NAME에 'ev'RK VHGKAEHLS TKDNJS WHGHL
SELECT  *
FROM    EMPLOYEES
WHERE   fIRST_NAME LIKE '%ev%'
OR     LAST_NAME LIKE '%ev%'
;

--CTRL + M + 붙여넣기 --> 스트링 형태로 만들기
--원상복귀 : CTRL + P


SELECT  FIRST_NAME|| ' ' || LAST_NAME NAME --ALIAS 이름 바꾸기
-- 같은 문법 SELECT  FIRST_NAME|| ' ' || LAST_NAME AS NAME --ALIAS 이름 바꾸기
-- SELECT  FIRST_NAME|| ' ' || LAST_NAME "이름"
--SELECT  FIRST_NAME|| ' ' || LAST_NAME 이름
FROM    EMPLOYEES
;

SELECT  ROUND(SALARY / 12, 0) AS MONTHLY_INCOME
FROM    EMPLOYEES
;

/*
인센티브(COMMISSION_PCT)를 받는 사람의 총 연봉 구하기
*/
SELECT  FIRST_NAME|| ' ' || LAST_NAME NAME
        , (SALARY + (SALARY * COMMISSION_PCT)) HOLE_INCOME
FROM    EMPLOYEES
WHERE   COMMISSION_PCT IS NOT NULL
;

--현재 시간 출력하기
SELECT  SYSDATE
FROM    DUAL -- 더미 테이블; 하나의 로우만 필요할 때
;

SELECT  TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM    DUAL
;

SELECT  TO_DATE('1994/05/12 01:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM    DUAL
;

SELECT  *
FROM    DUAL
;

SELECT  HIRE_DATE
FROM    EMPLOYEES
WHERE   HIRE_DATE = TO_DATE('2006/03/15')
;

SELECT  FIRST_NAME || ' ' || LAST_NAME NAME
        , CASE
            WHEN COMMISSION_PCT IS NOT NULL
                THEN SALARY + SALARY * COMMISSION_PCT
            ELSE
                SALARY
          END SALARY
        , TO_CHAR(HIRE_DATE, 'YYYY. MM. DD.') HIRE_DATE
FROM    EMPLOYEES
;

SELECT  ROUND(AVG(SALARY),0) AVG_SALARY
        , SUM(SALARY) SUM_SALARY
        , MAX(SALARY) MAX_SALARY
        , MIN(SALARY) MIN_SALARY
        , COUNT(SALARY) CNT_SALARY
        , COUNT(COMMISSION_PCT) CNT_COMMISSION
        , COUNT(*)
        , COUNT(1) --테이블의 로우만큼 숫자 출력
FROM    EMPLOYEES
;

SELECT  1
FROM    EMPLOYEES
;
--EMPLOYEES의 로우 만큼 1이 출력됨

SELECT  DEPARTMENT_ID --집계함수가 나오는 순간 다른 변수 못씀(동시에 일반 컬럼 못씀)
        ,ROUND(AVG(SALARY),0) AVG_SALARY
        , SUM(SALARY) SUM_SALARY
        , MAX(SALARY) MAX_SALARY
        , MIN(SALARY) MIN_SALARY
        , COUNT(SALARY) CNT_SALARY
        , COUNT(COMMISSION_PCT) CNT_COMMISSION
        , COUNT(*)
        , COUNT(1)
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 100
GROUP   BY DEPARTMENT_ID--해결책 : GROUP BY, HAVING
;

--JOB_ID 별 최대 연봉 구하기
SELECT  JOB_ID
        , MAX(SALARY) MAX_SALARY
FROM    EMPLOYEES
GROUP   BY JOB_ID
;

--GROUP BY 집계가 부하가 심해서 사용 잘 안함 거의 안씀
--입사일에 입사한 사원의 수
SELECT  HIRE_DATE
        ,COUNT(1) CNT
FROM    EMPLOYEES
GROUP   BY HIRE_DATE
HAVING  COUNT(1) >= 1--집계된 것을 필터링 할 때 쓰임
ORDER   BY HIRE_DATE
;

--집계함수
SELECT  ROUND( AVG(SALARY), 0 ) AVG_SALARY
        , SUM(SALARY) SUM_SALARY
        , MAX(SALARY) MAX_SALARY
        , MIN(SALARY) MIN_SALARY
        , COUNT(SALARY) CNT_SALARY
        , COUNT(COMMISSION_PCT) CNT_COMMISSION      --NULL은 제외
        , COUNT(*) CNT_ALL                          --NULL 포함
        , COUNT(1)                                  --이렇게 많이 쓰임
FROM    EMPLOYEES
;

SELECT  1
FROM    EMPLOYEES
;

SELECT  ROUND(AVG(SALARY)) AVG_SALARY
        , SUM(SALARY) SUM_SALARY
        , MAX(SALARY) MAX_SALARY
        , MIN(SALARY) MIN_SALARY
        , COUNT(1)
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 100
;

SELECT  DEPARTMENT_ID
        , ROUND(AVG(SALARY)) AVG_SALARY
        , SUM(SALARY) SUM_SALARY
        , MAX(SALARY) MAX_SALARY
        , MIN(SALARY) MIN_SALARY
        , COUNT(1)
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
ORDER   BY DEPARTMENT_ID
;

--에러남. EMPLOYEE_ID로 그룹핑된 것이 아니기 때문에
SELECT  DEPARTMENT_ID
        , ROUND(AVG(SALARY)) AVG_SALARY
        , SUM(SALARY) SUM_SALARY
        , MAX(SALARY) MAX_SALARY
        , MIN(SALARY) MIN_SALARY
        , COUNT(1)
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 100
GROUP   BY EMPLOYEE_ID
;

--JOB_ID별 최대연봉 구하기
SELECT  JOB_ID
        , MAX(SALARY) MAX_SALARY
FROM    EMPLOYEES
GROUP   BY JOB_ID
;

SELECT  HIRE_DATE
        , COUNT(1)
FROM    EMPLOYEES
GROUP   BY HIRE_DATE
HAVING  COUNT(1) > 1
ORDER   BY HIRE_DATE
;

--INNER JOIN, EQUI JOIN, NATURAL JOIN
SELECT  *
FROM    EMPLOYEES
        , DEPARTMENTS
WHERE   EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
;

--에러남. DEPARTMENT_ID가 중복됨 -> PK 테이블 이름 지정해줄 것
SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        , DEPARTMENT_ID
        , DEPARTMENT_NAME
FROM    EMPLOYEES
        , DEPARTMENTS
WHERE   EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
;

SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        , DEPARTMENTS.DEPARTMENT_ID
        , DEPARTMENT_NAME
FROM    EMPLOYEES
        , DEPARTMENTS
WHERE   EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
;

SELECT  E.EMPLOYEE_ID
        , E.FIRST_NAME
        , E.LAST_NAME
        , D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER   BY E.EMPLOYEE_ID
;

SELECT  E.EMPLOYEE_ID
        , E.FIRST_NAME
        , E.LAST_NAME
        , J.JOB_ID
        , J.JOB_TITLE
FROM    EMPLOYEES E
        , JOBS J
WHERE   E.JOB_ID = J.JOB_ID
ORDER   BY E.EMPLOYEE_ID
;

SELECT  D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
        , L.LOCATION_ID
        , L.CITY
FROM    DEPARTMENTS D
        , LOCATIONS L
WHERE   D.LOCATION_ID = L.LOCATION_ID
ORDER   BY D.DEPARTMENT_ID
;

--사원의 이름, 성, 직무명, 부서명 조회
SELECT  E.FIRST_NAME
        , E.LAST_NAME
        , J.JOB_TITLE
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , JOBS J
        , DEPARTMENTS D
WHERE   E.JOB_ID = J.JOB_ID
AND     E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER   BY J.JOB_TITLE
;

--사원이 속한 대륙명 조회
SELECT  E.EMPLOYEE_ID
        , R.REGION_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
        , COUNTRIES C
        , REGIONS R
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     L.LOCATION_ID = D.LOCATION_ID
AND     C.COUNTRY_ID = L.COUNTRY_ID
AND     R.REGION_ID = C.REGION_ID
;

/*
<DB>
서브쿼리
 >2007/1/14에 입사한 사람이 받는 연봉보다 더 많은 연봉을 받는 사원들을 조회해라
 >10번 부서의 평균 연봉보다 더 많은 연봉을 받는 사원들을 조회해라.
 >IT_PROG 직무의 평균 연봉보다 더 많은 연봉을 받는 사원들을 조회해라.
 >자신의 상사보다 더 많은 연봉을 받는 사원들을 조회해라

 ==> 결과와 컬럼을 비교할 때 반드시 필요.

 >FIRST_NAME이 Steven인 사원과 같은 부서 // 에서 일을 하는 // 모든 사원들의 정보를 조회
  --------------------------   ---------                            ------------- -> 1. EMPLOYEES

 >소괄호가 먼저 시행됨.
 >서브 쿼리 먼저 실행해보기. 2개 이상인 경우 IN 사용 (=를 사용하게 되면 에러남)

 >INLINE-TALBE / INLINE-VIEW : 쿼리의 결과를 테이블로 쓰는 것
   SELECT  *
   FROM    (
               SELECT  *
                FROM    (
                           SELECT  DEPARTMENT_ID
                                   , AVG(SALARY) AVG_SALARY
                           FROM    EMPLOYEES
                           GROUP   BY DEPARTMENT_ID
                       )
               WHERE   ROWNUM = 1
               ORDER   BY AVG_SALARY DESC
           )
   WHERE   ROWNUM = 1
   ;
  -제일 많이 판매된 상품을 조회해라.
  -조회수가 가장 많은 광고를 조회헤라
  -Pagenation   <- 웹 페이지 밑에 1 2 3 4 ... (데이터가 너무 많아 페이지를 나누어 보여주는 것)
*/
/*
    FIRST_NAME이 Steven인 사원과 같은 부서에서 일을 하는 모든 사원들의 정보를 조회
*/
SELECT  *
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN (
                          SELECT DEPARTMENT_ID
                          FROM   EMPLOYEES
                          WHERE  FIRST_NAME = 'Steven'
                         )                           --소괄호가 먼저 시행
;

/*
    FIRST_NAME이 Steven인 사원과 같은 부서에서 일을 하는 모든 사원들의 정보를 조회
    단, 본인은 결과에서 제회한다.
*/
SELECT  *
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN (
                          SELECT DEPARTMENT_ID
                          FROM   EMPLOYEES
                          WHERE  FIRST_NAME = 'Steven'
                          )
AND     FIRST_NAME != 'Steven'
;

/*
    전체사원의 평균 연봉보다 더 많은 연봉을 받는 사원들의  사원번호, 이름(FIRST_NAME, LAST_NAME), 연봉 그리고 부서명을 조회
    연봉 오름차순 정렬
*/
SELECT  E.EMPLOYEE_ID
        , E.FIRST_NAME || ' ' || E.LAST_NAME NAME
        , E.SALARY
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     E.SALARY > (
                    SELECT  ROUND (AVG(SALARY) ,0)
                    FROM    EMPLOYEES
                   )
ORDER   BY E.SALARY
;

/*
    Seattle에서 근무하는 모든 사원들을 조회하라.
    Case 1. Join
    Case 2. Sub Query
*/
-- 1. Join
SELECT  E.*
        , L.CITY
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     L.LOCATION_ID = D.LOCATION_ID
AND     L.CITY = 'Seattle'
ORDER   BY EMPLOYEE_ID
;

-- 2. Sub Query
SELECT  *
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN (
                            SELECT  DEPARTMENT_ID
                            FROM    DEPARTMENTS
                            WHERE   LOCATION_ID = (
                                                    SELECT  LOCATION_ID
                                                    FROM    LOCATIONS
                                                    WHERE   CITY = 'Seattle'
                                                   )
                        )
ORDER   BY EMPLOYEE_ID
;

/*
    평균 급여가 가장 많은 부서를 조회하라.
    (INLINE-VIEW / INLINE-TABLE) : 쿼리의 결과를 테이블로 쓰는 것
*/
SELECT  *
FROM    (                               -- VIEW
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY) AVG_SALARY
            FROM    EMPLOYEES
            GROUP   BY DEPARTMENT_ID
        )
ORDER   BY AVG_SALARY DESC
;

SELECT  *
FROM    (
            SELECT  *
            FROM    (
                        SELECT  DEPARTMENT_ID
                                , AVG(SALARY) AVG_SALARY
                        FROM    EMPLOYEES
                        GROUP   BY DEPARTMENT_ID
                    )
            ORDER   BY AVG_SALARY DESC
        )
WHERE   ROWNUM = 1                  -- 행번호 1번
;

/*
    부서별 평균 연봉이 회사 전체 평균보다 적은 부서명과 평균연봉을 조회하라
*/
SELECT  D.DEPARTMENT_NAME
        , A.AVG_SALARY
FROM    DEPARTMENTS D
        , (SELECT  DEPARTMENT_ID
                    , AVG(SALARY) AVG_SALARY
           FROM    EMPLOYEES E
           GROUP   BY DEPARTMENT_ID
           HAVING  AVG(SALARY) < (
                                    SELECT  AVG(SALARY)
                                    FROM    EMPLOYEES
                                  )
           ) A
WHERE   D.DEPARTMENT_ID = A.DEPARTMENT_ID
ORDER   BY D.DEPARTMENT_NAME
;
--답안1 (셋 중 가장 느림)
SELECT  D.DEPARTMENT_NAME
        , AVG_D.AVG_SALARY
FROM    (
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY) AVG_SALARY
            FROM    EMPLOYEES
            GROUP   BY DEPARTMENT_ID
        ) AVG_D
        , DEPARTMENTS D
WHERE   AVG_D.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     AVG_SALARY < (
                        SELECT  AVG(SALARY)
                        FROM    EMPLOYEES
                     )
;

--답안2 (2,3 속도 같음)
SELECT  AVG_D.DEPARTMENT_NAME
        , AVG_D.AVG_SALARY
FROM    (
            SELECT  D.DEPARTMENT_NAME
                    , AVG(SALARY) AVG_SALARY
            FROM    EMPLOYEES E
                    , DEPARTMENTS D
            WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
            GROUP   BY D.DEPARTMENT_NAME
        ) AVG_D
WHERE   AVG_SALARY < (
                        SELECT  AVG(SALARY)
                        FROM    EMPLOYEES
                      )
;

--답안3 (2,3 속도 같음)
SELECT  D.DEPARTMENT_NAME
        , AVG(SALARY) AVG_SALARY
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP   BY D.DEPARTMENT_NAME
HAVING  AVG(SALARY) < (
                        SELECT  AVG(SALARY)
                        FROM    EMPLOYEES
                       )
;

/*
    직무 아이디별 평균 연봉이 회사 전체 평균 연봉보다 크거나 같은 직무를 가진 사원들의 모든 정보를 출력
*/

SELECT  E.*
FROM    EMPLOYEES E
        , (
            SELECT  JOB_ID
                   , AVG(SALARY) AVG_SALARY
            FROM    EMPLOYEES
            GROUP   BY JOB_ID
            HAVING  AVG(SALARY) >= (
                                    SELECT  AVG(SALARY)
                                    FROM    EMPLOYEES
                                  )
        ) A
WHERE   E.JOB_ID = A.JOB_ID
;

--
SELECT  E.*
FROM    (
            SELECT  JOB_ID
                    , AVG(SALARY) JOB_AVG
            FROM    EMPLOYEES
            GROUP   BY  JOB_ID
        ) J
        , EMPLOYEES E
WHERE   J.JOB_AVG >= (
                        SELECT  AVG(SALARY)
                        FROM    EMPLOYEES
                     )
AND     J.JOB_ID = E.JOB_ID
;

--
SELECT  *
FROM    EMPLOYEES E
        , (
            SELECT  JOB_ID
                    , AVG(SALARY) AVG_SALARY
            FROM    EMPLOYEES
            GROUP   BY JOB_ID
            HAVING  AVG(SALARY) >= (
                                        SELECT  AVG(SALARY)
                                        FROM    EMPLOYEES
                                    )
        ) JOB_AVG
WHERE   E.JOB_ID = JOB_AVG.JOB_ID
;

/*
    사원이 단 한명도 존재하지 않는 도시명을 조회
*/
SELECT  CITY
FROM    LOCATIONS
WHERE   LOCATION_ID NOT IN (
                            SELECT  DISTINCT LOCATION_ID
                            FROM    EMPLOYEES E
                                    , DEPARTMENTS D
                            WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
                           )
ORDER   BY CITY
;

/*
    답안
    EMPLOYEES - DEPARTMENTS - LOCATIONS
    1. 사원이 없는 부서의 LOCATION_ID 조회 (중복제거)
    2. LOCATIONS에서 사원이 있는 부서의 LOCATION_ID 제외
*/
SELECT  CITY
FROM    LOCATIONS
WHERE   LOCATION_ID NOT IN (
                                SELECT  DISTINCT LOCATION_ID
                                FROM    EMPLOYEES E
                                        , DEPARTMENTS D
                                WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
                            )
;

SELECT  CITY
FROM    LOCATIONS
WHERE   LOCATION_ID IN (
                            SELECT  LOCATION_ID
                            FROM    LOCATIONS
                            MINUS
                            SELECT  DISTINCT LOCATION_ID
                            FROM    EMPLOYEES E
                                    , DEPARTMENTS D
                            WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
                        )
;

/*
    부서의 사원수가 5명 미만인 부서의 부서별 평균 연봉을 구해 평균 연봉이 가장 높은
    부서의 부서명을 조회
*/
SELECT  DEPARTMENT_NAME
FROM    DEPARTMENTS D
        , (
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY)
            FROM    EMPLOYEES
            GROUP   BY DEPARTMENT_ID
            HAVING  COUNT(1) < 5
            ORDER   BY AVG(SALARY) DESC
           ) A
WHERE   ROWNUM = 1
AND     D.DEPARTMENT_ID = A.DEPARTMENT_ID
;

--답안
SELECT  DEPARTMENT_NAME
FROM    (
            SELECT  D.DEPARTMENT_NAME
                    , AVG(SALARY) AVG
            FROM    DEPARTMENTS D
                    , EMPLOYEES E
            WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
            GROUP   BY D.DEPARTMENT_NAME
            HAVING  COUNT(1) < 5
            ORDER   BY AVG DESC
        )
WHERE   ROWNUM = 1
;

