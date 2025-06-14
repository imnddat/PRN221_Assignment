USE [master]
GO
/****** Object:  Database [SnackShopDB]    Script Date: 22-Jul-24 2:30:08 PM ******/
CREATE DATABASE [SnackShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SnackShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SnackShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SnackShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SnackShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SnackShopDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SnackShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SnackShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SnackShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SnackShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SnackShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SnackShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SnackShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SnackShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SnackShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SnackShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SnackShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SnackShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SnackShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SnackShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SnackShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SnackShopDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SnackShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SnackShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SnackShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SnackShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SnackShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SnackShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SnackShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SnackShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SnackShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [SnackShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SnackShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SnackShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SnackShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SnackShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SnackShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SnackShopDB', N'ON'
GO
ALTER DATABASE [SnackShopDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SnackShopDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SnackShopDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Gender] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Gender] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[SalesDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[PaymentMethodId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[Company] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoldOrders]    Script Date: 22-Jul-24 2:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoldOrders](
	[SoldOrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoldOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Cakes')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Candies')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Soft Drinks')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (1, N'John Doe', N'1111111111', N'123 Maple St, Springfield', 0)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (2, N'Jane Smith', N'2222222222', N'456 Oak St, Springfield', 1)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (3, N'Emily Davis', N'3333333333', N'789 Pine St, Springfield', 1)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (4, N'Michael Wilson', N'4444444444', N'321 Elm St, Springfield', 0)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (5, N'Jessica Brown', N'5555555555', N'654 Cedar St, Springfield', 1)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (6, N'John Doe', N'6666666666', N'123 Maple St, Springfield', 0)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (7, N'nddat', N'8888888888', N'HD', 1)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (8, N'dat', N'0123456789', N'HD', 1)
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [PhoneNumber], [Address], [Gender]) VALUES (9, N'duc', N'9876543210', N'HD', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Username], [Password], [RoleId], [Gender]) VALUES (1, N'Alice Johnson', N'admin', N'1234', 1, 1)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Username], [Password], [RoleId], [Gender]) VALUES (2, N'Bob Brown', N'sale', N'1234', 2, 0)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Username], [Password], [RoleId], [Gender]) VALUES (3, N'Charlie Green', N'charlie', N'1234', 2, 0)
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [Username], [Password], [RoleId], [Gender]) VALUES (4, N'Diana White', N'diana', N'1234', 2, 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (1, 1, 1, 1, CAST(15.99 AS Decimal(18, 2)), CAST(15.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (2, 1, 9, 1, CAST(1.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (3, 2, 3, 2, CAST(5.99 AS Decimal(18, 2)), CAST(11.98 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (4, 2, 9, 1, CAST(1.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (5, 3, 5, 5, CAST(1.99 AS Decimal(18, 2)), CAST(9.95 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (6, 3, 7, 2, CAST(2.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (7, 4, 2, 3, CAST(1.99 AS Decimal(18, 2)), CAST(5.97 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (8, 5, 4, 2, CAST(14.99 AS Decimal(18, 2)), CAST(29.98 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (9, 6, 8, 10, CAST(0.99 AS Decimal(18, 2)), CAST(9.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (10, 7, 3, 1, CAST(5.99 AS Decimal(18, 2)), CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (11, 7, 1, 1, CAST(15.99 AS Decimal(18, 2)), CAST(15.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (12, 8, 9, 7, CAST(1.50 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (13, 9, 10, 4, CAST(2.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (14, 10, 11, 5, CAST(2.50 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (15, 11, 9, 3, CAST(1.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (16, 12, 11, 3, CAST(2.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (17, 13, 7, 2, CAST(2.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (18, 14, 7, 2, CAST(2.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (19, 15, 4, 2, CAST(15.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (20, 16, 9, 3, CAST(1.50 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [Amount]) VALUES (21, 16, 10, 1, CAST(2.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (1, 1, 2, CAST(N'2024-06-15T10:30:00.000' AS DateTime), CAST(17.49 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (2, 2, 2, CAST(N'2024-06-16T11:00:00.000' AS DateTime), CAST(10.48 AS Decimal(18, 2)), 2)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (3, 3, 3, CAST(N'2024-06-17T11:30:00.000' AS DateTime), CAST(25.98 AS Decimal(18, 2)), 3)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (4, 4, 4, CAST(N'2024-06-18T12:00:00.000' AS DateTime), CAST(5.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (5, 5, 2, CAST(N'2024-06-19T12:30:00.000' AS DateTime), CAST(20.49 AS Decimal(18, 2)), 2)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (6, 1, 3, CAST(N'2024-07-15T13:00:00.000' AS DateTime), CAST(30.98 AS Decimal(18, 2)), 3)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (7, 2, 4, CAST(N'2024-07-16T13:30:00.000' AS DateTime), CAST(10.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (8, 3, 2, CAST(N'2024-07-17T14:00:00.000' AS DateTime), CAST(15.75 AS Decimal(18, 2)), 2)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (9, 4, 3, CAST(N'2024-07-18T14:30:00.000' AS DateTime), CAST(8.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (10, 5, 4, CAST(N'2024-07-19T15:00:00.000' AS DateTime), CAST(12.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (11, 6, 2, CAST(N'2024-07-22T08:51:26.287' AS DateTime), CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (12, 7, 2, CAST(N'2024-07-22T09:09:36.920' AS DateTime), CAST(6.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (13, 8, 2, CAST(N'2024-07-22T09:12:32.740' AS DateTime), CAST(5.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (14, 9, 2, CAST(N'2024-07-22T10:35:27.157' AS DateTime), CAST(5.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (15, 8, 2, CAST(N'2024-07-22T11:03:49.270' AS DateTime), CAST(30.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [EmployeeId], [SalesDate], [TotalAmount], [PaymentMethodId]) VALUES (16, 1, 2, CAST(N'2024-07-22T13:38:21.383' AS DateTime), CAST(7.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([PaymentMethodId], [PaymentMethodName]) VALUES (1, N'Cash')
INSERT [dbo].[PaymentMethods] ([PaymentMethodId], [PaymentMethodName]) VALUES (2, N'Credit Card')
INSERT [dbo].[PaymentMethods] ([PaymentMethodId], [PaymentMethodName]) VALUES (3, N'Mobile Payment')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (1, N'Chocolate Cake', 2, CAST(16.00 AS Decimal(18, 2)), 50, N'Cake Factory', N'USA')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (2, N'Vanilla Cake', 1, CAST(12.99 AS Decimal(18, 2)), 30, N'Cake Factory', N'USA')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (3, N'Red Velvet Cake', 1, CAST(18.99 AS Decimal(18, 2)), 20, N'Sweet Delights', N'Canada')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (4, N'Cheesecake', 1, CAST(15.00 AS Decimal(18, 2)), 23, N'Cheese Haven', N'USA')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (5, N'Gummy Bears', 2, CAST(5.99 AS Decimal(18, 2)), 100, N'Candy Land', N'Germany')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (6, N'Lollipop', 2, CAST(2.00 AS Decimal(18, 2)), 200, N'Candy Land', N'Germany')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (7, N'Chocolate Bar', 2, CAST(2.50 AS Decimal(18, 2)), 148, N'Choco Inc.', N'Switzerland')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (8, N'Candy Cane', 2, CAST(1.00 AS Decimal(18, 2)), 300, N'Holiday Treats', N'USA')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (9, N'Cola', 3, CAST(1.50 AS Decimal(18, 2)), 147, N'Soda Inc.', N'USA')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (10, N'Orange Juice', 3, CAST(2.50 AS Decimal(18, 2)), 99, N'Juice Co.', N'Brazil')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (11, N'Lemonade', 3, CAST(2.00 AS Decimal(18, 2)), 120, N'Citrus World', N'Mexico')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Price], [StockQuantity], [Company], [Country]) VALUES (12, N'Ginger Ale', 3, CAST(1.75 AS Decimal(18, 2)), 80, N'Beverage Corp.', N'Canada')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'ShopOwner')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'SalesStaff')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SoldOrders] ON 

INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (1, 1, 2, CAST(N'2024-06-15T10:30:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (2, 2, 2, CAST(N'2024-06-16T11:00:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (3, 3, 3, CAST(N'2024-06-17T11:30:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (4, 4, 4, CAST(N'2024-06-18T12:00:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (5, 5, 2, CAST(N'2024-06-19T12:30:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (6, 6, 3, CAST(N'2024-07-15T13:00:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (7, 7, 4, CAST(N'2024-07-16T13:30:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (8, 8, 2, CAST(N'2024-07-17T14:00:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (9, 9, 3, CAST(N'2024-07-18T14:30:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (10, 10, 4, CAST(N'2024-07-19T15:00:00.000' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (11, 11, 2, CAST(N'2024-07-22T08:51:26.343' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (12, 12, 2, CAST(N'2024-07-22T09:09:36.967' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (13, 13, 2, CAST(N'2024-07-22T09:12:32.790' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (14, 14, 2, CAST(N'2024-07-22T10:35:27.217' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (15, 15, 2, CAST(N'2024-07-22T11:03:49.377' AS DateTime))
INSERT [dbo].[SoldOrders] ([SoldOrderId], [OrderId], [EmployeeId], [SaleDate]) VALUES (16, 16, 2, CAST(N'2024-07-22T13:38:21.497' AS DateTime))
SET IDENTITY_INSERT [dbo].[SoldOrders] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__536C85E44F056E50]    Script Date: 22-Jul-24 2:30:09 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[SoldOrders]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[SoldOrders]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
USE [master]
GO
ALTER DATABASE [SnackShopDB] SET  READ_WRITE 
GO
