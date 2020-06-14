USE [master]
GO
/****** Object:  Database [ViewNews]    Script Date: 2020/6/13 16:06:07 ******/
CREATE DATABASE [ViewNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ViewNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ViewNews.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ViewNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ViewNews_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [ViewNews] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[Editor]    Script Date: 2020/6/13 16:06:07 ******/
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
/****** Object:  Table [dbo].[EssayCommun]    Script Date: 2020/6/13 16:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EssayCommun](
	[EssayCommunID] [int] IDENTITY(1,1) NOT NULL,
	[ECTitle] [nvarchar](50) NOT NULL,
	[ECContent] [nvarchar](max) NOT NULL,
	[ECState] [int] NOT NULL,
	[ECTime] [datetime] NOT NULL,
	[NewsUserID] [int] NOT NULL,
 CONSTRAINT [PK_EssayCommun] PRIMARY KEY CLUSTERED 
(
	[EssayCommunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EssayCommunComment]    Script Date: 2020/6/13 16:06:07 ******/
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
 CONSTRAINT [PK_EssayCommunComment] PRIMARY KEY CLUSTERED 
(
	[EssayCommunCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2020/6/13 16:06:07 ******/
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
/****** Object:  Table [dbo].[NewsComment]    Script Date: 2020/6/13 16:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsComment](
	[NewsComment] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[NCContent] [nvarchar](max) NOT NULL,
	[NCTime] [datetime] NOT NULL,
 CONSTRAINT [PK_NewsComment] PRIMARY KEY CLUSTERED 
(
	[NewsComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsUser]    Script Date: 2020/6/13 16:06:07 ******/
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
/****** Object:  Table [dbo].[Writer]    Script Date: 2020/6/13 16:06:07 ******/
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
/****** Object:  Table [dbo].[WriterCommun]    Script Date: 2020/6/13 16:06:07 ******/
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
/****** Object:  Table [dbo].[WriterCommunComment]    Script Date: 2020/6/13 16:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WriterCommunComment](
	[WriterCommunCommentID] [int] NOT NULL,
	[WriterCommunID] [int] IDENTITY(1,1) NOT NULL,
	[NewsUserID] [int] NOT NULL,
	[WCCContent] [nvarchar](max) NOT NULL,
	[WCCTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WriterCommunComment] PRIMARY KEY CLUSTERED 
(
	[WriterCommunCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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
ALTER TABLE [dbo].[EssayCommunComment]  WITH CHECK ADD  CONSTRAINT [FK_EssayCommunComment_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[EssayCommunComment] CHECK CONSTRAINT [FK_EssayCommunComment_NewsUser]
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
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [FK_NewsComment_NewsUser] FOREIGN KEY([NewsUserID])
REFERENCES [dbo].[NewsUser] ([NewsUserID])
GO
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [FK_NewsComment_NewsUser]
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
USE [master]
GO
ALTER DATABASE [ViewNews] SET  READ_WRITE 
GO
