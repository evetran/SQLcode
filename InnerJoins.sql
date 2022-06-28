-- I will use the world_bank_intl_education from Google public date.
-- In Google Cloud Platform, in the Search Marketplace bar, type world_bank_intl_education.


-- Show 20 records from international_education table, order by country_name

SELECT *
FROM bigquery-public-data.world_bank_intl_education.international_education
ORDER BY country_name ASC
LIMIT 20;


-- Queries with INNER JOINS and aliases

SELECT 
  	edu.country_name,
  	summary.country_code,
  	edu.value
FROM
  	bigquery-public-data.world_bank_intl_education.international_education AS edu
INNER JOIN
  	bigquery-public-data.world_bank_intl_education.country_summary AS summary
ON 
  	edu.country_code = summary.country_code;


-- Use a JOIN to answer a question

-- What is the average amount of money spent per region on education? & ROUND the average value to two decimal places


SELECT 
    	ROUND(AVG(edu.value),2) average_value, summary.region
FROM 
    	`bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN 
    	`bigquery-public-data.world_bank_intl_education.country_summary` AS summary
ON 
  	edu.country_code = summary.country_code
WHERE 
  	summary.region IS NOT null
GROUP BY 
  	summary.region
ORDER BY 
  	average_value DESC