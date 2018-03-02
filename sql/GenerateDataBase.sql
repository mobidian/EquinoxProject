USE [master]
GO
/****** Object:  Database [Equinox]    Script Date: 14/12/2016 05:20:46 ******/
CREATE DATABASE [Equinox]
GO
use [Equinox]
Go
create table Equinox.dbo.Products
(
	[Id] [uniqueidentifier] NOT NULL,
		primary key,
	Name varchar(100) not null,
	LastUpdateDate datetime
)
go

create unique index Products_Id_uindex
	on Products (Id)
go

create unique index Products_Name_uindex
	on Products (Name)
go

