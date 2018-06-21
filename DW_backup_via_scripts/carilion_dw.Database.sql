USE [master]
GO
/****** Object:  Database [carilion_dw]    Script Date: 6/21/2018 11:44:21 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'carilion_dw')
BEGIN
CREATE DATABASE [carilion_dw]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'carilion_dw', FILENAME = N'C:\SqlData\MSSQL14.MSSQLSERVER\MSSQL\DATA\carilion_dw.mdf' , SIZE = 42560KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'carilion_dw_log', FILENAME = N'C:\SqlData\MSSQL14.MSSQLSERVER\MSSQL\DATA\carilion_dw_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [carilion_dw].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [carilion_dw] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [carilion_dw] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [carilion_dw] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [carilion_dw] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [carilion_dw] SET ARITHABORT OFF 
GO
ALTER DATABASE [carilion_dw] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [carilion_dw] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [carilion_dw] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [carilion_dw] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [carilion_dw] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [carilion_dw] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [carilion_dw] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [carilion_dw] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [carilion_dw] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [carilion_dw] SET  DISABLE_BROKER 
GO
ALTER DATABASE [carilion_dw] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [carilion_dw] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [carilion_dw] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [carilion_dw] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [carilion_dw] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [carilion_dw] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [carilion_dw] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [carilion_dw] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [carilion_dw] SET  MULTI_USER 
GO
ALTER DATABASE [carilion_dw] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [carilion_dw] SET DB_CHAINING OFF 
GO
ALTER DATABASE [carilion_dw] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [carilion_dw] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [carilion_dw] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'carilion_dw', N'ON'
GO
ALTER DATABASE [carilion_dw] SET QUERY_STORE = OFF
GO
USE [carilion_dw]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE [carilion_dw] SET  READ_WRITE 
GO
