-- Crtitical Columns NULLs Check
SELECT *
FROM dbo.financial_loan
WHERE 
    id IS NULL
    OR member_id IS NULL
    OR issue_date IS NULL
    OR loan_amount IS NULL
    OR loan_status IS NULL

-- Empty/Whitespace Check
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

-- Numeric sanity Check
