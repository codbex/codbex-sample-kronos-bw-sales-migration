------------------
------ DEMO ------
------------------




------ 1. Preparation ------
DELETE FROM TD_IS_C;



------ 2. Check initial state ------
-- Expected X entries in TD_IS
SELECT COUNT(*) from TD_IS; 

-- Show first 10 entries in TD_IS
SELECT * from TD_IS LIMIT 10;

-- Expected 0 entries in TD_IS_C
SELECT COUNT(*) from TD_IS_C; 



------ 3. Execute trigger ZSD_M16 process using the form at ------
------ http://localhost/services/web/sales/gen/sls_mp-process/forms/sls_mp-process/index.html ------



------ 4. Check result ------

-- Expected X entries in TD_IS_C
SELECT COUNT(*) from TD_IS_C; 

-- Show first 10 entries in TD_IS_C
SELECT * from TD_IS_C LIMIT 10;
