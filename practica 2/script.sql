USE [Restaurante]
GO
/****** Object:  Index [INDX_Entradas_Restaurante]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Entradas]') AND name = N'INDX_Entradas_Restaurante')
DROP INDEX [INDX_Entradas_Restaurante] ON [dbo].[Entradas]
GO
/****** Object:  Index [INDX_Comida_Restaurante]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comida]') AND name = N'INDX_Comida_Restaurante')
DROP INDEX [INDX_Comida_Restaurante] ON [dbo].[comida]
GO
/****** Object:  Table [dbo].[Postres]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Postres]') AND type in (N'U'))
DROP TABLE [dbo].[Postres]
GO
/****** Object:  Table [dbo].[mesero]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mesero]') AND type in (N'U'))
DROP TABLE [dbo].[mesero]
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Entradas]') AND type in (N'U'))
DROP TABLE [dbo].[Entradas]
GO
/****** Object:  Table [dbo].[comida]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comida]') AND type in (N'U'))
DROP TABLE [dbo].[comida]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bebidas]') AND type in (N'U'))
DROP TABLE [dbo].[Bebidas]
GO
USE [master]
GO
/****** Object:  Database [Restaurante]    Script Date: 14/09/2019 12:29:31 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Restaurante')
DROP DATABASE [Restaurante]
GO
/****** Object:  Database [Restaurante]    Script Date: 14/09/2019 12:29:31 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Restaurante')
BEGIN
CREATE DATABASE [Restaurante]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurante', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Restaurante.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Restaurante_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Restaurante_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Restaurante] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurante].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurante] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurante] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Restaurante] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurante] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurante] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurante] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurante] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurante] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurante] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurante] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Restaurante] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurante] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurante] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurante] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurante] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurante] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurante] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurante] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurante] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurante] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurante] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurante] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurante] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Restaurante] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Restaurante]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 14/09/2019 12:29:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bebidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bebidas](
	[iId] [int] NOT NULL,
	[vBebidaRefill] [varchar](30) NOT NULL,
	[vBebidaNoReffil] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comida]    Script Date: 14/09/2019 12:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comida]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comida](
	[iId] [int] NOT NULL,
	[vNombrePlatillo] [varchar](50) NOT NULL,
	[vDescripcionPlatillo] [varchar](100) NULL,
	[iPrecio] [int] NOT NULL,
	[Platillo]  AS (([vNombrePlatillo]+' ')+[vDescripcionPlatillo]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 14/09/2019 12:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Entradas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Entradas](
	[iId] [int] NOT NULL,
	[vNombreEntrada] [varchar](50) NOT NULL,
	[vDescripcionEntrada] [varchar](100) NOT NULL,
	[iPrecio] [int] NOT NULL,
	[Entradas]  AS (([vNombreEntrada]+' ')+[vDescripcionEntrada]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mesero]    Script Date: 14/09/2019 12:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mesero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mesero](
	[iId] [int] NOT NULL,
	[vNombre] [varchar](30) NOT NULL,
	[vApellidoP] [varchar](30) NOT NULL,
	[vApellidoM] [varchar](30) NOT NULL,
	[NombreCompleto]  AS (((([vNombre]+' ')+[vApellidoP])+' ')+[vApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Postres]    Script Date: 14/09/2019 12:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Postres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Postres](
	[iId] [int] NOT NULL,
	[vNombrePostre] [varchar](50) NOT NULL,
	[vDescripcionPostre] [varchar](100) NULL,
	[iPrecio] [int] NOT NULL,
	[Postre]  AS (([vNombrePostre]+' ')+[vDescripcionPostre]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [INDX_Comida_Restaurante]    Script Date: 14/09/2019 12:29:32 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comida]') AND name = N'INDX_Comida_Restaurante')
CREATE NONCLUSTERED INDEX [INDX_Comida_Restaurante] ON [dbo].[comida]
(
	[vNombrePlatillo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [INDX_Entradas_Restaurante]    Script Date: 14/09/2019 12:29:32 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Entradas]') AND name = N'INDX_Entradas_Restaurante')
CREATE NONCLUSTERED INDEX [INDX_Entradas_Restaurante] ON [dbo].[Entradas]
(
	[vNombreEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Restaurante] SET  READ_WRITE 
GO
