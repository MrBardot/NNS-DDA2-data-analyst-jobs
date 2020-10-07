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

--#5. Postings that have a review count equal to or above 500 but equal to or lesser than 1000: 151

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--#6. Average star rating per state. Highest average rating goes to NE or Nebraska.



SELECT COUNT(DISTINCT title) 
FROM data_analyst_jobs;

--#7. There are 881 unique job titles. 


SELECT COUNT(DISTINCT title) 
FROM data_analyst_jobs
WHERE location = 'CA';

-- #8. There are 230 unique job titles in CA


SELECT COUNT(company), AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >= 5000;

--#9 


SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >= 5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;

--#10. General Motors, Unilever, Microsoft, Nike, AMEX, and Kaiser Permenente have the highest rating. Tied with 4.1999998090000000. 


SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--#11

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--#11 774 titles


SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
EXCEPT
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%' OR title ILIKE '%Analytics%';
--#12

SELECT DISTINCT(data_analyst_jobs.title), company
FROM data_analyst_jobs
EXCEPT
SELECT DISTINCT(data_analyst_jobs.title), company
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%' OR title ILIKE '%Analytics%';

--#12 They have in common that they all reference visualization tools, specifically Tableau, and that two of them are from the same company; Clarity Insights. 

--BONUS
/*SELECT DISTINCT(data_analyst_jobs.domain), days_since_posting,
	CASE WHEN skill ILIKE '%SQL%' THEN 'hard job'
		 WHEN days_since_posting > 21 THEN 'long posting' END as sql_over_three_weeks
FROM data_analyst_jobs
WHERE domain IS NOT NULL AND 
	CASE WHEN skill ILIKE '%SQL%' THEN 'hard job'
	 	 WHEN days_since_posting > 21 THEN 'long posting'
	 	 END IS NOT NULL
GROUP BY domain, days_since_posting
ORDER BY COUNT(domain) DESC;*/


SELECT domain, COUNT(domain)
FROM data_analyst_jobs
WHERE skill ILIKe '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(domain) DESC;

/* Top 3 industries = 
	Internet and Software
	Banks and Financial Services
	Consulting and Business Services
Number of jobs, TOP 4:
	Internet Software - 62
	Banks - 61
	Consulting - 57
	Health Care - 52




