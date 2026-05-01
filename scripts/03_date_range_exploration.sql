-- Determine the first and last loan date and the total duration in months
SELECT
	MIN(issue_date) AS first_loan_date,
	MAX(issue_date) AS last_loan_date,
	DATEDIFF(MONTH, MIN(issue_date), MAX(issue_date)) AS range_months
FROM financial_loan
-- Date range analysis shows that the dataset covers a single year.
-- Month difference between first and last issue_date = 11. (M1-M12)

-- Monthly distribution of loans based on issue_date
SELECT
	DATENAME(MONTH,(issue_date)) AS month_name,
	COUNT(id) AS total_loans
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH,(issue_date))
ORDER BY MONTH(issue_date)
