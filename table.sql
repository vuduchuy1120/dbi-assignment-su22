USE [master]
GO
/****** Object:  Database [Grading Management System]    Script Date: 7/8/2022 4:01:12 PM ******/
CREATE DATABASE [Grading Management System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Grading Management System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUYVU\MSSQL\DATA\Grading Management System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Grading Management System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUYVU\MSSQL\DATA\Grading Management System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Grading Management System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Grading Management System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Grading Management System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Grading Management System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Grading Management System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Grading Management System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Grading Management System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Grading Management System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Grading Management System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Grading Management System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Grading Management System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Grading Management System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Grading Management System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Grading Management System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Grading Management System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Grading Management System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Grading Management System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Grading Management System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Grading Management System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Grading Management System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Grading Management System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Grading Management System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Grading Management System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Grading Management System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Grading Management System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Grading Management System] SET  MULTI_USER 
GO
ALTER DATABASE [Grading Management System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Grading Management System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Grading Management System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Grading Management System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Grading Management System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Grading Management System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Grading Management System] SET QUERY_STORE = OFF
GO
USE [Grading Management System]
GO
/****** Object:  Table [dbo].[Assesment]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment](
	[AssID] [varchar](10) NOT NULL,
	[CDID] [varchar](10) NOT NULL,
	[CourseID] [varchar](10) NOT NULL,
	[Duration] [time](2) NOT NULL,
	[Weight] [float] NOT NULL,
 CONSTRAINT [PK_Assesment] PRIMARY KEY CLUSTERED 
(
	[AssID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CompletionCriteria] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDetails]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDetails](
	[cdID] [varchar](10) NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
	[CDName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryDetails] PRIMARY KEY CLUSTERED 
(
	[cdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](10) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[sID] [char](8) NOT NULL,
	[AssID] [varchar](10) NOT NULL,
	[Score] [float] NOT NULL,
	[DateExam] [date] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[AssID] ASC,
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Gid] [varchar](10) NOT NULL,
	[gName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Student](
	[gID] [varchar](10) NOT NULL,
	[sID] [char](8) NOT NULL,
 CONSTRAINT [PK_Group_Student] PRIMARY KEY CLUSTERED 
(
	[gID] ASC,
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sID] [char](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [nvarchar](150) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 7/8/2022 4:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[sID] [char](8) NOT NULL,
	[CourseID] [varchar](10) NOT NULL,
	[Semester] [varchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Average] [float] NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assesment]  WITH CHECK ADD  CONSTRAINT [FK_Assesment_CategoryDetails] FOREIGN KEY([CDID])
REFERENCES [dbo].[CategoryDetails] ([cdID])
GO
ALTER TABLE [dbo].[Assesment] CHECK CONSTRAINT [FK_Assesment_CategoryDetails]
GO
ALTER TABLE [dbo].[Assesment]  WITH CHECK ADD  CONSTRAINT [FK_Assesment_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Assesment] CHECK CONSTRAINT [FK_Assesment_Course]
GO
ALTER TABLE [dbo].[CategoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDetails_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[CategoryDetails] CHECK CONSTRAINT [FK_CategoryDetails_Category]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Assesment] FOREIGN KEY([AssID])
REFERENCES [dbo].[Assesment] ([AssID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Assesment]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Group] FOREIGN KEY([gID])
REFERENCES [dbo].[Group] ([Gid])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Group]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Student] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sID])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Student]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FK_View_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FK_View_Course]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FK_View_Student] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sID])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FK_View_Student]
GO
USE [master]
GO
ALTER DATABASE [Grading Management System] SET  READ_WRITE 
GO
