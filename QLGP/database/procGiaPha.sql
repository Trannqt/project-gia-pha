ALTER PROC vnsp_LyDoTonTai_getLyDoTonTaiList
AS
BEGIN
    Select * from LyDoTonTai
END
GO

ALTER PROC vnsp_ThanhVien_getChildrenById
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

ALTER PROC vnsp_ThanhVien_getWifeById
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



ALTER PROC vnsp_ThanhVien_getThanhVienById
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

ALTER PROC vnsp_TocHo_getTocHoById
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

ALTER PROC vnsp_TocHo_getNgayLeGioById
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

ALTER PROC vnsp_TocHo_getSoDoi
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

ALTER PROC vnsp_TocHo_getSoLuongGiaDinh
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

ALTER PROC vnsp_TocHo_getSoLuongThanhVien
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


ALTER PROC vnsp_TocHo_getTocHoList
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
