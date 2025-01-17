USE [master]
GO
/****** Object:  Database [onlinejobportal]    Script Date: 10/16/2024 1:38:34 PM ******/
CREATE DATABASE [onlinejobportal] 
GO
ALTER DATABASE [onlinejobportal] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlinejobportal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlinejobportal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlinejobportal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlinejobportal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlinejobportal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlinejobportal] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlinejobportal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlinejobportal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlinejobportal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlinejobportal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlinejobportal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlinejobportal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlinejobportal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlinejobportal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlinejobportal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlinejobportal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onlinejobportal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlinejobportal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlinejobportal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlinejobportal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlinejobportal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlinejobportal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlinejobportal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlinejobportal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [onlinejobportal] SET  MULTI_USER 
GO
ALTER DATABASE [onlinejobportal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlinejobportal] SET DB_CHAINING OFF 
GO
USE [onlinejobportal]
GO
/****** Object:  Table [dbo].[adminlogin]    Script Date: 10/16/2024 1:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminlogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_adminlogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/16/2024 1:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[picture] [varchar](50) NULL,
	[visiblestatus] [bit] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/16/2024 1:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[image] [varchar](50) NULL,
	[cid] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[register]    Script Date: 10/16/2024 1:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[mobile] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[deletestatus] [bit] NULL,
 CONSTRAINT [PK_register] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slider]    Script Date: 10/16/2024 1:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](50) NULL,
 CONSTRAINT [PK_slider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[adminlogin] ON 

INSERT [dbo].[adminlogin] ([id], [email], [password]) VALUES (1, N'admin@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[adminlogin] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [title], [description], [picture], [visiblestatus]) VALUES (1, N'Demo', N'demo category', N'csharpeimages.jpg', 1)
INSERT [dbo].[category] ([id], [title], [description], [picture], [visiblestatus]) VALUES (2, N'Abc', N'abc desc', N'CODERS WAR 1.0 (2).png', 0)
INSERT [dbo].[category] ([id], [title], [description], [picture], [visiblestatus]) VALUES (4, N'delta', N'delta desc', N'home-one-filter.46afeaf5.png', 1)
INSERT [dbo].[category] ([id], [title], [description], [picture], [visiblestatus]) VALUES (5, N'alpha', N'alpha desc', N'pic5.png', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [price], [description], [image], [cid]) VALUES (1, N'Mobile', N'15000', N'Android Phone', N'pic5.png', 5)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[register] ON 

INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (1, N'Abc', N'abc@gmail.com', N'123', N'9898987878', N'Lko', 0)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (2, N'Xyz', N'xyz@gmail.com', N'123', N'8989898989', N'LKo', 1)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (3, N'Abc', N'abc@gmail.com', N'123', N'5454545454', N'323', 0)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (4, N'Abc', N'abc@gmail.com', N'3232', N'24254', N'34545', 1)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (6, N'Abc', N'abc@gmail.com', N'123213', N'123123213213', N'123123', 0)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (7, N'Abc', N'abc@gmail.com', N'123', N'123123', N'123123', 0)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (8, N'Abc', N'abc@gmail.com', N'123', N'123123213', N'123123', 0)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (9, N'Amit', N'amit@gmail.com', N'123123', N'98997987897', N'lko', 1)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (10, N'Abc', N'aaaa@gmail.com', N'12345', N'123213123123', N'132', 0)
INSERT [dbo].[register] ([id], [name], [email], [password], [mobile], [address], [deletestatus]) VALUES (11, N'Alpha', N'alpha@gmail.com', N'123', N'9898989898', N'lko', NULL)
SET IDENTITY_INSERT [dbo].[register] OFF
GO
SET IDENTITY_INSERT [dbo].[slider] ON 

INSERT [dbo].[slider] ([id], [image]) VALUES (1, N'loginbg1.jpg')
INSERT [dbo].[slider] ([id], [image]) VALUES (2, N'CODERS WAR 1.0 (2).png')
INSERT [dbo].[slider] ([id], [image]) VALUES (3, N'pic5.png')
SET IDENTITY_INSERT [dbo].[slider] OFF
GO
USE [master]
GO
ALTER DATABASE [onlinejobportal] SET  READ_WRITE 
GO
