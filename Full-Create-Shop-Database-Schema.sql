USE [shop]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[CompanySupervisor] [bigint] NOT NULL,
	[CompanyDesc] [nvarchar](max) NOT NULL,
	[CompanyType] [varchar](20) NOT NULL,
	[CountryCode] [varchar](10) NOT NULL,
	[TaxID] [varchar](20) NOT NULL,
	[Url] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyMeta]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMeta](
	[CMetaID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyID] [bigint] NOT NULL,
	[MetaKey] [varchar](255) NULL,
	[MetaValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberMeta]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMeta](
	[MMetaID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[MetaKey] [varchar](255) NULL,
	[MetaValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](60) NOT NULL,
	[Pass] [varchar](255) NOT NULL,
	[Nicename] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](250) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Url] [varchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ActivationKey] [varchar](255) NOT NULL,
	[IsStaff] [bit] NOT NULL,
	[Status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCoupon]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCoupon](
	[OrderID] [bigint] NOT NULL,
	[CouponID] [bigint] NOT NULL,
	[DiscountAmount] [decimal](10, 2) NOT NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMeta]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMeta](
	[OMetaID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[MetaKey] [varchar](255) NULL,
	[MetaValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[VariationID] [bigint] NOT NULL,
	[CustomerID] [bigint] NULL,
	[ProductQuantity] [decimal](10, 2) NOT NULL,
	[ProductNetRevenue] [decimal](10, 2) NOT NULL,
	[ProductGrossRevenue] [decimal](10, 2) NOT NULL,
	[CouponAmount] [decimal](10, 2) NOT NULL,
	[TaxAmount] [decimal](10, 2) NOT NULL,
	[ShippingAmount] [decimal](10, 2) NOT NULL,
	[ShippingTaxAmount] [decimal](10, 2) NOT NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStats]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStats](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[ParentID] [bigint] NOT NULL,
	[NumItemsSold] [int] NOT NULL,
	[TotalSales] [decimal](10, 2) NOT NULL,
	[TaxTotal] [decimal](10, 2) NOT NULL,
	[ShippingTotal] [decimal](10, 2) NOT NULL,
	[NetTotal] [decimal](10, 2) NOT NULL,
	[ReturningCustomer] [tinyint] NULL,
	[Created] [datetime] NOT NULL,
	[Status] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointReward]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointReward](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Points] [bigint] NOT NULL,
	[PointsBalance] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMeta]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMeta](
	[PMetaID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[MetaKey] [varchar](255) NULL,
	[MetaValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductAuthor] [bigint] NOT NULL,
	[ProductContent] [nvarchar](max) NOT NULL,
	[ProductTitle] [nvarchar](200) NOT NULL,
	[ProductExcerpt] [nvarchar](1000) NOT NULL,
	[ProductStatus] [varchar](20) NOT NULL,
	[ProductPassword] [varchar](255) NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[Ping] [nvarchar](max) NOT NULL,
	[PingStatus] [varchar](20) NOT NULL,
	[Follow] [nvarchar](max) NOT NULL,
	[FollowStatus] [varchar](20) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ProductContentFiltered] [nvarchar](max) NOT NULL,
	[ProductParent] [bigint] NOT NULL,
	[Guid] [varchar](1000) NOT NULL,
	[MenuOrder] [int] NOT NULL,
	[ProductType] [varchar](20) NOT NULL,
	[ProductMimeType] [varchar](100) NOT NULL,
	[CommentStatus] [varchar](20) NOT NULL,
	[CommentCount] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Quantity] [decimal](10, 2) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyID] [bigint] NOT NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[StoreSupervisor] [bigint] NOT NULL,
	[StoreDesc] [nvarchar](max) NOT NULL,
	[Phone] [varchar](100) NOT NULL,
	[CountryCode] [varchar](10) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[State] [nvarchar](30) NOT NULL,
	[City] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreStaff]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreStaff](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[StaffID] [bigint] NOT NULL,
	[Permission] [nvarchar](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermMeta]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermMeta](
	[TMetaID] [bigint] IDENTITY(1,1) NOT NULL,
	[TermID] [bigint] NOT NULL,
	[MetaKey] [varchar](255) NULL,
	[MetaValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermRelationships]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermRelationships](
	[ObjectID] [bigint] NOT NULL,
	[TermTaxonomyID] [bigint] NOT NULL,
	[TermOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ObjectID] ASC,
	[TermTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terms]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[TermID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Slug] [varchar](1000) NOT NULL,
	[TermGroup] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermTaxonomy]    Script Date: 2022/5/13 上午 12:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermTaxonomy](
	[TermTaxonomyID] [bigint] IDENTITY(1,1) NOT NULL,
	[TermID] [bigint] NOT NULL,
	[Taxonomy] [varchar](20) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Parent] [bigint] NOT NULL,
	[Count] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TermTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_TermIDTaxonomy] UNIQUE NONCLUSTERED 
(
	[TermID] ASC,
	[Taxonomy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [CompanyName]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ((0)) FOR [CompanySupervisor]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [CompanyDesc]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('retailer') FOR [CompanyType]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('') FOR [CountryCode]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('') FOR [TaxID]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('') FOR [Url]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CompanyMeta] ADD  DEFAULT ('') FOR [MetaKey]
GO
ALTER TABLE [dbo].[CompanyMeta] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [MetaValue]
GO
ALTER TABLE [dbo].[MemberMeta] ADD  DEFAULT ('') FOR [MetaKey]
GO
ALTER TABLE [dbo].[MemberMeta] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [MetaValue]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ('') FOR [Pass]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ('') FOR [Nicename]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [DisplayName]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ('') FOR [Url]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ('') FOR [ActivationKey]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [IsStaff]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderCoupon] ADD  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[OrderCoupon] ADD  DEFAULT ((0)) FOR [CouponID]
GO
ALTER TABLE [dbo].[OrderCoupon] ADD  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[OrderCoupon] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[OrderMeta] ADD  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[OrderMeta] ADD  DEFAULT ('') FOR [MetaKey]
GO
ALTER TABLE [dbo].[OrderMeta] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [MetaValue]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [ProductID]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [VariationID]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT (NULL) FOR [CustomerID]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [ProductQuantity]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [ProductNetRevenue]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [ProductGrossRevenue]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [CouponAmount]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [TaxAmount]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [ShippingAmount]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT ((0)) FOR [ShippingTaxAmount]
GO
ALTER TABLE [dbo].[OrderProduct] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [CustomerID]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [NumItemsSold]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [TotalSales]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [TaxTotal]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [ShippingTotal]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ((0)) FOR [NetTotal]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT (NULL) FOR [ReturningCustomer]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[OrderStats] ADD  DEFAULT ('') FOR [Status]
GO
ALTER TABLE [dbo].[PointReward] ADD  DEFAULT ((0)) FOR [CustomerID]
GO
ALTER TABLE [dbo].[PointReward] ADD  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[PointReward] ADD  DEFAULT ((0)) FOR [Points]
GO
ALTER TABLE [dbo].[PointReward] ADD  DEFAULT ((0)) FOR [PointsBalance]
GO
ALTER TABLE [dbo].[PointReward] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ProductMeta] ADD  DEFAULT ('') FOR [MetaKey]
GO
ALTER TABLE [dbo].[ProductMeta] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [MetaValue]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductAuthor]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [ProductContent]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [ProductTitle]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [ProductExcerpt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('publish') FOR [ProductStatus]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('') FOR [ProductPassword]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('') FOR [ProductName]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [Ping]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('open') FOR [PingStatus]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [Follow]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('active') FOR [FollowStatus]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [ProductContentFiltered]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductParent]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('') FOR [Guid]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [MenuOrder]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('physical') FOR [ProductType]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('') FOR [ProductMimeType]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('open') FOR [CommentStatus]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [CommentCount]
GO
ALTER TABLE [dbo].[Stocks] ADD  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Stocks] ADD  DEFAULT ((0)) FOR [ProductID]
GO
ALTER TABLE [dbo].[Stocks] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Stocks] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Stocks] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Stocks] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ((0)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [StoreName]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ((0)) FOR [StoreSupervisor]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [StoreDesc]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ('') FOR [CountryCode]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ('') FOR [ZipCode]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [State]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [City]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [Address]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[StoreStaff] ADD  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[StoreStaff] ADD  DEFAULT ((0)) FOR [StaffID]
GO
ALTER TABLE [dbo].[StoreStaff] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [Permission]
GO
ALTER TABLE [dbo].[StoreStaff] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[StoreStaff] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[StoreStaff] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[TermMeta] ADD  DEFAULT ((0)) FOR [TermID]
GO
ALTER TABLE [dbo].[TermMeta] ADD  DEFAULT ('') FOR [MetaKey]
GO
ALTER TABLE [dbo].[TermMeta] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [MetaValue]
GO
ALTER TABLE [dbo].[TermRelationships] ADD  DEFAULT ((0)) FOR [ObjectID]
GO
ALTER TABLE [dbo].[TermRelationships] ADD  DEFAULT ((0)) FOR [TermTaxonomyID]
GO
ALTER TABLE [dbo].[TermRelationships] ADD  DEFAULT ((0)) FOR [TermOrder]
GO
ALTER TABLE [dbo].[Terms] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [Name]
GO
ALTER TABLE [dbo].[Terms] ADD  DEFAULT ('') FOR [Slug]
GO
ALTER TABLE [dbo].[Terms] ADD  DEFAULT ((0)) FOR [TermGroup]
GO
ALTER TABLE [dbo].[TermTaxonomy] ADD  DEFAULT ((0)) FOR [TermID]
GO
ALTER TABLE [dbo].[TermTaxonomy] ADD  DEFAULT ('') FOR [Taxonomy]
GO
ALTER TABLE [dbo].[TermTaxonomy] ADD  DEFAULT (('') collate Chinese_Taiwan_Stroke_CI_AS) FOR [Description]
GO
ALTER TABLE [dbo].[TermTaxonomy] ADD  DEFAULT ((0)) FOR [Parent]
GO
ALTER TABLE [dbo].[TermTaxonomy] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [fk_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [fk_CompanyID]
GO
