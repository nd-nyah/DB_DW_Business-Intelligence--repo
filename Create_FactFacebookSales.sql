
-- Create Sales FactFacebookSales
USE SP24DW;
GO
-- check for duplicates on the dbo schema
IF OBJECT_ID('dbo.FactFacebookSales') IS NOT NULL
	DROP TABLE dbo.FactFacebookSales;
GO
CREATE TABLE dbo.FactFacebookSales
(
	FactFacebookSalesKey INT NOT NULL IDENTITY(1,1),
	CustomerDwKey INT NOT NULL,
	ProductKey INT NOT NULL,
	DateKey INT NOT NULL,
	OrderQuantity SMALLINT NOT NULL DEFAULT 0,
	SalesAmount MONEY NOT NULL DEFAULT 0,
	UnitPrice MONEY NOT NULL DEFAULT 0,
	DiscountAmount FLOAT NOT NULL DEFAULT 0,

-- for sorting and easy access to data, cluster some keys
	 CONSTRAINT [PK_FactCurrencyRate_CurrencyKey_DateKey] PRIMARY KEY CLUSTERED 
	(
		[CustomerDwKey] ASC,
		[ProductKey] ASC,
		[DateKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];
GO





-- create a relationship FactFacebookSales and Dim tables with foreign keys
USE SP24DW;
GO
-- link Customer dim
ALTER TABLE dbo.FactFacebookSales WITH CHECK ADD CONSTRAINT
FK_FactFacebookSales_DimCustomer FOREIGN KEY(CustomerDwKey)
REFERENCES dbo.DimCustomer (CustomerDwKey);

-- link Product dim
ALTER TABLE dbo.FactFacebookSales WITH CHECK ADD CONSTRAINT
FK_FactFacebookSales_DimProduct FOREIGN KEY(ProductKey)
REFERENCES dbo.DimProduct (ProductKey);

-- link Date dim  
ALTER TABLE dbo.FactFacebookSales WITH CHECK ADD CONSTRAINT
FK_FactFacebookSales_DimDate FOREIGN KEY(DateKey)
REFERENCES dbo.DimDate (DateKey);
GO

