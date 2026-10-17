import pandas as pd

# ============================================================
# AUDIT ANALYTICS & TRANSACTION ANOMALY DETECTION SYSTEM
# ============================================================


# ============================================================
# 1. LOAD TRANSACTION DATA
# ============================================================

data = pd.read_csv("Transaction.csv")

print("=" * 70)
print("        AUDIT ANALYTICS & TRANSACTION ANOMALY DETECTION")
print("=" * 70)

print("\nTotal Transactions:", len(data))


# ============================================================
# 2. DATA CLEANING
# ============================================================

# Convert dates into proper date format
data["Invoice_Date"] = pd.to_datetime(data["Invoice_Date"])
data["Payment_Date"] = pd.to_datetime(data["Payment_Date"])

# Make sure Amount is numeric
data["Amount"] = pd.to_numeric(data["Amount"], errors="coerce")

# Create columns for our risk system
data["Risk_Score"] = 0
data["Risk_Flags"] = ""


# ============================================================
# AUDIT RULE 1
# PAYMENT BEFORE INVOICE
# ============================================================

rule1 = data["Payment_Date"] < data["Invoice_Date"]

data.loc[rule1, "Risk_Score"] += 30

data.loc[rule1, "Risk_Flags"] += (
    "Payment before invoice; "
)


# ============================================================
# AUDIT RULE 2
# DUPLICATE INVOICE
# ============================================================

rule2 = data["Invoice_Number"].duplicated(keep=False)

data.loc[rule2, "Risk_Score"] += 30

data.loc[rule2, "Risk_Flags"] += (
    "Duplicate invoice; "
)


# ============================================================
# AUDIT RULE 3
# HIGH-VALUE TRANSACTION
# ============================================================

rule3 = data["Amount"] > 100000

data.loc[rule3, "Risk_Score"] += 20

data.loc[rule3, "Risk_Flags"] += (
    "High transaction amount; "
)


# ============================================================
# AUDIT RULE 4
# PENDING APPROVAL
# ============================================================

rule4 = data["Approval_Status"].str.lower() == "pending"

data.loc[rule4, "Risk_Score"] += 20

data.loc[rule4, "Risk_Flags"] += (
    "Pending approval; "
)


# ============================================================
# AUDIT RULE 5
# UNUSUAL PAYMENT TIME
# ============================================================

payment_hour = pd.to_datetime(
    data["Payment_Time"],
    format="%H:%M"
).dt.hour

rule5 = (
    (payment_hour < 6)
    | (payment_hour >= 22)
)

data.loc[rule5, "Risk_Score"] += 15

data.loc[rule5, "Risk_Flags"] += (
    "Unusual payment time; "
)


# ============================================================
# 3. CALCULATE RISK LEVEL
# ============================================================

def calculate_risk_level(score):

    if score >= 30:
        return "HIGH"

    elif score > 0:
        return "MEDIUM"

    else:
        return "LOW"


data["Risk_Level"] = data["Risk_Score"].apply(
    calculate_risk_level
)


# ============================================================
# 4. GET FLAGGED TRANSACTIONS
# ============================================================

flagged_transactions = data[
    data["Risk_Score"] > 0
]


# ============================================================
# 5. DISPLAY FLAGGED TRANSACTIONS
# ============================================================

print("\n" + "=" * 70)
print("                 FLAGGED TRANSACTIONS")
print("=" * 70)

print(
    flagged_transactions[
        [
            "Transaction_ID",
            "Vendor_Name",
            "Invoice_Number",
            "Amount",
            "Risk_Score",
            "Risk_Level",
            "Risk_Flags"
        ]
    ].to_string(index=False)
)


# ============================================================
# 6. AUDIT SUMMARY
# ============================================================

print("\n" + "=" * 70)
print("                     AUDIT SUMMARY")
print("=" * 70)

print(
    "Total Transactions :",
    len(data)
)

print(
    "Flagged Transactions:",
    len(flagged_transactions)
)

print(
    "High Risk           :",
    len(data[data["Risk_Level"] == "HIGH"])
)

print(
    "Medium Risk         :",
    len(data[data["Risk_Level"] == "MEDIUM"])
)

print(
    "Low Risk            :",
    len(data[data["Risk_Level"] == "LOW"])
)


# ============================================================
# 7. SAVE AUDIT EXCEPTION REPORT
# ============================================================

flagged_transactions.to_csv(
    "Audit_Exception_Report.csv",
    index=False
)

print("\nAudit report created:")
print("Audit_Exception_Report.csv")