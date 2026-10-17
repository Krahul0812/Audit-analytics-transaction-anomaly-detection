# Audit Analytics & Transaction Anomaly Detection System

## Overview
A Python and MySQL-based audit analytics project that identifies potential transaction exceptions, assigns risk scores, and generates automated Excel reports.

## Technology Stack
- Python
- Pandas
- MySQL and SQL
- mysql-connector-python
- OpenPyXL and Excel

## Features
- Duplicate invoice detection
- Payment-before-invoice checks
- High-value transaction identification
- Pending approval detection
- Unusual payment-time detection
- Rule-based risk scoring and risk classification
- Automated Excel exception reports and dashboard visualizations

## Project Files
- `run_audit.py` — Main audit workflow and Excel dashboard generation
- `Audit_analytics.py` — Transaction analysis and risk scoring
- `Data.py` — Supporting data analysis script
- `Python_MySQL.py` — Supporting MySQL integration script
- `audit_queries.sql` — Database setup and audit queries
- `Transaction.csv` — Sample transaction input data
- `Audit_Exception_Report.xlsx` — Example audit report and dashboard
- `requirements.txt` — Python dependencies

## Setup and Usage
1. Install Python and MySQL.
2. Install dependencies: `pip install -r requirements.txt`.
3. Create the `audit_analytics` database and `transactions` table using the database setup section of `audit_queries.sql`.
4. Ensure `Transaction.csv` is available in the project directory.
5. Check the MySQL host, username, and database settings in `run_audit.py`. The script prompts for the MySQL password when run.
6. Run: `python run_audit.py`.
7. Open `Audit_Exception_Report.xlsx` to review the generated dashboard and exception report.

## Audit Risk Rules
The system flags potential exceptions based on duplicate invoice numbers, payments before invoice dates, transactions above INR 100,000, pending approvals, and payment times before 06:00 or from 22:00 onward.

## Security and Limitations
Use synthetic or anonymized data only. Run this project against a dedicated demonstration database. The main workflow clears the existing `transactions` table before reloading the CSV, so do not use it against a database containing records you need to preserve. These rules identify potential exceptions for review; they do not establish fraud.

## Disclaimer
This project is for educational and portfolio demonstration purposes.
