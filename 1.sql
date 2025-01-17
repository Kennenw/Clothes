USE [master]
GO
/****** Object:  Database [ClothingAssignment]    Script Date: 3/18/2024 9:31:50 PM ******/
CREATE DATABASE [ClothingAssignment]

USE [ClothingAssignment]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/18/2024 9:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/18/2024 9:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Order_date] [date] NULL,
	[Total] [float] NULL,
	[Note] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/18/2024 9:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/18/2024 9:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Stock] [int] NULL,
	[Image] [ntext] NULL,
	[Description] [nvarchar](1000) NULL,
	[Create_date] [date] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/18/2024 9:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Balance] [float] NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nchar](11) NULL,
	[RoleId] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Shoes')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'T-shirts')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Shirts')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Pants')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Watches')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (6, N'Bags')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (1, 2, CAST(N'2024-03-17' AS Date), 20, N'please careful', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (2, 2, CAST(N'2024-03-20' AS Date), 33, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (3, 2, CAST(N'2024-05-13' AS Date), 12, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (4, 2, CAST(N'2024-03-17' AS Date), 33, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (5, 2, CAST(N'2024-03-15' AS Date), 22, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (6, 2, CAST(N'2024-04-17' AS Date), 15, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (7, 2, CAST(N'2024-03-17' AS Date), 43, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (8, 2, CAST(N'2024-03-17' AS Date), 73, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (9, 2, CAST(N'2024-03-17' AS Date), 73, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (10, 2, CAST(N'2024-03-17' AS Date), 73, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (11, 2, CAST(N'2024-03-18' AS Date), 107, N'', N'CLOSE')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (12, 2, CAST(N'2024-03-18' AS Date), 60, N'', N'PENDING')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (13, 2, CAST(N'2024-03-18' AS Date), 138, N'', N'PENDING')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (14, 2, CAST(N'2024-03-18' AS Date), 198, N'', N'PENDING')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (15, 2, CAST(N'2024-03-18' AS Date), 60, N'', N'PENDING')
INSERT [dbo].[Order] ([Id], [UserId], [Order_date], [Total], [Note], [Status]) VALUES (16, 2, CAST(N'2024-03-18' AS Date), 438, N'', N'PENDING')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (39, 1, 32, 20, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (40, 2, 32, 20, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (41, 3, 32, 20, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (42, 4, 32, 20, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (43, 5, 32, 20, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (44, 6, 33, 15, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (45, 7, 32, 20, 5)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (46, 8, 34, 13, 4)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (47, 8, 32, 9, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (48, 8, 30, 12, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (49, 9, 34, 13, 4)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (50, 9, 32, 9, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (51, 9, 30, 12, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (52, 10, 34, 13, 4)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (53, 10, 32, 9, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (54, 10, 30, 12, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (55, 11, 74, 15, 2)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (56, 11, 33, 15, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (57, 11, 68, 54, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (58, 11, 72, 8, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (59, 12, 59, 60, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (60, 13, 73, 18, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (61, 13, 59, 60, 2)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (62, 14, 73, 18, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (63, 14, 59, 60, 3)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (64, 15, 59, 60, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (65, 16, 59, 60, 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (66, 16, 68, 54, 3)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (67, 16, 55, 54, 4)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (30, N'Oliver Cheshire is the new face of Marks & Spencer', 15.7, 94, N'https://i.pinimg.com/564x/33/0f/2c/330f2c43c10374210840ac458f389619.jpg', N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.', CAST(N'2023-06-07' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (31, N'Dark Blue', 10, 99, N'https://i.pinimg.com/564x/5e/fa/e4/5efae44c3acd8f926b48c1a0a36270fb.jpg', N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.', CAST(N'2023-06-07' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (32, N'Oxford Pant', 9, 84, N'https://i.pinimg.com/564x/0b/98/dc/0b98dc056f784c601f1093592b2f2ce9.jpg', N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.', CAST(N'2023-06-07' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (33, N'Rolex Datejust', 15, 98, N'https://i.pinimg.com/564x/18/4b/8e/184b8e2fd6fbd974e3c56f38a9663755.jpg', N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.', CAST(N'2023-06-07' AS Date), 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (34, N'Gold Luxury Rolex', 13, 187, N'https://i.pinimg.com/564x/37/bd/9f/37bd9f274847f4010155bd7f6b90f88c.jpg', N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.', CAST(N'2023-06-07' AS Date), 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (35, N'Everose Gold Rolex', 11, 100, N'https://i.pinimg.com/564x/23/dc/2b/23dc2b6209c850d23fe14c5c451d7330.jpg', N'Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.', CAST(N'2023-06-07' AS Date), 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (36, N'Columbia Flex ROC utility trousers in black', 65, 25, N'https://images.asos-media.com/products/columbia-flex-roc-utility-trousers-in-black/205057012-4?$n_320w$&wid=317&fit=constrain', N'Trousers & Chinos by Columbia', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (37, N'Napapijri Schiste cargo trousers in beige', 69, 15, N'https://images.asos-media.com/products/boss-orange-sisla5-cargo-trousers-in-khaki/205428925-1-opengreen?$n_240w$&wid=168&fit=constrain', N'Make your jeans jealous', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (38, N' BOSS Orange Sisla5 cargo trousers in khaki', 116, 100, N'https://images.asos-media.com/products/levis-lo-ball-cargo-in-khaki-with-pockets/205859807-1-olive?$n_320w$&wid=317&fit=constrain', N'Trousers & Chinos by BOSS Orange', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (40, N' Vans Knu Skool chunky trainers in black and white', 63, 16, N'https://images.asos-media.com/products/vans-knu-skool-chunky-trainers-in-black-and-white/205048649-1-black?$n_320w$&wid=317&fit=constrain', N'Signature waffle tread', CAST(N'2024-03-17' AS Date), 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (41, N' Vans Knu Stacked Platform sneakers in black', 76, 50, N'https://images.asos-media.com/products/vans-knu-stacked-platform-sneakers-in-black/205062974-1-black?$n_320w$&wid=317&fit=constrain', N'Your casualwear companions', CAST(N'2024-03-17' AS Date), 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (45, N'Reclaimed Vintage oversized logo t-shirt', 16, 30, N'https://images.asos-media.com/products/reclaimed-vintage-oversized-logo-t-shirt-in-washed-charcoal/205265975-1-charcoal?$n_320w$&wid=317&fit=constrain', N'T-Shirts & Vests by Reclaimed Vintage', CAST(N'2024-03-17' AS Date), 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (46, N'ASOS DESIGN oversized t-shirt', 21, 25, N'https://images.asos-media.com/products/asos-design-oversized-t-shirt-in-heavyweight-washed-black-with-symbol-spine-print/205693563-1-black?$n_320w$&wid=317&fit=constrain', N'T-Shirts & Vests by ASOS DESIGN', CAST(N'2024-03-17' AS Date), 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (47, N'ASOS DESIGN oversized t-shirt in white', 15, 20, N'https://images.asos-media.com/products/asos-design-oversized-t-shirt-in-white-with-text-back-print/206005632-1-white?$n_320w$&wid=317&fit=constrain', N'T-Shirts & Vests by ASOS DESIGN', CAST(N'2024-03-17' AS Date), 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (48, N'ASOS DESIGN oversized t-shirt in blue', 14, 10, N'https://images.asos-media.com/products/asos-design-oversized-t-shirt-in-blue-with-chest-print/205587508-1-blue?$n_320w$&wid=317&fit=constrain', N'T-Shirts & Vests by ASOS DESIGN', CAST(N'2024-03-17' AS Date), 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (49, N'Herschel Supply Co Seventeen weather', 33, 5, N'https://images.asos-media.com/products/herschel-supply-co-seventeen-weather-resistant-bum-bag-in-black/204760204-1-black?$n_320w$&wid=317&fit=constrain', N'Accessories by Herschel Supply Co', CAST(N'2024-03-17' AS Date), 6)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (50, N'adidas Originals adicolor', 23, 50, N'https://images.asos-media.com/products/adidas-originals-adicolor-mini-airliner-in-green/205232455-1-collegiategreen?$n_320w$&wid=317&fit=constrain', N'Accessories by adidas Originals', CAST(N'2024-03-17' AS Date), 6)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (51, N'Originals monogram mini crossbody bag', 17, 15, N'https://images.asos-media.com/products/adidas-originals-monogram-mini-crossbody-bag/205390704-1-earthstrata?$n_320w$&wid=317&fit=constrain', N'Accessories by adidas Originals', CAST(N'2024-03-17' AS Date), 6)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (52, N'Originals tote bag in black', 21, 30, N'https://images.asos-media.com/products/adidas-originals-tote-bag-in-black/205390710-1-black?$n_320w$&wid=317&fit=constrain', N'Accessories by adidas Originals', CAST(N'2024-03-17' AS Date), 6)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (53, N'Monki padded tote bag in red', 29, 10, N'https://images.asos-media.com/products/monki-padded-tote-bag-in-red/205801145-1-red?$n_320w$&wid=317&fit=constrain', N'Accessories by Monki', CAST(N'2024-03-17' AS Date), 6)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (54, N'NA-KD jersey bomber jacket in grey melange', 75, 10, N'https://images.asos-media.com/products/na-kd-jersey-bomber-jacket-in-grey-melange/206170610-1-greymelange?$n_320w$&wid=317&fit=constrain', N'Coats & Jackets by NA-KD', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (55, N'Weekday Destiny bomber jacket', 54, 26, N'https://images.asos-media.com/products/weekday-destiny-bomber-jacket-in-light-grey/204224945-1-grey?$n_320w$&wid=317&fit=constrain', N'Coats & Jackets by Weekday', CAST(N'2024-03-17' AS Date), 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (56, N'Unisex reversible ultimate oversized bomber jacke', 27, 40, N'https://images.asos-media.com/products/collusion-unisex-reversible-ultimate-oversized-bomber-jacket-in-black-grey-tonic/204953508-2?$n_320w$&wid=317&fit=constrain', N'Coats & Jackets by Collusion', CAST(N'2024-03-17' AS Date), 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (57, N' ASOS DESIGN diamond quilt gilet in black', 14, 34, N'https://images.asos-media.com/products/asos-design-diamond-quilt-gilet-in-black/204639903-1-black?$n_320w$&wid=317&fit=constrain', N'Coats & Jackets by ASOS DESIGN', CAST(N'2024-03-17' AS Date), 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (59, N'Vans Old Skool', 60, 26, N'https://images.asos-media.com/products/vans-old-skool-faux-leather-trainers-in-triple-white/204456624-2?$n_320w$&wid=317&fit=constrain', N'Shoes by Vans', CAST(N'2024-03-17' AS Date), 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (60, N'Salomon XT-Pathway', 67, 15, N'https://images.asos-media.com/products/salomon-xt-pathway-unisex-trainers-in-bleached-sand-hazelnut-and-white/204862226-1-beige?$n_320w$&wid=317&fit=constrain', N'Shoes by Vans', CAST(N'2024-03-17' AS Date), 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (61, N'Komono ray solid watch', 98, 5, N'https://images.asos-media.com/products/komono-ray-solid-watch-in-black/204101751-1-black?$n_320w$&wid=317&fit=constrain', N'Accessories by Komono', CAST(N'2024-03-17' AS Date), 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (62, N'Komono ray solid watch in silver', 52, 50, N'https://images.asos-media.com/products/komono-ray-solid-watch-in-silver/204101749-1-silver?$n_320w$&wid=317&fit=constrain', N'Accessories by Komono', CAST(N'2024-03-17' AS Date), 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (63, N'ASOS DESIGN jogger jeans', 27, 26, N'https://images.asos-media.com/products/asos-design-jogger-jeans-with-toggles-in-mid-wash-blue/205185104-1-midwashblue?$n_320w$&wid=317&fit=constrain', N'Jeans by ASOS DESIGN', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (64, N'Levi''s 502 tapered fit jeans', 90, 60, N'https://images.asos-media.com/products/levis-502-tapered-fit-jeans-in-dark-navy-wash/204694091-1-rainfallmens?$n_240w$&wid=168&fit=constrain', N'Jeans by Levi''s', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (65, N'Levi''s 502 tapered hi-ball jeans', 63, 42, N'https://images.asos-media.com/products/levis-502-tapered-hi-ball-jeans-in-black/204693818-1-styloadvt3?$n_320w$&wid=317&fit=constrain', N'Jeans by Levi''s', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (66, N'Levi''s 555 ''96 relaxed straight fit jeans', 51, 15, N'https://images.asos-media.com/products/levis-555-96-relaxed-straight-fit-jeans-in-black/205262234-1-black?$n_320w$&wid=317&fit=constrain', N'Jeans by Levi''s', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (67, N'Levi''s 502 tapered fit jeans', 52, 12, N'https://images.asos-media.com/products/levis-502-tapered-fit-jeans-in-light-grey-wash/204693920-1-vegoutadv?$n_320w$&wid=317&fit=constrain', N'Jeans by Levi''s', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (68, N'Vans Lowland trainers', 54, 13, N'https://images.asos-media.com/products/vans-lowland-trainers-in-white-with-burgundy-side-stripe/205049139-1-white?$n_320w$&wid=317&fit=constrain', N'Shoes, Boots & Trainers by Vans', CAST(N'2024-03-17' AS Date), 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (69, N'Levi''s piper trainer', 43, 32, N'https://images.asos-media.com/products/levis-piper-trainer-in-white-with-red-tab/204048463-1-regularwhite?$n_320w$&wid=317&fit=constrain', N'Shoes, Boots & Trainers by Levi''s', CAST(N'2024-03-17' AS Date), 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (70, N'Stradivarius Petite slim mom jean', 20, 12, N'https://images.asos-media.com/products/stradivarius-petite-slim-mom-jean-with-stretch-in-black/204672091-1-black?$n_320w$&wid=317&fit=constrain', N'Jeans by Stradivarius', CAST(N'2024-03-17' AS Date), 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (71, N'ASOS DESIGN Maternity ultimate t-shirt', 13, 30, N'https://images.asos-media.com/products/asos-design-maternity-ultimate-t-shirt-with-crew-neck-in-cotton-blend-2-pack-save/201328947-1-multi?$n_320w$&wid=317&fit=constrain', N'T-shirts by ASOS Maternity', CAST(N'2024-03-17' AS Date), 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (72, N'ASOS DESIGN ultimate t-shirt', 8, 18, N'https://images.asos-media.com/products/asos-design-ultimate-t-shirt-in-black-and-white-stripe/204898625-1-blackwhite?$n_320w$&wid=317&fit=constrain', N'Tops by ASOS DESIGN', CAST(N'2024-03-17' AS Date), 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (73, N'Monki oversize long sleeve', 18, 7, N'https://images.asos-media.com/products/monki-oversize-long-sleeve-top-in-mono-stripe/205258525-1-monostripe?$n_320w$&wid=317&fit=constrain', N'Tops by Monki', CAST(N'2024-03-17' AS Date), 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Stock], [Image], [Description], [Create_date], [category_id]) VALUES (74, N'Monki oversize long sleeve', 15, 13, N'https://images.asos-media.com/products/monki-oversize-long-sleeve-top-in-multi-colour-stripe/205729040-1-multistripe?$n_320w$&wid=317&fit=constrain', N'Tops by Monki', CAST(N'2024-03-17' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Balance], [Fullname], [Address], [Phone], [RoleId]) VALUES (2, N'abc', N'123', 99220, N'ABC', N'Ha Noi', N'0378387199 ', N'US')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Balance], [Fullname], [Address], [Phone], [RoleId]) VALUES (3, N'admin', N'123', NULL, N'Admin', N'Ho Chi Minh', N'0378387199 ', N'AD')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Balance], [Fullname], [Address], [Phone], [RoleId]) VALUES (4, N'student1', N'123', NULL, N'Minh Hoang', N'Ha Noi', N'123456789  ', N'US')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Balance], [Fullname], [Address], [Phone], [RoleId]) VALUES (5, N'student1', N'123', NULL, N'Minh Hoang', N'Ha Noi', N'123456789  ', N'US')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Balance], [Fullname], [Address], [Phone], [RoleId]) VALUES (6, N'test', N'123', NULL, N'Test', N'Ha Noi', N'0123456789 ', N'US')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Balance], [Fullname], [Address], [Phone], [RoleId]) VALUES (7, N'', N'', NULL, N'', N'', N'           ', N'US')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
