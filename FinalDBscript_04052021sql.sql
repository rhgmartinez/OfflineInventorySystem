USE [master]
GO
/****** Object:  Database [SavyPOS_DB]    Script Date: 05/04/2021 4:48:15 pm ******/
CREATE DATABASE [SavyPOS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SavyPOS_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SavyPOS_DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SavyPOS_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SavyPOS_DB_log.ldf' , SIZE = 63424KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SavyPOS_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SavyPOS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SavyPOS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SavyPOS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SavyPOS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SavyPOS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SavyPOS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [SavyPOS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [SavyPOS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SavyPOS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SavyPOS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SavyPOS_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SavyPOS_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SavyPOS_DB', N'ON'
GO
USE [SavyPOS_DB]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [varchar](255) NULL,
	[brandDescription] [varchar](255) NULL,
	[brandStatus] [int] NULL,
	[CREATE_DATE] [datetime] NULL,
	[LAST_UPDATE_DATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[transactionId] [int] NULL,
	[totalAmount] [float] NULL,
	[amountPaid] [float] NULL,
	[change] [float] NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](255) NULL,
	[productDescription] [varchar](255) NULL,
	[productStatus] [int] NULL,
	[productSKU] [varchar](255) NULL,
	[productPrice] [varchar](255) NULL,
	[productQty] [int] NULL,
	[productImage] [image] NULL,
	[brandId] [int] NULL,
	[supplierId] [int] NULL,
	[CREATE_DATE] [datetime] NULL,
	[LAST_UPDATE_DATE] [datetime] NULL,
	[deliveredQty] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductStocks]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductStocks](
	[prodStockId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL,
 CONSTRAINT [PK_ProductStocks] PRIMARY KEY CLUSTERED 
(
	[prodStockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplierId] [int] IDENTITY(1,1) NOT NULL,
	[supplierName] [varchar](255) NULL,
	[supplierDescription] [varchar](255) NULL,
	[supplierStatus] [int] NULL,
	[supplierAddress] [varchar](255) NULL,
	[supplierType] [int] NULL,
	[supplierPhone] [varchar](255) NULL,
	[supplierContactPerson] [varchar](255) NULL,
	[CREATE_DATE] [datetime] NULL,
	[LAST_UPDATE_DATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionProducts]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionProducts](
	[transProdId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[discount] [float] NULL,
	[isPercent] [int] NULL,
	[originalPrice] [float] NULL,
	[discountedPrice] [float] NULL,
	[quantity] [int] NULL,
	[transactionId] [int] NULL,
	[isReturned] [int] NULL,
	[qtyReturned] [int] NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL,
 CONSTRAINT [PK_TransactionProducts] PRIMARY KEY CLUSTERED 
(
	[transProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[transactionDate] [datetime] NULL,
	[isDeleted] [int] NULL,
	[totalAmount] [float] NULL,
	[isPaid] [int] NULL,
	[CREATE_DATE] [varchar](255) NULL,
	[LAST_UPDATE_DATE] [varchar](255) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](255) NULL,
	[userPassword] [varchar](12) NULL,
	[CREATE_DATE] [datetime] NULL,
	[LAST_UPDATE_DATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Deliveries]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Deliveries]
AS
SELECT dbo.Products.[productId]
      ,dbo.Products.[productName]
      ,dbo.Products.[productDescription]
      ,dbo.Products.[productStatus]
      ,dbo.Products.[productSKU]
      ,dbo.Products.[productPrice]
      ,dbo.Products.[productQty]
      ,dbo.Brands.[brandName]
      ,dbo.Brands.[brandId]
	  ,dbo.ProductStocks.[quantity] AS deliveredQty
      ,dbo.Products.[LAST_UPDATE_DATE]
      ,dbo.ProductStocks.[CREATE_DATE]
  FROM dbo.Products
  INNER JOIN dbo.Brands ON dbo.Brands.brandId = dbo.Products.brandId
  INNER JOIN dbo.ProductStocks ON dbo.ProductStocks.productId = dbo.Products.productId
GO
/****** Object:  View [dbo].[Inventory]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Inventory]
AS
SELECT dbo.Products.[productId]
      ,dbo.Products.[productName]
      ,dbo.Products.[productDescription]
      ,dbo.Products.[productStatus]
      ,dbo.Products.[productSKU]
      ,dbo.Products.[productPrice]
      ,dbo.Products.[productQty]
      ,dbo.Brands.[brandName]
      ,dbo.Brands.[brandId]
	  ,dbo.ProductStocks.[quantity] AS deliveredQty
      ,dbo.Products.[LAST_UPDATE_DATE]
      ,dbo.ProductStocks.[CREATE_DATE]
  FROM dbo.Products
  INNER JOIN dbo.Brands ON dbo.Brands.brandId = dbo.Products.brandId
  INNER JOIN dbo.ProductStocks ON dbo.ProductStocks.productId = dbo.Products.productId


GO
/****** Object:  View [dbo].[Invoice]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Invoice]
AS
SELECT        dbo.Products.productName, dbo.TransactionProducts.discount, dbo.TransactionProducts.isPercent, dbo.TransactionProducts.originalPrice, dbo.TransactionProducts.discountedPrice, dbo.TransactionProducts.quantity, 
                         dbo.Transactions.totalAmount, dbo.Transactions.isPaid, dbo.Payment.amountPaid, dbo.Payment.change, dbo.Payment.CREATE_DATE, REPLICATE('0',6-LEN(RTRIM(dbo.Payment.paymentId))) + RTRIM(dbo.Payment.paymentId) AS paymentId, dbo.Transactions.transactionId
FROM            dbo.Transactions INNER JOIN
                         dbo.TransactionProducts ON dbo.Transactions.transactionId = dbo.TransactionProducts.transactionId INNER JOIN
                         dbo.Payment ON dbo.Transactions.transactionId = dbo.Payment.transactionId LEFT OUTER JOIN
                         dbo.Products ON dbo.TransactionProducts.productId = dbo.Products.productId


GO
/****** Object:  View [dbo].[ProductStockBalance]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ProductStockBalance]
AS
SELECT dbo.Products.[productId]
      ,dbo.Products.[productName]
      ,'Php '+ CONVERT(VARCHAR,dbo.Products.[productPrice]) AS productPrice
      ,dbo.Products.[productQty]
	  ,'Php '+ CONVERT(VARCHAR,CONVERT(FLOAT, dbo.Products.[productPrice]) * CONVERT(FLOAT,dbo.Products.[productQty])) AS productStockBalanceWithCurrency
	  ,CONVERT(FLOAT, dbo.Products.[productPrice]) * CONVERT(FLOAT,dbo.Products.[productQty]) AS productStockBalance
  FROM dbo.Products



GO
/****** Object:  View [dbo].[Sales]    Script Date: 05/04/2021 4:48:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Sales]
AS
SELECT        dbo.Brands.brandName, dbo.Products.productName, dbo.Products.deliveredQty, dbo.TransactionProducts.discountedPrice, dbo.TransactionProducts.quantity, dbo.TransactionProducts.isReturned, 
                         dbo.TransactionProducts.qtyReturned, dbo.Payment.CREATE_DATE, dbo.Payment.totalAmount, REPLICATE('0',6-LEN(RTRIM(dbo.Payment.paymentId))) + RTRIM(dbo.Payment.paymentId) AS paymentId 
FROM            dbo.Transactions INNER JOIN
                         dbo.TransactionProducts ON dbo.Transactions.transactionId = dbo.TransactionProducts.transactionId INNER JOIN
                         dbo.Payment ON dbo.Transactions.transactionId = dbo.Payment.transactionId INNER JOIN
                         dbo.Products ON dbo.Products.productId = dbo.TransactionProducts.productId INNER JOIN
                         dbo.Brands ON dbo.Brands.brandId = dbo.Products.brandId
WHERE        (dbo.Transactions.isDeleted = 0)



GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 280
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionProducts"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 277
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Transactions"
            Begin Extent = 
               Top = 6
               Left = 512
               Bottom = 275
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Payment"
            Begin Extent = 
               Top = 6
               Left = 749
               Bottom = 265
               Right = 948
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Transactions"
            Begin Extent = 
               Top = 6
               Left = 749
               Bottom = 307
               Right = 948
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionProducts"
            Begin Extent = 
               Top = 6
               Left = 512
               Bottom = 308
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Payment"
            Begin Extent = 
               Top = 6
               Left = 986
               Bottom = 308
               Right = 1185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brands"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 301
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sales'
GO
USE [master]
GO
ALTER DATABASE [SavyPOS_DB] SET  READ_WRITE 
GO
