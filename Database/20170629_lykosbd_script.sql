USE [master]
GO
/****** Object:  Database [lykos]    Script Date: 29.06.2017 20:06:13 ******/
CREATE DATABASE [lykos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lykos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.VIKTOR\MSSQL\DATA\lykos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lykos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.VIKTOR\MSSQL\DATA\lykos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lykos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lykos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lykos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lykos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lykos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lykos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lykos] SET ARITHABORT OFF 
GO
ALTER DATABASE [lykos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lykos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lykos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lykos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lykos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lykos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lykos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lykos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lykos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lykos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lykos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lykos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lykos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lykos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lykos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lykos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lykos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lykos] SET RECOVERY FULL 
GO
ALTER DATABASE [lykos] SET  MULTI_USER 
GO
ALTER DATABASE [lykos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lykos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lykos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lykos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [lykos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'lykos', N'ON'
GO
USE [lykos]
GO
/****** Object:  Schema [items]    Script Date: 29.06.2017 20:06:13 ******/
CREATE SCHEMA [items]
GO
/****** Object:  Schema [result]    Script Date: 29.06.2017 20:06:13 ******/
CREATE SCHEMA [result]
GO
/****** Object:  Schema [users]    Script Date: 29.06.2017 20:06:13 ******/
CREATE SCHEMA [users]
GO
/****** Object:  Table [dbo].[all_categories]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[all_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_part_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[change_initiator]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[change_initiator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[change_need_approve]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[change_need_approve](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[change_need_submit]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[change_need_submit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[change_strategy]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[change_strategy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[component_type]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[component_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country_impacted]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country_impacted](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[form_parts_categories]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_parts_categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_form_parts_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[form_status]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_form_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[marketing_authorithation_holder]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[marketing_authorithation_holder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[packaging_matrials_period]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[packaging_matrials_period](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pharmaceutical_form]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pharmaceutical_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_code]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_name]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sell_out_period]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sell_out_period](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[strength]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[strength](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[type_of_artwork]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[type_of_artwork](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[type_of_change]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[type_of_change](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
 CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[login] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[comment] [nvarchar](500) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[variation_type]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[variation_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [result].[forms]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [result].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operator_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
	[saved_date] [datetime] NOT NULL,
	[send_date] [datetime] NULL,
	[signed_date] [datetime] NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK_forms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [result].[forms_info]    Script Date: 29.06.2017 20:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [result].[forms_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[product_name] [int] NULL,
	[pharmaceutical_form] [int] NULL,
	[strength] [int] NULL,
	[product_code] [int] NULL,
	[manufacturer] [int] NULL,
	[marketing_authorithation_holder] [int] NULL,
	[country_impacted] [int] NULL,
	[change_initiator] [int] NULL,
	[date_of_request] [date] NULL,
	[type_of_artwork] [int] NULL,
	[type_of_change] [int] NULL,
	[variation_type] [int] NULL,
	[change_need_submit] [int] NULL,
	[change_need_approve] [int] NULL,
	[packaging_matrials_period] [int] NULL,
	[sell_out_period] [int] NULL,
	[comments1] [nvarchar](max) NULL,
	[component_type] [int] NULL,
	[change_strategy] [int] NULL,
	[comments2] [nvarchar](max) NULL,
	[implementation_date] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[all_categories] ON 

INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (1, 1, N'Product Name')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (2, 1, N'Pharmaceutical form')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (3, 1, N'Strength')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (4, 1, N'Product code')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (5, 1, N'Manufacturer')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (6, 1, N'Marketing Authorithation Holder')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (7, 1, N'Country Impacted')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (8, 1, N'Change initiator')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (10, 1, N'Date of request')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (11, 2, N'Type of artwork')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (12, 2, N'Type of change')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (13, 2, N'Variation type')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (14, 2, N'Does this change need to be submitted to regulatory authority before implementation?')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (15, 2, N'Does this change need to be approved by regulatory authority before implementation?')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (16, 2, N'How long can old packaging matrials still be used at manufacturing site after approval/notification?')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (17, 2, N'How long is the sell-out period of the imported finished product manufactured with old packaging after approval in the country')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (18, 2, N'Comments')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (19, 3, N'Type of component (should be attach approved artwork)')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (20, 4, N'Change strategy')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (21, 4, N'Implementation Date')
INSERT [dbo].[all_categories] ([id], [form_part_cat_id], [name]) VALUES (22, 4, N'Comments')
SET IDENTITY_INSERT [dbo].[all_categories] OFF
SET IDENTITY_INSERT [dbo].[change_initiator] ON 

INSERT [dbo].[change_initiator] ([id], [all_cat_id], [name]) VALUES (1, 8, N'Olga Kravchuk')
INSERT [dbo].[change_initiator] ([id], [all_cat_id], [name]) VALUES (2, 8, N'Maria Zharkova')
INSERT [dbo].[change_initiator] ([id], [all_cat_id], [name]) VALUES (3, 8, N'Zulfia Mamedova')
INSERT [dbo].[change_initiator] ([id], [all_cat_id], [name]) VALUES (4, 8, N'Anastasiya Shapovalova')
INSERT [dbo].[change_initiator] ([id], [all_cat_id], [name]) VALUES (5, 8, N'Alla Gunceva')
SET IDENTITY_INSERT [dbo].[change_initiator] OFF
SET IDENTITY_INSERT [dbo].[change_need_approve] ON 

INSERT [dbo].[change_need_approve] ([id], [all_cat_id], [name]) VALUES (1, 15, N'No')
INSERT [dbo].[change_need_approve] ([id], [all_cat_id], [name]) VALUES (2, 15, N'Yes: Expected Approval date:…..or Approval  date')
SET IDENTITY_INSERT [dbo].[change_need_approve] OFF
SET IDENTITY_INSERT [dbo].[change_need_submit] ON 

INSERT [dbo].[change_need_submit] ([id], [all_cat_id], [name]) VALUES (1, 14, N'No')
INSERT [dbo].[change_need_submit] ([id], [all_cat_id], [name]) VALUES (2, 14, N'Yes: Planned submission date….. or submission date…..')
SET IDENTITY_INSERT [dbo].[change_need_submit] OFF
SET IDENTITY_INSERT [dbo].[change_strategy] ON 

INSERT [dbo].[change_strategy] ([id], [all_cat_id], [name]) VALUES (1, 20, N'depend on section 2')
SET IDENTITY_INSERT [dbo].[change_strategy] OFF
SET IDENTITY_INSERT [dbo].[component_type] ON 

INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (1, 19, N'leaflet')
INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (2, 19, N'carton')
INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (3, 19, N'blister')
INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (4, 19, N'tube')
INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (5, 19, N'sachet')
INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (6, 19, N'label')
INSERT [dbo].[component_type] ([id], [all_cat_id], [name]) VALUES (7, 19, N'foil ')
SET IDENTITY_INSERT [dbo].[component_type] OFF
SET IDENTITY_INSERT [dbo].[country_impacted] ON 

INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (1, 7, N'Azerbaijan')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (2, 7, N'Armenia')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (3, 7, N'Georgia')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (4, 7, N'Kazakhstan')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (5, 7, N'Kyrgystan')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (6, 7, N'Moldova')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (7, 7, N'Russia')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (8, 7, N'Ukraine')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (9, 7, N'Uzbekistan')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (10, 7, N'Turkmenistan')
INSERT [dbo].[country_impacted] ([id], [all_cat_id], [name]) VALUES (11, 7, N'CIS')
SET IDENTITY_INSERT [dbo].[country_impacted] OFF
INSERT [dbo].[form_parts_categories] ([id], [name]) VALUES (1, N'Change request information')
INSERT [dbo].[form_parts_categories] ([id], [name]) VALUES (2, N'Description of the change')
INSERT [dbo].[form_parts_categories] ([id], [name]) VALUES (3, N'Packaging component(s)s to be change')
INSERT [dbo].[form_parts_categories] ([id], [name]) VALUES (4, N'Change`s implementation strategy')
SET IDENTITY_INSERT [dbo].[form_status] ON 

INSERT [dbo].[form_status] ([id], [category_name]) VALUES (1, N'edit')
INSERT [dbo].[form_status] ([id], [category_name]) VALUES (2, N'saved')
INSERT [dbo].[form_status] ([id], [category_name]) VALUES (3, N'send_tosign')
INSERT [dbo].[form_status] ([id], [category_name]) VALUES (4, N'signed')
SET IDENTITY_INSERT [dbo].[form_status] OFF
SET IDENTITY_INSERT [dbo].[manufacturer] ON 

INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (1, 5, N'OSO Biopharmaceuticals Manufacturing, LLC”, USA')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (2, 5, N'Pierre Fabre Medicament Production, Aquitaine Pharm International”, France')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (3, 5, N'Helsinn Birex Pharmaceuticals Ltd., Ireland')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (4, 5, N'Italfarmaco S.p.A., Italy,')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (5, 5, N'Aziende Chimiche Riunite Angelini Francesco A.C.R.A.F. S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (6, 5, N'Laboratoires Expanscience, France')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (7, 5, N'Angelini Pharma Ceska republika s.r.o.')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (8, 5, N'Laboratori Baldacci S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (9, 5, N'Catalent Italy S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (10, 5, N'Doppel Farmaceutici S.r.l., Cortemaggiore (PC) – Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (11, 5, N'Doppel Farmaceutici S.r.l., Rozzano -Italy ')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (12, 5, N'Abiogen Pharma S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (13, 5, N'Alfa Wassermann S.p.a., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (14, 5, N'Istituto De Angeli S.r.l., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (15, 5, N'Lamp San Prospero SpA., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (16, 5, N'Valpharma S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (17, 5, N'Dompe farmaceutici S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (18, 5, N'Zellaerosol GmbH, Germany')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (19, 5, N'Fidia Farmaceutici S.p.A., Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (20, 5, N'Edmond Pharma, Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (21, 5, N'LABIANA Pharmaceuticals S.L.U., Spain')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (22, 5, N'Fine Foods & Pharmaceuticals N.T.M. S.p.A.')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (23, 5, N'PIERRE FABRE MEDICAMENT PRODUCTION, Aignan, France')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (24, 5, N'Mipharm S.p.A, ')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (25, 5, N'IBSA Institut Biochimique SA, Italy')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (26, 5, N'DISCH AG, Switzerland')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (27, 5, N'Angelini Pharma Osterreich GmbH, Austria')
INSERT [dbo].[manufacturer] ([id], [all_cat_id], [name]) VALUES (28, 5, N'Famar S.p.A., Italy ')
SET IDENTITY_INSERT [dbo].[manufacturer] OFF
SET IDENTITY_INSERT [dbo].[marketing_authorithation_holder] ON 

INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (1, 6, N'Helsinn Birex Pharmaceuticals Ltd., Ireland')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (2, 6, N'Italfarmaco S.p.A., Italy,')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (3, 6, N'Aziende Chimiche Riunite Angelini Francesco A.C.R.A.F. S.p.A., Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (4, 6, N'Laboratoires Expanscience, France')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (5, 6, N'Polichem S.r.l., Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (6, 6, N'UAB MRA, Lithuania')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (7, 6, N'Angelini Pharma Ceska republika s.r.o.')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (8, 6, N'Laboratori Baldacci S.p.A., Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (9, 6, N'Dompe farmaceutici S.p.A., Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (10, 6, N'DIFASS International S.r.l., Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (11, 6, N'IBSA Institut Biochimique SA, Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (12, 6, N'Fidia Farmaceutici S.p.A., Italy')
INSERT [dbo].[marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (13, 6, N'SCHARPER S.p.A. Italy')
SET IDENTITY_INSERT [dbo].[marketing_authorithation_holder] OFF
SET IDENTITY_INSERT [dbo].[packaging_matrials_period] ON 

INSERT [dbo].[packaging_matrials_period] ([id], [all_cat_id], [name]) VALUES (1, 16, N'until expiery day')
INSERT [dbo].[packaging_matrials_period] ([id], [all_cat_id], [name]) VALUES (2, 16, N'define deadline')
SET IDENTITY_INSERT [dbo].[packaging_matrials_period] OFF
SET IDENTITY_INSERT [dbo].[pharmaceutical_form] ON 

INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (1, 2, N'solution for injection')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (2, 2, N'vaginal cream')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (3, 2, N'powder for solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (4, 2, N'hard capsules')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (5, 2, N'powder for suspension')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (6, 2, N'granules for solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (7, 2, N'vaginal suppositories')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (8, 2, N'syrup')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (9, 2, N'soft capsules')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (10, 2, N'oral solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (11, 2, N'coated tablets')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (12, 2, N'soft vaginal capsules')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (13, 2, N'granules for oral solution ')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (14, 2, N'solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (15, 2, N'spray')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (16, 2, N'powder for vaginal solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (17, 2, N'vaginal solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (18, 2, N'mouthwash solution')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (19, 2, N'prolonged release tablets')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (20, 2, N'lozenges')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (21, 2, N'film-coated prolonged release tablets')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (22, 2, N'vaginal tablets')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (23, 2, N'prefilled syringe')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (24, 2, N'drops')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (25, 2, N'foam')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (26, 2, N'gel')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (27, 2, N'rectal suppositories')
INSERT [dbo].[pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (28, 2, N'effervescent tablets')
SET IDENTITY_INSERT [dbo].[pharmaceutical_form] OFF
SET IDENTITY_INSERT [dbo].[product_code] ON 

INSERT [dbo].[product_code] ([id], [all_cat_id], [name]) VALUES (1, 4, N'11')
INSERT [dbo].[product_code] ([id], [all_cat_id], [name]) VALUES (2, 4, N'12')
SET IDENTITY_INSERT [dbo].[product_code] OFF
SET IDENTITY_INSERT [dbo].[product_name] ON 

INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (1, 1, N'Aloxi')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (2, 1, N'Artrosilene')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (3, 1, N'Dafnegin')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (4, 1, N'Dalifast')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (5, 1, N'Dialrapid')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (6, 1, N'Ermucin')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (7, 1, N'Erdomed')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (8, 1, N'Feminella')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (9, 1, N'Fluifort')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (10, 1, N'Gool')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (11, 1, N'Gliatilin')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (12, 1, N'Hyalgan')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (13, 1, N'Hymovis')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (14, 1, N'Intragel')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (15, 1, N'Macmiror ')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (16, 1, N'Macmiror Complex')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (17, 1, N'Metadoxil')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (18, 1, N'Normogin')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (19, 1, N'OKI')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (20, 1, N'Onicit')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (21, 1, N'Piascledine 300')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (22, 1, N'Spasmovax')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (23, 1, N'Tantum Verde')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (24, 1, N'Tecnofer')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (25, 1, N'Tantum Rosa')
INSERT [dbo].[product_name] ([id], [all_cat_id], [name]) VALUES (26, 1, N'Trittico')
SET IDENTITY_INSERT [dbo].[product_name] OFF
SET IDENTITY_INSERT [dbo].[sell_out_period] ON 

INSERT [dbo].[sell_out_period] ([id], [all_cat_id], [name]) VALUES (1, 17, N'until expiry date')
INSERT [dbo].[sell_out_period] ([id], [all_cat_id], [name]) VALUES (2, 17, N'until next import cycle')
INSERT [dbo].[sell_out_period] ([id], [all_cat_id], [name]) VALUES (3, 17, N'define deadline')
SET IDENTITY_INSERT [dbo].[sell_out_period] OFF
SET IDENTITY_INSERT [dbo].[strength] ON 

INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (1, 3, N'15%')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (2, 3, N'320 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (3, 3, N'5%')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (4, 3, N'80 mg/ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (5, 3, N'160 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (6, 3, N'60 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (7, 3, N'1%')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (8, 3, N'100 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (9, 3, N'600 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (10, 3, N'1000 mg/3 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (11, 3, N'1000 mg/4 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (12, 3, N'400 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (13, 3, N'20 mg/2 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (14, 3, N'24 mg/3 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (15, 3, N'40 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (16, 3, N'150 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (17, 3, N'80 mg/ 80 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (18, 3, N'40 mg/ 4 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (19, 3, N'500 mg, 200 000 UI')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (20, 3, N'200 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (21, 3, N'175 mg/ 5 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (22, 3, N'225 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (23, 3, N'500 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (24, 3, N'300 mg/ 5 ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (25, 3, N'90 mg/ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (26, 3, N'2,7 g/ 5 g')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (27, 3, N'50 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (28, 3, N'80 mg/ 2 g')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (29, 3, N'16 mg/ ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (30, 3, N'300 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (31, 3, N'500 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (32, 3, N'0,1%')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (33, 3, N'3 mg')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (34, 3, N'1,5 mg/ml')
INSERT [dbo].[strength] ([id], [all_cat_id], [name]) VALUES (35, 3, N'0,25 mg/5 ml')
SET IDENTITY_INSERT [dbo].[strength] OFF
SET IDENTITY_INSERT [dbo].[type_of_artwork] ON 

INSERT [dbo].[type_of_artwork] ([id], [all_cat_id], [name]) VALUES (1, 11, N'Artwork for submission to Authority')
INSERT [dbo].[type_of_artwork] ([id], [all_cat_id], [name]) VALUES (2, 11, N'Artwork for production')
SET IDENTITY_INSERT [dbo].[type_of_artwork] OFF
SET IDENTITY_INSERT [dbo].[type_of_change] ON 

INSERT [dbo].[type_of_change] ([id], [all_cat_id], [name]) VALUES (1, 12, N'Authority')
INSERT [dbo].[type_of_change] ([id], [all_cat_id], [name]) VALUES (2, 12, N'Manufacturing')
INSERT [dbo].[type_of_change] ([id], [all_cat_id], [name]) VALUES (3, 12, N'Regulatory Affairs')
INSERT [dbo].[type_of_change] ([id], [all_cat_id], [name]) VALUES (4, 12, N'Marketing')
SET IDENTITY_INSERT [dbo].[type_of_change] OFF
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([id], [name]) VALUES (1, N'developer')
INSERT [dbo].[user_role] ([id], [name]) VALUES (2, N'head')
INSERT [dbo].[user_role] ([id], [name]) VALUES (3, N'manager')
SET IDENTITY_INSERT [dbo].[user_role] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([login], [fullName], [comment], [id], [user_role_id]) VALUES (N'kravchuk', N'Кравчук Ольга', N'Head of Regulatory Affairs Russia, Ukraine and CIS Countries', 1, 2)
INSERT [dbo].[users] ([login], [fullName], [comment], [id], [user_role_id]) VALUES (N'vites', N'Дубровін Віктор', N'Programm Developer', 2, 1)
INSERT [dbo].[users] ([login], [fullName], [comment], [id], [user_role_id]) VALUES (N'zharkova', N'Марія Жаркова', N'Manager', 3, 3)
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[variation_type] ON 

INSERT [dbo].[variation_type] ([id], [all_cat_id], [name]) VALUES (1, 13, N'New registration')
INSERT [dbo].[variation_type] ([id], [all_cat_id], [name]) VALUES (2, 13, N'Renewal')
INSERT [dbo].[variation_type] ([id], [all_cat_id], [name]) VALUES (3, 13, N'Variation ')
INSERT [dbo].[variation_type] ([id], [all_cat_id], [name]) VALUES (4, 13, N'other')
SET IDENTITY_INSERT [dbo].[variation_type] OFF
SET IDENTITY_INSERT [result].[forms] ON 

INSERT [result].[forms] ([id], [operator_id], [name], [saved_date], [send_date], [signed_date], [status_id]) VALUES (17, 2, N'TEstForm13', CAST(N'2017-06-26 23:51:05.423' AS DateTime), NULL, NULL, 2)
INSERT [result].[forms] ([id], [operator_id], [name], [saved_date], [send_date], [signed_date], [status_id]) VALUES (18, 2, N'TEstForm13', CAST(N'2017-06-26 23:52:57.673' AS DateTime), NULL, NULL, 3)
INSERT [result].[forms] ([id], [operator_id], [name], [saved_date], [send_date], [signed_date], [status_id]) VALUES (20, 3, N'TEstForm9_Марія Жаркова', CAST(N'2017-06-28 17:15:15.940' AS DateTime), NULL, NULL, 4)
SET IDENTITY_INSERT [result].[forms] OFF
SET IDENTITY_INSERT [result].[forms_info] ON 

INSERT [result].[forms_info] ([id], [form_id], [product_name], [pharmaceutical_form], [strength], [product_code], [manufacturer], [marketing_authorithation_holder], [country_impacted], [change_initiator], [date_of_request], [type_of_artwork], [type_of_change], [variation_type], [change_need_submit], [change_need_approve], [packaging_matrials_period], [sell_out_period], [comments1], [component_type], [change_strategy], [comments2], [implementation_date]) VALUES (9, 18, 1, 1, 1, 1, 1, 1, 1, 1, CAST(N'2017-06-29' AS Date), 1, 1, 1, 1, 1, 1, 1, N'Comments1', 1, 1, N'Comments2', CAST(N'2017-06-22' AS Date))
INSERT [result].[forms_info] ([id], [form_id], [product_name], [pharmaceutical_form], [strength], [product_code], [manufacturer], [marketing_authorithation_holder], [country_impacted], [change_initiator], [date_of_request], [type_of_artwork], [type_of_change], [variation_type], [change_need_submit], [change_need_approve], [packaging_matrials_period], [sell_out_period], [comments1], [component_type], [change_strategy], [comments2], [implementation_date]) VALUES (11, 20, 1, 1, 1, 1, 1, 1, 1, 1, CAST(N'2017-06-29' AS Date), 1, 1, 1, 1, 1, 1, 1, N'Comments', 1, 1, N'Comments2', CAST(N'2017-06-29' AS Date))
SET IDENTITY_INSERT [result].[forms_info] OFF
ALTER TABLE [dbo].[all_categories]  WITH CHECK ADD FOREIGN KEY([form_part_cat_id])
REFERENCES [dbo].[form_parts_categories] ([id])
GO
ALTER TABLE [dbo].[change_initiator]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[change_need_approve]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[change_need_submit]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[change_strategy]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[component_type]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[country_impacted]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[manufacturer]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[marketing_authorithation_holder]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[packaging_matrials_period]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[pharmaceutical_form]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[product_code]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[product_name]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[sell_out_period]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[strength]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[type_of_artwork]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[type_of_change]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([user_role_id])
REFERENCES [dbo].[user_role] ([id])
GO
ALTER TABLE [dbo].[variation_type]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [dbo].[all_categories] ([id])
GO
ALTER TABLE [result].[forms]  WITH CHECK ADD FOREIGN KEY([operator_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [result].[forms]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[form_status] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([change_strategy])
REFERENCES [dbo].[change_strategy] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([change_initiator])
REFERENCES [dbo].[change_initiator] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([change_need_submit])
REFERENCES [dbo].[change_need_submit] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([change_need_approve])
REFERENCES [dbo].[change_need_approve] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([component_type])
REFERENCES [dbo].[component_type] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([country_impacted])
REFERENCES [dbo].[country_impacted] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([form_id])
REFERENCES [result].[forms] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([manufacturer])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([marketing_authorithation_holder])
REFERENCES [dbo].[marketing_authorithation_holder] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([packaging_matrials_period])
REFERENCES [dbo].[packaging_matrials_period] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([pharmaceutical_form])
REFERENCES [dbo].[pharmaceutical_form] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([product_name])
REFERENCES [dbo].[product_name] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([product_code])
REFERENCES [dbo].[product_code] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([sell_out_period])
REFERENCES [dbo].[sell_out_period] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([strength])
REFERENCES [dbo].[strength] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([type_of_artwork])
REFERENCES [dbo].[type_of_artwork] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([type_of_change])
REFERENCES [dbo].[type_of_change] ([id])
GO
ALTER TABLE [result].[forms_info]  WITH CHECK ADD FOREIGN KEY([variation_type])
REFERENCES [dbo].[variation_type] ([id])
GO
/****** Object:  StoredProcedure [dbo].[fillGridView_forms]    Script Date: 29.06.2017 20:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[fillGridView_forms] 
	@operator_id NVARCHAR(30),
	@operator_role NVARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;

	IF (@operator_role LIKE 'manager')
	     BEGIN
	        SELECT  
	        sts.category_name as [status], 
	        frms.id as id, 
	        usrs.fullName, 
	        usrs.comment, 
	        frms.[operator_id], 
            frms.[name], 
	        frms.[saved_date], 
	        frms.[send_date], 
	        frms.[signed_date] 
	        		FROM [result].[forms] as frms
                    LEFT OUTER JOIN dbo.users as usrs 
                    on frms.[operator_id] = usrs.id
                    LEFT OUTER JOIN dbo.[form_status] as sts 
                    on frms.[status_id] = sts.id 
	        		WHERE frms.operator_id LIKE @operator_id 
	        		ORDER BY frms.[id] DESC
        END
	ELSE
	    BEGIN
		    SELECT  
	            sts.category_name as [status], 
	            frms.id as id, 
	            usrs.fullName, 
	            usrs.comment, 
	            frms.[operator_id], 
                frms.[name], 
	            frms.[saved_date], 
	            frms.[send_date], 
	            frms.[signed_date] 
	            		FROM [result].[forms] as frms
                        LEFT OUTER JOIN dbo.users as usrs 
                        on frms.[operator_id] = usrs.id
                        LEFT OUTER JOIN dbo.[form_status] as sts 
                        on frms.[status_id] = sts.id 	            		
	            		ORDER BY frms.[id] DESC

		END
END

GO
USE [master]
GO
ALTER DATABASE [lykos] SET  READ_WRITE 
GO




UA - Ukraine, RU - Russia, KZ - Kazakhstan, CIS и СIS2 это CIS

id	all_cat_id	name
1	Azerbaijan
2	Armenia
3	Georgia
4	Kazakhstan
5	Kyrgystan
6	Moldova
7	Russia
8	Ukraine
9	Uzbekistan
10	Turkmenistan
11	CIS

INSERT into [product_code] values
(4, '129074UA', 8),
(4, '129463UA', 8),
(4, '129464UA', 8),
(4, '129467UA', 8),
(4, '129466UA', 8),
(4, '129878UA', 8),
(4, '129670UA', 8),
(4, '129966UA', 8),
(4, '129967UA', 8),
(4, '8700433UA', 8),
(4, 'PFLGLI14CPUA', 8),
(4, 'PFLIN0014UA', 8),
(4, '60005236UA', 8),
(4, '60005222UA', 8),
(4, '60005195UA', 8),
(4, '129480RU', 7),
(4, '129809RU', 7),
(4, '46000006RU', 7),
(4, '46000008RU', 7),
(4, '46000013RU', 7),
(4, '46000000RU', 7),
(4, '46000171RU', 7),
(4, '46000089RU', 7),
(4, '46000045RU', 7),
(4, '46000183RU', 7),
(4, '46000018RU', 7),
(4, '8702648RU', 7),
(4, 'SL7328RU', 7),
(4, '60005194RU', 7),
(4, '60005219RU', 7),
(4, '60005238RU', 7),
(4, 'SL7277RU', 7),
(4, '1562010088432RU', 7),
(4, '129738CIS2', 11),
(4, '129737CIS2', 11),
(4, '60005209CIS2', 11),
(4, '129361CIS', 11),
(4, '129282CIS', 11),
(4, '129369CIS', 11),
(4, '129669CIS', 11),
(4, '129196CIS', 11),
(4, '60005230CIS', 11),
(4, 'PFLR25937020CIS', 11),
(4, '60005500CIS', 11),
(4, '60005189CIS', 11),
(4, '129620KZ', 4),
(4, '129624KZ', 4),
(4, '129623KZ', 4),
(4, '129621KZ', 4),
(4, '129622KZ', 4),
(4, '129811KZ', 4),
(4, '60005190KZ', 4),

use lykos
CREATE TABLE [result].[formManufacturerRef](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] foreign key references [result].[forms] (id),
	[manufacture_id] [int] foreign key references dbo.manufacturer (id)	
	)



