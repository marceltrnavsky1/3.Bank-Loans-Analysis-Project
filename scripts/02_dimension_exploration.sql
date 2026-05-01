-- States
SELECT DISTINCT
	address_state
FROM financial_loan
ORDER BY address_state

/* We have 50 different address states.
(AK, AL, AR, AZ, CA, CO, CT, DC, DE, FL, GA, HI, IA, ID, IL, IN, KS, KY, 
LA, MA, MD, ME, MI, MN, MO, MS, MT, NC, NE, NH, NJ, NM, NV, NY, OH, OK, 
OR, PA, RI, SC, SD, TN, TX, UT, VA, VT, WA, WI, WV, WY) */

-- Applications
SELECT DISTINCT
	application_type
FROM financial_loan
ORDER BY application_type

/* We have 1 application type (INDIVIDUAL) */
-- NOTE! Column has no variability → not useful for analysis.

-- Grades
SELECT DISTINCT
	grade
FROM financial_loan
ORDER BY grade
/* We have A,B,C,D,E,F,G grades. */

-- Home ownership
SELECT DISTINCT
	home_ownership
FROM financial_loan
ORDER BY home_ownership

/* We have MORTGAGE, NONE, OTHER, OWN, RENT */

-- Loan status
SELECT DISTINCT
	loan_status
FROM financial_loan
ORDER BY loan_status

/* We have Current, Fully Paid, Charged Off */

-- Purposes
SELECT DISTINCT
	purpose
FROM financial_loan
ORDER BY purpose

/* We have 14 different purposes of loan.
(car, credit card, Debt consolidation, educational, home improvement, house, major purchase, 
medical, moving, other, renewable energy, small business, vacation, wedding) */
-- NOTE! Inconsistent casing detected: Debt consolidation.

SELECT DISTINCT
	sub_grade
FROM financial_loan
ORDER BY sub_grade

/* Each grade has subgrades 1–5. */

-- Term
SELECT DISTINCT
	term
FROM financial_loan
ORDER BY term

/* Two loan terms: 36 months and 60 months. */

-- Verification
SELECT DISTINCT
	verification_status
FROM financial_loan
ORDER BY verification_status

/* Three verification status: Not Verified, Source Verified, Verified */
