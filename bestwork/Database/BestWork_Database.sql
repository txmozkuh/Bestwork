USE [master]
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
