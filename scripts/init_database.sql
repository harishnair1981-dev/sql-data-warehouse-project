/*
==========================================================================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the scripts set up three schemas within the database: 'bronze', 'silver', and 'gold.'

WARNING:
  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Process with caution and ensure you havr proper backups before running this script.
==========================================================================================================
*/

USE master;
GO

-- Drop and recreate database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    DROP DATABASE DataWarehouse;
END
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Drop and recreate schemas
IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    DROP SCHEMA bronze;
GO
CREATE SCHEMA bronze;
GO

IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    DROP SCHEMA silver;
GO
CREATE SCHEMA silver;
GO

IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    DROP SCHEMA gold;
GO
CREATE SCHEMA gold;
GO
