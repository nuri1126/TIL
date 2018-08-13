-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
SELECT  FIRST_NAME, LAST_NAME
FROM    EMPLOYEES
;

-- 2. 모든 사원의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES
;

-- 3. 모든 도시 명을 조회하라.
SELECT  CITY
FROM    LOCATIONS
;

-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
SELECT  FIRST_NAME
FROM    EMPLOYEES
WHERE   FIRST_NAME LIKE 'M%'
;

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
SELECT  FIRST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   FIRST_NAME LIKE '_a%'
;

-- 6. 도시 명을 오름차순 정렬하라.
SELECT  CITY
FROM    LOCATIONS
ORDER   BY CITY ASC
;

-- 7. 부서 명을 내림차순 정렬하라.
SELECT  DEPARTMENT_NAME
FROM    DEPARTMENTS
ORDER   BY  DEPARTMENT_NAME DESC
;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
SELECT  *
FROM    EMPLOYEES
WHERE   SALARY >= 7000
ORDER   BY SALARY
;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES
WHERE   COMMISSION_PCT IS NULL
;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES
WHERE   COMMISSION_PCT IS NOT NULL
;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.
SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        ,DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   HIRE_DATE = TO_DATE('2007.06.21')
;

-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
SELECT  EMPLOYEE_ID
        , HIRE_DATE
FROM    EMPLOYEES
WHERE   HIRE_DATE > TO_DATE('2006.1.1')
AND     HIRE_DATE < TO_DATE('2007.1.1')
;

-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.
SELECT  FIRST_NAME
FROM    EMPLOYEES
WHERE   FIRST_NAME LIKE '_____%'
;

-- 14. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)
SELECT  D.DEPARTMENT_ID
        , COUNT(D.DEPARTMENT_ID)
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP   BY  D.DEPARTMENT_ID

;
-- 15. 직무 아이디별 평균 연봉을 조회하라. (직무 아이디 내림차순 정렬)
SELECT  EMPLOYEE_ID
        ,AVG(SALARY)
FROM    EMPLOYEES
ORDER   BY  EMPLOYEE_ID DESC;

-- 16. 상사가 있는 사원들의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES
WHERE   MANAGER_ID IS NOT NULL
;

-- 17. 상사가 없는 사원들의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES
WHERE   MANAGER_ID IS NULL
;

-- 18. 모든 사원들의 사원번호, 이름(FIRST_NAME, LAST_NAME), 부서번호 그리고 부서명을 조회하라.
SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
;

-- 19. 모든 부서의 부서명과 도시명을 조회하라.
SELECT  DEPARTMENT_NAME
        , CITY
FROM    DEPARTMENTS D
        , LOCATIONS L
WHERE   D.LOCATION_ID = L.LOCATION_ID
;

-- 20. 모든 사원들의 사원번호, 부서명, 직무명을 조회하라.
SELECT  EMPLOYEE_ID
        , DEPARTMENT_NAME
        , JOB_TITLE
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , JOBS J
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     E.JOB_ID = J.JOB_ID
;

-- 21. 모든 사원들의 사원번호, 부서명, 직무명, 도시명을 조회하라.
SELECT  EMPLOYEE_ID
        , DEPARTMENT_NAME
        , JOB_TITLE
        , CITY
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , JOBS J
        , LOCATIONS L
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     E.JOB_ID = J.JOB_ID
AND     D.LOCATION_ID = L.LOCATION_ID
;

-- 22. 10번, 20번, 30번 부서에서 근무하는 사원들의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     (D.DEPARTMENT_ID = 10
        OR D.DEPARTMENT_ID = 20
        OR D.DEPARTMENT_ID = 30)
;

-- 23. 6인 미만의 사원이 근무하는 부서의 이름을 조회하라.
SELECT  D.DEPARTMENT_NAME
        , COUNT(1) CNT
FROM    DEPARTMENTS D
        , EMPLOYEES E
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP   BY D.DEPARTMENT_NAME
HAVING  COUNT(1) < 6
;

-- 24. 4인 미만의 사원이 근무하는 부서의 평균 연봉과 부서명을 조회하라.
SELECT  DEPARTMENT_NAME
        ,AVG(SALARY) AVG_SALARY
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP   BY D.DEPARTMENT_NAME
HAVING  COUNT(1) < 4
;

-- 25. IT 부서의 연봉 총합을 조회하라.
SELECT  SUM(SALARY)
FROM    EMPLOYEES E
        ,DEPARTMENTS D
WHERE   DEPARTMENT_NAME = 'IT'
AND     E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 26. 대륙명(REGIONS)별 도시의 개수를 조회하라.
SELECT  REGION_NAME
        , COUNT(CITY)
FROM    COUNTRIES C
        , REGIONS R
WHERE   L.COUNTRY_ID = C.COUNTRY_ID
AND     C.REGION_ID = R.REGION_ID
GROUP   BY REGION_NAME
;

SELECT  R.REGION_NAME, C.CNT
FROM    (
    SELECT  COUNT(1)
            , C.REGION_ID
    FROM    COUNTRIES C
            , LOCATIONS L
    WHERE   C.COUNTRY_ID = L.COUNTRY_ID
    GROUP   BY C.REGION_ID
    ) C
    , REGION R
WHERE   C.REGION_ID = C.REGION_ID
;

-- 27. 도시명 별 부서의 개수를 조회하라.!!!!!!!!!!!!!
SELECT  L.CITY
        , COUNT(1) NUM_OF_DEPARTMENTS
FROM    LOCATIONS L
        , DEPARTMENTS D
WHERE   L.LOCATION_ID = D.LOCATION_ID
GROUP   BY L.CITY
;

-- 28. 부서가 존재하지 않는 도시를 조회하라.
SELECT CITY
FROM    LOCATIONS
MINUS
SELECT  CITY
FROM    LOCATIONS L
        ,DEPARTMENTS D
WHERE   L.LOCATION_ID = D.LOCATION_ID
GROUP   BY CITY
;

SELECT  L.CITY
FROM    LOCATIONS L
        ,(
        SELECT  CITY
        FROM    LOCATIONS L
                ,DEPARTMENTS D
        WHERE   L.LOCATION_ID = D.LOCATION_ID
        GROUP   BY CITY
        ) LL
WHERE   L.CITY NOT IN LL.CITY
GROUP BY L.CITY
;

-- 29. 사원이 존재하지 않는 국가를 조회하라.

-- 30. 150번 사원보다 빨리 입사한 사원 중 가장 최신에 입사한 사원의 모든 정보를 조회하라.

-- 31. 직무를 전환한 이력이 있는 사원의 모든 정보를 조회하라. 정말 중요한것
SELECT  DISTINCT MANAGER.*
FROM    EMPLOYEES MANAGER    -- 상사
        , EMPLOYEES EMPLOYEE  -- 상사를 가진직원
WHERE   MANAGER.EMPLOYEE_ID = EMPLOYEE.MANAGER_ID
;

-- 32. 부서장으로 있는 사원의 모든 정보와 부서명을 조회하라.
SELECT  *
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     E.EMPLOYEE_ID = D.MANAGER_ID
;

-- 33. 다른 사원의 상사인 사원의 모든 정보를 조회하라.

-- 34. 이름(FIRST_NAME)이 C로 시작하고 s로 끝나는 사원의 부서명, 직무명, 도시명, 국가명, 대륙명을 조회하라.

-- 35. 직무를 전환한 이력이 없는 사원의 모든 정보를 조회하라.

-- 36. 150번 사원보다 늦게 입사한 사원 중 150번 사원보다 더 많은 연봉을 받는 사원을 조회하라.

-- 37. 자신의 상사가 자신 보다 늦게 입사한 사원의 모든 정보를 조회하라.다시 풀어보기 내가 안풀엇음
SELECT  E.*
FROM    EMPLOYEES E
        , EMPLOYEES MANAGER
WHERE   E.MANAGER_ID  = MANAGER.EMPLOYEE_ID
AND     E.HIRE_DATE < MANAGER.HIRE_DATE
;


-- 38. 100번 사원을 직속 상사로 두고 있는 사원들의 모든 정보를 조회하라.


-- 39. 100번 사원을 상사로 두고 있는 모든 사원들의 모든 정보를 조회하라.!!!! 중요 계층쿼리를 사용해야함
SELECT  LEVEL
        , E.*
FROM    EMPLOYEES E
START   WITH    E.MANAGER_ID = 100
CONNECT BY PRIOR E.EMPLOYEE_ID = E.MANAGER_ID
;

-- 112번 사원의 모든 상사를 조회하라
SELECT  LEVEL
        , E.*
FROM    EMPLOYEES E
START   WITH E.EMPLOYEE_ID = 112
CONNECT BY PRIOR E.MANAGER_ID = E.EMPLOYEE_ID
;

--150번 사원의 모든 상사들의
--이름(FIRST_NAME)과 부서명을 조회하라
SELECT  LEVEL, FIRST_NAME, DEPARTMENT_NAME, E.*
FROM    EMPLOYEES E, DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
START   WITH E.EMPLOYEE_ID = 150
CONNECT BY PRIOR E.MANAGER_ID = E.EMPLOYEE_ID
;

-- 40. 사원수가 가장 많은 도시의 이름을 조회하라.

-- 41. 직무의 종류가 가장 많은 부서의 이름을 조회하라. 엄청나게 어려운 문제임

-- 42. 담당 직무를 통틀어서 최대 연봉을 받고 있는 사원들의 모든 정보를 조회하라.
SELECT  *
FROM    EMPLOYEES E
        ,(
        SELECT  E.JOB_ID, MAX(SALARY) MAX_SALARY
        FROM    EMPLOYEES E
        GROUP   BY E.JOB_ID
        )X
WHERE   E.JOB_ID = X.JOB_ID
AND     E.SALARY = X.MAX_SALARY
ORDER   BY E.JOB_ID
;

--그 직무에서 받을 수 있는 최대연봉을 받을 수 있는사람
SELECT  *
FROM    EMPLOYEES E
        , JOBS J
WHERE   E.JOB_ID = J.JOB_ID
AND     J.MAX_SALARY = E.SALARY
;

-- 43. 담당 직무의 최소 연봉을 받고 있는 사원들의 모든 정보를 조회하라.!!!!!!!!!!!!
SELECT  *
FROM    EMPLOYEES E
        ,(
        SELECT  J.JOB_ID, MIN(SALARY) MIN_SALARY
        FROM    EMPLOYEES E
                , JOBS J
        WHERE   E.JOB_ID = J.JOB_ID
        GROUP   BY J.JOB_ID
        )X
WHERE   E.JOB_ID = X.JOB_ID
AND     E.SALARY = X.MIN_SALARY
ORDER   BY E.JOB_ID
;

-- 44. 부서와 직무별 최대연봉, 최소연봉, 사원수를 조회하라.
SELECT  E.DEPARTMENT_ID
        , E.JOB_ID
        , MAX(SALARY)
        , MIN(SALARY)
        , COUNT(1)
FROM    DEPARTMENTS D
        , EMPLOYEES E
        , JOBS J
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     J.JOB_ID = E.JOB_ID
GROUP   BY E.DEPARTMENT_ID, E.JOB_ID
;

--보경언니 답
SELECT  D.DEPARTMENT_NAME
        , J.JOB_ID
        , JOBBB.MAS
        , JOBBB.MIS
        , JOBBB.COEM
FROM    DEPARTMENTS D
        , EMPLOYEES E
        , JOBS J
        , (
            SELECT  J.JOB_ID
                    , MAX(SALARY) MAS
                    , MIN(SALARY) MIS
                    , COUNT(EMPLOYEE_ID) COEM
            FROM    JOBS J
                    , EMPLOYEES E
            WHERE   J.JOB_ID = E.JOB_ID
            GROUP   BY J.JOB_ID
           ) JOBBB
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     E.JOB_ID IN JOBBB.JOB_ID
--GROUP   BY D.DEPARTMENT_NAME
;

-- 45. 사원수가 가장 많은 도시에서 근무하는 모든 사원들의 연봉 총합을 조회하라.
SELECT  DISTINCT *
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
        , (
            SELECT *
            FROM (
            SELECT   CITY, COUNT(1) CNT
            FROM     LOCATIONS L
                        , DEPARTMENTS D
                        , EMPLOYEES E
            WHERE    L.LOCATION_ID = D.LOCATION_ID
            AND      D.DEPARTMENT_ID = E.DEPARTMENT_ID
            GROUP    BY  CITY
            ORDER    BY CNT DESC
            )
            WHERE ROWNUM = 1
        ) X
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.LOCATION_ID = L.LOCATION_ID
AND     L.CITY = X.CITY
;

-- 46. 사원수가 가장 많은 도시에서 근무하는 모든 사원들의 부서별 및 직무별 평균 연봉을 조회하라.
SELECT  E.DEPARTMENT_ID, E.JOB_ID, AVG(SALARY)
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
        , (
            SELECT *
            FROM (
            SELECT   CITY, COUNT(1) CNT
            FROM     LOCATIONS L
                        , DEPARTMENTS D
                        , EMPLOYEES E
            WHERE    L.LOCATION_ID = D.LOCATION_ID
            AND      D.DEPARTMENT_ID = E.DEPARTMENT_ID
            GROUP    BY  CITY
            ORDER    BY CNT DESC
            )
            WHERE ROWNUM = 1
        ) X
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.LOCATION_ID = L.LOCATION_ID
AND     L.CITY = X.CITY
GROUP   BY E.DEPARTMENT_ID, E.JOB_ID
;

SELECT  E.DEPARTMENT_ID, E.JOB_ID, AVG(SALARY)
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , (
            SELECT *
            FROM (
            SELECT   LOCATION_ID, COUNT(1) CNT
            FROM     DEPARTMENTS D
                        , EMPLOYEES E
            WHERE      D.DEPARTMENT_ID = E.DEPARTMENT_ID
            GROUP    BY  LOCATION_ID
            ORDER    BY CNT DESC
            )
            WHERE ROWNUM = 1
        ) X
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.LOCATION_ID = X.LOCATION_ID
GROUP   BY E.DEPARTMENT_ID, E.JOB_ID
;


-- 47. 입사일이 가장 오래된 사원을 조회하라.
SELECT  *
FROM    EMPLOYEES E
WHERE   HIRE_DATE = (
                    SELECT  MIN(HIRE_DATE)
                    FROM    EMPLOYEES
                    )
;

-- 48. 입사일이 가장 최근인 사원을 조회하라.
SELECT  *
FROM    EMPLOYEES E
WHERE   HIRE_DATE = (
                    SELECT  MAX(HIRE_DATE)
                    FROM    EMPLOYEES
                    )
;

-- 49. 가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 일차를 계산해 조회하라.
SELECT  (MAX(HIRE_DATE) - MIN(HIRE_DATE)) 입사일차
FROM    EMPLOYEES
;

-- 50. 가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 시간차를 계산해 조회하라.
SELECT  (MAX(HIRE_DATE) - MIN(HIRE_DATE))*24 입사시간차
FROM    EMPLOYEES
;

--지금 시각
SELECT  SYSDATE
        , SYSDATE - 1
        , SYSDATE + 1
        , ADD_MONTHS(SYSDATE, 1)
        , ADD_MONTHS(SYSDATE, -1)
        , SYSDATE - (1/24)
FROM    DUAL
;
