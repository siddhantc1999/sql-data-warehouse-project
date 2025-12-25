use master
go

--if exists(select 1 from )
select * from sys.databases;

--select 1 from sys.databases where name='DataWarehouse'
--select 1 from sys.databases where name='DataVerse'

if exists(select 1 from sys.databases where name='DataWarehouse')
Begin
	alter database DataWarehouse set single_user with rollback immediate;
	drop database DataWarehouse
end;
go

create database DataWarehouse
go

use DataWarehouse;
go

create schema bronze
go 

create schema silver
go 

create schema gold
go 
