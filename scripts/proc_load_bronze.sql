
--truncating and loading the table setting a timer in each truncation and batch start start time in general


--bronze.crm_cust_info
--bronze.crm_prd_info
--bronze.crm_sales_details

--bronze.crm_erp_cust_az12
--bronze.crm_erp_loc_a101
--bronze.crm_erp_px_cat_g1v2

--create or alter procedure bronze.load_bronze as
--	begin 

--create or alter procedure bronze.load_bronze as
-----------------------------------------------

create or alter procedure bronze.load_bronze as
Begin
	BEGIN TRY
		declare @start_time DATETIME,@end_time DATETIME,@batch_starttime DATETIME,@batch_endtime DATETIME;
		set @batch_starttime=getdate();
		set @start_time=getdate();
		truncate table bronze.crm_cust_info
		bulk insert bronze.crm_cust_info
		from 'E:\desktop items 1\sql project files\crm\cust_info.csv'
		with(
			firstrow=2,
			FIELDTERMINATOR=',',
			tablock
			);
	    print 'hi'
		set @end_time=getdate();
		print('Time taken (seconds): ' + CAST(datediff(SECOND, @start_time, @end_time) AS NVARCHAR));
-----------------------------------------------
		set @start_time=getdate();
		truncate table bronze.crm_prd_info
		bulk insert bronze.crm_prd_info
		from 'E:\desktop items 1\sql project files\crm\prd_info.csv'
		with(
			firstrow=2,
			fieldterminator=',',
			tablock
			)
		set @end_time=getdate();
		print(datediff(SECOND,@start_time,@end_time))
-----------------------------------------------
		set @start_time=getdate();
		truncate table bronze.crm_sales_details
		bulk insert bronze.crm_sales_details
		from 'E:\desktop items 1\sql project files\crm\sales_details.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
			)
		set @end_time=getdate();
		print(datediff(SECOND,@start_time,@end_time))
-----------------------------------------------
		set @start_time=getdate();
		truncate table bronze.crm_erp_cust_az12
		bulk insert bronze.crm_erp_cust_az12
		from 'E:\desktop items 1\sql project files\erp\CUST_AZ12.csv'
		with(
			firstrow=2,
			fieldterminator=',',
			tablock
			)
		set @end_time=getdate();
		print(datediff(SECOND,@start_time,@end_time))
------------------------------------------------
		set @start_time=getdate();
		truncate table bronze.crm_erp_loc_a101
		bulk insert bronze.crm_erp_loc_a101
		from 'E:\desktop items 1\sql project files\erp\LOC_A101.csv'
		with(
			firstrow=2,
			fieldterminator=',',
			tablock
			)
		set @end_time=getdate();
		print(datediff(SECOND,@start_time,@end_time))
----------------------------------------------------
		set @start_time=getdate();
		truncate table bronze.crm_erp_px_cat_g1v2
		bulk insert bronze.crm_erp_px_cat_g1v2
		from 'E:\desktop items 1\sql project files\erp\PX_CAT_G1V2.csv'
		with(
			firstrow=2,
			fieldterminator=',',
			tablock
			)
		set @end_time=getdate();
		print(datediff(SECOND,@start_time,@end_time))
--------------------------------------
		set @batch_endtime=getdate();
		print(datediff(SECOND,@batch_starttime,@batch_endtime));
		END TRY
		BEGIN CATCH
			PRINT 'Error Message' + ERROR_MESSAGE();
		END CATCH
END


SELECT * FROM bronze.crm_prd_info
/*SELECT * 
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('bronze.crm_cust_info');*/

/*SELECT blocking_session_id, session_id 
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0;
*/



--bronze.crm_cust_info
--bronze.crm_prd_info
--bronze.crm_sales_details

--bronze.crm_erp_cust_az12
--bronze.crm_erp_loc_a101
--bronze.crm_erp_px_cat_g1v2
