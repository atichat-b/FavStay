USE [master]
GO
/****** Object:  Database [FavStay]    Script Date: 4/4/2559 11:13:54 ******/
CREATE DATABASE [FavStay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FavStay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FavStay.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FavStay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FavStay_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FavStay] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FavStay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FavStay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FavStay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FavStay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FavStay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FavStay] SET ARITHABORT OFF 
GO
ALTER DATABASE [FavStay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FavStay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FavStay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FavStay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FavStay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FavStay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FavStay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FavStay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FavStay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FavStay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FavStay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FavStay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FavStay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FavStay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FavStay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FavStay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FavStay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FavStay] SET RECOVERY FULL 
GO
ALTER DATABASE [FavStay] SET  MULTI_USER 
GO
ALTER DATABASE [FavStay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FavStay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FavStay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FavStay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FavStay] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FavStay]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/4/2559 11:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 4/4/2559 11:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location_Id] [int] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_NProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/4/2559 11:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Room_Id] [int] NULL,
	[CheckInDate] [datetime] NULL,
	[CheckOutDate] [datetime] NULL,
	[GuestAmount] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Reservation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 4/4/2559 11:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Id] [int] NULL,
	[RoomType_Id] [int] NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_NRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 4/4/2559 11:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Name]) VALUES (1, N'ภูเก็ต')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (2, N'กระบี่')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (3, N'ระยอง')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (4, N'พัทยา')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (5, N'บางแสน')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (6, N'จันทบุรี ')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (7, N'กรุงเทพ')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (8, N'อีสาน')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (9, N'เชียงใหม่')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (10, N'แม่ฮองสอน')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (11, N'หัวหิน')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (12, N'สวนผึ้ง')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (13, N'อัมผวา')
INSERT [dbo].[Location] ([Id], [Name]) VALUES (14, N'หาดใหญ่')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (1, 1, N'Project HKT#1')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (2, 1, N'Project HKT#2')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (3, 1, N'Project HKT#3')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (4, 1, N'Project HKT#4')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (5, 1, N'Project HKT#5')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (6, 9, N'Project CNX#1')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (7, 9, N'Project CNX#2')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (8, 9, N'Project CNX#3')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (9, 9, N'Project CNX#4')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (10, 7, N'Project BKK#1')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (11, 14, N'Project HDY#1')
INSERT [dbo].[Project] ([Id], [Location_Id], [Name]) VALUES (12, 14, N'Project HDY#2')
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (1, 1, 1, N'Room HKT#1 - 1')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (2, 1, 1, N'Room HKT#1 - 2')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (3, 1, 2, N'Room HKT#1 - 3')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (4, 2, 2, N'Room HKT#2 - 4')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (5, 2, 1, N'Room HKT#2 - 5')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (6, 2, 1, N'Room HKT#2 - 6')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (7, 2, 1, N'Room HKT#2 - 7')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (8, 2, 3, N'Room HKT#2 - 8')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (9, 5, 1, N'Room HKT#5 - 9')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (10, 5, 1, N'Room HKT#5 - 10')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (11, 8, 1, N'Room CNX#3 - 11')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (12, 8, 3, N'Room CNX#3 - 12')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (13, 8, 1, N'Room CNX#3 - 13')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (14, 9, 3, N'Room CNX#4 - 14')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (15, 9, 1, N'Room CNX#4 - 15')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (16, 10, 3, N'Room BKK#1 - 16')
INSERT [dbo].[Room] ([Id], [Project_Id], [RoomType_Id], [Title]) VALUES (17, 8, 1, N'Room CNX#3 - 17')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([Id], [Type]) VALUES (1, N'Sea View')
INSERT [dbo].[RoomType] ([Id], [Type]) VALUES (2, N'Mount View')
INSERT [dbo].[RoomType] ([Id], [Type]) VALUES (3, N'City View')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Location] FOREIGN KEY([Location_Id])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Location]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Room] FOREIGN KEY([Room_Id])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Room]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Project1] FOREIGN KEY([Project_Id])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Project1]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomType_Id])
REFERENCES [dbo].[RoomType] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
USE [master]
GO
ALTER DATABASE [FavStay] SET  READ_WRITE 
GO
