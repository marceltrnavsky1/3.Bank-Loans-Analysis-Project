--1. Quick Data Overview
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT id) AS unique_loans
FROM dbo.financial_loan;

--2. Crtitical Columns NULLs Check
SELECT *
FROM dbo.financial_loan
WHERE 
    id IS NULL
    OR member_id IS NULL
    OR issue_date IS NULL
    OR loan_amount IS NULL
    OR loan_status IS NULL

--3. Empty/Whitespace Check
SELECT *
FROM dbo.financial_loan
WHERE 
    LTRIM(RTRIM(address_state)) = ''
    OR LTRIM(RTRIM(purpose)) = ''
	OR LTRIM(RTRIM(emp_title)) = ''
    OR LTRIM(RTRIM(grade)) = ''
	OR LTRIM(RTRIM(sub_grade)) = ''
	OR LTRIM(RTRIM(home_ownership)) = ''
	OR LTRIM(RTRIM(loan_status)) = ''

--4. Numeric sanity Check
SELECT *
FROM financial_loan
WHERE 
	annual_income <=0
	OR dti <0
	OR installment <=0
	OR int_rate <0 OR int_rate >1
	OR loan_amount <=0

--5. Duplicates Check
SELECT id, COUNT(*) AS cnt
FROM financial_loan
GROUP BY id
HAVING COUNT(*) > 1; --No duplicates

SELECT member_id, COUNT(*) AS cnt
FROM dbo.financial_loan
GROUP BY member_id
HAVING COUNT(*) > 1; --No duplicates

/* 6. DATE LOGIC VALIDATION
NOTE:
Date logic validation (e.g. issue_date > last_payment_date) was intentionally
NOT included as a strict data quality rule.

Reason:
- These date fields are not guaranteed to be fully synchronized at row level.
- last_payment_date and next_payment_date may represent snapshot or historical
  states rather than strict sequential events.
- This can lead to a large number of false positives that do not represent
  real data quality issues.

Instead, date fields are used for:
- trend analysis (monthly KPIs)
- time-based aggregations
- cohort / performance analysis

Therefore, date consistency is handled in analytical layers rather than
data quality filtering.

Example:
SELECT *
FROM financial_loan
WHERE issue_date > last_payment_date; =>(15 463 rows)
===============================================================================
*/
