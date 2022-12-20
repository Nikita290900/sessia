USE [master]
GO
/****** Object:  Database [Абоненты(топко)]    Script Date: 20.12.2022 11:33:11 ******/
CREATE DATABASE [Абоненты(топко)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты(топко)', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты(топко).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты(топко)_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты(топко)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты(топко)] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты(топко)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты(топко)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты(топко)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты(топко)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Абоненты(топко)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты(топко)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты(топко)] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты(топко)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты(топко)] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты(топко)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты(топко)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты(топко)] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты(топко)', N'ON'
GO
ALTER DATABASE [Абоненты(топко)] SET QUERY_STORE = OFF
GO
USE [Абоненты(топко)]
GO
/****** Object:  Table [dbo].[абонент]    Script Date: 20.12.2022 11:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[абонент](
	[ФИО] [nvarchar](100) NOT NULL,
	[Номер_телефона] [nvarchar](50) NOT NULL,
	[кол_во_разговоров] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ФИО] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[города]    Script Date: 20.12.2022 11:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[города](
	[id] [int] NOT NULL,
	[название_города] [nvarchar](50) NOT NULL,
	[код_города] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[разговор]    Script Date: 20.12.2022 11:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[разговор](
	[id] [int] NOT NULL,
	[Номер_договора] [int] NOT NULL,
	[дата_установки_телефона] [nvarchar](50) NOT NULL,
	[Дата_разговора] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[тарифы]    Script Date: 20.12.2022 11:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[тарифы](
	[id] [int] NOT NULL,
	[название] [varchar](50) NOT NULL,
	[оплата] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[абонент] ([ФИО], [Номер_телефона], [кол_во_разговоров]) VALUES (N'Вавилов
Сергей Борисович
', N'(3812)953412   ', 9)
INSERT [dbo].[абонент] ([ФИО], [Номер_телефона], [кол_во_разговоров]) VALUES (N'Орлов 
Сергей Борисович
', N'(3812)531178', 3)
INSERT [dbo].[абонент] ([ФИО], [Номер_телефона], [кол_во_разговоров]) VALUES (N'Орлов 
Сергей Борисович_
', N' (3812)326789      ', 1)
INSERT [dbo].[абонент] ([ФИО], [Номер_телефона], [кол_во_разговоров]) VALUES (N'Титова Александра Ивановна', N'(3812)951211   ', 2)
INSERT [dbo].[абонент] ([ФИО], [Номер_телефона], [кол_во_разговоров]) VALUES (N'Титова Александра Иввановна', N'(3812)333490   ', 4)
GO
INSERT [dbo].[города] ([id], [название_города], [код_города]) VALUES (1, N'Воронеж', 3)
INSERT [dbo].[города] ([id], [название_города], [код_города]) VALUES (3, N'Воронеж', 3)
INSERT [dbo].[города] ([id], [название_города], [код_города]) VALUES (4, N'Воронеж', 3)
GO
INSERT [dbo].[разговор] ([id], [Номер_договора], [дата_установки_телефона], [Дата_разговора]) VALUES (1, 4523, N'04.08.2004', N'08.03.2021')
INSERT [dbo].[разговор] ([id], [Номер_договора], [дата_установки_телефона], [Дата_разговора]) VALUES (3, 99345, N'01.01.2013', N'23.03.2021')
INSERT [dbo].[разговор] ([id], [Номер_договора], [дата_установки_телефона], [Дата_разговора]) VALUES (4, 3465, N'09.10.2012', N'08.03.2021')
GO
INSERT [dbo].[тарифы] ([id], [название], [оплата]) VALUES (1, N'безлимитище', N'20')
INSERT [dbo].[тарифы] ([id], [название], [оплата]) VALUES (3, N'лимитище', N'20')
INSERT [dbo].[тарифы] ([id], [название], [оплата]) VALUES (4, N'вау', N'20')
GO
USE [master]
GO
ALTER DATABASE [Абоненты(топко)] SET  READ_WRITE 
GO
