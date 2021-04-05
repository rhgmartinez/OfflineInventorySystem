USE [SavyPOS_DB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[transactionId] int NULL,
	[totalAmount] float NULL,
	[amountPaid] float NULL,
	[change] float NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO