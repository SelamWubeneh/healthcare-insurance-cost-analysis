# Healthcare Insurance Cost Analysis

## Project Overview

This project analyzes healthcare insurance data to identify the key factors associated with insurance charges. The analysis uses SQL, Python, and Power BI to clean, explore, analyze, and visualize the data.

The goal is to understand how factors such as age, BMI, smoking status, region, sex, and number of children relate to healthcare insurance costs.

---

## Business Objective

Healthcare insurance costs can vary significantly across individuals. This project aims to answer questions such as:

- How much do insurance charges vary by smoking status?
- What is the average insurance charge?
- Which regions have higher average insurance charges?
- How are age and BMI related to insurance costs?
- Which demographic factors appear to be associated with higher healthcare costs?
- Can the data provide useful insights for understanding healthcare insurance pricing?

---

## Dataset

The dataset contains individual healthcare insurance records with demographic and insurance-related information.

### Key Variables

| Column | Description |
|---|---|
| age | Age of the individual |
| sex | Sex of the individual |
| bmi | Body Mass Index |
| children | Number of children/dependents |
| smoker | Smoking status |
| region | Geographic region |
| charges | Individual medical insurance charges |

The original dataset was cleaned before analysis to improve consistency and prepare it for SQL, Python, and Power BI analysis.

---

## Data Cleaning

The data-cleaning process was performed in Excel.

Key steps included:

- Reviewing the original dataset for inconsistencies
- Cleaning and standardizing the data
- Checking for missing or invalid values
- Ensuring numerical fields were stored in the correct format
- Cleaning the `charges` field for analysis
- Reviewing categorical variables such as smoking status and region
- Preparing the cleaned dataset for SQL, Python, and Power BI

The cleaned dataset was then used throughout the analysis.

---

## SQL Analysis

PostgreSQL was used to analyze the cleaned healthcare insurance dataset.

The SQL analysis included:

- Calculating total customer records
- Calculating average insurance charges
- Comparing insurance charges by smoking status
- Comparing average charges across regions
- Exploring relationships between demographic variables and insurance costs
- Aggregating data to identify important trends

The SQL queries used for the project are available in:

`Healthcare_insurance_Analysis.sql`

---

## Python Analysis

Python was used for exploratory data analysis and predictive modeling.

### Libraries Used

- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn

### Python Analysis Included

- Data exploration
- Data validation
- Descriptive statistics
- Exploratory data analysis
- Visualization of relationships between variables
- Correlation analysis
- Predictive modeling

Several regression-based models were evaluated to explore the relationship between customer characteristics and insurance charges.

The Python analysis is available in:

`Healthcareinsuranceanalysis-1.ipynb`

---

## Predictive Modeling

The project explored multiple machine learning models for predicting insurance charges.

Models evaluated included:

- Linear Regression
- Decision Tree Regression
- Random Forest Regression

Model performance was evaluated using:

- R² Score
- Mean Absolute Error (MAE)
- Root Mean Squared Error (RMSE)

The modeling results demonstrate how demographic and lifestyle variables can be used to estimate healthcare insurance charges.

---

## Power BI Dashboard

Power BI was used to create an interactive dashboard for presenting the analysis.

### Dashboard Components

The dashboard includes:

- Total Customer KPI
- Average Insurance Charge
- Average Charge for Smokers
- Average Charge for Non-Smokers
- Average Insurance Charges by Smoking Status
- Average Insurance Charges by Region
- Age vs. Insurance Charges
- BMI vs. Insurance Charges
- Region filter
- Smoking status filter
- Age range filter

The dashboard allows users to interact with the data and explore insurance cost patterns across different demographic groups.

Power BI dashboard file:

`Healthcare_Insurance_Dashboard.pbix`

---

## Key Findings

### Smoking Status

Smoking status is strongly associated with insurance charges. The analysis shows substantially higher average insurance charges among smokers compared with non-smokers.

### Age

Insurance charges generally show an upward trend as age increases, although individual costs vary considerably.

### BMI

BMI is also associated with variation in insurance charges. The relationship is not perfectly linear, and other factors contribute to differences in costs.

### Region

Average insurance charges vary across geographic regions, allowing regional differences in healthcare costs to be explored.

### Overall

The analysis indicates that smoking status, age, BMI, and region are important variables to consider when examining differences in healthcare insurance charges.

---

## Tools & Technologies

- **Excel** — Data cleaning and preparation
- **PostgreSQL / pgAdmin** — SQL analysis
- **Python** — Exploratory data analysis and predictive modeling
- **Pandas & NumPy** — Data manipulation
- **Matplotlib & Seaborn** — Data visualization
- **Scikit-learn** — Machine learning
- **Power BI** — Interactive dashboard and visualization
- **DAX** — Power BI calculations
- **GitHub** — Project documentation and version control

---

## Project Structure

```text
healthcare-insurance-cost-analysis/
│
├── Healthcare_Insurance_Analysis.xlsx
├── Healthcare_Insurance_Cleaned.csv
├── Healthcare_Insurance_Dashboard.pbix
├── Healthcare_insurance_Analysis.sql
├── Healthcareinsuranceanalysis-1.ipynb
└── README.md

Conclusion

This project demonstrates an end-to-end data analytics workflow, from data cleaning and SQL analysis to Python-based exploratory analysis, predictive modeling, and interactive Power BI visualization.

The analysis provides insights into the factors associated with healthcare insurance charges and demonstrates the use of multiple data analytics tools to transform raw data into actionable insights.

Author

Selam Wubeneh

Data Analyst | SQL | Python | Power BI | Excel
