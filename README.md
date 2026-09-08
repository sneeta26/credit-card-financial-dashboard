# Credit Card Financial Dashboard 📊

An end-to-end data analytics project where I used **PostgreSQL, SQL, Power BI, and DAX** to analyze credit-card customer and transaction data and turn it into interactive financial dashboards.

The project focuses on understanding revenue performance, transaction behavior, customer segments, card categories, spending patterns, and weekly/quarterly trends.

## Dashboard Preview

### Customer Report
![Customer Dashboard](screenshots/customer-dashboard.png)

### Transaction Report
![Transaction Dashboard](screenshots/transaction-dashboard.png)

## Project Objective

I built two interactive Power BI reports to answer business-focused questions around credit-card performance:

- **Customer Report:** customer demographics, income, jobs, education, satisfaction, salary groups, age groups, and geographic distribution.
- **Transaction Report:** revenue, transaction amount and count, card categories, expenditure types, transaction channels, and quarterly performance.

I also incorporated weekly reporting so that performance can be monitored and compared over time.

## Tech Stack

| Technology | Purpose |
|---|---|
| **PostgreSQL** | Database creation, table management, and data ingestion |
| **SQL** | Data loading and validation |
| **Power BI** | Data modeling, interactive dashboards, filters, and visualization |
| **DAX** | Calculated columns and measures for segmentation and performance analysis |
| **CSV** | Source data |

## Data

The project uses four source files:

| File | Description |
|---|---|
| `data/credit_card.csv` | Main credit-card transaction data |
| `data/customer.csv` | Main customer-level data |
| `data/cc_add.csv` | Additional Week-53 transaction records |
| `data/cust_add.csv` | Additional Week-53 customer records |

The main credit-card dataset contains **10,108 rows and 18 columns**, while the main customer dataset contains **10,108 rows and 15 columns**.

### Credit-card attributes

The transaction data contains fields covering card category, annual fees, activation status, customer acquisition cost, week and quarter, credit limit, revolving balance, transaction amount, transaction volume/count, utilization ratio, chip usage, expenditure type, interest earned, and delinquency.

### Customer attributes

The customer data contains age, gender, dependent count, education, marital status, state, ZIP code, car ownership, house ownership, personal loan, contact method, customer job, income, and customer satisfaction score.

## Data Workflow

I followed an end-to-end analytics workflow:

```text
CSV Files
   ↓
PostgreSQL Database
   ↓
SQL Tables & Validation
   ↓
Power BI Data Connection
   ↓
DAX Calculations
   ↓
Data Modeling & Visualization
   ↓
Customer + Transaction Dashboards
   ↓
Business Insights
```

## SQL Workflow

I used PostgreSQL to create the database structure and load the source data before connecting it to Power BI.

The SQL workflow includes:

1. Creating the `ccdb` database.
2. Creating `cc_detail` and `cust_detail` tables.
3. Loading the main CSV files into PostgreSQL.
4. Loading the additional Week-53 records.
5. Running row-count and date-range validation checks.
6. Connecting the database tables to Power BI.

The SQL setup is available in [`sql/postgresql_setup.sql`](sql/postgresql_setup.sql).

## Power BI & DAX

I used DAX to create business-oriented fields and measures for analysis, including:

- **Age Group**: 20–30, 30–40, 40–50, 50–60, and 60+
- **Income Group**: Low, Medium, and High
- **Week Number**
- **Revenue**
- **Current Week Revenue**
- **Previous Week Revenue**

The revenue measure combines **annual fees, total transaction amount, and interest earned**. Weekly measures make it possible to compare current performance with the previous week.

## Dashboard Features

### Customer Report

The customer dashboard includes:

- Total Revenue
- Total Income
- Total Interest
- Customer Satisfaction Score
- Revenue vs Gender
- Revenue by Customer Job
- Revenue by Education Level
- Revenue by Age Group
- Revenue by Marital Status
- Revenue by Salary Group
- Revenue by State
- Dependent Count analysis
- Card-category analysis
- Weekly revenue trend
- Quarterly filters

### Transaction Report

The transaction dashboard includes:

- Total Revenue
- Transaction Count
- Transaction Amount
- Total Interest
- Revenue by Expenditure Type
- Revenue by Education
- Revenue by Customer Job
- Revenue by Card Category
- Customer Acquisition Cost
- Quarterly Revenue & Transaction Count
- Revenue by Chip Usage
- Weekly filtering
- Income and card-category filters

## Key Insights

From the dashboard analysis, I identified several notable patterns:

- Total revenue is approximately **55.4M**.
- Total interest is approximately **7.9M**.
- Total transaction amount is approximately **45M**.
- Transaction count is approximately **657K**.
- Total customer income represented in the customer report is approximately **577M**.
- **Blue** is the largest revenue-contributing card category.
- **Bills** represent the largest expenditure category in the transaction report.
- **Swipe** transactions contribute the largest share of revenue among the usage methods shown.
- **Self-employed** customers contribute the highest revenue among the customer-job segments shown.
- Revenue and transaction activity can be compared across **Q1–Q4** and across weekly periods.

The customer dashboard also allows demographic and geographic patterns to be explored through filters and segment-level charts.

## Business Questions

I designed the dashboards to help answer questions such as:

1. How much revenue and interest are being generated?
2. Which card categories contribute the most revenue?
3. Which customer segments generate the most revenue?
4. Which expenditure categories drive the most spending?
5. How does transaction behavior differ by usage method?
6. Which states contribute the most revenue?
7. How does revenue change week over week?
8. How do customer demographics relate to revenue and satisfaction?
9. How does performance differ across quarters?

## Repository Structure

```text
credit-card-financial-dashboard/
├── data/
│   ├── credit_card.csv
│   ├── customer.csv
│   ├── cc_add.csv
│   └── cust_add.csv
├── reports/
│   ├── customer_dashboard.pdf
│   └── transaction_dashboard.pdf
├── screenshots/
│   ├── customer-dashboard.png
│   └── transaction-dashboard.png
├── sql/
│   └── postgresql_setup.sql
├── README.md
└── .gitignore
```

## How to Reproduce

1. Install PostgreSQL and Power BI Desktop.
2. Create the PostgreSQL database using `sql/postgresql_setup.sql`.
3. Load the CSV files into the corresponding tables.
4. Connect Power BI Desktop to the PostgreSQL database.
5. Load the customer and credit-card tables.
6. Create the required DAX calculations.
7. Build or refresh the customer and transaction reports.
8. Use the weekly, quarterly, income, gender, and card-category filters to explore the analysis.

## What I Learned

This project gave me practical experience across the complete analytics workflow, from raw data ingestion to business storytelling:

**Data ingestion → SQL → data validation → Power BI modeling → DAX → visualization → business insights**

It strengthened my ability to combine technical analysis with an interactive dashboard designed around business questions rather than isolated charts.

## Future Improvements

- Add automated data refresh through a cloud database.
- Add more advanced customer segmentation.
- Build predictive models for delinquency or customer churn.
- Add KPI alerts for significant week-over-week changes.
- Publish the dashboard through Power BI Service with scheduled refresh.
