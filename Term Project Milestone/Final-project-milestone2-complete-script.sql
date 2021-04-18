USE [master]
GO
/****** Object:  Database [ScentsyDB]    Script Date: 2/20/2021 9:29:33 PM ******/
CREATE DATABASE [ScentsyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScentsyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ScentsyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ScentsyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ScentsyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ScentsyDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScentsyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScentsyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScentsyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScentsyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScentsyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScentsyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScentsyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScentsyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScentsyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScentsyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScentsyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScentsyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScentsyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScentsyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScentsyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScentsyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScentsyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScentsyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScentsyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScentsyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScentsyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScentsyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScentsyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScentsyDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ScentsyDB] SET  MULTI_USER 
GO
ALTER DATABASE [ScentsyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScentsyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScentsyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScentsyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ScentsyDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ScentsyDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ScentsyDB', N'ON'
GO
ALTER DATABASE [ScentsyDB] SET QUERY_STORE = OFF
GO
USE [ScentsyDB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/20/2021 9:29:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Address] [varchar](50) NULL,
	[ZipCode] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Cell#] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2/20/2021 9:29:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] NOT NULL,
	[ProdName] [varchar](50) NOT NULL,
	[Category] [varchar](15) NOT NULL,
	[MyCost] [money] NOT NULL,
	[CustPrice] [money] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 2/20/2021 9:29:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Name] [varchar](30) NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/20/2021 9:29:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[Date] [date] NULL,
	[LocationID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/20/2021 9:29:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[InventoryID] [int] NOT NULL,
	[QTY] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zipcode]    Script Date: 2/20/2021 9:29:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zipcode](
	[Zipcode] [varchar](12) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Zipcode] PRIMARY KEY CLUSTERED 
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_CustomerID]    Script Date: 2/20/2021 9:29:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_CustomerID] ON [dbo].[Customers]
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_inventoryID]    Script Date: 2/20/2021 9:29:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_inventoryID] ON [dbo].[Inventory]
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_locationID]    Script Date: 2/20/2021 9:29:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_locationID] ON [dbo].[Location]
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_orderID]    Script Date: 2/20/2021 9:29:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_orderID] ON [dbo].[Order]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_orderDetails]    Script Date: 2/20/2021 9:29:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_orderDetails] ON [dbo].[OrderDetails]
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_zipcode]    Script Date: 2/20/2021 9:29:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_zipcode] ON [dbo].[Zipcode]
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_CustZipcode] FOREIGN KEY([ZipCode])
REFERENCES [dbo].[Zipcode] ([Zipcode])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_CustZipcode]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_CustID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_CustID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_LocationID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_InventoryID] FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_InventoryID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderID]
GO
ALTER TABLE [dbo].[Zipcode]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode_Zipcode] FOREIGN KEY([Zipcode])
REFERENCES [dbo].[Zipcode] ([Zipcode])
GO
ALTER TABLE [dbo].[Zipcode] CHECK CONSTRAINT [FK_Zipcode_Zipcode]
GO
USE [master]
GO
ALTER DATABASE [ScentsyDB] SET  READ_WRITE 
GO