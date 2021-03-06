
GO
/****** Object:  Table [dbo].[Expedicao]    Script Date: 11/04/2017 15:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expedicao](
	[idExpedicao] [int] NOT NULL,
	[Navio] [int] NULL,
	[Vilarejo] [int] NULL,
	[DtSaque] [datetime] NULL,
	[ValorSaque] [money] NULL,
 CONSTRAINT [PK_Expedicao] PRIMARY KEY CLUSTERED 
(
	[idExpedicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Navio]    Script Date: 11/04/2017 15:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Navio](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NULL,
	[qtdVelas] [int] NULL,
	[anoFabricacao] [int] NULL,
	[Cancao] [text] NULL,
 CONSTRAINT [PK_Navio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pirata]    Script Date: 11/04/2017 15:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pirata](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NULL,
	[dtNasc] [date] NULL,
	[vilarejo] [int] NULL,
	[descritivo] [varchar](50) NULL,
	[navio] [int] NULL,
 CONSTRAINT [PK_Pirata] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vilarejo]    Script Date: 11/04/2017 15:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vilarejo](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[qtdHabitantes] [int] NULL,
 CONSTRAINT [PK_Vilarejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Expedicao]  WITH CHECK ADD  CONSTRAINT [FK_Expedicao_Navio] FOREIGN KEY([Navio])
REFERENCES [dbo].[Navio] ([id])
GO
ALTER TABLE [dbo].[Expedicao] CHECK CONSTRAINT [FK_Expedicao_Navio]
GO
ALTER TABLE [dbo].[Expedicao]  WITH CHECK ADD  CONSTRAINT [FK_Expedicao_Vilarejo] FOREIGN KEY([Vilarejo])
REFERENCES [dbo].[Vilarejo] ([id])
GO
ALTER TABLE [dbo].[Expedicao] CHECK CONSTRAINT [FK_Expedicao_Vilarejo]
GO
ALTER TABLE [dbo].[Pirata]  WITH CHECK ADD  CONSTRAINT [FK_Pirata_Navio] FOREIGN KEY([navio])
REFERENCES [dbo].[Navio] ([id])
GO
ALTER TABLE [dbo].[Pirata] CHECK CONSTRAINT [FK_Pirata_Navio]
GO
ALTER TABLE [dbo].[Pirata]  WITH CHECK ADD  CONSTRAINT [FK_Pirata_Vilarejo] FOREIGN KEY([vilarejo])
REFERENCES [dbo].[Vilarejo] ([id])
GO
ALTER TABLE [dbo].[Pirata] CHECK CONSTRAINT [FK_Pirata_Vilarejo]
GO
