
USE SP24DW;
GO
-- check for duplicates
IF OBJECT_ID('dbo.DimCustomer') IS NOT NULL
	DROP TABLE dbo.DimCustomer;
GO
-- Create Customer Dim
CREATE TABLE dbo.DimCustomer
(
CustomerDwKey INT NOT NULL,
CustomerKey INT NOT NULL,
FullName NVARCHAR(150) NULL,
EmailAddress NVARCHAR(50) NULL,
BirthDate DATE NULL,
MaritalStatus NCHAR(1) NULL,
Gender NCHAR(1) NULL,
Education NVARCHAR(40) NULL,
Occupation NVARCHAR(100) NULL,
City NVARCHAR(30) NULL,
StateProvince NVARCHAR(50) NULL,
CountryRegion NVARCHAR(50) NULL,
Age AS
CASE
WHEN DATEDIFF(yy, BirthDate, CURRENT_TIMESTAMP) <= 40
THEN 'Younger'
WHEN DATEDIFF(yy, BirthDate, CURRENT_TIMESTAMP) > 50
THEN 'Older'
ELSE 'Middle Age'
END,
CurrentFlag BIT NOT NULL DEFAULT 1,
CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerDwKey)
);
GO

---- create Product dim
USE SP24DW;
GO
-- check for duplicates
IF OBJECT_ID('dbo.DimProduct') IS NOT NULL
	DROP TABLE dbo.DimProduct;
GO
CREATE TABLE dbo.DimProduct
(
ProductKey INT NOT NULL,
ProductName NVARCHAR(50) NULL,
Color NVARCHAR(15) NULL,
Size NVARCHAR(50) NULL,
SubcategoryName NVARCHAR(50) NULL,
CategoryName NVARCHAR(50) NULL,
CONSTRAINT PK_DimProduct PRIMARY KEY (ProductKey)
);
GO

---- Create Date dim
USE SP24DW;
GO
-- check for duplicates
IF OBJECT_ID('dbo.DimDate') IS NOT NULL
	DROP TABLE dbo.DimDate;
GO
CREATE TABLE dbo.DimDate
(
DateKey INT NOT NULL,
FullDate DATE NOT NULL,
MonthNumberName NVARCHAR(15) NULL,
CalendarQuarter TINYINT NULL,
CalendarYear SMALLINT NULL,
CONSTRAINT PK_DimDate PRIMARY KEY (DateKey)
);
GO




