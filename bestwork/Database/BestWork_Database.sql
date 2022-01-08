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
