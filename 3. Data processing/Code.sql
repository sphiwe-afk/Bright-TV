--Check table columns
select *
frOM workspace.default.viewership;

--Check table columns
SELECT *
from workspace.default.userprofile;

--Join both tables
SELECT *
from workspace.default.userprofile AS A
FULL OUTER JOIN workspace.default.viewership AS B
ON A.UserID = B.UserID0;

--Check date Range
SELECT MIN(RecordDate2) AS Start_date,
       MAX (RecordDate2) AS End_date
FROM workspace.default.viewership;

--Number of Distinct channels
SELECT DISTINCT Channel2
FROM workspace.default.viewership;

SELECT COUNT(*)
FROM workspace.default.userprofile;

--Most watched channel
SELECT Channel2,
       COUNT(*) AS Watch_count
FROM workspace.default.viewership
GROUP BY Channel2
ORDER BY Watch_count DESC;

--Check blank spaces
SELECT COUNT (Province)
FROM workspace.default.userprofile AS A
FULL OUTER JOIN workspace.default.viewership AS B
ON A.UserID = B.UserID0
WHERE Province IS NULL OR TRIM(Province) = '';

--Check Null data
SELECT Province
FROM workspace.default.userprofile AS A
FULL OUTER JOIN workspace.default.viewership AS B
ON A.UserID = B.UserID0
WHERE Province IS NULL;

-Check Null data
SELECT Gender
FROM workspace.default.userprofile AS A
FULL OUTER JOIN workspace.default.viewership AS B
ON A.UserID = B.UserID0
WHERE Gender IS NULL;

--Check Null data
SELECT Race
FROM workspace.default.userprofile AS A
FULL OUTER JOIN workspace.default.viewership AS B
ON A.UserID = B.UserID0
WHERE Race IS NULL;

--Final code
SELECT *,
CASE
     WHEN (Age) <= 12 THEN 'Child'
     WHEN (Age) BETWEEN 13 AND 19 THEN 'Teenager'
     WHEN (Age) BETWEEN 20 AND 34 THEN 'Young Adult'
     WHEN (Age) BETWEEN 35 AND 49 THEN 'Adult'
     WHEN (Age) BETWEEN 50 AND 64 THEN 'Mature adult'
     WHEN (Age) BETWEEN 65 AND 79 THEN 'Senior'
     WHEN (Age) BETWEEN 80 AND 114 THEN 'Elder'
  END AS Age_splits,
DATE(RecordDate2) AS Date_only,
DATE_FORMAT(RecordDate2, 'HH:mm:ss') AS Time_only,
DATEADD(hour,2,Time_only) AS South_African_time,
DAYNAME(Date_only) AS Day_of_the-week,
CASE
    WHEN DATE_FORMAT(South_African_time,'HH:mm:ss') BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning_view'
    WHEN DATE_FORMAT(South_African_time,'HH:mm:ss') BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon_view'
    WHEN DATE_FORMAT(South_African_time,'HH:mm:ss') BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening_view'
    WHEN DATE_FORMAT(South_African_time,'HH:mm:ss') BETWEEN '00:00:00' AND '04:59:59' THEN 'Graveyard_view'
    END AS Time_of_day
FROM workspace.default.userprofile AS A
FULL OUTER JOIN workspace.default.viewership AS B
ON A.UserID = B.UserID0;

