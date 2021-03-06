USE [master]
GO
/****** Object:  Database [ViewNews]    Script Date: 2020/9/8 15:50:56 ******/
CREATE DATABASE [ViewNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ViewNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ViewNews.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ViewNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ViewNews_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ViewNews] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ViewNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ViewNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ViewNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ViewNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ViewNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ViewNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [ViewNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ViewNews] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ViewNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ViewNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ViewNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ViewNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ViewNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ViewNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ViewNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ViewNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ViewNews] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ViewNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ViewNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ViewNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ViewNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ViewNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ViewNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ViewNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ViewNews] SET RECOVERY FULL 
GO
ALTER DATABASE [ViewNews] SET  MULTI_USER 
GO
ALTER DATABASE [ViewNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ViewNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ViewNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ViewNews] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ViewNews', N'ON'
GO
USE [ViewNews]
GO
/****** Object:  Table [dbo].[ECCLike]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ECCLike](
	[ECCLikeID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[EssayCommunCommentID] [int] NOT NULL,
 CONSTRAINT [PK_ECCLike] PRIMARY KEY CLUSTERED 
(
	[ECCLikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ECCReport]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ECCReport](
	[ECCReportID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[EssayCommunCommentID] [int] NOT NULL,
 CONSTRAINT [PK_ECCReport] PRIMARY KEY CLUSTERED 
(
	[ECCReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Editor]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editor](
	[EditorID] [int] IDENTITY(1,1) NOT NULL,
	[EditorAccount] [nvarchar](50) NOT NULL,
	[EditorPwd] [nvarchar](50) NOT NULL,
	[EditorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Editor] PRIMARY KEY CLUSTERED 
(
	[EditorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EssayCommun]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EssayCommun](
	[EssayCommunID] [int] IDENTITY(1,1) NOT NULL,
	[ECTitle] [nvarchar](50) NOT NULL,
	[ECContent] [nvarchar](max) NOT NULL,
	[ECState] [int] NOT NULL,
	[ECClick] [int] NOT NULL,
	[ECReturns] [nvarchar](50) NULL,
	[ECTime] [datetime] NOT NULL,
	[NewsUserID] [int] NOT NULL,
 CONSTRAINT [PK_EssayCommun] PRIMARY KEY CLUSTERED 
(
	[EssayCommunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EssayCommunComment]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EssayCommunComment](
	[EssayCommunCommentID] [int] IDENTITY(1,1) NOT NULL,
	[EssayCommunID] [int] NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[ECCContent] [nvarchar](max) NOT NULL,
	[ECCTime] [datetime] NOT NULL,
	[ECCLike] [int] NULL,
	[ECCReport] [int] NULL,
	[ECCCID] [int] NULL,
 CONSTRAINT [PK_EssayCommunComment] PRIMARY KEY CLUSTERED 
(
	[EssayCommunCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EssayCommunFalse]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EssayCommunFalse](
	[EssayCommunFalseID] [int] IDENTITY(1,1) NOT NULL,
	[ECFTitle] [nvarchar](50) NULL,
	[ECFContent] [nvarchar](max) NULL,
	[ECFState] [int] NULL,
	[ECFClick] [int] NULL,
	[ECFReturns] [nvarchar](50) NULL,
	[ECFTime] [datetime] NULL,
	[NewsUserID] [int] NULL,
 CONSTRAINT [PK_EssayCommunFalse] PRIMARY KEY CLUSTERED 
(
	[EssayCommunFalseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NCLike]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCLike](
	[NCLikeID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[NewsCommentID] [int] NOT NULL,
 CONSTRAINT [PK_NCLike] PRIMARY KEY CLUSTERED 
(
	[NCLikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NCReport]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCReport](
	[NCReportID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[NewsCommentID] [int] NOT NULL,
 CONSTRAINT [PK_NCReport] PRIMARY KEY CLUSTERED 
(
	[NCReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [nvarchar](50) NOT NULL,
	[NewsImage] [nvarchar](50) NOT NULL,
	[NewsContent] [nvarchar](max) NOT NULL,
	[NewsTime] [datetime] NOT NULL,
	[NewsClick] [int] NOT NULL,
	[EditorID] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsComment]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsComment](
	[NewsCommentID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[NCContent] [nvarchar](max) NOT NULL,
	[NCTime] [datetime] NOT NULL,
	[NCLike] [int] NULL,
	[NCReport] [int] NULL,
	[NCID] [int] NULL,
 CONSTRAINT [PK_NewsComment] PRIMARY KEY CLUSTERED 
(
	[NewsCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsFalse]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsFalse](
	[NewsFalseID] [int] IDENTITY(1,1) NOT NULL,
	[NewsFalseTitle] [nvarchar](50) NULL,
	[NewsFalseImage] [nvarchar](50) NULL,
	[NewsFalseContent] [nvarchar](max) NULL,
	[NewsFalseTime] [datetime] NULL,
	[NewsFalseClick] [int] NULL,
	[EditorID] [int] NULL,
 CONSTRAINT [PK_NewsFalse] PRIMARY KEY CLUSTERED 
(
	[NewsFalseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsUser]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsUser](
	[NewsUserID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserAccount] [varchar](50) NOT NULL,
	[NewsUserPwd] [nvarchar](50) NOT NULL,
	[NewsUserName] [nvarchar](20) NOT NULL,
	[NewsUserImage] [nvarchar](50) NULL,
	[NewsUserSex] [nvarchar](10) NULL,
	[NewsUserMotto] [nvarchar](100) NULL,
 CONSTRAINT [PK_NewsUser] PRIMARY KEY CLUSTERED 
(
	[NewsUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WCCLike]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WCCLike](
	[WCCLikeID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[WriterCommunCommentID] [int] NOT NULL,
 CONSTRAINT [PK_WCCLike] PRIMARY KEY CLUSTERED 
(
	[WCCLikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WCCReport]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WCCReport](
	[WCCReportID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[WriterCommunCommentID] [int] NOT NULL,
 CONSTRAINT [PK_WCCReport] PRIMARY KEY CLUSTERED 
(
	[WCCReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Writer]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writer](
	[WriterID] [int] IDENTITY(1,1) NOT NULL,
	[WriterName] [nvarchar](20) NOT NULL,
	[WriterImage] [nvarchar](50) NOT NULL,
	[WriterPosition] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Writer] PRIMARY KEY CLUSTERED 
(
	[WriterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WriterCommun]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WriterCommun](
	[WriterCommunID] [int] IDENTITY(1,1) NOT NULL,
	[WCTitle] [nvarchar](50) NOT NULL,
	[WCImage] [nvarchar](50) NOT NULL,
	[WCContent] [nvarchar](max) NOT NULL,
	[WCTime] [datetime] NOT NULL,
	[WCClick] [int] NOT NULL,
	[WriterID] [int] NOT NULL,
	[EditorID] [int] NOT NULL,
 CONSTRAINT [PK_WriterCommun] PRIMARY KEY CLUSTERED 
(
	[WriterCommunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WriterCommunComment]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WriterCommunComment](
	[WriterCommunCommentID] [int] IDENTITY(1,1) NOT NULL,
	[WriterCommunID] [int] NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[WCCContent] [nvarchar](max) NOT NULL,
	[WCCTime] [datetime] NOT NULL,
	[WCCLike] [int] NULL,
	[WCCReport] [int] NULL,
	[WCCID] [int] NULL,
 CONSTRAINT [PK_WriterCommunComment] PRIMARY KEY CLUSTERED 
(
	[WriterCommunCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WriterCommunFalse]    Script Date: 2020/9/8 15:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WriterCommunFalse](
	[WriterCommunFalseID] [int] IDENTITY(1,1) NOT NULL,
	[WCFTitle] [nvarchar](50) NULL,
	[WCFImage] [nvarchar](50) NULL,
	[WCFContent] [nvarchar](max) NULL,
	[WCFTime] [datetime] NULL,
	[WCFClick] [int] NULL,
	[WriterID] [int] NULL,
	[EditorID] [int] NULL,
 CONSTRAINT [PK_WriterCommunFalse] PRIMARY KEY CLUSTERED 
(
	[WriterCommunFalseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ECCLike] ON 

INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (1, 1, 6)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (2, 1, 8)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (3, 1, 7)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (4, 1, 4)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (5, 1, 5)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (6, 1, 3)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (7, 1, 1)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (8, 1, 2)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (9, 2, 10)
INSERT [dbo].[ECCLike] ([ECCLikeID], [NewsUserID], [EssayCommunCommentID]) VALUES (10, 2, 22)
SET IDENTITY_INSERT [dbo].[ECCLike] OFF
SET IDENTITY_INSERT [dbo].[ECCReport] ON 

INSERT [dbo].[ECCReport] ([ECCReportID], [NewsUserID], [EssayCommunCommentID]) VALUES (1, 1, 7)
INSERT [dbo].[ECCReport] ([ECCReportID], [NewsUserID], [EssayCommunCommentID]) VALUES (2, 1, 9)
INSERT [dbo].[ECCReport] ([ECCReportID], [NewsUserID], [EssayCommunCommentID]) VALUES (3, 2, 22)
SET IDENTITY_INSERT [dbo].[ECCReport] OFF
SET IDENTITY_INSERT [dbo].[Editor] ON 

INSERT [dbo].[Editor] ([EditorID], [EditorAccount], [EditorPwd], [EditorName]) VALUES (1, N'xzp', N'123456', N'谢震鹏')
INSERT [dbo].[Editor] ([EditorID], [EditorAccount], [EditorPwd], [EditorName]) VALUES (2, N'zhoupeng7', N'1234567', N'周朋改')
INSERT [dbo].[Editor] ([EditorID], [EditorAccount], [EditorPwd], [EditorName]) VALUES (3, N'zhoupen', N'123456', N'周朋改')
INSERT [dbo].[Editor] ([EditorID], [EditorAccount], [EditorPwd], [EditorName]) VALUES (4, N'xiuxin', N'123456', N'刘鑫')
INSERT [dbo].[Editor] ([EditorID], [EditorAccount], [EditorPwd], [EditorName]) VALUES (5, N'zxcvbn', N'123456', N'谢意')
INSERT [dbo].[Editor] ([EditorID], [EditorAccount], [EditorPwd], [EditorName]) VALUES (6, N'xzp663', N'123456', N'谢好')
SET IDENTITY_INSERT [dbo].[Editor] OFF
SET IDENTITY_INSERT [dbo].[EssayCommun] ON 

INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (1, N'几个的裤衩改', N'我是谁', 3, 5, NULL, CAST(0x0000ABEC01032888 AS DateTime), 1)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (3, N'第二次测试', N'<p>文章测试</p>', 0, 0, NULL, CAST(0x0000ABEC0104BE00 AS DateTime), 1)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (4, N'第三次测试', N'这里要改成富文本的士大夫首发式上发过法国', 3, 0, NULL, CAST(0x0000ABEC0105251D AS DateTime), 1)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (5, N'第四次测试', N'这里要改成富文本的灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌', 3, 6, NULL, CAST(0x0000ABEC010575FB AS DateTime), 1)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (6, N'有有有有有有有有有有有有有有有有有有有', N'斤斤计较急急急急急急急急急急急急急急急', 3, 0, NULL, CAST(0x0000ABEF00C08E16 AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (7, N'怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕', N'日日日日日日日日日日日日日日日日日日日', 3, 24, NULL, CAST(0x0000ABEF00C0A123 AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (8, N'呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃', N'这不啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵', 3, 3, NULL, CAST(0x0000ABEF00C0ABFD AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (9, N'顶顶顶顶顶顶顶改', N'这里要改成富文本的顶顶顶顶顶顶顶顶顶顶改', 3, 10, NULL, CAST(0x0000ABF00094B90C AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (10, N'再次测试', N'<p>这里要改成富<img src="http://img.baidu.com/hi/jx2/j_0069.gif"/>啥地方啥地方<img src="/Content/fuwenben/20200708/15941698054665281.JPG" title="会员卡.JPG" alt="会员卡.JPG" width="513" height="135"/></p>', 2, 2, NULL, CAST(0x0000ABF000986BEC AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (11, N'用户 发表 文章富文本', N'<p>阿三顶顶顶<em>顶顶<span style="font-family: 楷体, 楷体_GB2312, SimKai;">顶顶</span></em><span style="font-family: 楷体, 楷体_GB2312, SimKai;">顶顶顶顶顶顶顶顶顶顶</span><br/></p>', 0, 2, NULL, CAST(0x0000ABF200932926 AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (12, N'安兔兔遭谷歌封杀，被视为间谍软件', N'<p style="text-indent: 2em;">7月7日消息，谷歌商店此前下架了性能测试应用安兔兔，现在谷歌Play Protect安全平台更进一步，将该应用视为危险产品，并试图阻止用户安装它。</p><p><br/></p><p style="text-indent: 2em;">
	据外媒SlashGear报道，经过谷歌认证的设备如果安装安兔兔，会弹出警告，明确指出Google Play 
Protect认为安兔兔是一款间谍软件；如果用户通过访问安兔兔官网进行APK下载，也将会收到醒目的红色警告，告知该网站含有有害应用；如果用户试图通过第三方网站下载时，在安装APK时也会弹出另一个警告。</p><p style="text-indent: 2em;"><br/></p><p>
	</p><p style="text-indent: 2em; text-align: center;"><img src="/Content/fuwenben/20200708/15942122353700819.jpg" title="20200708131900963.jpg" width="711" height="342"/></p><p style="text-indent: 2em;"><br/></p><p></p><p style="text-indent: 2em;">
	目前造成这样的原因尚不明确，但是安装较早版本的安兔兔不会收到警告提示，谷歌似乎只对新版安兔兔软件采取了阻止的行为。目前尚不清楚谷歌Play Protect的判断标准。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	今年早些时候，安兔兔被谷歌商店下架，原因是谷歌在对国内公司猎豹移动的相关应用普查时，发现涉嫌包含间谍软件和隐藏的跟踪功能，而后者是安兔兔的股东之一。启信宝显示，股权穿透后，猎豹的持股比例达到了85%。</p><p style="text-indent: 2em;"><br/></p><p>
	</p><p style="text-indent: 2em; text-align: center;"><img src="/Content/fuwenben/20200708/15942122352432309.jpg" title="20200708132606409.jpg"/></p><p style="text-indent: 2em;"><br/></p><p></p><p style="text-indent: 2em;">
	今年2月，谷歌单方面解除了与猎豹移动的合作，并且全面下线其在谷歌商城中的产品，猎豹移动的Google Play Store、Google AdMob和Google AdManager帐户被禁用。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	目前，猎豹移动尚未找到新的合作伙伴来接替谷歌的位置。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	由于被谷歌全面封杀，猎豹移动的一季报出现了断崖式下降。6月10日，猎豹移动发布了2020年第一季度未经审计的财务报告，今年第一季度，猎豹移动总营收5.281亿元，同比下降51.4%，剔除直播业务LiveMe收入后，一季度总收入同比下降36.4%。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	其中归属于猎豹移动股东的净利润为亏损1.046亿元，去年同期盈利710万元；非美国通用会计准则下，净亏损为9770万元，去年同期盈利3380万元。</p><p style="text-indent: 2em;"><br/></p><p>
	</p><p style="text-indent: 2em; text-align: center;"><img src="/Content/fuwenben/20200708/15942122353260404.jpg" title="20200708133201912.jpg"/></p><p style="text-indent: 2em;"><br/></p><p></p><p style="text-indent: 2em;">
	从收入构成来看，一季度，猎豹移动在国内市场的移动实用产品业务收入6210万元，同比下降75.4%，主要是疫情影响导致国内在线广告和营销预算减少所致；同期，公司在海外市场的移动实用产品业务收入5430万元，同比下降62.6%，这主要是由于自2020年2月份以来猎豹与谷歌的广告合作中断所致。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	当时，猎豹移动董事长兼CEO傅盛表示，公司将继续大力发展AI新零售等核心AI业务，为公司构建长期增长引擎。在接下来的几个季度，会把商场机器人的商业变现作为工作重点。</p><p><br/></p>', 2, 0, NULL, CAST(0x0000ABF201567866 AS DateTime), 1)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (13, N'日本声优花泽香菜和小野贤章官宣婚讯，网友：我双向失恋了…', N'<p>7月8日中午，日本知名声优花泽香菜在其微博上发布官宣，宣告她和另一位日本声优小野贤章的婚讯，“小野贤章是一个不管在什么时候，都能乐观思考人生的人”“他总是温柔地带给我勇气”。同时，花泽香菜表示“希望大家能够给予我们祝福和支持”。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708132827584.png?imageView2/2/w/500/format/png" alt="500"/></p><p>2003年作为声优出道的花泽香菜为许多二次元粉丝所熟知，其配音代表作品包括《化物语》千石抚子、《我的妹妹哪有这么可爱！》黑猫/ 五更琉璃、《命运石之门》椎名真由理、《PSYCHO-PASS 心理测量者》常守朱等。</p><p style="text-align:left;">尤其是花泽香菜在《化物语》中所演唱的《恋爱循环》更是红极一时。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708134809139.jpeg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;">（日本知名声优、歌手、演员花泽香菜）</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708134702952.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;">（动漫《化物语》中千石抚子由花泽香菜配音）</p><p style="text-align:left;">小野贤章则于2001年作为声优出道，代表作品包括《黑子的篮球》黑子哲也、《游戏王ARC-V》榊游矢、《BORUTO -火影新世代》奈良鹿代、《JOJO的奇妙冒险：黄金之风》乔鲁诺·乔巴纳等。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708134022605.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;">（日本知名声优、歌手、演员小野贤章）</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708133455240.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;">（动漫《黑子的篮球》中黑子哲也由小野贤章配音）</p><p style="text-align:left;">网友在获知花泽香菜于小野贤章的婚讯后，纷纷大喊“青春结束了”，也有网友表示“我又少了一个老婆和老公”“双向失恋”。</p><p><br/></p>', 2, 7, NULL, CAST(0x0000ABF20156FA85 AS DateTime), 3)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (14, N'耿爽的履职简历，网友关注点全跑偏', N'<p style="text-align: center;">昨天（7日），耿爽履新中国常驻联合国副代表，收获了许多网友的祝福与鼓劲，希望他能在新的岗位上继续发光发热。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708075742125.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">这位前中国外交部发言人任职期间不光业务出色舌战群儒，还口吐莲花（额不是，划掉！），人称“行走的成语词典”，其独特的人格魅力更征服一众迷妹迷弟。</p><p style="text-align: center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080034541.gif?imageView2/2/w/500/format/jpg" alt="500"/><span style="cursor: pointer; position: absolute; left: 50%; top: 50%; margin-left: -17px; margin-top: -17px; width: 34px; height: 34px; background: rgba(0, 0, 0, 0) url(&quot;/static/imgs/playgif.png?20180606&quot;) repeat scroll 0% 0%;"></span></p><p style="text-align:center;">名场面：开过光的嘴</p><p style="text-align: center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080217529.gif?imageView2/2/w/500/format/jpg" alt="500"/><span style="cursor: pointer; position: absolute; left: 50%; top: 50%; margin-left: -17px; margin-top: -17px; width: 34px; height: 34px; background: rgba(0, 0, 0, 0) url(&quot;/static/imgs/playgif.png?20180606&quot;) repeat scroll 0% 0%;"></span></p><p style="text-align:center;">狂怼三连</p><p style="text-align: center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080548190.gif?imageView2/2/w/500/format/jpg" alt="500"/><span style="cursor: pointer; position: absolute; left: 50%; top: 50%; margin-left: -17px; margin-top: -17px; width: 34px; height: 34px; background: rgba(0, 0, 0, 0) url(&quot;/static/imgs/playgif.png?20180606&quot;) repeat scroll 0% 0%;"></span></p><p style="text-align:center;">“成语大王”警告</p><p style="text-align: center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080624600.gif?imageView2/2/w/500/format/jpg" alt="500"/><span style="cursor: pointer; position: absolute; left: 50%; top: 50%; margin-left: -17px; margin-top: -17px; width: 34px; height: 34px; background: rgba(0, 0, 0, 0) url(&quot;/static/imgs/playgif.png?20180606&quot;) repeat scroll 0% 0%;"></span></p><p style="text-align: center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080217668.gif?imageView2/2/w/500/format/jpg" alt="500"/><span style="cursor: pointer; position: absolute; left: 50%; top: 50%; margin-left: -17px; margin-top: -17px; width: 34px; height: 34px; background: rgba(0, 0, 0, 0) url(&quot;/static/imgs/playgif.png?20180606&quot;) repeat scroll 0% 0%;"></span></p><p style="text-align:center;">经典笑场</p><p style="text-align: center;">昨天各家媒体都报道了这条履新的新闻，看了耿爽的个人简介和证件照，网友们的关注点逐渐跑偏……</p><p style="text-align: center;">有吐槽证件照的；</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080916756.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708080932823.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081756907.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">最大槽点莫过于简历最后的这句“已婚有一女”；</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081119713.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081613494.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">虽然这是官员简历中都会公开的常规操作，但是广大迷妹们还是瞬间觉得自己“失恋”了……</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081349511.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708083005189.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708083817470.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">迷弟们兴奋了，“老丈人先喊起来”，好一个计划通……</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081703700.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">一个个的，几个花生米啊喝成这样。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081744542.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081745843.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">网友昵称都直接变了，“爽哥”变“耿叔”，已婚就是叔。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081840295.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081840841.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081840396.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align: center;">摸摸头不哭，家里还有华姐和坚哥。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708081822664.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708082337276.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/08/20200708082747477.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p>							
						</p><p><br/></p>', 2, 6, NULL, CAST(0x0000ABF201578973 AS DateTime), 2)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (15, N'东京大学3名学者曾致函湖北大学为梁艳萍发声，竟称校方处理是“非', N'<p>这两天很多人说起，东京大学文学部一研究室曾经向湖北大学校长发函，望其早日恢复该校文学院教师梁艳萍的名誉，引发诸多网友不满。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714103317116.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p>查了一下，在东大学校的官网的确有这封中日双语公开信，由文学部美学艺术学研究室的三名教授在今年6月26日发起，7月3日挂上官网。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714104624525.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p>6月20日湖北大学通报了对梁艳萍的处理情况，由于其在社交平台上多次发布、转发&quot;涉日&quot;&quot;涉港&quot;等错误言论，校方决定给予其开除党籍处分。经学校研究，还决定给予梁艳萍记过处分，取消其研究生导师资格，停止教学工作。</p><p>而对于湖北大学的正当处理结果，东京大学的这些教授们竟在信中将此形容成“非难”，甚至称赞梁艳萍的相关言论是“发自于真实的爱国情感”，祈祷她的名誉能早日得到恢复。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714105602239.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p>查询了一下过往新闻，梁艳萍应邀赴东大做客座研究员时，得到了小田部胤久、三浦俊彦、吉田宽等日本知名教授的肯定。</p><p>在她的邀请下，包括这些教授在内的许多日本学者都曾经来到湖北大学成为客座教授，定期授课、讲座。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714111249112.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;">图自湖北大学特色学科中国语言文学专业介绍</p><p style="text-align:left;">有网友在吉田宽的个人社交媒体下表示不满，并将梁艳萍的不当言论图文并茂地翻译出来。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714112751892.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:left;">看到留言信息的吉田宽回复称将会忒热退热退热贴重新考虑情况，并在一条新发动态中表示“梁艳萍事件”在国外报道中与中国国内实情有很大差距。</p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714112207475.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p style="text-align:center;"><img src="https://i.guancha.cn/bbs/2020/07/14/20200714112207819.jpg?imageView2/2/w/500/format/jpg" alt="500"/></p><p><br/></p><p>版权声明</p><p><br/></p>', 2, 2, NULL, CAST(0x0000ABF801315668 AS DateTime), 5)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (16, N'哈哈哈哈哈', N'<p>我的表示的方式<img src="/Content/fuwenben/20200721/15953214596252943.jpg" title="谢振鹏.jpg" alt="谢振鹏.jpg"/></p><p>糙米了的币</p>', 3, 1, NULL, CAST(0x0000ABFF0115B174 AS DateTime), 6)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (17, N'我第一次发表的文章已改', N'<p>感谢大家的观看，十分感谢，求通过<br/></p>', 2, 1, NULL, CAST(0x0000AD0200B5FD10 AS DateTime), 7)
INSERT [dbo].[EssayCommun] ([EssayCommunID], [ECTitle], [ECContent], [ECState], [ECClick], [ECReturns], [ECTime], [NewsUserID]) VALUES (18, N'视野新闻网真好,十分好', N'<p>我爱这个网站，他真是太好了，真的<br/></p>', 2, 1, NULL, CAST(0x0000AD0200BE6950 AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[EssayCommun] OFF
SET IDENTITY_INSERT [dbo].[EssayCommunComment] ON 

INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (1, 4, 1, N'这里要改成富文本的发射点发射点', CAST(0x0000ABED00A81A9A AS DateTime), 1, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (2, 4, 1, N'这里要改成富文本的给发射点发射点发', CAST(0x0000ABED00B8D3CA AS DateTime), 1, 0, 1)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (3, 4, 1, N'一楼', CAST(0x0000ABED00B90306 AS DateTime), 1, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (4, 4, 1, N'二楼', CAST(0x0000ABED00B91A3C AS DateTime), 1, 0, 3)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (5, 4, 1, N'三楼', CAST(0x0000ABED00B935FB AS DateTime), 1, 0, 4)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (6, 4, 1, N'这里要改成富文本的顶顶顶顶顶顶顶顶顶', CAST(0x0000ABED00FEE705 AS DateTime), 1, 0, 4)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (7, 4, 1, N'这里要改成富文本的', CAST(0x0000ABED0106D324 AS DateTime), 1, 1, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (8, 4, 1, N'这里要改成富文本的啥地方啥地方', CAST(0x0000ABED0107F8CD AS DateTime), 1, 0, 6)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (9, 4, 1, N'这里要改成富文本的哈哈哈哈哈', CAST(0x0000ABEE010555F5 AS DateTime), 0, 1, 7)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (10, 5, 1, N'这里要改成富文本的', CAST(0x0000ABEF013A31B8 AS DateTime), 1, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (11, 7, 2, N'哈哈哈哈哈哈哈', CAST(0x0000ABF000A10861 AS DateTime), 0, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (12, 7, 2, N'嘻嘻嘻嘻嘻', CAST(0x0000ABF000A1160E AS DateTime), 0, 0, 11)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (13, 7, 2, N'这里要改成富文本的烦烦烦烦烦烦', CAST(0x0000ABF000ED0D2D AS DateTime), 0, 0, 12)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (14, 9, 2, N'<p>回到法<span style="font-size: 20px;">国</span>岁的<strong>法国士</strong></p><p style="text-align: right;"><strong>大<a href="https://weibo.com/u/5721376081?sudaref=www.baidu.com&display=0&retcode=6102" target="_blank" title="哈哈哈哈哈">台湾傻事</a>夫噶时光</strong><br/></p>', CAST(0x0000ABF200921F98 AS DateTime), 0, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (15, 9, 2, N'<p>士大夫士大夫撒旦发射点发<img src="/Content/fuwenben/20200708/15941695451635801.png" title="会员卡.png" alt="会员卡.png"/></p>', CAST(0x0000ABF200924129 AS DateTime), 0, 0, 14)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (16, 9, 2, N'<p>有人<strong>认为特瑞特</strong><br/></p>', CAST(0x0000ABF2009280A1 AS DateTime), 0, 0, 15)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (17, 9, 2, N'<p style="text-indent: 2em;">呃呃呃呃呃呃<span style="color: rgb(149, 179, 215);"><strong>呃呃呃呃呃呃呃呃呃呃呃呃呃</strong></span><br/></p>', CAST(0x0000ABF20092AF23 AS DateTime), 0, 0, 15)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (18, 9, 2, N'<p>撒旦发射点发<em>射点和豆腐干豆腐干</em><br/></p>', CAST(0x0000ABF20092C846 AS DateTime), 0, 0, 17)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (19, 14, 2, N'<p>一个已婚，耿哥就成耿叔；<br/>一个一女，耿叔又成岳父……</p>', CAST(0x0000ABF20157DB4C AS DateTime), 0, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (20, 14, 2, N'<p>看上去挺年轻啊，都快50了</p>', CAST(0x0000ABF20157EF95 AS DateTime), 0, 0, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (21, 14, 2, N'<p>我靠，还正没注意年龄，我以为才30多...........比我看上去年轻多了</p>', CAST(0x0000ABF201580F8D AS DateTime), 0, 0, 20)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (22, 13, 2, N'<p>风格士大夫胜多负少<br/></p>', CAST(0x0000ABFF00F90E42 AS DateTime), 1, 1, NULL)
INSERT [dbo].[EssayCommunComment] ([EssayCommunCommentID], [EssayCommunID], [NewsUserID], [ECCContent], [ECCTime], [ECCLike], [ECCReport], [ECCCID]) VALUES (23, 13, 2, N'<p>撒旦发射<br/></p>', CAST(0x0000ABFF00F919AF AS DateTime), 0, 0, 22)
SET IDENTITY_INSERT [dbo].[EssayCommunComment] OFF
SET IDENTITY_INSERT [dbo].[NCLike] ON 

INSERT [dbo].[NCLike] ([NCLikeID], [NewsUserID], [NewsCommentID]) VALUES (7, 2, 24)
INSERT [dbo].[NCLike] ([NCLikeID], [NewsUserID], [NewsCommentID]) VALUES (8, 6, 27)
INSERT [dbo].[NCLike] ([NCLikeID], [NewsUserID], [NewsCommentID]) VALUES (9, 9, 29)
SET IDENTITY_INSERT [dbo].[NCLike] OFF
SET IDENTITY_INSERT [dbo].[NCReport] ON 

INSERT [dbo].[NCReport] ([NCReportID], [NewsUserID], [NewsCommentID]) VALUES (4, 2, 24)
INSERT [dbo].[NCReport] ([NCReportID], [NewsUserID], [NewsCommentID]) VALUES (5, 9, 29)
SET IDENTITY_INSERT [dbo].[NCReport] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [NewsTitle], [NewsImage], [NewsContent], [NewsTime], [NewsClick], [EditorID]) VALUES (7, N'禁用中国APP他们报复无门，“很聪明”', N'20200706135449782.jpg', N'<p>
	此前，艾亚尔曾在《经济时报》发表文章《莫迪<a href="https://www.guancha.cn/internation/2020_06_21_554913.shtml" target="_blank">决不能重蹈尼赫鲁</a>在中印边境的覆辙》。观察者网就近期印度禁用59款中国app一事对艾亚尔进行了采访，然而，艾亚尔并没有对观察者网提出的“莫迪如何落实‘自给自足’政策”“印度如何进行土地改革”“中印应该如何加强合作而非对抗”等问题作答，而是以他写的一篇题为“针对中国正确与错误的制裁方式”的文章，就印度禁用中国APP和中印关系表达了他的立场与观点。</p><p>
	观察者网发表此篇文章，仅仅意在帮助读者了解印度学者对中印两国关系的看法，并不代表认同其文章观点。</p><p style="text-align: center;">
	<img src="/Content/fuwenben/20200708/15942111226897291.jpg" title="20200706135449782.jpg" alt="20200706135449782.jpg"/> </p><p>
	<span style="color:#666666;">观察者</span><span style="color:#666666;">网采访</span><span style="color:#666666;">印度经济学家</span><span style="color:#666666;">斯瓦米纳坦·艾亚</span><span style="color:#666666;">尔</span> </p><p>
	【采访/ 观察者网 白紫文】</p><p>
	<strong>斯瓦米纳坦·艾亚尔</strong><strong>：</strong>尽管对中国“入侵”拉达克的确切原因众说纷纭，但印度必须勇于面对中国的“侵略”。软弱将招致进一步的压迫和入侵。</p><p>
	在这个问题上，有正确的和错误的做法。对中国进行军事轰炸或外科手术式打击将是愚蠢的升级。在军事冲突中，中国强大的军事力量将彻底击败我们。相反，印度需要在外交方面采取行动。它应该选择正确的经济制裁，既能伤害中国，又不会伤害印度自身。</p><p>
	在考虑了几项错误的制裁措施后，印度政府终于找到了正确的方法。印度已经在智能手机上禁用了59个中国移动应用程序，包括字节跳动的TikTok、腾讯的微信、最大智能手机销售商小米的手机社区和视频电话、阿里巴巴的UC浏览器和UC新闻，以及自称是印度第三大电子商务公司的俱乐部工厂。今年5月份，这些应用程序的月用户总数超过了5亿。</p><p>
	出于对隐私和安全的考虑，这项禁令是合理的，并不违反任何国际或条约规则。显然，这项禁令在告诉中国，印度可以以非军事方式进行反击。<strong>作为报复，中国大可以对印度电子商务公司下禁令，但这些公司在中国规模都太小，所以无关紧要</strong>。</p><p>
	印度需要冷静地选择制裁，而不是大发雷霆。对中国应用程序的禁令是一项冷静而有效的制裁。早些时候，电视频道和社交媒体上的愤怒引发停止从中国进口商品的要求。这将伤害到印度自身，将使印度失去一些世界上最便宜、效率最高的机械、中间产品和零部件。</p><p>
	此外，印度想要扩张进入主导世界贸易的全球价值链。中国在这些链条中扮演着非常重要的角色。如果印度禁止所有中国进口商品，印度将切断自己与全球价值链的联系，这是毁灭性的，并且与莫迪声明的目标相悖。</p><p>
	总而言之，禁止所有或大部分中国商品将使印度成为与全球价值链隔绝的高成本生产国。这将削弱印度的经济，对中国而言则再好不过。印度需要不断削减成本，才能快速增长并具备全球竞争力，因为最终，唯一的真正安全是一个能够为强大的军队提供资金的强大经济。</p><p>
	印度拥有13亿人口，是中国互联网和电子商务公司最大的潜在海外市场。中国的未来不在于廉价的劳动密集型商品，而在于服务。<strong>阻止中国通过应用程序接触印度消费者，是针对中国未来发展的一个聪明做法。</strong>这种非军事形式的报复完全符合国际贸易规则。它不会提高印度的生产或竞争力成本。</p><p>
	此前禁止所有中国商品的疯狂提议将违反WTO规则。作为一个没有超级大国作为教父的相对较小的贸易国，印度必须尽一切可能保持国际贸易和条约规则的完整。如果这些规则被抛弃(唐纳德•特朗普曾威胁要抛弃这些规则)，印度可能会损失惨重，从而面临无数随意的贸易威胁。世贸组织规则规定，每个成员必须向其他成员提供相同的进口税率，不得歧视。印度需要遵守这条规则。</p><p>
	政府想检查所有中国的动力设备和其他设备，确保质量。印度的实业家在购买机器之前肯定会检查机器的质量。虽然质量检查可以很讥讽地用作非关税壁垒，但这种手段应该高度选择性地使用，确保对印度生产成本的影响降到最低。</p><p>
	现在，对电力设备征收的新关税正在提上议程，对太阳能电池板征收的关税计划将高达40%，其中80%的太阳能电池板从中国进口。这项提议有助于培养印度的太阳能电池板生产商，但也将使印度的太阳能发电更加昂贵。当务之急是不顾一切地降低印度的投入成本，使印度再次成为一个充满活力的出口国。</p><p>
	政府希望，高关税背后的大规模太阳能电池板生产将创造规模经济，最终使太阳能电池板更便宜，希望能与中国电池板竞争。这是一个有风险但并非不可能的策略。要想奏效，进口关税必须有落日条款（法律或合约中订定部份或全部条文的终止生效日期，观察者网注），在五、六年内逐步取消。这将确保只有具有长期出口雄心的严肃投资者才会入场。</p><p>
	印度海关已经扣留了许多从中国运来的集装箱，原因是不清楚哪些货物是被禁止的。印度进口商已经为这些商品支付了货款，因此扣押这些商品只会伤害印度进口商，而不会伤害中国出口商。</p><p>
	“Swadeshi Jagran 
Manch”（印度民族主义极端组织RSS附属的右翼组织）和其他人可以敦促人们抵制中国消费品。这将提高消费者价格，抵制者们会乐意为此买单，但这不会提高印度出口商的投入成本。在过去的三项预算中，印度针对主要从中国进口的简单消费品——蜡烛、风筝、钟表、塑料玩具等，已经征收了更高的进口关税。这会再度提高消费者价格，但并不影响出口竞争力。因此，如果要实施贸易制裁，就让贸易制裁专注于互联网服务和消费品，但要排除资本和中间产品。</p><p><br/></p>', CAST(0x0000ABF20150AAE5 AS DateTime), 2, 1)
INSERT [dbo].[News] ([NewsID], [NewsTitle], [NewsImage], [NewsContent], [NewsTime], [NewsClick], [EditorID]) VALUES (8, N'特朗普：如果能帮上忙，愿意再次举行朝美首脑会谈', N'20200708171315476.jpg', N'	<p style="text-indent: 2em;">据韩国《东亚日报》7月8日报道，美国总统特朗普在前一天接受美媒采访时透露，如果能帮上忙的话，他愿意再次举行朝美首脑会谈（特金会）。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	特朗普当时正吹嘘自己在美朝关系上做出的贡献，还称：“如果赢得上次大选的人是希拉里，那这会美国可能已经同朝鲜全面开战了，所有人都说我要发动战争，但看看现在的发展。”</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	他自信地表示：“我知道他们（朝鲜）想见我，我们当然也会这么做。”至于再举行一次“特金会”能否产生积极影响，特朗普回答：“我和他（金正恩）的关系非常好，应该会起作用。”</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	这并不是特朗普的临场发挥，据韩联社7月8日报道，美国国务院常务副国务卿兼对朝特别代表比根当天在韩国同韩国外交部朝鲜半岛和平交涉本部长李度勋就早日重启与朝对话的方案进行深入讨论。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	比根称，将持灵活态度与朝对话，达成令双方都能满意的协议，并继续付出相关努力。他表示，美方已做好准备随时与朝对话，只待朝方“首肯”。美方将为实现半岛和平继续努力，美国总统特朗普也正为此提供全力支持。</p><p style="text-align: center;">
	<img src="/Content/fuwenben/20200708/15942113587668669.jpg" title="20200708170545729.jpg" alt="20200708170545729.jpg" width="751" height="499"/> </p>
	<p style="text-indent: 2em; text-align: center;"><span style="color:#666666;">比根在同</span><span style="color:#666666;">李度勋谈话 图片来源：韩联社</span> </p><p style="text-indent: 2em;">
	尽管美方姿态做得很好，但鉴于其长期以来敌视朝鲜的政策并没有松动，朝方在近期已多次表态——无意同美方对话。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	据朝中社7月4日报道，朝鲜外务省第一副相崔善姬指出，在美国的眼里，朝美对话只不过是处理其政治危机的工具，我们没有必要与这样的对方坐到一起，美国不应企图以“协商”来动摇朝鲜。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	她说：“美国不把首脑会谈达成的共识放在眼里，执意奉行对朝敌视政策，难道我们能和这样的美国进行对话或交易吗？没有意志做出决断和我们重新制定朝美关系计划的美国，拿什么度命之策来靠近我们，结果是显而易见的。”</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	7月7日，朝鲜外务省负责美国事务局长权正根向外界明确提醒：“我们无意与美国人坐到一起。”</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	美国总统特朗普和朝鲜最高领导人金正恩曾在2018年6月于新加坡举行<a href="https://www.guancha.cn/internation/2018_06_12_459826.shtml" target="_blank">首次“特金会</a>”，在两人签署的历史性文件里，朝鲜方面承诺“完全无核化”，美方则承诺向朝鲜提供安全保障。</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">
	然而在次年2月于越南举行的<a href="https://www.guancha.cn/internation/2019_02_28_491793.shtml" target="_blank">第二次“特金会”</a>却无果而终。同年6月，两人在<a href="https://www.guancha.cn/internation/2019_06_30_507605.shtml" target="_blank">板门店会面</a>，特朗普跨过朝韩分界线成为首位踏入朝鲜领土的现任美国总统。他宣布，美朝双方同意重启核谈判。</p><p style="text-align: center;">
	<img src="/Content/fuwenben/20200708/15942114018799711.jpg" title="20200708171315476.jpg" alt="20200708171315476.jpg"/> </p>
	<p style="text-indent: 2em; text-align: center;"><span style="color:#666666;">2018年6月12日，朝鲜最高领导人金正恩（左）与美国总统特朗普在新加坡举行会晤 @视觉中国</span> </p><p style="text-indent: 2em;">
	可自那以后，美韩两国不顾朝鲜多次警告强行军演，朝方以试射多枚导弹、火箭弹回击。朝劳动党机关报《劳动新闻》称：“我们想要通过对话解决问题的立场没有改变，但如果敌对军事行为持续不断，对话的动力将逐渐消失。我们也有可能不得不摸索新的途径。”</p><p><br/></p>', CAST(0x0000ABF20151ECD7 AS DateTime), 2, 1)
INSERT [dbo].[News] ([NewsID], [NewsTitle], [NewsImage], [NewsContent], [NewsTime], [NewsClick], [EditorID]) VALUES (9, N'外交部：美国退群毁约破坏国际抗疫努力', N'20200708161354884.jpg', N'	<p style="text-indent: 2em;">7月8日，外交部发言人赵立坚主持例行记者会。有记者提问，据报道，美国国务院发言人7日称，特朗普总统正式通知联合国秘书长古特雷斯，其已启动美国退出世卫组织程序。同日，古的发言人确认了该消息。中方对此有何评论？</p><p style="text-indent: 2em;">
	答：这是美国奉行单边主义、退群毁约的又一例证。作为全球公共卫生安全领域最权威、最专业的的国际机构，世卫组织在应对全球新冠肺炎疫情上发挥着不可或缺的中心协调作用。</p><p style="text-indent: 2em;">
	当前，国际抗疫正处于关键阶段，支持世卫组织就是支持国际抗疫合作、支持挽救生命。这是国际社会的广泛共识。美国的这一做法破坏国际抗疫努力，特别是给急需国际支持的发展中国家带来严重消极影响。我们敦促美方履行应尽的国际责任和义务，展现一个大国应有的责任和担当。我们也呼吁国际社会进一步凝聚多边主义共识，加大对世卫组织的支持和投入，共同维护全球公共卫生安全。</p><p><br/></p>', CAST(0x0000ABF201524C3D AS DateTime), 19, 1)
INSERT [dbo].[News] ([NewsID], [NewsTitle], [NewsImage], [NewsContent], [NewsTime], [NewsClick], [EditorID]) VALUES (10, N'福建省泉州市欣佳酒店“3·7”坍塌事故调查报告公布', N'会员卡.png', N'<p>
	近日，国务院批复福建省泉州市欣佳酒店“3·7”坍塌事故调查报告，认定福建省泉州市欣佳酒店“3·7”坍塌事故是一起主要因违法违规建设、改建和加固施工导致建筑物坍塌的重大生产安全责任事故。</p><p>
	2020年3月7日19时14分，位于福建省泉州市鲤城区的欣佳酒店所在建筑物发生坍塌事故，造成29人死亡、42人受伤，直接经济损失5794万元。事发时，该酒店为泉州市鲤城区新冠肺炎疫情防控外来人员集中隔离健康观察点。</p><p>
	事故发生后，党中央、国务院高度重视，习近平总书记第一时间作出重要指示，要求全力抢救失联者，积极救治伤员；强调当前全国正在复工复产，务必确保安全生产，确保不发生次生灾害。李克强总理立即作出批示，要求全力搜救被困人员，及时救治伤员，并做好救援人员自身防护，尽快查明事故原因并依法问责。应急管理部、住房城乡建设部等有关部门派出工作组连夜赶赴现场，指导地方抢险救援、事故调查和善后处置等工作。国家卫生健康委调派医疗卫生应急专家组，支援当地开展伤员救治等卫生应急处置工作。</p><p>
	这起事故虽然不够特别重大事故等级，但性质严重、影响恶劣，依据《安全生产法》《生产安全事故报告和调查处理条例》等有关法律法规规定，国务院批准成立了由应急管理部牵头，公安部、自然资源部、住房城乡建设部、国家卫生健康委、全国总工会和福建省政府为成员单位的国务院福建省泉州市欣佳酒店“3·7”坍塌事故调查组进行提级调查。事故调查组聘请工程勘察设计、工程建设管理、建设工程质量安全管理、公共安全等方面的专家参与调查。国务院事故调查组通过现场勘查、取样检测、调查取证、调阅资料、人员问询、专家论证等，查明了事故直接原因和性质，查明了事故企业、中介机构违法违规问题，查明了有关地方政府及相关部门在监管方面存在的问题，分析了事故主要教训，提出了防范和整改的措施建议，形成了事故调查报告。</p><p>
	为确保事故调查报告科学严谨、责任认定准确，国务院事故调查组组织清华大学、北京大学、中国人民大学、中国政法大学、中共中央党校（国家行政学院）等多位权威专家，召开第三方专家论证会，对事故调查报告进行了评估论证，认为事故调查依法依规查实了企业主体责任、部门监管责任和党委政府领导责任，事故原因和事故性质分析认定准确，事实清楚、客观公正。</p><p>
	<strong>经调查，查明事故的直接原因是，事故责任单位泉州市新星机电工贸有限公司将欣佳酒店建筑物由原四层违法增加夹层改建成七层，达到极限承载能力并处于坍塌临界状态，加之事发前对底层支承钢柱违规加固焊接作业引发钢柱失稳破坏，导致建筑物整体坍塌。</strong></p><p>
	国务院事故调查组认定，泉州市新星机电工贸有限公司、欣佳酒店及其实际控制人杨金锵无视国家有关城乡规划、建设、安全生产以及行政许可等法律法规，违法违规建设施工，弄虚作假骗取行政许可，安全生产责任长期不落实。相关工程质量检测、建筑设计、消防检测、装饰设计等中介服务机构违规承接业务，出具虚假报告，制作虚假材料帮助事故企业通过行政审批。</p><p>
	国务院事故调查组同时认定，福建省、泉州市、鲤城区住房城乡建设部门没有认真履行建筑主管部门安全监管责任，对欣佳酒店建筑物等长期存在的违法建设行为没有制止和查处，组织开展违法建设整治、房屋安全隐患排查整治、住房和城乡建设领域“打非治违”工作不力，严重失职失察。福建省、泉州市国土规划部门，泉州市、鲤城区城市管理部门、公安部门、消防机构履行监管职责不到位、执法不严格，行政审批把关失守，并对泉州市新星机电工贸公司、欣佳酒店违法建设、弄虚作假骗取行政许可等违法违规行为未及时发现查处。泉州市鲤城区常泰街道对欣佳酒店建筑物违法违规建设、改建长期未予报告和查处，属地管理责任严重缺失；在违法建设专项治理和房屋安全隐患排查工作中不认真不负责，存在明显漏洞和严重的形式主义。鲤城区超越权限研究出台并实施特殊情况建房政策，违规审批同意建设欣佳酒店建筑物等大量违法建设项目；在治理违法建设历次重大专项行动中工作不负责任，放任大量违法建筑长期存在；在设置集中隔离健康观察点时忽视房屋建筑质量安全，草率决策。泉州市落实地方党政领导干部安全生产责任制规定不到位，对辖区内长期存在的违法违规审批建设项目情况失管失察，“打非治违”和房屋安全隐患排查工作不实不细，没有认真查处违建项目。</p><p>
	对杨金锵等23名涉嫌犯罪的有关责任人，公安机关依法采取了刑事强制措施。对事故涉及的有关公职人员，福建省纪委监委按照有关规定成立了责任追究审查调查组进行审查调查；国务院事故调查组对发现的地方党委政府及有关部门公职人员履职方面的问题和涉嫌腐败等线索及相关材料，移交福建省纪委监委事故责任追究审查调查组。有关公职人员的追责问责处理意见，福建省纪委监委另行公布。</p><p>
	事故调查报告指出了福建省有关地方和部门“生命至上、安全第一”的理念没有牢固树立、依法行政意识淡薄、监管执法严重不负责任、安全隐患排查治理形式主义问题突出、相关部门审批把关失守、企业违法违规肆意妄为等6个方面的主要教训。同时，举一反三提出了6方面的防范和整改措施建议，强调各地党委政府和有关部门特别是福建省、泉州市、鲤城区要深刻吸取事故惨痛教训，切实担负起防范化解安全风险的重大责任，把确保人民生命安全放在第一位落到实处；各级领导干部要强化法治思维坚持依法行政，提高法治素养和法治能力；住房城乡建设部门要按照“三个必须”“一岗双责”的规定要求和“谁主管谁负责”的原则，严格履行建筑安全监管责任，会同相关部门修订完善有关建筑法律法规和安全标准，全面强化涉疫场所、各类集中安置场所和宾馆、房屋等建筑安全保障水平；地方各级政府和有关部门要深化建设施工领域“打非治违”和安全隐患排查治理；各有关部门要健全部门间信息共享和协同配合工作机制；各地区和有关部门要扎实开展城市建设安全等安全生产专项整治三年行动，从根本上消除事故隐患。</p><p><br/></p>', CAST(0x0000ABF801327D47 AS DateTime), 18, 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[NewsComment] ON 

INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (20, 9, 2, N'<p>赞同</p><p><img src="/Content/fuwenben/20200711/15944423225276533.jpg" title="报名照片.jpg" alt="报名照片.jpg" width="169" height="198"/></p>', CAST(0x0000ABF500D085CC AS DateTime), 0, 0, NULL)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (21, 9, 2, N'<p>双倍b(￣▽￣)d同<br/></p>', CAST(0x0000ABF500D0AF3D AS DateTime), 0, 0, 20)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (22, 9, 5, N'<p>很好<br/></p>', CAST(0x0000ABF801309CDE AS DateTime), 0, 0, NULL)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (23, 9, 5, N'<p>很好2<br/></p>', CAST(0x0000ABF80130A8D5 AS DateTime), 0, 0, 22)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (24, 10, 2, N'<p>哈哈哈哈哈<br/></p>', CAST(0x0000ABFF00F8D49C AS DateTime), 1, 1, NULL)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (25, 10, 2, N'<p>啥地方啥地方<br/></p>', CAST(0x0000ABFF00F8DC56 AS DateTime), 0, 0, 24)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (26, 10, 2, N'<p>士大夫胜多负少<br/></p>', CAST(0x0000ABFF00F8F83B AS DateTime), 0, 0, 25)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (27, 10, 6, N'<p>我回复了啊啊啊啊</p>', CAST(0x0000ABFF0115467E AS DateTime), 1, 0, NULL)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (28, 10, 6, N'<p>在恢复</p>', CAST(0x0000ABFF01155B06 AS DateTime), 0, 0, 27)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (29, 9, 9, N'<p>真可怕<br/></p>', CAST(0x0000AD0200BDA4F6 AS DateTime), 1, 1, NULL)
INSERT [dbo].[NewsComment] ([NewsCommentID], [NewsID], [NewsUserID], [NCContent], [NCTime], [NCLike], [NCReport], [NCID]) VALUES (30, 9, 9, N'<p>我觉得也是<br/></p>', CAST(0x0000AD0200BDC7DF AS DateTime), 0, 0, 29)
SET IDENTITY_INSERT [dbo].[NewsComment] OFF
SET IDENTITY_INSERT [dbo].[NewsUser] ON 

INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (1, N'123456', N'123456', N'周几个', N'通用.png', N'女', N'哈哈哈哈哈')
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (2, N'xzp', N'123456', N'写真陪你', N'通用.png', N'保密', NULL)
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (3, N'shupeng', N'123456', N'舒鹏', N'会员卡.JPG', N'保密', NULL)
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (4, N'liuyingkang', N'123456', N'六硬抗', N'通用.png', N'保密', NULL)
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (5, N'huyao', N'123456', N'胡瑶', N'背景.PNG', N'女', N'优秀教师')
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (6, N'zhoupeng', N'123456', N'周朋', N'通用.jpg', N'女', NULL)
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (7, N'xzp123', N'123456', N'谢谢你', N'捕获.PNG', N'男', N'每一次成功都是一次次失败的累积')
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (8, N'12345678', N'12345678', N'大家好', N'通用.png', N'保密', NULL)
INSERT [dbo].[NewsUser] ([NewsUserID], [NewsUserAccount], [NewsUserPwd], [NewsUserName], [NewsUserImage], [NewsUserSex], [NewsUserMotto]) VALUES (9, N'123xzp', N'123456', N'视野新闻网', N'视野新闻网logo.png', N'男', N'我很好')
SET IDENTITY_INSERT [dbo].[NewsUser] OFF
SET IDENTITY_INSERT [dbo].[Writer] ON 

INSERT [dbo].[Writer] ([WriterID], [WriterName], [WriterImage], [WriterPosition]) VALUES (1, N'周安保', N'20181216102652568.png', N'华东师范大学法学院教授')
INSERT [dbo].[Writer] ([WriterID], [WriterName], [WriterImage], [WriterPosition]) VALUES (3, N'方友文', N'20200506094909911.png', N'巴基斯坦巴中学会执行主任')
INSERT [dbo].[Writer] ([WriterID], [WriterName], [WriterImage], [WriterPosition]) VALUES (4, N'刘湘明', N'谢振鹏.jpg', N'湖南工程职业技术学院校长')
INSERT [dbo].[Writer] ([WriterID], [WriterName], [WriterImage], [WriterPosition]) VALUES (7, N'谢震与', N'谢振鹏.jpg', N'教授')
SET IDENTITY_INSERT [dbo].[Writer] OFF
SET IDENTITY_INSERT [dbo].[WriterCommun] ON 

INSERT [dbo].[WriterCommun] ([WriterCommunID], [WCTitle], [WCImage], [WCContent], [WCTime], [WCClick], [WriterID], [EditorID]) VALUES (4, N'沈逸：提到中国就炸毛，美国战略精英为何陷入集体焦虑', N'20200702000659835.jpg', N'	<p style="text-indent: 2em;">欢迎大家来到本期的逸语道破，这一期我想讲一下美国精英对中国的战略焦虑问题。这是一个很有趣的现象。美国人不会说我对你很焦虑，对于“中国对美国构成的挑战、威胁的严重程度，以及中国是一个怎样的国家，会用什么样的方式去挑战和威胁美国”，有时候你会看到一种现象：</p><p style="text-indent: 2em;">
	比如说，我们拿新冠疫情这件事情为例，新冠病毒爆发和流行的过程中，美方对中国有很多指责，有的时候是极其荒谬的，很明显，你会发现一些在中国社交媒体平台上被网民普通人明显已经识别为谣言的信息，会被堂而皇之地作为某种公开情报的来源，写入到美国政府的决策依据中去，甚至作为指责中国的材料。最经典的案例就是所谓人造病毒生物武器和泄露的问题。往大里说，美国政府通过蓬佩奥这些人直接对中国提出的指责，所援引的材料，或者像最近闹得沸沸扬扬的共和党那本宣传手册所使用的指控的依据，就是直接引用了网上谣言性质的材料。</p><p style="text-indent: 2em;">
	在什么样的情况下，你才会去相信这些东西呢？当你内心深处有一个重大的焦虑，使得你失去了对一些问题的正常判断，或者说你已经顾不上去判断这些东西本身的质量和真假。用一种但凡有需要，“拿到篮里就是菜”的这种方式，甚至抓住最后一根救命稻草的心态去采信这些材料。对这些材料的采信，甚至在一定程度上标志着一个人已经失去了最基础的判断能力。</p><p style="text-indent: 2em;">
	这种焦虑有两个比较直观的体现：第一个是一个叫斯金纳的美国国务院政策设计室的主任，她是一个非洲裔美国女性，哈佛毕业，2018年她在华盛顿的演讲中说了这么一段话，“美国跟苏联打冷战是文明内部的竞争，中美之间的竞争是文明之间的竞争”，这个话一出当然引发哗然，后来她也辞职了。</p><p style="text-indent: 2em;">
	所谓文明之间的竞争是什么概念？说穿了它带有种族主义色彩，美国跟苏联再怎么竞争，大家都是白人，看上去似乎可能都有某种天主教或者基督教的文化背景，而你中国对美国来说，在精英的解读当中，你不仅是一个社会主义国家，你来自于东方，你是亚裔，而且你有完全不同的文化历史背景。欧美国家理解的国际关系，其实就是以欧美国家为中心的国际体系，再怎么竞争，所有的大国在中国出现之前，包括之前在日本所谓的挑战之前，都是白人国家之间的竞争，当然这东西有非常明显的种族主义色彩，是不能在正规场合登堂入室的东西，但她就是这么脱口而出了。</p><p style="text-indent: 2em;">
	第二个，你会发现这种非常深刻的意识形态加种族主义混合的焦虑，在史蒂夫·班农这个人身上得到了非常明显的体现。这种焦虑表现为什么？就是他现在不介意用20世纪50年代麦卡锡主义反共产主义那种歇斯底里去塑造对中国的恐惧——把共产党塑造为一个无所不在的阴谋和网络的力量，然后把美国国内的所有问题都归结为中国共产党，包括在病毒治理的抗击新冠疫情的问题上。</p><p style="text-indent: 2em;">
	美国现在给出的很多解释，所谓中国的误导和中国的责任，那个意思是什么？就是美国的新冠疫情的抗击行动，它取决于中国政府提供的数据和信息的质量，这其实看上去很合理的逻辑背后是极度荒谬的，说穿了只有实力和能力各方面都不如中国的政府，国家才会有这样一种心态。</p><p style="text-indent: 2em;">
	一般我们认为只有强势的一方才有可能影响弱势的一方的决策。但是美国之前以什么著称呢？技术先进，决策过程开明、英明，信息流畅，能够做出高质量的、前瞻性的战略决策，并且有近似无穷的资源可以透支和使用。但是现在美国慢慢把自己放到了甚至在一定程度上弱于中国的一个位置，这就变得非常可笑。而且现在有一种态势，在美国国内出现的任何问题，当找不到一个不或者不方便找到一个直接的原因的时候，就开始本能地把中国称之为美国的敌人，或者说称之为是中国的责任。</p><p style="text-indent: 2em;">
	这种战略焦虑弥散在美国的决策圈或者说战略精英当中，基本上是跨越党派和立场差异的。这种焦虑的形成非常非常有意思，其中一个非常重要原因来自于中美双方力量对比变化背后的机制。从历史发展来看，中美之间现在总体力量的变化，本质上是由中美两国的国家能力，政府治理能力以及相应的政治体制和制度所决定的。美国被中国慢慢的赶上，在相当大程度上源自于美国国内金融资本的过度膨胀，以及美国受资本影响和控制的政府，没有办法结构性地去调整金融资本所暴露出来的各种问题，也就是说是它制度上的内生性缺陷。而对于美国精英来说，他们焦虑的来源就是看到了问题的所在，但没有办法正确地去解决问题。</p><p style="text-indent: 2em;">
	另一方面中国在不断地发展，美国人非常清楚两点：第一，中国的发展主要是由中国内部的原因所决定的，它不是一个可以从外部消解掉的变量；第二，不管怎么进行解释和自我安慰，美国自己不由自主地默认这样一个事实，就是中美之间实力对比的变化，本质上是一种道路发展道路、发展模式和制度优劣比较的指标，也就是说中国缩小和美国的差距，中国在将来在有些体量和指标赶上接近或者超过美国，不是两个国家间的事，它还是两条发展道路，两种发展模式，两种政治经济社会制度之间战略竞争的一个重要的阶段性指标。</p><p style="text-indent: 2em;">
	在抗击新冠疫情的过程中，福山已经发表了两次比较重要的观点，一次观点是，他认为不能够简单地用民主跟集权去区分抗击新冠疫情的效率。因为如果这样做，你会发现民主国家得分非常差，所以他坚定地认为不能因为抗击新冠疫情就得出结论说民主制度不行。那么既然不是制度问题，美国为什么表现那么差呢？所以他归结为什么这“届美国领导不行”——领导人没能力，民众不信任，也就是这届美国民众不行。</p><p style="text-indent: 2em;">
	当然他这里没有回答一个政治学的基本问题，不行的美国领导人是怎么选出来的？他是美国制度的产物——他自己把自己有点绕进去了。</p><p style="text-indent: 2em;">
	当然福山现在还在继续强辩，最近他又说了第二个观点，在接受法国《观点周刊》采访的时候，福川说了一句话，他承认新自由主义已经死了，但是坚持中国模式很难复制。福山的成名作《历史的终结》曾经宣布“自由主义取得了历史的胜利，从此人类历史停止了，只有时间的流逝”意思就是，新自由主义主导下的欧美发达国家的政治经济社会制度是人类社会的终极形态，其他国家变成这个样子就行了。现在他说新自由主义已经死了，怎么办呢？没有办法向前突破，不能往前走，那就后退。退到什么地方去，退到20世纪五六十年代，尤其是50年代的古典自由主义上去，这就是美国战略精英焦虑的核心和根本。</p><p style="text-indent: 2em;">
	在政治制度、治理模式和发展道路上，他们没有办法往前走，他们自己走的这条路在现在这个阶段又是错的，暴露出了各种各样的缺陷。怎么办？往后退退到那个阶段，然后我们就停那不动了，这真的能行吗？他可以自我催眠说他可以，但是任何学理都会告诉你，这样一种治理和解决模式和人类历史发展的所有经验是相违背的。</p><p style="text-indent: 2em;">
	在这种情况下，我们可以做一个简单预测，就是伴随着时间的流逝，伴随着中国的发展，在相当长一段时间里，直到中国实力、中国发展取得的成果变得无可辩驳和无可指责之前，被这种焦虑支配的各种人，会在舆论和意识形态上对中国发起各种各样的挑战、质疑和打压。核心诉求之一，就是希望能够成功解构掉中国的成功，这也是中国未来会在相当长一段时间里面面临的外部反应的核心特征。这个时候中国要保持充分的自信，就是你遭遇这些质疑，不见得是你真的做的不好，很多时候你做的越好，取得的实际的成功越多，面临的这种攻击就会越激烈，越广泛，越深层。</p><p style="text-indent: 2em;">
	当然这也对中国提出了全新的挑战，提出了全新的任务。</p><p><br/></p>', CAST(0x0000ABF20152B730 AS DateTime), 2, 1, 1)
INSERT [dbo].[WriterCommun] ([WriterCommunID], [WCTitle], [WCImage], [WCContent], [WCTime], [WCClick], [WriterID], [EditorID]) VALUES (5, N'对号入座，绿营急催“台版国安法”出台？', N'20200706073550529.jpg', N'	<p style="text-indent: 2em;">“香港国安法”施行细则公布后，有亲友Line我，说以后都不能去陆港澳了，因为他长期捐款给国际特赦组织。也有人说，他在脸书上有为撑港言论按赞，留言支持，去对岸恐怕会被抓起来关。甚至有人担心自己会被中共全球追缉，只因他报名参加了“港独”学者在台湾的公开演说。</p><p style="text-indent: 2em;">
	掐指一算，这种铺天盖地的“长臂管辖”，所需国内执法人员与境外情报员的布建数量应该上千万，每年投入的金额足造2艘航母，需要的监狱数量起码是目前的10倍以上。怎么算的？当然是随便算的，造谣者随便说说，傻子才认真计算成本。</p><p style="text-indent: 2em;">
	我回答这些亲友，你们有多重要？让大陆花钱在监狱供养你们？补充一点，我的亲友全部都是寻常百姓，一个从政的都没有，一个参加NGO的都没有，但他们都觉得自己“值得”被抓。</p><p style="text-indent: 2em;">
	恐惧，仇恨，这类负面情绪伴随着无知，往往都能轻易打败常识，正因如此，民进党才需要以造谣手段夺权，且屡试不爽。而当下的台湾人民，就是活在被政治谣言遮蔽的天空下。</p><p style="text-indent: 2em;">
	不过，仔细想想，大陆或许应该做个傻事，精确算出搜捕成本，主动搜捕一个反政府分子要花多少公帑？搜捕一个散布反政府信息的草民要花多少公帑？搜捕一个境外反中百姓要花多少公帑？养一个无期徒刑罪犯的食宿花费需要多少？</p><p style="text-indent: 2em;">
	国台办与其痛斥陆委会造谣，还被回酸“啼笑皆非”，不如将这些数字列出来，淡定点回应陆委会——预算有限，以成本论，针对乱港的台湾人士，可以抓捕的对象，比如说吧，可能约在2000名内，然后只要将百大要犯的姓名公布在官方网站上即可，你耍嘴皮，我列要犯。</p><p style="text-indent: 2em;">
	别笑绿营荒谬，造谣是有用的，“香港国安法”最主要的难关，就是谣言。按中国份量，这次的谣言攻势必然是世界级的，被“鬼扯病毒”沾上的确诊数量，或许是新冠病毒级的。病毒源头来自美国，台陆委会不过是在亚洲示范怎么做而已，不达到人人自危的目标不会罢手。</p><p style="text-indent: 2em;">
	诚然，传统媒体正在式微，但它还是有带头作用，陆委会登高一呼，主流媒体不分蓝绿都开始跟节奏，网军也开始鼓噪，一票自媒体跟风，迅速形成一张铺天盖地的谣言网，让状况外的普罗大众无所逃遁于扯谎空间。</p><p style="text-indent: 2em;">
	加码鬼扯的时评者，当然不乏法律人。法匠以解说法条的方式忽悠草民，指证历历，曰之“白纸黑字”，浑然忘却蔡英文的“国安五法”是更模糊不清的白纸黑字，造成台商人人自危。</p><p style="text-indent: 2em;">
	事涉国安的法律，全世界都一样，无可能钜细靡遗地以法条描述犯罪情节，因为愈仔细定义漏洞愈多。再者，事涉国家机密的案件，也都有程度不一的秘密审讯过程，试问，在台湾哪一件所谓“共谍案”的案件处理过程是透明的？</p><p style="text-indent: 2em;">
	不过，以上讲道理的说法，永远不敌“因言入罪”，“严刑拷问”，“秘密审判”这类煽惑之词，因为对中国投以“极权独裁”，“警察国家”的想像，一向有市场，也一向有人获利丰厚。</p>
	<p style="text-align: center; text-indent: 2em;"><img src="/Content/fuwenben/20200708/15942117366798002.jpg" title="20200706074316409.jpg" alt="20200706074316409.jpg" width="620" height="323"/> </p>
	<p style="text-indent: 2em;"><strong>莫周旋于假议题</strong> </p><p style="text-indent: 2em;">
	妖魔化“香港国安法”，在美国带头下是一个巨型诈骗行动。按往例，所谓“人权普世价值”才是主炮，但蓬佩奥刻意歪楼，在此话语核心外又炮制一圈“长臂管辖”的罪名，旨在将“恐惧中国”全球化。</p><p style="text-indent: 2em;">
	“长臂管辖”一向是美国专利，蓬佩奥将之分享给中国，至少逼迫中国在宣传战上耗费高昂成本。美国主要眩惑西方世界，华语世界的造谣演出，则由台湾担纲。</p><p style="text-indent: 2em;">
	当然，大陆大可反击：“台湾刑法第五条的内乱，外患，妨害公务，公共危险等罪”，也是不限“本国领域”与“国籍”的“长臂管辖”。不过，这是标准的假议题，一般而言，争执双方在假议题上周旋，得利的一方往往是丢出假议题的人。</p><p style="text-indent: 2em;">
	所谓“三人成虎”，就是假议题获得了高度炒作空间所致。</p><p style="text-indent: 2em;">
	对中国而言，主战场应设定在“叛国者与境外颠覆者的人权”上，这才是真议题。关于这个问题，世界各国，特别是西方，都是怎么做的？借此回头质疑“人权普世价值”，才有机会在宣传战中反制对手。</p><p style="text-indent: 2em;">
	美国是如何全球追缉斯诺登的？斯诺登可有被保障人权？一旦遭逮，他的审判过程可以全透明吗？类似的例子，不胜枚举吧？</p><p style="text-indent: 2em;">
	在真议题上吵，虽不见得会吵赢对手，但最起码让人民得以认识西方在人权问题上的浮夸与双标，花时间周旋于假议题，只会引诱对手不断推陈出新制造谣言，主导骂战。</p>
	<p style="text-indent: 2em;"><strong>“台版国安法”才是较棘手的问题</strong> </p><p style="text-indent: 2em;">
	其实，细数当下台湾当局如何搞“反中”、“脱中”、“仇中”的举措，意义愈来愈小，反正就是要跟大陆过不去，加紧岛内洗脑工程而已。重点是大陆如何因应？</p><p style="text-indent: 2em;">
	陆委会这次歪楼带节奏，虽是服务于美国宣传战“英翻中”的例行性工作，但也内含了“台独”自己的惴惴不安，因为不安，所以不自觉地在台港命运上催化了唇亡齿寒的感受，反似在催促“台版国安法”出台，好证实“今日香港，明日台湾”。</p><p style="text-indent: 2em;">
	在台湾，并非所有倾独的人群，都赞同黑暴港人的激烈手段，但因为惧怕自己将来的遭遇也比照港人，因此同情暴力手段，甚至同情自保割席与潜逃出境的那些祸港大小头目。蔡英文那817万票就是这么来的，而其中有不小比例，其实根本不喜欢蔡英文，也对民进党执政颇有怨言，但恐惧依然压倒一切。</p><p style="text-indent: 2em;">
	“台独”之所依，就是将台湾人民的命运与自己硬绑在一起，让百姓当肉墙而已，事实证明，做到这一点并不困难。因此，“台独”会将自己的不安，极力扩散到广大庶民的心里，以图自保。统一前，这是执政万灵丹，统一后，大比例的“反统”民众能有效稀释自己的罪业，要跑，也比较容易。</p><p style="text-indent: 2em;">
	换言之，造谣事业一本万利，台湾民众被洗到大面积认为“一国两制已死”也属常情。在此基础上衍生一个问题：会不会有“台版国安法”？</p><p style="text-indent: 2em;">
	在“香港国安法”的附带影响中，“是否出现台版国安法”是比较棘手的问题，它会让大陆官方不容易作答，因此也就很容易被凸显出来政治炒作。</p><p style="text-indent: 2em;">
	若大陆拒绝回应这个假设性问题，会被解读为默认；若大陆否认会出台“台版国安法”，等于自我设限；若大陆言明必然会有“台版国安法”，等于在帮蔡英文与美国的说法背书。</p><p style="text-indent: 2em;">
	怎么回应才算聪明？大陆官方要有所准备。</p><p></p><p style="text-indent: 2em;">
	由此可见，香港问题(基本法23条)拖延至今所累积的巨大成本，可谓所费不赀，这也是为何个人近来极力主张要尽快解决台湾问题，我们眼见这个成本正在快速升高，久拖不决，两岸人民终究要付出难以承受的代价。</p><p style="text-indent: 2em;">
	认为台湾人民有一天会从利益面务实看待统一问题，只怕是幻想，现在一切都与此背道而驰。什么？国民党？转向“亲美反共”的国民党？别说寄希望了，你最好对此党的未来一笑置之。</p>
	<p style="text-indent: 2em;"><strong>结论</strong> </p><p style="text-indent: 2em;">
	目前的两岸关系是荒谬的，台湾经济高度依赖大陆，ECFA到期看起来也不会断，票投“仇中”的台湾选民继续享受对岸优待，鄙视仇视大陆的风气却日益升高。公允论之，这种严重的背离不能只怪绿营，养着他们粗野生长的政策土壤，也应该翻新。</p><p style="text-indent: 2em;">
	这话我说一千次也不腻，台湾人民应该看到真相，为所欲为都还没事，这是假象。</p><p style="text-indent: 2em;">
	有趣的是，那位笃信自己一到对岸就会被抓的亲友，我问他，你有没有朋友是“台独”立场，但在大陆工作生活很久的？亲友一愣：对吼，我好几的朋友都支持“台独”，但在大陆都没事。我追问：那你敢去了吧？友对曰：不爽去。我哈哈。</p><p style="text-indent: 2em;">
	所有的情绪，都是被输入的；所有的真相，都是被遮蔽的。既然如此，大陆至少要发出一个足够强烈的讯息：今日“港独”，明日“台独”。</p><p style="text-indent: 2em;">
	反正无论怎么做，最后都是被妖魔化。</p><p><br/></p>', CAST(0x0000ABF20153A1B9 AS DateTime), 12, 3, 1)
SET IDENTITY_INSERT [dbo].[WriterCommun] OFF
SET IDENTITY_INSERT [dbo].[WriterCommunComment] ON 

INSERT [dbo].[WriterCommunComment] ([WriterCommunCommentID], [WriterCommunID], [NewsUserID], [WCCContent], [WCCTime], [WCCLike], [WCCReport], [WCCID]) VALUES (8, 5, 7, N'<p>我觉得很好<br/></p>', CAST(0x0000AD0200B56B98 AS DateTime), 0, 0, NULL)
INSERT [dbo].[WriterCommunComment] ([WriterCommunCommentID], [WriterCommunID], [NewsUserID], [WCCContent], [WCCTime], [WCCLike], [WCCReport], [WCCID]) VALUES (9, 5, 7, N'<p>我觉得也是<br/></p>', CAST(0x0000AD0200B57F48 AS DateTime), 0, 0, 8)
SET IDENTITY_INSERT [dbo].[WriterCommunComment] OFF
ALTER TABLE [dbo].[ECCLike]  WITH CHECK ADD  CONSTRAINT [FK_ECCLike_EssayCommunComment] FOREIGN KEY([EssayCommunCommentID])
REFERENCES [dbo].[EssayCommunComment] ([EssayCommunCommentID])
GO
ALTER TABLE [dbo].[ECCLike] CHECK CONSTRAINT [FK_ECCLike_EssayCommunComment]
GO
ALTER TABLE [dbo].[ECCLike]  WITH CHECK ADD  CONSTRAINT [FK_ECCLike_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[ECCLike] CHECK CONSTRAINT [FK_ECCLike_NewsUser]
GO
ALTER TABLE [dbo].[ECCReport]  WITH CHECK ADD  CONSTRAINT [FK_ECCReport_EssayCommunComment] FOREIGN KEY([EssayCommunCommentID])
REFERENCES [dbo].[EssayCommunComment] ([EssayCommunCommentID])
GO
ALTER TABLE [dbo].[ECCReport] CHECK CONSTRAINT [FK_ECCReport_EssayCommunComment]
GO
ALTER TABLE [dbo].[ECCReport]  WITH CHECK ADD  CONSTRAINT [FK_ECCReport_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[ECCReport] CHECK CONSTRAINT [FK_ECCReport_NewsUser]
GO
ALTER TABLE [dbo].[EssayCommun]  WITH CHECK ADD  CONSTRAINT [FK_EssayCommun_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[EssayCommun] CHECK CONSTRAINT [FK_EssayCommun_NewsUser]
GO
ALTER TABLE [dbo].[EssayCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_EssayCommunComment_EssayCommun] FOREIGN KEY([EssayCommunID])
REFERENCES [dbo].[EssayCommun] ([EssayCommunID])
GO
ALTER TABLE [dbo].[EssayCommunComment] CHECK CONSTRAINT [FK_EssayCommunComment_EssayCommun]
GO
ALTER TABLE [dbo].[EssayCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_EssayCommunComment_EssayCommunComment] FOREIGN KEY([ECCCID])
REFERENCES [dbo].[EssayCommunComment] ([EssayCommunCommentID])
GO
ALTER TABLE [dbo].[EssayCommunComment] CHECK CONSTRAINT [FK_EssayCommunComment_EssayCommunComment]
GO
ALTER TABLE [dbo].[EssayCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_EssayCommunComment_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[EssayCommunComment] CHECK CONSTRAINT [FK_EssayCommunComment_NewsUser]
GO
ALTER TABLE [dbo].[EssayCommunFalse]  WITH CHECK ADD  CONSTRAINT [FK_EssayCommunFalse_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[EssayCommunFalse] CHECK CONSTRAINT [FK_EssayCommunFalse_NewsUser]
GO
ALTER TABLE [dbo].[NCLike]  WITH CHECK ADD  CONSTRAINT [FK_NCLike_NewsComment] FOREIGN KEY([NewsCommentID])
REFERENCES [dbo].[NewsComment] ([NewsCommentID])
GO
ALTER TABLE [dbo].[NCLike] CHECK CONSTRAINT [FK_NCLike_NewsComment]
GO
ALTER TABLE [dbo].[NCLike]  WITH CHECK ADD  CONSTRAINT [FK_NCLike_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[NCLike] CHECK CONSTRAINT [FK_NCLike_NewsUser]
GO
ALTER TABLE [dbo].[NCReport]  WITH CHECK ADD  CONSTRAINT [FK_NCReport_NewsComment] FOREIGN KEY([NewsCommentID])
REFERENCES [dbo].[NewsComment] ([NewsCommentID])
GO
ALTER TABLE [dbo].[NCReport] CHECK CONSTRAINT [FK_NCReport_NewsComment]
GO
ALTER TABLE [dbo].[NCReport]  WITH CHECK ADD  CONSTRAINT [FK_NCReport_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[NCReport] CHECK CONSTRAINT [FK_NCReport_NewsUser]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Editor] FOREIGN KEY([EditorID])
REFERENCES [dbo].[Editor] ([EditorID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Editor]
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [FK_NewsComment_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([NewsID])
GO
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [FK_NewsComment_News]
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [FK_NewsComment_NewsComment] FOREIGN KEY([NCID])
REFERENCES [dbo].[NewsComment] ([NewsCommentID])
GO
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [FK_NewsComment_NewsComment]
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [FK_NewsComment_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [FK_NewsComment_NewsUser]
GO
ALTER TABLE [dbo].[NewsFalse]  WITH CHECK ADD  CONSTRAINT [FK_NewsFalse_Editor] FOREIGN KEY([EditorID])
REFERENCES [dbo].[Editor] ([EditorID])
GO
ALTER TABLE [dbo].[NewsFalse] CHECK CONSTRAINT [FK_NewsFalse_Editor]
GO
ALTER TABLE [dbo].[WCCLike]  WITH CHECK ADD  CONSTRAINT [FK_WCCLike_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[WCCLike] CHECK CONSTRAINT [FK_WCCLike_NewsUser]
GO
ALTER TABLE [dbo].[WCCLike]  WITH CHECK ADD  CONSTRAINT [FK_WCCLike_WriterCommunComment] FOREIGN KEY([WriterCommunCommentID])
REFERENCES [dbo].[WriterCommunComment] ([WriterCommunCommentID])
GO
ALTER TABLE [dbo].[WCCLike] CHECK CONSTRAINT [FK_WCCLike_WriterCommunComment]
GO
ALTER TABLE [dbo].[WCCReport]  WITH CHECK ADD  CONSTRAINT [FK_WCCReport_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[WCCReport] CHECK CONSTRAINT [FK_WCCReport_NewsUser]
GO
ALTER TABLE [dbo].[WCCReport]  WITH CHECK ADD  CONSTRAINT [FK_WCCReport_WriterCommunComment] FOREIGN KEY([WriterCommunCommentID])
REFERENCES [dbo].[WriterCommunComment] ([WriterCommunCommentID])
GO
ALTER TABLE [dbo].[WCCReport] CHECK CONSTRAINT [FK_WCCReport_WriterCommunComment]
GO
ALTER TABLE [dbo].[WriterCommun]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommun_Editor] FOREIGN KEY([EditorID])
REFERENCES [dbo].[Editor] ([EditorID])
GO
ALTER TABLE [dbo].[WriterCommun] CHECK CONSTRAINT [FK_WriterCommun_Editor]
GO
ALTER TABLE [dbo].[WriterCommun]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommun_Writer] FOREIGN KEY([WriterID])
REFERENCES [dbo].[Writer] ([WriterID])
GO
ALTER TABLE [dbo].[WriterCommun] CHECK CONSTRAINT [FK_WriterCommun_Writer]
GO
ALTER TABLE [dbo].[WriterCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommunComment_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[WriterCommunComment] CHECK CONSTRAINT [FK_WriterCommunComment_NewsUser]
GO
ALTER TABLE [dbo].[WriterCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommunComment_WriterCommun] FOREIGN KEY([WriterCommunID])
REFERENCES [dbo].[WriterCommun] ([WriterCommunID])
GO
ALTER TABLE [dbo].[WriterCommunComment] CHECK CONSTRAINT [FK_WriterCommunComment_WriterCommun]
GO
ALTER TABLE [dbo].[WriterCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommunComment_WriterCommunComment] FOREIGN KEY([WCCID])
REFERENCES [dbo].[WriterCommunComment] ([WriterCommunCommentID])
GO
ALTER TABLE [dbo].[WriterCommunComment] CHECK CONSTRAINT [FK_WriterCommunComment_WriterCommunComment]
GO
ALTER TABLE [dbo].[WriterCommunFalse]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommunFalse_Editor] FOREIGN KEY([EditorID])
REFERENCES [dbo].[Editor] ([EditorID])
GO
ALTER TABLE [dbo].[WriterCommunFalse] CHECK CONSTRAINT [FK_WriterCommunFalse_Editor]
GO
ALTER TABLE [dbo].[WriterCommunFalse]  WITH CHECK ADD  CONSTRAINT [FK_WriterCommunFalse_Writer] FOREIGN KEY([WriterID])
REFERENCES [dbo].[Writer] ([WriterID])
GO
ALTER TABLE [dbo].[WriterCommunFalse] CHECK CONSTRAINT [FK_WriterCommunFalse_Writer]
GO
USE [master]
GO
ALTER DATABASE [ViewNews] SET  READ_WRITE 
GO
