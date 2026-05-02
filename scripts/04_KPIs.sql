/*1. TOTAL LOAN APPLICATIONS - We need to calculate the total number of loan applications received during a specified period.
Additionally, it is essential to monitor the Month-to-Date (MTD) Loan Applications and track changes Month-over-Month (MoM). */
SELECT 
	COUNT(id) AS total_loan_applications
FROM financial_loan

--MTD Loan Applications
SELECT 
	COUNT(id) AS MTD_total_loan_applications
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 --It is not mandatory because we only have one year (2021)
/*NOTE:
Dataset ends on Dec 12, 2021.
Therefore, this full-month calculation effectively represents
Month-to-Date (MTD) for December. */

--PTMD Loan Applications
SELECT 
	COUNT(id) AS PMTD_total_loan_applications
FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

/*2. TOTAL FUNDED AMOUNT - Understanding the total amount of funds disbursed as loans is crucial. 
We also want to keep an eye on the MTD Total Funded Amount and analyse the MoM changes in this metric. */
SELECT
	SUM(loan_amount) AS total_funded_amount
FROM financial_loan

-- MTD Total Funded amount
SELECT
	SUM(loan_amount) AS MTD_total_funded_amount
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- PMTD Total Funded amount
SELECT
	SUM(loan_amount) AS PMTD_total_funded_amount
FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

/*3. TOTAL AMOUNT RECEIVED - Tracking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. 
We should analyse the MTD Total Amount Received and observe the MoM changes. */
SELECT
	SUM(total_payment) AS total_amount_received
FROM financial_loan

-- MTD Total amount received
SELECT
	SUM(total_payment) AS MTD_total_amount_received
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- PMTD Total amount received
SELECT
	SUM(total_payment) AS PMTD_total_amount_received
FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

/*4. AVERAGE INTEREST RATE - Calculating the average interest rate across all loans, MTD, and 
monitoring the MoM variations in interest rates will provide insights into our lending portfolio's overall cost. */
SELECT
	ROUND(AVG(int_rate), 4)*100 AS average_interest_rate
FROM financial_loan

-- MTD Average interest rate
SELECT
	ROUND(AVG(int_rate), 4)*100 AS MTD_average_interest_rate
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- PMTD Average interest rate
SELECT
	ROUND(AVG(int_rate), 4)*100 AS PMTD_average_interest_rate
FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

/*5. AVERAGE Debt-to-Income Ratio (DTI) - Evaluating the average DTI for our borrowers helps us gauge their financial health. 
We need to compute the average DTI for all loans, MTD, and track MoM fluctuations. */
SELECT
	ROUND(AVG(dti), 4)*100 AS average_DTI_ratio
FROM financial_loan

-- MTD Average DTI
SELECT
	ROUND(AVG(dti), 4)*100 AS MTD_average_DTI_ratio
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- PMTD Average DTI
SELECT
	ROUND(AVG(dti), 4)*100 AS PMTD_average_DTI_ratio

FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


-- Good Loan v Bad Loan KPI’s  ==================================================================
/* ============================= GOOD LOANS =====================================================*/
--1. Good Loan Application Percentage
SELECT
	(COUNT(CASE WHEN loan_status ='Fully Paid' OR loan_status ='Current'
	THEN id END)*100)
	/ COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

--2. Good Loan Applications
SELECT
	COUNT(id) AS Good_Loan_Applications
FROM financial_loan
WHERE loan_status ='Fully Paid' OR loan_status ='Current'

--3. Good Loan Funded Amount
SELECT
	SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM financial_loan
WHERE loan_status='Fully Paid' OR loan_status ='Current'

--4. Good Loan Total Received Amount
SELECT
	SUM(total_payment) AS Good_Loan_Total_Received_Amount
FROM financial_loan
WHERE loan_status='Fully Paid' OR loan_status ='Current'
	
/* ============================= BAD LOANS ======================================================= */
--1. Bad Loan Application Percentage
SELECT 
	COUNT(CASE WHEN loan_status ='Charged Off' THEN id END)*100.0
	/ COUNT(id)
	AS Bad_Loan_Percentage
FROM financial_loan

--2. Bad Loan Applications
SELECT 
	COUNT(loan_status) AS Bad_Loan_Appliacations
FROM financial_loan
WHERE loan_status ='Charged Off'

--3. Bad Loan Funded Amount
SELECT
	SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM financial_loan
WHERE loan_status ='Charged Off'

--4. Bad Loan Received Amount
SELECT
 SUM(total_payment) AS Bad_Loan_Received_Amount
 FROM financial_loan
 WHERE loan_status ='Charged Off'
