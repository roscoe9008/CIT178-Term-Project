USE [ScentsyDB]
GO
INSERT [dbo].[Zipcode] ([Zipcode], [City], [State]) VALUES (N'19038', N'Flourtown', N'PA')
INSERT [dbo].[Zipcode] ([Zipcode], [City], [State]) VALUES (N'30101', N'Cartersville', N'GA')
INSERT [dbo].[Zipcode] ([Zipcode], [City], [State]) VALUES (N'30120', N'Euharlee', N'GA')
INSERT [dbo].[Zipcode] ([Zipcode], [City], [State]) VALUES (N'52722', N'Bettendorf', N'IA')
INSERT [dbo].[Zipcode] ([Zipcode], [City], [State]) VALUES (N'61821', N'Champaign', N'IL')
INSERT [dbo].[Zipcode] ([Zipcode], [City], [State]) VALUES (N'76110', N'Fort Worth', N'TX')
GO
INSERT [dbo].[Customers] ([CustID], [Name], [Address], [ZipCode], [Email], [Cell#]) VALUES (1, N'Jumbalia Craw', N'3519 townline rd', N'30120', N'jcraw@gmail.com', N'(231)-4859999')
INSERT [dbo].[Customers] ([CustID], [Name], [Address], [ZipCode], [Email], [Cell#]) VALUES (2, N'Britney Smith', N'5 One point rd', N'30101', N'Bsmith@hotmail.com', N'231-485-0111')
INSERT [dbo].[Customers] ([CustID], [Name], [Address], [ZipCode], [Email], [Cell#]) VALUES (3, N'Ivy Rose', N'6816 jump st', N'19038', N'IvyR@yamil.com', N'231-485-9777')
INSERT [dbo].[Customers] ([CustID], [Name], [Address], [ZipCode], [Email], [Cell#]) VALUES (4, N'Sasha Broadway', N'82 blue st', N'76110', N'BroadwaySa@outlook.com', N'231-485-1966')
INSERT [dbo].[Customers] ([CustID], [Name], [Address], [ZipCode], [Email], [Cell#]) VALUES (5, N'Hana Over', N'1900 green st', N'61821', N'HanOver@me.com', N'231-485-2955')
INSERT [dbo].[Customers] ([CustID], [Name], [Address], [ZipCode], [Email], [Cell#]) VALUES (6, N'Beau Down', N'413 Ocenside Ave', N'52722', N'Beaudown@tome.com', N'231-485-3944')
GO
INSERT [dbo].[Inventory] ([InventoryID], [ProdName], [Category], [MyCost], [CustPrice]) VALUES (1, N'Nova Warmer
', N'Warmer
', 29.2500, 45.0000)
INSERT [dbo].[Inventory] ([InventoryID], [ProdName], [Category], [MyCost], [CustPrice]) VALUES (2, N'Watermelon tangerine body soak
', N'Self Care
', 6.5000, 10.0000)
INSERT [dbo].[Inventory] ([InventoryID], [ProdName], [Category], [MyCost], [CustPrice]) VALUES (3, N'Scent of the month wax bar
', N'Wax
', 3.5100, 5.4000)
INSERT [dbo].[Inventory] ([InventoryID], [ProdName], [Category], [MyCost], [CustPrice]) VALUES (4, N'Little garden warmer', N'Warmer
', 26.0000, 40.0000)
INSERT [dbo].[Inventory] ([InventoryID], [ProdName], [Category], [MyCost], [CustPrice]) VALUES (5, N'Rustic Ranch Warmer
', N'Warmer
', 22.7500, 35.0000)
INSERT [dbo].[Inventory] ([InventoryID], [ProdName], [Category], [MyCost], [CustPrice]) VALUES (6, N'Angel Wings
', N'Warmer
', 22.7500, 35.0000)
GO
INSERT [dbo].[Location] ([Name], [LocationID]) VALUES (N'Facebook', N'1')
INSERT [dbo].[Location] ([Name], [LocationID]) VALUES (N'Website
', N'2')
INSERT [dbo].[Location] ([Name], [LocationID]) VALUES (N'Instagram
', N'3')
INSERT [dbo].[Location] ([Name], [LocationID]) VALUES (N'Fine Arts Shows
', N'4')
INSERT [dbo].[Location] ([Name], [LocationID]) VALUES (N'Craftshows
', N'5')
INSERT [dbo].[Location] ([Name], [LocationID]) VALUES (N'Etsy
', N'6')
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (1, CAST(N'2020-05-07' AS Date), N'3', 6)
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (2, CAST(N'2020-05-06' AS Date), N'2', 4)
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (3, CAST(N'2021-02-01' AS Date), N'4', 3)
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (4, CAST(N'2021-01-15' AS Date), N'1', 6)
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (5, CAST(N'2020-07-19' AS Date), N'5', 5)
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (6, CAST(N'2020-10-06' AS Date), N'6', 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [LocationID], [CustomerID]) VALUES (7, CAST(N'2020-06-02' AS Date), N'6', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (1, 1, 1, 8)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (2, 1, 2, 4)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (3, 2, 5, 6)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (4, 2, 4, 7)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (5, 3, 5, 7)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (6, 3, 4, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (7, 4, 1, 11)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (8, 5, 2, 23)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (9, 5, 3, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [InventoryID], [QTY]) VALUES (10, 5, 4, 7)
GO
