
/* ============================================================
   HEALTHCARE INSURANCE ANALYSIS
   SQL PROJECT

   Database: healthcare_insurance_portfolio
   Table: healthcare_insurance

   Objective:
   Analyze healthcare insurance charges and identify patterns
   across customer demographics and lifestyle characteristics.

   Dataset:
   1,108 cleaned customer records
   ============================================================ */


/* ============================================================
   1. DATA VALIDATION
   Confirm that the cleaned dataset was imported correctly.
   ============================================================ */
CREATE TABLE healthcare_insurance (
    age INTEGER,
    sex VARCHAR(10),
    bmi NUMERIC(5,2),
    children INTEGER,
    smoker VARCHAR(5),
    region VARCHAR(20),
    charges NUMERIC(10,2)
);


-- Check total number of records
SELECT COUNT(*) AS total_records
FROM healthcare_insurance;


-- Preview the data
SELECT *
FROM healthcare_insurance
LIMIT 10;


-- Check for missing values
SELECT
    COUNT(*) - COUNT(age) AS missing_age,
    COUNT(*) - COUNT(sex) AS missing_sex,
    COUNT(*) - COUNT(bmi) AS missing_bmi,
    COUNT(*) - COUNT(children) AS missing_children,
    COUNT(*) - COUNT(smoker) AS missing_smoker,
    COUNT(*) - COUNT(region) AS missing_region,
    COUNT(*) - COUNT(charges) AS missing_charges
FROM healthcare_insurance;


-- Check for invalid ages
SELECT COUNT(*) AS invalid_age_records
FROM healthcare_insurance
WHERE age <= 0;


-- Check for invalid BMI values
SELECT COUNT(*) AS invalid_bmi_records
FROM healthcare_insurance
WHERE bmi <= 0;


/* ============================================================
   2. OVERALL DATASET SUMMARY
   Establish basic statistics for the insurance dataset.
   ============================================================ */

SELECT
    COUNT(*) AS total_customers,
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(bmi), 2) AS average_bmi,
    ROUND(AVG(charges), 2) AS average_charge,
    ROUND(MIN(charges), 2) AS minimum_charge,
    ROUND(MAX(charges), 2) AS maximum_charge
FROM healthcare_insurance;


/* ============================================================
   3. CUSTOMER DISTRIBUTION BY SMOKING STATUS
   Understand how many customers are smokers vs. non-smokers.
   ============================================================ */

SELECT
    smoker,
    COUNT(*) AS customer_count
FROM healthcare_insurance
GROUP BY smoker
ORDER BY customer_count DESC;


/* ============================================================
   4. INSURANCE CHARGES BY SMOKING STATUS
   Compare average insurance charges between smokers
   and non-smokers.
   ============================================================ */

SELECT
    smoker,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge,
    ROUND(MIN(charges), 2) AS minimum_charge,
    ROUND(MAX(charges), 2) AS maximum_charge
FROM healthcare_insurance
GROUP BY smoker
ORDER BY average_charge DESC;


/* ============================================================
   5. INSURANCE CHARGES BY REGION
   Compare customer counts and average charges across regions.
   ============================================================ */

SELECT
    region,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge
FROM healthcare_insurance
GROUP BY region
ORDER BY average_charge DESC;


/* ============================================================
   6. INSURANCE CHARGES BY AGE GROUP
   Create age groups to compare average insurance charges.
   ============================================================ */

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,

    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge

FROM healthcare_insurance

GROUP BY
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END

ORDER BY MIN(age);


/* ============================================================
   7. INSURANCE CHARGES BY NUMBER OF CHILDREN
   Analyze whether average charges vary by number of children.
   ============================================================ */

SELECT
    children,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge
FROM healthcare_insurance
GROUP BY children
ORDER BY children;


/* ============================================================
   8. INSURANCE CHARGES BY SEX
   Compare customer counts and average charges by sex.
   ============================================================ */

SELECT
    sex,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge
FROM healthcare_insurance
GROUP BY sex
ORDER BY average_charge DESC;


/* ============================================================
   9. BMI CATEGORY ANALYSIS
   Group customers into basic BMI categories and compare
   average insurance charges.

   Note:
   These categories are used for descriptive analysis only.
   ============================================================ */

SELECT
    CASE
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi < 25 THEN 'Normal'
        WHEN bmi < 30 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,

    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge

FROM healthcare_insurance

GROUP BY
    CASE
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi < 25 THEN 'Normal'
        WHEN bmi < 30 THEN 'Overweight'
        ELSE 'Obese'
    END

ORDER BY average_charge DESC;


/* ============================================================
   10. HIGH-COST CUSTOMERS
   Identify customers with insurance charges above $30,000.
   ============================================================ */

SELECT
    age,
    sex,
    bmi,
    children,
    smoker,
    region,
    ROUND(charges, 2) AS charges
FROM healthcare_insurance
WHERE charges > 30000
ORDER BY charges DESC;


/* ============================================================
   11. TOP 10 HIGHEST INSURANCE CHARGES
   Identify the records with the highest observed charges.
   ============================================================ */

SELECT
    age,
    sex,
    bmi,
    children,
    smoker,
    region,
    ROUND(charges, 2) AS charges
FROM healthcare_insurance
ORDER BY charges DESC
LIMIT 10;


/* ============================================================
   12. SMOKING STATUS AND AGE GROUP
   Examine whether average charges differ across age groups
   within smoking status.
   ============================================================ */

SELECT
    smoker,

    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,

    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charge

FROM healthcare_insurance

GROUP BY
    smoker,
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END

ORDER BY smoker, MIN(age);


/* ============================================================
   13. SUMMARY OF KEY SQL FINDINGS

   The SQL analysis can be used to identify:

   - Overall insurance charge levels
   - Customer distribution by smoking status
   - Differences in charges by smoking status
   - Regional differences in average charges
   - Charge patterns across age groups
   - Charge patterns by number of children
   - Differences by sex
   - Charge patterns across BMI categories
   - High-cost customer records
   - The relationship between smoking status and age groups

   These descriptive findings will be explored further in Python
   through visualization and predictive modeling.
   ============================================================ */
