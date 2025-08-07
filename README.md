# 🧼 Inactive Client Data Cleanup Pipeline (Real-Time DE Project)

This project demonstrates an end-to-end Data Engineering pipeline to clean inactive/offboarded client records using PySpark on Databricks, store the final dataset in Azure SQL.

---


## 🔥 Problem Statement

In large-scale banking environments, client master data grows continuously, often retaining information of offboarded, inactive, or duplicate clients. This creates data bloat, slows down systems, increases storage and compute costs, and leads to inefficiencies in downstream analytics and regulatory reporting (especially in KYC, AML, and compliance processes). 

This project addresses the need to identify and clean stale client records in a **secure, scalable, and governed** manner using Azure-native services. We automate the detection and removal of inactive/offboarded clients from raw data, apply business rules for filtration, and load the cleaned dataset into a centralized Azure SQL Database for further usage.

---

## ⚙️ Tech Stack Used

- **Azure Databricks** (PySpark for transformations)
- **Azure Data Lake Storage Gen2** (for staging raw data)
- **Azure SQL Database** (target clean data storage)
- **Azure Portal** (resource provisioning)
- **Python** (data simulation & token generation)
- **GitHub** (project versioning & documentation)

---

## 🧱 Project Architecture

```text
+--------------------+           +-----------------------------+
|                    |           |                             |
|  Raw CSV in ADLS   +---------->  Azure Databricks (PySpark)  |
|                    |           |  - Data cleaning            |
+--------------------+           |  - Transformation logic     |
                                 |                             |
                                 +------------+----------------+
                                              |
                                              v
                              +------------------------------+
                              |  Azure SQL DB (clean layer)  |
                              +------------------------------+
```

---

## 📁 Dataset

We simulate a client master dump using Faker:

**Record Count:** 2000 clients

**Fields:**
- `client_id` (string)
- `name` (string)
- `is_live` (Y/N)
- `status` (Active / Inactive / Offboarded)
- `last_updated` (date)
- `onboarded_on` (date)
- `location` (string)
- `phone_number` (string)
- `risk_score` (double)
- `created_ts` (string)
- `updated_by` (string)
- `update_date` (date)
- `final_updated_by` (string)

---

## 🚦 Execution Steps

### ✅ Phase 1: Data Simulation & Upload
- Simulated dummy data using Faker.
- CSV uploaded to Azure Data Lake Gen2 (raw zone).

---

### ✅ Phase 2: Data Transformation in Databricks

- Connected Databricks to ADLS using **Access Key** authentication.
- Read raw CSV using PySpark.
- Applied cleaning logic:
  - Filtered only `status != 'Inactive' and status != 'Offboarded'`
  - Null-safe handling of dates
  - Added metadata fields like `update_date`, `final_updated_by`
- Validated schema

**Output:** `df_final` – cleaned and transformed client data

---

### ✅ Phase 3: Load to Azure SQL DB

- Provisioned a **Logical SQL Server**
- Created an **Azure SQL Database** under it
- Enabled Public access temporarily for connectivity
- Created target table schema to match `df_final`
- Used JDBC connection to write data from Databricks to Azure SQL

---

## 🚀 How to Run This Project

1. Clone the repo
2. Open the notebook: `inactive_client_cleanup.ipynb`
3. Change storage account name, container, file path as per your setup
4. Run all cells end-to-end in Azure Databricks
5. Ensure Azure SQL DB is reachable and credentials are updated
6. Validate data in SQL via query editor or SSMS

---

## 🧠 Real-Time Use Case

- Bank’s KYC team uses this for monthly offboarding analysis
- Cleaned client data is used by Compliance & Ops
- Power BI dashboards will consume this clean table

---

## 🛠️ Future Enhancements

- Add **ADF pipeline/Airflow** to orchestrate the job
- Use **Key Vault + Service Principal** instead of Access Keys
- Add logging + email alerts for failures


---

## 📌 Disclaimer

This is a simulation project for learning purposes. Real client data should be handled with proper PII masking and enterprise-grade governance.

---
