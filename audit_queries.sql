-- ============================================================
-- AUDIT ANALYTICS PROJECT
-- MYSQL DATABASE SETUP + AUDIT QUERIES
-- ============================================================


-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================

CREATE DATABASE audit_analytics;

USE audit_analytics;


-- ============================================================
-- 2. CREATE TRANSACTIONS TABLE
-- ============================================================

CREATE TABLE transactions (
    Transaction_ID VARCHAR(10) PRIMARY KEY,
    Vendor_Name VARCHAR(100),
    Invoice_Number VARCHAR(30),
    Invoice_Date DATE,
    Payment_Date DATE,
    Amount DECIMAL(12,2),
    GST_Rate DECIMAL(5,2),
    Approval_Status VARCHAR(20),
    Department VARCHAR(50),
    Payment_Time TIME
);


-- ============================================================
-- 3. INSERT TRANSACTION DATA
-- ============================================================

INSERT INTO transactions
(Transaction_ID, Vendor_Name, Invoice_Number, Invoice_Date,
 Payment_Date, Amount, GST_Rate, Approval_Status,
 Department, Payment_Time)
VALUES

('T001','ABC Suppliers','INV1001','2026-08-01','2026-08-05',12500,18,'Approved','IT','10:30:00'),

('T002','XYZ Technologies','INV1002','2026-08-02','2026-08-06',8500,18,'Approved','Finance','11:15:00'),

('T003','Global Traders','INV1003','2026-08-03','2026-08-07',15200,18,'Approved','HR','14:20:00'),

('T004','ABC Suppliers','INV1004','2026-08-04','2026-08-09',22000,18,'Approved','IT','12:10:00'),

('T005','Quick Services','INV1005','2026-08-05','2026-08-10',4800,18,'Approved','Operations','15:45:00'),

('T006','XYZ Technologies','INV1006','2026-08-06','2026-08-11',9100,18,'Approved','Finance','10:05:00'),

('T007','Global Traders','INV1007','2026-08-07','2026-08-12',13500,18,'Approved','HR','13:40:00'),

('T008','ABC Suppliers','INV1008','2026-08-08','2026-08-13',17800,18,'Approved','IT','16:25:00'),

('T009','Quick Services','INV1009','2026-08-09','2026-08-14',6200,18,'Approved','Operations','11:50:00'),

('T010','XYZ Technologies','INV1010','2026-08-10','2026-08-15',10500,18,'Approved','Finance','14:05:00'),

('T011','ABC Suppliers','INV1011','2026-08-15','2026-08-12',15000,18,'Approved','IT','10:30:00'),

('T012','XYZ Technologies','INV1010','2026-08-16','2026-08-20',10500,18,'Approved','Finance','11:30:00'),

('T013','Global Traders','INV1013','2026-08-17','2026-08-21',12500,18,'Pending','HR','14:00:00'),

('T014','ABC Suppliers','INV1014','2026-08-18','2026-08-22',150000,18,'Approved','IT','12:15:00'),

('T015','Quick Services','INV1015','2026-08-19','2026-08-23',7300,18,'Approved','Operations','23:45:00'),

('T016','XYZ Technologies','INV1016','2026-08-20','2026-08-25',11200,18,'Approved','Finance','13:20:00'),

('T017','Global Traders','INV1017','2026-08-21','2026-08-26',16800,18,'Approved','HR','14:35:00'),

('T018','ABC Suppliers','INV1018','2026-08-22','2026-08-27',9200,18,'Pending','IT','10:40:00'),

('T019','Quick Services','INV1019','2026-08-23','2026-08-28',5600,18,'Approved','Operations','15:10:00'),

('T020','XYZ Technologies','INV1020','2026-08-24','2026-08-29',9800,18,'Approved','Finance','11:55:00'),

('T021','Global Traders','INV1021','2026-08-25','2026-08-30',14200,18,'Approved','HR','13:45:00'),

('T022','ABC Suppliers','INV1022','2026-08-26','2026-08-31',18700,18,'Approved','IT','10:25:00'),

('T023','Quick Services','INV1023','2026-08-27','2026-09-01',6400,18,'Approved','Operations','16:05:00'),

('T024','XYZ Technologies','INV1024','2026-08-28','2026-09-02',10800,18,'Approved','Finance','12:30:00'),

('T025','Global Traders','INV1025','2026-08-29','2026-09-03',13100,18,'Approved','HR','14:15:00'),

('T026','ABC Suppliers','INV1026','2026-08-30','2026-09-04',25000,18,'Approved','IT','10:50:00'),

('T027','Quick Services','INV1027','2026-08-31','2026-09-05',5100,18,'Approved','Operations','11:20:00'),

('T028','XYZ Technologies','INV1028','2026-09-01','2026-09-06',125000,18,'Approved','Finance','22:50:00'),

('T029','Global Traders','INV1029','2026-09-02','2026-09-07',19400,18,'Pending','HR','14:25:00'),

('T030','ABC Suppliers','INV1030','2026-09-03','2026-09-08',7600,18,'Approved','IT','02:15:00'),

('T031','Quick Services','INV1031','2026-09-04','2026-09-09',4500,18,'Approved','Operations','09:30:00'),

('T032','XYZ Technologies','INV1032','2026-09-05','2026-09-10',8700,18,'Approved','Finance','15:20:00'),

('T033','Global Traders','INV1033','2026-09-06','2026-09-11',13900,18,'Approved','HR','12:45:00'),

('T034','ABC Suppliers','INV1034','2026-09-07','2026-09-12',21500,18,'Approved','IT','11:10:00'),

('T035','Quick Services','INV1035','2026-09-08','2026-09-13',6800,18,'Approved','Operations','16:30:00'),

('T036','XYZ Technologies','INV1036','2026-09-09','2026-09-14',11800,18,'Approved','Finance','13:05:00'),

('T037','Global Traders','INV1037','2026-09-10','2026-09-15',15400,18,'Approved','HR','14:50:00'),

('T038','ABC Suppliers','INV1038','2026-09-11','2026-09-16',28500,18,'Approved','IT','10:35:00'),

('T039','Quick Services','INV1039','2026-09-12','2026-09-17',5900,18,'Approved','Operations','11:45:00'),

('T040','XYZ Technologies','INV1040','2026-09-13','2026-09-18',9900,18,'Approved','Finance','15:15:00');


-- ============================================================
-- 4. BASIC DATA CHECK
-- ============================================================

SELECT COUNT(*) AS Total_Transactions
FROM transactions;


-- ============================================================
-- AUDIT QUERY 1
-- PAYMENT BEFORE INVOICE
-- ============================================================

SELECT *
FROM transactions
WHERE Payment_Date < Invoice_Date;


-- ============================================================
-- AUDIT QUERY 2
-- DUPLICATE INVOICES
-- ============================================================

SELECT
    Invoice_Number,
    COUNT(*) AS Occurrences
FROM transactions
GROUP BY Invoice_Number
HAVING COUNT(*) > 1;


-- Show the actual duplicate transactions

SELECT *
FROM transactions
WHERE Invoice_Number IN (
    SELECT Invoice_Number
    FROM transactions
    GROUP BY Invoice_Number
    HAVING COUNT(*) > 1
);


-- ============================================================
-- AUDIT QUERY 3
-- HIGH-VALUE TRANSACTIONS
-- ============================================================

SELECT *
FROM transactions
WHERE Amount > 100000
ORDER BY Amount DESC;


-- ============================================================
-- AUDIT QUERY 4
-- PENDING APPROVALS
-- ============================================================

SELECT *
FROM transactions
WHERE Approval_Status = 'Pending';


-- ============================================================
-- AUDIT QUERY 5
-- UNUSUAL PAYMENT TIME
-- ============================================================

SELECT *
FROM transactions
WHERE Payment_Time < '06:00:00'
   OR Payment_Time >= '22:00:00';


-- ============================================================
-- AUDIT QUERY 6
-- TRANSACTIONS BY VENDOR
-- ============================================================

SELECT
    Vendor_Name,
    COUNT(*) AS Transaction_Count,
    SUM(Amount) AS Total_Amount
FROM transactions
GROUP BY Vendor_Name
ORDER BY Total_Amount DESC;


-- ============================================================
-- AUDIT QUERY 7
-- TRANSACTIONS BY DEPARTMENT
-- ============================================================

SELECT
    Department,
    COUNT(*) AS Transaction_Count,
    SUM(Amount) AS Total_Amount
FROM transactions
GROUP BY Department
ORDER BY Total_Amount DESC;


-- ============================================================
-- AUDIT QUERY 8
-- TOP 10 HIGHEST TRANSACTIONS
-- ============================================================

SELECT
    Transaction_ID,
    Vendor_Name,
    Amount
FROM transactions
ORDER BY Amount DESC
LIMIT 10;


-- ============================================================
-- AUDIT QUERY 9
-- PENDING APPROVAL + HIGH VALUE
-- ============================================================

SELECT *
FROM transactions
WHERE Approval_Status = 'Pending'
  AND Amount > 100000;


-- ============================================================
-- AUDIT QUERY 10
-- MULTIPLE RISK CONDITIONS
-- ============================================================

SELECT
    Transaction_ID,
    Vendor_Name,
    Invoice_Number,
    Amount,
    Approval_Status,
    Invoice_Date,
    Payment_Date,
    Payment_Time
FROM transactions
WHERE Payment_Date < Invoice_Date
   OR Amount > 100000
   OR Approval_Status = 'Pending'
   OR Payment_Time < '06:00:00'
   OR Payment_Time >= '22:00:00';


-- ============================================================
-- END OF AUDIT ANALYTICS SQL
-- ============================================================