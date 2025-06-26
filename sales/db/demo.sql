------------------
------ DEMO ------
------------------




------ 1. Preparation ------
-- Delete all data from the cubes
DELETE FROM TD_IS_C;
DELETE FROM TD_RS_C;



------ 2. Check initial state ------
-- Expected 60398 entries in DS_IS_TD
SELECT COUNT(*) from DS_IS_TD; 

-- Show first 10 entries in DS_IS_TD
SELECT * from DS_IS_TD LIMIT 10;

-- Expected 60855 entries in DS_RS_TD
SELECT COUNT(*) from DS_RS_TD; 

-- Show first 10 entries in DS_RS_TD
SELECT * from DS_RS_TD LIMIT 10;

-- Expected 0 entries in cube tables
SELECT COUNT(*) from TD_IS_C; 
SELECT COUNT(*) from TD_RS_C; 



------ 3. Execute trigger ZSD_M16 process using the form at ------
------ http://localhost/services/web/sales/gen/sls_mp-process/forms/sls_mp-process/index.html ------



------ 4. Check result ------

-- Expected X entries in TD_IS_C
SELECT COUNT(*) from TD_IS_C;

-- Show first 10 entries in TD_IS_C
SELECT * from TD_IS_C LIMIT 10;


-- Expected X entries in TD_RS_C
SELECT COUNT(*) from TD_RS_C;

-- Show first 10 entries in TD_RS_C
SELECT * from TD_RS_C LIMIT 10;
