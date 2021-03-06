USE [master]
GO
/****** Object:  Database [wa_test]    Script Date: 02-May-17 9:19:39 AM ******/
CREATE DATABASE [wa_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wa_test', FILENAME = N'E:\SQL--re\MSSQL11.MSSQLSERVER\MSSQL\DATA\wa_test.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'wa_test_log', FILENAME = N'E:\SQL--re\MSSQL11.MSSQLSERVER\MSSQL\DATA\wa_test_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [wa_test] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wa_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wa_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wa_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wa_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wa_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wa_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [wa_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wa_test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [wa_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wa_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wa_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wa_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wa_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wa_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wa_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wa_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wa_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wa_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wa_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wa_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wa_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wa_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wa_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wa_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wa_test] SET RECOVERY FULL 
GO
ALTER DATABASE [wa_test] SET  MULTI_USER 
GO
ALTER DATABASE [wa_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wa_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wa_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wa_test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'wa_test', N'ON'
GO
USE [wa_test]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-May-17 9:19:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [bigint] IDENTITY(1000,1) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
	[CategoryNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 02-May-17 9:19:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] IDENTITY(1000,1) NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryNote]) VALUES (1000, N'Quần', N'Danh sách các loại quần hiện có')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryNote]) VALUES (1001, N'Áo', N'Danh sách các loại áo hiện có')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryNote]) VALUES (1002, N'Giày', N'Danh sách các loại giày hiện có')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryNote]) VALUES (1003, N'Dép', N'Danh sách các loại dép hiện có')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryNote]) VALUES (1004, N'Mũ', N'Danh sách các loại mũ hiện có')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [ProductDescription], [ProductNote]) VALUES (1000, 1000, N'Quần đùi', N'Quần đùi mùa hè', NULL)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [ProductDescription], [ProductNote]) VALUES (1001, 1000, N'Quần âu', N'Quần âu nam', NULL)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [ProductDescription], [ProductNote]) VALUES (1002, 1001, N'Áo phông', N'Áo phông mùa hè', NULL)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [ProductDescription], [ProductNote]) VALUES (1003, 1001, N'Áo sơ mi', N'Áo sơ mi mùa hè', NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [wa_test] SET  READ_WRITE 
GO
