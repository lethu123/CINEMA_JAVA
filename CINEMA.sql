USE [CINEMA]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[username] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[avatar] [text] NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[phone] [varchar](13) NULL,
	[address] [nvarchar](255) NULL,
	[permission] [tinyint] NOT NULL CONSTRAINT [DF__ACCOUNT__permiss__117F9D94]  DEFAULT ((0)),
	[is_active] [bit] NOT NULL CONSTRAINT [DF__ACCOUNT__is_acti__1273C1CD]  DEFAULT ((1)),
	[token] [varchar](max) NULL,
	[create_at] [date] NOT NULL CONSTRAINT [DF__ACCOUNT__create___1367E606]  DEFAULT (getdate()),
	[update_at] [date] NULL,
	[discribe] [ntext] NULL,
 CONSTRAINT [PK__ACCOUNT__F3DBC5730E0DC413] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BOOKING]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOOKING](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [varchar](100) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[order_id] [int] NULL,
	[buyticket_id] [int] NOT NULL,
 CONSTRAINT [PK__BOOKING__3213E83F9303AB0E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUY_TICKET]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUY_TICKET](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NOT NULL,
	[typeticket_id] [int] NOT NULL,
 CONSTRAINT [PK_BUY_TICKET] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMBO]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMBO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[available] [bit] NOT NULL CONSTRAINT [DF__COMBO__available__31EC6D26]  DEFAULT ((1)),
 CONSTRAINT [PK__COMBO__3213E83F13AD3652] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMMENT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [date] NOT NULL CONSTRAINT [DF__COMMENT__create___1B0907CE]  DEFAULT (getdate()),
	[update_at] [date] NULL,
	[account_id] [varchar](100) NOT NULL,
	[film_id] [int] NOT NULL,
	[_content] [ntext] NOT NULL,
 CONSTRAINT [PK__COMMENT__3213E83FC5FD273A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILM]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_film] [tinyint] NOT NULL,
	[category] [tinyint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[actor] [nvarchar](255) NULL,
	[producer] [nvarchar](255) NULL,
	[director] [nvarchar](255) NULL,
	[duration] [int] NOT NULL,
	[describe] [ntext] NULL,
	[trailer] [ntext] NULL,
	[evaluate] [tinyint] NULL,
	[is_show] [bit] NULL CONSTRAINT [DF__FILM__is_show__173876EA]  DEFAULT ((1)),
	[release] [date] NOT NULL,
	[create_at] [date] NOT NULL CONSTRAINT [DF__FILM__create_at__182C9B23]  DEFAULT (getdate()),
	[update_at] [date] NULL,
	[image_film] [ntext] NOT NULL,
 CONSTRAINT [PK__FILM__3213E83FE882B9E9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LINE]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[room_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[combo_id] [int] NOT NULL,
	[amount_combo] [int] NOT NULL,
 CONSTRAINT [PK_ORDERS_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROOM]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[amount_line] [tinyint] NOT NULL,
	[amount_seat] [tinyint] NOT NULL,
	[is_full] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SEAT]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEAT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [bit] NOT NULL DEFAULT ((1)),
	[line_id] [int] NOT NULL,
	[name] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SHOWTIME]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOWTIME](
	[day_show] [date] NOT NULL,
	[hour_show] [time](7) NOT NULL,
	[film_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SHOWTIME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TICKET]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TICKET](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NOT NULL,
	[seat_id] [int] NOT NULL,
	[showtime_id] [int] NOT NULL,
 CONSTRAINT [PK__TICKET__3213E83FAFCE1EAA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TYPE_TICKET]    Script Date: 25/11/2019 8:35:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPE_TICKET](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[available] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ACCOUNT] ([username], [password], [email], [avatar], [fullname], [phone], [address], [permission], [is_active], [token], [create_at], [update_at], [discribe]) VALUES (N'admin', N'123', N'admin@gmail.com', N'cho.jpg', N'Lê Thị Thu 1234', N'0363000784', N'97 man thiện hiệp phú quận 9', 1, 1, NULL, CAST(N'2019-11-03' AS Date), CAST(N'2019-11-19' AS Date), N'thu admin')
INSERT [dbo].[ACCOUNT] ([username], [password], [email], [avatar], [fullname], [phone], [address], [permission], [is_active], [token], [create_at], [update_at], [discribe]) VALUES (N'admin1', N'thu123', N'admin2@gmail', NULL, N'thu', N'3245', NULL, 0, 0, NULL, CAST(N'2019-10-13' AS Date), NULL, N'tkjlrkjtdkj')
INSERT [dbo].[ACCOUNT] ([username], [password], [email], [avatar], [fullname], [phone], [address], [permission], [is_active], [token], [create_at], [update_at], [discribe]) VALUES (N'admin12', N'thu123', N'admin1@gmail.com', N'cho.jpg', N'Lê Thị Thu 122', N'0363000784', N'97 man thiện hiệp phú quận 9', 1, 1, NULL, CAST(N'2019-10-26' AS Date), NULL, N'sddf')
INSERT [dbo].[ACCOUNT] ([username], [password], [email], [avatar], [fullname], [phone], [address], [permission], [is_active], [token], [create_at], [update_at], [discribe]) VALUES (N'thuadmin', N'thu123', N'thuadmin123@gmail.com', N'', N'Lê Thị Thu 12', N'0363000784', N'97 Man Thiện, Hiệp Phú, Q9, TPHCM', 1, 1, NULL, CAST(N'2019-11-03' AS Date), NULL, N'try more')
INSERT [dbo].[ACCOUNT] ([username], [password], [email], [avatar], [fullname], [phone], [address], [permission], [is_active], [token], [create_at], [update_at], [discribe]) VALUES (N'thukara', N'123', N'thukara2016@gmail.com', NULL, N'le thi thu', NULL, NULL, 0, 1, NULL, CAST(N'2019-11-07' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[BOOKING] ON 

INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (22, N'admin', CAST(N'2019-11-06 13:51:11.297' AS DateTime), NULL, 26)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (23, N'admin', CAST(N'2019-11-06 00:51:30.220' AS DateTime), 22, 27)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (24, N'admin', CAST(N'2019-11-06 00:54:54.350' AS DateTime), NULL, 28)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (25, N'admin', CAST(N'2019-11-06 09:22:49.817' AS DateTime), 23, 29)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (26, N'admin', CAST(N'2019-11-06 09:28:19.823' AS DateTime), NULL, 30)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (27, N'admin', CAST(N'2019-11-06 09:31:22.387' AS DateTime), NULL, 31)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (28, N'admin', CAST(N'2019-11-06 09:34:15.203' AS DateTime), 24, 32)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (29, N'admin', CAST(N'2019-11-06 12:25:28.423' AS DateTime), NULL, 33)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (30, N'admin', CAST(N'2019-11-06 12:49:07.987' AS DateTime), NULL, 34)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (31, N'admin', CAST(N'2019-11-15 23:23:26.590' AS DateTime), 25, 35)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (32, N'admin', CAST(N'2019-11-15 23:29:46.233' AS DateTime), NULL, 36)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (33, N'admin', CAST(N'2019-11-16 20:59:39.367' AS DateTime), 26, 37)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (34, N'admin', CAST(N'2019-11-16 21:28:20.403' AS DateTime), 27, 38)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (35, N'admin', CAST(N'2019-11-16 21:29:13.317' AS DateTime), NULL, 39)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (36, N'admin', CAST(N'2019-11-16 21:29:51.510' AS DateTime), NULL, 40)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (37, N'admin', CAST(N'2019-11-16 21:40:25.293' AS DateTime), NULL, 41)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (38, N'admin', CAST(N'2019-11-16 22:03:02.483' AS DateTime), NULL, 42)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (39, N'admin', CAST(N'2019-11-16 22:03:27.613' AS DateTime), NULL, 44)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (40, N'admin', CAST(N'2019-11-16 22:03:27.610' AS DateTime), NULL, 43)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (41, N'admin', CAST(N'2019-11-16 22:06:20.997' AS DateTime), NULL, 45)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (42, N'admin', CAST(N'2019-11-16 22:07:11.093' AS DateTime), NULL, 46)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (43, N'admin', CAST(N'2019-11-16 22:08:22.607' AS DateTime), NULL, 47)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (44, N'admin', CAST(N'2019-11-16 22:21:29.477' AS DateTime), NULL, 48)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (45, N'admin', CAST(N'2019-11-16 23:42:10.010' AS DateTime), 28, 49)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (46, N'admin', CAST(N'2019-11-16 23:55:56.517' AS DateTime), NULL, 50)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (47, N'admin', CAST(N'2019-11-16 23:57:57.370' AS DateTime), NULL, 51)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (48, N'admin', CAST(N'2019-11-17 00:01:13.207' AS DateTime), NULL, 52)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (49, N'admin', CAST(N'2019-11-17 00:03:19.777' AS DateTime), 29, 53)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (50, N'admin', CAST(N'2019-11-17 00:04:49.750' AS DateTime), 30, 54)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (51, N'admin', CAST(N'2019-11-17 00:08:32.743' AS DateTime), NULL, 55)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (52, N'admin', CAST(N'2019-11-17 00:08:33.563' AS DateTime), NULL, 56)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (53, N'admin', CAST(N'2019-11-17 00:11:54.767' AS DateTime), 31, 57)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (54, N'admin', CAST(N'2019-11-17 00:11:55.243' AS DateTime), 32, 57)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (55, N'admin', CAST(N'2019-11-17 00:11:56.237' AS DateTime), 33, 58)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (56, N'admin', CAST(N'2019-11-17 00:11:56.870' AS DateTime), 34, 58)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (57, N'admin', CAST(N'2019-11-17 00:14:39.907' AS DateTime), 35, 59)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (58, N'admin', CAST(N'2019-11-17 00:14:40.933' AS DateTime), 36, 60)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (59, N'admin', CAST(N'2019-11-17 00:16:52.210' AS DateTime), 37, 61)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (60, N'admin', CAST(N'2019-11-17 00:16:52.887' AS DateTime), 38, 61)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (61, N'admin', CAST(N'2019-11-17 00:16:53.957' AS DateTime), 39, 62)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (62, N'admin', CAST(N'2019-11-17 00:16:54.683' AS DateTime), 40, 62)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (63, N'admin', CAST(N'2019-11-17 00:29:21.500' AS DateTime), 41, 63)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (64, N'admin', CAST(N'2019-11-17 00:29:22.237' AS DateTime), 42, 63)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (65, N'admin', CAST(N'2019-11-17 00:29:23.447' AS DateTime), 43, 64)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (66, N'admin', CAST(N'2019-11-17 00:29:24.180' AS DateTime), 44, 64)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (67, N'admin', CAST(N'2019-11-17 00:35:14.100' AS DateTime), 45, 65)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (68, N'admin', CAST(N'2019-11-17 00:35:14.850' AS DateTime), 46, 65)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (69, N'admin', CAST(N'2019-11-17 00:35:16.200' AS DateTime), 47, 66)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (70, N'admin', CAST(N'2019-11-17 00:35:17.027' AS DateTime), 48, 66)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (71, N'admin', CAST(N'2019-11-17 00:38:13.880' AS DateTime), 49, 67)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (72, N'admin', CAST(N'2019-11-17 00:38:40.067' AS DateTime), 50, 67)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (73, N'admin', CAST(N'2019-11-17 00:38:41.887' AS DateTime), 51, 68)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (74, N'admin', CAST(N'2019-11-17 00:38:43.230' AS DateTime), 52, 68)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (75, N'admin', CAST(N'2019-11-17 00:40:50.503' AS DateTime), 53, 69)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (76, N'admin', CAST(N'2019-11-17 00:40:51.650' AS DateTime), 54, 69)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (77, N'admin', CAST(N'2019-11-17 00:40:53.587' AS DateTime), 55, 70)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (78, N'admin', CAST(N'2019-11-17 00:40:55.107' AS DateTime), 56, 70)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (79, N'admin', CAST(N'2019-11-17 01:24:23.743' AS DateTime), 57, 71)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (80, N'admin', CAST(N'2019-11-17 01:24:25.190' AS DateTime), 58, 71)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (81, N'admin', CAST(N'2019-11-17 01:24:27.140' AS DateTime), 59, 72)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (82, N'admin', CAST(N'2019-11-17 01:24:28.297' AS DateTime), 60, 72)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (83, N'admin', CAST(N'2019-11-24 21:25:43.730' AS DateTime), 61, 73)
INSERT [dbo].[BOOKING] ([id], [account_id], [create_at], [order_id], [buyticket_id]) VALUES (84, N'admin', CAST(N'2019-11-24 21:28:08.290' AS DateTime), 62, 74)
SET IDENTITY_INSERT [dbo].[BOOKING] OFF
SET IDENTITY_INSERT [dbo].[BUY_TICKET] ON 

INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (24, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (25, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (26, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (27, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (28, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (29, 2, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (30, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (31, 1, 2)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (32, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (33, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (34, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (35, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (36, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (37, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (38, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (39, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (40, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (41, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (42, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (43, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (44, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (45, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (46, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (47, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (48, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (49, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (50, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (51, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (52, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (53, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (54, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (55, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (56, 1, 2)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (57, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (58, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (59, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (60, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (61, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (62, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (63, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (64, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (65, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (66, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (67, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (68, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (69, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (70, 1, 2)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (71, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (72, 1, 3)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (73, 1, 1)
INSERT [dbo].[BUY_TICKET] ([id], [amount], [typeticket_id]) VALUES (74, 1, 1)
SET IDENTITY_INSERT [dbo].[BUY_TICKET] OFF
SET IDENTITY_INSERT [dbo].[COMBO] ON 

INSERT [dbo].[COMBO] ([id], [name], [price], [available]) VALUES (4, N'Combo bắp nước', 80000.0000, 1)
INSERT [dbo].[COMBO] ([id], [name], [price], [available]) VALUES (5, N'Combo khoai lang lắc', 50000.0000, 1)
INSERT [dbo].[COMBO] ([id], [name], [price], [available]) VALUES (7, N'Combo gà chiên nước nắm', 20000.0000, 0)
SET IDENTITY_INSERT [dbo].[COMBO] OFF
SET IDENTITY_INSERT [dbo].[COMMENT] ON 

INSERT [dbo].[COMMENT] ([id], [create_at], [update_at], [account_id], [film_id], [_content]) VALUES (1, CAST(N'2019-10-13' AS Date), NULL, N'admin', 1, N'Phim hay quá')
SET IDENTITY_INSERT [dbo].[COMMENT] OFF
SET IDENTITY_INSERT [dbo].[FILM] ON 

INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (1, 1, 1, N'Cua lại vợ bầu 1', N'Trấn Thành, Ninh Dương Lan  Ngọc, Anh Tú', N'Nguyễn Trung', N'Thu Kara 1', 120, N'Cua lại vợ bầu mở đầu với nhiều kỷ lục ấn tượng như: Phim có doanh thu ngày đầu công chiếu cao nhất lịch sử phim Tết Việt, Phim có doanh thu dẫn đầu cao nhất Tết 2019. Mặc dù trước đó có nhiều ý kiến trái chiều về bộ phim như chưa đủ hài và không phù hợp với không khí Tết, nhưng ekip sản xuất và phát hành đặc biệt là Trấn Thành tin rằng “một bộ phim hay, cảm xúc sẽ dành được sự yêu mến và lựa chọn của khán giả”.', N'https://www.youtube.com/watch?v=l8vTMxuvz6Y', 4, 1, CAST(N'2010-03-20' AS Date), CAST(N'2019-10-02' AS Date), CAST(N'2019-11-24' AS Date), N'https://thegioidienanh.vn/stores/news_dataimages/hath/022019/09/00/0124_Cua_lai_vo_bau.jpg')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (2, 1, 1, N'Em chưa 18', N'Will, Kaity Nguyễn, Kiều Minh Tuấn', N'Charue Nguyễn', N'Thu Kara', 180, N'''Em chưa 18,'' bộ phim hài-lãng mạn được khán giả mong đợi sẽ thổi một luồng gió mới trong sáng, vui vẻ của cuộc đời học sinh vào giữa những bộ phim Việt Nam trầm lắng, u buồn ra rạp thời gian gần đây.', N'https://www.youtube.com/watch?v=LSjFMH1tsFc', 4, 1, CAST(N'2017-04-28' AS Date), CAST(N'2019-10-02' AS Date), NULL, N'https://media.urbanistnetwork.com/saigoneer/article-images/legacy/Z2py7fk.jpg')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (4, 2, 1, N'Hung thần đại dương', N'Baby Shark', N'Unknown', N'Thu Kara', 180, N'4 cô gái trẻ phiêu lưu đến một hòn đảo hoang vắng và khám phá được di tích của một thành phố cổ dưới lòng đại dương,tuy nhiên ác mộng xảy ra khi cổng thành sụp đổ, cả nhóm mắc kẹt trong mê cung khổng lồ và bị cá mập trắng tấn công.', N'https://www.youtube.com/watch?v=f7pjn48ysjk', 5, 1, CAST(N'2019-09-27' AS Date), CAST(N'2019-10-02' AS Date), NULL, N'http://thegioiblu-ray.com/resources/200ceb26807d6bf99fd6f4f0d1ca54d4/1%202D25G/B3174N.JPG')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (5, 2, 2, N'Black and White', N'Kenny Lin, Chun, Ning Chang, Chieh', N'Unknown', N'Thu Kara', 120, N'Anh Hùng Du Côn là phiên bản điện ảnh của bộ phim truyền hình đình đám nhất Đài Loan Black And White vào năm 2009 của đạo diễn Thái Nhạc Huân. Bộ phim đã đưa tên tuổi của Triệu Hựu Đình và Trần Y Hàm lên hàng "ngôi sao". Ngoài ra phim có sự tham gia của Châu Du Dân , một thành viên nhóm nhạc F4, là thần tượng của rất nhiều khán giả khu vực Châu Á. Hy vọng tiếp nối thành công đó đồng thời giải quyết các khúc mắc còn dang dở trong phiên bản truyền hình, đạo diễn Thái Nhạc Huân quyết định sẽ sản', N'https://www.youtube.com/watch?v=Lp9ppI4KJdY', 5, 1, CAST(N'2014-03-20' AS Date), CAST(N'2019-10-02' AS Date), NULL, N'https://kenh14cdn.com/Images/Uploaded/Share/2010/07/13/100713Cineangelababy009.jpg')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (13, 1, 1, N'Cô Thắm về làng', N'Tường Vi, Nhan Phúc Vinh, Sam Hà My, Jun Phạm, Puka, Long Đẹp Trai', N'Nguyễn Hoàng Anh', N'thu kara', 120, N'Tiếp nối thành công của 3 mùa trước, phim hài Tết ca nhạc "Cô Thắm về làng" phần 4 tiếp tục xoay quanh câu chuyện của hai chị em nhà Thắm - Đượm và Cần - Kiệm.

Không chỉ tái hiện không khí Tết cổ truyền quen thuộc như mọi năm, phần 4 của "Cô Thắm về làng" còn thu hút sự chú ý của người xem với nội dung ly kỳ: Vụ án nhầm con cùng những tình huống cười ra nước mắt của cặp đôi Tắm - Cần và Đượm - Kiệm', N'https://www.youtube.com/watch?v=GgGd1HO9XTQ', 4, 1, CAST(N'2019-10-23' AS Date), CAST(N'2019-10-28' AS Date), NULL, N'https://www.phimchon.net/img/co-tham-ve-lang-4-poster.jpg')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (14, 3, 1, N'Chú hề ma quái', N'Bill, Bev, Pennywise, Richie, Eddie, Mike, Stan', N'Andrés Muschietti', N'thu kara', 240, N'Phim kể về bảy đứa trẻ sống tại bang Maine và hành trình khám phá, tiêu diệt một thực thể ngoài hành tinh có nhiều khả năng đặc biệt là It (tên tiếng Việt: Nó) thường hay xuất hiện trong hình dạng gã hề Pennywise.

Tự đặt tên nhóm là "Hội kém cỏi", những đứa trẻ nhận ra rằng tất cả chúng đang bị đe dọa bởi cùng một thực thể. Chúng xác định rằng Pennywise biến hóa thành những gì chúng sợ, hắn thức dậy cứ sau 27 năm để làm hại trẻ em ở thị trấn Derry trước khi quay lại ngủ đông và di chuyển thông qua hệ thống cống ngầm, tất cả đường cống đều dẫn đến một cái giếng hiện đang ở dưới ngôi nhà bỏ hoang số 29 trên đường Neibolt. Sau một cuộc tấn công của Pennywise, cả nhóm mạo hiểm đến ngôi nhà hoang để đối đầu với hắn, từng đứa trẻ tách ra và bị hù dọa. Khi chúng tập hợp lại, Beverly đâm vào đầu Pennywise, buộc gã hề phải rút lui. Sau cuộc chạm trán, cả nhóm bắt đầu muốn bỏ cuộc, chỉ có Bill và Beverly kiên quyết đòi tiếp tục chiến đấu với gã hề.', N'https://www.youtube.com/watch?v=cTBTUwwRH0o', 5, 1, CAST(N'2019-10-22' AS Date), CAST(N'2019-10-28' AS Date), NULL, N'https://thegioidienanh.vn/stores/news_dataimages/hath/092018/09/17/5507_Ynh_1.jpg')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (15, 1, 2, N'Gạo nếp gạo tẻ', N'Thúy Ngân, Thu Phương, Hồng Vân , Trần Thùy Trang', N'Nguyễn Hoàng Anh', N'thu kara', 120, N'Gạo nếp gạo tẻ là bộ phim thuộc thể loại tâm lý tình cảm. Phim được sản xuất năm 2016 và chiếu trên HTV2 và Giải Trí TV - VTVcab1 trong năm 2018. Phim Việt hóa từ kịch bản nổi tiếng của Hàn Quốc là Phim Wang''s Family - tác phẩm truyền hình có đề tài gia đình ăn khách nhất Hàn Quốc năm 2013', N'https://www.youtube.com/watch?v=IhXsTu0aKBY', 4, 1, CAST(N'2019-11-20' AS Date), CAST(N'2019-11-03' AS Date), NULL, N'https://photo-3-baomoi.zadn.vn/w1000_r1/2018_12_17_125_29017022/a3b566123a53d30d8a42.jpg')
INSERT [dbo].[FILM] ([id], [type_film], [category], [name], [actor], [producer], [director], [duration], [describe], [trailer], [evaluate], [is_show], [release], [create_at], [update_at], [image_film]) VALUES (16, 1, 1, N'Ông ngoại tuổi 30', N'Trịnh Thăng Bình, Lê Thị Thu', N'Nguyễn Hoàng Anh', N'thu kara', 180, N'Ông ngoại tuổi 30 là một bộ phim của Hàn Quốc sản xuất năm 2008 được viết kịch bản và đạo diễn bởi Kang Hyeong-cheol. Bộ phim có sự góp mặt của nam diễn viên nổi tiếng Cha Tae-hyun vào vai nhân vật chính. Đây là phim có doanh thu cao nhất tại Hàn Quốc năm 2008', N'https://www.youtube.com/watch?v=PjuVaTcZuoo', 4, 1, CAST(N'2008-12-03' AS Date), CAST(N'2019-11-04' AS Date), NULL, N'https://cdn.vietnammoi.vn/stores/news_dataimages/hoailt/042018/03/20/4047_maxresdefault.jpg')
SET IDENTITY_INSERT [dbo].[FILM] OFF
SET IDENTITY_INSERT [dbo].[LINE] ON 

INSERT [dbo].[LINE] ([id], [name], [room_id]) VALUES (1, N'A', 1)
INSERT [dbo].[LINE] ([id], [name], [room_id]) VALUES (2, N'B', 1)
INSERT [dbo].[LINE] ([id], [name], [room_id]) VALUES (3, N'C', 1)
INSERT [dbo].[LINE] ([id], [name], [room_id]) VALUES (4, N'D', 1)
INSERT [dbo].[LINE] ([id], [name], [room_id]) VALUES (5, N'E', 1)
SET IDENTITY_INSERT [dbo].[LINE] OFF
SET IDENTITY_INSERT [dbo].[ORDERS] ON 

INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (22, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (23, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (24, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (25, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (26, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (27, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (28, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (29, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (30, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (31, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (32, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (33, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (34, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (35, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (36, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (37, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (38, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (39, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (40, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (41, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (42, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (43, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (44, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (45, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (46, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (47, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (48, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (49, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (50, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (51, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (52, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (53, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (54, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (55, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (56, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (57, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (58, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (59, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (60, 5, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (61, 4, 1)
INSERT [dbo].[ORDERS] ([id], [combo_id], [amount_combo]) VALUES (62, 4, 1)
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
SET IDENTITY_INSERT [dbo].[ROOM] ON 

INSERT [dbo].[ROOM] ([id], [name], [amount_line], [amount_seat], [is_full]) VALUES (1, N'Phòng 1', 6, 16, 0)
INSERT [dbo].[ROOM] ([id], [name], [amount_line], [amount_seat], [is_full]) VALUES (2, N'Phòng 2', 5, 25, 0)
SET IDENTITY_INSERT [dbo].[ROOM] OFF
SET IDENTITY_INSERT [dbo].[SEAT] ON 

INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (1, 1, 1, N'1')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (2, 1, 1, N'2')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (3, 1, 1, N'3')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (4, 1, 1, N'4')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (5, 1, 1, N'5')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (6, 1, 1, N'6')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (7, 1, 1, N'7')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (8, 1, 1, N'8')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (9, 1, 1, N'9')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (10, 1, 1, N'10')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (11, 1, 2, N'1')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (12, 1, 2, N'2')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (14, 1, 2, N'3')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (15, 1, 2, N'4')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (16, 1, 2, N'5')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (17, 1, 2, N'6')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (18, 1, 2, N'7')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (19, 1, 2, N'8')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (20, 1, 2, N'9')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (21, 1, 3, N'1')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (22, 1, 3, N'2')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (23, 1, 3, N'3')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (24, 1, 3, N'4')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (25, 1, 3, N'5')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (26, 1, 3, N'6')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (27, 1, 3, N'7')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (28, 1, 3, N'8')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (29, 1, 3, N'9')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (30, 1, 3, N'10')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (31, 1, 4, N'1')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (32, 1, 4, N'2')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (33, 1, 4, N'3')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (34, 1, 4, N'4')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (35, 1, 4, N'5')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (36, 1, 4, N'6')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (37, 1, 4, N'7')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (38, 1, 4, N'8')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (39, 1, 4, N'9')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (40, 1, 4, N'10')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (41, 1, 5, N'1')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (42, 1, 5, N'2')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (43, 1, 5, N'3')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (44, 1, 5, N'4')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (45, 1, 5, N'5')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (46, 1, 5, N'6')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (47, 1, 5, N'7')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (48, 1, 5, N'8')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (49, 1, 5, N'9')
INSERT [dbo].[SEAT] ([id], [status], [line_id], [name]) VALUES (50, 1, 5, N'10')
SET IDENTITY_INSERT [dbo].[SEAT] OFF
SET IDENTITY_INSERT [dbo].[SHOWTIME] ON 

INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-05-12' AS Date), CAST(N'13:30:00' AS Time), 1, 1, 1)
INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-05-12' AS Date), CAST(N'13:30:00' AS Time), 1, 2, 2)
INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-05-12' AS Date), CAST(N'14:00:00' AS Time), 2, 1, 3)
INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-05-12' AS Date), CAST(N'16:20:00' AS Time), 4, 1, 4)
INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-11-20' AS Date), CAST(N'15:00:00' AS Time), 4, 1, 5)
INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-05-12' AS Date), CAST(N'18:30:00' AS Time), 4, 1, 6)
INSERT [dbo].[SHOWTIME] ([day_show], [hour_show], [film_id], [room_id], [id]) VALUES (CAST(N'2019-05-12' AS Date), CAST(N'20:10:00' AS Time), 1, 1, 7)
SET IDENTITY_INSERT [dbo].[SHOWTIME] OFF
SET IDENTITY_INSERT [dbo].[TICKET] ON 

INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (26, 22, 24, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (27, 23, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (28, 24, 47, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (29, 25, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (30, 25, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (31, 26, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (32, 27, 16, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (33, 28, 37, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (34, 29, 24, 3)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (35, 30, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (36, 31, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (37, 32, 16, 3)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (38, 33, 35, 3)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (39, 34, 46, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (40, 35, 45, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (41, 36, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (42, 37, 34, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (43, 38, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (44, 40, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (45, 39, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (46, 41, 36, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (47, 42, 36, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (48, 43, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (49, 44, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (50, 45, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (51, 46, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (52, 47, 46, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (53, 48, 45, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (54, 49, 37, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (55, 50, 47, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (56, 51, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (57, 51, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (58, 52, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (59, 52, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (60, 53, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (61, 53, 17, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (62, 54, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (63, 54, 17, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (64, 55, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (65, 55, 17, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (66, 56, 35, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (67, 56, 17, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (68, 57, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (69, 57, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (70, 58, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (71, 58, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (72, 59, 36, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (73, 59, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (74, 60, 36, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (75, 60, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (76, 61, 36, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (77, 61, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (78, 62, 36, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (79, 62, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (80, 63, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (81, 63, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (82, 64, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (83, 64, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (84, 65, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (85, 65, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (86, 66, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (87, 66, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (88, 67, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (89, 67, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (90, 68, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (91, 68, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (92, 69, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (93, 69, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (94, 70, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (95, 70, 27, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (96, 71, 34, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (97, 71, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (98, 72, 34, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (99, 72, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (100, 73, 34, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (101, 73, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (102, 74, 34, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (103, 74, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (104, 75, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (105, 75, 24, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (106, 76, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (107, 76, 24, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (108, 77, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (109, 77, 24, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (110, 78, 25, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (111, 78, 24, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (112, 79, 23, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (113, 79, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (114, 80, 23, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (115, 80, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (116, 81, 23, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (117, 81, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (118, 82, 23, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (119, 82, 44, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (120, 83, 26, 1)
INSERT [dbo].[TICKET] ([id], [booking_id], [seat_id], [showtime_id]) VALUES (121, 84, 24, 1)
SET IDENTITY_INSERT [dbo].[TICKET] OFF
SET IDENTITY_INSERT [dbo].[TYPE_TICKET] ON 

INSERT [dbo].[TYPE_TICKET] ([id], [name], [price], [available]) VALUES (1, N'Vé người lớn', 75000.0000, 1)
INSERT [dbo].[TYPE_TICKET] ([id], [name], [price], [available]) VALUES (2, N'Vé trẻ em', 45000.0000, 1)
INSERT [dbo].[TYPE_TICKET] ([id], [name], [price], [available]) VALUES (3, N'Vé sinh viên', 50000.0000, 0)
INSERT [dbo].[TYPE_TICKET] ([id], [name], [price], [available]) VALUES (4, N'vé học sinh', 25000.0000, 1)
SET IDENTITY_INSERT [dbo].[TYPE_TICKET] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_email]    Script Date: 25/11/2019 8:35:16 CH ******/
ALTER TABLE [dbo].[ACCOUNT] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_combo]    Script Date: 25/11/2019 8:35:16 CH ******/
ALTER TABLE [dbo].[COMBO] ADD  CONSTRAINT [UK_combo] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_name_film]    Script Date: 25/11/2019 8:35:16 CH ******/
ALTER TABLE [dbo].[FILM] ADD  CONSTRAINT [UK_name_film] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_line]    Script Date: 25/11/2019 8:35:16 CH ******/
ALTER TABLE [dbo].[LINE] ADD  CONSTRAINT [UK_line] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_room]    Script Date: 25/11/2019 8:35:16 CH ******/
ALTER TABLE [dbo].[ROOM] ADD  CONSTRAINT [UK_room] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_ticket]    Script Date: 25/11/2019 8:35:16 CH ******/
ALTER TABLE [dbo].[TYPE_TICKET] ADD  CONSTRAINT [UK_ticket] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD  CONSTRAINT [FK_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[ACCOUNT] ([username])
GO
ALTER TABLE [dbo].[BOOKING] CHECK CONSTRAINT [FK_account]
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD  CONSTRAINT [FK_BOOKING_BUY_TICKET] FOREIGN KEY([buyticket_id])
REFERENCES [dbo].[BUY_TICKET] ([id])
GO
ALTER TABLE [dbo].[BOOKING] CHECK CONSTRAINT [FK_BOOKING_BUY_TICKET]
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD  CONSTRAINT [FK_BOOKING_ORDERS] FOREIGN KEY([order_id])
REFERENCES [dbo].[ORDERS] ([id])
GO
ALTER TABLE [dbo].[BOOKING] CHECK CONSTRAINT [FK_BOOKING_ORDERS]
GO
ALTER TABLE [dbo].[BUY_TICKET]  WITH CHECK ADD  CONSTRAINT [FK_BUY_TICKET_TYPE_TICKET] FOREIGN KEY([typeticket_id])
REFERENCES [dbo].[TYPE_TICKET] ([id])
GO
ALTER TABLE [dbo].[BUY_TICKET] CHECK CONSTRAINT [FK_BUY_TICKET_TYPE_TICKET]
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_ACCOUNT] FOREIGN KEY([account_id])
REFERENCES [dbo].[ACCOUNT] ([username])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_ACCOUNT]
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_FILM] FOREIGN KEY([film_id])
REFERENCES [dbo].[FILM] ([id])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_FILM]
GO
ALTER TABLE [dbo].[LINE]  WITH CHECK ADD  CONSTRAINT [FK_room2] FOREIGN KEY([room_id])
REFERENCES [dbo].[ROOM] ([id])
GO
ALTER TABLE [dbo].[LINE] CHECK CONSTRAINT [FK_room2]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_COMBO] FOREIGN KEY([combo_id])
REFERENCES [dbo].[COMBO] ([id])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_COMBO]
GO
ALTER TABLE [dbo].[SEAT]  WITH CHECK ADD  CONSTRAINT [FK_line] FOREIGN KEY([line_id])
REFERENCES [dbo].[LINE] ([id])
GO
ALTER TABLE [dbo].[SEAT] CHECK CONSTRAINT [FK_line]
GO
ALTER TABLE [dbo].[SHOWTIME]  WITH CHECK ADD  CONSTRAINT [FK_SHOWTIME_FILM] FOREIGN KEY([film_id])
REFERENCES [dbo].[FILM] ([id])
GO
ALTER TABLE [dbo].[SHOWTIME] CHECK CONSTRAINT [FK_SHOWTIME_FILM]
GO
ALTER TABLE [dbo].[SHOWTIME]  WITH CHECK ADD  CONSTRAINT [FK_SHOWTIME_ROOM] FOREIGN KEY([room_id])
REFERENCES [dbo].[ROOM] ([id])
GO
ALTER TABLE [dbo].[SHOWTIME] CHECK CONSTRAINT [FK_SHOWTIME_ROOM]
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD  CONSTRAINT [fK_account2] FOREIGN KEY([seat_id])
REFERENCES [dbo].[SEAT] ([id])
GO
ALTER TABLE [dbo].[TICKET] CHECK CONSTRAINT [fK_account2]
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_BOOKING] FOREIGN KEY([booking_id])
REFERENCES [dbo].[BOOKING] ([id])
GO
ALTER TABLE [dbo].[TICKET] CHECK CONSTRAINT [FK_TICKET_BOOKING]
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_SHOWTIME] FOREIGN KEY([showtime_id])
REFERENCES [dbo].[SHOWTIME] ([id])
GO
ALTER TABLE [dbo].[TICKET] CHECK CONSTRAINT [FK_TICKET_SHOWTIME]
GO
ALTER TABLE [dbo].[COMBO]  WITH CHECK ADD  CONSTRAINT [C_price2] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[COMBO] CHECK CONSTRAINT [C_price2]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [C_amount_combo1] CHECK  (([amount_combo]>(0)))
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [C_amount_combo1]
GO
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD  CONSTRAINT [C_line] CHECK  (([amount_line]>(0)))
GO
ALTER TABLE [dbo].[ROOM] CHECK CONSTRAINT [C_line]
GO
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD  CONSTRAINT [C_seat] CHECK  (([amount_seat]>(0)))
GO
ALTER TABLE [dbo].[ROOM] CHECK CONSTRAINT [C_seat]
GO
ALTER TABLE [dbo].[TYPE_TICKET]  WITH CHECK ADD  CONSTRAINT [C_price1] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[TYPE_TICKET] CHECK CONSTRAINT [C_price1]
GO
