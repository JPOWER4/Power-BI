USE master
GO

-- Drop and restore AdventureWorksDW
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'AdventureWorksDW')
BEGIN
	DROP Database AdventureWorksDW
END
GO

RESTORE DATABASE [AdventureWorksDW] FROM  DISK = N'C:\SetupFiles\AdventureWorksDW.bak' WITH  REPLACE,
MOVE N'AdventureWorksDW_Data' TO N'$(SUBDIR)SetupFiles\AdventureWorksDW_Data.mdf', 
MOVE N'AdventureWorksDW_Log' TO N'$(SUBDIR)SetupFiles\AdventureWorksDW_log.ldf'
GO

ALTER AUTHORIZATION ON DATABASE::AdventureWorksDW TO [ADVENTUREWORKS\Student];

-- Restore the AdventureWorks Database

IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'AdventureWorks')
BEGIN
	DROP Database AdventureWorks
END
GO

RESTORE DATABASE [AdventureWorks] FROM  DISK = N'C:\SetupFiles\AdventureWorks.bak' WITH  REPLACE,
MOVE N'AdventureWorks2012_Data' TO N'$(SUBDIR)SetupFiles\AdventureWorks_Data.mdf', 
MOVE N'AdventureWorks2012_Log' TO N'$(SUBDIR)SetupFiles\AdventureWorks_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::AdventureWorks TO [ADVENTUREWORKS\Student];
GO