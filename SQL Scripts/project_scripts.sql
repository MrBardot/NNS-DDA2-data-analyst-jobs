SELECT COUNT(*)
FROM data_analyst_jobs;

--#1. Number of rows in data_analyst_jobs: 1793

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- #2. What company is associated with tenth job listing? ExxonMobil

Select COUNT(location)
FROM data_analyst_jobs
WHERE location LIKE 'TN';

-- #3A. There are 21 entries in TN. 

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

--#3B There are 27 entries that are either TN or KY.

SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE star_rating > 4;

--#4. There are 416 postings that have a rating of above 4 stars. 

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count >= 500 
AND review_count <= 1000;

--#5 Postings that have a review count equal to or above 500 but equal to or lesser than 1000: 151

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--#6 Average star rating per state. Highest average rating goes to NE or Nebraska.



