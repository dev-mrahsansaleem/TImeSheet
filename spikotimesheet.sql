USE [master]
GO
/****** Object:  Database [spikotimesheet]    Script Date: 27/07/2021 10:25:00 am ******/
CREATE DATABASE [spikotimesheet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spikotimesheet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\spikotimesheet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'spikotimesheet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\spikotimesheet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [spikotimesheet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spikotimesheet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spikotimesheet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spikotimesheet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spikotimesheet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spikotimesheet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spikotimesheet] SET ARITHABORT OFF 
GO
ALTER DATABASE [spikotimesheet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spikotimesheet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spikotimesheet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spikotimesheet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spikotimesheet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spikotimesheet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spikotimesheet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spikotimesheet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spikotimesheet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spikotimesheet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [spikotimesheet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spikotimesheet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spikotimesheet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spikotimesheet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spikotimesheet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spikotimesheet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [spikotimesheet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spikotimesheet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [spikotimesheet] SET  MULTI_USER 
GO
ALTER DATABASE [spikotimesheet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spikotimesheet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spikotimesheet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spikotimesheet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [spikotimesheet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [spikotimesheet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [spikotimesheet] SET QUERY_STORE = OFF
GO
USE [spikotimesheet]
GO
/****** Object:  Schema [stimesheet]    Script Date: 27/07/2021 10:25:01 am ******/
CREATE SCHEMA [stimesheet]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLookUps]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLookUps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[cateegory] [varchar](20) NULL,
 CONSTRAINT [PK__tblLookU__3214EC27C410EC9D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjects]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](500) NULL,
	[creationDate] [datetime] NULL,
	[createdByID] [nvarchar](128) NULL,
	[updationDate] [datetime] NULL,
	[updatedByID] [nvarchar](128) NULL,
 CONSTRAINT [PK__tblProje__3214EC27E9B9E2A4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectsAndUsers]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectsAndUsers](
	[userID] [nvarchar](128) NOT NULL,
	[projectID] [int] NOT NULL,
	[statusID] [int] NULL,
	[creationDate] [datetime] NULL,
	[createdByID] [nvarchar](128) NULL,
	[updationDate] [datetime] NULL,
	[updatedByID] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[projectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSheets]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSheets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](128) NULL,
	[weekNo] [varchar](20) NULL,
	[creationDate] [datetime] NULL,
	[createdByID] [nvarchar](128) NULL,
	[updationDate] [datetime] NULL,
	[updatedByID] [nvarchar](128) NULL,
	[Title] [varchar](50) NULL,
 CONSTRAINT [PK__tblSheet__3214EC27E6CD9957] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSheetStatus]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSheetStatus](
	[ID] [int] NOT NULL,
	[sheetID] [int] NULL,
	[statusID] [int] NULL,
	[creationDate] [datetime] NULL,
	[createdByID] [nvarchar](128) NULL,
	[updationDate] [datetime] NULL,
	[updatedByID] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTasks]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[sheetID] [int] NULL,
	[parentOF] [int] NULL,
	[typeID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[description] [nvarchar](200) NULL,
	[hours] [int] NULL,
	[creationDate] [datetime] NULL,
	[createdByID] [nvarchar](128) NULL,
	[updationDate] [datetime] NULL,
	[updatedByID] [nvarchar](128) NULL,
 CONSTRAINT [PK__tblTasks__3214EC2751A1CFD0] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaskStatus]    Script Date: 27/07/2021 10:25:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskStatus](
	[ID] [int] NOT NULL,
	[taskID] [int] NULL,
	[statusID] [int] NULL,
	[creationDate] [datetime] NULL,
	[createdByID] [nvarchar](128) NULL,
	[updationDate] [datetime] NULL,
	[updatedByID] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[tblProjects]  WITH CHECK ADD  CONSTRAINT [FK__tblProjec__typeI__29221CFB] FOREIGN KEY([typeID])
REFERENCES [dbo].[tblLookUps] ([ID])
GO
ALTER TABLE [dbo].[tblProjects] CHECK CONSTRAINT [FK__tblProjec__typeI__29221CFB]
GO
ALTER TABLE [dbo].[tblProjectsAndUsers]  WITH CHECK ADD  CONSTRAINT [FK__tblProjec__proje__2CF2ADDF] FOREIGN KEY([projectID])
REFERENCES [dbo].[tblProjects] ([ID])
GO
ALTER TABLE [dbo].[tblProjectsAndUsers] CHECK CONSTRAINT [FK__tblProjec__proje__2CF2ADDF]
GO
ALTER TABLE [dbo].[tblProjectsAndUsers]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[tblLookUps] ([ID])
GO
ALTER TABLE [dbo].[tblProjectsAndUsers]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblSheets]  WITH CHECK ADD  CONSTRAINT [FK__tblSheets__userI__30C33EC3] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tblSheets] CHECK CONSTRAINT [FK__tblSheets__userI__30C33EC3]
GO
ALTER TABLE [dbo].[tblSheetStatus]  WITH CHECK ADD  CONSTRAINT [FK__tblSheetS__sheet__339FAB6E] FOREIGN KEY([sheetID])
REFERENCES [dbo].[tblSheets] ([ID])
GO
ALTER TABLE [dbo].[tblSheetStatus] CHECK CONSTRAINT [FK__tblSheetS__sheet__339FAB6E]
GO
ALTER TABLE [dbo].[tblSheetStatus]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[tblLookUps] ([ID])
GO
ALTER TABLE [dbo].[tblTasks]  WITH CHECK ADD  CONSTRAINT [FK__tblTasks__parent__3864608B] FOREIGN KEY([parentOF])
REFERENCES [dbo].[tblTasks] ([ID])
GO
ALTER TABLE [dbo].[tblTasks] CHECK CONSTRAINT [FK__tblTasks__parent__3864608B]
GO
ALTER TABLE [dbo].[tblTasks]  WITH CHECK ADD  CONSTRAINT [FK__tblTasks__sheetI__37703C52] FOREIGN KEY([sheetID])
REFERENCES [dbo].[tblSheets] ([ID])
GO
ALTER TABLE [dbo].[tblTasks] CHECK CONSTRAINT [FK__tblTasks__sheetI__37703C52]
GO
ALTER TABLE [dbo].[tblTasks]  WITH CHECK ADD  CONSTRAINT [FK__tblTasks__typeID__395884C4] FOREIGN KEY([typeID])
REFERENCES [dbo].[tblLookUps] ([ID])
GO
ALTER TABLE [dbo].[tblTasks] CHECK CONSTRAINT [FK__tblTasks__typeID__395884C4]
GO
ALTER TABLE [dbo].[tblTaskStatus]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[tblLookUps] ([ID])
GO
ALTER TABLE [dbo].[tblTaskStatus]  WITH CHECK ADD  CONSTRAINT [FK__tblTaskSt__taskI__3C34F16F] FOREIGN KEY([taskID])
REFERENCES [dbo].[tblTasks] ([ID])
GO
ALTER TABLE [dbo].[tblTaskStatus] CHECK CONSTRAINT [FK__tblTaskSt__taskI__3C34F16F]
GO
USE [master]
GO
ALTER DATABASE [spikotimesheet] SET  READ_WRITE 
GO
