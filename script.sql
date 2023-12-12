USE [master]
GO
/****** Object:  Database [CoffeeHouse_Baskakov]    Script Date: 12.12.2023 12:21:59 ******/
CREATE DATABASE [CoffeeHouse_Baskakov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeHouse_Baskakov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16\MSSQL\DATA\CoffeeHouse_Baskakov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'CoffeeHouse_Baskakov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16\MSSQL\DATA\CoffeeHouse_Baskakov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeHouse_Baskakov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET QUERY_STORE = OFF
GO
USE [CoffeeHouse_Baskakov]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CoffeeHouse_Baskakov]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Has_WorkingShift]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Has_WorkingShift](
	[EmployeeID] [int] NOT NULL,
	[WorkingShiftID] [int] NOT NULL,
 CONSTRAINT [PK_Employee_Has_WorkingShift] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Employee_Has_WorkingShift] UNIQUE NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePosition]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePosition](
	[id] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeePosition] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] NOT NULL,
	[clientID] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[id] [int] NOT NULL,
	[usersID] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[TableID] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workingShift]    Script Date: 12.12.2023 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workingShift](
	[id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_workingShift] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeePosition]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePosition_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[EmployeePosition] CHECK CONSTRAINT [FK_EmployeePosition_Employee]
GO
ALTER TABLE [dbo].[OrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatus_order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[OrderStatus] CHECK CONSTRAINT [FK_OrderStatus_order]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_Table] FOREIGN KEY([TableID])
REFERENCES [dbo].[Table] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_Table]
GO
USE [master]
GO
ALTER DATABASE [CoffeeHouse_Baskakov] SET  READ_WRITE 
GO
