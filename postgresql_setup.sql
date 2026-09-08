-- Credit Card Financial Dashboard
-- PostgreSQL database setup and data loading

-- Run CREATE DATABASE separately if your PostgreSQL client does not allow
-- database creation from the current connection. Then connect to ccdb.
CREATE DATABASE ccdb;

-- After connecting to ccdb:
SET datestyle TO 'ISO, DMY';

DROP TABLE IF EXISTS cc_detail;
DROP TABLE IF EXISTS cust_detail;

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- The CSV files contain the transaction-count/volume field in the same
-- column position. The database table uses Total_Trans_Ct as the standardized
-- field name. CSV headers are ignored by COPY because HEADER is specified.
\copy cc_detail FROM 'data/credit_card.csv' DELIMITER ',' CSV HEADER;
\copy cust_detail FROM 'data/customer.csv' DELIMITER ',' CSV HEADER;

-- Additional Week-53 records
\copy cc_detail FROM 'data/cc_add.csv' DELIMITER ',' CSV HEADER;
\copy cust_detail FROM 'data/cust_add.csv' DELIMITER ',' CSV HEADER;

-- Basic validation
SELECT COUNT(*) AS credit_card_rows FROM cc_detail;
SELECT COUNT(*) AS customer_rows FROM cust_detail;
SELECT MIN(Week_Start_Date) AS min_week, MAX(Week_Start_Date) AS max_week FROM cc_detail;
