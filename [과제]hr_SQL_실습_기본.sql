-- 문제 1.
select FIRST_NAME || ' ' || LAST_NAME as "이름"
        , SALARY as "이메일"
        , PHONE_NUMBER as "전화번호"
from EMPLOYEES
order by HIRE_DATE ASC;

-- 문제 2.
select JOB_TITLE
        , MAX_SALARY
from JOBS
order by MAX_SALARY desc;

-- 문제 3.
select count(*)
from EMPLOYEES
where MANAGER_ID is null;

-- 문제 4. 
select JOB_TITLE
        , MAX_SALARY
from JOBS
order by MAX_SALARY desc;

-- 문제 5.
select count(DEPARTMENT_ID)
from DEPARTMENTS;

-- 문제 6.
select *
from DEPARTMENTS
order by length(DEPARTMENT_NAME) desc;

-- 문제 7.
select count(*)
from DEPARTMENTS
where MANAGER_ID is null;

-- 문제 8.
select upper(COUNTRY_NAME)
from COUNTRIES
where REGION_ID is not null
order by COUNTRY_NAME ASC;

-- 문제 9.
select * 
from REGIONS
order by length(REGION_NAME) ASC;

-- 문제 10.
select lower(CITY) 
from LOCATIONS
order by CITY ASC;
