USE [SavyPOS_DB]
GO

CREATE TABLE [dbo].[ProductStocks](
	[prodStockId] [int] IDENTITY(1,1) NOT NULL,
	[productId] int NULL,
	[quantity] int NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL
 CONSTRAINT [PK_TransactionProducts] PRIMARY KEY CLUSTERED 
(
	[ProductStocks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO