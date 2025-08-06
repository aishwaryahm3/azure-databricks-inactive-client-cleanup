# 🧼 Inactive Client Data Cleanup Pipeline (Real-Time DE Project)

This project demonstrates an end-to-end Data Engineering pipeline to clean inactive/offboarded client records using PySpark on Databricks, store the final dataset in Azure SQL, and optionally visualize the results in Power BI.

---

## 💻 Tech Stack
- **Azure Databricks (PySpark)** – Data filtering & transformation
- **Azure SQL Database** – Storage of cleaned data
- **Python, SQL, JDBC**

---

## 📌 Problem Statement

KYC platforms often accumulate stale or offboarded client data. These stale entries slow down reporting, inflate dashboards, and pollute downstream analytics.

> ❝ Garbage In = Garbage Out ❞

---

## 🔁 Workflow

1. 🧾 **Raw Data** (CSV) stored in ADLS (locally simulated)
2. 🔄 **Databricks Notebook** filters records based on:
   - `is_live = 'N'`
   - `status IN ('Inactive', 'Offboarded')`
   - `last_updated < today - 180 days`
3. 🗄️ **Cleaned data** written to Azure SQL DB
4. 📊 **Power BI** connects to SQL and shows cleanup insights

---

## 🧠 Logic (PySpark Filters)

```python
df_filtered = df_raw.filter(
    (col("is_live") == "Y") &
    (col("status") == "Active") &
    (col("last_updated") >= date_sub(current_date(), 180))
)
