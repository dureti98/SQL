CREATE TABLE fortune_companies (
    company_id INTEGER PRIMARY KEY,
    company_name TEXT,
    industry TEXT,
    revenue REAL,
    employees INTEGER,
    healthcare_benefits BIT,
    paid_time_off_days INTEGER,
    maternity_leave_weeks INTEGER,
    avg_employee_tenure REAL
);

INSERT INTO fortune_companies (company_name, industry, revenue, employees, healthcare_benefits, paid_time_off_days, maternity_leave_weeks, avg_employee_tenure)
VALUES
    ('Apple Inc.', 'Technology', 365.7, 147000, 1, 20, 12, 4.5),
    ('Walmart Inc.', 'Retail', 523.96, 2200000, 1, 15, 8, 6.2),
    ('Exxon Mobil Corporation', 'Energy', 265.01, 72000, 0, 18, 6, 7.8),
    ('Amazon.com Inc.', 'Technology', 386.06, 1370000, 1, 22, 14, 5.1),
    ('JPMorgan Chase & Co.', 'Financials', 160.1, 255998, 1, 21, 12, 6.9),
    ('Verizon Communications Inc.', 'Telecommunications', 131.88, 132600, 0, 15, 6, 5.5),
    ('Company A', 'Retail', 235.4, 2000, 1, 18, 10, 5.8),
    ('Company B', 'Healthcare', 400.7, 2300, 1, 22, 13, 5.7),
    ('Company C', 'Manufacturing', 300.2, 2000, 1, 18, 10, 5.8),
    ('Company D', 'Healthcare', 150.5, 3500, 1, 20, 12, 6.5),
    ('Company E', 'Finance', 280.7, 1800, 0, 14, 8, 4.2),
    ('Company F', 'Technology', 420.1, 2500, 1, 22, 14, 7.1),
    ('Company G', 'Retail', 190.8, 1500, 1, 16, 9, 5.3),
    ('Company H', 'Energy', 280.5, 2200, 0, 15, 8, 6.8),
    ('Company I', 'Telecommunications', 110.3, 1800, 1, 19, 11, 4.9),
    ('Company J', 'Manufacturing', 390.6, 2700, 1, 21, 13, 6.2),
    ('Company K', 'Healthcare', 180.2, 3200, 1, 17, 9, 7.4),
    ('Company L', 'Finance', 230.4, 1900, 0, 13, 7, 5.6),
    ('Company M', 'Technology', 340.9, 2800, 1, 23, 15, 6.9),
    ('Company N', 'Retail', 200.6, 1600, 1, 15, 8, 4.7),
    ('Company O', 'Energy', 260.2, 2400, 0, 14, 7, 6.1),
    ('Company P', 'Telecommunications', 130.5, 2100, 1, 20, 12, 5.3),
    ('Company Q', 'Manufacturing', 360.0, 2900, 1, 22, 14, 7.8),
    ('Company R', 'Technology', 400.7, 2300, 1, 22, 13, 5.7),
    ('Company S', 'Retail', 210.8, 1600, 0, 16, 9, 4.9),
    ('Company T', 'Energy', 290.5, 2200, 1, 15, 8, 7.2),
    ('Company U', 'Telecommunications', 140.3, 1900, 1, 20, 12, 6.1),
    ('Company V', 'Manufacturing', 350.6, 2800, 1, 22, 14, 5.4),
    ('Company W', 'Healthcare', 160.2, 3300, 0, 18, 10, 4.8),
    ('Company X', 'Finance', 240.4, 2000, 1, 13, 7, 7.1),
    ('Company Y', 'Technology', 320.9, 2700, 1, 23, 15, 5.6),
    ('Company Z', 'Retail', 180.6, 1400, 0, 14, 8, 6.3),
    ('Company AA', 'Energy', 240.2, 2600, 1, 17, 9, 6.5),
    ('Company BB', 'Telecommunications', 120.5, 2100, 0, 19, 11, 4.5),
    ('Company CC', 'Manufacturing', 380.0, 3000, 1, 21, 13, 7.3),
    ('Company DD', 'Healthcare', 170.2, 3200, 1, 17, 9, 5.8),
    ('Company EE', 'Finance', 250.4, 1900, 0, 12, 6, 6.4),
    ('Company FF', 'Technology', 300.9, 2500, 1, 24, 16, 6.9),
    ('Company GG', 'Retail', 190.6, 1700, 0, 13, 7, 5.2),
    ('Company HH', 'Energy', 280.2, 2300, 1, 16, 9, 6.8),
    ('Company II', 'Telecommunications', 110.5, 2000, 1, 21, 12, 4.9),
    ('Company JJ', 'Manufacturing', 370.0, 3100, 1, 20, 12, 7.6),
    ('Company KK', 'Healthcare', 150.2, 3400, 0, 16, 8, 5.3);
    
    
-- Give each company a rating based on their avg_employee_tenure. If the avg_employee_tenure is greater that 7.5 "Exeptional", 
-- avg_employee_tenure is 5 and greater "Good" and avg_employee_tenure below 5 is  "adequate".
  
SELECT company_name, avg_employee_tenure,
CASE WHEN avg_employee_tenure > 7.5 THEN "Exeptional"
WHEN avg_employee_tenure >= 5 THEN "GOOD"
ELSE "Adequate" 
END AS Rating
FROM fortune_companies
ORDER BY avg_employee_tenure DESC;

-- List the industry that has the combined highest average revenue greater that 350 billion?

SELECT industry, ROUND(AVG(revenue), 2) AS Average_revenue 
FROM fortune_companies
GROUP BY industry
HAVING Average_revenue > 350;

-- Which companies in the Technology industry has health benefits and paid time off days is 15 or more.

SELECT company_name, industry, healthcare_benefits, paid_time_off_days
FROM fortune_companies
WHERE industry = "Technology" AND healthcare_benefits = 1 AND paid_time_off_days >= 15
ORDER BY paid_time_off_days ASC;


-- What is the count of companies in each industry?
SELECT industry, count(company_name) AS Total_Company_Count 
FROM fortune_companies
GROUP BY industry;

-- What company has the highest revenue?
  
SELECT company_name, MAX(revenue) AS revenue
FROM fortune_companies;

-- What company has the least amount of employees?

SELECT company_name, MIN(employees) AS employees
FROM fortune_companies;