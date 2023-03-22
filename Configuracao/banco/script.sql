USE [master]
GO
/****** Object:  Database [Gestao]    Script Date: 08/02/2023 21:38:28 ******/
CREATE DATABASE [Gestao]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gestao', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\Gestao.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gestao_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\Gestao_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Gestao] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gestao].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gestao] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gestao] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gestao] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gestao] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gestao] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gestao] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Gestao] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gestao] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gestao] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gestao] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gestao] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gestao] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gestao] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gestao] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gestao] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Gestao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gestao] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gestao] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gestao] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gestao] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gestao] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gestao] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gestao] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gestao] SET  MULTI_USER 
GO
ALTER DATABASE [Gestao] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gestao] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gestao] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gestao] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gestao] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gestao] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Gestao] SET QUERY_STORE = OFF
GO
USE [Gestao]
GO
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 08/02/2023 21:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrupoUsuario] [varchar](150) NULL,
 CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissao]    Script Date: 08/02/2023 21:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](250) NULL,
 CONSTRAINT [PK_Permissao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissaoGrupoUsuario]    Script Date: 08/02/2023 21:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissaoGrupoUsuario](
	[Id_Permissao] [int] NOT NULL,
	[Id_GrupoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_PermissaoGrupoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id_Permissao] ASC,
	[Id_GrupoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/02/2023 21:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NULL,
	[NomeUsuario] [varchar](150) NULL,
	[CPF] [varchar](15) NULL,
	[Email] [varchar](150) NULL,
	[Senha] [varchar](50) NULL,
	[Ativo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioGrupoUsuario]    Script Date: 08/02/2023 21:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioGrupoUsuario](
	[Id_Usuario] [int] NOT NULL,
	[Id_GrupoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioGrupoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC,
	[Id_GrupoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PermissaoGrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PermissaoGrupoUsuario_GrupoUsuario] FOREIGN KEY([Id_GrupoUsuario])
REFERENCES [dbo].[GrupoUsuario] ([Id])
GO
ALTER TABLE [dbo].[PermissaoGrupoUsuario] CHECK CONSTRAINT [FK_PermissaoGrupoUsuario_GrupoUsuario]
GO
ALTER TABLE [dbo].[PermissaoGrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PermissaoGrupoUsuario_Permissao] FOREIGN KEY([Id_Permissao])
REFERENCES [dbo].[Permissao] ([Id])
GO
ALTER TABLE [dbo].[PermissaoGrupoUsuario] CHECK CONSTRAINT [FK_PermissaoGrupoUsuario_Permissao]
GO
ALTER TABLE [dbo].[UsuarioGrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioGrupoUsuario_GrupoUsuario] FOREIGN KEY([Id_GrupoUsuario])
REFERENCES [dbo].[GrupoUsuario] ([Id])
GO
ALTER TABLE [dbo].[UsuarioGrupoUsuario] CHECK CONSTRAINT [FK_UsuarioGrupoUsuario_GrupoUsuario]
GO
ALTER TABLE [dbo].[UsuarioGrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioGrupoUsuario_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[UsuarioGrupoUsuario] CHECK CONSTRAINT [FK_UsuarioGrupoUsuario_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Gestao] SET  READ_WRITE 
GO
