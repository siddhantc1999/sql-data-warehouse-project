--bronze.crm_cust_info
--bronze.crm_prd_info
--bronze.crm_sales_details

--bronze.crm_erp_loc_a101
--bronze.crm_erp_cust_az12
--bronze.crm_erp_px_cat_g1v2


use DataWarehouse;
go


print('------------------------------------------------------------------------------------------')
if OBJECT_ID('bronze.crm_cust_info','U') is not null
	drop table bronze.crm_cust_info;

--cst_id	cst_key	cst_firstname	cst_lastname	cst_marital_status	cst_gndr	cst_create_date

create table bronze.crm_cust_info(
	cst_id	INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

print('------------------------------------------------------------------------------------------')
--prd_id	prd_key	prd_nm	prd_cost	prd_line	prd_start_dt	prd_end_dt

if OBJECT_ID('bronze.crm_prd_info','U') is not null
	DROP table bronze.crm_prd_info;

create table bronze.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost NVARCHAR(50),
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

print('------------------------------------------------------------------------------------------')
--sls_ord_num	sls_prd_key	sls_cust_id	sls_order_dt	sls_ship_dt	sls_due_dt	sls_sales	sls_quantity	sls_price

if OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
	DROP table bronze.crm_sales_details;

Create table bronze.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

print('------------------------------------------------------------------------------------------')
--CID	CNTRY

if OBJECT_ID('bronze.crm_erp_loc_a101','U') is not null
	drop table bronze.crm_erp_loc_a101;


create table bronze.crm_erp_loc_a101(
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50)
)

print('------------------------------------------------------------------------------------------')

if OBJECT_ID('bronze.crm_erp_cust_az12','U') is not null
	drop table bronze.crm_erp_cust_az12;


create table bronze.crm_erp_cust_az12(
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50)
)

print('------------------------------------------------------------------------------------------')
--ID	CAT	SUBCAT	MAINTENANCE


if OBJECT_ID('bronze.crm_erp_px_cat_g1v2','U') is not null
	drop table bronze.crm_erp_px_cat_g1v2;

create table bronze.crm_erp_px_cat_g1v2(
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
);
print('------------------------------------------------------------------------------------------')



/*select * from bronze.crm_cust_info;
select * from bronze.crm_prd_info
select * from bronze.crm_sales_details

select * from bronze.crm_erp_cust_az12
select * from bronze.crm_erp_loc_a101
select * from bronze.crm_erp_px_cat_g1v2
--SELECT * FROM bronEXEC bronze.load_bronze;ze.crm_erp_px_cat_g1v2
select * from bronze.crm_erp_loc_a101;
drop procedure bronze.load_bronze
execute bronze.load_bronze*/



