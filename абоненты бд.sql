USE [master]
GO
/****** Object:  Database [Абоненты(топко)]    Script Date: 20.12.2022 11:38:06 ******/
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
/****** Object:  Table [dbo].[абонент]    Script Date: 20.12.2022 11:38:06 ******/
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
/****** Object:  Table [dbo].[разговор]    Script Date: 20.12.2022 11:38:06 ******/
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
/****** Object:  Table [dbo].[тарифы]    Script Date: 20.12.2022 11:38:06 ******/
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
/****** Object:  Table [dbo].[города]    Script Date: 20.12.2022 11:38:06 ******/
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
/****** Object:  View [dbo].[View_1]    Script Date: 20.12.2022 11:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.тарифы.*, dbo.разговор.Номер_договора
FROM            dbo.разговор INNER JOIN
                         dbo.города ON dbo.разговор.id = dbo.города.id INNER JOIN
                         dbo.тарифы ON dbo.разговор.id = dbo.тарифы.id CROSS JOIN
                         dbo.абонент
GO
/****** Object:  View [dbo].[View_2]    Script Date: 20.12.2022 11:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.абонент.Номер_телефона, dbo.тарифы.оплата
FROM            dbo.абонент CROSS JOIN
                         dbo.тарифы
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
         Begin Table = "абонент"
            Begin Extent = 
               Top = 32
               Left = 10
               Bottom = 145
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "города"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 119
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "разговор"
            Begin Extent = 
               Top = 173
               Left = 0
               Bottom = 303
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "тарифы"
            Begin Extent = 
               Top = 181
               Left = 337
               Bottom = 294
               Right = 511
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
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
         Begin Table = "абонент"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "тарифы"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 119
               Right = 445
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [Абоненты(топко)] SET  READ_WRITE 
GO
