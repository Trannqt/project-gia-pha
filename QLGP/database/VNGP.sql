USE VNGP
GO

CREATE TABLE RootBranch
(
	RootBranchId BIGINT PRIMARY KEY,
    Name NVARCHAR(250),
	Note NVARCHAR(500),
    IsDefault BIT
)
GO

CREATE TABLE RootBranch01
(
	RootBranch01Id BIGINT PRIMARY KEY,
    Name NVARCHAR(250),
	Note NVARCHAR(500),
    IsDefault BIT
)
GO

CREATE TABLE RootBranch02
(
	RootBranch02Id BIGINT PRIMARY KEY,
    Name NVARCHAR(250),
	Note NVARCHAR(500),
    IsDefault BIT
)
GO

CREATE TABLE RootPerson
(
	RootPersonId BIGINT PRIMARY KEY,
    Name NVARCHAR(250),
    Sex BIT,
	DateOfBirth DATETIME,
	Level INT,
	RootBranchId BIGINT,
	FatherRootPersonId BIGINT,
	MotherRootPersonId BIGINT,
	Remark NVARCHAR(500),
	RootBranch01Id BIGINT,
	RootBranch02Id BIGINT,
	ProvinceId BIGINT,
	DistrictId BIGINT,
	Address NVARCHAR(100),
	NickName NVARCHAR(100),
	Phone VARCHAR(100),
	BirthDayAddress NVARCHAR(100),
	BirthDayProvinceId BIGINT,
	BirthDayDistrictId BIGINT,
	SortOrder INT,
	ImageLink VARCHAR(100)
)
GO

CREATE TABLE RootPersonMemory
(
	RootPersonId BIGINT,
    DateOfDeath DATETIME,
	LunarDateOfDeath DATETIME,
    Gravestone NVARCHAR(100),
	MemoryNote NTEXT,
	PureMemoryNote NVARCHAR(4000),
	MerchantId BIGINT,
	PRIMARY KEY (RootPersonId, MerchantId)
)
GO

CREATE TABLE RootPersonRelationMap
(
	RootPersonId BIGINT,
    WeddingDate DATETIME,
	Note NVARCHAR(500),
	RelationRootPersonId BIGINT,
	PRIMARY KEY (RootPersonId, RelationRootPersonId)
)
GO

CREATE TABLE RootReasonExists
(
	RootReasonExists BIGINT,
	Reason NVARCHAR(4000),
	Description NVARCHAR(4000),
	LinkYoutube VARCHAR(500),
	ImageThumbnail VARCHAR(500)	
)
GO

CREATE TABLE Province
(
	ProvinceId BIGINT PRIMARY KEY,
	ProvinceName NVARCHAR(500),
	Note NVARCHAR(500)
)
GO

CREATE TABLE District
(
	DistrictId BIGINT PRIMARY KEY,
	DistrictName NVARCHAR(500),
	ProvinceId BIGINT,
	Note NVARCHAR(500)
)
GO

