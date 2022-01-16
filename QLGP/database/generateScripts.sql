CREATE DATABASE [QLGP]
GO
USE [QLGP]
GO
/****** Object:  Table [dbo].[LyDoTonTai]    Script Date: 1/6/2022 11:00:37 PM ******/
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
/****** Object:  Table [dbo].[TocHo]    Script Date: 1/6/2022 11:00:37 PM ******/
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
/****** Object:  Table [dbo].[VungMien]    Script Date: 1/6/2022 11:00:37 PM ******/
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
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (1, N'Nguyễn ', N'HCM', CAST(N'2022-01-04' AS Date), N'AAA', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (2, N'Trần', N'HCM', CAST(N'2022-01-04' AS Date), N'BBB', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (3, N'Trần Nguyễn', N'HN', CAST(N'2022-01-05' AS Date), N'CCC', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (4, N'Lê Ngô', N'HP', CAST(N'2022-01-05' AS Date), N'DDD', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (5, N'Lê', N'BD', CAST(N'2022-01-05' AS Date), N'DDD', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[TocHo] ([Id], [Name], [AddressId], [LastUpdate], [Slogan], [ImageThumbnail]) VALUES (6, N'Nguyen', N'BD', CAST(N'2022-01-06' AS Date), N'Uong nuoc nho nguon', N'mau-thiet-ke-nha-hang-phong-cach-indochine-tai-bac-giang-cdt-anh-tung-1-28.jpg')
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'BD', N'Binh Dinh', N'phu cat', N'AAA', N'AAA', N'AAA')
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'HCM', N'Hồ Chí Minh', N'Bình Thạnh', N'Phường 26', N'311 LHP', NULL)
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'HN', N'Hà Nội', N'DDD', N'DDD', N'DDD', N'DDD')
INSERT [dbo].[VungMien] ([Id], [Province], [District], [Ward], [Address], [Description]) VALUES (N'HP', N'Hải Phòng', N'DĐ', N'EEE', N'eEEE', N'eeee')
/****** Object:  StoredProcedure [dbo].[vnsp_LyDoTonTai_getLyDoTonTaiList]    Script Date: 1/6/2022 11:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
