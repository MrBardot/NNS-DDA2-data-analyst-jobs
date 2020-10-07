--#1. How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;
--Number of rows in data_analyst_jobs: 1793

/*#2. Write a query to look at just the first 10 rows. 
What company is associated with the job posting on the 10th row?*/
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--What company is associated with tenth job listing? ExxonMobil

/*#3. How many postings are in Tennessee? 
How many are there in either Tennessee or Kentucky?*/
Select COUNT(location)
FROM data_analyst_jobs
WHERE location LIKE 'TN';
--There are 21 entries in TN. 

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';
--There are 27 entries that are either TN or KY.

--#4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE star_rating > 4;
--There are 416 postings that have a rating of above 4 stars. 

--#5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count >= 500 
AND review_count <= 1000;
--Postings that have a review count equal to or above 500 but equal to or lesser than 1000: 151

/*#6.Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating?*/
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;
--Average star rating per state. Highest average rating goes to NE or Nebraska.


--#7. Select unique job titles from the data_analyst_jobs table. How many are there?*/
SELECT COUNT(DISTINCT (title)) 
FROM data_analyst_jobs;
--There are 881 unique job titles. 


--#8. How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title) 
FROM data_analyst_jobs
WHERE location = 'CA';
--There are 230 unique job titles in CA


/* #9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
How many companies are there with more that 5000 reviews across all locations?*/
SELECT company,AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >= 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg DESC;

SELECT COUNT(DISTINCT company), AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >= 5000;
--#9 40 Companies, average rating of 3.90...


/* #10. Add the code to order the query in #9 from highest to lowest average star rating. 
Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
What is that rating?*/
SELECT DISTINCT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count >= 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY AVG(star_rating) DESC;
/*#10. General Motors, Unilever, Microsoft, Nike, AMEX, and Kaiser Permenente have the highest rating. 
Tied with 4.1999998090000000.*/ 


--#11.Find all the job titles that contain the word ‘Analyst’. 
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--#11 See output
--How many different job titles are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--#11 774 titles


--#12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
EXCEPT
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%' OR title ILIKE '%Analytics%';
--#12
--What word do these positions have in common?
SELECT DISTINCT(data_analyst_jobs.title), company
FROM data_analyst_jobs
EXCEPT
SELECT DISTINCT(data_analyst_jobs.title), company
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%' OR title ILIKE '%Analytics%';
--#12 They have in common that they all reference visualization tools, specifically Tableau, and that two of them are from the same company; Clarity Insights. 

/*BONUS- You want to understand which jobs requiring SQL are hard to fill. 
Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
Disregard any postings where the domain is NULL.
Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?*/
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
	Health Care - 52 */






