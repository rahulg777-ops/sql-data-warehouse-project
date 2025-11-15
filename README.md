# DATA WAREHOUSE AND ANALYTICS PROJECT
  
Welcome to the **Data Warehouse and Analytics Project** repository!
This project demonstrates a complete end-to-end data warehouse workflow, starting from raw data ingestion and progressing through each stage of data processing. It highlights practical techniques commonly used in modern data engineering environments.

---

## 🧱 Modern Data Architecture (Medallion Layers)

This project implements the following three structured layers:

<img width="1036" height="631" alt="Data_Architecture" src="https://github.com/user-attachments/assets/597fa61f-3bfc-4af1-8a45-f513bcd36178" />

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

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Key Requirements
- Ingest data from CSV-based source systems (ERP & CRM)
- Check data quality issues before processing
- Integrate datasets into a unified analytical structure
- Use only the latest dataset (Historical data not required)
- Provide documentation for both technical and business teams

#### Objective
Develop SQL-based analytics to shoqcase detailed insights into:
- **Customer Behavior**
- **Product Performance and profitability**
- **Sales Trends**

## 📂 Repository Structure

data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_integration.drawio         # Draw.io file for data integration
│   ├── data_model_starschema.drawio              # Draw.io file for data model (star schema)
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw datasets
│   ├── silver/                         # Scripts for cleaning and transforming data  
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Testing scripts and quality check files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## About Me

Hi, I'm Rahul Gundoju, a graduate in Artificial Intelligence and Data Science. I'm excited to share my project on GitHub!
