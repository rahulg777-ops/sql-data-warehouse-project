/*
=================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=================================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the `BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze. load_bronze;
=================================================================================
*/

Create OR ALTER PROCEDURE BRONZE.LOAD_BRONZE AS
BEGIN 
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY 
		SET @batch_start_time = GETDATE();
		PRINT '=========================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=========================================';

		PRINT '-------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-------------------------------';

		Set @start_time =GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_cust_info';
		TRUNCATE TABLE Bronze.crm_cust_info;

		PRINT '>> Inserting Data into: Bronze.crm_cust_info';
		BULK INSERT Bronze.crm_cust_info
		From 'D:\SQL\Projects\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		With (
			Firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		Set @end_time =GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) As NVARCHAR) + 'seconds';
		PRINT '>> ---------------';

		Set @start_time =GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_prd_info';
		TRUNCATE TABLE Bronze.crm_prd_info;

		PRINT '>> Inserting Data into: Bronze.crm_prd_info';
		BULK INSERT Bronze.crm_prd_info
		From 'D:\SQL\Projects\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		With (
			Firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		Set @end_time =GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) As NVARCHAR) + 'seconds';
		PRINT '>> ---------------';

		Set @start_time =GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_sales_details';
		TRUNCATE TABLE Bronze.crm_sales_details;

		PRINT '>> Inserting Data into: Bronze.crm_sales_details';
		BULK INSERT Bronze.crm_sales_details
		From 'D:\SQL\Projects\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		With (
			Firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		Set @end_time =GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) As NVARCHAR) + 'seconds';
		PRINT '>> ---------------';

		PRINT '-------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-------------------------------';

		Set @start_time =GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_CUST_AZ12';
		TRUNCATE TABLE Bronze.erp_CUST_AZ12;

		PRINT '>> Inserting Data into: Bronze.erp_CUST_AZ12';
		BULK INSERT Bronze.erp_CUST_AZ12
		From 'D:\SQL\Projects\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		With (
			Firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		Set @end_time =GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) As NVARCHAR) + 'seconds';
		PRINT '>> ---------------';

		Set @start_time =GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_LOC_A101';
		TRUNCATE TABLE Bronze.erp_LOC_A101;

		PRINT '>> Inserting Data into: Bronze.erp_LOC_A101';
		BULK INSERT Bronze.erp_LOC_A101
		From 'D:\SQL\Projects\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		With (
			Firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		Set @end_time =GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) As NVARCHAR) + 'seconds';
		PRINT '>> ---------------';

		Set @start_time =GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE Bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data into: Bronze.erp_px_cat_g1v2';
		BULK INSERT Bronze.erp_px_cat_g1v2
		From 'D:\SQL\Projects\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		With (
			Firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		Set @end_time =GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) As NVARCHAR) + 'seconds';
		PRINT '>> ---------------';

		Set @batch_end_time = GETDATE();
		PRINT '=========================================';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '  - Total Load Duration: '+ CAST(DATEDIFF(Second, @batch_start_time, @batch_end_time) As NVARCHAR) + 'seconds';
		PRINT '=========================================';
	END TRY
	BEGIN CATCH
		PRINT '=========================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message' + Error_Message();
		PRINT 'Error Message' + CAST(Error_Number() AS NVARCHAR);
		PRINT 'Error Message' + CAST(Error_state() AS NVARCHAR);
		PRINT '=========================================';
	END CATCH
END
