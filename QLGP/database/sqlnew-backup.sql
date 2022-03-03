
/****** Object:  Table [dbo].[District]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [bigint] NOT NULL,
	[DistrictName] [nvarchar](500) NULL,
	[ProvinceId] [bigint] NULL,
	[Note] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceId] [bigint] NOT NULL,
	[ProvinceName] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RootBranch]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RootBranch](
	[RootBranchId] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
	[IsDefault] [bit] NULL,
	[ImageThumbnail] [varchar](500) NULL,
	[ProvinceId] [bigint] NULL,
	[DistrictId] [bigint] NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RootBranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RootBranch01]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RootBranch01](
	[RootBranch01Id] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
	[IsDefault] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RootBranch01Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RootBranch02]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RootBranch02](
	[RootBranch02Id] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
	[IsDefault] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RootBranch02Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RootPerson]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RootPerson](
	[RootPersonId] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Sex] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[Level] [int] NULL,
	[RootBranchId] [bigint] NULL,
	[FatherRootPersonId] [bigint] NULL,
	[MotherRootPersonId] [bigint] NULL,
	[Remark] [nvarchar](500) NULL,
	[RootBranch01Id] [bigint] NULL,
	[RootBranch02Id] [bigint] NULL,
	[ProvinceId] [bigint] NULL,
	[DistrictId] [bigint] NULL,
	[Address] [nvarchar](100) NULL,
	[NickName] [nvarchar](100) NULL,
	[Phone] [varchar](100) NULL,
	[BirthDayAddress] [nvarchar](100) NULL,
	[BirthDayProvinceId] [bigint] NULL,
	[BirthDayDistrictId] [bigint] NULL,
	[SortOrder] [int] NULL,
	[ImageLink] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RootPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RootPersonMemory]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RootPersonMemory](
	[RootPersonId] [bigint] NOT NULL,
	[DateOfDeath] [datetime] NULL,
	[LunarDateOfDeath] [datetime] NULL,
	[Gravestone] [nvarchar](100) NULL,
	[MemoryNote] [ntext] NULL,
	[PureMemoryNote] [nvarchar](4000) NULL,
	[MerchantId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RootPersonId] ASC,
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RootPersonRelationMap]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RootPersonRelationMap](
	[RootPersonId] [bigint] NOT NULL,
	[WeddingDate] [datetime] NULL,
	[Note] [nvarchar](500) NULL,
	[RelationRootPersonId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RootPersonId] ASC,
	[RelationRootPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RootPost]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RootPost](
	[RootPostId] [bigint] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[TextThumbnail] [nvarchar](500) NULL,
	[ImageThumbnail] [varchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[Writer] [bigint] NULL,
	[Editor] [bigint] NULL,
	[WriteDate] [datetime] NULL,
	[EditDate] [datetime] NULL,
	[ViewCount] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[RootPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RootReasonExists]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RootReasonExists](
	[RootReasonExists] [bigint] NULL,
	[Reason] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
	[LinkYoutube] [varchar](500) NULL,
	[ImageThumbnail] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[District] ([DistrictId], [DistrictName], [ProvinceId], [Note]) VALUES (1, N'Tuy Phước', 1, NULL)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [ProvinceId], [Note]) VALUES (2, N'Phù Cát', 1, NULL)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [ProvinceId], [Note]) VALUES (3, N'Quận 10', 2, NULL)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [ProvinceId], [Note]) VALUES (4, N'Quận Bình Thạnh', 2, NULL)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [ProvinceId], [Note]) VALUES (5, N'Quận 7', 2, NULL)
INSERT [dbo].[District] ([DistrictId], [DistrictName], [ProvinceId], [Note]) VALUES (6, N'Quận Đống Đa', 3, NULL)
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Note]) VALUES (1, N'Bình Định', N'')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Note]) VALUES (2, N'Hồ Chí Minh', NULL)
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [Note]) VALUES (3, N'Hà Nội', NULL)
INSERT [dbo].[RootBranch] ([RootBranchId], [Name], [Note], [IsDefault], [ImageThumbnail], [ProvinceId], [DistrictId], [Address]) VALUES (1, N'Nguyễn', NULL, NULL, N'tochonguyen_thumbnail_20221202.jpg', 1, 2, N'thôn Chánh Hữu, xã Cát Chánh')
INSERT [dbo].[RootBranch] ([RootBranchId], [Name], [Note], [IsDefault], [ImageThumbnail], [ProvinceId], [DistrictId], [Address]) VALUES (2, N'Trần', NULL, NULL, N'tochotran_thumbnail_20221202.jpg', 1, 1, NULL)
INSERT [dbo].[RootBranch] ([RootBranchId], [Name], [Note], [IsDefault], [ImageThumbnail], [ProvinceId], [DistrictId], [Address]) VALUES (3, N'Lê', NULL, NULL, N'tochole_thumbnail_20221202.jpg', 2, 2, NULL)
INSERT [dbo].[RootBranch] ([RootBranchId], [Name], [Note], [IsDefault], [ImageThumbnail], [ProvinceId], [DistrictId], [Address]) VALUES (4, N'Huỳnh', NULL, NULL, N'tochohuynh_thumbnail_20221202.jpg', 1, 2, NULL)
INSERT [dbo].[RootPerson] ([RootPersonId], [Name], [Sex], [DateOfBirth], [Level], [RootBranchId], [FatherRootPersonId], [MotherRootPersonId], [Remark], [RootBranch01Id], [RootBranch02Id], [ProvinceId], [DistrictId], [Address], [NickName], [Phone], [BirthDayAddress], [BirthDayProvinceId], [BirthDayDistrictId], [SortOrder], [ImageLink]) VALUES (1, N'Nguyễn Trần Thiên An', 1, CAST(N'1986-12-31 00:00:00.000' AS DateTime), 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 2, N'thôn Chánh Hữu, xã Cát Chánh', N'4 An', N'0232423132', N'Bệnh viên Từ Vũ, Hồ Chí Minh', 2, 2, 1, N'img1.jpg')
INSERT [dbo].[RootPerson] ([RootPersonId], [Name], [Sex], [DateOfBirth], [Level], [RootBranchId], [FatherRootPersonId], [MotherRootPersonId], [Remark], [RootBranch01Id], [RootBranch02Id], [ProvinceId], [DistrictId], [Address], [NickName], [Phone], [BirthDayAddress], [BirthDayProvinceId], [BirthDayDistrictId], [SortOrder], [ImageLink]) VALUES (2, N'Nguyễn Trần An Nhiên', 0, CAST(N'2005-02-02 00:00:00.000' AS DateTime), 1, 1, 1, 4, NULL, NULL, NULL, 1, 2, N'thôn Chánh Hữu, xã Cát Chánh', NULL, N'09574634534', N'Bình Định', 1, 2, 1, N'img2.jpg')
INSERT [dbo].[RootPerson] ([RootPersonId], [Name], [Sex], [DateOfBirth], [Level], [RootBranchId], [FatherRootPersonId], [MotherRootPersonId], [Remark], [RootBranch01Id], [RootBranch02Id], [ProvinceId], [DistrictId], [Address], [NickName], [Phone], [BirthDayAddress], [BirthDayProvinceId], [BirthDayDistrictId], [SortOrder], [ImageLink]) VALUES (3, N'Nguyễn Trần Trung Quân', 1, CAST(N'2009-01-21 00:00:00.000' AS DateTime), 1, 1, 1, 4, NULL, NULL, NULL, 1, 2, N'thôn Chánh Hữu, xã Cát Chánh', NULL, N'023234234', N'Bình Định', 1, 2, 2, N'img3.jpg')
INSERT [dbo].[RootPerson] ([RootPersonId], [Name], [Sex], [DateOfBirth], [Level], [RootBranchId], [FatherRootPersonId], [MotherRootPersonId], [Remark], [RootBranch01Id], [RootBranch02Id], [ProvinceId], [DistrictId], [Address], [NickName], [Phone], [BirthDayAddress], [BirthDayProvinceId], [BirthDayDistrictId], [SortOrder], [ImageLink]) VALUES (4, N'Trần Bảo Trân', 0, CAST(N'1987-11-23 00:00:00.000' AS DateTime), 0, 2, NULL, NULL, NULL, NULL, NULL, 2, 3, NULL, NULL, N'092483242142', N'', 2, 3, 3, N'img4.jpg')
INSERT [dbo].[RootPerson] ([RootPersonId], [Name], [Sex], [DateOfBirth], [Level], [RootBranchId], [FatherRootPersonId], [MotherRootPersonId], [Remark], [RootBranch01Id], [RootBranch02Id], [ProvinceId], [DistrictId], [Address], [NickName], [Phone], [BirthDayAddress], [BirthDayProvinceId], [BirthDayDistrictId], [SortOrder], [ImageLink]) VALUES (5, N'Lê Văn Anh', 1, CAST(N'2009-02-02 00:00:00.000' AS DateTime), 0, 3, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, 3, 1, 1, N'img2.jpg')
INSERT [dbo].[RootPersonRelationMap] ([RootPersonId], [WeddingDate], [Note], [RelationRootPersonId]) VALUES (1, CAST(N'2004-01-23 00:00:00.000' AS DateTime), NULL, 4)
INSERT [dbo].[RootPersonRelationMap] ([RootPersonId], [WeddingDate], [Note], [RelationRootPersonId]) VALUES (2, CAST(N'2010-02-23 00:00:00.000' AS DateTime), NULL, 5)
INSERT [dbo].[RootPost] ([RootPostId], [Title], [TextThumbnail], [ImageThumbnail], [Description], [CreateDate], [Writer], [Editor], [WriteDate], [EditDate], [ViewCount]) VALUES (1, N'Nhân Duyên', N'Có bao giờ ta tự hỏi:
- Bất động sản đang lên, lại có người được có người mất?
- Chứng khoán đang lên, lại có người được có người mất?', N'nhanduyen_20220213.jpg', N'Có bao giờ ta tự hỏi:
- Bất động sản đang lên, lại có người được có người mất?
- Chứng khoán đang lên, lại có người được có người mất?
- Vàng bạc đang lên, lại có người được có người mất?
- Đồng coin đang lên, lại có người được có người mất?
- Lan var đang lên, lại có người được có người mất?
- Cùng một chứng bệnh, cùng 1 bác sĩ và cùng 1 đơn toa, có người hết có người không?
- Cùng một lĩnh vực, cùng 1 ngành nghề, có người thành có người bại?
Khi nhìn sâu vào mọi sự vật hiện tượng với một niềm tin vào qui luật tự nhiên “nguyên nhân & kết quả (phương Tây gọi là causes & effects)”, mọi thứ xảy ra đều có thể được nhận biết và lý giải với con mắt của “nhân duyên - nhân & duyên”. 
“Nhân” là những hạt giống mà chúng ta đã từng gieo – nghĩa là những hành động (thân), những lời nói (khẩu) và những suy nghĩ (ý) mà chúng ta đã từng có, từng nói, từng làm trong quá khứ mà ta nhận biết lẫn quá khứ mà ta không nhận biết (quá khứ này lùi xa đến đâu là do nhận thức của từng người). Mỗi hạt nhân mà ta đã từng gieo sẽ “nở” vào một ngày nào đó tùy thuận vào duyên. Và lẽ dĩ nhiên, mỗi người chúng ta sẽ có vô số những nhân thiện cũng như nhân bất thiện ở 3 tầng thân – khẩu – ý. Nhân có 2 loại nhân – nhân tự thân và nhân cộng hưởng. “Nhân tự thân” chính là những suy nghĩ, lời nói, hành động của chính mình – do mình tự làm kể cả vô tình hay hữu ý. “Nhân cộng hưởng” chính là những suy nghĩ, lời nói, hành động không phải của ta mà là của người khác và những người này có mối liên hệ cộng đoàn với chính ta.
“Duyên” chính là chất xúc tác, chính là những điều kiện cần và đủ để một sự vật, sự việc, hiện tượng nào có được xảy ra. Ví như để một bông hoa mai/hoa đào được nở vào ngày Tết thì ngoài cái “nhân” là hạt giống/ cây giống thì cần có tập hợp vô số những điều kiện (hay còn gọi là duyên) chẳng hạn như đất đầy đủ dinh dưỡng, nước vừa đủ, ánh nắng mặt trời, tiết trời nắng nóng đối với hoa mai/ tiết trời lạnh mát đối với hoa đào, sương, ẩm độ, sự chăm sóc của con người như tỉa cành, lảy lá, …… Duyên cũng có 2 nhóm – “tạo duyên” và “trợ duyên”. “Tạo duyên” là do ta nỗ lực tự có những suy nghĩ, lời nói, hành động để thúc đẩy, làm nhanh tiến trình xảy ra của sự việc. Còn “trợ duyên” là những suy nghĩ, lời nói, hành động, sự việc, hiện tượng, hoàn cảnh, điều kiện bên ngoài được làm/ được xảy ra giúp cho sự việc có đủ điều kiện để xảy ra. Ví như ta muốn chạy bộ vào sáng sớm thì ta có thể tự tạo duyên (chứ đừng đợi “tùy duyên”) bằng cách mua giày chạy bộ, mua đồ thể thao, đặt chỉnh đồng hồ reo, … và ta cũng có thể được trợ duyên bằng một người huấn luyện chạy bộ, một người bạn đồng hành cùng chạy bộ, hoặc đôi khi được trợ duyên bằng thời tiết phù hợp, một phong trào chạy bộ ngay tại khu nhà ở của bạn, …. 
Đôi khi, bất luận ta đã tích cực tạo duyên và được trợ duyên nhưng vẫn có một số trắc trở làm cho ta không thể chạy bộ buổi sáng được. Lúc đó, ta hiểu rằng ta chưa có được nhân – hạt giống cho sự việc này và hãy quay trở về gieo trồng cho mình hạt giống.
Tóm lại, nhân – duyên là điều kiện cần và đủ để mọi kết quả được xảy ra và với cái nhìn của nhân - duyên thì chúng ta thấy phần lớn “nhân” chúng ta có thể tự quyết định ngay khoảnh khắc hiện tại với những gì chúng ta nghĩ, nói và làm bằng “nhân tự thân”. Thế người xưa mới có câu: “Bồ Tát thì sợ nhân còn chúng sanh thì sợ quả”. Và “duyên” thì chúng ta có thể nỗ lực tự “tạo duyên” theo kiểu “muốn ăn thì phải lăn vào bếp” chứ đừng ngồi đó mà thụ động chờ đợi mọi thứ xảy ra. 
Còn lại 2 yếu tố cũng không kém phần quan trọng đó là “nhân cộng hưởng” và “sự trợ duyên”. Hai yếu tố này liên quan rất nhiều đến 2 phạm trù được gọi là “Phúc” & “Đức”. Nếu các bạn quan tâm, Andy sẽ tiếp tục chia sẻ quan điểm của mình về Phúc – Đức ở bài kế tiếp.
Duyên lành,
Andy Huỳnh Ngọc Minh
Người đánh thức năng lực', CAST(N'2022-02-13 00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[RootPost] ([RootPostId], [Title], [TextThumbnail], [ImageThumbnail], [Description], [CreateDate], [Writer], [Editor], [WriteDate], [EditDate], [ViewCount]) VALUES (2, N'Phúc Đức ', N'Bài trước khi nói về “nhân duyên”, Andy cũng có nhắc một chút đến chuyện Phúc & Đức. Hôm nay Andy sẽ chia sẻ sâu hơn về việc tạo phúc và lập đức dựa trên nhận thức và hiểu biết cũng như thực hành hiện tại của Andy nhe ACE.', N'phucduc_20220213.jpg', N'Bài trước khi nói về “nhân duyên”, Andy cũng có nhắc một chút đến chuyện Phúc & Đức. Hôm nay Andy sẽ chia sẻ sâu hơn về việc tạo phúc và lập đức dựa trên nhận thức và hiểu biết cũng như thực hành hiện tại của Andy nhe ACE.
 Ông, Bà ta truyền rằng: “Có phúc thì có phần”, “Có đức mặc sức mà ăn”. Bởi thế, đời người nhất thiết chúng ta cần phải rốt ráo tạo phúc & lập đức để đời sống được thuận lợi, may mắn và thành tựu. Vậy, phúc và gì? Đức làm gì? Làm gì để tăng bồi phúc đức? 
Phúc đức được ví như một tài khoản trung gian được kết chuyển từ những nhân lành (hạt giống thiện được gieo trồng từ các tầng thân (hành động), khẩu (lời nói) và ý (suy nghĩ). Từ đây, tài khoản phúc đức sẽ khởi sinh nên duyên lành & quả ngọt.
Xem lại bài nhân duyên tại đây: https://www.facebook.com/huynhngocminh.trainer/posts/4848900705229458
Đức: Người xưa dạy rằng: “Tu tâm, tích đức”. Đức được xem như là đức hạnh, là nhân đức, là đạo đức là cách sống của con người. Đức là biểu hiệu của sự rèn luyện, tu chỉnh chính bản thân mình, là ý thực thực tập cách sống để mình trở nên tốt hơn mỗi ngày. Ví như, người sống có đức hạnh thường có suy nghĩ tích cực, đón nhận, nhẹ nhàng, có thái đội hòa nhã, khiêm cung, khiêm nhường, có lời nói nhẹ nhàng, ái ngữ, hòa hợp, có những hành động trân trọng, tôn kính, đề cao người khác. Tóm lại, Đức là những gì ta hướng về chính mình, là những gì ta thực hành, sống hằng ngày để tạo nên một nền tảng giá trị sống, một hệ niềm tin, suy nghĩ, thái độ, lời nói, hành động thiện lành. Tuy nhiên, đức thì cũng không thể thiếu phúc (phước).  
Phúc (phước).  “Làm phước, tu phước”. Phước đến từ hành động thiện lành như chia sẻ, cho đi, giúp đỡ, hỗ trợ, tạo điều kiện thuận lợi cho người khác… Phước có được là từ những hành động tốt đẹp hướng đến người khác một cách không vụ lợi, không toang tính. Phước báu đến từ lời nói mang lại kết quả tốt đẹp cho người khác. Phước báu đến từ những hành động giúp đỡ từ việc chia sớt, đóng góp về tài chính, vật chất, thời gian, công sức, tri thức, và các nguồn lực khác, … ví dụ: làm phước bằng cách nói lời kết nối giao thương, giới thiệu thương vụ, chia sẻ cơ hội, đóng góp tài chính làm thiện nguyện, giúp đỡ người khác, dành thời gian lắng nghe và tư vấn, cùng làm các công việc công ích, công trình cộng đồng, hướng dẫn, giảng dạy cho người khác kiến thức cần thiết, … mà không đòi hỏi, mong cầu bất gì điều gì cho mình.
Mỗi hành động thiện ta làm sẽ được kết chuyển và tích lũy trong tài khoản – giống như tài khoản ngân hàng – tạm gọi là tài khoản Phúc Đức nhé. Và ta cần hiểu rằng, mỗi điều lợi lạc mà ta thọ nhận trong từng khoảnh khắc là bởi vì chúng ta có đã được phước báu … nên “có phước thì có phần, có phần không cần gì lo”. Bởi thế, đôi khi ta sẽ thấy người ta làm chơi mà ăn thiệt là là vì họ đã tích được nhiều phước báu. Lẽ dĩ nhiên, Phước xài miết thì cũng cạn dần nên ta cần phải tạo phước liên tục, … thậm chí ông bà xưa còn gọi là “bòn” phước như bòn mót từng đồng từng cắt, … Nếu như ta chỉ biết xài phước, tiêu phước, tổn phước mà không tích phước, tái tạo phước thì một lúc nào đó chúng ta chẳng còn phước để được thọ hưởng những lợi lạc trong cuộc đời. Và cuối cùng, ngày chúng ta không còn trên đời này nữa thì cái còn lại đó chính số dư tài khoản phước báu được kết chuyển cuối kỳ. Tặng ACE nguyên tắc 5T liên quan đến Phước nhé:
- Tạo phước
- Tích phước
- Tiêu phước
- Tái tạo phước
- Tồn phước 
Cảm ơn ACE quan tâm đến những chia sẻ này. Bài tiếp theo Andy sẽ chia sẻ tổng quan về nhân - duyên, nghiệp - quả và phước - đức! 
Duyên phước!
Andy', CAST(N'2022-02-13 00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[RootReasonExists] ([RootReasonExists], [Reason], [Description], [LinkYoutube], [ImageThumbnail]) VALUES (1, N'<p>Gia phả học là một ngành của khoa học lịch sử. Sử sách ghi lại những sự kiện của đất nước.</p> 
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
/****** Object:  StoredProcedure [dbo].[vnsp_Branch_getBranchById]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_Branch_getBranchById]
(
	@Id INT
)
AS
BEGIN
    DECLARE @query NVARCHAR(MAX)=''
	SET @query = @query + '
		SELECT	Br.RootBranchId, 
				Br.Name, 
				Br.Note, 
				Br.IsDefault, 
				Br.ImageThumbnail, 
				ISNULL(A.ProvinceName,'''') ProvinceName, 
				ISNULL(B.DistrictName,'''') DistrictName, 
				ISNULL(Br.Address,'''') Address
		FROM RootBranch Br
		JOIN(
				SELECT *
				FROM Province Pr 
			) A ON Br.ProvinceId = A.ProvinceId
		JOIN (
				SELECT * 
				FROM dbo.District D
			) B ON Br.DistrictId = B.DistrictId
		WHERE Br.RootBranchId = ' + CONVERT(VARCHAR(20),@Id)

	EXEC (@query)
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_Branch_getBranchList]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vnsp_Branch_getBranchList]
(
	@pageSize BIGINT,
	@pageSkip BIGINT,
	@txtSearchVN NVARCHAR(500),
	@provinceID BIGINT,
	@districtID BIGINT,
	@txtWardVN NVARCHAR(500),
	@txtSearchEn NVARCHAR(500),
	@txtWardEn NVARCHAR(500)
)
AS
BEGIN
	--DECLARE @sql NVARCHAR(MAX) = '',
	--		@condition NVARCHAR(MAX) = ''
 --   SET @sql = 'SELECT * FROM RootBranch'


    DECLARE @sql NVARCHAR(MAX) = '',
			@condition NVARCHAR(MAX) = ''
    SET @sql = ' 
	SELECT	Br.RootBranchId, 
			Br.Name, 
			Br.Note, 
			Br.IsDefault, 
			Br.ImageThumbnail, 
			ISNULL(A.ProvinceName,'''') ProvinceName, 
			ISNULL(B.DistrictName,'''') DistrictName, 
			ISNULL(Br.Address,'''') Address
	FROM RootBranch Br
	JOIN(
            SELECT *
            FROM Province Pr ';

	--IF(@provinceID IS NOT NULL AND LEN(@provinceID)!=0 OR @districtID IS NOT NULL AND LEN(@districtID)!=0 OR @txtWard IS NOT NULL AND LEN(@txtWard)!=0)
	--BEGIN
	--	SET @sql = @sql + '
 --               WHERE
	--	'
	--END
	--ELSE GOTO Ket_Thuc

    IF (@provinceID != 0 AND LEN(@provinceID)!=0)
    BEGIN
        SET @sql = @sql + '
			WHERE Pr.ProvinceId = '+ CAST(@provinceID AS NVARCHAR(50));
    END
	
	SET @sql = @sql + '
		) A ON Br.ProvinceId = A.ProvinceId
	JOIN (
			SELECT * FROM dbo.District D
	'
	
	IF (@districtID != 0 AND LEN(@districtID)!=0)
	BEGIN
		SET @sql = @sql + '
			WHERE D.DistrictId = '+ CAST(@districtID AS NVARCHAR(50));
	END
    
	SET @sql = @sql + '
		) B ON Br.DistrictId = B.DistrictId
	'

	IF (@txtWardVN IS NOT NULL OR LEN(@txtWardVN)!=0)
	BEGIN
		SET @sql = @sql + '
		WHERE Br.Address LIKE N''%' + @txtWardVN + '%'' OR Br.Address LIKE N''%' + @txtWardEn + '%''';
		SET @condition = ' AND '
	END
	ELSE SET @condition = ' WHERE '
--Ket_Thuc:
--	SET @sql = @sql + '
--            ) as A ON T.AddressId = A.Id ';
	IF (@txtSearchVN IS NOT NULL AND LEN(@txtSearchVN)!=0)
    BEGIN
		SET @sql = @sql + @condition
        SET @sql = @sql + ' 
			Br.Name LIKE N''%' + @txtSearchVN + '%'' OR Br.Name LIKE N''%' + @txtSearchEn + '%''
			OR Br.RootBranchId IN (
					SELECT DISTINCT P.RootBranchId FROM dbo.RootPerson P
					WHERE P.Name LIKE N''%' + @txtSearchVN + '%'' OR P.Name LIKE N''%' + @txtSearchEn + '%''
				)
			';
    END

    SET @sql = @sql + ' ORDER BY Br.Name ASC ';

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
/****** Object:  StoredProcedure [dbo].[vnsp_Branch_getDistrictListByIdList]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vnsp_Branch_getDistrictListByIdList]
(
	@provinceID BIGINT
)
AS
BEGIN
    SELECT * FROM District WHERE ProvinceId = @provinceID
END

GO
/****** Object:  StoredProcedure [dbo].[vnsp_Branch_getProvinceList]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vnsp_Branch_getProvinceList]
AS
BEGIN
    SELECT * FROM Province
END
GO

/****** Object:  StoredProcedure [dbo].[vnsp_Post_getPostById]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vnsp_Post_getPostById]
(
	@Id INT
)
AS
BEGIN
    DECLARE @query NVARCHAR(MAX)=''
	SET @query = @query + N'
		SELECT *
		FROM RootPost P
		WHERE P.RootPostId = ' + CONVERT(VARCHAR(20),@Id)

	EXEC (@query)
END
GO
/****** Object:  StoredProcedure [dbo].[vnsp_Post_getPostList]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vnsp_Post_getPostList]
(
	@pageSize BIGINT,
	@pageSkip BIGINT,
	@txtSearchVN NVARCHAR(500),
	@txtSearchEn NVARCHAR(500)
)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX) = '',
			@condition NVARCHAR(MAX) = ''
	SET @condition =  ' WHERE '
    SET @sql = ' 
	SELECT	*
	FROM RootPost P ';

	IF (@txtSearchVN IS NOT NULL AND LEN(@txtSearchVN)!=0)
    BEGIN
		SET @sql = @sql + @condition
        SET @sql = @sql + ' 
			P.Title LIKE N''%' + @txtSearchVN + '%'' OR P.Title LIKE N''%' + @txtSearchEn + '%''
			OR P.TextThumbnail LIKE N''%' + @txtSearchVN + '%'' OR P.TextThumbnail LIKE N''%' + @txtSearchEn + '%''
			OR P.Description LIKE N''%' + @txtSearchVN + '%'' OR P.Description LIKE N''%' + @txtSearchEn + '%''
			';
    END

    SET @sql = @sql + ' ORDER BY P.Title ASC ';

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
/****** Object:  StoredProcedure [dbo].[vnsp_ReasonExists_getReasonExistsList]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vnsp_ReasonExists_getReasonExistsList]
AS
BEGIN
    Select * from RootReasonExists
END

GO

/****** Object:  StoredProcedure [dbo].[vnsp_Branch_LoadBranchDetail]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC vnsp_Branch_LoadBranchDetail
(
	@BranchId INT
)
AS
BEGIN
	DECLARE @query NVARCHAR(MAX) = N'',
			@strBranch NVARCHAR(MAX) = N''

	IF @BranchId<>''
		SET @strBranch =N' AND RP.RootBranchId = '+CAST(@BranchId AS VARCHAR(10))
	SET @query = N'
		SELECT	ROW_NUMBER() OVER(ORDER BY(SELECT NULL)) STT,
				RP.RootPersonId,
				RP.Level, 
				RP.Name, 
				RP.FatherRootPersonId, 
				RP.MotherRootPersonId, 
				ISNULL(Father.Name,'''') FatherName, 
				ISNULL(Mother.Name,'''') MotherName,
				FORMAT(RP.DateOfBirth,''dd/MM/yyyy'') DateOfBirth, 
				CASE 
					WHEN RP.Sex = 1 THEN N''Nam'' ELSE N''Nữ''
				END Sex,
				ISNULL(RP.Address,'''') Address,
				RP.Phone,
				RP.SortOrder,
				RP.RootBranchId,
				RM.RelationRootPersonId PartnerPersonId,
				RM.WeddingDate,
				RM.RootBranchId PartnerBranchId,
				RM.Level PartnerLevel,
				ISNULL(RM.Partner,'''') Partner,
				CASE
					WHEN RMemory.DateOfDeath IS NULL THEN N''Còn sống'' ELSE N''Đã mất'' 
				END Death,
				RMemory.DateOfDeath,
				RMemory.LunarDateOfDeath,
				RM.PartnerMaxLevel,
				Father.Level FatherLevel,
				Father.RootBranchId FatherBranchId,
				Mother.Level MotherLevel,
				Mother.RootBranchId MotherBranchId,
				RP1.maxLevel
		FROM dbo.RootPerson RP
		LEFT JOIN(
			SELECT * 
			FROM dbo.RootPerson
		) Father ON Father.RootPersonId = RP.FatherRootPersonId
		LEFT JOIN(
			SELECT * 
			FROM dbo.RootPerson
		) Mother ON Mother.RootPersonId = RP.MotherRootPersonId
		LEFT JOIN(
			SELECT RP1.RootBranchId, MAX(RP1.Level) maxLevel
			FROM RootPerson RP1
			WHERE RP1.RootBranchId = '+ CAST(@BranchId AS VARCHAR(10)) +N'
			GROUP BY  RP1.RootBranchId
		) RP1 ON RP1.RootBranchId = RP.RootBranchId
		LEFT JOIN(
			SELECT RPRM.RootPersonId, RPRM.RelationRootPersonId,RPR.RootBranchId, 
			RPRM.WeddingDate, RPR.Name Partner,RPR.Level, RPR.PartnerMaxLevel
			FROM dbo.RootPersonRelationMap RPRM
			LEFT JOIN(
				SELECT RPR.RootPersonId,RPR.RootBranchId,RPR.Name, RPR.Level, MAX(RPR.Level) PartnerMaxLevel 
				FROM dbo.RootPerson RPR 
				GROUP BY RPR.RootPersonId,RPR.RootBranchId,RPR.Name, RPR.Level
			) RPR ON RPR.RootPersonId = RPRM.RelationRootPersonId
		) RM ON RM.RootPersonId = RP.RootPersonId  
		LEFT JOIN(
			SELECT *
			FROM dbo.RootPersonMemory
		) RMemory ON RMemory.RootPersonId = RP.RootPersonId
		WHERE 1=1 ' + @strBranch + N'
		ORDER BY RP.Level, RP.SortOrder
	'

	EXEC (@query)
END
GO
EXEC vnsp_Branch_LoadBranchDetail 1
/****** Object:  StoredProcedure [dbo].[vnsp_Person_getBranchSourceById]    Script Date: 2/25/2022 11:52:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[vnsp_Person_getBranchSourceById]
(
	@BranchId INT,
	@PersonId INT,
	@Level INT,
	@MaxLevel INT
)
AS
BEGIN
		DECLARE @query NVARCHAR(MAX) = N'',
				@w_Level VARCHAR(MAX) = '',
				@strBranch VARCHAR(MAX) = '',
				@strBranch1 VARCHAR(MAX) = '',
				@strPerson VARCHAR(MAX) = ''

		IF @BranchId <>''
		BEGIN
			SET @strBranch = ' AND RP1.RootBranchId = '+ CAST(@BranchId AS VARCHAR(10)) 
			SET @strBranch1 = ' AND RP.RootBranchId = '+ CAST(@BranchId AS VARCHAR(10)) 
		END

		IF @PersonId <>''
		BEGIN
			SET @strPerson = ' AND RP.RootPersonId = '+ CAST(@PersonId AS VARCHAR(10))
		END
		
		IF @Level=0
			SET @w_Level = ' (0,1,2) '
		ELSE IF @Level >= @MaxLevel 
			SET @w_Level = ' ('+CAST((@Level-2) AS VARCHAR(10))+','+CAST((@Level-1) AS VARCHAR(10))+','+CAST((@Level) AS VARCHAR(10))+') '
		ELSE
			SET @w_Level = ' ('+CAST((@Level-1) AS VARCHAR(10))+','+CAST(@Level AS VARCHAR(10))+','+CAST((@Level+1) AS VARCHAR(10))+') '

		SET @query = @query + N'
		SELECT	RP.RootPersonId,
				RP1.RootPersonId id,
				RP1.Name name,
				RP1.Sex,
				RP1.DateOfBirth,
				RP1.Level,
				RP1.FatherRootPersonId pid,
				RP1.MotherRootPersonId,
				RP1.Remark,
				RP1.RootBranch01Id,
				RP1.RootBranch02Id,
				RP1.ProvinceId,
				RP1.DistrictId,
				RP1.Address,
				RP1.NickName,
				RP1.Phone,
				RP1.BirthDayAddress,
				RP1.BirthDayProvinceId,
				RP1.BirthDayDistrictId,
				RP1.SortOrder,
				RP1.ImageLink img,
				RP.RootBranchId
		FROM dbo.RootPerson RP
		LEFT JOIN(
			SELECT *
			FROM dbo.RootPerson RP1 
			WHERE 1 = 1 
		) RP1 ON RP1.RootBranchId = RP.RootBranchId
		WHERE 1=1 ' +@strPerson+ @strBranch1 + N' 
					AND RP1.Level IN '+ @w_Level
	PRINT(@query)
	EXEC (@query)
END
GO

EXEC [vnsp_Person_getBranchSourceById] 1,7,2,2