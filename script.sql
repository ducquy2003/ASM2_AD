USE [master]
GO
/****** Object:  Database [Tranning]    Script Date: 12/16/2023 11:25:36 AM ******/
CREATE DATABASE [Tranning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tranning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tranning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tranning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tranning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tranning] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tranning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tranning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tranning] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tranning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tranning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tranning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tranning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tranning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tranning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tranning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tranning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tranning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tranning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tranning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tranning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tranning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tranning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tranning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tranning] SET  MULTI_USER 
GO
ALTER DATABASE [Tranning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tranning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tranning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tranning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tranning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tranning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tranning', N'ON'
GO
ALTER DATABASE [Tranning] SET QUERY_STORE = OFF
GO
USE [Tranning]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[icon] [varchar](200) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [varchar](200) NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[vote] [int] NULL,
	[avatar] [varchar](500) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[status] [tinyint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[videos] [varchar](500) NULL,
	[documents] [varchar](500) NULL,
	[attach_file] [varchar](500) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainee_course]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainee_course](
	[trainee_id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[userid] [bigint] NULL,
 CONSTRAINT [PK_trainee_course] PRIMARY KEY CLUSTERED 
(
	[trainee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainner_topic]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainner_topic](
	[trainner_id] [bigint] IDENTITY(1,1) NOT NULL,
	[topic_id] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[userid] [bigint] NULL,
 CONSTRAINT [PK_trainner_topic] PRIMARY KEY CLUSTERED 
(
	[trainner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/16/2023 11:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NOT NULL,
	[extra_code] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [varchar](100) NULL,
	[gender] [int] NOT NULL,
	[birthday] [date] NULL,
	[avatar] [varchar](100) NULL,
	[last_login] [datetime] NULL,
	[last_logout] [datetime] NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[full_name] [nvarchar](500) NOT NULL,
	[education] [varchar](500) NULL,
	[programming_language] [varchar](500) NULL,
	[toeic_score] [int] NULL,
	[experience] [text] NULL,
	[department] [nvarchar](500) NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_categories_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_vote]  DEFAULT ((0)) FOR [vote]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[topics] ADD  CONSTRAINT [DF_topics_staus]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[trainee_course] ADD  CONSTRAINT [DF_trainee_course_userid]  DEFAULT ((0)) FOR [userid]
GO
ALTER TABLE [dbo].[trainner_topic] ADD  CONSTRAINT [DF_trainner_topic_userid]  DEFAULT ((0)) FOR [userid]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_role_id]  DEFAULT ((0)) FOR [role_id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_categories]
GO
ALTER TABLE [dbo].[topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[topics] CHECK CONSTRAINT [FK_topics_courses]
GO
ALTER TABLE [dbo].[trainee_course]  WITH CHECK ADD  CONSTRAINT [FK_trainee_course_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[trainee_course] CHECK CONSTRAINT [FK_trainee_course_courses]
GO
USE [master]
GO
ALTER DATABASE [Tranning] SET  READ_WRITE 
GO
