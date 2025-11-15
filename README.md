# DATA WAREHOUSE AND ANALYTICS PROJECT
  
Welcome to the **Data Warehouse and Analytics Project** repository!
This project demonstrates a complete end-to-end data warehouse workflow, starting from raw data ingestion and progressing through each stage of data processing. It highlights practical techniques commonly used in modern data engineering environments.

---

## 🧱 Modern Data Architecture (Medallion Layers)

This project implements the following three structured layers:

### 🥉 Bronze Layer – Raw Data Ingestion
- Directly stores unmodified data from the source systems
- Source files (CSV) are loaded into a SQL Server database
- Acts as the single source for original records

### 🥈 Silver Layer – Cleansed, Standardized & Normalised
- Applies cleaning, deduplication
- Normalizes fields and prepares data for modeling
- Ensures consistency and improves data usability

### 🥇 Gold Layer – Analytics-Ready Data
- Houses business-ready fact & dimension tables
- Modeled using a **Star Schema** for fast analytical queries
- The primary layer is perfect for dashboards, analysis, and reporting

---

## 📘 Project Summary

This Project demonstrates:

- **Architecting a modern data warehouse** using SQL Server
- **Building ETL pipelines** to load and refine data
- **Designing analytical models** (facts & dimensions)
- **Creating professional documentation** for teams and stakeholders

---

## 🧰 Tools & Resources Used

Tools used in this project are:

- **Datasets:** CSV files from CRM and ERP systems
- **SQL Server Management Studio (SSMS):** GUI for SQL Server
- **Git & GitHub:** Version control and project collaboration
- **Draw.io:** Used for architecture, models, and flow diagrams
- **Notion:** Project planning and workflow tracking

---

## Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources** : Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality** : Cleanse and resolve data quality issues prior to analysis.
- **Integration** : Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope** : Focus on the latest dataset only; historization of data is not required.
- **Documentation** : Provide clear documentation of the data model to support both business stakeholders and analytics teams.

### BI: Analytics & Reporting (Data Analytics)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## About Me

Hi, I'm Rahul Gundoju, a graduate in Artificial Intelligence and Data Science. I'm excited to share my project on GitHub!
