USE [QLGP]
GO
/****** Object:  Table [dbo].[LyDoTonTai]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LyDoTonTai](
	[Id] [int] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[LinkYoutube] [nvarchar](max) NULL,
	[ImageThumbnail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoiQuanHe]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoiQuanHe](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NgayLeGio]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgayLeGio](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[DateTime] [datetime] NULL,
	[TocHoId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[Id] [int] NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DienThoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](500) NULL,
	[TocHoId] [int] NULL,
	[ThanhVienId] [int] NULL,
	[MoiQuanHeId] [int] NULL,
	[LaConThu] [int] NULL,
	[TenThuong] [nvarchar](100) NULL,
	[TenTu] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[ThuyHieu] [nvarchar](100) NULL,
	[NgayMat] [datetime] NULL,
	[NoiAnTang] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
	[LaDoiThu] [int] NULL,
	[ImageThumbnail] [nvarchar](max) NULL,
	[LapGiaDinh] [bit] NULL,
	[RightId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TocHo]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TocHo](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AddressId] [varchar](20) NOT NULL,
	[LastUpdate] [date] NOT NULL DEFAULT (getdate()),
	[Slogan] [nvarchar](500) NULL,
	[ImageThumbnail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VungMien]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VungMien](
	[Id] [varchar](20) NOT NULL,
	[Province] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[Ward] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LyDoTonTai] ([Id], [Reason], [Description], [LinkYoutube], [ImageThumbnail]) VALUES (1, N'<p>Gia phả học là một ngành của khoa học lịch sử. Sử sách ghi lại những sự kiện của đất nước.</p> 
<p>Gia phả ghi lại những sự kiện của gia đình và dòng họ. Đối tượng của gia phả học là gia đình và dòng họ.</p>
<p>Gia phả học có mối quan hệ và sự tác động qua lại của với các môn khoa học về con người.</p>
<p>Gia phả xuất hiện ở Phương Tây và Phương Đông từ xa xưa.</p>', N'<p>Một cuốn Gia phả soạn cẩn thận, đúng thông lệ, chính xác…sẽ có nhiều ý nghĩa quan trọng không chỉ cho Gia tộc mà cho cả làng xã đất nước.</p>
<p>Khi dòng tộc chưa có Gia phả thì mọi chuyện về tổ tiên, truyền thống dòng họ, về từng người, sự việc… chỉ dựa vào ký ức và truyền ngôn rất dễ “tam sao thất bản”, dẫn đến dứt hẳn.</p>
<p>Dòng họ không có phả, gọi là dòng họ khuyết phả và con cháu trong họ không thể hình dung được để mà phát huy đúng truyền thống tích tụ của tiền nhân trong dòng tộc; khi được thụ hưởng, thừa kế về vật chất (đất đai, nhà cửa) hoặc về tinh thần (tài năng, ngành nghề, bí truyền…) cũng không hiểu được những thứ mình được thừa hưởng đó do đâu và từ đâu đến do vậy khó bền vững, phát huy được.</p>
<p>1. Khi đã có Gia phả được soạn thảo công phu, xác thực và được giữ cẩn trọng, cập nhật thường xuyên thì sự việc diễn ra trong quá khứ sẽ đượclưu giữ chính xác, bền vững và lan truyền xa rộng.</p>
<p>2. Trước hết Gia phả là cuốn sách đặc biệt làm tăng lòng hiếu kính, biết ơn của hậu thế với tiền nhân, tăng tình thân giữa các thành viên trong họ mạc. Do vậy có sức lôi cuốn, có sức cảm hóa mạnh mẽ các lớp cháu con. Dòng họ có phả lại được khai thác tốt con cháu sẽ tự tin, tự hào về truyền thống tốt đẹp của dòng họ mình để củng cố niềm tin, vững bước đi lên cũng như đất nước có “Sử thư” thì cương vực sẽ được giữ vững, cơ đồ phát triển mạnh:</p>
<p>皇图巩固國有史書 Hoàng đồ củng cố, Quốc hữu Sử thư,</p>
<p>祖德流徽家存譜志 Tổ đức lưu huy, Gia tồn Phả chí !</p>
<p>3. Gia phả giúp người ta nhớ ngày giỗ của tổ tiên, ông bà, cha mẹ. Sau đó, là cho con cháu biết nguồn gốc gia tộc từ đâu đến đâu, họ hàng trên dưới xa gần ra sao. Nhờ có gia phả mà con cháu các đời sau mới hiểu ngọn ngành, tông chỉ nhà mình. Ngày nay, với công nghệ hiện đại, có thể ứng dụng việc xét nghiệm gen ADN để nhận họ. Song đó chỉ đơn thuần về mặt kỹ thuật sinh học, nó không thể xác định được quan hệ trên dưới, xa gần…, tức không thể thay Gia phả. được. Người xưa quan niệm: trong một nhà một họ mà gốc rễ không tường tận, thì trong con cháu thường xảy ra những chuyện có hại cho gia đạo. Có gia phả, con cháu sẽ nắm chắc ngày giỗ ông bà, không cưới gả với người trong họ, nắm rõ thứ thế để trong giao tiếp, cư sử. Đó là một phong tục hay của người Việt.</p>', N'https://www.youtube.com/embed/mm_ydMijl5o', N'lydotontai-background.jpg')
INSERT [dbo].[MoiQuanHe] ([Id], [Name]) VALUES (1, N'Cha ')
INSERT [dbo].[MoiQuanHe] ([Id], [Name]) VALUES (2, N'Mẹ ')
INSERT [dbo].[MoiQuanHe] ([Id], [Name]) VALUES (3, N'Con')
INSERT [dbo].[MoiQuanHe] ([Id], [Name]) VALUES (4, N'Anh')
INSERT [dbo].[MoiQuanHe] ([Id], [Name]) VALUES (5, N'Chị')
INSERT [dbo].[MoiQuanHe] ([Id], [Name]) VALUES (6, N'Vợ')
INSERT [dbo].[NgayLeGio] ([Id], [Name], [DateTime], [TocHoId]) VALUES (1, N'Giỗ ông Cố', CAST(N'2021-02-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[NgayLeGio] ([Id], [Name], [DateTime], [TocHoId]) VALUES (2, N'Giỗ chú Mười', CAST(N'2018-11-18 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PhanQuyen] ([ID], [Name]) VALUES (1, N'admin')
INSERT [dbo].[PhanQuyen] ([ID], [Name]) VALUES (2, N'viewer')
INSERT [dbo].[ThanhVien] ([Id], [HoTen], [DienThoai], [Email], [GioiTinh], [DiaChi], [TocHoId], [ThanhVienId], [MoiQuanHeId], [LaConThu], [TenThuong], [TenTu], [NgaySinh], [ThuyHieu], [NgayMat], [NoiAnTang], [GhiChu], [LaDoiThu], [ImageThumbnail], [LapGiaDinh], [RightId]) VALUES (1, N'Nguyễn Văn A', N'0923823232 - 0323242323', N'nva@gmail.com', 0, N'333 Lê Hồng Phong, Q10, HCM', 1, NULL, NULL, NULL, N'A', N'AA', CAST(N'1945-12-12' AS Date), N'AAA', NULL, NULL, NULL, 1, N'nonimagedefault.jpg', 1, 1)
INSERT [dbo].[ThanhVien] ([Id], [HoTen], [DienThoai], [Email], [GioiTinh], [DiaChi], [TocHoId], [ThanhVienId], [MoiQuanHeId], [LaConThu], [TenThuong], [TenTu], [NgaySinh], [ThuyHieu], [NgayMat], [NoiAnTang], [GhiChu], [LaDoiThu], [ImageThumbnail], [LapGiaDinh], [RightId]) VALUES (2, N'Nguyễn Văn Con A', N'0923823232 - 0323242323', N'nva@gmail.com', 0, N'333 Lê Hồng Phong', 1, 1, 3, 1, N'Con A', N'Con A', CAST(N'1999-03-20' AS Date), N'Con A', NULL, NULL, NULL, 2, N'nonimagedefault.jpg', 0, 2)
INSERT [dbo].[ThanhVien] ([Id], [HoTen], [DienThoai], [Email], [GioiTinh], [DiaChi], [TocHoId], [ThanhVienId], [MoiQuanHeId], [LaConThu], [TenThuong], [TenTu], [NgaySinh], [ThuyHieu], [NgayMat], [NoiAnTang], [GhiChu], [LaDoiThu], [ImageThumbnail], [LapGiaDinh], [RightId]) VALUES (3, N'Trần Thị Vợ A', N'0923823232 - 0323242323', N'nva@gmail.com', 1, N'312 Q11, HP', NULL, 1, 6, NULL, N'Vợ A', N'Vợ A', CAST(N'1954-04-23' AS Date), N'Vợ A', NULL, NULL, NULL, NULL, N'nonimagedefault.jpg', 1, 2)
INSERT [dbo].[ThanhVien] ([Id], [HoTen], [DienThoai], [Email], [GioiTinh], [DiaChi], [TocHoId], [ThanhVienId], [MoiQuanHeId], [LaConThu], [TenThuong], [TenTu], [NgaySinh], [ThuyHieu], [NgayMat], [NoiAnTang], [GhiChu], [LaDoiThu], [ImageThumbnail], [LapGiaDinh], [RightId]) VALUES (4, N'Nguyễn Thị Con A', N'0923823232 - 0323242323', N'nva@gmail.com', 1, N'333 LHP', 1, 1, 3, 2, N'ConGaiA', N'ConGiaA', CAST(N'2000-02-02' AS Date), N'ConGaiA', NULL, NULL, NULL, 2, N'nonimagedefault.jpg', 0, 2)
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (1, N'Nguyễn ', N'HCM', CAST(N'2022-01-04' AS Date), N'UỐNG NƯỚC NHỚ NGUỒN', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (2, N'Trần', N'HCM', CAST(N'2022-01-04' AS Date), N'BBB', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (3, N'Trần Nguyễn', N'HN', CAST(N'2022-01-05' AS Date), N'CCC', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (4, N'Lê Ngô', N'HP', CAST(N'2022-01-05' AS Date), N'DDD', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (5, N'Lê', N'BD', CAST(N'2022-01-05' AS Date), N'DDD', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (6, N'Nguyen', N'BD', CAST(N'2022-01-06' AS Date), N'Uong nuoc nho nguon', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'BD', N'Binh Dinh', N'phu cat', N'AAA', N'AAA', N'AAA')
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'HCM', N'Hồ Chí Minh', N'Bình Thạnh', N'Phường 26', N'311 LHP', NULL)
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'HN', N'Hà Nội', N'DDD', N'DDD', N'DDD', N'DDD')
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'HP', N'Hải Phòng', N'DĐ', N'EEE', N'eEEE', N'eeee')
/****** Object:  StoredProcedure [dbo].[vnsp_LyDoTonTai_getLyDoTonTaiList]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vnsp_LyDoTonTai_getLyDoTonTaiList]
AS
BEGIN
    Select * from LyDoTonTai
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_ThanhVien_getAdminById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_ThanhVien_getAdminById]
(
	@Id INT
)
AS
BEGIN
	SELECT [Id]
		  ,[HoTen]
		  ,[DienThoai]
		  ,[Email]
		  ,CASE WHEN GioiTinh = 0 THEN N'Ông'
                WHEN GioiTinh = 1 THEN N'Bà'
			END AS GioiTinh 
		  ,[DiaChi]
		  ,[TocHoId]
		  ,[ThanhVienId]
		  ,[MoiQuanHeId]
		  ,[LaConThu]
		  ,[TenThuong]
		  ,[TenTu]
		  ,[NgaySinh]
		  ,[ThuyHieu]
		  ,[NgayMat]
		  ,[NoiAnTang]
		  ,[GhiChu]
		  ,[LaDoiThu]
		  ,[ImageThumbnail]
		  ,[LapGiaDinh]
		  ,[RightId]
	  FROM [dbo].[ThanhVien]
	  WHERE TocHoId = @Id AND RightId = 1
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_ThanhVien_getChildrenById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_ThanhVien_getChildrenById]
(
	@Id INT
)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY T1.Id) AS SoLuong
		  ,T1.[Id]
		  ,T1.ImageThumbnail
		  ,T1.[HoTen]
		  ,CASE WHEN T1.GioiTinh = 0 THEN N'Nam'
                WHEN T1.GioiTinh = 1 THEN N'Nữ'
        END AS GioiTinh 
		  ,T1.[DiaChi]
		  ,T1.[TocHoId]
		  ,T1.[ThanhVienId]
		  ,T1.[MoiQuanHeId]
		  ,T1.[LaConThu]
		  ,T1.[TenThuong]
		  ,T1.[TenTu]
		  ,ISNULL(FORMAT(T1.[NgaySinh], 'dd/MM/yyyy'), N'Chưa rõ') NgaySinh
		  ,T1.[ThuyHieu]
		  ,ISNULL(FORMAT(T1.NgayMat, 'dd/MM/yyyy'), N'Chưa mất') NgayMat 
		  ,T1.[NoiAnTang]
		  ,T1.[GhiChu]
		  ,T1.[LaDoiThu] FROM dbo.ThanhVien T1
	JOIN dbo.ThanhVien T2 ON T1.ThanhVienId = T2.Id
	WHERE T1.MoiQuanHeId = 3 AND T2.Id = @Id
	ORDER BY T1.Id
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_ThanhVien_getPhaDoById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[vnsp_ThanhVien_getPhaDoById]
(
	@Id INT
)
AS
BEGIN
	SELECT [Id] id
      ,[HoTen] name
      ,[DienThoai]
      ,[Email]
      ,[GioiTinh]
      ,[DiaChi] title
      ,[TocHoId]
      ,[ThanhVienId] pid
      ,[MoiQuanHeId]
      ,[LaConThu]
      ,[TenThuong]
      ,[TenTu]
      ,[NgaySinh]
      ,[ThuyHieu]
      ,[NgayMat]
      ,[NoiAnTang]
      ,[GhiChu]
      ,[LaDoiThu]
      ,[ImageThumbnail] img
      ,[LapGiaDinh]
      ,[RightId]
  FROM [dbo].[ThanhVien]
  WHERE TocHoId = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_ThanhVien_getThanhVienById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[vnsp_ThanhVien_getThanhVienById]
(
	@Id INT
)
AS
BEGIN
    SELECT  TV.Id ,
			TV.ImageThumbnail,
            TV.HoTen ,
            CASE WHEN TV.GioiTinh = 0 THEN N'Nam'
                 WHEN TV.GioiTinh = 1 THEN N'Nữ'
            END AS GioiTinh ,
            TV.DiaChi ,
            ISNULL(TV.TenThuong, '') TenThuong ,
            TV.TenTu ,
            ISNULL(FORMAT(TV.[NgaySinh], 'dd/MM/yyyy'), N'Chưa rõ') NgaySinh,
            ISNULL(TV.ThuyHieu, '') ThuyHieu ,
            ISNULL(FORMAT(TV.NgayMat, 'dd/MM/yyyy'), N'Chưa mất') NgayMat ,
            ISNULL(TV.NoiAnTang, '') NoiAnTang ,
            ISNULL(TV.GhiChu, '') GhiChu ,
            C.Name AS TenMQH ,
            TV.LaConThu ,
            TV.LaDoiThu ,
            B.Id AS IdCha ,
            B.HoTen AS HoTenCha ,
            B.LaDoithu AS DoiThuCha ,
            A.Name AS TocHo
    FROM    ThanhVien TV
            LEFT JOIN ( SELECT   TH.Id ,
                            TH.Name
                   FROM     dbo.TocHo TH
                 ) A ON TV.TocHoId = A.Id
            LEFT JOIN ( SELECT   T.Id ,
                            T.HoTen ,
                            T.LaDoithu
                   FROM     dbo.ThanhVien T
                 ) B ON TV.ThanhVienId = B.Id
            LEFT JOIN ( SELECT   QH.Id ,
                            QH.Name
                   FROM     dbo.MoiQuanHe QH
                 ) C ON TV.MoiQuanHeId = C.Id
    WHERE   TV.Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_ThanhVien_getWifeById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_ThanhVien_getWifeById]
(
	@Id INT
)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY T1.Id) AS SoLuong
	  ,T1.[Id]
	  ,T1.ImageThumbnail
      ,T1.[HoTen]
      ,CASE WHEN T1.GioiTinh = 0 THEN N'Nam'
                WHEN T1.GioiTinh = 1 THEN N'Nữ'
        END AS GioiTinh 
      ,T1.[DiaChi]
      ,T1.[TocHoId]
      ,T1.[ThanhVienId]
      ,T1.[MoiQuanHeId]
      ,T1.[LaConThu]
      ,T1.[TenThuong]
      ,T1.[TenTu]
      ,ISNULL(FORMAT(T1.[NgaySinh], 'dd/MM/yyyy'), N'Chưa rõ') NgaySinh
      ,T1.[ThuyHieu]
      ,ISNULL(FORMAT(T1.NgayMat, 'dd/MM/yyyy'), N'Chưa mất') NgayMat 
      ,T1.[NoiAnTang]
      ,T1.[GhiChu]
      ,T1.[LaDoiThu]
	FROM dbo.ThanhVien T1
	JOIN dbo.ThanhVien T2 ON T1.ThanhVienId = T2.Id
	WHERE T1.MoiQuanHeId = 6 AND T2.Id = @Id
	ORDER BY T1.Id
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_TocHo_getNgayLeGioById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_TocHo_getNgayLeGioById]
(
	@Id INT
)
AS
BEGIN
    DECLARE @queryLeGio NVARCHAR(MAX)=''
	SET @queryLeGio = @queryLeGio + '
		SELECT N.Id,N.Name, FORMAT(N.DateTime,''dd/MM/yyyy'') DateTime
		FROM dbo.NgayLeGio N
		WHERE N.TocHoId = ' + CONVERT(VARCHAR(20),@Id)

	EXEC (@queryLeGio)
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_TocHo_getSoDoi]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_TocHo_getSoDoi]
(
	@Id INT
)
AS
BEGIN
    SELECT MAX(T.LaDoiThu) AS SoDoi
	FROM dbo.ThanhVien T
	WHERE T.TocHoId = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_TocHo_getSoLuongGiaDinh]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_TocHo_getSoLuongGiaDinh]
(
	@Id INT
)
AS
BEGIN
    SELECT COUNT(*) AS SoLuongGiaDinh
	FROM dbo.ThanhVien 
	WHERE TocHoId = @Id AND LapGiaDinh = 1
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_TocHo_getSoLuongThanhVien]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_TocHo_getSoLuongThanhVien]
(
	@Id INT
)
AS
BEGIN
    SELECT COUNT(*) AS SoLuongThanhVien
	FROM dbo.ThanhVien T1 
	JOIN dbo.TocHo TH ON T1.TocHoId = TH.Id 
	WHERE TH.Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_TocHo_getTocHoById]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_TocHo_getTocHoById]
(
	@Id INT
)
AS
BEGIN
    DECLARE @queryGiaPha NVARCHAR(MAX)=''
	SET @queryGiaPha = @queryGiaPha + '
		SELECT	T.Id, 
				T.Name,
				T.AddressId, 
				FORMAT(T.LastUpdate,''dd/MM/yyyy'') LastUpdate,
				T.Slogan, 
				T.ImageThumbnail, 
				A.Province Province,
				A.Ward + '','' + A.District + '','' + A.Province as [Address]
		FROM TocHo T
		LEFT JOIN(
					SELECT V.Id, V.Province,  V.District, V.Ward
					FROM VungMien V 
				) A ON T.AddressId = A.Id
		WHERE T.Id = ' + CONVERT(VARCHAR(20),@Id)

	EXEC (@queryGiaPha)
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_TocHo_getTocHoList]    Script Date: 1/20/2022 12:39:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[vnsp_TocHo_getTocHoList]
(
	@pageSize INT,
	@pageSkip INT,
	@txtSearch NVARCHAR(500),
	@txtProvince NVARCHAR(500),
	@txtDistrict NVARCHAR(500),
	@txtWard NVARCHAR(500),
	@txtSearchVN NVARCHAR(500),
	@txtProvinceVN NVARCHAR(500),
	@txtDistrictVN NVARCHAR(500),
	@txtWardVN NVARCHAR(500)
)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX) = '',
			@condition NVARCHAR(MAX) = ''
    SET @sql = ' 
	SELECT T.Id, T.Name,T.AddressId, FORMAT(T.LastUpdate,''dd/MM/yyyy'') LastUpdate, T.Slogan, T.ImageThumbnail, A.Ward + '','' + A.District + '','' + A.Province as [Address] 
    FROM TocHo T
	JOIN(
            SELECT V.Id, V.Province,  V.District, V.Ward
            FROM VungMien V ';

	IF(@txtProvince IS NOT NULL AND LEN(@txtProvince)!=0 OR @txtDistrict IS NOT NULL AND LEN(@txtDistrict)!=0 OR @txtWard IS NOT NULL AND LEN(@txtWard)!=0)
	BEGIN
		SET @sql = @sql + '
                WHERE
		'
	END
	ELSE GOTO Ket_Thuc

    IF (@txtProvince IS NOT NULL AND LEN(@txtProvince)!=0)
    BEGIN
        SET @sql = @sql + '
         (V.Province LIKE N''%' + @txtProvince + '%'' OR V.Province LIKE N''%' + @txtProvinceVN + '%'')';
        SET @condition = ' AND ';
    END
	
    
	IF (@txtDistrict IS NOT NULL AND LEN(@txtDistrict)!=0)
	BEGIN
		SET @sql = @sql + @condition;
		SET @sql = @sql + '
		(V.District LIKE N''%' + @txtDistrict + '%'' OR V.District LIKE N''%' + @txtDistrictVN + '%'')';;
		SET @condition = ' AND ';
	END
    
	IF (@txtWard IS NOT NULL OR LEN(@txtWard)!=0)
	BEGIN
		SET @sql = @sql + @condition;
		SET @sql = @sql + '
		(V.Ward LIKE N''%' + @txtWard + '%'' OR V.Ward LIKE N''%' + @txtWardVN + '%'')';
	END

Ket_Thuc:
	SET @sql = @sql + '
            ) as A ON T.AddressId = A.Id ';
	IF (@txtSearch IS NOT NULL AND LEN(@txtSearch)!=0)
    BEGIN
        SET @sql = @sql + ' WHERE (T.Name LIKE N''%' + @txtSearch + '%'' OR T.Name LIKE N''%' + @txtSearchVN + '%'')';
    END

    SET @sql = @sql + ' ORDER BY T.Id ASC ';

    IF (@pageSize != -1 AND @pageSkip != -1) 
	BEGIN
        SET @sql = @sql + '
            OFFSET ' + CAST(@pageSkip AS VARCHAR(20)) + ' ROWS
            FETCH NEXT ' + CAST(@pageSize AS VARCHAR(20)) + ' ROWS ONLY ';
    END

	EXEC(@sql)
	PRINT(@sql)
END

GO
