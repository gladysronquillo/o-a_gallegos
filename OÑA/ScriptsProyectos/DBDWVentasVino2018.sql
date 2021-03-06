USE [master]
GO
/****** Object:  Database [DWVentasVino2018]    Script Date: 08/01/2018 19:09:48 ******/
CREATE DATABASE [DWVentasVino2018]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWVentasVino2018', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DWVentasVino2018.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWVentasVino2018_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DWVentasVino2018_log.ldf' , SIZE = 102144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [DWVentasVino2018] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWVentasVino2018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWVentasVino2018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWVentasVino2018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWVentasVino2018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWVentasVino2018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWVentasVino2018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DWVentasVino2018] SET  MULTI_USER 
GO
ALTER DATABASE [DWVentasVino2018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWVentasVino2018] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWVentasVino2018] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWVentasVino2018] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWVentasVino2018] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWVentasVino2018', N'ON'
GO
ALTER DATABASE [DWVentasVino2018] SET QUERY_STORE = OFF
GO
USE [DWVentasVino2018]
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
USE [DWVentasVino2018]
GO
/****** Object:  Table [dbo].[DimCliente]    Script Date: 08/01/2018 19:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCliente](
	[IdCliente] [int] NOT NULL,
	[Identidad] [varchar](50) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Ciudad] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[DesTipoCliente] [varchar](50) NULL,
 CONSTRAINT [PK_DimCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 08/01/2018 19:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[IdFecha] [int] NOT NULL,
	[Date] [datetime] NULL,
	[DayName] [varchar](9) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[FiscalMonth] [varchar](2) NULL,
	[FiscalQuarter] [char](1) NULL,
	[FiscalQuarterName] [varchar](9) NULL,
	[FiscalYear] [char](4) NULL,
	[FiscalYearName] [char](7) NULL,
	[FiscalMonthYear] [char](10) NULL,
	[FiscalMMYYYY] [char](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEntrega]    Script Date: 08/01/2018 19:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEntrega](
	[IdEntrega] [int] NOT NULL,
	[Ciudad] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
 CONSTRAINT [PK_DimEntrega] PRIMARY KEY CLUSTERED 
(
	[IdEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProducto]    Script Date: 08/01/2018 19:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducto](
	[IdProducto] [int] NOT NULL,
	[NombreProducto] [varchar](50) NULL,
	[DescripcionGrupoVino] [varchar](50) NULL,
	[Costo] [numeric](18, 0) NULL,
	[Precio] [numeric](18, 0) NULL,
 CONSTRAINT [PK_DimProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactOrderItem]    Script Date: 08/01/2018 19:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOrderItem](
	[IdOrden] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdFechaOrden] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdEntrega] [int] NOT NULL,
	[Cantidad] [numeric](18, 0) NULL,
	[Precio] [numeric](18, 0) NULL,
	[Costo] [numeric](18, 0) NULL,
	[TotalCosto] [numeric](18, 0) NULL,
	[TotalVenta] [numeric](18, 0) NULL,
	[TotalUtilidad] [numeric](18, 0) NULL,
 CONSTRAINT [PK_FactOrderItem_1] PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC,
	[IdProducto] ASC,
	[IdFechaOrden] ASC,
	[IdCliente] ASC,
	[IdEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactOrderItem]  WITH NOCHECK ADD  CONSTRAINT [FK_FactOrderItem_DimCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[DimCliente] ([IdCliente])
GO
ALTER TABLE [dbo].[FactOrderItem] CHECK CONSTRAINT [FK_FactOrderItem_DimCliente]
GO
ALTER TABLE [dbo].[FactOrderItem]  WITH NOCHECK ADD  CONSTRAINT [FK_FactOrderItem_DimDate] FOREIGN KEY([IdFechaOrden])
REFERENCES [dbo].[DimDate] ([IdFecha])
GO
ALTER TABLE [dbo].[FactOrderItem] CHECK CONSTRAINT [FK_FactOrderItem_DimDate]
GO
ALTER TABLE [dbo].[FactOrderItem]  WITH NOCHECK ADD  CONSTRAINT [FK_FactOrderItem_DimEntrega] FOREIGN KEY([IdEntrega])
REFERENCES [dbo].[DimEntrega] ([IdEntrega])
GO
ALTER TABLE [dbo].[FactOrderItem] CHECK CONSTRAINT [FK_FactOrderItem_DimEntrega]
GO
ALTER TABLE [dbo].[FactOrderItem]  WITH NOCHECK ADD  CONSTRAINT [FK_FactOrderItem_DimProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[DimProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[FactOrderItem] CHECK CONSTRAINT [FK_FactOrderItem_DimProducto]
GO
/****** Object:  StoredProcedure [dbo].[FillDimTime]    Script Date: 08/01/2018 19:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillDimTime]
as
BEGIN

--Specify Total Number of Hours You need to fill in Time Dimension
DECLARE @Size INTEGER
--iF @Size=32 THEN This will Fill values Upto 32:59 hr in Time Dimension 
Set @Size=23

DECLARE @hour INTEGER
DECLARE @minute INTEGER
DECLARE @second INTEGER
DECLARE @k INTEGER
DECLARE @TimeAltKey INTEGER
DECLARE @TimeInSeconds INTEGER
DECLARE @Time30 varchar(25)
DECLARE @Hour30 varchar(4)
DECLARE @Minute30 varchar(4)
DECLARE @Second30 varchar(4)
DECLARE @HourBucket varchar(15)
DECLARE @HourBucketGroupKey int
DECLARE @DayTimeBucket varchar(100)
DECLARE @DayTimeBucketGroupKey int

SET @hour = 0
SET @minute = 0
SET @second  = 0
SET @k  = 0
SET @TimeAltKey  = 0

WHILE(@hour<= @Size ) 
BEGIN
	
	if (@hour <10 )
		 begin
		 set @Hour30 = '0' + cast( @hour as varchar(10))
		 end
	else
		 begin
		 set @Hour30 = @hour 
		 end
	--Create Hour Bucket Value	 
	set @HourBucket= @Hour30+':00' +'-' +@Hour30+':59' 
	
	
	WHILE(@minute <= 59) 
	BEGIN
		WHILE(@second  <= 59)
		 BEGIN	
	 
		 set @TimeAltKey = @hour *10000 +@minute*100 +@second 
		 set @TimeInSeconds =@hour * 3600 + @minute *60 +@second 
		
		 If @minute  <10 
		   begin
		   set @Minute30  = '0' + cast ( @minute as varchar(10) )
		   end
		 else
		   begin
		   set @Minute30  = @minute 
		   end
		 
		 if @second   <10 
		   begin
		   set @Second30   = '0' + cast ( @second as varchar(10) )
		   end
		 else
		   begin
		   set @Second30  = @second 
		   end
	--Concatenate values for Time30	 
	set @Time30 = @Hour30 +':'+@Minute30 +':'+@Second30 
		 
    --DayTimeBucketGroupKey can be used in Sorting of DayTime Bucket In proper Order
    SELECT @DayTimeBucketGroupKey =
        CASE
			 WHEN (@TimeAltKey >= 00000 AND  @TimeAltKey <= 25959) THEN 0 
			 WHEN (@TimeAltKey >= 30000 AND  @TimeAltKey <= 65959) THEN 1 
             WHEN (@TimeAltKey >= 70000 AND @TimeAltKey <= 85959)  THEN 2
             WHEN (@TimeAltKey >= 90000 AND @TimeAltKey <= 115959) THEN 3
             WHEN (@TimeAltKey >= 120000 AND @TimeAltKey <= 135959)THEN 4
             WHEN (@TimeAltKey >= 140000 AND @TimeAltKey <= 155959)THEN 5
             WHEN (@TimeAltKey >= 50000 AND @TimeAltKey <= 175959) THEN 6 
             WHEN (@TimeAltKey >= 180000 AND @TimeAltKey <= 235959)THEN 7 
             WHEN (@TimeAltKey >= 240000) THEN  8
        END              
     --print @DayTimeBucketGroupKey
	-- DayTimeBucket Time Divided in Spcific Time Zone So Data can Be Grouped as per Bucket for Analyzing as per time of day
    SELECT @DayTimeBucket =
        CASE 
             WHEN (@TimeAltKey >= 00000 AND  @TimeAltKey <= 25959) THEN  'Late Night (00:00 AM To 02:59 AM)' 
             WHEN (@TimeAltKey >= 30000 AND  @TimeAltKey <= 65959) THEN  'Early Morning(03:00 AM To 6:59 AM)' 
             WHEN (@TimeAltKey >= 70000 AND @TimeAltKey <= 85959) THEN   'AM Peak (7:00 AM To 8:59 AM)'
             WHEN (@TimeAltKey >= 90000 AND @TimeAltKey <= 115959) THEN  'Mid Morning (9:00 AM To 11:59 AM)' 
             WHEN (@TimeAltKey >= 120000 AND @TimeAltKey <= 135959) THEN 'Lunch (12:00 PM To 13:59 PM)'
             WHEN (@TimeAltKey >= 140000 AND @TimeAltKey <= 155959)THEN  'Mid Afternoon (14:00 PM To 15:59 PM)'
             WHEN (@TimeAltKey >= 50000 AND @TimeAltKey <= 175959)THEN   'PM Peak (16:00 PM To 17:59 PM)' 
             WHEN (@TimeAltKey >= 180000 AND @TimeAltKey <= 235959)THEN  'Evening (18:00 PM To 23:59 PM)' 
             WHEN (@TimeAltKey >= 240000) THEN                           'Previous Day Late Night (24:00 PM to '+cast( @Size as varchar(10))  +':00 PM )'
         END 
      --    print   @DayTimeBucket    
	  
	    INSERT into  DimTime (TimeKey,TimeAltKey,[Time30] ,[Hour30] ,[MinuteNumber],[SecondNumber],[TimeInSecond],[HourlyBucket],DayTimeBucketGroupKey,DayTimeBucket) 
	    VALUES (@k,@TimeAltKey ,@Time30 ,@hour ,@minute,@Second , @TimeInSeconds,@HourBucket,@DayTimeBucketGroupKey,@DayTimeBucket )
	    
	    SET @second  = @second + 1		
	    SET @k = @k  + 1	
	END
		SET @minute = @minute + 1		
		SET @second = 0		
	END
	
	    SET @hour = @hour + 1
	    SET @minute =0
    END

END

GO
USE [master]
GO
ALTER DATABASE [DWVentasVino2018] SET  READ_WRITE 
GO
