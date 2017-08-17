-- 집계(통계) SQL

-- 문제 1.
SELECT  MAX(SALARY)     AS "최고임금"
        , MIN(SALARY)   AS "최저임금"
        , (MAX(SALARY) - MIN(SALARY)) AS "최고임금 - 최저임금"
FROM    EMPLOYEES
;


-- 문제 2.
SELECT  TO_CHAR(max(HIRE_DATE), 'yyyy') || '년 ' ||
        TO_CHAR(max(HIRE_DATE), 'MM') || '월 ' ||
        TO_CHAR(max(HIRE_DATE), 'dd') || '일'
        AS "최종입사일자"
FROM    EMPLOYEES
;
-- 2008년 04월 21일

-- 문제 3.
SELECT  DEPARTMENT_ID   AS "부서"
        , ROUND(AVG(SALARY))   AS "평균연봉"
        , MAX(SALARY)   AS "최고임금"
        , MIN(SALARY)   AS "최저임금"
FROM    EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY AVG(SALARY) DESC, MAX(SALARY) DESC, MIN(SALARY)
;

-- 문제 4.
SELECT  JOB_ID   AS "업무"
        , ROUND(AVG(SALARY))   AS "평균연봉"
        , MAX(SALARY)   AS "최고임금"
        , MIN(SALARY)   AS "최저임금"
FROM    EMPLOYEES
GROUP BY JOB_ID
ORDER BY AVG(SALARY) DESC, MAX(SALARY) DESC, MIN(SALARY)
;

-- 문제 5.
SELECT  TO_CHAR(MIN(HIRE_DATE), 'yyyy') || '년 ' ||
        TO_CHAR(MIN(HIRE_DATE), 'MM') || '월 ' ||
        TO_CHAR(MIN(HIRE_DATE), 'dd') || '일'
        AS "최초입사일자"
FROM    EMPLOYEES
;

-- 문제 6.
SELECT  DEPARTMENT_ID   AS "부서"
        , ROUND(AVG(SALARY))   AS "평균임금"
        , MIN(SALARY)   AS "최저임금"
        , (ROUND(AVG(SALARY))-MIN(SALARY))  AS "평균임금-최저임금"
FROM    EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING  (ROUND(AVG(SALARY))-MIN(SALARY)) < 2000
ORDER BY (ROUND(AVG(SALARY))-MIN(SALARY)) DESC
;

-- 문제 7.
SELECT  JOB_ID  AS "업무"
        , MAX(SALARY)   AS "최고임금"
        , MIN(SALARY)   AS "최저임금"
        , (MAX(SALARY)-MIN(SALARY)) AS "차이"
FROM    EMPLOYEES
GROUP BY JOB_ID
ORDER BY (MAX(SALARY)-MIN(SALARY)) DESC
;
