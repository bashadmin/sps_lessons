-- 1) Select all the data from the planes table.
select *
from planes;

-- 2) replace all NULL values in the year column, with 2013.
UPDATE 
	planes
SET
	year = 2013
WHERE
	year is NULL;
-- Verify changes
SELECT
	*
FROM
	planes;

-- 3) Insert a new record into the planes table.
INSERT INTO planes(tailnum, year, type, manufacturer, model, engines, seats, speed, engine)
VALUES('N15501',2013,'Fixed wing single engine','BOEING','A222-101',3,100,NULL,'Turbo-fan');

-- Verify that this worked
SELECT
	*
FROM
	planes
WHERE
	tailnum = 'N15501';
    
-- 4) Delete the newly created record from the previous task
DELETE FROM planes
WHERE
	tailnum = 'N15501';

-- Verify that this worked
SELECT
	*
FROM
	planes
WHERE
	tailnum = 'N15501';