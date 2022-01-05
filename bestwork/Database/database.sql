USE [master]
GO
/****** Object:  Database [NMCNPM_Database]    Script Date: 1/5/2022 4:03:09 PM ******/
CREATE DATABASE [NMCNPM_Database]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'NMCNPM_Database', FILENAME = N'D:\Introdution to SE\Database\NMCNPM_Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'NMCNPM_Database_log', FILENAME = N'D:\Introdution to SE\Database\NMCNPM_Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
--GO
--ALTER DATABASE [NMCNPM_Database] SET COMPATIBILITY_LEVEL = 150
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [NMCNPM_Database].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
ALTER DATABASE [NMCNPM_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NMCNPM_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NMCNPM_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NMCNPM_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NMCNPM_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NMCNPM_Database] SET  MULTI_USER 
GO
ALTER DATABASE [NMCNPM_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NMCNPM_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NMCNPM_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NMCNPM_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NMCNPM_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NMCNPM_Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NMCNPM_Database] SET QUERY_STORE = OFF
GO
USE [NMCNPM_Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [char](150) NULL,
	[User_Type] [nchar](20) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Name] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [nvarchar](20) NULL,
	[Phone_Number] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Account_ID] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Recruiter_Job_ID] [int] NOT NULL,
	[Candidate_ID] [int] NOT NULL,
	[Apply_Time] [datetime] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC,
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[Candidate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Candidate_Name] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [nvarchar](20) NULL,
	[Phone_Number] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[About] [nvarchar](200) NULL,
	[Apply_Position] [int] NULL,
	[Working_Form] [nvarchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Account_ID] [int] NULL,
	[Public_CV] [bit] NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate_Interest]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate_Interest](
	[Interest_ID] [int] NOT NULL,
	[Candidate_ID] [int] NOT NULL,
 CONSTRAINT [PK_Candidate_Interest] PRIMARY KEY CLUSTERED 
(
	[Interest_ID] ASC,
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate_Skill]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate_Skill](
	[Skill_ID] [int] NOT NULL,
	[Candidate_ID] [int] NOT NULL,
	[Rank] [smallint] NULL,
 CONSTRAINT [PK_Candidate_Skill] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC,
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Description]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Description](
	[Recruiter_Job_ID] [int] NOT NULL,
	[Ordinal_Number] [smallint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](300) NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC,
	[Ordinal_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experience_Require]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience_Require](
	[Recuiter_Job_ID] [int] NOT NULL,
	[Skill_ID] [int] NOT NULL,
 CONSTRAINT [PK_Experience_Require] PRIMARY KEY CLUSTERED 
(
	[Recuiter_Job_ID] ASC,
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Frequently_Interview_Question]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frequently_Interview_Question](
	[Ques_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Posted_Date] [date] NULL,
	[Posted_Time] [time](7) NULL,
	[Status] [bit] NULL,
	[Admin_ID] [int] NULL,
 CONSTRAINT [PK_Frequently Interview Question] PRIMARY KEY CLUSTERED 
(
	[Ques_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interest]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interest](
	[Interest_ID] [int] IDENTITY(1,1) NOT NULL,
	[Interest_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Interest] PRIMARY KEY CLUSTERED 
(
	[Interest_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview_Ques_Detail]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview_Ques_Detail](
	[Ques_ID] [int] NOT NULL,
	[Ordinal_Number] [smallint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](300) NULL,
 CONSTRAINT [PK_Interview Ques Detail] PRIMARY KEY CLUSTERED 
(
	[Ques_ID] ASC,
	[Ordinal_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Job_ID] [int] IDENTITY(1,1) NOT NULL,
	[Job_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Type]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Type](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NULL,
	[Job_ID] [int] NULL,
 CONSTRAINT [PK_Job_Type] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[Recruiter_ID] [int] IDENTITY(1,1) NOT NULL,
	[Recruiter_Name] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Tax] [char](10) NULL,
	[Email] [nchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Account_ID] [int] NULL,
 CONSTRAINT [PK_Recruiter] PRIMARY KEY CLUSTERED 
(
	[Recruiter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter Job]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter_Job](
	[Recruiter_Job_ID] [int] IDENTITY(1,1) NOT NULL,
	[Job_Name] [nvarchar](50) NULL,
	[Salary] [int] NULL,
	[Start_Date] [date] NULL,
	[End_Date] [date] NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Working_Form] [nvarchar](50) NULL,
	[Recruitment_Quantity] [smallint] NULL,
	[Status] [nvarchar](50) NULL,
	[Remote] [bit] NULL,
	[Years_Of_Experience] [smallint] NULL,
	[Type_ID] [int] NULL,
	[Recruiter_ID] [int] NULL,
 CONSTRAINT [PK_Recruiter_Job] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 1/5/2022 4:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[Skill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Interest] ON 

INSERT [dbo].[Interest] ([Interest_ID], [Interest_Name]) VALUES (1, N'Đọc sách')
INSERT [dbo].[Interest] ([Interest_ID], [Interest_Name]) VALUES (2, N'Nghe nhạc')
INSERT [dbo].[Interest] ([Interest_ID], [Interest_Name]) VALUES (3, N'Xem phim')
INSERT [dbo].[Interest] ([Interest_ID], [Interest_Name]) VALUES (4, N'Hát')
INSERT [dbo].[Interest] ([Interest_ID], [Interest_Name]) VALUES (5, N'Nhảy')
SET IDENTITY_INSERT [dbo].[Interest] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([Job_ID], [Job_Name]) VALUES (1, N'IT - Phần mềm')
INSERT [dbo].[Job] ([Job_ID], [Job_Name]) VALUES (2, N'Kế toán')
INSERT [dbo].[Job] ([Job_ID], [Job_Name]) VALUES (3, N'Nhân sự')
INSERT [dbo].[Job] ([Job_ID], [Job_Name]) VALUES (4, N'Marketing')
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[Job_Type] ON 

INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (1, N'Androi Developer', 1)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (2, N'Java Developer', 1)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (3, N'PHP Developer', 1)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (4, N'Kế toán thanh toán', 2)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (5, N'Kế toán trưởng ', 2)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (6, N'Chuyên viên ứng dụng', 3)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (7, N'Trưởng phòng nhân sự', 3)
INSERT [dbo].[Job_Type] ([Type_ID], [Type_Name], [Job_ID]) VALUES (8, N'Chuyên viên Markerting', 4)
SET IDENTITY_INSERT [dbo].[Job_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([Skill_ID], [Skill_Name]) VALUES (1, N'Lập trình C/C++')
INSERT [dbo].[Skill] ([Skill_ID], [Skill_Name]) VALUES (2, N'Lập trình Python')
INSERT [dbo].[Skill] ([Skill_ID], [Skill_Name]) VALUES (3, N'Lập trình SQL, noSQL')
INSERT [dbo].[Skill] ([Skill_ID], [Skill_Name]) VALUES (4, N'Lập trình Java')
INSERT [dbo].[Skill] ([Skill_ID], [Skill_Name]) VALUES (5, N'Lập trình NodeJS')
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Account]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Candidate] FOREIGN KEY([Candidate_ID])
REFERENCES [dbo].[Candidate] ([Candidate_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Candidate]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Recruiter_Job] FOREIGN KEY([Recruiter_Job_ID])
REFERENCES [dbo].[Recruiter_Job] ([Recruiter_Job_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Recruiter Job]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_Account]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Job] FOREIGN KEY([Apply_Position])
REFERENCES [dbo].[Job] ([Job_ID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_Job]
GO
ALTER TABLE [dbo].[Candidate_Interest]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Interest_Candidate] FOREIGN KEY([Candidate_ID])
REFERENCES [dbo].[Candidate] ([Candidate_ID])
GO
ALTER TABLE [dbo].[Candidate_Interest] CHECK CONSTRAINT [FK_Candidate_Interest_Candidate]
GO
ALTER TABLE [dbo].[Candidate_Interest]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Interest_Interest] FOREIGN KEY([Interest_ID])
REFERENCES [dbo].[Interest] ([Interest_ID])
GO
ALTER TABLE [dbo].[Candidate_Interest] CHECK CONSTRAINT [FK_Candidate_Interest_Interest]
GO
ALTER TABLE [dbo].[Candidate_Skill]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Skill_Candidate] FOREIGN KEY([Candidate_ID])
REFERENCES [dbo].[Candidate] ([Candidate_ID])
GO
ALTER TABLE [dbo].[Candidate_Skill] CHECK CONSTRAINT [FK_Candidate_Skill_Candidate]
GO
ALTER TABLE [dbo].[Candidate_Skill]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Skill_Skill] FOREIGN KEY([Skill_ID])
REFERENCES [dbo].[Skill] ([Skill_ID])
GO
ALTER TABLE [dbo].[Candidate_Skill] CHECK CONSTRAINT [FK_Candidate_Skill_Skill]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_Description_Recruiter Job] FOREIGN KEY([Recruiter_Job_ID])
REFERENCES [dbo].[Recruiter Job] ([Recruiter_Job_ID])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Description_Recruiter Job]
GO
ALTER TABLE [dbo].[Experience_Require]  WITH CHECK ADD  CONSTRAINT [FK_Experience_Require_Recruiter Job] FOREIGN KEY([Recuiter_Job_ID])
REFERENCES [dbo].[Recruiter Job] ([Recruiter_Job_ID])
GO
ALTER TABLE [dbo].[Experience_Require] CHECK CONSTRAINT [FK_Experience_Require_Recruiter Job]
GO
ALTER TABLE [dbo].[Experience_Require]  WITH CHECK ADD  CONSTRAINT [FK_Experience_Require_Skill] FOREIGN KEY([Skill_ID])
REFERENCES [dbo].[Skill] ([Skill_ID])
GO
ALTER TABLE [dbo].[Experience_Require] CHECK CONSTRAINT [FK_Experience_Require_Skill]
GO
ALTER TABLE [dbo].[Frequently_Interview_Question]  WITH CHECK ADD  CONSTRAINT [FK_Frequently Interview Question_Admin] FOREIGN KEY([Admin_ID])
REFERENCES [dbo].[Admin] ([Admin_ID])
GO
ALTER TABLE [dbo].[Frequently_Interview_Question] CHECK CONSTRAINT [FK_Frequently Interview Question_Admin]
GO
ALTER TABLE [dbo].[Interview_Ques_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Interview Ques Detail_Frequently Interview Question] FOREIGN KEY([Ques_ID])
REFERENCES [dbo].[Frequently_Interview_Question] ([Ques_ID])
GO
ALTER TABLE [dbo].[Interview_Ques_Detail] CHECK CONSTRAINT [FK_Interview Ques Detail_Frequently Interview Question]
GO
ALTER TABLE [dbo].[Job_Type]  WITH CHECK ADD  CONSTRAINT [FK_Job_Type_Job] FOREIGN KEY([Job_ID])
REFERENCES [dbo].[Job] ([Job_ID])
GO
ALTER TABLE [dbo].[Job_Type] CHECK CONSTRAINT [FK_Job_Type_Job]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_Account]
GO
ALTER TABLE [dbo].[Recruiter_Job]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Job_Job_Type] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[Job_Type] ([Type_ID])
GO
ALTER TABLE [dbo].[Recruiter_Job] CHECK CONSTRAINT [FK_Recruiter_Job_Job_Type]
GO
ALTER TABLE [dbo].[Recruiter_Job]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Job_Recruiter] FOREIGN KEY([Recruiter_ID])
REFERENCES [dbo].[Recruiter] ([Recruiter_ID])
GO
ALTER TABLE [dbo].[Recruiter_Job] CHECK CONSTRAINT [FK_Recruiter Job_Recruiter]
GO
USE [master]
GO
ALTER DATABASE [NMCNPM_Database] SET  READ_WRITE 
GO
