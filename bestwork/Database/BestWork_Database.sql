﻿USE [master]
GO
/****** Object:  Database [NMCNPM_Database]    Script Date: 1/6/2022 3:18:49 PM ******/
CREATE DATABASE [NMCNPM_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NMCNPM_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NMCNPM_Database.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NMCNPM_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NMCNPM_Database_log.ldf' , SIZE = 2112KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NMCNPM_Database] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [NMCNPM_Database] SET AUTO_CREATE_STATISTICS ON 
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
USE [NMCNPM_Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/6/2022 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [char](100) NULL,
	[User_Type] [nchar](20) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/6/2022 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Name] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [bit] NULL,
	[Phone_Number] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Account_ID] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Application]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 1/6/2022 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Candidate](
	[Candidate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Candidate_Name] [nvarchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [bit] NULL,
	[Phone_Number] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[About] [nvarchar](200) NULL,
	[Apply_Position] [int] NULL,
	[Public_CV] [bit] NULL,
	[Working_Form] [nvarchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Account_ID] [int] NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[Candidate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Candidate_Interest]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidate_Skill]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Description]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Experience_Require]    Script Date: 1/6/2022 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience_Require](
	[Recruiter_Job_ID] [int] NOT NULL,
	[Skill_ID] [int] NOT NULL,
 CONSTRAINT [PK_Experience_Require] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC,
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Frequently_Interview_Question]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Interest]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Interview_Ques_Detail]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Type]    Script Date: 1/6/2022 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Type](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NULL,
	[Job_ID] [int] NULL,
 CONSTRAINT [PK_Job Type] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 1/6/2022 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recruiter_Job]    Script Date: 1/6/2022 3:18:49 PM ******/
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
 CONSTRAINT [PK_Recruiter Job] PRIMARY KEY CLUSTERED 
(
	[Recruiter_Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 1/6/2022 3:18:49 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (1, N'cmurljy0@zrrhpssy.djuduh.net', N'E5Z3BSG80R10IDAP8Q32CBQ                                                                             ', N'et travissimantor   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (2, N'ossa.wbnnh@jkrrlf.com', N'TNX3OXZ31C                                                                                          ', N'apparens plorum     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (3, N'ejrkey@bdfcio.zwuebd.com', N'OQO3199HYK0HCHN                                                                                     ', N'ut non Longam, et   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (4, N'kuyd04@jaqvwuc.wfwlhc.org', N'2WLF2F3ANVCJ3SXY6JLYJM1T2TRCS5LM1AW7FW                                                              ', N'plurissimum         ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (5, N'mjohbeg@wzizqwsyo.d--cbg.org', N'9NEF5XQE6M1BTWO2FUSC8N                                                                              ', N'quo fecit. essit.   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (6, N'ymvzdvsx27@rqgaogfqp.orhind.net', N'IHAQHSVPI9RCA57VVCELPQURP                                                                           ', N'non egreddior       ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (7, N'bjvs@gsujsu.com', N'8GCNJJLWVYV68MAWI21JDW8YW0T21RNI04JEDVP8RE980O3SAS8SP6ZB8ERJPIV4                                    ', N'vantis. et funem.   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (8, N'ikxbsywh.klnijw@rvgzijec.mvekud.org', N'C643WJNCTSZMZY7W1R8JUSU476Y36I8J5XNIYOE9KFWD0O8FJMNQMLGKCZVPKJ6AKGH1A                               ', N'transit. bono Quad  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (9, N'dhydcmnv.lyyjxbk@vjbnx.-jmqep.org', N'XCDZYFWH4JXIJJVHWJH36ZTOO09LSK6                                                                     ', N'et funem. et ut     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (10, N'ifpjepi.ryseadxea@kqbtan.org', N'4VOBDNM1OUVCS1ZNF2JYK7IYIOAY6BOKCQEOUK48WGFB3HWM0L5Q08MWCPSODOVC6AZ2NBSVXB24S6V1S                   ', N'pars travissimantor ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (11, N'bemveqpd2@bejodl.org', N'XK5YK44HC4RGV7L25SIUYPT9SO6I45UQV                                                                   ', N'Quad quo, quo in    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (12, N'pmeyuwr@mfszec.mjzomu.org', N'RA78QVY6YN3HFUIQ12JYP8QV5VXLD6                                                                      ', N'quoque brevens,     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (13, N'ilrfxbcw2@tyzmio.org', N'1K6GAUX1MWSQ66A9BZD4R7XZJKB2VXCTSC2X9D8V40W2WHKPUMMMZ2ITM6XPJU6OJYYT3DZ                             ', N'e et e funem. et    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (14, N'kgflqyph376@lqkpki.org', N'QHZRB                                                                                               ', N'egreddior pars et   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (15, N'xgdtmzc199@tgcmplr.bternw.net', N'210L88BQTPU9A2                                                                                      ', N'et quantare apparens')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (16, N'puey421@xerr.-zxdmy.net', N'ICAT7IYJQMHMNVI2RIR3VPXLYDT48ZU2XH84PX3B4I9ZQMNUBN2RIZK                                             ', N'quad dolorum        ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (17, N'pzdko.fegnfug@uwiinu.kboqnz.net', N'EOVUPTARSEP6NDDUEF                                                                                  ', N'fecundio, non Et    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (18, N'rajjic3@sxdlvt.net', N'DF                                                                                                  ', N'nomen Versus Longam,')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (19, N'jqplgvg.ydygjuve@vksf.mvavgq.net', N'UBQY                                                                                                ', N'pladior             ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (20, N'splv1@jtsfwk.com', N'LX2JYXEP019MA7I6CWH                                                                                 ', N'transit. quad       ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (21, N'ihlwazql.ktkl@ffryzt.com', N'Y97C2Z7DGTJ4Q0PUPVR98NCT4TO5XRIF8QUBPPGYP097H5V9INHG58YAWE89B1GPA4V06D50ETJ7E5B                     ', N'dolorum egreddior in')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (22, N'jtbymsq7@h-rpuj.com', N'X                                                                                                   ', N'quad Id quad        ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (23, N'susyc.qtkdoremhx@xh--rl.org', N'N9A190RKEAH7MOKKWDAV34IH2CORVR38BWE6E8UU8LZUI76VMU9YP2BIQTZ                                         ', N'manifestum Sed et   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (24, N'fobd.zooacwzs@hojqdm.com', N'B0ON79                                                                                              ', N'vobis nomen         ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (25, N'dlnhs.mupucrgogs@fuvyfi.com', N'P9E5NIFNH5OY                                                                                        ', N'quartu Sed egreddior')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (26, N'ccrts01@wu-qaj.net', N'5T41I4J8LVFL9W                                                                                      ', N'nomen nomen rarendum')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (27, N'ybzd.pdxhnhy@xkcwczigl.-scfdt.com', N'7XBM9BGL8PLF9FTD2U4SHWN52PM4DYJDLWFKT2PJO7VBWP9                                                     ', N'vobis quartu quad ut')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (28, N'mkqcyse@qntor.fzmvxp.net', N'RIDR441BA6JJPC8A67                                                                                  ', N'pars fecit. quantare')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (29, N'rxvlxs.zlxm@jrzzvm.net', N'DZ9JZ4L390B8DGTD                                                                                    ', N'vobis trepicandor   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (30, N'hele.bmpuu@uiqbte.net', N'KR9GV4ANI5TCZL                                                                                      ', N'non esset Id in quis')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (31, N'hqfhvp.yuit@r-susw.com', N'PUVTIYDMJ1RAYY53VYDPEYDIVZWHYRQAF5JIKZUW74PF3UBOC2XDMWQQHDXI2WOSBHUTFMIW3HHA9YE1N74VT               ', N'quo plurissimum     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (32, N'csge.hwchdlan@cfgq.-luoer.com', N'NJES161CTBGX4MZI9QJ1A5EGHJYWUURSYYTBENLBURN6TBTS15YEBR2I4YAH85HYJ                                   ', N'gravis e funem. in  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (33, N'zmvbknn0@bsbpgp.uvrmpv.org', N'Z5SO4M487IH7M5P6UPVDG6WB6GC33OAON                                                                   ', N'ut quad plorum      ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (34, N'glpjrrnc.jqzswlft@ikehpo.ngzeed.com', N'CNZD1C93KK0WB4S1AS267S9HHO914I7SKHT27HNJ3CMBAA47B2EILGYJEHWD28Z1C8BUBQUT4J2V6X76J2Q2                ', N'estum. e gravis quo,')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (35, N'obqvxnp89@zfiwtptvg.ucuzvv.org', N'P63J9NPKAGVDKZ2YAVL8LE2E2DGAPUZIXXM18B2248T27IMY48874TIB4PGW7EUGGDFMD1QZTJ3CKZ6KQI6HLSD3E           ', N'non quo rarendum    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (36, N'lolhjoxf1@pjuoaq.org', N'WIU6UQDDMU2ZL3I8DLQ5R5IV5P8DUNZC71574NODZ6DCIRW2ZDFRC9JQ0Z04H0IYUQSJY                               ', N'si manifestum si    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (37, N'orlhuv.oulfsnpqrv@onarjw.org', N'3QXD6KS6DES5EH88ZYIE75MJVZNFHSYD4N9PUZ2ZYTMMCCL1PMQT0K3Y3DH7WCOLFE1Q8                               ', N'eudis et habitatio  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (38, N'zkteu.wzap@bnyrrr.org', N'D0WJFDJZ7JDMPV15CKKBLHHV2M407XBVT68QXH5QE35YTA                                                      ', N'manifestum          ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (39, N'exfx@tyyrac.-gk-qs.com', N'TJ92G6WXWI0HT9ISA8ISJMB7VFTWHBI1RYA                                                                 ', N'Quad quad plorum    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (40, N'gbtla@axvmng.com', N'XVUOW8C7W0CHVBVQAH478171CZGK0ZPUY1UEDUWA93BU3C15GSQ9                                                ', N'Tam quad gravis et  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (41, N'vgfb.fajylgrmcn@wqlb.tftpbf.com', N'38VOTCWSS7XBHJUH                                                                                    ', N'fecundio, et parte  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (42, N'aafvml.aolqeo@puigoku.urlvwk.org', N'CGLTX5QCXZYA378F0USYQKIZIHVEJLT7O0GAO0535BVCYHO0OVHO1JP                                             ', N'plorum et apparens  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (43, N'slkfm.crjwbz@fuhaiyl.ogw-uz.net', N'YLBG9CTC6RM3QXRZPPTFP51                                                                             ', N'parte Sed Versus    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (44, N'pmsxs091@fosjji.aojtug.com', N'TVPO4555AOB2PPTSIJ56VK9R3HZBPA2SKBMEN571LGS2LPAZV0W60U48MYKM6UFZMJHE2F5CB4LFR75E7ZFPDVSQ6EROKLUR1SF2', N'manifestum regit, et')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (45, N'ypqv@ogmrbo.org', N'WWFUKVV9PGET6F6EPMRRR7NNGSQ9TDZR26A2ZVT0WHHYCVD5ODC6OBGO9SDR4MFCHNQ044ETSQVAQPA                     ', N'linguens Sed Longam,')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (46, N'dswsaomq6@sxqehgkh.cpohcb.net', N'EKLG1S3RQMT7I2V915HP5D1KYIEXG5YJHSCK1YAOJ                                                           ', N'estis volcans funem.')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (47, N'dmhhq88@zjjgnawkw.tgxuvo.org', N'AIA                                                                                                 ', N'rarendum volcans    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (48, N'skkuvpew.ufimwgiztj@grzdjfjm.ndsczs.org', N'BQUL8L8LF1I0HIE5BKNAQQPB83US663J9S6N3UXDBWCB10HSAENPU0FL0JC5QFE8YZRPBQ2GMAYUDE98L2                  ', N'non apparens Id     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (49, N'tbqcup.hlqmwvxbk@vsfzn.gfapjw.com', N'SJDO9CLMKISMVH3C19SGKB62K1L7M93JOYMOKBHCQ3HYUN3D918                                                 ', N'quad trepicandor Et ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (50, N'lzhlelci.tsaysgqsvz@occr.ippxob.com', N'T                                                                                                   ', N'homo, quad          ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (51, N'vqqgtq.dgvli@yraoso.com', N'XGDA37RE0BE9YXUFSQRFQGU88XY7XL04P216B97                                                             ', N'parte quo, quantare ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (52, N'inytsiee.nxpamb@ckwh.duuqfm.com', N'KC36JLP6JU9I8DVGL5269KGFAAJVWO3IIHVEDNOM8SO3BIVB6KK56100VNW91T9URQZQIH3Y                            ', N'estis rarendum      ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (53, N'vjlhs.ukyb@vqgxf.fwm-h-.org', N'FYGVC3RE8OB3XBGGVIPRFLEITCLJ4TPHMOQ3K4JK4US5YRTEJAMZD                                               ', N'plorum et           ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (54, N'yxryr651@glbqlu.org', N'2UJY20I89FZUH8KCWRZ5MKS9K2I6ZU6P4FMWJL1I2WLD549KT6EV08JH1AEZHB8F99Q1LOSAPG2PZF3FSY                  ', N'Longam, et homo,    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (55, N'ieotbn@dglbzxt.jbtdcb.org', N'TGBPVV5V9710QO64VE7Y5D35J5UIM7Y7JZFYXKU6GTJ2NGC1SA81KZ6FC55P1M819                                   ', N'esset bono cognitio,')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (56, N'suuvon.ltjy@vfid-l.org', N'GR976AJ1HCT0H2T                                                                                     ', N'parte plurissimum   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (57, N'meyllzr455@zmupho.com', N'PCZWMJSZMSE44UKHTTZKS                                                                               ', N'nomen novum in eudis')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (58, N'oudfhnvz1@pxcbze.org', N'3XIJHULBO2W9WW2D8WZ9LEWFXNRB7O38Z481E32X                                                            ', N'esset eggredior.    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (59, N'xkhii@dtphqdh.rdiaju.com', N'A4B8VXOFGL2LJ0P13LU2A40ZN9SO0Y4U1VBAK61Q3WR20NG3I0BH7V354CKL4Z                                      ', N'et linguens parte   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (60, N'ekornij63@yfypqp.com', N'HG8JNPFGWJ4ZDCXZ0SP5ZNNN6S568MGL3IAMS3TE3KEX3VPT6DKTFUETSLDV                                        ', N'Quad cognitio, Tam  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (61, N'aytv.axrmpvbew@xukfv.tkhtxj.com', NULL, N'pladior ut et esset ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (62, N'fcjdl.qbimt@avtjr.suzrez.org', N'98A3IVV2B6WZA2F8QJA2CZV1N693GT7QXUUB4TK0TQV6                                                        ', N'manifestum gravis   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (63, N'oncngt6@mxhtbtb.zjlzos.com', N'T4RYK212S79D8GCMSMIZ51G844WZA8L3O                                                                   ', N'plorum fecundio,    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (64, N'kdry@ofynkjhet.e-kaxy.org', N'T1H4VQ6O5MKXVC7E13D7HROJUG51SJL5OVMA4NQRTHWTN69JRV6IQHV2DXAFK4V                                     ', N'funem. Tam transit. ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (65, N'azcnoust9@rmge.unkpbh.org', N'0E90PX9ECLD0VUVO7MAWC3F7ZKX6CB7OLAT9X8TU                                                            ', N'et Multum rarendum  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (66, N'nnoig.itlya@vpiseq.net', NULL, N'parte eggredior. e  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (67, N'ofxbdp.xuhxhefs@hryaheer.vgjbps.net', N'S553V6I1M7YUZ8WZ105Z211EPEK1MRYSFAKYA34                                                             ', N'vobis quoque Et     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (68, N'jlep3@ttwrjq.com', N'E5Q39UM1WAV8OUJQ3QEHMHFV96EPOXOXVRLXBX5URI5BVP3LRUUJPNRXPVU3GX                                      ', N'venit. glavans      ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (69, N'jgpn.wmxxd@qehdwg.org', N'YLXCX9LE5LJP4C3ZJ2TYU25880N7F32EU46QXD5B5FPX5XMKMWA0NZJVFP3XLD                                      ', N'non trepicandor     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (70, N'cbpmd80@aeglkm.shcgse.org', N'2J                                                                                                  ', N'vobis linguens et   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (71, N'cnomoj21@tilrxmmmo.txsjow.com', N'UZ5C16WHSED82AD3LJT1QVKBA898PRGMD03NF9U33564H7MSKIRF8IEYEU2TXNS0YRU27POCPPXKPGT3MGO60               ', N'vobis non rarendum  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (72, N'jkls@whwvag.lsjwlj.org', N'DVL48K716FD66QCJLUUFPJKT9Y0Y7GZL0XDZH3G35OIH7J93R2VTCKBUBRUAJ8UQGS59CC2IDRA102MQPW74L59FLINQ86JWU   ', N'vobis egreddior     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (73, N'oxruq.vhvkvpoba@ipfpsk.com', N'1FD0QE0DGKA9U944LN1                                                                                 ', N'non parte Pro et    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (74, N'greaam8@cptrlo.org', N'4AIPNUOB967D7707CO6S48PO5BNEL4                                                                      ', N'rarendum manifestum ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (75, N'luxrj064@ggcnmq.org', N'WV5ORWNDWPO39DW2N8XRWG8KWKUKB6AQ4LBI2I9A                                                            ', N'rarendum et Sed     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (76, N'ysyr37@taruas.com', N'B93G4GA9906ODPFMKR6131PFYYO2D0                                                                      ', N'funem. quad quad    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (77, N'urzl953@eeugeq.net', N'ZM2K654S4JA2632RVVWHR29L9KNI5R8V8W61B48GGZ2HSZJBV7S6HIDWDGAMILMCAFTAX0GQMG1R0RS90CMYZ2EP            ', N'quad apparens Tam   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (78, N'gkzy77@lejdnv.com', N'AOUTLYUDP7D69EVQ1J1HMVLO1M5ZND813RMCLX0H6DBKF3QX                                                    ', N'delerium. funem.    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (79, N'ngst.ohksytndjw@vtsztn.axqb-r.net', N'7XJD7WE26SZSVPBZC2IRJ54IJ                                                                           ', N'regit, pars quartu  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (80, N'jdldm.kzbz@-hwmaz.org', N'8K19XV88GGPOVU89F41PBOZL208672S0TWOT1XV4KM8V9O6NJAQZHU0KLG6WM21ENOUZ6                               ', N'Quad cognitio, esset')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (81, N'dnnf.cxfjbz@zxtqvvjty.tvapto.net', N'7H9W5OF4BEULNXBSJZW48LRYHHLU7LT7G428QKPB4H4R20F32U5V226MQBF                                         ', N'quartu quoque       ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (82, N'ywgqy.cxmur@bwhzuk.org', N'2KWPLM5IU32YAKZRGZVG2HSDGX5DXFIF519                                                                 ', N'sed quad non gravum ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (83, N'mjotkxom3@fwjyuwsyw.gu-sdg.net', N'LE6FVW9ZS6LH3E6QFYKKSI9NHRKEKNT8AF61TGL68SKA                                                        ', N'quo trepicandor et  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (84, N'ootj.enwnkjehpt@y-znkf.com', N'NAJ9RZ6HPR25IY3BUE5CD7N84XZDDB0YZBUH15TNMQLO4WBHHUEDFXZGMA5U0T3ER3                                  ', N'essit. quo Et e     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (85, N'gykekf@gv-ftf.org', N'73MAPLHPMLZ48LHVJXMI1CEVRZZMSM7W0Q4EVKOSX8CUM6X8JYKG5L3UPRIPMVW0E33HH30Y8TKTZJ8K2Q2U2               ', N'glavans gravis      ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (86, N'onvzfhve@cntlvf.org', N'RFN9O31Z62BCFJ2FQGXL8B09V5I                                                                         ', N'quantare funem.     ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (87, N'dfajl.czsgtng@pgtcie.net', N'MVS1X                                                                                               ', N'cognitio, gravis    ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (88, N'avrtbo1@inmnkusfq.alwvrw.com', N'BOU8EWW9MIIN4PIN0MXGHGEDEIL3CB99                                                                    ', N'novum volcans       ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (89, N'ziyiki.tbkgtpefjo@iiqzg.yiuxis.net', N'R8DLH10OZOIR71TFZV64H6VAHUVBTXB889CG41IKWRIRWL6HRNCG35XKC34N                                        ', N'quad novum in       ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (90, N'eaczcdxg7@mhrmc.ucqryb.org', N'PV2C9IYOCAYCL8QO3EVNDJ5KV43CS41XVE7VGEM38TFCE3IW6W9P8ZS5QHH4FLW890H71U7PRSEK4S6SM65                 ', N'eudis non non Sed et')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (91, N'gjvrsjs034@chyfw.lablfz.org', N'VBOVL15ZXHO                                                                                         ', N'nomen venit. quorum ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (92, N'nhew.rxgac@-cobqs.net', N'W63DLAVCOJYGK70XAOH8G0DYBMLZO8R94RNY                                                                ', N'dolorum pars Id et  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (93, N'jttgzyfg73@wymrgd.org', N'T6BBS6BD8AE17O90F6WT41ZPWNGSO                                                                       ', N'esset Tam Longam,   ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (94, N'xcxhlynj.cvdnlquul@piqebf.com', N'TJ28HH6WOT2K3B7XGKI9OLR5KR7ME4QIPVHUZZ7RUII2RKYNIY6WAFN7SWNQAJHJ3J                                  ', N'regit, quorum e Sed ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (95, N'ylvxi.ismgsa@f-timv.net', N'7UCYHDRF52OE                                                                                        ', N'novum e rarendum quo')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (96, N'smfitg78@vfxvru.org', N'TJ4GXU8A7922BGGA0ZZ7OQT5ZPJJZI53INXQE1L8BLZKAW5WA443O6B2QZG8BPAP4YJOJQVZDRW3R8U3JM8UD1FCCU0FKDXLB9GC', N'Versus esset quoque ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (97, N'ifzvuxlf@aydkd.wbqdnv.org', N'HCJ95PXA8AH4COOGFB2J7CPQFE0TASHSIR2APL8BH23KIB8O85VYDS55NTTQP3ZGTP                                  ', N'in non homo, vobis  ')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (98, N'pzcyqrnw5@vuwaut.pxcmsd.net', N'LMDRU2Q1585746BL5WIEPMWNVRIME2NQTON2VD0                                                             ', N'regit, et dolorum ut')
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (99, N'kerdnqi324@uqxtabiu.sbhnrv.com', N'MRZWIMOKDITJ                                                                                        ', N'essit. delerium. e  ')
GO
INSERT [dbo].[Account] ([Account_ID], [Email], [Password], [User_Type]) VALUES (100, N'mtilavk.nisq@slcnoz.org', N'AWYPPV2K4M2KEDFJ9PRWNRYMZ583Y8W94GJSOC5IXBH4XC38804S2MNIYCPKNZLWQTGYUNU                             ', N'regit, ut eggredior.')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (1, N'Lương Tài', CAST(N'1988-05-03' AS Date), 1, N'0943939511', N'taeuuyr3@ufqkzn.net', CAST(N'2009-01-19 17:37:10.590' AS DateTime), 82)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (2, N'Hương Nhi', CAST(N'1994-08-08' AS Date), 1, N'0960325093', N'hxnojq@mbuyij.com', CAST(N'1955-08-15 05:20:40.540' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (3, N'Minh Nhu', CAST(N'1997-09-20' AS Date), 1, N'0934071477', N'fmpwsl.prfymldg@nqle.xmqwsf.net', CAST(N'2002-05-06 07:33:32.550' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (4, N'Thạch Tùng', CAST(N'1979-06-27' AS Date), 0, N'0949726753', N'gtkh@boybpovp.ynymw-.org', CAST(N'1980-07-01 04:10:41.480' AS DateTime), 45)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (5, N'Diệu Diệu', CAST(N'1973-09-14' AS Date), 0, N'0993663269', N'urjboges.ebdv@rlbmcc.qavurx.com', CAST(N'1969-01-26 20:48:47.150' AS DateTime), 28)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (6, N'Quang Trung', CAST(N'1961-07-25' AS Date), 1, N'0905508079', N'thgngbc.tivpqnxd@vlyqyri.-rlmuj.com', CAST(N'1998-10-22 04:00:57.370' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (7, N'Hữu Ðạt', CAST(N'1982-06-13' AS Date), 1, N'0977156186', N'uxiamo.tuhua@qknnyv.com', CAST(N'1980-07-02 07:31:48.620' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (8, N'Mai Phương', CAST(N'1961-03-13' AS Date), 1, N'0964356240', N'vxicvxg.zfszugxh@xdjosl.net', NULL, 4)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (9, N'Sương Sương', CAST(N'1996-10-25' AS Date), 1, N'0986071236', N'cgwrp4@lcvnfwuuw.wdqgjq.net', CAST(N'1965-01-16 18:32:51.840' AS DateTime), 100)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (10, N'Nam Ninh', CAST(N'1982-06-16' AS Date), 0, N'0904165778', N'ljqrbcdh.qnkidtvl@ynuypvy.pogyll.org', CAST(N'1980-08-04 05:40:16.080' AS DateTime), 32)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (11, N'Việt Dương', CAST(N'1961-07-15' AS Date), 0, N'0944758619', N'nuatj.ldioobxl@hdyora.org', CAST(N'1958-12-10 01:16:00.620' AS DateTime), 85)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (12, N'Mỹ Nhân', CAST(N'1976-02-09' AS Date), 1, N'0975836808', N'frzcrbxh046@fivggjwsd.rdhbdv.net', CAST(N'1961-06-16 08:35:48.630' AS DateTime), 4)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (13, N'Nhật Tấn', CAST(N'1999-01-21' AS Date), 1, N'0999591997', N'pegij62@klqgct.org', CAST(N'1994-01-06 21:46:21.590' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (14, N'Ngọc Uyển', CAST(N'1965-02-04' AS Date), 0, N'0909958860', N'vaui.taxpf@hsawtwz.zpbdas.net', CAST(N'2001-02-03 06:04:48.570' AS DateTime), 69)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (15, N'Vĩnh Long', CAST(N'1960-05-17' AS Date), 0, N'0913846176', N'weixzysu.npljabmh@qljwh.vjrdxb.net', CAST(N'1975-08-10 11:02:54.860' AS DateTime), 9)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (16, N'Hữu Ðạt', CAST(N'1990-12-11' AS Date), 1, N'0937735657', N'blwh92@jjyqpbs.pbkktl.com', CAST(N'2017-10-25 00:04:47.690' AS DateTime), 46)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (17, N'Ngọc Tú', CAST(N'1960-04-02' AS Date), 1, N'0994275030', N'cicrkk.ioeexut@xmxoeuq.cmvopr.com', CAST(N'1972-07-05 04:54:14.680' AS DateTime), 99)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (18, N'Bạch Trà', CAST(N'1958-07-08' AS Date), 0, N'0951606528', N'xgrdj@hawmwv.org', CAST(N'2009-08-03 19:51:09.350' AS DateTime), 77)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (19, N'Tuấn Minh', CAST(N'1974-09-18' AS Date), 1, N'0944341586', N'awztxyol98@wunznb.org', CAST(N'1993-06-08 19:48:37.150' AS DateTime), 39)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (20, N'Kiến Ðức', CAST(N'1981-03-24' AS Date), 0, N'0956320096', N'wnfcwtuz5@vkxzhb.net', CAST(N'1991-01-22 04:33:20.230' AS DateTime), 96)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (21, N'Anh Tùng', CAST(N'1959-11-02' AS Date), 1, N'0933770511', N'uavoqebz.fuyamouc@f-gijb.org', CAST(N'1962-03-23 06:35:53.530' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (22, N'Quốc Toản', CAST(N'1980-02-09' AS Date), 0, N'0942021700', N'qzfapxb52@-iigsq.net', CAST(N'1998-10-20 14:13:31.190' AS DateTime), 28)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (23, N'Minh Giang', CAST(N'1971-10-24' AS Date), 1, N'0965379998', N'jfgh@ldnbsh.net', CAST(N'1990-01-18 21:37:32.940' AS DateTime), 80)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (24, N'Gia Hòa', CAST(N'1975-03-15' AS Date), 0, N'0953061008', N'ffbyzegw@xcqlg.guzsoz.org', CAST(N'1957-07-24 13:44:44.550' AS DateTime), 46)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (25, N'Hùng Anh', CAST(N'1965-03-18' AS Date), 1, N'0976472904', N'xkrma.gbnoxze@-asbwj.com', CAST(N'2011-05-28 03:59:14.720' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (26, N'Thanh Hiếu', CAST(N'1973-10-13' AS Date), 1, N'0902561072', N'whaddmqc.hvetyogqa@jldv.rnfevm.net', CAST(N'1996-11-30 18:08:35.680' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (27, N'Khánh Hoàn', CAST(N'1955-07-18' AS Date), 0, N'0926488216', N'qsrhdp.gsxdfgd@fjkf.wxhnub.net', CAST(N'1953-04-29 20:07:08.340' AS DateTime), 49)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (28, N'Sông Hà', CAST(N'1972-07-02' AS Date), 1, N'0948102223', N'ltypdf.nlfk@fsklk.ipcljc.net', CAST(N'1986-06-14 14:34:29.950' AS DateTime), 88)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (29, N'Mai Hạ', CAST(N'1998-04-13' AS Date), 1, N'0988336569', N'zpuuq.depdxhxsy@kdrpe.rtbvql.org', CAST(N'2013-02-05 12:33:05.270' AS DateTime), 74)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (30, N'Hướng Dương', CAST(N'1971-04-14' AS Date), 1, N'0988108897', N'jdzyqkug573@kxehp.sbjklb.net', CAST(N'1956-02-22 10:56:25.810' AS DateTime), 68)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (31, N'Hồng Hà', CAST(N'1999-05-07' AS Date), 1, N'0909816605', N'mnskc.yuiuaespb@fyrymfpir.ondgxm.net', CAST(N'1993-11-25 13:34:09.140' AS DateTime), 22)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (32, N'Việt Ngọc', CAST(N'1987-02-03' AS Date), 0, N'0910034858', N'wjgyqm@namial.yanamv.net', CAST(N'1982-12-07 18:27:16.220' AS DateTime), 90)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (33, N'Anh Thi', CAST(N'1995-02-26' AS Date), 1, N'0978991862', N'djge.rszfaughfv@zvqnfm.net', CAST(N'2004-11-02 19:45:10.600' AS DateTime), 84)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (34, N'Mậu Xuân', CAST(N'1987-03-15' AS Date), 0, N'0974930491', N'zllojo508@mvgmc-.net', CAST(N'1985-12-20 21:58:55.120' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (35, N'Hoàn Vi', CAST(N'1996-04-16' AS Date), 1, N'0967262095', N'qwskt.godu@cghlwlhft.yytmzi.org', CAST(N'2008-03-02 02:22:21.870' AS DateTime), 22)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (36, N'Khắc Duy', CAST(N'1963-12-16' AS Date), 1, N'0945424941', N'lbujosdp.vyzcfw@abgokl.ttlziy.net', CAST(N'1973-03-05 08:07:08.090' AS DateTime), 49)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (37, N'Ðức Phong', CAST(N'1997-02-05' AS Date), 0, N'0930795383', N'zikitr.htsjvdwt@iizwwq.com', CAST(N'1980-04-11 05:37:02.380' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (38, N'Vi Quyên', CAST(N'1981-10-21' AS Date), 1, N'0968963249', N'vyrpjq.ztunqylt@raapwr.org', CAST(N'1968-08-26 17:48:02.190' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (39, N'Trà My', CAST(N'1955-04-17' AS Date), 1, N'0920580691', N'poocltz@ribkjd.org', NULL, 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (40, N'Ánh Lệ', CAST(N'1978-03-06' AS Date), 1, N'0934998946', N'kllw@hlfb.ncajwx.org', CAST(N'1975-02-01 09:50:10.870' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (41, N'Tiến Hoạt', CAST(N'1960-10-02' AS Date), 0, N'0957297993', N'ojbvdimp.ltsrud@ejurvq.com', CAST(N'2002-10-26 01:17:45.910' AS DateTime), 48)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (42, N'Bích Ngọc', CAST(N'1989-09-18' AS Date), 1, N'0997117582', N'dgbbn@bjabpo.com', CAST(N'2007-01-13 08:01:22.760' AS DateTime), 33)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (43, N'Hương Giang', CAST(N'1959-10-22' AS Date), 0, N'0934010355', N'uthgv@syfvnj.org', CAST(N'1968-10-09 18:55:41.130' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (44, N'Nhật Hồng', CAST(N'1971-04-08' AS Date), 1, N'0926901718', N'egoodf.vttqf@k--xfi.org', CAST(N'2012-06-19 17:00:53.770' AS DateTime), 81)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (45, N'Sơn Hà', CAST(N'1993-12-11' AS Date), 1, N'0993369609', N'djzn.znztpl@dqnim.ocbicc.net', CAST(N'1982-03-30 21:41:14.020' AS DateTime), 77)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (46, N'Việt Thương', CAST(N'1968-12-09' AS Date), 1, N'0962731681', N'nmbd.kferdcvf@pdloxj.com', CAST(N'2009-08-07 19:07:30.100' AS DateTime), 30)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (47, N'Danh Thành', CAST(N'1972-06-12' AS Date), 0, N'0904693206', N'whjz4@dzmslo.org', CAST(N'2018-04-16 09:45:19.840' AS DateTime), 67)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (48, N'Diễm Hạnh', CAST(N'1978-07-07' AS Date), 1, N'0979649939', N'xmwfje27@fycbcg.com', CAST(N'2011-01-24 11:00:39.500' AS DateTime), 29)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (49, N'Phúc Sinh', CAST(N'1971-04-23' AS Date), 1, N'0977431099', N'kyoh622@plezxnsm.zp-xl-.com', CAST(N'2005-01-10 21:17:48.230' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (50, N'Mỹ Huyền', CAST(N'1992-10-14' AS Date), 0, N'0918521051', NULL, CAST(N'1993-04-30 17:55:24.480' AS DateTime), 7)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (51, N'Bạch Mai', CAST(N'1982-05-07' AS Date), 0, N'0950905203', N'wkpeacz.pudn@cojgcyfpl.kyuxqv.com', CAST(N'2005-06-14 03:18:58.280' AS DateTime), 70)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (52, N'Mộng Hoa', CAST(N'1959-08-11' AS Date), 1, N'0972280170', N'ljwoz.eazyxjpv@jbun.qvdkpc.org', CAST(N'1977-03-11 19:51:51.380' AS DateTime), 93)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (53, N'Hoa Lý', CAST(N'1966-02-19' AS Date), 0, N'0966369389', N'htkncugo.xxxgq@vchzgt.com', CAST(N'1958-02-02 06:03:44.520' AS DateTime), 93)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (54, N'Quốc Ðiền', CAST(N'1977-08-14' AS Date), 0, N'0914758748', N'dsajpyfz.fmwna@ufwqjkf.zt-waz.net', CAST(N'2016-12-06 16:09:48.080' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (55, N'Tường Lâm', CAST(N'1983-05-02' AS Date), 0, N'0996213801', N'kycf@xymkao.org', CAST(N'1965-03-31 14:01:50.440' AS DateTime), 10)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (56, N'Tuệ Nhi', CAST(N'1961-03-26' AS Date), 1, N'0903834078', N'bqmntmti.pefdy@rloy-e.net', CAST(N'1975-03-20 14:36:47.990' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (57, N'Thành Khiêm', CAST(N'1975-10-16' AS Date), 1, N'0908052548', N'eslwtpl@mlaxet.com', CAST(N'1982-05-04 21:33:45.540' AS DateTime), 96)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (58, N'Gia Thịnh', CAST(N'1975-07-10' AS Date), 0, N'0922353138', N'jsnuau17@lrfpthlbd.sghmft.com', CAST(N'1972-01-02 19:59:37.640' AS DateTime), 15)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (59, N'Huy Trân', CAST(N'1967-04-12' AS Date), 1, N'0914255867', N'ieqtlq.lcog@utzvg.cxihhe.net', CAST(N'2019-01-21 15:35:55.990' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (60, N'Khang Kiện', CAST(N'2001-01-08' AS Date), 0, N'0907968924', N'mmoltok.sfoyvwin@-monjm.org', CAST(N'2011-12-10 03:34:17.830' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (61, N'Gia Ðạo', CAST(N'1959-01-08' AS Date), 1, N'0983467498', N'lvilfr95@thvihps.ha-tki.net', CAST(N'2004-07-31 10:02:05.810' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (62, N'Thiện Tâm', CAST(N'1962-12-13' AS Date), 1, N'0935060565', N'xzdyp@gzxnjxulk.rrgfuu.com', CAST(N'1968-09-30 00:41:38.810' AS DateTime), 86)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (63, N'Anh Ðức', CAST(N'1964-01-07' AS Date), 1, N'0925219594', N'kvoawrsp.dxqisfaq@ycfi-g.org', CAST(N'1965-05-10 13:26:27.410' AS DateTime), 29)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (64, N'Lương Thiện', CAST(N'1978-07-15' AS Date), 0, N'0985432914', N'qtjdaaph.dfuuyjhnl@bfea.dfpezo.com', CAST(N'1988-05-26 18:58:43.350' AS DateTime), 96)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (65, N'Linh Phương', CAST(N'1984-03-18' AS Date), 1, N'0904785792', N'ygbaw.lrump@fwbnvxbo.ecmwiq.org', CAST(N'1961-11-26 07:36:26.020' AS DateTime), 39)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (66, N'Phương Diệu', CAST(N'1975-07-19' AS Date), 0, N'0963730260', N'oubvrig.pnjkr@zbtemsnr.rwxisk.net', CAST(N'2007-09-09 16:06:06.940' AS DateTime), 29)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (67, N'Minh Hưng', CAST(N'1982-01-20' AS Date), 0, N'0966497330', N'nxufjnn.ahne@rfxhxd.vhjkzl.com', CAST(N'1997-01-02 06:48:44.410' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (68, N'Hải Mỹ', CAST(N'1964-11-08' AS Date), 0, N'0949315506', N'dftawtr5@qsfdfoj.cvcwet.org', CAST(N'1977-08-13 12:50:38.030' AS DateTime), 29)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (69, N'Huy Quang', CAST(N'1969-11-27' AS Date), 1, N'0964052633', N'vynblp.uegtaehtru@cgfldddhc.ubrdfr.org', CAST(N'1961-01-17 23:47:26.470' AS DateTime), 85)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (70, N'Nhật Quân', CAST(N'1997-07-09' AS Date), 1, N'0934517204', N'ybvciahp@fkpyjn.net', CAST(N'2013-12-04 03:42:26.700' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (71, N'Ðình Tuấn', CAST(N'1994-12-12' AS Date), 1, N'0911734445', N'yhlpayjd@tlvbhz.net', CAST(N'1955-06-08 02:55:46.770' AS DateTime), 41)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (72, N'Thiên Thêu', CAST(N'1979-07-21' AS Date), 1, N'0985813319', N'dnxetsqj7@xgqpfb.com', CAST(N'1990-07-16 18:27:45.300' AS DateTime), 14)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (73, N'Kim Chi', CAST(N'1956-03-24' AS Date), 1, N'0971475429', N'enjby.pnqlp@jjgvgh.net', CAST(N'1956-11-09 11:06:12.490' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (74, N'Yên Bình', CAST(N'1997-08-21' AS Date), 1, N'0973210079', N'ibgqw508@zzncuc.net', CAST(N'1987-07-04 10:00:58.470' AS DateTime), 69)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (75, N'Thi Ngôn', CAST(N'1973-06-22' AS Date), 1, N'0922960735', N'zcjcl.gijv@meiui.ok-ona.org', CAST(N'2011-08-14 18:30:51.240' AS DateTime), 18)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (76, N'Diệu Huyền', CAST(N'1971-03-24' AS Date), 1, N'0922119753', N'kwebdmfr1@iyer.mulveh.com', CAST(N'2005-01-08 20:31:57.480' AS DateTime), 61)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (77, N'Nhật Phương', CAST(N'1973-04-20' AS Date), 1, N'0933531587', N'hiznva@dirpmux.qdvgmu.net', CAST(N'2014-06-13 11:40:12.410' AS DateTime), 100)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (78, N'Ánh Linh', CAST(N'1953-07-18' AS Date), 1, N'0906483389', N'ngnprw.ewstx@zwobj.yhqxoq.org', CAST(N'2007-05-02 21:12:37.420' AS DateTime), 7)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (79, N'Thanh Giang', CAST(N'1982-05-11' AS Date), 1, N'0971074060', N'aveqin86@ykqce.mjvkyt.com', CAST(N'1960-10-21 23:56:18.910' AS DateTime), 85)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (80, N'Nghi Dung', CAST(N'1997-05-16' AS Date), 1, N'0945345774', N'pywrdfhd515@ozwtpl.com', CAST(N'1968-12-16 18:37:14.460' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (81, N'Ngọc Nữ', CAST(N'1954-05-04' AS Date), 1, N'0999138252', N'otvdy.xkbfxf@obluep.com', CAST(N'2014-02-10 18:13:54.890' AS DateTime), 98)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (82, N'Minh Ngọc', CAST(N'1978-02-18' AS Date), 1, N'0934872008', N'extglbay.ghyhbjkpdd@sjbuird.ia-sqf.org', CAST(N'2006-11-07 07:07:56.190' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (83, N'Bảo Trúc', CAST(N'1954-03-12' AS Date), 1, N'0926857073', N'ewkdow.ggacjqmky@jdqshu.net', CAST(N'1969-04-18 22:49:20.120' AS DateTime), 82)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (84, N'Đông Vy', CAST(N'1958-07-01' AS Date), 1, N'0985170978', N'fhfru@tyvvkvnb.-gsopt.net', CAST(N'2014-02-13 20:39:05.480' AS DateTime), 58)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (85, N'Ðức Bằng', CAST(N'1990-01-14' AS Date), 1, N'0963371112', N'uindbioe.bpfx@gqazjzic.rurzqr.com', CAST(N'1960-08-25 09:14:06.990' AS DateTime), 68)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (86, N'Tịnh Như', CAST(N'1992-09-26' AS Date), 0, N'0997234654', N'tkpx5@rxmmlc.mhysvs.net', CAST(N'1999-12-13 15:04:34.440' AS DateTime), 31)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (87, N'Tâm Đan', CAST(N'1973-12-16' AS Date), 0, N'0974106407', N'kmko.dgpumnxid@trhkpe.org', CAST(N'1988-10-24 07:30:24.620' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (88, N'Hữu Hùng', CAST(N'1970-07-16' AS Date), 1, N'0975380304', N'wmhss.ppmqhbjmnq@zoxdez.org', CAST(N'1987-01-01 02:17:28.150' AS DateTime), 22)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (89, N'Ngọc Thọ', CAST(N'1956-11-14' AS Date), 0, N'0984473448', N'annuhewz.nxulx@mrjk.uusmfb.net', CAST(N'1992-08-05 05:43:20.150' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (90, N'Lệ Băng', CAST(N'1988-01-23' AS Date), 0, N'0995142619', N'ctkxabb.dfjurdax@pishxr.net', CAST(N'1963-10-04 07:22:07.120' AS DateTime), 45)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (91, N'Thùy Anh', CAST(N'1989-04-08' AS Date), 1, N'0986687443', N'tbuyt77@kwfd.ndakbr.net', CAST(N'1978-10-30 04:48:36.330' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (92, N'Đông Tuyền', CAST(N'1974-07-31' AS Date), 0, N'0920782917', N'sljzk22@qoelily.n-cvje.com', CAST(N'1954-03-04 12:07:30.450' AS DateTime), 82)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (93, N'Nhã Khanh', CAST(N'1967-07-12' AS Date), 0, N'0930065881', N'tqjqb236@jzqemwn.isszci.org', CAST(N'1982-03-21 14:01:06.390' AS DateTime), 92)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (94, N'Mộc Miên', CAST(N'1955-05-16' AS Date), 1, N'0943276092', N'pqzuvq.wshhkz@bpynk.hmrykz.net', CAST(N'1977-09-17 14:13:44.360' AS DateTime), 51)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (95, N'Thúy Mai', CAST(N'1972-02-27' AS Date), 0, N'0989792062', N'msdpqsr.sgaiupg@payokrf.hlcxft.net', CAST(N'1991-07-03 23:48:05.070' AS DateTime), 100)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (96, N'Bách Nhân', CAST(N'1998-11-28' AS Date), 0, N'0980223568', N'gpduil.cfhjpnx@akxly.mj-jfl.com', CAST(N'1987-01-27 00:36:07.100' AS DateTime), 66)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (97, N'Bích Hằng', CAST(N'1978-09-12' AS Date), 1, N'0941189629', N'mjwoac104@jvatorefj.zhfqjh.org', CAST(N'1994-09-05 18:34:55.340' AS DateTime), 97)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (98, N'Thanh Tịnh', CAST(N'1982-05-17' AS Date), 0, N'0955469012', N'zltva.xiiz@zled.zqrulg.org', CAST(N'2001-05-15 23:56:57.790' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (99, N'Khải Tâm', CAST(N'1988-02-27' AS Date), 0, N'0923809300', N'xgtmas40@vhuqiv.dy-vbm.net', CAST(N'2003-07-26 09:24:27.740' AS DateTime), 43)
GO
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (100, N'Tạ Hiền', CAST(N'1971-05-27' AS Date), 1, N'0992070725', N'jcezlsk.dwigb@lsosrw.org', CAST(N'1995-07-22 05:35:07.090' AS DateTime), 89)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (101, N'Minh Hưng', CAST(N'1987-12-28' AS Date), 1, N'0960917201', N'qbyrwk.ejtf@zwklbnmnz.jmjiyc.com', CAST(N'1965-08-06 12:18:45.690' AS DateTime), 26)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (102, N'Bích Hà', CAST(N'1960-08-04' AS Date), 0, N'0931120163', N'btjktt.mxdwhiel@hfvnzb.org', CAST(N'1993-09-03 20:54:41.800' AS DateTime), 90)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (103, N'Tân Thành', CAST(N'1961-08-11' AS Date), 1, N'0904287953', N'hjah.sgeoqodqms@jduaiz.fukrmt.org', CAST(N'2003-01-07 11:13:13.030' AS DateTime), 89)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (104, N'Bá Trúc', CAST(N'1974-11-21' AS Date), 0, N'0907464495', N'wmpieyc167@rtcnks.bfa-rt.org', CAST(N'2012-02-07 17:35:21.530' AS DateTime), 79)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (105, N'Kim Dung', CAST(N'1998-12-10' AS Date), 1, N'0981650867', N'orujfge.vqgytwse@drpajo.ufognd.net', CAST(N'1990-11-24 14:59:37.700' AS DateTime), 36)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (106, N'Minh Thúy', CAST(N'1955-10-19' AS Date), 1, N'0987280722', N'mnwk.mwsrulzi@vfccpzq.utlyib.org', CAST(N'1967-11-30 08:51:12.970' AS DateTime), 4)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (107, N'Ðình Hợp', CAST(N'1956-05-20' AS Date), 1, N'0988295459', N'jbhivt68@ocllve.com', CAST(N'1973-05-03 08:45:38.880' AS DateTime), 13)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (108, N'Ðồng Khánh', CAST(N'1969-08-07' AS Date), 1, N'0916772597', N'cuinwlq@piiaya.org', CAST(N'1991-08-01 20:02:46.050' AS DateTime), 50)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (109, N'Bảo Trâm', CAST(N'1957-02-22' AS Date), 1, N'0994431017', N'bttltc@-ccq-i.com', CAST(N'1958-04-25 21:38:56.830' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (110, N'Tịnh Lâm', CAST(N'1965-02-09' AS Date), 1, N'0941674231', N'tmkdh329@nktsjoiio.noywvk.com', CAST(N'1981-03-22 17:29:52.970' AS DateTime), 25)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (111, N'Hoàng Long', CAST(N'1989-01-12' AS Date), 1, N'0989519044', N'jzmf0@gjkwiq.com', CAST(N'1981-10-07 02:56:35.590' AS DateTime), 14)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (112, N'Tiểu Bảo', CAST(N'1975-03-31' AS Date), 1, N'0901479242', N'pjkhm13@ejqqyg.com', CAST(N'1996-01-03 00:21:08.120' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (113, N'Tân Ðịnh', CAST(N'1994-04-08' AS Date), 1, N'0974727871', NULL, CAST(N'1964-03-13 20:03:18.720' AS DateTime), 35)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (114, N'Anh Ðào', CAST(N'1971-01-03' AS Date), 1, N'0973244180', N'ohdeqlc@eyicgc.rwzeax.com', CAST(N'2003-02-05 20:58:41.530' AS DateTime), 10)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (115, N'Xuân Sơn', CAST(N'1999-09-08' AS Date), 1, N'0977439690', N'tbqsnpt541@jyhawt.net', CAST(N'2018-10-29 09:20:22.950' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (116, N'Tường Vinh', CAST(N'1981-12-28' AS Date), 0, N'0916143145', N'ikoy.gjgfn@blgpy.nfotxe.net', CAST(N'2018-09-24 02:54:09.630' AS DateTime), 66)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (117, N'Triệu Mẫn', CAST(N'1961-10-03' AS Date), 1, N'0996174717', N'bwzbxi.geoza@ghrkd.mblxhj.com', CAST(N'2020-06-13 01:52:18.690' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (118, N'Cao Sỹ', CAST(N'1958-07-10' AS Date), 1, N'0975628846', N'qrtuf2@bwifbb.kioimf.net', CAST(N'1972-03-26 16:47:21.940' AS DateTime), 20)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (119, N'Hiếu Học', CAST(N'1989-08-08' AS Date), 1, N'0923402726', N'eound.fzqm@uzdzca.com', CAST(N'1980-10-02 09:44:36.360' AS DateTime), 50)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (120, N'Như Loan', CAST(N'1992-07-29' AS Date), 0, N'0962000849', N'ahakyxa14@-qst-z.org', CAST(N'1982-12-14 16:31:51.590' AS DateTime), 32)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (121, N'Dương Anh', CAST(N'1954-08-04' AS Date), 0, N'0960362251', N'iophu.kjjeljeg@esycom.org', CAST(N'1971-11-17 08:35:42.320' AS DateTime), 25)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (122, N'Dân Hiệp', CAST(N'1964-07-07' AS Date), 1, N'0998829661', N'cuim026@kcdgqr.org', CAST(N'1963-01-03 04:31:16.260' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (123, N'Tạ Hiền', CAST(N'1960-12-26' AS Date), 1, N'0918344724', N'gnswj.vhdmsb@rvaxdg.org', CAST(N'2006-01-08 07:07:17.880' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (124, N'Diệu Hoa', CAST(N'1982-12-13' AS Date), 0, N'0916588847', N'slojaalh7@jxzoog.net', CAST(N'2018-04-16 16:25:19.350' AS DateTime), 97)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (125, N'Uy Vũ', CAST(N'1961-04-02' AS Date), 0, N'0916025123', N'ezrxrmlp.ldjz@oquvw.dgsdhy.org', CAST(N'1988-02-05 22:53:50.370' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (126, N'Duy Thanh', CAST(N'1973-05-15' AS Date), 0, N'0964334852', N'oaiaomw59@rhqxjm.org', CAST(N'1954-04-06 14:48:16.320' AS DateTime), 20)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (127, N'Ðông Hải', CAST(N'1965-01-10' AS Date), 1, N'0902553784', N'ymygcvjd544@vjlyych.vdjmzb.org', CAST(N'1961-04-28 04:26:38.900' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (128, N'Xuân Bảo', CAST(N'1953-11-09' AS Date), 1, N'0990098295', N'lyjq.tlqniwjm@jwvoynfx.ebbshj.org', CAST(N'2000-02-22 20:52:28.130' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (129, N'Kim Ngọc', CAST(N'1978-06-25' AS Date), 1, N'0929322105', N'gbobrxl.iltl@zcccfs.net', CAST(N'2016-12-31 10:12:53.410' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (130, N'Thanh Hường', CAST(N'1975-09-02' AS Date), 1, N'0917272573', N'tlzi7@gqckqeryk.zetdfg.net', NULL, 25)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (131, N'Chí Thành', CAST(N'1993-08-18' AS Date), 1, N'0915223062', N'pfhvnhdu.pdyhz@uvyiyle.szrzgt.org', CAST(N'1977-07-19 17:54:44.140' AS DateTime), 86)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (132, N'Tiến Dũng', CAST(N'1992-01-12' AS Date), 1, N'0967603923', N'nccvld.wnyjhasfl@luvqtb.net', CAST(N'1963-05-07 01:57:02.140' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (133, N'Thái Ðức', CAST(N'1966-06-29' AS Date), 1, N'0978945877', N'ilvjz.kexmbr@llmvo.hlnpho.net', CAST(N'1966-01-29 11:43:14.610' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (134, N'Xuân Hàm', CAST(N'1963-12-16' AS Date), 0, N'0921741478', N'litlj@zurpnizpt.bifggk.org', CAST(N'1956-10-08 11:48:09.680' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (135, N'Bích Hà', CAST(N'1962-05-21' AS Date), 0, N'0939536983', N'zhurzvts.phpwl@axcudo.neqhea.com', CAST(N'1986-04-02 18:21:11.830' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (136, N'Nam Thanh', CAST(N'1994-11-06' AS Date), 1, N'0940335920', N'hlvtjhvv.ugamu@ytgn.fvtuct.org', CAST(N'1956-05-13 06:18:28.770' AS DateTime), 61)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (137, N'Thành Ân', CAST(N'1969-07-10' AS Date), 1, N'0956045633', N'nmgoad9@bfzihzck.jggfmh.org', CAST(N'1973-06-09 21:19:13.090' AS DateTime), 63)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (138, N'Bích Trang', CAST(N'1980-05-29' AS Date), 1, N'0951613498', N'zoeb.hhallqe@oamtgnlvb.tafe-a.net', CAST(N'1956-10-31 19:54:43.150' AS DateTime), 88)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (139, N'Thành Long', CAST(N'1960-08-28' AS Date), 0, N'0974206193', N'bsjb77@nqthdgtf.nzlnsc.net', CAST(N'1978-03-12 05:13:58.600' AS DateTime), 14)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (140, N'Trọng Dũng', CAST(N'1987-03-30' AS Date), 1, N'0928682181', N'kbcz@oqmwb-.com', CAST(N'1976-03-23 05:39:27.770' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (141, N'Thùy Vân', CAST(N'1989-05-09' AS Date), 1, N'0999489283', N'eilqmx.vaeypeq@mirzhc.net', CAST(N'2013-09-26 00:22:54.020' AS DateTime), 68)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (142, N'Thu Loan', CAST(N'1957-05-11' AS Date), 1, N'0912693644', N'eopgiynl46@mbpejpt.j-ojoq.net', CAST(N'1979-08-13 06:18:55.550' AS DateTime), 87)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (143, N'Mai Hiền', CAST(N'1966-05-24' AS Date), 0, N'0935084190', N'wfophj406@uffkaw.com', CAST(N'2018-03-25 11:27:38.570' AS DateTime), 79)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (144, N'Thành Khiêm', CAST(N'1992-11-12' AS Date), 1, N'0946953120', N'dtghsep.jxoo@dmddrjsh.fxptiz.com', CAST(N'1981-09-08 04:38:31.310' AS DateTime), 83)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (145, N'Cẩm Tú', CAST(N'2000-02-17' AS Date), 1, N'0908491297', N'gdtli1@ntsy-h.org', CAST(N'1964-05-16 12:13:27.180' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (146, N'Việt Duy', CAST(N'1967-01-09' AS Date), 1, N'0913593845', N'yxtyzlmg@hzvchk.net', CAST(N'2002-12-28 04:25:31.540' AS DateTime), 64)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (147, N'Kỳ Anh', CAST(N'1981-05-31' AS Date), NULL, N'0910429873', N'ueozw.nghxhsgap@eizbhvpy.nxpqpo.org', CAST(N'2003-10-28 04:27:28.210' AS DateTime), 32)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (148, N'Nguyễn Hải An', CAST(N'1997-08-15' AS Date), 1, N'0926846374', N'ujucegy.xhcbz@aglusxtjx.qpqqgs.com', CAST(N'2010-12-21 16:04:11.730' AS DateTime), 81)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (149, N'Minh Ðức', CAST(N'1956-10-14' AS Date), 1, N'0913378608', N'fghe.bbnyiwfosn@cmpxpk.org', CAST(N'2000-02-13 17:02:24.870' AS DateTime), 93)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (150, N'Trường Chinh', CAST(N'1991-04-08' AS Date), 0, N'0905200840', N'piidq.dtzuvh@qjvbb.axc-xo.net', CAST(N'1979-11-20 04:53:21.420' AS DateTime), 20)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (151, N'Hoài Vỹ', CAST(N'1990-02-25' AS Date), 1, N'0947962867', N'hqwzimt.htfcvttu@tynuj.injfcs.net', CAST(N'1993-10-09 20:53:55.440' AS DateTime), 67)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (152, N'Việt Sơn', CAST(N'1973-03-06' AS Date), 1, N'0926611923', N'vljyv.zxzn@fgej.vufitv.com', CAST(N'1987-08-15 22:43:48.410' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (153, N'Minh Hùng', CAST(N'1993-11-16' AS Date), 1, N'0933182117', N'axin7@ijuydx.net', CAST(N'1975-06-13 01:47:33.400' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (154, N'Trung Anh', CAST(N'1996-09-06' AS Date), 1, N'0931609533', N'ohbichfv.flls@-xzqjt.net', CAST(N'1973-08-14 14:12:21.430' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (155, N'Minh Sơn', CAST(N'1969-10-24' AS Date), 0, N'0964151157', N'hzxupg.mifn@xqdris.buqwiy.org', CAST(N'1973-08-12 16:52:36.150' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (156, N'Hữu Hùng', CAST(N'1976-06-22' AS Date), 1, N'0998338661', N'cquj134@fizdma.m-imsj.org', CAST(N'1976-09-04 20:59:24.760' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (157, N'Hồng Nhật', CAST(N'2000-09-16' AS Date), 0, N'0985584592', N'fegyfiky4@ntgs.smfbrd.net', CAST(N'1955-08-05 07:47:29.420' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (158, N'Thiên Mai', CAST(N'1979-10-06' AS Date), 0, N'0941718825', N'mgppxk79@bivjqlb.zzfbuh.net', CAST(N'2008-08-26 13:47:23.930' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (159, N'Hạnh San', CAST(N'1966-08-22' AS Date), 1, N'0998202591', N'ucmcc.ejtu@nsuc.jjrwmf.org', CAST(N'2005-09-22 18:47:53.680' AS DateTime), 100)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (160, N'Diên Vỹ', CAST(N'1978-07-29' AS Date), 0, N'0940394795', N'lmzm.smsrmb@lqawqaxm.lzoyh-.net', CAST(N'1977-01-02 18:41:31.150' AS DateTime), 13)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (161, N'Hồng Thủy', CAST(N'1991-11-15' AS Date), 1, N'0918065950', N'gzcjj@hluaga.net', CAST(N'1989-08-21 00:11:21.380' AS DateTime), 64)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (162, N'Hòa Lạc', CAST(N'1955-07-12' AS Date), 1, N'0948051277', N'ybvqoccz52@luaebh.net', CAST(N'1959-08-05 04:24:34.060' AS DateTime), 26)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (163, N'Vĩnh Long', CAST(N'1992-03-21' AS Date), 0, N'0947208265', N'kexlskre@jya-rw.net', CAST(N'1994-03-11 11:53:10.760' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (164, N'Nguyệt Uyển', CAST(N'1982-07-30' AS Date), 1, N'0924791210', N'csjtoy.abzohvqrtd@ibhpn.-nsane.org', CAST(N'1995-08-01 09:49:52.640' AS DateTime), 30)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (165, N'Thụy Miên', CAST(N'1972-07-31' AS Date), 1, N'0983234295', N'zsuewt1@enoh.gnlgba.com', CAST(N'2001-10-07 03:44:12.700' AS DateTime), 83)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (166, N'Phương Anh', CAST(N'1998-02-08' AS Date), 0, N'0989902644', N'fsxlh.ugwvywo@hrwfrj.lfitzt.org', CAST(N'1970-11-17 15:32:50.830' AS DateTime), 96)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (167, N'Ðắc Lộ', CAST(N'1961-10-03' AS Date), 1, N'0941970973', N'yhaydwy519@jmrgv-.com', CAST(N'1968-09-08 15:13:20.970' AS DateTime), 95)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (168, N'Tinh Tú', CAST(N'1983-04-24' AS Date), 1, N'0985774049', N'fcvklfxf.fnxqwqduih@nlrtww.org', CAST(N'1992-03-27 12:32:58.440' AS DateTime), 90)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (169, N'Hoài Diệu', CAST(N'1961-08-16' AS Date), 1, N'0901200397', N'yaxtc.tlsmazcsdu@adarcm.com', CAST(N'1998-12-12 01:42:06.890' AS DateTime), 85)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (170, N'Minh Danh', CAST(N'1957-11-02' AS Date), 1, N'0921204746', N'jsrjad.fpdnxmjipv@ktozbf.org', CAST(N'1999-09-26 14:40:12.760' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (171, N'Ðức Phú', CAST(N'1965-06-21' AS Date), 0, N'0970226160', N'witgnj.tjlxcannqg@usbhwy.org', CAST(N'1998-05-22 12:01:09.860' AS DateTime), 42)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (172, N'Thượng Cường', CAST(N'1982-06-14' AS Date), 1, N'0950595223', N'dshud889@shofjt.com', CAST(N'2014-11-24 06:59:26.470' AS DateTime), 43)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (173, N'Minh Thủy', CAST(N'1998-12-19' AS Date), 0, N'0953068234', N'gaiwnls435@xbbqtsuqr.fdvmcv.net', CAST(N'1995-04-04 20:38:20.090' AS DateTime), 61)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (174, N'Ngọc Vy', CAST(N'1955-05-12' AS Date), 1, N'0927093707', N'kujcjkhs.qknkjpkoet@ppiopi.com', CAST(N'2017-01-03 11:07:54.170' AS DateTime), 92)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (175, N'Tú Quyên', CAST(N'1956-03-22' AS Date), 1, N'0918503934', N'bkngeku.qibbta@vugcored.dttuuy.org', CAST(N'1988-01-07 09:21:42.340' AS DateTime), 69)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (176, N'Phong Châu', CAST(N'1998-05-02' AS Date), 1, N'0913507138', N'afxgfy.wnlxuw@juoibl.net', CAST(N'1956-05-04 10:12:56.030' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (177, N'Tôn Lễ', CAST(N'1999-03-24' AS Date), 1, N'0981299203', N'dpgabww@uiypvk.com', CAST(N'1974-08-24 21:08:03.750' AS DateTime), 22)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (178, N'Thanh Diệu', CAST(N'1969-03-22' AS Date), 1, N'0996778831', N'dtfuh4@ujnmodp.vn-r-z.org', CAST(N'2002-04-26 23:52:44.950' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (179, N'Bá Phước', CAST(N'1983-12-03' AS Date), 0, N'0984902452', N'utletypu.yvyvkl@eeeguv.org', CAST(N'1994-08-25 18:53:50.690' AS DateTime), 95)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (180, N'Hoài Diệu', CAST(N'1995-05-01' AS Date), 1, N'0952985441', N'pzrmsgpe@pvut.yduuzd.com', CAST(N'1968-04-20 11:59:47.810' AS DateTime), 50)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (181, N'Xuân Thuyết', CAST(N'1993-01-22' AS Date), 0, N'0961830063', N'yuay.peri@cwretl.com', CAST(N'2005-04-10 18:26:22.160' AS DateTime), 19)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (182, N'Thu Hiền', CAST(N'1968-07-04' AS Date), 1, N'0993576655', N'zmiklk.fiqvcq@ofwykq.net', CAST(N'1964-04-15 22:44:04.590' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (183, N'Nguyệt Uyển', CAST(N'1998-03-05' AS Date), 0, N'0928884714', N'dqubmp6@mlpm.byzisv.net', CAST(N'1982-03-15 11:24:14.040' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (184, N'Lương Tài', CAST(N'1988-04-25' AS Date), 1, N'0930022616', N'cgqnon58@pueqi.dzug-z.net', CAST(N'1973-04-05 15:59:06.710' AS DateTime), 76)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (185, N'Liên Hoa', CAST(N'1986-08-15' AS Date), 1, N'0964394966', N'wmspu2@ylycbm.net', CAST(N'1976-03-24 13:18:57.970' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (186, N'Hồng Diễm', CAST(N'1973-06-15' AS Date), 0, N'0948633002', N'irnht660@equurn.com', CAST(N'2010-12-04 19:10:55.730' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (187, N'Hữu Khanh', CAST(N'1999-04-05' AS Date), 1, N'0988711692', N'aydi.rvda@hkqafo.net', CAST(N'2008-11-24 00:09:28.750' AS DateTime), 58)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (188, N'Xuân Lộc', CAST(N'1970-11-29' AS Date), 0, N'0976085958', N'perqpda1@wapjne.vrdmqc.com', CAST(N'2013-06-16 21:30:53.190' AS DateTime), 87)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (189, N'Minh Khiếu', CAST(N'1995-04-01' AS Date), 1, N'0903482786', N'uzsocv82@sxjdz.hkgvgn.org', CAST(N'2004-02-26 18:55:33.530' AS DateTime), 38)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (190, N'Quốc Mỹ', CAST(N'1987-01-06' AS Date), 1, N'0940702033', N'xqkraneq95@ostca.sxi-ma.net', CAST(N'1962-07-29 21:21:47.060' AS DateTime), 67)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (191, N'Ðức Toản', CAST(N'1995-03-30' AS Date), 1, N'0935370158', N'fyse969@zocraekg.wobdmp.com', CAST(N'1953-10-09 22:30:59.340' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (192, N'Dã Lâm', CAST(N'1990-11-12' AS Date), 1, N'0976277490', N'hjez.khquciuxt@-xqfhv.org', CAST(N'1985-10-14 07:31:49.160' AS DateTime), 16)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (193, N'Tố Loan', CAST(N'1966-10-08' AS Date), 1, N'0999692414', N'gdqv.xqyjoy@jsjkjixu.vnimrt.net', CAST(N'1972-02-09 01:06:49.480' AS DateTime), 7)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (194, N'Thùy Như', CAST(N'1983-03-10' AS Date), 1, N'0957405202', N'ncdk@efswofqos.yxyluy.com', CAST(N'1954-03-10 10:32:27.440' AS DateTime), 99)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (195, N'Thanh Ngân', CAST(N'1996-06-21' AS Date), 1, N'0972222381', N'uieeexfj@hyxg.beykpx.net', CAST(N'2007-08-03 05:28:06.400' AS DateTime), 34)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (196, N'Mỹ Trâm', CAST(N'1986-10-29' AS Date), 1, N'0927221113', N'dvvbb999@zavq.dtkug-.org', CAST(N'2007-02-22 19:58:19.950' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (197, N'Thế Phúc', CAST(N'1966-03-30' AS Date), 0, N'0913286690', N'grtnt43@jhzoyzjyt.fbjhel.org', CAST(N'2006-06-03 18:25:44.800' AS DateTime), 86)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (198, N'Ái Thy', CAST(N'1984-12-02' AS Date), 1, N'0947006511', N'axuvkuq17@pzsfxd.org', CAST(N'1975-08-26 01:37:45.920' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (199, N'Bích Ngà', CAST(N'1973-04-14' AS Date), 1, N'0966621148', N'uxbhja.gnshbjdh@exmodd.org', CAST(N'2000-12-02 00:54:18.620' AS DateTime), 78)
GO
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (200, N'Phương Nghi', CAST(N'1955-01-10' AS Date), 1, N'0992628188', N'qcqbi@ztn-ta.org', CAST(N'2014-06-29 20:40:36.360' AS DateTime), 76)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (201, N'Thuận Thành', CAST(N'1958-04-09' AS Date), 1, N'0908663233', N'qclnfvlr.iyfs@pjlsee.com', CAST(N'1987-04-21 13:12:10.560' AS DateTime), 18)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (202, N'Phượng Nga', CAST(N'1999-03-16' AS Date), 0, N'0992161945', N'deenaxm.kncogkhf@jozzgxg.ipizkr.org', CAST(N'1964-08-02 15:54:29.770' AS DateTime), 18)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (203, N'Nhân Nguyên', CAST(N'1988-12-31' AS Date), 1, N'0979214799', N'bryrcmn.fusiz@vwbvee.qtlcea.com', CAST(N'1965-01-10 14:22:04.830' AS DateTime), 73)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (204, N'Ân Lai', CAST(N'2000-01-20' AS Date), 1, N'0942892760', N'knxjqgsg.lfbcocikvd@eewthx.com', CAST(N'1953-05-21 02:22:12.100' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (205, N'Sơn Dương', CAST(N'1978-10-19' AS Date), 0, N'0910339774', N'hlicjel.hdqdusz@ejuufh.com', CAST(N'2002-06-30 16:52:11.570' AS DateTime), 5)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (206, N'Phương Anh', CAST(N'1960-09-14' AS Date), 0, N'0953178341', N'hrmwy.otawzt@svozym.mwxtrf.com', CAST(N'1999-11-16 13:54:28.980' AS DateTime), 49)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (207, N'Phước Bình', CAST(N'1975-04-25' AS Date), 1, N'0969486459', N'faopxu3@obsd.uvsbzr.org', CAST(N'2013-05-13 02:05:28.330' AS DateTime), 61)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (208, N'Bạch Liên', CAST(N'1991-07-08' AS Date), 1, N'0950940163', N'hweqy302@kdlwoc.org', CAST(N'1979-06-09 14:39:39.230' AS DateTime), 80)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (209, N'Hoài Diệu', CAST(N'1993-06-17' AS Date), 1, N'0933044913', N'yxkut@knnryg.org', CAST(N'2006-08-08 04:50:39.090' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (210, N'Ánh Thơ', CAST(N'1972-07-31' AS Date), 0, N'0967454170', N'ntdgp.yhlqj@vkqrjl.com', CAST(N'1970-04-11 06:39:40.120' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (211, N'Phụng Yến', CAST(N'1978-05-09' AS Date), 0, N'0982398961', N'xffx.gdmwm@jckikpwlp.mqwrc-.org', CAST(N'1955-01-12 23:51:21.010' AS DateTime), 38)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (212, N'Hữu Thiện', CAST(N'1984-06-27' AS Date), 1, N'0961390481', N'nfqw.swbseyuxpm@gjzwnlh.sft-cb.org', CAST(N'1974-04-10 07:54:44.470' AS DateTime), 46)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (213, N'Thanh Thanh', CAST(N'1996-12-10' AS Date), 1, N'0981546389', N'yblm65@gqnp-j.org', CAST(N'1967-01-02 18:53:33.230' AS DateTime), 59)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (214, N'Hải Thụy', CAST(N'1972-05-30' AS Date), 1, N'0960586908', N'uxxqs0@cbpbsvy.azevtl.com', CAST(N'1990-06-05 06:48:05.870' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (215, N'Công Bằng', CAST(N'1986-08-13' AS Date), 1, N'0914408245', N'eqicfku30@gxbcdlmp.ysrlhg.com', CAST(N'1992-09-24 00:15:09.000' AS DateTime), 70)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (216, N'Sông Hương', CAST(N'1976-05-14' AS Date), 1, N'0936696338', N'dlhj.tggs@tjtrgvbd.p-wszr.com', CAST(N'1978-05-08 01:27:16.780' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (217, N'Tuấn Sỹ', CAST(N'1958-06-16' AS Date), 1, N'0953591970', N'tcntjf.ygyi@seiloz.org', CAST(N'1998-05-22 17:00:20.030' AS DateTime), 84)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (218, N'Nam An', CAST(N'1956-11-26' AS Date), 0, N'0998539237', N'nfmenll.hevnqtnkdd@ncuxtg.net', CAST(N'1973-12-06 19:54:04.040' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (219, N'Dân Khánh', CAST(N'1997-01-22' AS Date), 0, N'0928230114', N'ncpknp17@hgreaj.lvakvh.net', CAST(N'1972-05-09 20:30:54.670' AS DateTime), 82)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (220, N'Nhật Tiến', CAST(N'2000-03-25' AS Date), 0, N'0957324794', N'brgt@eolaalg.kzczhl.com', CAST(N'2011-11-03 08:33:16.970' AS DateTime), 76)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (221, N'Hải Sinh', CAST(N'1999-12-13' AS Date), 0, N'0951353805', N'jdfo7@qgpyyz.atmpoj.org', CAST(N'1982-12-24 15:23:22.090' AS DateTime), 93)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (222, N'Hồng Diễm', CAST(N'1991-12-13' AS Date), 1, N'0969745960', N'pwzwfzqp30@-mujlj.org', CAST(N'1976-03-24 17:42:27.780' AS DateTime), 100)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (223, N'Lan Hương', CAST(N'1989-03-02' AS Date), 1, N'0962348662', N'gmaiy.aizb@prxw.zqoonz.org', CAST(N'2009-01-29 17:37:24.910' AS DateTime), 55)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (224, N'Minh Tuyết', CAST(N'1975-09-17' AS Date), 0, N'0977384478', N'szueyrw.nvwbbq@kyirlv.net', CAST(N'1989-05-16 04:20:19.830' AS DateTime), 97)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (225, N'Hán Lâm', CAST(N'1963-09-12' AS Date), 1, N'0937542445', N'wknbry589@bkjbzebzn.zomc-x.net', CAST(N'1998-12-18 16:09:13.410' AS DateTime), 44)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (226, N'Hoàng Yến', CAST(N'1975-09-17' AS Date), 1, N'0950145362', N'dxqbhiw.uunfrt@ozplrv.com', CAST(N'1965-08-09 04:29:20.690' AS DateTime), 6)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (227, N'Bích Chiêu', CAST(N'1968-09-06' AS Date), 1, N'0910379052', N'momeuae.vimadb@pgeativpu.yculbb.net', CAST(N'1995-10-17 05:52:36.990' AS DateTime), 31)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (228, N'Thúy Loan', CAST(N'1968-10-11' AS Date), 1, N'0938437633', N'tktut.pvkli@klco.iseqo-.com', CAST(N'1994-01-26 10:05:52.640' AS DateTime), 87)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (229, N'Xuân Liễu', CAST(N'1959-12-29' AS Date), 0, N'0952089201', N'rvjgkii@mohdn.dlzzsi.com', CAST(N'1962-06-04 05:39:47.770' AS DateTime), 67)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (230, N'Kiến Ðức', CAST(N'1970-07-01' AS Date), 1, N'0913101215', N'sjbote.kbumeaadr@gauapr.org', CAST(N'2001-11-14 13:23:22.400' AS DateTime), 100)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (231, N'Tịnh Nhi', CAST(N'1985-02-03' AS Date), 1, N'0925749961', N'opgylz.ygsbd@egibgelw.cebkxh.com', CAST(N'1970-12-01 15:47:11.230' AS DateTime), 6)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (232, N'Việt Hải', CAST(N'1967-04-23' AS Date), 1, N'0901350191', N'nsfo344@wzoagtqvh.zgbtyv.org', CAST(N'2019-12-30 19:30:17.830' AS DateTime), 71)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (233, N'Bạch Trà', CAST(N'1997-01-14' AS Date), 1, N'0913106894', N'hvrv.kvtaezo@jzhoew.net', CAST(N'1954-05-26 22:58:26.330' AS DateTime), 82)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (234, N'Ngọc Minh', CAST(N'1981-11-24' AS Date), 1, N'0963621181', N'megolcu061@bdapkzp.hbcksu.com', CAST(N'2001-02-25 22:13:14.340' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (235, N'Khiết Tâm', CAST(N'1990-01-23' AS Date), 0, N'0960211850', N'bapoeqp.tywx@sjzxeo.com', CAST(N'2001-12-30 22:47:37.250' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (236, N'Mỹ Lệ', CAST(N'1994-12-16' AS Date), 0, N'0986290019', N'sqvwek05@pnxfkn.org', CAST(N'1993-09-09 02:31:52.380' AS DateTime), 38)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (237, N'Hoàng Sa', CAST(N'1980-08-10' AS Date), 1, N'0961995599', N'rattk07@rlnwxi.net', CAST(N'2020-04-05 08:21:59.770' AS DateTime), 39)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (238, N'Nguyệt Nga', CAST(N'1999-03-23' AS Date), 1, N'0997016943', N'pxjyhx.emtmqoyu@bkazap.org', CAST(N'1981-10-26 09:02:01.930' AS DateTime), 84)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (239, N'Tuyết Nhi', CAST(N'1962-07-09' AS Date), 1, N'0970124680', N'ipbrzxqc3@votgnal.cmsd-f.com', CAST(N'1991-10-06 23:06:55.150' AS DateTime), 73)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (240, N'Tâm Trang', CAST(N'1978-12-01' AS Date), 1, N'0967261181', N'pwtvepg5@ncemqk.org', CAST(N'1997-05-08 23:24:28.990' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (241, N'Thu Thảo', CAST(N'1999-03-30' AS Date), 1, N'0986571295', N'htnp.fcimzqgs@ofgfhl.net', CAST(N'2018-07-24 17:05:27.400' AS DateTime), 8)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (242, N'Minh Hiền', CAST(N'1960-09-28' AS Date), 1, N'0996935693', N'eogzhfnp1@cdwkdz.org', CAST(N'1982-06-18 09:29:49.510' AS DateTime), 92)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (243, N'Bích Trâm', CAST(N'1978-07-21' AS Date), 1, N'0913630473', N'fpvhiy058@lcbfvc.jqspzn.com', CAST(N'1959-11-10 16:40:14.100' AS DateTime), 66)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (244, N'Nhật Tấn', CAST(N'1975-09-02' AS Date), 1, N'0953683496', N'kvdmrlyy9@lzyivvrbv.iwadow.org', CAST(N'1986-11-18 12:15:53.410' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (245, N'Hiếu Minh', CAST(N'1961-08-31' AS Date), 1, N'0940993939', N'unitfki416@uwyqug.org', CAST(N'1960-07-17 21:30:26.050' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (246, N'Việt Tuyết', CAST(N'1963-10-04' AS Date), 0, N'0983156727', N'tappv.hjcfkd@rtmzlt.org', CAST(N'2000-07-01 14:36:14.870' AS DateTime), 75)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (247, N'Nhan Hồng', CAST(N'1995-01-09' AS Date), 1, N'0925519894', N'fslb909@uhdppstud.jbsabf.net', CAST(N'1971-10-13 12:38:15.930' AS DateTime), 59)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (248, N'Quốc Vũ', CAST(N'1995-06-18' AS Date), 1, N'0950343995', N'hszodkx4@ahfczmo.xgrzav.net', CAST(N'2002-09-05 18:18:43.610' AS DateTime), 19)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (249, N'Thanh Hạnh', CAST(N'1997-09-03' AS Date), 1, N'0992079199', N'taczau.cfetsge@rbcxq.prsj--.org', CAST(N'1982-06-16 10:17:18.450' AS DateTime), 89)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (250, N'Anh Vũ', CAST(N'1973-02-07' AS Date), 1, N'0900695577', N'hphqni26@thvlqb.com', CAST(N'1982-03-29 04:00:49.610' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (251, N'Phú Hiệp', CAST(N'1981-05-16' AS Date), 0, N'0913119968', N'kussczm46@swdkqraqg.mcqggw.org', CAST(N'1961-10-04 02:57:59.920' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (252, N'Hải Thụy', CAST(N'1962-05-04' AS Date), 0, N'0913025143', N'xrucn.nnvucv@xalraz.com', CAST(N'1985-06-28 22:31:40.760' AS DateTime), 94)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (253, N'Tuệ Mẫn', CAST(N'1988-12-17' AS Date), 1, N'0964541088', N'pezfpls06@hqhfvc.org', CAST(N'1956-04-18 05:06:51.240' AS DateTime), 55)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (254, N'Mạnh Cường', CAST(N'1974-02-27' AS Date), 1, N'0966477588', N'wdzmvtg.ftniexorz@pkaeh.ojdkfw.org', CAST(N'2010-01-29 16:21:01.650' AS DateTime), 26)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (255, N'Hữu Thiện', CAST(N'1956-03-06' AS Date), 1, N'0918211028', N'sazstrlk@lcstov.org', CAST(N'1984-07-07 05:17:14.270' AS DateTime), 17)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (256, N'Thanh Hồng', CAST(N'1967-06-05' AS Date), 0, N'0998445200', N'pmdvfje.uzwgfl@yfjjed.org', CAST(N'1964-01-28 19:29:42.770' AS DateTime), 73)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (257, N'Hải Nguyên', CAST(N'1963-01-15' AS Date), 0, N'0947102159', N'balrjvk.ngxd@mptkxa.net', CAST(N'1976-07-03 22:17:04.870' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (258, N'Hạnh San', CAST(N'1966-04-17' AS Date), 1, N'0943644792', N'rvfqpqy95@sdgyoah.ezkkvw.net', CAST(N'1996-08-27 10:01:45.010' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (259, N'Trang Tâm', CAST(N'1989-05-10' AS Date), 0, N'0935351359', N'tgecuu.evezczyoj@mnmia.nlvtes.net', CAST(N'1975-06-03 10:12:58.700' AS DateTime), 97)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (260, N'Phượng Liên', CAST(N'1956-02-03' AS Date), 1, N'0991027733', N'zoskcoyh@gpfawb.net', CAST(N'1989-11-22 12:22:50.880' AS DateTime), 69)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (261, N'Phong Dinh', CAST(N'1993-02-14' AS Date), 1, N'0901516188', N'hxgydkgi90@dlfdh.wdksoe.com', CAST(N'1957-01-31 08:01:51.980' AS DateTime), 71)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (262, N'Vy Lam', CAST(N'1959-07-16' AS Date), 1, N'0984475376', N'guxd.xbhugr@hrurlm.uvsuge.org', CAST(N'1972-04-17 15:59:35.680' AS DateTime), 63)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (263, N'Huyền Thoại', CAST(N'1984-07-10' AS Date), 1, N'0999585205', N'njzzhc8@wbdlx.dfwtyx.net', CAST(N'1970-01-06 08:59:51.460' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (264, N'Quỳnh Anh', CAST(N'1975-12-18' AS Date), 0, N'0911590068', N'mlze4@tjgr-n.org', CAST(N'1957-09-24 15:27:16.690' AS DateTime), 94)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (265, N'Công Luật', CAST(N'1988-08-04' AS Date), 1, N'0992816386', N'yospkrjv927@ebvqfh.com', CAST(N'2020-05-10 14:52:28.890' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (266, N'Tâm Thiện', CAST(N'1964-01-18' AS Date), 1, N'0961574024', N'gcnjbp.supaiahcu@bomoue.net', CAST(N'1956-01-14 04:21:03.180' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (267, N'Minh Loan', CAST(N'1988-07-20' AS Date), 1, N'0952530036', N'pexvvldm.hifi@ldocdu.net', CAST(N'1972-11-15 08:56:18.140' AS DateTime), 17)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (268, N'Hiểu Lam', CAST(N'1968-01-18' AS Date), 0, N'0989331728', N'rylw.sednhzv@oeotem.org', CAST(N'1986-11-06 20:40:18.890' AS DateTime), 79)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (269, N'Nguyễn Diệu', CAST(N'1983-06-14' AS Date), 1, N'0967319974', N'trgdqqtx.bdxagtae@rbylmlzyq.oijure.com', CAST(N'2009-06-05 08:00:28.630' AS DateTime), 41)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (270, N'Thanh Huy', CAST(N'1992-10-05' AS Date), 1, N'0924756660', N'cnjqmot.oyvt@dmssvqf.vgtwrt.org', CAST(N'2020-01-15 21:43:16.620' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (271, N'Minh Quang', CAST(N'1996-11-10' AS Date), 1, N'0955178979', N'bhqcqub.rqolzvin@izmqtwwn.sraatf.net', NULL, 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (272, N'Ngọc Hiền', CAST(N'1960-05-03' AS Date), 1, N'0912084655', N'dysikd062@kirmui.com', CAST(N'1979-02-01 17:05:17.020' AS DateTime), 68)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (273, N'Thành Nhân', CAST(N'1995-06-28' AS Date), 1, N'0904255560', N'wftgs.poufch@hyxvdn.frqwhi.com', CAST(N'1969-07-28 07:58:18.090' AS DateTime), 73)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (274, N'Hữu Bảo', CAST(N'1971-02-22' AS Date), 1, N'0993276116', N'zwhxgt.siqnlvaueg@owmkcc.net', CAST(N'2003-03-02 20:47:08.900' AS DateTime), 17)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (275, N'Việt Khang', CAST(N'1953-12-27' AS Date), 1, N'0938834026', N'pvnifavi.ywhwfnnz@rwrbpaz.ivtbtx.com', CAST(N'1996-01-01 21:06:25.690' AS DateTime), 45)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (276, N'Uyên Phương', CAST(N'1992-03-17' AS Date), 1, N'0933919186', N'uhik9@xbrqzx.org', CAST(N'2014-04-11 15:27:49.580' AS DateTime), 8)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (277, N'Duy Nhượng', CAST(N'1966-05-25' AS Date), 0, N'0929061778', N'okse2@yyqwc.jiseqw.com', CAST(N'1953-07-09 05:53:32.570' AS DateTime), 97)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (278, N'Thiện Giang', CAST(N'1966-07-01' AS Date), 1, N'0933596832', N'xxts.ljxpgfnts@cjisae.ushhgs.com', CAST(N'1969-05-16 01:02:13.680' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (279, N'Hoàn Vũ', CAST(N'1967-01-18' AS Date), 1, N'0986023932', N'fkug.htgpaapwwq@qnm-fw.net', CAST(N'1975-03-15 05:21:31.490' AS DateTime), 16)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (280, N'Lạc Phúc', CAST(N'2001-01-16' AS Date), 1, N'0927418058', N'xfzdcfc194@vpbczc.net', CAST(N'1981-10-30 06:49:53.780' AS DateTime), 41)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (281, N'Thu Liên', CAST(N'1981-10-16' AS Date), 0, N'0927706549', N'vrqw@exokdbuc.vyhwtr.org', CAST(N'2019-06-19 01:32:58.550' AS DateTime), 61)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (282, N'Hưng Ðạo', CAST(N'1974-04-28' AS Date), 1, N'0974718640', N'dswyc.lzjhmf@uvyawfktv.qddnab.org', CAST(N'2014-10-27 15:51:04.760' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (283, N'Công Tráng', CAST(N'1972-03-16' AS Date), 0, N'0950612814', N'cygqgb@rmpfqv.com', CAST(N'2014-02-10 11:33:53.380' AS DateTime), 17)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (284, N'Vân Hương', CAST(N'1987-12-29' AS Date), 0, N'0912454810', N'vqjpsyaz4@ggacfw.org', CAST(N'1964-08-12 23:48:34.190' AS DateTime), 10)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (285, N'Vy Lam', CAST(N'1990-03-25' AS Date), 1, N'0997948366', N'xaxffb35@zgjbmfhpg.gobfje.com', CAST(N'2001-03-08 01:38:58.160' AS DateTime), 79)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (286, N'Quỳnh Phương', CAST(N'1975-10-04' AS Date), 1, N'0991977899', N'kzilyplj@afavx-.net', CAST(N'1993-02-11 10:25:22.470' AS DateTime), 32)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (287, N'Hoài An', CAST(N'1979-06-13' AS Date), 1, N'0991489243', N'qapp73@rduh.isnhtq.org', CAST(N'2006-06-04 17:15:30.480' AS DateTime), 70)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (288, N'Phúc Khang', CAST(N'1975-11-18' AS Date), 1, N'0981980704', N'kxqna33@mkktdq.bfnfov.net', CAST(N'2016-09-13 14:23:26.580' AS DateTime), 43)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (289, N'Ðức Bình', CAST(N'1978-09-20' AS Date), 1, N'0911234691', N'scjsdini6@wwphve.net', CAST(N'1965-04-27 06:37:24.690' AS DateTime), 1)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (290, N'Thiên Tuyền', CAST(N'1975-08-22' AS Date), 0, N'0903465491', N'zzlsx.eejv@uczqdf.net', CAST(N'1969-08-22 16:56:00.070' AS DateTime), 34)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (291, N'Hương Thủy', CAST(N'1984-12-02' AS Date), 1, N'0911769467', N'fblvdfjx.pzlsd@fuqc-h.net', CAST(N'1990-12-04 03:17:54.480' AS DateTime), 50)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (292, N'Hiền Diệu', CAST(N'1967-04-27' AS Date), 0, N'0981026368', N'wctqqrzw.xzwuj@fpetka.org', CAST(N'1970-03-09 04:14:47.510' AS DateTime), 88)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (293, N'Thùy Giang', CAST(N'1962-11-14' AS Date), 1, N'0966679894', N'rxlhyetp.dqghcqdvy@cmld.urqgk-.net', CAST(N'1976-08-09 22:20:14.760' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (294, N'Hà Hải', CAST(N'1959-06-06' AS Date), 1, N'0922548889', N'ytnor.kbngwbynp@bvbol-.org', CAST(N'1959-05-26 22:49:03.230' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (295, N'Kim Ly', CAST(N'1986-11-23' AS Date), 1, N'0944176620', N'kbynwcyq05@aoazfgu.daqvxw.com', CAST(N'1954-11-15 10:44:04.260' AS DateTime), 3)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (296, N'Túy Loan', CAST(N'1992-09-15' AS Date), 0, N'0928619763', N'hnjoecl.dykpen@tunnmvx.nxxw-d.org', CAST(N'1993-04-08 15:22:37.000' AS DateTime), 14)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (297, N'Gia Kiệt', CAST(N'1977-04-28' AS Date), 0, N'0923197544', N'ybofpeyc03@zoplecaw.rlfqen.com', CAST(N'1999-04-09 01:05:51.720' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (298, N'Ngọc Hoan', CAST(N'1955-08-04' AS Date), 0, N'0984223791', N'zxiqd.uowla@pyhxj.ozybbf.net', CAST(N'1965-06-13 00:29:58.050' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (299, N'Minh Dân', CAST(N'1988-03-07' AS Date), 1, N'0978095886', N'josov.kbqvpuqqgp@yxhige.com', CAST(N'1955-02-17 01:12:57.410' AS DateTime), 32)
GO
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (300, N'Lương Tuyền', CAST(N'1998-09-21' AS Date), 1, N'0931278436', N'aygoxbbl824@wqbtlz.com', CAST(N'1987-07-10 21:23:24.530' AS DateTime), 32)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (301, N'Nam Phi', CAST(N'1976-04-22' AS Date), 1, N'0914752213', N'mgpyw434@lvbyns.org', CAST(N'1957-07-05 17:09:22.860' AS DateTime), 39)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (302, N'Khải Tâm', CAST(N'1979-12-23' AS Date), 0, N'0980481749', N'csqdf.rflycrg@hcejur.com', CAST(N'1980-08-17 05:39:56.730' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (303, N'Thái Sang', CAST(N'1965-01-04' AS Date), 0, N'0942831090', N'wqrap777@qlscpn.org', CAST(N'2005-12-06 15:57:57.050' AS DateTime), 16)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (304, N'Việt Hùng', CAST(N'1957-11-30' AS Date), 1, N'0930578718', N'nnkg@nuvkew.org', CAST(N'2014-04-02 10:18:14.990' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (305, N'Quỳnh Ngân', CAST(N'1977-05-06' AS Date), 0, N'0961588210', N'blcbgf@qwkbug.com', CAST(N'1983-06-01 12:34:01.830' AS DateTime), 82)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (306, N'Huệ Lâm', CAST(N'1974-01-14' AS Date), 1, N'0914943999', N'giglx.ufzxepu@beleqifmp.duzl-o.net', CAST(N'1956-02-26 10:55:32.590' AS DateTime), 96)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (307, N'Quỳnh Dao', CAST(N'1967-12-15' AS Date), 1, N'0977366197', N'pyipnh.ziamjwr@qvhzyduvu.svtzid.org', CAST(N'2013-03-08 18:59:41.840' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (308, N'Ngọc Yến', CAST(N'1970-10-26' AS Date), 0, N'0910177317', N'gvmqdpei.duhcrlj@oqvntt.com', CAST(N'2003-04-29 01:44:31.860' AS DateTime), 40)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (309, N'Phượng Tiên', CAST(N'1973-03-04' AS Date), 1, N'0995361138', N'qgir64@zssvpf.s-ipch.com', CAST(N'1981-04-17 08:00:25.560' AS DateTime), 7)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (310, N'Nguyên Giáp', CAST(N'1965-01-27' AS Date), 1, N'0938767833', N'mlnkh.ltnc@vkpqex.com', CAST(N'2016-10-20 00:53:12.080' AS DateTime), 66)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (311, N'Mộng Nguyệt', CAST(N'1954-01-11' AS Date), 1, N'0930549090', N'atbpfati9@vwc-dv.org', CAST(N'1983-12-30 23:23:41.690' AS DateTime), 55)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (312, N'Phi Phượng', CAST(N'1997-08-23' AS Date), 1, N'0954753510', N'zhnqoxp.ykfq@mucrd.m-dvs-.com', CAST(N'2015-09-14 18:27:29.100' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (313, N'Việt Cường', CAST(N'2000-05-06' AS Date), 1, N'0901622755', N'qacgtb9@dpgonm.com', CAST(N'1954-04-22 16:55:33.370' AS DateTime), 19)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (314, N'Mai Ly', CAST(N'1989-05-31' AS Date), 1, N'0955233437', N'erfceyc38@-fixhz.net', CAST(N'1967-10-30 03:11:51.220' AS DateTime), 63)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (315, N'Yến My', CAST(N'1975-05-28' AS Date), 0, N'0925626118', N'hyvlnz.kpihrjvky@qodddu.org', CAST(N'1976-12-15 08:40:00.160' AS DateTime), 6)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (316, N'Gia Thịnh', CAST(N'1971-10-21' AS Date), 0, N'0988514742', N'jysfooxx.qqzohwtm@qkyyjq.org', CAST(N'1996-01-26 20:31:46.130' AS DateTime), 18)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (317, N'Thủy Tiên', CAST(N'1988-06-07' AS Date), 1, N'0940778414', N'dtrq@skuttmba.hhaggk.net', CAST(N'1963-12-21 20:27:58.610' AS DateTime), 83)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (318, N'Kiết Trinh', CAST(N'1997-08-20' AS Date), 1, N'0962022578', N'amyatvw797@bj-dir.net', CAST(N'1960-09-05 16:11:01.480' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (319, N'Thường Xuân', CAST(N'1986-11-02' AS Date), 1, N'0988540337', N'ejyqbi8@jhkg.znxjrs.org', CAST(N'1989-10-31 07:20:53.300' AS DateTime), 68)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (320, N'Nhật Thịnh', CAST(N'1965-11-02' AS Date), 1, N'0933058129', N'izfrgcb52@btodlx.com', CAST(N'1985-08-13 05:01:54.220' AS DateTime), 50)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (321, N'Quỳnh Tiên', CAST(N'1985-09-13' AS Date), 1, N'0904610254', N'pbsdu@ulgqhb.org', CAST(N'1966-12-07 21:36:58.400' AS DateTime), 69)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (322, N'Trí Hùng', CAST(N'1965-09-02' AS Date), 1, N'0945593516', N'itiyxt1@iefuln.net', CAST(N'1960-05-01 13:57:36.600' AS DateTime), 11)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (323, N'Xuân Nam', CAST(N'1990-06-06' AS Date), 1, N'0969934178', N'nomy078@urlsdei.rhokph.org', CAST(N'1960-07-22 02:18:53.450' AS DateTime), 87)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (324, N'Hữu Hoàng', CAST(N'1960-10-24' AS Date), 1, N'0951390387', N'eoruco8@bsv-gj.net', CAST(N'1970-03-18 03:44:18.820' AS DateTime), 99)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (325, N'Quỳnh Hoa', CAST(N'1960-11-03' AS Date), 1, N'0986728579', N'cxncqesb.dwpd@edmhfm.net', CAST(N'1971-07-04 04:42:34.150' AS DateTime), 95)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (326, N'Nguyên Bảo', CAST(N'1982-07-18' AS Date), 1, N'0913943266', N'iifc.haxgznrm@knorty.yxxvcw.com', CAST(N'2002-11-09 17:28:29.100' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (327, N'Trúc Linh', CAST(N'1998-07-27' AS Date), 0, N'0976054210', N'past@ipczid.org', CAST(N'1955-06-25 18:45:02.250' AS DateTime), 64)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (328, N'Minh Nhu', CAST(N'1989-01-22' AS Date), 1, N'0935521513', N'sdxytyf12@leen.jmzstr.net', CAST(N'1963-03-05 09:09:14.850' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (329, N'Giang Thanh', CAST(N'1985-05-08' AS Date), 1, N'0973036596', N'faqzvuq.azlcqvqkdr@wmylyuug.jedjsd.com', CAST(N'2001-04-18 10:03:04.630' AS DateTime), 92)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (330, N'Giao Kiều', CAST(N'1962-05-20' AS Date), 0, N'0910702330', N'hmogjde76@paicioro.zwlcqu.org', CAST(N'1955-09-26 05:43:48.680' AS DateTime), 95)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (331, N'Thanh Nhàn', CAST(N'1967-11-20' AS Date), 0, N'0933141814', N'xqfaw@hujpab.net', CAST(N'1968-01-04 14:21:57.850' AS DateTime), 36)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (332, N'Thượng Năng', CAST(N'1963-10-22' AS Date), 0, N'0958132029', N'ufvik.vknsu@juqvbd.tulcuf.net', CAST(N'2009-01-26 05:23:34.530' AS DateTime), 36)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (333, N'Hồng Thịnh', CAST(N'1979-06-03' AS Date), 1, N'0993055870', N'gxuolwpl0@lrefhvkp.f-si-j.com', CAST(N'1967-03-30 23:49:16.270' AS DateTime), 26)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (334, N'Vân Phi', CAST(N'1969-06-06' AS Date), 0, N'0962229148', N'pjwrdpxf.uihhas@dhxnlmoh.tvbveb.org', CAST(N'2008-09-04 07:58:06.970' AS DateTime), 19)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (335, N'Ðông Nhi', CAST(N'1977-09-27' AS Date), 0, N'0982121214', N'rpnh94@hsyzag.gagayj.org', CAST(N'1977-04-27 13:40:30.910' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (336, N'Kim Ánh', CAST(N'1954-10-25' AS Date), 1, N'0927767314', N'yeks.fcjjdp@ay-fvg.com', CAST(N'1991-11-02 19:53:01.810' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (337, N'Thiện Mỹ', CAST(N'1962-04-24' AS Date), 1, N'0908736175', N'tuvcy@ejlcbo.net', CAST(N'1961-11-21 23:53:07.700' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (338, N'Khánh Linh', CAST(N'1967-04-17' AS Date), 1, N'0913908404', N'bbpoqxr.aibrowggk@rpdenq.net', CAST(N'2020-11-10 01:15:38.400' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (339, N'Hoàng Ngôn', CAST(N'1963-08-25' AS Date), 0, N'0906183005', N'nxykfxtf.dwejsapuaq@wqyxqk.net', CAST(N'2002-03-14 11:14:32.360' AS DateTime), 7)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (340, N'Thanh Việt', CAST(N'1969-03-12' AS Date), 1, N'0920590543', N'azzmfh@uqfcgs.net', CAST(N'1998-01-11 14:43:25.570' AS DateTime), 10)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (341, N'Anh Khoa', CAST(N'1960-10-20' AS Date), 1, N'0924504600', N'xeptqiq243@ipcewrek.qzfvxy.net', CAST(N'2000-12-05 15:25:40.640' AS DateTime), 80)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (342, N'Thiều Ly', CAST(N'1961-08-18' AS Date), 1, N'0982835260', N'ffiosuh8@tmmoli.net', CAST(N'1956-02-07 15:30:58.620' AS DateTime), 41)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (343, N'Cẩm Vân', CAST(N'1955-09-17' AS Date), 1, N'0952462184', N'dwaemfyt73@fcxu.uuuevh.org', CAST(N'1988-05-30 06:23:01.020' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (344, N'Thu Nga', CAST(N'1966-08-25' AS Date), 1, N'0961236548', N'elriohtg105@zdbm-v.org', CAST(N'1969-07-08 05:44:12.620' AS DateTime), 8)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (345, N'Hải Sơn', CAST(N'1974-08-12' AS Date), 0, N'0910147392', N'rstwfi.wiauhreec@wwssay.org', CAST(N'2006-08-23 17:32:18.380' AS DateTime), 74)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (346, N'Thu Liên', CAST(N'1988-05-19' AS Date), 0, N'0949423078', N'atud@quknxsbis.afh-xk.com', CAST(N'1996-03-21 08:50:25.390' AS DateTime), 5)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (347, N'Dạ Hương', CAST(N'1968-01-28' AS Date), 1, N'0956231024', N'kozzsyym.beqxhrnk@udvjzo.net', CAST(N'1968-11-17 11:19:14.140' AS DateTime), 81)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (348, N'Hữu Lương', CAST(N'1974-07-24' AS Date), 1, N'0994539724', N'navkrgnm0@lcqhow.zqmmsm.com', CAST(N'1961-10-12 19:08:23.530' AS DateTime), 39)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (349, N'Hữu Trí', CAST(N'1985-02-16' AS Date), 0, N'0950516084', N'tpzdayy.rnkjup@fkibeb.com', CAST(N'2003-06-11 14:09:03.080' AS DateTime), 36)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (350, N'Bội Linh', CAST(N'1968-02-04' AS Date), 1, N'0993826738', N'taxmi.xhtmsylqm@paluearfm.zcnlnk.org', CAST(N'1979-10-20 14:12:18.140' AS DateTime), 35)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (351, N'Chấn Hùng', CAST(N'1957-04-11' AS Date), 1, N'0977812240', N'bdgz0@diuuwpdml.ywwube.org', CAST(N'1982-04-19 18:54:38.390' AS DateTime), 95)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (352, N'Bích Hợp', CAST(N'1980-10-15' AS Date), 1, N'0970979802', N'deze.sljuqrxscw@rgbnkz.org', CAST(N'1991-08-04 08:54:50.230' AS DateTime), 76)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (353, N'Thụy Lâm', CAST(N'1969-11-09' AS Date), NULL, N'0953925642', N'jbeidugq.dyvr@giwtjft.ffmvup.net', CAST(N'1996-08-12 17:09:04.750' AS DateTime), 81)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (354, N'Yến Thảo', CAST(N'1975-05-07' AS Date), 1, N'0996879054', N'citqgarv82@azdrgb.org', CAST(N'1990-07-06 20:11:03.190' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (355, N'Tường Lĩnh', CAST(N'1966-01-08' AS Date), 0, N'0913736620', N'vehebxh@dvmylefra.ajnfpd.com', CAST(N'1973-08-03 23:46:26.120' AS DateTime), 56)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (356, N'Thúy Quỳnh', CAST(N'1963-08-21' AS Date), 0, N'0952402388', N'disxt.jcztob@dpuobs.bjaatt.net', CAST(N'2018-03-06 03:11:46.260' AS DateTime), 16)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (357, N'Ngọc Quyên', CAST(N'1990-08-25' AS Date), 1, N'0925226015', N'lttt.kfcz@cgxmgqxlr.plypfh.net', CAST(N'1973-01-27 03:21:03.280' AS DateTime), 19)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (358, N'Hữu Từ', CAST(N'1957-03-14' AS Date), 1, N'0989191418', N'svpen@nsjsp.pkvmpu.org', CAST(N'1988-09-21 12:13:38.220' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (359, N'Mai Lan', CAST(N'1998-03-06' AS Date), 0, N'0912729429', N'igqd@cjkgn.xsxqyx.com', CAST(N'1995-10-01 05:35:40.840' AS DateTime), 51)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (360, N'Diễm Trang', CAST(N'1995-11-27' AS Date), 0, N'0968449152', N'hcatj82@ygxwxn.com', CAST(N'2001-07-22 19:05:32.730' AS DateTime), 80)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (361, N'Minh Tuyết', CAST(N'1976-07-27' AS Date), 1, N'0949771123', N'tqzhi415@fmpznb.com', CAST(N'1953-09-03 16:10:30.330' AS DateTime), 17)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (362, N'Hiền Mai', CAST(N'1979-12-30' AS Date), 1, N'0926099357', N'xjgdnr.awaclhrbh@ogrgfg.org', CAST(N'2003-01-05 09:50:26.980' AS DateTime), 55)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (363, N'Khánh Hội', CAST(N'1986-07-28' AS Date), 1, N'0989689704', N'lqxiuac.jvtrpwmf@kzvoss.com', CAST(N'1955-01-11 15:41:27.220' AS DateTime), 39)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (364, N'Minh Nhật', CAST(N'1963-10-17' AS Date), 1, N'0984004956', N'dfca.jdpdofc@hslbay.farkoi.com', CAST(N'1978-07-24 02:16:36.880' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (365, N'Xuân Kiên', CAST(N'1998-04-16' AS Date), 1, N'0914169529', N'epjbznhi.imgjrjtdl@grj-sz.org', CAST(N'2001-10-17 10:31:14.220' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (366, N'Quang Thái', CAST(N'1991-04-29' AS Date), 1, N'0907919156', N'mxammyz.iaajmusmew@qmxcfxxz.gnfzmh.org', CAST(N'1995-12-04 18:00:07.160' AS DateTime), 49)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (367, N'Hồng Nga', CAST(N'1971-03-23' AS Date), 1, N'0925997644', N'tksn.kmnvw@nbp-vl.org', CAST(N'2001-06-17 18:38:12.830' AS DateTime), 67)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (368, N'Cẩm Yến', CAST(N'1983-12-02' AS Date), 1, N'0902103234', N'habwzbm.zmkmkmsv@mpsbah.com', CAST(N'1966-08-18 08:57:26.400' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (369, N'Nghi Xuân', CAST(N'1964-09-04' AS Date), 1, N'0942005049', N'lqzrw4@qttxsd.jgacpx.org', CAST(N'2011-07-04 13:31:20.320' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (370, N'Quốc Quang', CAST(N'1973-08-03' AS Date), 0, N'0977484763', N'tpuo.omibdkhpfx@aedypw.com', CAST(N'2006-02-12 12:46:58.350' AS DateTime), 42)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (371, N'Quang Triều', CAST(N'1962-06-29' AS Date), 0, N'0901741562', N'qbmpvst.puxmqbhlwp@uadenw.org', CAST(N'1987-03-07 20:38:38.420' AS DateTime), 87)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (372, N'Nguyễn Hải An', CAST(N'1974-02-21' AS Date), 1, N'0919467580', N'vaxar9@kqmmpb.org', CAST(N'1964-02-10 19:12:20.210' AS DateTime), 19)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (373, N'Bích Quyên', CAST(N'1986-12-28' AS Date), 1, N'0921984707', N'kdwnt@zhjgwt.org', CAST(N'1979-06-25 04:56:29.120' AS DateTime), 40)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (374, N'Băng Băng', CAST(N'1970-08-23' AS Date), 1, N'0942734913', N'pxxuhoh.ecbilc@mxxi.pezmmr.org', CAST(N'2012-10-19 16:37:27.730' AS DateTime), 22)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (375, N'Nhật Bảo Long', CAST(N'1958-01-13' AS Date), 0, N'0960044333', N'oxmf181@ubcspn.com', CAST(N'2005-09-07 13:36:13.590' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (376, N'Đan Thu', CAST(N'1977-01-27' AS Date), 1, N'0910090433', N'fikwdzi7@pkrpep.org', CAST(N'1963-11-01 06:05:59.780' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (377, N'Trầm Hương', CAST(N'1962-12-18' AS Date), 0, N'0911704491', N'xbdiijn53@lbpd-i.org', CAST(N'1992-12-02 07:34:35.590' AS DateTime), 30)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (378, N'Lam Hà', CAST(N'1976-10-13' AS Date), 1, N'0987455322', N'xlain.komaleie@nulevekvc.ibkdfw.net', CAST(N'2012-01-14 20:34:40.830' AS DateTime), 47)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (379, N'Chí Hiếu', CAST(N'1987-04-21' AS Date), 1, N'0938765168', N'pcavkesy57@jdnp.magpmj.net', CAST(N'1984-07-25 10:12:00.440' AS DateTime), 17)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (380, N'Ánh Linh', CAST(N'1973-07-25' AS Date), 1, N'0964130080', N'idiu.iodbrjh@eahi.ksgqqb.org', CAST(N'1996-04-13 19:52:08.770' AS DateTime), 13)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (381, N'Ngọc Lệ', CAST(N'1967-06-21' AS Date), 1, N'0946665234', N'imml.kuspyhujg@fnbe.peasop.net', CAST(N'1986-12-24 06:09:14.960' AS DateTime), 74)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (382, N'Nguyệt Quế', CAST(N'1977-01-04' AS Date), 0, N'0966566749', N'dnhkf.gscbclk@gblfvloet.wgjypu.net', CAST(N'2014-09-12 23:36:38.730' AS DateTime), 18)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (383, N'Ðắc Thái', CAST(N'1956-12-07' AS Date), 0, N'0944663672', N'mlakepnp.zcrewzln@vrycqz.gwtmgc.com', CAST(N'1980-09-23 19:00:11.770' AS DateTime), 20)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (384, N'Cao Thọ', CAST(N'1970-04-04' AS Date), 1, N'0985637418', N'xbwx.gxdero@jlbpie.net', CAST(N'1974-06-30 19:50:46.480' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (385, N'Bảo Vy', CAST(N'1958-02-09' AS Date), 1, N'0937342050', N'xteugs.szgg@pphypu.net', CAST(N'1994-06-08 10:49:10.290' AS DateTime), 77)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (386, N'Quốc Quân', CAST(N'1988-03-13' AS Date), 1, N'0910838153', N'zlcw.krtfdldc@kncems.org', CAST(N'1997-06-02 05:27:07.630' AS DateTime), 31)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (387, N'Diệu Huyền', CAST(N'1995-01-20' AS Date), 0, N'0968208265', N'mlwnil.rzusskfmoa@dnumwgmcq.kgcqia.com', CAST(N'1965-06-16 12:14:29.780' AS DateTime), 71)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (388, N'Kim Toàn', CAST(N'1957-01-28' AS Date), 1, N'0982904811', N'jiqd.iajbirrln@zqkqcynj.nmoa-c.org', CAST(N'1997-09-24 03:38:13.080' AS DateTime), 26)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (389, N'Bảo Anh', CAST(N'1956-05-29' AS Date), 1, N'0919250356', N'rwkat.wwltzxztw@laghkdt.pukh-e.com', CAST(N'1988-02-02 08:11:40.850' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (390, N'Gia Huy', CAST(N'1967-02-08' AS Date), 0, N'0984757385', N'tqxifaft73@tsrqsb.klfgcz.com', CAST(N'1980-02-22 10:28:44.660' AS DateTime), 52)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (391, N'Tường Vy', CAST(N'1965-04-09' AS Date), 1, N'0943808717', N'oknkxf@kunbxjjmb.spjmnq.com', CAST(N'1971-10-07 16:31:58.530' AS DateTime), 41)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (392, N'Kỳ Duyên', CAST(N'1958-02-11' AS Date), 1, N'0910592793', N'qbcawhqc236@mgfvin.net', CAST(N'1994-03-02 11:39:29.490' AS DateTime), 9)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (393, N'Yên Bằng', CAST(N'1970-03-21' AS Date), 1, N'0930885207', N'qxht.avgwzjzajx@vejetla.xegu-p.net', CAST(N'1978-02-10 19:39:57.560' AS DateTime), 51)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (394, N'Kim Sa', CAST(N'1968-11-05' AS Date), 1, N'0913462997', N'mcposbfe63@xioxsr.com', CAST(N'1953-08-23 16:08:59.630' AS DateTime), 69)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (395, N'Minh Loan', CAST(N'1993-09-23' AS Date), 0, N'0931153363', N'evsydu.wiovohi@uzddgu.com', CAST(N'1997-05-10 22:32:55.240' AS DateTime), 1)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (396, N'Xuân Kiên', CAST(N'1981-11-29' AS Date), 1, N'0969205485', N'liyfcxb.xtvtykqopi@xq-wey.net', CAST(N'2018-12-01 05:35:13.660' AS DateTime), 93)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (397, N'Kim Khánh', CAST(N'1976-02-29' AS Date), 1, N'0915859060', N'hxbbrrm.ulngojoxy@oprlwl.com', CAST(N'1954-01-27 23:49:31.390' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (398, N'Phúc Lâm', CAST(N'1993-01-07' AS Date), 0, N'0925860496', N'xixzi0@bfx-gu.net', CAST(N'1962-11-08 04:06:24.140' AS DateTime), 25)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (399, N'Thanh Vinh', CAST(N'1969-06-17' AS Date), 1, N'0938742174', N'pihmygb@oeecur.net', CAST(N'1988-09-20 19:12:58.400' AS DateTime), 19)
GO
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (400, N'Thu Phương', CAST(N'1984-05-22' AS Date), 1, N'0981807658', N'leaw@prni.oowekk.com', CAST(N'1963-09-20 23:32:11.210' AS DateTime), 86)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (401, N'Minh Hào', CAST(N'1970-02-27' AS Date), 1, N'0997109393', N'xekzu9@ijxldpmyq.jlmgjh.org', CAST(N'2015-10-04 14:12:12.570' AS DateTime), 91)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (402, N'Bảo Long', CAST(N'1985-04-05' AS Date), 1, N'0970870815', N'iykgo9@nspymo.org', CAST(N'1955-04-03 02:21:47.730' AS DateTime), 16)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (403, N'Xuân Lạc', CAST(N'1962-11-20' AS Date), 1, N'0966368517', N'adlh.uphlrdp@xodrbu.com', CAST(N'1971-04-11 05:37:03.220' AS DateTime), 14)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (404, N'Thục Oanh', CAST(N'1964-07-16' AS Date), 1, N'0951710229', N'dzpk.lyxclhweb@mzyc.lf-psj.com', CAST(N'2018-04-29 01:22:04.740' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (405, N'Kiệt Võ', CAST(N'1958-08-09' AS Date), 0, N'0902845820', N'cdif10@wmtade.org', CAST(N'2013-08-14 17:33:39.730' AS DateTime), 97)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (406, N'Quỳnh Giao', CAST(N'1984-03-27' AS Date), 1, N'0990098298', N'nytqv.uniji@pazhyqwtb.pnbpnj.org', CAST(N'1971-03-10 23:42:18.180' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (407, N'Ái Diệu', CAST(N'1994-11-26' AS Date), 1, N'0982958144', N'javk36@uutozv.tbxfpw.net', CAST(N'1965-02-10 03:58:21.100' AS DateTime), 33)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (408, N'Thiện Dũng', CAST(N'2000-04-26' AS Date), 1, N'0915964180', N'yahp12@kedwmz.org', CAST(N'2004-10-24 00:31:37.020' AS DateTime), 80)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (409, N'Minh Vy', CAST(N'1970-04-25' AS Date), 0, N'0982143722', N'iygcbph.iepue@fmaafhr.epopsx.com', CAST(N'2005-10-29 06:34:49.610' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (410, N'Xuân Quý', CAST(N'1990-01-19' AS Date), 1, N'0975251204', N'yjov.zsinm@ydfdrq.org', CAST(N'1962-10-04 17:40:26.330' AS DateTime), 29)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (411, N'Ðồng Dao', CAST(N'1953-09-03' AS Date), 1, N'0905479061', N'haah.karz@fqkpev.com', CAST(N'1978-04-04 19:37:10.660' AS DateTime), 51)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (412, N'Ðức Huy', CAST(N'1966-11-12' AS Date), 1, N'0942591791', N'isruwl34@oaqinnyx.rqnpaw.org', CAST(N'1982-01-13 06:46:22.450' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (413, N'Hòa Hợp', CAST(N'1970-12-31' AS Date), 1, N'0903813646', N'qzwho.jflhqz@yqefzb.org', CAST(N'1957-02-28 02:01:37.770' AS DateTime), 55)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (414, N'Nguyệt Ánh', CAST(N'1977-08-12' AS Date), 1, N'0985366048', N'xmyqb759@ley-ja.net', CAST(N'2020-06-18 09:43:32.080' AS DateTime), 83)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (415, N'Thanh Nhung', CAST(N'1981-06-08' AS Date), 1, N'0981308238', N'cqhpzjq.qhro@uqzn.-qsqg-.net', CAST(N'1967-07-31 12:56:17.760' AS DateTime), 58)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (416, N'Minh Diệu', CAST(N'2000-08-30' AS Date), 1, N'0908456070', N'sfvyd.heirrn@yrbd.fcjkns.org', CAST(N'1959-12-22 16:33:51.600' AS DateTime), 62)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (417, N'Bích San', CAST(N'1976-01-24' AS Date), 1, N'0989172217', N'yqizpw7@tsrqhi.sssuye.net', CAST(N'1975-04-14 14:50:15.210' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (418, N'Hướng Tiền', CAST(N'1969-04-25' AS Date), 1, N'0907655220', N'movlj13@rbpafc.org', CAST(N'2001-07-13 19:50:40.740' AS DateTime), 34)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (419, N'Ngọc Quỳnh', CAST(N'1958-09-07' AS Date), 1, N'0929567573', N'klpncc.psdr@zjrwjzdho.bhptbr.com', CAST(N'2005-02-14 15:27:26.590' AS DateTime), 43)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (420, N'Hoàng Phát', CAST(N'1963-02-04' AS Date), 1, N'0943929605', N'qsmex3@xlevwo.org', CAST(N'1957-05-18 05:04:06.580' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (421, N'Quỳnh Hương', CAST(N'1997-05-16' AS Date), 1, N'0941808062', N'jkuijcx74@xemakq.net', CAST(N'1983-06-21 05:45:37.380' AS DateTime), 84)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (422, N'Tiến Hoạt', CAST(N'1967-02-24' AS Date), 1, N'0935312514', N'qdaitk240@hbwgii.org', CAST(N'1956-09-24 14:59:59.740' AS DateTime), 20)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (423, N'Bảo Bảo', CAST(N'1980-07-06' AS Date), 1, N'0951160947', N'qywrn.sumyittgt@sueejl.-pcqta.org', CAST(N'1999-07-17 00:45:45.560' AS DateTime), 35)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (424, N'Hồ Diệp', CAST(N'1998-09-03' AS Date), 1, N'0968795937', N'wzedqg@zbhcovd.sqmllp.com', CAST(N'1984-05-13 03:02:35.650' AS DateTime), 26)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (425, N'Trung Nghĩa', CAST(N'1961-04-27' AS Date), 1, N'0911040544', N'mkdbakr.tbpj@ytrjjbyb.mmiq-j.com', CAST(N'1987-05-09 20:14:59.820' AS DateTime), 90)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (426, N'Lộc Uyển', CAST(N'1957-05-18' AS Date), 1, N'0952031554', N'shuatj3@utnxiios.fagnhv.com', CAST(N'2014-01-05 08:59:08.930' AS DateTime), 9)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (427, N'Quốc Thành', CAST(N'1956-12-04' AS Date), 0, N'0977195179', N'bbunfm.pifkguzoth@o-hlrt.com', CAST(N'2006-12-30 23:32:22.650' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (428, N'Thục Uyên', CAST(N'1971-02-22' AS Date), 1, N'0933037569', N'agrxu.irrogqv@ihnkbs.net', CAST(N'1978-11-02 12:47:29.490' AS DateTime), 92)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (429, N'Thiên Trang', CAST(N'1978-01-06' AS Date), 0, N'0901062519', N'hozativm03@pigqwa.net', CAST(N'1968-06-11 18:04:32.480' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (430, N'Thanh Tâm', CAST(N'1977-03-23' AS Date), 0, N'0922624046', N'jthhckf.hlqpgxm@wbciti.com', CAST(N'2007-10-08 08:00:59.940' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (431, N'Thanh Ðạo', CAST(N'1953-11-29' AS Date), 1, N'0972696111', N'reelwsia742@fstxzrjl.anepd-.net', CAST(N'1962-10-05 06:16:28.390' AS DateTime), 64)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (432, N'Hồng Thúy', CAST(N'1971-01-18' AS Date), 1, N'0971456225', N'xasb.lthpcstecl@qzljjh.net', CAST(N'1983-01-26 03:28:11.450' AS DateTime), 4)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (433, N'Phúc Hòa', CAST(N'1960-04-29' AS Date), 0, N'0930558664', N'kinswdf.gsflqie@gs-wku.net', CAST(N'1976-04-26 01:21:42.430' AS DateTime), 95)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (434, N'Mạnh Ðình', CAST(N'1955-12-01' AS Date), 1, N'0970908049', N'jzmnqji1@tynxqv.pl-rgr.org', CAST(N'1973-11-05 10:39:49.230' AS DateTime), 37)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (435, N'Ngọc Yến', CAST(N'1956-05-29' AS Date), 1, N'0961495043', N'zjnwsxpt96@byey.iiebfp.org', CAST(N'2001-07-11 05:39:56.210' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (436, N'Mỹ Thuận', CAST(N'1983-04-25' AS Date), 0, N'0906540860', N'tjievijj256@hoqgjtlb.ioyrtf.org', CAST(N'1984-09-23 03:47:27.230' AS DateTime), 89)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (437, N'Ngọc Cảnh', CAST(N'1967-02-16' AS Date), 1, N'0941492243', N'qswjxee@uykled.net', CAST(N'1996-06-04 17:59:35.510' AS DateTime), 54)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (438, N'Khôi Vĩ', CAST(N'1993-06-30' AS Date), 1, N'0927341755', N'pjslii.gkrpu@xxguki.com', CAST(N'1983-05-28 17:38:07.040' AS DateTime), 45)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (439, N'Thái Lan', CAST(N'1964-08-27' AS Date), 1, N'0994541486', N'jglg.ctnw@yxgnab.com', CAST(N'1981-11-16 02:17:06.750' AS DateTime), 31)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (440, N'Ngọc Thi', CAST(N'1974-12-22' AS Date), 1, N'0913003749', N'wixf.noyj@bjiewb.org', CAST(N'1976-03-31 11:06:52.110' AS DateTime), 38)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (441, N'Quốc Trung', CAST(N'1994-05-25' AS Date), 1, N'0927825102', N'eqet096@h-pbah.org', CAST(N'1985-04-23 01:28:46.530' AS DateTime), 29)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (442, N'Hồng Lĩnh', CAST(N'1995-11-03' AS Date), 1, N'0946589447', N'pknudjm.ocqzvls@edtxnxfq.emggwr.net', CAST(N'1981-08-23 11:42:52.760' AS DateTime), 93)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (443, N'Diễm Thư', CAST(N'1987-11-13' AS Date), 1, N'0900000542', N'mqwak.mkoctm@wwdbor.net', CAST(N'2012-11-25 21:03:23.480' AS DateTime), 49)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (444, N'Cao Nguyên', CAST(N'1967-06-18' AS Date), 1, N'0991359192', N'pnehc29@ybjdundl.jbwrpp.com', CAST(N'1978-05-01 14:31:14.510' AS DateTime), 50)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (445, N'Hồng Liêm', CAST(N'1966-06-07' AS Date), 0, N'0956943874', N'spfypag.infdicohq@siokgt.org', CAST(N'1954-11-20 14:51:33.990' AS DateTime), 73)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (446, N'Thu Loan', CAST(N'1999-07-05' AS Date), 1, N'0923466514', N'qnrmwx.zgjadqpf@zazhjz.net', CAST(N'2010-09-24 09:45:36.090' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (447, N'Cam Thảo', CAST(N'1988-03-20' AS Date), 1, N'0972628201', N'rjat.utwsq@gvsobhu.buivau.org', CAST(N'1990-01-03 09:37:51.710' AS DateTime), 42)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (448, N'Minh Sơn', CAST(N'1993-09-15' AS Date), 1, N'0938638658', N'idstyf25@jtwoov.net', CAST(N'1978-08-25 09:56:25.490' AS DateTime), 34)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (449, N'Thu Việt', CAST(N'1988-07-06' AS Date), 0, N'0976612551', N'hsisyoo.yqbpgo@hl-qhi.com', CAST(N'2007-01-24 03:12:41.870' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (450, N'Mỹ Xuân', CAST(N'1994-03-03' AS Date), 1, N'0962574522', N'oyjxt09@vzujrp.hxlqce.org', CAST(N'1990-05-21 05:59:03.640' AS DateTime), 30)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (451, N'Diệu Hiền', CAST(N'1958-11-07' AS Date), 1, N'0912863274', N'hjtoz@peqxqj.org', CAST(N'1996-08-19 14:44:58.450' AS DateTime), 30)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (452, N'Xuân Huy', CAST(N'1959-11-06' AS Date), 1, N'0938470753', N'aytyn06@gxvdpd.xgjfez.org', CAST(N'1973-07-17 03:58:50.650' AS DateTime), 24)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (453, N'Hoàng Xuân', CAST(N'1987-05-03' AS Date), 1, N'0935007634', N'tlyvqol257@jmiifr.com', CAST(N'1978-09-23 12:38:57.550' AS DateTime), 37)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (454, N'Mạnh Cường', CAST(N'1959-05-15' AS Date), 0, N'0955411573', N'bburm.ustydjxdu@vwswakgqx.wwthwy.com', CAST(N'1984-05-06 14:08:51.820' AS DateTime), 37)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (455, N'Công Hoán', CAST(N'1988-02-13' AS Date), 0, N'0920234801', N'aybs.nuupxnjo@wqbe-j.com', CAST(N'2001-04-01 17:46:33.840' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (456, N'Thuần Hậu', CAST(N'1956-01-05' AS Date), 1, N'0948272078', N'vixw2@fulzcb.ifqqsj.com', CAST(N'2012-01-10 23:12:12.820' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (457, N'Anh Khải', CAST(N'1957-10-01' AS Date), 1, N'0991523841', N'yolgwfw.fxmkrue@zdumguo.vutuck.net', CAST(N'1976-09-17 01:36:02.180' AS DateTime), 80)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (458, N'Thủy Tâm', CAST(N'1965-04-25' AS Date), 1, N'0912690713', N'xmeboh971@qllhfj.com', CAST(N'2007-11-29 02:34:27.570' AS DateTime), 27)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (459, N'Việt Thanh', CAST(N'1956-03-22' AS Date), 1, N'0949020538', N'mhqrdj@lrvuhz.org', CAST(N'1983-12-22 05:07:04.920' AS DateTime), 63)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (460, N'Giao Hưởng', CAST(N'1954-03-24' AS Date), 1, N'0968333377', N'suqo9@iglx-k.org', CAST(N'2020-08-09 08:34:30.800' AS DateTime), 99)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (461, N'Xuân Hàm', CAST(N'1980-04-23' AS Date), 1, N'0900749299', N'eojlyg779@dmbi.oyyv-r.com', CAST(N'1985-03-11 00:09:55.530' AS DateTime), 65)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (462, N'Hòa Giang', CAST(N'1976-10-04' AS Date), 1, N'0965845972', N'tqgelgvj94@khtwbo.org', CAST(N'2007-04-10 15:10:51.610' AS DateTime), 61)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (463, N'Huyền Thư', CAST(N'1975-04-21' AS Date), NULL, N'0967108428', N'ukpiwbm6@npyoi.hmzadv.net', CAST(N'1989-05-15 06:27:04.540' AS DateTime), 43)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (464, N'Trúc Quân', CAST(N'1994-03-11' AS Date), 1, N'0957831241', N'npbdqvwo.ocktx@flz-vi.org', CAST(N'2019-01-21 22:33:49.680' AS DateTime), 77)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (465, N'Gia Vinh', CAST(N'1989-02-20' AS Date), 0, N'0950083066', N'khvftg.vowgjbex@bzegno.org', CAST(N'2020-12-30 11:23:57.950' AS DateTime), 7)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (466, N'Thành Ý', CAST(N'1983-09-24' AS Date), 1, N'0971236030', N'yjzargvp0@pvspfbooe.aabgfi.org', CAST(N'2016-03-09 16:08:59.220' AS DateTime), 45)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (467, N'Thanh Vân', CAST(N'1959-07-17' AS Date), 0, N'0910132083', N'gbpik@kuwqxq.com', CAST(N'1958-09-20 05:24:40.020' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (468, N'Vy Lam', CAST(N'1968-02-01' AS Date), 1, N'0903359462', N'dnriop.bxzpz@atufmg.com', CAST(N'2004-04-24 15:21:48.550' AS DateTime), 9)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (469, N'Diệu Diệu', CAST(N'1974-03-17' AS Date), 0, N'0988404104', N'uildtiq47@mlsma.hmuhqw.com', CAST(N'1971-12-10 04:03:35.860' AS DateTime), 6)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (470, N'Ðức Tường', CAST(N'1999-03-24' AS Date), 1, N'0912189023', N'wckd2@clvllt.com', CAST(N'2003-11-07 09:08:50.540' AS DateTime), 57)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (471, N'Ngọc Nhi', CAST(N'1986-07-15' AS Date), 0, N'0911899985', N'gmkpicum.uaauggntba@kppkoz.bwteej.com', CAST(N'1984-07-18 22:34:16.100' AS DateTime), 13)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (472, N'Quảng Ðại', CAST(N'1983-09-02' AS Date), 0, N'0902177374', N'fnapqnpl.ifpysspusc@ymugpf.org', CAST(N'2012-11-16 21:12:08.170' AS DateTime), 48)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (473, N'Sỹ Phú', CAST(N'1957-08-30' AS Date), 0, N'0961593747', N'vkxc046@dskftp.org', CAST(N'1972-08-28 17:33:33.980' AS DateTime), 2)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (474, N'Thanh Diệu', CAST(N'1984-10-23' AS Date), 1, N'0902333634', N'bpkrhifp.jxjka@imqm.dbthqg.com', CAST(N'1981-11-17 04:20:34.480' AS DateTime), 43)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (475, N'Thu Việt', CAST(N'1969-10-19' AS Date), NULL, N'0949941880', N'arlczgk.ubpnqi@tsgildn.jkgxzr.net', CAST(N'1993-01-25 03:35:20.060' AS DateTime), 15)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (476, N'Kim Thanh', CAST(N'1954-07-15' AS Date), 0, N'0953470485', N'gtrlhlut6@dnuqww.com', CAST(N'1954-10-29 18:02:44.620' AS DateTime), 71)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (477, N'Trang Nhã', CAST(N'1980-05-20' AS Date), 0, N'0951705287', N'ypoykpu@cngwqp.org', CAST(N'1964-10-29 17:56:36.270' AS DateTime), 72)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (478, N'Hoài Diệu', CAST(N'1966-01-19' AS Date), 1, N'0997954213', N'xmdslyu@bujugd.org', CAST(N'1974-03-18 10:14:31.040' AS DateTime), 88)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (479, N'Việt Hải', CAST(N'1985-03-30' AS Date), 0, N'0922971359', N'wwzqjd.jxrdato@vwczpi.net', CAST(N'1982-06-24 12:11:01.660' AS DateTime), 43)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (480, N'Hải Vy', CAST(N'1962-12-01' AS Date), 1, N'0962285737', N'oniss.ochmyw@wlkifi.org', CAST(N'1997-08-15 10:29:23.730' AS DateTime), 4)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (481, N'Hùng Phong', CAST(N'1970-04-07' AS Date), 1, N'0933375358', N'gsalhzn00@ftqwyp.net', CAST(N'1977-01-02 23:21:17.220' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (482, N'Đức Hòa', CAST(N'1964-04-28' AS Date), 1, N'0929926685', N'ctychg.argieczso@obzvvy.qsulht.org', CAST(N'1981-05-08 13:35:57.150' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (483, N'Cao Sĩ', CAST(N'1983-09-26' AS Date), 0, N'0927044682', N'dzbj9@ltmldty.n-jkcx.org', CAST(N'1992-10-09 09:34:47.630' AS DateTime), 23)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (484, N'Gia Cần', CAST(N'1984-12-13' AS Date), 0, N'0900221798', N'hpvkpjnb@ejwozn.com', CAST(N'1999-01-22 12:05:28.850' AS DateTime), 41)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (485, N'Thu Việt', CAST(N'1971-05-18' AS Date), 1, N'0915662203', N'lonzwdts.acxetde@bfkeet.org', CAST(N'1964-02-19 17:16:01.490' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (486, N'Tuyết Anh', CAST(N'1995-03-02' AS Date), 1, N'0944659931', N'ddvkpmas.wompuetxxt@tkjqiw.iheozp.com', CAST(N'2010-03-21 02:17:37.740' AS DateTime), 55)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (487, N'Công Hải', CAST(N'1984-10-24' AS Date), 1, N'0928978284', N'ckqxmabi44@hwncnkk.yddsjt.com', CAST(N'1957-05-05 14:49:13.900' AS DateTime), 8)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (488, N'Ðình Ðôn', CAST(N'1953-12-17' AS Date), 1, N'0910712867', N'mzfc.hwoqrch@lsxz.bwcdq-.com', CAST(N'2012-12-20 11:12:50.610' AS DateTime), 48)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (489, N'Hữu Hiệp', CAST(N'1968-11-24' AS Date), 0, N'0966574164', N'ttqhrc.fftvpqo@hurhsz.com', CAST(N'1993-08-05 16:53:15.390' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (490, N'Tú Quỳnh', CAST(N'1953-05-25' AS Date), 0, N'0985028077', N'hxpwb0@uzkkei.org', CAST(N'2010-07-01 06:27:43.390' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (491, N'Mỹ Lan', CAST(N'1978-07-26' AS Date), 1, N'0904737759', N'neeulig27@uenkfirdu.utnuxh.net', CAST(N'1961-01-07 02:11:25.040' AS DateTime), 25)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (492, N'Thiện Sinh', CAST(N'1954-10-25' AS Date), 0, N'0912188206', N'jzmlhp26@kgrb-u.net', CAST(N'2009-07-07 15:25:07.940' AS DateTime), 5)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (493, N'Nhật Hạ', CAST(N'1990-04-11' AS Date), 1, N'0934480340', N'zaqctbka.idlqkdo@xxta.nsrnbk.net', CAST(N'2020-06-06 12:31:02.130' AS DateTime), 86)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (494, N'Quang Hòa', CAST(N'1963-06-06' AS Date), 1, N'0968174586', N'kwpjiksg57@quwnorx.bfzpn-.com', CAST(N'1982-04-08 17:42:35.960' AS DateTime), 36)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (495, N'Nhật Nam', CAST(N'1995-10-08' AS Date), 1, N'0923882575', N'xmtg.bbudpqt@hubcxrpw.ektjit.net', CAST(N'2012-01-21 10:56:56.580' AS DateTime), 15)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (496, N'Khắc Công', CAST(N'1970-08-21' AS Date), 0, N'0969682253', N'whobz@vskcg.r-svmy.com', CAST(N'1999-01-13 10:17:54.920' AS DateTime), 35)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (497, N'Hồng Bạch Thảo', CAST(N'1973-07-15' AS Date), 0, N'0942339788', N'iprbhur.hytlwdhthz@wmay.biqyis.com', CAST(N'2013-04-10 05:15:48.230' AS DateTime), 12)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (498, N'Kiều Nương', CAST(N'1994-10-12' AS Date), 1, N'0923869298', N'fmizmhbd.envuwlbfyh@drddria.xeiirq.net', CAST(N'2014-11-04 22:29:33.800' AS DateTime), 53)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (499, N'Uyên My', CAST(N'1979-06-04' AS Date), 1, N'0965190417', N'vrcsf@imfweud.siqwhp.net', CAST(N'1978-05-02 03:07:16.560' AS DateTime), 8)
GO
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (500, N'Thanh Hiếu', CAST(N'1983-10-22' AS Date), 1, N'0928682024', N'nfzemdfl21@uvrujv.net', CAST(N'1959-09-12 22:42:34.780' AS DateTime), NULL)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (501, N'Bảo Ðịnh', CAST(N'1992-12-19' AS Date), 1, N'0998319345', N'tkfpyii.bjqrcwg@ftoumz.org', CAST(N'2005-01-05 04:20:56.060' AS DateTime), 86)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (502, N'Hải Dương', CAST(N'1973-02-17' AS Date), 1, N'0940948488', N'oueogx45@dxcixe.net', CAST(N'2006-09-10 18:16:03.160' AS DateTime), 78)
INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Date_Of_Birth], [Gender], [Phone_Number], [Email], [Created_Date], [Account_ID]) VALUES (503, N'Ngọc Minh', CAST(N'1972-07-01' AS Date), 1, N'0905181166', N'qryl.pbszxgnmt@yvkijp.org', CAST(N'1959-09-17 05:52:49.620' AS DateTime), 40)
