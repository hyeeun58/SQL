-- 서브쿼리

-- 문제 1.
SELECT  COUNT(*)
FROM    EMPLOYEES E
        , (
            SELECT  AVG(SALARY) AS AVG_SALARY
            FROM    EMPLOYEES
        ) S
WHERE   E.SALARY < S.AVG_SALARY
;

-- 문제 2.
SELECT  E.EMPLOYEE_ID   AS "사번"
        , E.LAST_NAME   AS "성"
        , E.SALARY      AS "연봉"        
FROM    EMPLOYEES E
        , (
            SELECT  DEPARTMENT_ID, MAX(SALARY) AS MAX_SAL
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
        ) MAX
WHERE   E.DEPARTMENT_ID = MAX.DEPARTMENT_ID
    AND E.SALARY = MAX.MAX_SAL
ORDER BY E.SALARY DESC
;

-- 문제 3.
SELECT  E.EMPLOYEE_ID   AS "사번"
        , E.LAST_NAME   AS "성"
        , E.SALARY      AS "연봉"        
FROM    EMPLOYEES E
        , (
            SELECT  DEPARTMENT_ID, MAX(SALARY) AS SUM_SAL
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
        ) MAX
WHERE   E.DEPARTMENT_ID = MAX.DEPARTMENT_ID
    AND E.SALARY = MAX.SUM_SAL
ORDER BY E.SALARY DESC
;

-- 문제 4.
SELECT  E.EMPLOYEE_ID   AS "사번"
        , E.LAST_NAME   AS "성"
        , E.SALARY      AS "연봉"        
FROM    EMPLOYEES E
        , (
            SELECT  DEPARTMENT_ID, AVG(SALARY) AS AVG_SAL
            FROM    EMPLOYEES
            GROUP BY DEPARTMENT_ID
        ) MAX
WHERE   E.DEPARTMENT_ID = MAX.DEPARTMENT_ID
    AND E.SALARY > MAX.AVG_SAL
ORDER BY E.SALARY DESC
;


