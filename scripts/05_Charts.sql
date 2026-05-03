/* Charts */
--1. Monthly Trends by Issue Date: To identify seasonality and long-term trends in lending activities
SELECT
	MONTH(issue_date) AS month_number,
	DATENAME(MONTH,issue_date) AS month_name,
	COUNT(issue_date) AS total_loan_applications
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date)

--2. Regional Analysis by State: To identify regions with significant lending activity and asess regional disparities.

--3. Loan Term Analysis: To allow the client to understand the distribution of loans across various term lengths.

--4. Employee Length Analysis: How lending metrics are distributed among borrowers with different employment lengths, helping us assess
--	 the impact of employment history on loan applications.

--5. Loan Purpose Breakdown: Will provide a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the
--	 understanding of the primary reasons borrowers seek financing.

--6. Home Ownership Analysis: For a hierarchical view of how home ownership impact loan applications and disbursements.
