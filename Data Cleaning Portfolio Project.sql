/*

Data Cleaning in SQL Queries

*/

USE project;

SELECT *
FROM raw_data;

--------------------------------------------------------------------------------------------------------------------------

-- Creating a Staging Table
 
CREATE TABLE raw_data2
LIKE raw_data;

INSERT raw_data2
SELECT*
FROM raw_data;

--------------------------------------------------------------------------------------------------------------------------

-- REMOVING DUPLICATES

SELECT*
FROM raw_data2;

SELECT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions, COUNT(*) AS `duplicate`
FROM raw_data2
GROUP BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
HAVING `duplicate` > 1;

--  Creating a new table for adding a count() fuction column for displaying any extra data 

CREATE TABLE `raw_data3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `count` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO raw_data3
SELECT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions, COUNT(*)
FROM raw_data2
GROUP BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
;

SELECT*
FROM raw_data3;

SELECT*
FROM raw_data3
WHERE count > 1;

-- Deleting all the data which are more than one

DELETE 
FROM raw_data3
WHERE count > 1
;

SELECT*
FROM raw_data3
WHERE count > 1;

SELECT*
FROM raw_data3
;

--------------------------------------------------------------------------------------------------------------------------

-- STANDERDIZE THE DATA

SELECT*
FROM RAW_DATA3
;

-- Removing Blank Spaces

SELECT COMPANY, TRIM(COMPANY)
FROM RAW_DATA3
ORDER BY 1;

UPDATE RAW_DATA3
SET COMPANY = TRIM(COMPANY)
;

-- Removing unnecessary Fullstops.

SELECT distinct COUNTRY, TRIM(TRAILING '.' FROM COUNTRY)
FROM RAW_DATA3
ORDER BY 1
;

UPDATE RAW_DATA3
SET COUNTRY = TRIM(TRAILING '.' FROM COUNTRY)
;

-- Correcting Spelling Mistakes

SELECT distinct INDUSTRY
FROM RAW_DATA3
WHERE INDUSTRY LIKE 'CRYPTO%'
;

UPDATE RAW_DATA3
SET industry = 'Crypto Currency'
WHERE INDUSTRY LIKE 'CRYPTO%'
;

-- Changing Date DataType

SELECT `DATE`,
str_to_date(`DATE`,'%m/%d/%Y')
FROM RAW_DATA3
;

UPDATE RAW_DATA3
SET `DATE` = str_to_date(`DATE`,'%m/%d/%Y')
;

SELECT `DATE`
FROM RAW_DATA3
;

-- Standardize Date Format

ALTER TABLE RAW_DATA3
MODIFY COLUMN `DATE` DATE;

--------------------------------------------------------------------------------------------------------------------------

-- REMOVING NULL VALUES

SELECT *
FROM RAW_DATA3
WHERE INDUSTRY IS NULL
OR INDUSTRY = ''
;

SELECT *
FROM RAW_DATA3
WHERE COMPANY = 'Carvana'
;

UPDATE RAW_DATA3
SET INDUSTRY = 'Travel'
WHERE COMPANY = 'Airbnb'
AND LOCATION = 'SF Bay Area'
;

SELECT*
FROM RAW_DATA3
WHERE INDUSTRY = 'Consumer'
;

UPDATE RAW_DATA3
SET INDUSTRY = 'Transportation'
WHERE COMPANY = 'Carvana'
AND LOCATION = 'Phoenix'
;


SELECT T1.total_laid_off, T2.total_laid_off
FROM RAW_DATA3 T1
JOIN RAW_DATA3 T2
	ON T1.COMPANY = T2.COMPANY
WHERE T1.INDUSTRY IS NULL
AND T2.INDUSTRY IS NOT NULL
;

SELECT *
FROM RAW_DATA3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

DELETE
FROM RAW_DATA3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
; 

SELECT*
FROM RAW_DATA3
;

--------------------------------------------------------------------------------------------------------------------------

-- Removing Extra Column

ALTER TABLE RAW_DATA3
DROP COLUMN COUNT
;

SELECT *
FROM RAW_DATA3
;



