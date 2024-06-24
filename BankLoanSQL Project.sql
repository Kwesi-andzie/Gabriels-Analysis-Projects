Select * from [dbo].[Bank_Loan_Data]

--Counting the # of Ids w/ changing the Alias 
SELECT COUNT(id) AS Total_Loan_Applications from Bank_Loan_Data

--Columns w/ date datatype was incorrect 
SELECT FORMAT(issue_date, 'dd-MM-yyyy') AS Issue_date FROM Bank_Loan_Data
SELECT FORMAT(last_credit_pull_date, 'dd-MM-yyyy') AS last_credit_pull_date FROM Bank_Loan_Data
SELECT FORMAT(last_payment_date, 'dd-MM-yyyy') AS last_payment_date FROM Bank_Loan_Data
SELECT FORMAT(next_payment_date, 'dd-MM-yyyy') AS next_payment_date FROM Bank_Loan_Data

--Checking if date format changed 
SELECT * FROM [dbo].[Bank_Loan_Data]
--INTIALIZATION OF KEY PERDORMANCE INDICATORS(KPIs)REQUIREMENTS	
SELECT COUNT(id) AS MTD_Total_Loan_Applications from Bank_Loan_Data
WHERE MONTH(issue_date) = 12 and YEAR(Issue_date) = 2021

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount from Bank_Loan_Data
WHERE MONTH(Issue_date) = 12 and YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount from Bank_Loan_Data
WHERE MONTH(Issue_date) = 11 and YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS Total_Amount_Recieved from Bank_Loan_Data


SELECT SUM(total_payment) AS PMTD_Total_Amount_Recieved from Bank_Loan_Data
WHERE MONTH(Issue_date) = 11 and YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_interest_Rate FROM Bank_Loan_Data 
WHERE MONTH(Issue_date) =11 and YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_AVG_DTI FROM Bank_Loan_Data
WHERE MONTH(Issue_date) = 11 and YEAR(Issue_date) = 2021

SELECT loan_status FROM Bank_Loan_Data

SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)* 100)
	/
	COUNT(id) AS Good_Loan_Percentage
FROM Bank_Loan_Data

SELECT COUNT(id) AS Good_Loan_Applications FROM  Bank_Loan_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Applications FROM  Bank_Loan_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Bad_Loan_amount_recieved FROM  Bank_Loan_Data
WHERE loan_status = 'Charged Off'

SELECT
		loan_status,
		COUNT(id) AS Total_Loan_Application,
		SUM(total_payment) AS Total_Amount_Received,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate * 100) AS Interest_Rate,
		AVG(dti * 100) AS DTI
	FROM
		Bank_Loan_Data
	GROUP BY
		loan_status



SELECT
		loan_status,
		SUM(total_payment) AS MTD_Total_Amount_Received,
		SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

SELECT 
	DATENAME(MONTH, issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY DATENAME(MONTH,issue_date), DATENAME(MONTH, issue_date)
ORDER BY DATENAME(MONTH,issue_date) DESC


SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state 
ORDER BY SUM(loan_amount) DESC

SELECT * FROM Bank_Loan_Data

SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length DESC


SELECT 
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC


SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC



SELECT * FROM 
[dbo].[Bank_Loan_Data]

SELECT home_ownership,address_state
FROM [dbo].[Bank_Loan_Data] 
WHERE home_ownership = 'mortgage'

SELECT emp_length,emp_title
FROM [dbo].[Bank_Loan_Data]
WHERE emp_length = '1 year'

SELECT emp_length,emp_title
FROM [dbo].[Bank_Loan_Data]
WHERE emp_length < '1 year'
