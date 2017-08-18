-- 실습생 훈련(혼합) 문제

-- 문제 1.
SELECT  (E.FIRST_NAME || ' ' || E.LAST_NAME) AS "이름"
		, E.SALARY          AS "연봉"
		, D.DEPARTMENT_NAME AS "부서"
FROM    EMPLOYEES E,DEPARTMENTS D
		, (
			SELECT  MAX(HIRE_DATE) AS MAX_HIRE
			FROM    EMPLOYEES
		) X
WHERE   E.HIRE_DATE = X.MAX_HIRE
	AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
; 

-- 문제 2.
SELECT  E.EMPLOYEE_ID   AS "사번"
        , E.LAST_NAME   AS "성"  , E.DEPARTMENT_ID
        , E.SALARY      AS "연봉"
FROM    EMPLOYEES E
        , (
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY) AS AVG_SALARY
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
        ) A
WHERE   E.DEPARTMENT_ID = A.DEPARTMENT_ID(+)
    AND E.SALARY > A.AVG_SALARY
;
            
-- 문제 3.
SELECT  E.EMPLOYEE_ID   AS "사번"
        , E.FIRST_NAME  AS "이름"
        , E.LAST_NAME   AS "성"
        , J.JOB_TITLE   AS "업무"
        , E.SALARY      AS "연봉"
FROM    EMPLOYEES E
        , JOBS J
        , (
            SELECT  ROWNUM  AS RN
                    , S.DEPARTMENT_ID
                    , S.AVG_SAL AS MAX_SAL
            FROM    (
                        SELECT  DEPARTMENT_ID
                                , AVG(SALARY)   AS AVG_SAL
                        FROM    EMPLOYEES
                        GROUP BY DEPARTMENT_ID
                        ORDER BY AVG_SAL DESC
                    ) S
            WHERE   ROWNUM = 1
        ) MAX
WHERE   E.JOB_ID = J.JOB_ID
    AND E.DEPARTMENT_ID = MAX.DEPARTMENT_ID
;

-- 문제 4.
SELECT  D.DEPARTMENT_NAME	AS "부서"
FROM    DEPARTMENTS D
        , (
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY)   AS AVG_SAL
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
            ORDER BY AVG_SAL DESC
        ) S
WHERE   ROWNUM = 1
    AND S.DEPARTMENT_ID = D.DEPARTMENT_ID
;
    
-- 문제 5.
SELECT  L.CITY	AS "지역"
FROM    DEPARTMENTS D
        , LOCATIONS L
        , (
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY)   AS AVG_SAL
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
            ORDER BY AVG_SAL DESC
        ) S
WHERE   ROWNUM = 1
    AND S.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.LOCATION_ID = L.LOCATION_ID
;
    
-- 문제 6.
SELECT  J.JOB_TITLE	AS "업무"
FROM    EMPLOYEES E
        , JOBS J
        , (
            SELECT  DEPARTMENT_ID
                    , AVG(SALARY)   AS AVG_SAL
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
            ORDER BY AVG_SAL DESC
        ) S
WHERE   ROWNUM = 1
    AND E.DEPARTMENT_ID = S.DEPARTMENT_ID
    AND E.JOB_ID = J.JOB_ID
;
    
    
    