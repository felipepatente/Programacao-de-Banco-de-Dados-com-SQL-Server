USE [master]
GO
/****** Object:  Database [megasena]    Script Date: 12/05/2017 19:43:38 ******/
CREATE DATABASE [megasena]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'megasena', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\megasena.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'megasena_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\megasena_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [megasena] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [megasena].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [megasena] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [megasena] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [megasena] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [megasena] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [megasena] SET ARITHABORT OFF 
GO
ALTER DATABASE [megasena] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [megasena] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [megasena] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [megasena] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [megasena] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [megasena] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [megasena] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [megasena] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [megasena] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [megasena] SET  DISABLE_BROKER 
GO
ALTER DATABASE [megasena] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [megasena] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [megasena] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [megasena] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [megasena] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [megasena] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [megasena] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [megasena] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [megasena] SET  MULTI_USER 
GO
ALTER DATABASE [megasena] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [megasena] SET DB_CHAINING OFF 
GO
ALTER DATABASE [megasena] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [megasena] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [megasena] SET DELAYED_DURABILITY = DISABLED 
GO
USE [megasena]
GO
/****** Object:  Table [dbo].[MEGA]    Script Date: 12/05/2017 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEGA](
	[Concurso] [int] NULL,
	[DataSorteio] [datetime] NULL,
	[Dezena1] [int] NULL,
	[Dezena2] [int] NULL,
	[Dezena3] [int] NULL,
	[Dezena4] [int] NULL,
	[Dezena5] [int] NULL,
	[Dezena6] [int] NULL,
	[Arrecadacao_Total] [float] NULL,
	[Ganhadores_Sena] [float] NULL,
	[Cidade] [nvarchar](255) NULL,
	[UF] [nvarchar](255) NULL,
	[Rateio_Sena] [float] NULL,
	[Ganhadores_Quina] [float] NULL,
	[Rateio_Quina] [float] NULL,
	[Ganhadores_Quadra] [float] NULL,
	[Rateio_Quadra] [float] NULL,
	[Acumulado] [nvarchar](255) NULL,
	[Valor_Acumulado] [float] NULL,
	[Estimativa_Prêmio] [float] NULL,
	[Acumulado_Mega_da_Virada] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quantidade]    Script Date: 12/05/2017 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quantidade](
	[dezena] [int] NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [megasena] SET  READ_WRITE 
GO
