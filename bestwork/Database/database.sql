USE [master]
GO
/****** Object:  Database [NMCNPM_Database]    Script Date: 12/9/2021 4:07:11 PM ******/
CREATE DATABASE [NMCNPM_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NMCNPM_Database', FILENAME = N'D:\Introdution to SE\Database\NMCNPM_Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NMCNPM_Database_log', FILENAME = N'D:\Introdution to SE\Database\NMCNPM_Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NMCNPM_Database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NMCNPM_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
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
/****** Object:  Table [dbo].[Account]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[User_ID] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [char](50) NULL,
	[User_Type] [nchar](20) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] IDENTITY(3000,1) NOT NULL,
	[Admin_Name] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [bit] NULL,
	[Phone_Number] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Recruiter_Job_ID] [int] NOT NULL,
	[Candidate_ID] [int] NOT NULL,
	[Apply_Time] [time](7) NULL,
	[Apply_Date] [date] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC,
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[Candidate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Candidate_Name] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [bit] NULL,
	[Phone_Number] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[About] [nvarchar](200) NULL,
	[Apply_Position] [nvarchar](50) NULL,
	[Working_Form] [nvarchar](50) NULL,
	[Created_Date] [datetime] NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate_Interest]    Script Date: 12/9/2021 4:07:11 PM ******/
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
/****** Object:  Table [dbo].[Candidate_Skill]    Script Date: 12/9/2021 4:07:11 PM ******/
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
/****** Object:  Table [dbo].[Description]    Script Date: 12/9/2021 4:07:11 PM ******/
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
/****** Object:  Table [dbo].[Experience_Require]    Script Date: 12/9/2021 4:07:11 PM ******/
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
/****** Object:  Table [dbo].[Frequently Interview Question]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frequently Interview Question](
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
/****** Object:  Table [dbo].[Interest]    Script Date: 12/9/2021 4:07:11 PM ******/
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
/****** Object:  Table [dbo].[Interview Ques Detail]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview Ques Detail](
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
/****** Object:  Table [dbo].[Job]    Script Date: 12/9/2021 4:07:11 PM ******/
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
/****** Object:  Table [dbo].[Job Type]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job Type](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NULL,
	[Salary] [int] NULL,
	[Job_ID] [int] NULL,
 CONSTRAINT [PK_Job Type] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[Recruiter_ID] [int] IDENTITY(2000,1) NOT NULL,
	[Recruiter_Name] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Tax] [char](10) NULL,
	[Email] [nchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Recruiter] PRIMARY KEY CLUSTERED 
(
	[Recruiter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter Job]    Script Date: 12/9/2021 4:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter Job](
	[Recruiter_Job_ID] [int] IDENTITY(1,1) NOT NULL,
	[Job_Name] [nvarchar](50) NULL,
	[Salary] [int] NULL,
	[Start_Date] [date] NULL,
	[End_Date] [date] NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Working_Form] [nvarchar](50) NULL,
	[Recruiment_Quantity] [smallint] NULL,
	[Status] [nvarchar](50) NULL,
	[Remote] [bit] NULL,
	[Years_Of_Experient] [smallint] NULL,
	[Type_ID] [int] NULL,
	[Recruiter_ID] [int] NULL,
 CONSTRAINT [PK_Recruiter Job] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 12/9/2021 4:07:11 PM ******/
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
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Admin] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Admin] ([Admin_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Admin]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Candidate] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Candidate] ([Candidate_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Candidate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Recruiter] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Recruiter] ([Recruiter_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Recruiter]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Candidate] FOREIGN KEY([Candidate_ID])
REFERENCES [dbo].[Candidate] ([Candidate_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Candidate]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Recruiter Job] FOREIGN KEY([Recruiter_Job_ID])
REFERENCES [dbo].[Recruiter Job] ([Recruiter_Job_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Recruiter Job]
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
ALTER TABLE [dbo].[Frequently Interview Question]  WITH CHECK ADD  CONSTRAINT [FK_Frequently Interview Question_Admin] FOREIGN KEY([Admin_ID])
REFERENCES [dbo].[Admin] ([Admin_ID])
GO
ALTER TABLE [dbo].[Frequently Interview Question] CHECK CONSTRAINT [FK_Frequently Interview Question_Admin]
GO
ALTER TABLE [dbo].[Interview Ques Detail]  WITH CHECK ADD  CONSTRAINT [FK_Interview Ques Detail_Frequently Interview Question] FOREIGN KEY([Ques_ID])
REFERENCES [dbo].[Frequently Interview Question] ([Ques_ID])
GO
ALTER TABLE [dbo].[Interview Ques Detail] CHECK CONSTRAINT [FK_Interview Ques Detail_Frequently Interview Question]
GO
ALTER TABLE [dbo].[Job Type]  WITH CHECK ADD  CONSTRAINT [FK_Job Type_Job] FOREIGN KEY([Job_ID])
REFERENCES [dbo].[Job] ([Job_ID])
GO
ALTER TABLE [dbo].[Job Type] CHECK CONSTRAINT [FK_Job Type_Job]
GO
ALTER TABLE [dbo].[Recruiter Job]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter Job_Job Type] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[Job Type] ([Type_ID])
GO
ALTER TABLE [dbo].[Recruiter Job] CHECK CONSTRAINT [FK_Recruiter Job_Job Type]
GO
ALTER TABLE [dbo].[Recruiter Job]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter Job_Recruiter] FOREIGN KEY([Recruiter_ID])
REFERENCES [dbo].[Recruiter] ([Recruiter_ID])
GO
ALTER TABLE [dbo].[Recruiter Job] CHECK CONSTRAINT [FK_Recruiter Job_Recruiter]
GO
USE [master]
GO
ALTER DATABASE [NMCNPM_Database] SET  READ_WRITE 
GO
