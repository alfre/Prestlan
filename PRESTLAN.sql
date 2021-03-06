USE [master]
GO
/****** Object:  Database [PRESTLAN]    Script Date: 07/15/2015 12:18:10 ******/
CREATE DATABASE [PRESTLAN] ON  PRIMARY 
( NAME = N'PRESTLAN2', FILENAME = N'E:\MSSQL\MSSQL10_50.MSSQLSERVER2008\MSSQL\DATA\PRESTLAN2.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRESTLAN2_log', FILENAME = N'E:\MSSQL\MSSQL10_50.MSSQLSERVER2008\MSSQL\DATA\PRESTLAN2_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRESTLAN] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRESTLAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRESTLAN] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PRESTLAN] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PRESTLAN] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PRESTLAN] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PRESTLAN] SET ARITHABORT OFF
GO
ALTER DATABASE [PRESTLAN] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PRESTLAN] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PRESTLAN] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PRESTLAN] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PRESTLAN] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PRESTLAN] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PRESTLAN] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PRESTLAN] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PRESTLAN] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PRESTLAN] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PRESTLAN] SET  DISABLE_BROKER
GO
ALTER DATABASE [PRESTLAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PRESTLAN] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PRESTLAN] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PRESTLAN] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PRESTLAN] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PRESTLAN] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PRESTLAN] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PRESTLAN] SET  READ_WRITE
GO
ALTER DATABASE [PRESTLAN] SET RECOVERY FULL
GO
ALTER DATABASE [PRESTLAN] SET  MULTI_USER
GO
ALTER DATABASE [PRESTLAN] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PRESTLAN] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRESTLAN', N'ON'
GO
USE [PRESTLAN]
GO
/****** Object:  Table [dbo].[TipoTrabajador]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTrabajador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoTrabajador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_null] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuracion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alerta_caducidad_1] [int] NOT NULL,
	[alerta_caducidad_2] [int] NOT NULL,
	[nombre_empresa] [varchar](250) NOT NULL,
	[idioma_general] [char](2) NOT NULL,
 CONSTRAINT [PK_Configuracion_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Biblioteca]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Biblioteca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Biblioteca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Idiomas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[predeterminado] [bit] NOT NULL,
	[codigo] [char](2) NOT NULL,
	[cultura] [nvarchar](20) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Idiomas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fichero]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fichero](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
	[FechaCreado] [datetime] NOT NULL,
	[nombreFS] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Fichero] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 07/15/2015 12:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MultiplesPropietarios] [bit] NOT NULL,
	[NivelCriticidad] [int] NOT NULL,
	[EsDocumentoDeEmpresa] [bit] NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SPLIT]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[SPLIT] 
   (  @DELIMITER VARCHAR(5), 
      @LIST      VARCHAR(MAX) 
   ) 
   RETURNS @TABLEOFVALUES TABLE 
      (  ROWID   SMALLINT IDENTITY(1,1), 
         [VALUE] VARCHAR(MAX) 
      ) 
AS 
   BEGIN
    
      DECLARE @LENSTRING INT 
 
      WHILE LEN( @LIST ) > 0 
         BEGIN 
         
            SELECT @LENSTRING = 
               (CASE CHARINDEX( @DELIMITER, @LIST ) 
                   WHEN 0 THEN LEN( @LIST ) 
                   ELSE ( CHARINDEX( @DELIMITER, @LIST ) -1 )
                END
               ) 
                                
            INSERT INTO @TABLEOFVALUES 
               SELECT SUBSTRING( @LIST, 1, @LENSTRING )
                
            SELECT @LIST = 
               (CASE ( LEN( @LIST ) - @LENSTRING ) 
                   WHEN 0 THEN '' 
                   ELSE RIGHT( @LIST, LEN( @LIST ) - @LENSTRING - 1 ) 
                END
               ) 
         END
          
      RETURN 
      
   END
GO
/****** Object:  Table [dbo].[Requisitos]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisitos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Requisitos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reclamaciones]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reclamaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[correoEmisor] [nvarchar](max) NOT NULL,
	[correoDestinatario] [nvarchar](max) NOT NULL,
	[asunto] [nvarchar](max) NOT NULL,
	[contenido] [nvarchar](max) NOT NULL,
	[envioCorreoExito] [bit] NOT NULL,
	[fechaReclamacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Reclamaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpresa]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpresa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Activo] [bit] NOT NULL,
	[EsEmpresaPrincipal] [bit] NULL,
 CONSTRAINT [PK_TipoEmpresa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIdentificador]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIdentificador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_null] [nvarchar](max) NULL,
 CONSTRAINT [PK_TipoIdentificador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Describe el tipo de documento identificativo tanto de empresas como de trabajadores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoIdentificador'
GO
/****** Object:  Table [dbo].[TipoEtapa]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEtapa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoEtapa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEstado]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEstado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoEstado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpresa_translation]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEmpresa_translation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tipoempresa_Id] [int] NOT NULL,
	[Idioma_codigo] [char](2) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoEmpresa_translation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDocumento_translation]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDocumento_translation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipodocumento_Id] [int] NOT NULL,
	[Idioma_codigo] [char](2) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[TextoAyuda] [nvarchar](max) NULL,
	[Plantilla] [nvarchar](max) NULL,
 CONSTRAINT [PK_TipoDocumento_translation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequisitosTipoDocumento]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitosTipoDocumento](
	[Requisitos_Id] [int] NOT NULL,
	[TipoDocumento_Id] [int] NOT NULL,
 CONSTRAINT [PK_RequisitosTipoDocumento] PRIMARY KEY CLUSTERED 
(
	[Requisitos_Id] ASC,
	[TipoDocumento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_RequisitosTipoDocumento_TipoDocumento] ON [dbo].[RequisitosTipoDocumento] 
(
	[TipoDocumento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValorIdentificador] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[Observaciones] [nvarchar](max) NULL,
	[CorreosNotificaciones] [nvarchar](max) NULL,
	[SinNotificaciones] [bit] NOT NULL,
	[Activa] [bit] NOT NULL,
	[FechaAlta] [date] NOT NULL,
	[FechaBaja] [date] NOT NULL,
	[Eliminado] [bit] NOT NULL,
	[TipoIdentificador_Id] [int] NOT NULL,
	[TipoEmpresa_Id] [int] NOT NULL,
	[Actividad_Id] [int] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoEmpresaEmpresa] ON [dbo].[Empresa] 
(
	[TipoEmpresa_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoIdentificadorEmpresa] ON [dbo].[Empresa] 
(
	[TipoIdentificador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTrabajador_translation]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTrabajador_translation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoTrabajador_Id] [int] NOT NULL,
	[Idioma_codigo] [char](2) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TipoTrabajador_translation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RolPermiso]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolPermiso](
	[Permiso_Id] [int] NOT NULL,
	[Rol_Id] [int] NOT NULL,
 CONSTRAINT [PK_RolPermiso] PRIMARY KEY CLUSTERED 
(
	[Permiso_Id] ASC,
	[Rol_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_RolPermiso_Rol] ON [dbo].[RolPermiso] 
(
	[Rol_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actividad_translation]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actividad_translation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Actividad_Id] [int] NOT NULL,
	[Idioma_codigo] [char](2) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Actividad_translation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Actividad_translation] ON [dbo].[Actividad_translation] 
(
	[Actividad_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Actividad_translation_1] ON [dbo].[Actividad_translation] 
(
	[Idioma_codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipoidentificador_translation]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipoidentificador_translation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tipoidentificador_Id] [int] NOT NULL,
	[Idioma_codigo] [char](2) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tipoidentificador_translation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[clave] [nvarchar](max) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[fechaBaja] [datetime] NULL,
	[ultimoLogin] [datetime] NULL,
	[Rol_Id] [int] NOT NULL,
	[ip] [nchar](50) NULL,
	[idioma] [char](2) NOT NULL,
	[Empresa_Id] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FK_UsuarioRol] ON [dbo].[Usuario] 
(
	[Rol_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trabajador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValorIdentificador] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaAlta] [date] NOT NULL,
	[FechaBaja] [date] NOT NULL,
	[Eliminado] [bit] NOT NULL,
	[TipoIdentificador_Id] [int] NOT NULL,
	[Empresa_Id] [int] NOT NULL,
	[TipoTrabajador_Id] [int] NOT NULL,
	[Autonomo] [bit] NOT NULL,
	[Observaciones] [varchar](max) NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FK_EmpresaTrabajador] ON [dbo].[Trabajador] 
(
	[Empresa_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoIdentificadorTrabajador] ON [dbo].[Trabajador] 
(
	[TipoIdentificador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoTrabajadorTrabajador] ON [dbo].[Trabajador] 
(
	[TipoTrabajador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Caduca] [bit] NOT NULL,
	[FechaCaducidad] [datetime] NULL,
	[SinPropietarios] [bit] NOT NULL,
	[SinNotificaciones] [bit] NOT NULL,
	[FechaCreado] [datetime] NOT NULL,
	[FechaActualizado] [datetime] NOT NULL,
	[Eliminado] [bit] NOT NULL,
	[HashEmpleado] [nvarchar](max) NOT NULL,
	[Fichero_Id] [int] NOT NULL,
	[DocumentoVersion_Id] [int] NULL,
	[TipoDocumento_Id] [int] NOT NULL,
	[Usuario_Id] [int] NOT NULL,
	[Estado_Id] [int] NOT NULL,
	[Etapa_Id] [int] NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_DocumentoDocumento] ON [dbo].[Documento] 
(
	[DocumentoVersion_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_DocumentoFichero] ON [dbo].[Documento] 
(
	[Fichero_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoDocumentoDocumento] ON [dbo].[Documento] 
(
	[TipoDocumento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoEstadoDocumento] ON [dbo].[Documento] 
(
	[Estado_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoEtapaDocumento] ON [dbo].[Documento] 
(
	[Etapa_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UsuarioDocumento] ON [dbo].[Documento] 
(
	[Usuario_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Empresa_Id] [int] NULL,
	[Trabajador_Id] [int] NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_EmpresaPropietario] ON [dbo].[Propietario] 
(
	[Empresa_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TrabajadorPropietario] ON [dbo].[Propietario] 
(
	[Trabajador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadTrabajador]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadTrabajador](
	[Actividad_Id] [int] NOT NULL,
	[Trabajador_Id] [int] NOT NULL,
 CONSTRAINT [PK_ActividadTrabajador] PRIMARY KEY CLUSTERED 
(
	[Actividad_Id] ASC,
	[Trabajador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_ActividadTrabajador_Trabajador] ON [dbo].[ActividadTrabajador] 
(
	[Trabajador_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BibliotecaDocumento]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BibliotecaDocumento](
	[Biblioteca_Id] [int] NOT NULL,
	[Documento_Id] [int] NOT NULL,
 CONSTRAINT [PK_BibliotecaDocumento] PRIMARY KEY CLUSTERED 
(
	[Biblioteca_Id] ASC,
	[Documento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_BibliotecaDocumento_Documento] ON [dbo].[BibliotecaDocumento] 
(
	[Documento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosDeDocumento]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosDeDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[fechaOperacion] [datetime] NOT NULL,
	[Documento_Id] [int] NOT NULL,
	[Usuario_Id] [int] NOT NULL,
	[TipoEstado_Id] [int] NOT NULL,
	[TipoEtapa_Id] [int] NOT NULL,
 CONSTRAINT [PK_MovimientosDeDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_DocumentoMovimientosDeDocumento] ON [dbo].[MovimientosDeDocumento] 
(
	[Documento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoEstadoMovimientosDeDocumento] ON [dbo].[MovimientosDeDocumento] 
(
	[TipoEstado_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_TipoEtapaMovimientosDeDocumento] ON [dbo].[MovimientosDeDocumento] 
(
	[TipoEtapa_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UsuarioMovimientosDeDocumento] ON [dbo].[MovimientosDeDocumento] 
(
	[Usuario_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioDocumento]    Script Date: 07/15/2015 12:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietarioDocumento](
	[Documento_Id] [int] NOT NULL,
	[Propietario_Id] [int] NOT NULL,
 CONSTRAINT [PK_PropietarioDocumento] PRIMARY KEY CLUSTERED 
(
	[Documento_Id] ASC,
	[Propietario_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_PropietarioDocumento_Propietario] ON [dbo].[PropietarioDocumento] 
(
	[Propietario_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SELECT_DocumentosGenerarZIP_InfoTrabajadores]    Script Date: 07/15/2015 12:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_DocumentosGenerarZIP_InfoTrabajadores]
	@listaTrabajadores NVARCHAR(MAX),
	@listaRequisitos NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		T.Empresa_Id,
		E.Nombre AS Empresa,
		T.Id AS Trabajador_Id,
		T.Nombre AS Trabajador,
		R.Id AS Requisito_Id,
		R.descripcion AS Requisito,
		TD.Id AS TipoDocumento_Id,		
		TDT.Descripcion AS TipoDocumento,
		D.Documento_Id
	FROM TipoDocumento TD
	INNER JOIN RequisitosTipoDocumento RTD ON TD.Id = RTD.TipoDocumento_Id
	INNER JOIN Requisitos R ON R.Id = RTD.Requisitos_Id
	INNER JOIN (SELECT * FROM PRESTLAN.dbo.SPLIT(',',@listaRequisitos)) LR ON CAST(LR.VALUE AS int) = RTD.Requisitos_Id	
	INNER JOIN Trabajador T ON 1 = 1
	INNER JOIN (SELECT * FROM PRESTLAN.dbo.SPLIT(',',@listaTrabajadores)) LT ON CAST(LT.VALUE AS int) = T.Id
	INNER JOIN Empresa E ON E.Id = T.Empresa_Id
	INNER JOIN TipoDocumento_translation TDT ON TDT.Tipodocumento_Id = RTD.TipoDocumento_Id AND TDT.Idioma_codigo = 'es'	
	LEFT JOIN 
	(
		SELECT D.Id AS Documento_Id, D.TipoDocumento_Id, PD.Propietario_Id, P.Empresa_Id, P.Trabajador_Id FROM Documento D
		INNER JOIN PropietarioDocumento PD ON PD.Documento_Id = D.Id
		INNER JOIN Propietario P ON P.Id = PD.Propietario_Id
		WHERE D.Eliminado = 0 AND D.Estado_Id = 2 AND (D.Caduca = 0 OR (D.Caduca = 1 AND D.FechaCaducidad > GETDATE()))
	) D ON D.TipoDocumento_Id = TD.Id AND T.Id = D.Trabajador_Id	
	WHERE TD.EsDocumentoDeEmpresa = 0 ORDER BY T.Empresa_Id, T.Id, R.Id, TD.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SELECT_DocumentosGenerarZIP_InfoEmpresa]    Script Date: 07/15/2015 12:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_DocumentosGenerarZIP_InfoEmpresa]
	@listaEmpresas NVARCHAR(MAX),
	@listaRequisitos NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		E.Id AS Empresa_Id,
		E.Nombre AS Empresa,
		RTD.Requisitos_Id,
		R.descripcion AS Requisito,
		TD.Id AS TipoDocumento_Id,		
		TDT.Descripcion AS TipoDocumento,
		D.Documento_Id
	FROM TipoDocumento TD
	INNER JOIN RequisitosTipoDocumento RTD ON TD.Id = RTD.TipoDocumento_Id
	INNER JOIN Requisitos R ON R.Id = RTD.Requisitos_Id
	INNER JOIN (SELECT * FROM PRESTLAN.dbo.SPLIT(',',@listaRequisitos)) LR ON CAST(LR.VALUE AS int) = RTD.Requisitos_Id	
	INNER JOIN Empresa E ON 1 = 1
	INNER JOIN (SELECT * FROM PRESTLAN.dbo.SPLIT(',',@listaEmpresas)) LT ON CAST(LT.VALUE AS int) = E.Id
	INNER JOIN TipoDocumento_translation TDT ON TDT.Tipodocumento_Id = RTD.TipoDocumento_Id AND TDT.Idioma_codigo = 'es'	
	LEFT JOIN 
	(
		SELECT D.Id AS Documento_Id, D.TipoDocumento_Id, PD.Propietario_Id, P.Empresa_Id, P.Trabajador_Id FROM Documento D
		INNER JOIN PropietarioDocumento PD ON PD.Documento_Id = D.Id
		INNER JOIN Propietario P ON P.Id = PD.Propietario_Id
		WHERE D.Eliminado = 0 AND D.Estado_Id = 2 AND (D.Caduca = 0 OR (D.Caduca = 1 AND D.FechaCaducidad > GETDATE()))
	) D ON D.TipoDocumento_Id = TD.Id AND E.Id = D.Empresa_Id	
	WHERE TD.EsDocumentoDeEmpresa = 1 ORDER BY E.Id, R.Id, TD.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SELECT_DocumentosGenerarZIP]    Script Date: 07/15/2015 12:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_DocumentosGenerarZIP]
	@listaEmpresas NVARCHAR(MAX),
	@listaTrabajadores NVARCHAR(MAX),
	@listaRequisitos NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT
		D.Id,
		F.nombreFS,
		P.Empresa_Id,
		P.Trabajador_Id,
		TDT.Descripcion AS TipoDocumento,
		T.Nombre AS NombreTrabajador,
		E.Nombre AS NombreEmpresa
		FROM Fichero F
		INNER JOIN Documento D ON D.Fichero_Id = F.Id
		INNER JOIN RequisitosTipoDocumento RTD ON RTD.TipoDocumento_Id = D.TipoDocumento_Id
		INNER JOIN PropietarioDocumento PD ON PD.Documento_Id = D.Id
		INNER JOIN Propietario P ON P.Id = PD.Propietario_Id
		INNER JOIN TipoDocumento_translation TDT ON TDT.Tipodocumento_Id = RTD.TipoDocumento_Id AND TDT.Idioma_codigo = 'es'
		LEFT JOIN Empresa E ON E.Id = P.Empresa_Id
		LEFT JOIN Trabajador T ON T.Id = P.Trabajador_Id
	WHERE 
	D.Estado_Id = 2 -- PUBLICADO
	AND
	(D.Caduca = 0 OR D.FechaCaducidad > GETDATE())
	AND
	D.Eliminado = 0
	AND
	(
		(ISNULL(P.Trabajador_Id,-1) = -1 AND 
		P.Empresa_Id IN (SELECT CAST([VALUE] AS int) FROM PRESTLAN.dbo.SPLIT(',',@listaEmpresas)))
	OR
		(P.Empresa_Id IN (SELECT CAST([VALUE] AS int) FROM PRESTLAN.dbo.SPLIT(',',@listaEmpresas)) AND
		P.Trabajador_Id IN (SELECT CAST([VALUE] AS int) FROM PRESTLAN.dbo.SPLIT(',',@listaTrabajadores)))
	)
	AND
	RTD.Requisitos_Id IN (SELECT CAST([VALUE] AS int) FROM PRESTLAN.dbo.SPLIT(',',@listaRequisitos))
END
GO
/****** Object:  Table [dbo].[Notificaciones]    Script Date: 07/15/2015 12:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[correoEmisor] [nvarchar](max) NOT NULL,
	[correoDestinatario] [nvarchar](max) NOT NULL,
	[asunto] [nvarchar](max) NOT NULL,
	[contenido] [nvarchar](max) NOT NULL,
	[envioCorreoExito] [bit] NOT NULL,
	[fechaNotificacion] [datetime] NOT NULL,
	[MovimientosDeDocumento_Id] [int] NOT NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_MovimientosDeDocumentoNotificaciones] ON [dbo].[Notificaciones] 
(
	[MovimientosDeDocumento_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_Configuracion_alerta_caducidad_1]    Script Date: 07/15/2015 12:18:13 ******/
ALTER TABLE [dbo].[Configuracion] ADD  CONSTRAINT [DF_Configuracion_alerta_caducidad_1]  DEFAULT ((30)) FOR [alerta_caducidad_1]
GO
/****** Object:  Default [DF_Configuracion_alerta_caducidad_2]    Script Date: 07/15/2015 12:18:13 ******/
ALTER TABLE [dbo].[Configuracion] ADD  CONSTRAINT [DF_Configuracion_alerta_caducidad_2]  DEFAULT ((15)) FOR [alerta_caducidad_2]
GO
/****** Object:  Default [DF_Configuracion_idioma_general]    Script Date: 07/15/2015 12:18:13 ******/
ALTER TABLE [dbo].[Configuracion] ADD  CONSTRAINT [DF_Configuracion_idioma_general]  DEFAULT ('es') FOR [idioma_general]
GO
/****** Object:  Default [DF_Idiomas_predeterminado]    Script Date: 07/15/2015 12:18:13 ******/
ALTER TABLE [dbo].[Idiomas] ADD  CONSTRAINT [DF_Idiomas_predeterminado]  DEFAULT ((0)) FOR [predeterminado]
GO
/****** Object:  Default [DF_Idiomas_activo]    Script Date: 07/15/2015 12:18:13 ******/
ALTER TABLE [dbo].[Idiomas] ADD  CONSTRAINT [DF_Idiomas_activo]  DEFAULT ((0)) FOR [activo]
GO
/****** Object:  Default [DF_TipoDocumento_EsDocumentoDeEmpresa]    Script Date: 07/15/2015 12:18:13 ******/
ALTER TABLE [dbo].[TipoDocumento] ADD  CONSTRAINT [DF_TipoDocumento_EsDocumentoDeEmpresa]  DEFAULT ((0)) FOR [EsDocumentoDeEmpresa]
GO
/****** Object:  Default [DF_TipoEmpresa_EsEmpresaPrincipal]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[TipoEmpresa] ADD  CONSTRAINT [DF_TipoEmpresa_EsEmpresaPrincipal]  DEFAULT ((0)) FOR [EsEmpresaPrincipal]
GO
/****** Object:  Default [DF_Usuario_idioma]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_idioma]  DEFAULT ('es') FOR [idioma]
GO
/****** Object:  Default [DF_Trabajador_Eliminado]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Trabajador] ADD  CONSTRAINT [DF_Trabajador_Eliminado]  DEFAULT ((0)) FOR [Eliminado]
GO
/****** Object:  Default [DF_Trabajador_autonomo]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Trabajador] ADD  CONSTRAINT [DF_Trabajador_autonomo]  DEFAULT ((0)) FOR [Autonomo]
GO
/****** Object:  ForeignKey [FK_TipoEmpresa_translation_TipoEmpresa]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[TipoEmpresa_translation]  WITH CHECK ADD  CONSTRAINT [FK_TipoEmpresa_translation_TipoEmpresa] FOREIGN KEY([Tipoempresa_Id])
REFERENCES [dbo].[TipoEmpresa] ([Id])
GO
ALTER TABLE [dbo].[TipoEmpresa_translation] CHECK CONSTRAINT [FK_TipoEmpresa_translation_TipoEmpresa]
GO
/****** Object:  ForeignKey [FK_TipoDocumento_translation_TipoDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[TipoDocumento_translation]  WITH CHECK ADD  CONSTRAINT [FK_TipoDocumento_translation_TipoDocumento] FOREIGN KEY([Tipodocumento_Id])
REFERENCES [dbo].[TipoDocumento] ([Id])
GO
ALTER TABLE [dbo].[TipoDocumento_translation] CHECK CONSTRAINT [FK_TipoDocumento_translation_TipoDocumento]
GO
/****** Object:  ForeignKey [FK_RequisitosTipoDocumento_Requisitos]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[RequisitosTipoDocumento]  WITH CHECK ADD  CONSTRAINT [FK_RequisitosTipoDocumento_Requisitos] FOREIGN KEY([Requisitos_Id])
REFERENCES [dbo].[Requisitos] ([Id])
GO
ALTER TABLE [dbo].[RequisitosTipoDocumento] CHECK CONSTRAINT [FK_RequisitosTipoDocumento_Requisitos]
GO
/****** Object:  ForeignKey [FK_RequisitosTipoDocumento_TipoDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[RequisitosTipoDocumento]  WITH CHECK ADD  CONSTRAINT [FK_RequisitosTipoDocumento_TipoDocumento] FOREIGN KEY([TipoDocumento_Id])
REFERENCES [dbo].[TipoDocumento] ([Id])
GO
ALTER TABLE [dbo].[RequisitosTipoDocumento] CHECK CONSTRAINT [FK_RequisitosTipoDocumento_TipoDocumento]
GO
/****** Object:  ForeignKey [FK_ActividadEmpresa]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Empresa]  WITH NOCHECK ADD  CONSTRAINT [FK_ActividadEmpresa] FOREIGN KEY([Actividad_Id])
REFERENCES [dbo].[Actividad] ([Id])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_ActividadEmpresa]
GO
/****** Object:  ForeignKey [FK_TipoEmpresaEmpresa]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_TipoEmpresaEmpresa] FOREIGN KEY([TipoEmpresa_Id])
REFERENCES [dbo].[TipoEmpresa] ([Id])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_TipoEmpresaEmpresa]
GO
/****** Object:  ForeignKey [FK_TipoIdentificadorEmpresa]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_TipoIdentificadorEmpresa] FOREIGN KEY([TipoIdentificador_Id])
REFERENCES [dbo].[TipoIdentificador] ([Id])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_TipoIdentificadorEmpresa]
GO
/****** Object:  ForeignKey [FK_TipoTrabajador_translation_TipoTrabajador]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[TipoTrabajador_translation]  WITH CHECK ADD  CONSTRAINT [FK_TipoTrabajador_translation_TipoTrabajador] FOREIGN KEY([TipoTrabajador_Id])
REFERENCES [dbo].[TipoTrabajador] ([Id])
GO
ALTER TABLE [dbo].[TipoTrabajador_translation] CHECK CONSTRAINT [FK_TipoTrabajador_translation_TipoTrabajador]
GO
/****** Object:  ForeignKey [FK_RolPermiso_Permiso]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[RolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_RolPermiso_Permiso] FOREIGN KEY([Permiso_Id])
REFERENCES [dbo].[Permiso] ([Id])
GO
ALTER TABLE [dbo].[RolPermiso] CHECK CONSTRAINT [FK_RolPermiso_Permiso]
GO
/****** Object:  ForeignKey [FK_RolPermiso_Rol]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[RolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_RolPermiso_Rol] FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[RolPermiso] CHECK CONSTRAINT [FK_RolPermiso_Rol]
GO
/****** Object:  ForeignKey [FK_Actividad_translation_Actividad]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Actividad_translation]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_translation_Actividad] FOREIGN KEY([Actividad_Id])
REFERENCES [dbo].[Actividad] ([Id])
GO
ALTER TABLE [dbo].[Actividad_translation] CHECK CONSTRAINT [FK_Actividad_translation_Actividad]
GO
/****** Object:  ForeignKey [FK_Tipoidentificador_translation_TipoIdentificador]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Tipoidentificador_translation]  WITH CHECK ADD  CONSTRAINT [FK_Tipoidentificador_translation_TipoIdentificador] FOREIGN KEY([Tipoidentificador_Id])
REFERENCES [dbo].[TipoIdentificador] ([Id])
GO
ALTER TABLE [dbo].[Tipoidentificador_translation] CHECK CONSTRAINT [FK_Tipoidentificador_translation_TipoIdentificador]
GO
/****** Object:  ForeignKey [FK_Usuario_Empresa]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empresa] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empresa]
GO
/****** Object:  ForeignKey [FK_UsuarioRol]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol] FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_UsuarioRol]
GO
/****** Object:  ForeignKey [FK_EmpresaTrabajador]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_EmpresaTrabajador] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_EmpresaTrabajador]
GO
/****** Object:  ForeignKey [FK_TipoIdentificadorTrabajador]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_TipoIdentificadorTrabajador] FOREIGN KEY([TipoIdentificador_Id])
REFERENCES [dbo].[TipoIdentificador] ([Id])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_TipoIdentificadorTrabajador]
GO
/****** Object:  ForeignKey [FK_TipoTrabajadorTrabajador]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_TipoTrabajadorTrabajador] FOREIGN KEY([TipoTrabajador_Id])
REFERENCES [dbo].[TipoTrabajador] ([Id])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_TipoTrabajadorTrabajador]
GO
/****** Object:  ForeignKey [FK_Documento_Documento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Documento]  WITH NOCHECK ADD  CONSTRAINT [FK_Documento_Documento] FOREIGN KEY([DocumentoVersion_Id])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_Documento_Documento]
GO
/****** Object:  ForeignKey [FK_DocumentoFichero]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoFichero] FOREIGN KEY([Fichero_Id])
REFERENCES [dbo].[Fichero] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_DocumentoFichero]
GO
/****** Object:  ForeignKey [FK_TipoDocumentoDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_TipoDocumentoDocumento] FOREIGN KEY([TipoDocumento_Id])
REFERENCES [dbo].[TipoDocumento] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_TipoDocumentoDocumento]
GO
/****** Object:  ForeignKey [FK_TipoEstadoDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_TipoEstadoDocumento] FOREIGN KEY([Estado_Id])
REFERENCES [dbo].[TipoEstado] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_TipoEstadoDocumento]
GO
/****** Object:  ForeignKey [FK_TipoEtapaDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_TipoEtapaDocumento] FOREIGN KEY([Etapa_Id])
REFERENCES [dbo].[TipoEtapa] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_TipoEtapaDocumento]
GO
/****** Object:  ForeignKey [FK_UsuarioDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioDocumento] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_UsuarioDocumento]
GO
/****** Object:  ForeignKey [FK_EmpresaPropietario]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_EmpresaPropietario] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_EmpresaPropietario]
GO
/****** Object:  ForeignKey [FK_TrabajadorPropietario]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_TrabajadorPropietario] FOREIGN KEY([Trabajador_Id])
REFERENCES [dbo].[Trabajador] ([Id])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_TrabajadorPropietario]
GO
/****** Object:  ForeignKey [FK_ActividadTrabajador_Actividad]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[ActividadTrabajador]  WITH CHECK ADD  CONSTRAINT [FK_ActividadTrabajador_Actividad] FOREIGN KEY([Actividad_Id])
REFERENCES [dbo].[Actividad] ([Id])
GO
ALTER TABLE [dbo].[ActividadTrabajador] CHECK CONSTRAINT [FK_ActividadTrabajador_Actividad]
GO
/****** Object:  ForeignKey [FK_ActividadTrabajador_Trabajador]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[ActividadTrabajador]  WITH CHECK ADD  CONSTRAINT [FK_ActividadTrabajador_Trabajador] FOREIGN KEY([Trabajador_Id])
REFERENCES [dbo].[Trabajador] ([Id])
GO
ALTER TABLE [dbo].[ActividadTrabajador] CHECK CONSTRAINT [FK_ActividadTrabajador_Trabajador]
GO
/****** Object:  ForeignKey [FK_BibliotecaDocumento_Biblioteca]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[BibliotecaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_BibliotecaDocumento_Biblioteca] FOREIGN KEY([Biblioteca_Id])
REFERENCES [dbo].[Biblioteca] ([Id])
GO
ALTER TABLE [dbo].[BibliotecaDocumento] CHECK CONSTRAINT [FK_BibliotecaDocumento_Biblioteca]
GO
/****** Object:  ForeignKey [FK_BibliotecaDocumento_Documento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[BibliotecaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_BibliotecaDocumento_Documento] FOREIGN KEY([Documento_Id])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[BibliotecaDocumento] CHECK CONSTRAINT [FK_BibliotecaDocumento_Documento]
GO
/****** Object:  ForeignKey [FK_DocumentoMovimientosDeDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[MovimientosDeDocumento]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoMovimientosDeDocumento] FOREIGN KEY([Documento_Id])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[MovimientosDeDocumento] CHECK CONSTRAINT [FK_DocumentoMovimientosDeDocumento]
GO
/****** Object:  ForeignKey [FK_TipoEstadoMovimientosDeDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[MovimientosDeDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TipoEstadoMovimientosDeDocumento] FOREIGN KEY([TipoEstado_Id])
REFERENCES [dbo].[TipoEstado] ([Id])
GO
ALTER TABLE [dbo].[MovimientosDeDocumento] CHECK CONSTRAINT [FK_TipoEstadoMovimientosDeDocumento]
GO
/****** Object:  ForeignKey [FK_TipoEtapaMovimientosDeDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[MovimientosDeDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TipoEtapaMovimientosDeDocumento] FOREIGN KEY([TipoEtapa_Id])
REFERENCES [dbo].[TipoEtapa] ([Id])
GO
ALTER TABLE [dbo].[MovimientosDeDocumento] CHECK CONSTRAINT [FK_TipoEtapaMovimientosDeDocumento]
GO
/****** Object:  ForeignKey [FK_UsuarioMovimientosDeDocumento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[MovimientosDeDocumento]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioMovimientosDeDocumento] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MovimientosDeDocumento] CHECK CONSTRAINT [FK_UsuarioMovimientosDeDocumento]
GO
/****** Object:  ForeignKey [FK_PropietarioDocumento_Documento]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[PropietarioDocumento]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioDocumento_Documento] FOREIGN KEY([Documento_Id])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[PropietarioDocumento] CHECK CONSTRAINT [FK_PropietarioDocumento_Documento]
GO
/****** Object:  ForeignKey [FK_PropietarioDocumento_Propietario]    Script Date: 07/15/2015 12:18:29 ******/
ALTER TABLE [dbo].[PropietarioDocumento]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioDocumento_Propietario] FOREIGN KEY([Propietario_Id])
REFERENCES [dbo].[Propietario] ([Id])
GO
ALTER TABLE [dbo].[PropietarioDocumento] CHECK CONSTRAINT [FK_PropietarioDocumento_Propietario]
GO
/****** Object:  ForeignKey [FK_MovimientosDeDocumentoNotificaciones]    Script Date: 07/15/2015 12:18:43 ******/
ALTER TABLE [dbo].[Notificaciones]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosDeDocumentoNotificaciones] FOREIGN KEY([MovimientosDeDocumento_Id])
REFERENCES [dbo].[MovimientosDeDocumento] ([Id])
GO
ALTER TABLE [dbo].[Notificaciones] CHECK CONSTRAINT [FK_MovimientosDeDocumentoNotificaciones]
GO
