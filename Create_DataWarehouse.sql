
-- check if the DW name has already been created
USE master;
IF DB_ID('SP24DW') IS NOT NULL
	DROP DATABASE SP24DW;
GO


-- specify location and sizes for primary and log file
CREATE DATABASE SP24DW
	ON PRIMARY
	(NAME = N'SP24DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SP24DW.mdf',
	 SIZE = 10MB,  
    MAXSIZE = 50MB,  
    FILEGROWTH = 5MB )
	
	LOG ON
	(NAME = N'SP24DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SP24DW_log.ldf',
	 SIZE = 10MB,  
    MAXSIZE = 50MB,  
    FILEGROWTH = 5MB );
	
GO


-- alter table and change recovery to simple
ALTER DATABASE SP24DW SET RECOVERY SIMPLE WITH NO_WAIT;
GO

-- add autoshrink 
ALTER DATABASE SP24DW SET AUTO_SHRINK ON WITH NO_WAIT
GO

-- add auto close
ALTER DATABASE SP24DW SET AUTO_CLOSE ON WITH NO_WAIT
GO




