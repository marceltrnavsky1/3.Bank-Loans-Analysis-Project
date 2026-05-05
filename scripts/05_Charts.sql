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
SELECT
	address_state,
	COUNT(issue_date) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

--3. Loan Term Analysis: To allow the client to understand the distribution of loans across various term lengths.
SELECT
	term,
	COUNT(issue_date) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM financial_loan
GROUP BY term
ORDER BY term

--4. Employee Length Analysis: How lending metrics are distributed among borrowers with different employment lengths, helping us assess
--	 the impact of employment history on loan applications.
SELECT
	emp_length,
	COUNT(issue_date) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

--5. Loan Purpose Breakdown: Will provide a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the
--	 understanding of the primary reasons borrowers seek financing.
SELECT
	purpose,
	COUNT(issue_date) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM financial_loan
GROUP BY purpose
ORDER BY purpose

--6. Home Ownership Analysis: For a hierarchical view of how home ownership impact loan applications and disbursements.
SELECT
	home_ownership,
	COUNT(issue_date) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY COUNT(issue_date) DESC

-- Example of using if different kind of filters.
SELECT
	home_ownership,
	COUNT(issue_date) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_received_amount
FROM financial_loan
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(issue_date) DESC
