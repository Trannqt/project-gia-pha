CREATE DATABASE QLGP
GO
USE QLGP
GO
--DROP DATABASE QLGP
CREATE TABLE LyDoTonTai
(
	Id INT PRIMARY KEY,
	Reason NVARCHAR(MAX),
	Description NVARCHAR(MAX),
	LinkYoutube NVARCHAR(MAX),
	ImageThumbnail NVARCHAR(MAX)
)
GO

CREATE TABLE TocHo
(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	AddressId VARCHAR(20) NOT NULL,
	LastUpdate DATE NOT NULL DEFAULT GETDATE(),
	Slogan NVARCHAR(500),
	ImageThumbnail NVARCHAR(MAX)
	--1 - Nguyen
	--2 - Tran
	--3 - Le
)
GO

CREATE TABLE VungMien
(
	Id VARCHAR(20) PRIMARY KEY,
	Province NVARCHAR(100),
	District NVARCHAR(100),
	Ward NVARCHAR(200),
	Address NVARCHAR(500),
	Description NVARCHAR(500)
)
GO

CREATE TABLE PhanQuyen
(
	ID INT PRIMARY KEY,
	Name NVARCHAR(100)
)
GO

CREATE TABLE NgayLeGio
(
	Id INT PRIMARY KEY,
	Name NVARCHAR(500),
	DateTime DATETIME,
	TocHoId INT
)
GO

CREATE TABLE MoiQuanHe
(
	Id INT PRIMARY KEY,
	Name NVARCHAR(50)	
	--1. Con 
	--2.Vo
)
GO

CREATE TABLE ThanhVien
(
	Id INT PRIMARY KEY,
	HoTen NVARCHAR(100) NOT NULL,
	GioiTinh BIT,
	DiaChi NVARCHAR(500),
	TocHoId INT,
	ThanhVienId INT,
	MoiQuanHeId INT,
	LaConThu INT,
	-- 999 - Nguyen Van Nuong - BD - 1(Nguyen) - NULL - NULL - 0
	--1001 - Nguyen Quang Truong Tran - HCM - 1(Nguyen) - 999 - 1 - 5
	--1002 - Tran Minh Trang - DL - 2(Tran) - 1001 - 2 - 1
	--1003 - Nguyen Quang Minh - BD - 1(Nguyen) - 1001 - 1 - 1
	--1004 - Nguyen Quang Truong - BD - 1(Nguyen) - 1001 - 1 - 2

	TenThuong NVARCHAR(100),
	TenTu NVARCHAR(100),
	NgaySinh DATE,
	ThuyHieu NVARCHAR(100),
	NgayMat DATETIME,
	NoiAnTang NVARCHAR(500),
	GhiChu NVARCHAR(500)
)
GO


CREATE TABLE DaoLyLamNguoi
(
	Id INT PRIMARY KEY,
	TieuDe NVARCHAR(500),
	NoiDung NVARCHAR(MAX),
	AnhThumbnail VARBINARY(500)
)
GO
