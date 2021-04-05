USE [SavyPOS_DB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[transactionDate] DATETIME NULL,
	[isDeleted] int NULL,
	[totalAmount] float NULL,
	[isPaid] int NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO