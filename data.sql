USE [master]
GO
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
/****** Object:  Table [dbo].[Assesment]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[CategoryDetails]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[Group_Student]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 7/13/2022 1:37:07 AM ******/
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
/****** Object:  Table [dbo].[View]    Script Date: 7/13/2022 1:37:07 AM ******/
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
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_FE', N'FE', N'CSI104', CAST(N'01:00:00' AS Time), 40)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_LAB1', N'LAB1', N'CSI104', CAST(N'01:00:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_LAB2', N'LAB2', N'CSI104', CAST(N'01:00:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_PRE1', N'PRE1', N'CSI104', CAST(N'00:10:00' AS Time), 5)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_PRE2', N'PRE2', N'CSI104', CAST(N'00:10:00' AS Time), 5)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_PT1', N'PT1', N'CSI104', CAST(N'01:00:00' AS Time), 15)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'CSI_PT2', N'PT2', N'CSI104', CAST(N'01:00:00' AS Time), 15)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_ASS1', N'ASS1', N'MAE101', CAST(N'00:20:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_ASS2', N'ASS2', N'MAE101', CAST(N'00:20:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_ASS3', N'ASS3', N'MAE101', CAST(N'00:20:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_FE', N'FE', N'MAE101', CAST(N'01:00:00' AS Time), 40)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_PT1', N'PT1', N'MAE101', CAST(N'00:20:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_PT2', N'PT2', N'MAE101', CAST(N'00:20:00' AS Time), 10)
INSERT [dbo].[Assesment] ([AssID], [CDID], [CourseID], [Duration], [Weight]) VALUES (N'MAE_PT3', N'PT3', N'MAE101', CAST(N'00:20:00' AS Time), 10)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'ACT', N'Activity', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'ASS', N'Assignment', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'FE', N'Final exam', N'4', N'final exam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'GA', N'Group asm', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'GP', N'Group Project', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'LAB', N'Lab', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'ME', N'Mid-term test', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'PA', N'Participation', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'PE', N'Practice Exam', N'>0', N'practical exam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'PEc', N'Practice exam', N'4', N'final exam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'PRE', N'Group presentation', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'PT', N'Progress test', N'>0', N'quiz')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'QUIZ', N'Quiz', N'>0', N'on-going')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'TE', N'Theory Exam', N'4', N'final exam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CompletionCriteria], [Type]) VALUES (N'WS', N'Workshop', N'>0', N'on-going	')
GO
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ACT1', N'ACT', N'Activity 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ACT2', N'ACT', N'Activity 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ACT3', N'ACT', N'Activity 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS1', N'ASS', N'Assignment 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS2', N'ASS', N'Assignment 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS3', N'ASS', N'Assignment 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS4', N'ASS', N'Assignment 4')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS5', N'ASS', N'Assignment 5')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS6', N'ASS', N'Assignment 6')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS7', N'ASS', N'Assignment 7')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ASS8', N'ASS', N'Assignment 8')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'FE', N'FE', N'Final exam')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'GA1', N'GA', N'Group asm 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'GA2', N'GA', N'Group asm 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'GP1', N'GP', N'Group Project 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'GP2', N'GP', N'Group Project 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'GP3', N'GP', N'Group Project 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'LAB1', N'LAB', N'Lab 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'LAB2', N'LAB', N'Lab 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'LAB3', N'LAB', N'Lab 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'LAB4', N'LAB', N'Lab 4')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'LAB5', N'LAB', N'Lab 5')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'LAB6', N'LAB', N'Lab 6')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'ME', N'ME', N'Mid-term test')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PA', N'PA', N'Participation')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PE', N'PE', N'Practice Exam')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PEc', N'PEc', N'Practice Exam')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PRE1', N'PRE', N'Presentation 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PRE2', N'PRE', N'Presentation 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PRE3', N'PRE', N'Presentation 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PRE4', N'PRE', N'Presentation 4')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PRE5', N'PRE', N'Presentation 5')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PT1', N'PT', N'Progress Test 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PT2', N'PT', N'Progress Test 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'PT3', N'PT', N'Progress Test 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'QUIZ', N'QUIZ', N'Quiz')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'TE', N'TE', N'Theory Exam')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS1', N'WS', N'Workshop 1')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS2', N'WS', N'Workshop 2')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS3', N'WS', N'Workshop 3')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS4', N'WS', N'Workshop 4')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS5', N'WS', N'Workshop 5')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS6', N'WS', N'Workshop 6')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS7', N'WS', N'Workshop 7')
INSERT [dbo].[CategoryDetails] ([cdID], [CategoryID], [CDName]) VALUES (N'WS8', N'WS', N'Workshop 8')
GO
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'CSI104', N'Introduction to Computer Science ')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'MAD101', N'Discrete mathematics')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'MAE101', N'Mathematics for Engineering')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRF192', N'Programming Fundamentals ')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'SSL101c', N'Academic Skills for University Success ')
GO
INSERT [dbo].[Group] ([Gid], [gName]) VALUES (N'IA1', N'IA1604')
INSERT [dbo].[Group] ([Gid], [gName]) VALUES (N'IA2', N'IA1605')
INSERT [dbo].[Group] ([Gid], [gName]) VALUES (N'SE1', N'SE1647')
INSERT [dbo].[Group] ([Gid], [gName]) VALUES (N'SE2', N'SE1621')
INSERT [dbo].[Group] ([Gid], [gName]) VALUES (N'SE3', N'SE1649')
GO
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1', N'HE111117')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1', N'HE111119')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA2', N'HA123456')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA2', N'HS123444')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1', N'HE111111')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1', N'HE111112')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1', N'HE111113')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1', N'HE111119')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE2', N'HE111111')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE2', N'HE111114')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE2', N'HE111116')
GO
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HA123456', N'Nguyễn Như', N'Quỳnh', 0, CAST(N'2003-10-24' AS Date), N'Tuyên Quang')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111111', N'Vũ Đức', N'Huy', 1, CAST(N'2002-02-02' AS Date), N'Thái Bình')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111112', N'Vũ Đức', N'Hải', 1, CAST(N'2002-03-02' AS Date), N'Hà Nội')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111113', N'Nguyễn Đức', N'Huy', 1, CAST(N'2002-04-02' AS Date), N'Thái Bình')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111114', N'Trần Công', N'Hoan', 1, CAST(N'2002-05-03' AS Date), N'Hải Phòng')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111115', N'Trần Thị', N'Nhu', 0, CAST(N'2002-07-03' AS Date), N'Hà Giang')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111116', N'Lê Nguyễn Hân', N'Du', 0, CAST(N'2002-12-01' AS Date), N'Thái Bình')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111117', N'Đặng Thị Mai', N'Trinh', 0, CAST(N'2002-02-02' AS Date), N'Thái Bình')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111118', N'Trần Đình', N'Cương', 1, CAST(N'2002-11-19' AS Date), N'Thái Nguyên')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HE111119', N'Vũ Văn ', N'Hải', 1, CAST(N'2002-10-10' AS Date), N'Hà Giang')
INSERT [dbo].[Student] ([sID], [FirstName], [LastName], [Gender], [DOB], [Address]) VALUES (N'HS123444', N'Nguyễn Cảnh ', N'Thương', 1, CAST(N'2003-11-11' AS Date), N'Hà Giang')
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
