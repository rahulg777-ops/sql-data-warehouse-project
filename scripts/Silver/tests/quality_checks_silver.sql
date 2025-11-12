/*
==========================================================================
Quality Checks
==========================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schemas. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
==========================================================================
*/

--========================================================
-- checking Silver.crm_cust_info and Silver.crm_prd.info
--========================================================
-- Check for nulls and duplicates in the primary key
-- Expectation : No result
select 
	prd_id,
	COUNT(*)
from silver.crm_prd_info
group by prd_id
having count(*) > 1 OR prd_id IS NULL

-- Check for umwanted spaces
-- Expectation : No result
select prd_nm
from silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm) 

-- Check for NULlS or Negative numbers
-- Expectation : No results
select prd_cost
from silver.crm_prd_info
WHERE prd_cost < 0  OR prd_cost IS NULL

-- Data standardization and Normalisation
select DISTINCT prd_line
from silver.crm_prd_info

-- Check for invalid date orders
select * 
from  silver.crm_prd_info
Where prd_end_dt < prd_start_dt


--========================================================
-- checking Silver.crm_sales_details
--========================================================
--Check for Invalid Dates
select 
NULLIF(sls_order_dt,0) sls_order_dt
from bronze.crm_sales_details
WHERE sls_order_dt <= 0 OR LEN(sls_order_dt) != 8

-- Check the invalid date Orders
Select *
from bronze.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check data consistency between sales, quantity, price
-- >> Sales = Quantity * Price
-- >> Values must not be NULL, zero, Negative
Select DISTINCT
sls_sales AS old_sls_sales,
sls_quantity,
sls_price AS old_sls_price,
CASE WHEN sls_sales IS NULL OR sls_sales<=0 OR sls_sales != sls_quantity * ABS(sls_price)
	THEN sls_quantity * ABS(sls_price)
	ELSE sls_sales
END sls_sales,
CASE WHEN sls_price IS NULL OR sls_price <= 0
	THEN sls_sales/NULLIF(sls_quantity, 0)
	ELSe sls_price
END as sls_price
from bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
Order by sls_sales,sls_quantity,sls_price


--========================================================
-- checking Silver.erp_cust_az12
--========================================================
-- Identify Out of Range dates
Select DISTINCT bdate
from bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate>GETDATE()

--- Data standardization and Consistency
select DISTINCT gen
from Silver.erp_cust_az12

--========================================================
-- checking Silver.erp_loc_a101
--========================================================
--- Data standardization and Consistency
select DISTINCT cntry
from Silver.erp_loc_a101
Order by cntry

--========================================================
-- checking Silver.ERP_PX_CAT_G1V2
--========================================================
-- Check for unwanted spaces
select * 
from Bronze.ERP_PX_CAT_G1V2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)

-- Check data standardisation
select DISTINCT cat
from Bronze.ERP_PX_CAT_G1V2
