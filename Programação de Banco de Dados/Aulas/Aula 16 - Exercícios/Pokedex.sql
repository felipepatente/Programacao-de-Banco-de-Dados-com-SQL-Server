USE [Pokedex]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 01/06/2017 18:12:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[codCategoria] [smallint] IDENTITY(1,1) NOT NULL,
	[nmCategoria] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[codCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fraqueza]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fraqueza](
	[codPokemon] [smallint] NOT NULL,
	[CodTipo] [tinyint] NOT NULL,
 CONSTRAINT [PK_Fraqueza] PRIMARY KEY CLUSTERED 
(
	[CodTipo] ASC,
	[codPokemon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Habilidade]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidade](
	[codHabilidade] [smallint] IDENTITY(1,1) NOT NULL,
	[nmHabilidade] [varchar](50) NOT NULL,
	[descricao] [varchar](250) NULL,
 CONSTRAINT [PK_Habilidade] PRIMARY KEY CLUSTERED 
(
	[codHabilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HabilidadePokemon]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadePokemon](
	[codHabilidade] [smallint] NOT NULL,
	[codPokemon] [smallint] NOT NULL,
 CONSTRAINT [PK_HabilidadePokemon] PRIMARY KEY CLUSTERED 
(
	[codHabilidade] ASC,
	[codPokemon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pokemon]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokemon](
	[codPokemon] [smallint] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[descricao] [varchar](400) NOT NULL,
	[altura] [decimal](6, 2) NOT NULL,
	[peso] [decimal](6, 2) NOT NULL,
	[sexo] [tinyint] NOT NULL,
	[codCategoria] [smallint] NOT NULL,
	[evoluiDe] [smallint] NULL,
 CONSTRAINT [PK_Pokemon] PRIMARY KEY CLUSTERED 
(
	[codPokemon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[sexo] [tinyint] NOT NULL,
	[tipoSexo] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[codTipo] [tinyint] IDENTITY(1,1) NOT NULL,
	[nmTipo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[codTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoPokemon]    Script Date: 01/06/2017 18:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPokemon](
	[codPokemon] [smallint] NOT NULL,
	[codTipo] [tinyint] NOT NULL,
 CONSTRAINT [PK_tipoPokemon] PRIMARY KEY CLUSTERED 
(
	[codTipo] ASC,
	[codPokemon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (844, N'Psi')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (845, N'Superpower')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (846, N'Flower')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (847, N'Flycatcher')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (848, N'Jellyfish')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (849, N'Rock')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (850, N'Megaton')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (851, N'Fire Horse')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (852, N'Dopey')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (853, N'Hermit Crab')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (854, N'Magnet')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (855, N'Wild Duck')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (856, N'Twin Bird')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (857, N'Triple Bird')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (858, N'Sea Lion')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (859, N'Sludge')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (860, N'Flame')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (861, N'Tiny Turtle')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (862, N'Turtle')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (863, N'Shellfish')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (864, N'Worm')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (865, N'Cocoon')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (866, N'Buttlerfly')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (867, N'Hairy Bug')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (868, N'Posion Bee')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (869, N'Tiny Bird')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (870, N'Bird')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (871, N'Mouse')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (872, N'Beak')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (873, N'Snake')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (874, N'Cobra')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (875, N'Star Shape')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (876, N'Mysterious')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (877, N'Barrier')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (878, N'Mantis')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (879, N'Human Shape')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (880, N'Electric')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (881, N'Spitfire')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (882, N'Stag Beetle')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (883, N'Wild Bull')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (884, N'Fish')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (885, N'Atrocius')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (886, N'Transport')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (887, N'Transform')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (888, N'Evolution')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (889, N'Bubble Jet')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (890, N'Lightning')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (891, N'Virtual')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (892, N'Spiral')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (893, N'Fossil')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (894, N'Sleeping')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (895, N'Freeze')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (896, N'Dragon')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (897, N'Genetic')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (898, N'New Species')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (899, N'Poinson Pin')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (900, N'Drill')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (901, N'Poison Pin')
INSERT [dbo].[Categoria] ([codCategoria], [nmCategoria]) VALUES (902, N'Fairy')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (141, 211)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (9, 212)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (134, 212)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (141, 212)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (24, 213)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (32, 213)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (33, 213)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (130, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (136, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (141, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (144, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (145, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (146, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (149, 214)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (144, 215)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (146, 215)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (18, 216)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (19, 216)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (20, 216)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (21, 216)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (22, 216)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (136, 217)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (144, 217)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (146, 217)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (9, 218)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (130, 218)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (134, 218)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (136, 218)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (141, 218)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (146, 218)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (21, 219)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (22, 219)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (130, 219)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (134, 219)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (141, 219)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (145, 219)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (150, 220)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (18, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (21, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (22, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (130, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (145, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (146, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (149, 222)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (145, 224)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (148, 224)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (149, 224)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (32, 225)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (33, 225)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (136, 225)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (141, 225)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (148, 228)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (149, 228)
INSERT [dbo].[Fraqueza] ([codPokemon], [CodTipo]) VALUES (149, 229)
SET IDENTITY_INSERT [dbo].[Habilidade] ON 

INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (787, N'Inner Focus', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (788, N'Guts', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (789, N'No Guard', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (790, N'Clorophyll', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (791, N'Clear Body', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (792, N'Liquid Ooze', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (793, N'Rock Head', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (794, N'Sturdy', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (795, N'Run Away', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (796, N'Flash Fire', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (797, N'Oblivious', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (798, N'Own Tempo', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (799, N'Magnet Pull', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (800, N'Keen Eye', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (801, N'Early Bird', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (802, N'Thick Fat', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (803, N'Hydration', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (804, N'Stench', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (805, N'Sticky Hold', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (806, N'Blaze', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (807, N'Torrent', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (808, N'Shield Dust', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (809, N'Shed Skin', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (810, N'Compound Eyes', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (811, N'Swarm', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (812, N'Tangled feet', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (813, N'Intimidate', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (814, N'Nature Cure', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (815, N'Iluminate', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (816, N'Soundproof', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (817, N'Technician', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (818, N'Forewarn', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (819, N'Static', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (820, N'Flame Body', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (821, N'Hyper Cutter', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (822, N'Anger Point', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (823, N'Swift Swim', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (824, N'Water absorb', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (825, N'Limber', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (826, N'Adaptability', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (827, N'Volt Absorb', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (828, N'Trace', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (829, N'Shell Armor', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (830, N'Swift Swin', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (831, N'Battle Armor', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (832, N'Pressure', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (833, N'Immunity', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (834, N'Synchronize', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (835, N'Poison Point', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (836, N' Rivalry', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (837, N'Cute Charm', NULL)
INSERT [dbo].[Habilidade] ([codHabilidade], [nmHabilidade], [descricao]) VALUES (838, N' Magic Guard', NULL)
SET IDENTITY_INSERT [dbo].[Habilidade] OFF
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (787, 149)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (788, 19)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (788, 20)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (788, 67)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (788, 68)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (789, 68)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (790, 70)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (790, 71)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (791, 73)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (793, 75)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (793, 76)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (794, 76)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (794, 81)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (794, 82)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (795, 19)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (795, 20)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (795, 78)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (795, 84)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (795, 85)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (795, 133)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (796, 136)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (797, 80)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (797, 124)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (799, 82)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (800, 16)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (800, 17)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (800, 18)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (800, 21)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (800, 22)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (801, 85)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (802, 87)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (802, 143)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (804, 89)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (806, 6)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (807, 8)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (807, 9)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (808, 13)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (809, 14)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (809, 23)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (809, 24)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (809, 147)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (809, 148)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (811, 123)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (812, 17)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (812, 18)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (813, 24)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (813, 128)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (813, 130)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (814, 121)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (823, 140)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (823, 141)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (824, 134)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (829, 139)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (831, 141)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (832, 144)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (832, 145)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (832, 146)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (832, 150)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (835, 31)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (835, 32)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (835, 33)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (835, 34)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (836, 32)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (836, 33)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (836, 34)
INSERT [dbo].[HabilidadePokemon] ([codHabilidade], [codPokemon]) VALUES (837, 36)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (5, N'Charmeleon', N'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.', CAST(1.10 AS Decimal(6, 2)), CAST(19.00 AS Decimal(6, 2)), 4, 860, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (6, N'Charizard', N'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.', CAST(1.70 AS Decimal(6, 2)), CAST(90.50 AS Decimal(6, 2)), 4, 860, 5)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (7, N'Squirtle', N'Squirtle''s shell is not merely used for protection. The shell''s rounded shape and the grooves on its surface help minimize resistance in water, enabling this PokÃ©mon to swim at high speeds.', CAST(0.50 AS Decimal(6, 2)), CAST(9.00 AS Decimal(6, 2)), 4, 861, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (8, N'Wartortle', N'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this PokÃ©mon''s toughness as a battler.', CAST(1.00 AS Decimal(6, 2)), CAST(22.50 AS Decimal(6, 2)), 4, 862, 7)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (9, N'Blastoise', N'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.', CAST(1.60 AS Decimal(6, 2)), CAST(85.50 AS Decimal(6, 2)), 4, 863, 8)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (10, N'Caterpie', N'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this PokÃ©mon releases a terrifically strong odor.', CAST(0.30 AS Decimal(6, 2)), CAST(2.90 AS Decimal(6, 2)), 4, 864, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (11, N'Metapod', N'The shell covering this PokÃ©mon''s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.', CAST(0.70 AS Decimal(6, 2)), CAST(9.90 AS Decimal(6, 2)), 4, 865, 10)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (12, N'ButterFree', N'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.', CAST(1.10 AS Decimal(6, 2)), CAST(32.00 AS Decimal(6, 2)), 4, 866, 11)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (13, N'Weedle', N'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).', CAST(0.30 AS Decimal(6, 2)), CAST(3.20 AS Decimal(6, 2)), 4, 867, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (14, N'Kakuna', N'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.', CAST(0.60 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), 4, 865, 13)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (15, N'Beedrill', N'Beedrill is extremely territorial. No one should ever approach its nestâ€”this is for their own safety. If angered, they will attack in a furious swarm.', CAST(1.00 AS Decimal(6, 2)), CAST(29.50 AS Decimal(6, 2)), 4, 868, 14)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (16, N'Pidgey', N'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.', CAST(0.30 AS Decimal(6, 2)), CAST(1.80 AS Decimal(6, 2)), 4, 869, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (17, N'Pigeotto', N'Pidgeotto claims a large area as its own territory. This PokÃ©mon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.', CAST(1.10 AS Decimal(6, 2)), CAST(30.00 AS Decimal(6, 2)), 4, 870, 16)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (18, N'Pidgeot', N'This PokÃ©mon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their PokÃ©mon.', CAST(1.50 AS Decimal(6, 2)), CAST(39.50 AS Decimal(6, 2)), 4, 870, 17)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (19, N'Rattata', N'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it livesâ€”it will make its nest anywhere.', CAST(0.30 AS Decimal(6, 2)), CAST(3.50 AS Decimal(6, 2)), 4, 871, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (20, N'Raticate', N'Raticate''s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.', CAST(0.70 AS Decimal(6, 2)), CAST(18.50 AS Decimal(6, 2)), 4, 871, 19)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (21, N'Spearow', N'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.', CAST(0.30 AS Decimal(6, 2)), CAST(2.00 AS Decimal(6, 2)), 4, 869, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (22, N'Fearow', N'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.', CAST(1.20 AS Decimal(6, 2)), CAST(38.00 AS Decimal(6, 2)), 4, 872, 21)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (23, N'Ekans', N'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.', CAST(2.00 AS Decimal(6, 2)), CAST(6.90 AS Decimal(6, 2)), 4, 873, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (24, N'Arbok', N'This PokÃ©mon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.', CAST(3.50 AS Decimal(6, 2)), CAST(65.00 AS Decimal(6, 2)), 4, 874, 23)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (30, N'Nidorina', N'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.', CAST(0.80 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), 0, 899, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (31, N'Nidoqueen', N'Nidoqueen''s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.', CAST(1.30 AS Decimal(6, 2)), CAST(60.00 AS Decimal(6, 2)), 0, 900, 30)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (32, N'Nidoran', N'Nidoran? has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon''s notice.', CAST(0.50 AS Decimal(6, 2)), CAST(9.00 AS Decimal(6, 2)), 3, 901, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (33, N'Nidorino', N'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.', CAST(0.90 AS Decimal(6, 2)), CAST(19.50 AS Decimal(6, 2)), 3, 901, 32)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (34, N'Nidoking', N'Nidoking''s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.', CAST(1.40 AS Decimal(6, 2)), CAST(62.00 AS Decimal(6, 2)), 3, 900, 33)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (35, N'Clefairy', N'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.', CAST(0.60 AS Decimal(6, 2)), CAST(7.50 AS Decimal(6, 2)), 4, 902, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (36, N'Clefable', N'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.', CAST(1.30 AS Decimal(6, 2)), CAST(40.00 AS Decimal(6, 2)), 4, 902, 35)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (65, N'Alakazam', N'Alakazam''s brain continually grows, making its head far too heavy to support with its neck. This PokÃ©mon holds its head up using its psychokinetic power instead.', CAST(1.50 AS Decimal(6, 2)), CAST(48.00 AS Decimal(6, 2)), 4, 844, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (66, N'Machop', N'Machop''s muscles are specialâ€”they never get sore no matter how much they are used in exercise. This PokÃ©mon has sufficient power to hurl a hundred adult humans.', CAST(0.80 AS Decimal(6, 2)), CAST(19.50 AS Decimal(6, 2)), 4, 845, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (67, N'Machoke', N'Machoke''s thoroughly toned muscles possess the hardness of steel. This PokÃ©mon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.', CAST(1.50 AS Decimal(6, 2)), CAST(70.50 AS Decimal(6, 2)), 4, 845, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (68, N'Machamp', N'Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This PokÃ©mon tends to leap into action before it thinks.', CAST(1.60 AS Decimal(6, 2)), CAST(130.00 AS Decimal(6, 2)), 4, 845, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (69, N'Bellsprout', N'Bellsprout''s thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this PokÃ©mon spits a corrosive fluid that melts even iron.', CAST(0.70 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 4, 846, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (70, N'Weepinbell', N'Weepinbell has a large hook on its rear end. At night, the PokÃ©mon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.', CAST(1.00 AS Decimal(6, 2)), CAST(6.40 AS Decimal(6, 2)), 4, 847, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (71, N'Victreebel', N'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this PokÃ©mon swallows it whole.', CAST(1.70 AS Decimal(6, 2)), CAST(15.50 AS Decimal(6, 2)), 4, 847, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (72, N'Tentacool', N'Tentacool''s body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this PokÃ©mon happens to become dehydrated, put it back into the sea.', CAST(0.90 AS Decimal(6, 2)), CAST(45.50 AS Decimal(6, 2)), 4, 848, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (73, N'Tentacruel', N'Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This PokÃ©mon''s outburst creates rough waves around it.', CAST(1.60 AS Decimal(6, 2)), CAST(55.00 AS Decimal(6, 2)), 4, 848, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (74, N'Geodude', N'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this PokÃ©mon''s heart will remain hard, craggy, and rough always.', CAST(0.40 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), 4, 849, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (75, N'Graveler', N'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This PokÃ©mon eats its way through a ton of rocks on a daily basis.', CAST(1.00 AS Decimal(6, 2)), CAST(105.00 AS Decimal(6, 2)), 4, 849, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (76, N'Golem', N'Golem live up on mountains. If there is a large earthquake, these PokÃ©mon will come rolling down off the mountains en masse to the foothills below.', CAST(1.40 AS Decimal(6, 2)), CAST(300.00 AS Decimal(6, 2)), 4, 850, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (77, N'Ponyta', N'Ponyta is very weak at birth. It can barely stand up. This PokÃ©mon becomes stronger by stumbling and falling to keep up with its parent.', CAST(1.00 AS Decimal(6, 2)), CAST(30.00 AS Decimal(6, 2)), 4, 851, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (78, N'Rapidash', N'Rapidash usually can be seen casually cantering in the fields and plains. However, when this PokÃ©mon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.', CAST(1.70 AS Decimal(6, 2)), CAST(95.00 AS Decimal(6, 2)), 4, 851, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (79, N'Slowpoke', N'Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this PokÃ©mon often forgets what it''s doing and often spends entire days just loafing at water''s edge.', CAST(1.20 AS Decimal(6, 2)), CAST(36.00 AS Decimal(6, 2)), 4, 852, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (80, N'Slowbro', N'Slowbro''s tail has a Shellder firmly attached with a bite. As a result, the tail can''t be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.', CAST(1.60 AS Decimal(6, 2)), CAST(78.50 AS Decimal(6, 2)), 4, 853, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (81, N'Magnemite', N'Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this PokÃ©mon clinging to the breaker box.', CAST(0.30 AS Decimal(6, 2)), CAST(6.00 AS Decimal(6, 2)), 2, 854, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (82, N'Magneton', N'Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this PokÃ©mon.', CAST(1.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(6, 2)), 2, 854, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (83, N'Farfetch''d', N'Farfetch''d is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This PokÃ©mon has been known to fight with others over stalks.', CAST(0.80 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 4, 855, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (84, N'Doduo', N'Doduo''s two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.', CAST(1.40 AS Decimal(6, 2)), CAST(39.20 AS Decimal(6, 2)), 4, 856, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (85, N'Dodrio', N'Watch out if Dodrio''s three heads are looking in three separate directions. It''s a sure sign that it is on its guard. Don''t go near this PokÃ©mon if it''s being waryâ€”it may decide to peck you.', CAST(1.80 AS Decimal(6, 2)), CAST(85.20 AS Decimal(6, 2)), 4, 857, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (86, N'Seel', N'Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.', CAST(1.10 AS Decimal(6, 2)), CAST(90.00 AS Decimal(6, 2)), 4, 858, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (87, N'Dewgong', N'Dewgong loves to snooze on bitterly cold ice. The sight of this PokÃ©mon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.', CAST(1.70 AS Decimal(6, 2)), CAST(120.00 AS Decimal(6, 2)), 4, 858, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (88, N'Grimer', N'Grimer''s sludgy and rubbery body can be forced through any opening, however small it may be. This PokÃ©mon enters sewer pipes to drink filthy wastewater.', CAST(0.90 AS Decimal(6, 2)), CAST(30.00 AS Decimal(6, 2)), 4, 859, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (89, N'Muk', N'From Muk''s body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this PokÃ©mon''s body fluid can turn a pool stagnant and rancid.', CAST(1.20 AS Decimal(6, 2)), CAST(30.00 AS Decimal(6, 2)), 4, 859, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (120, N'Staryu', N'Staryu''s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.', CAST(0.80 AS Decimal(6, 2)), CAST(34.50 AS Decimal(6, 2)), 4, 875, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (121, N'Starmie', N'Starmie''s center section—the core—glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname “the gem of the sea."', CAST(1.10 AS Decimal(6, 2)), CAST(80.00 AS Decimal(6, 2)), 4, 876, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (122, N'Mr. Mime', N'Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.', CAST(1.30 AS Decimal(6, 2)), CAST(54.50 AS Decimal(6, 2)), 4, 877, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (123, N'Scyther', N'Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon''s scythes are so effective, they can slice through thick logs in one wicked stroke.', CAST(1.50 AS Decimal(6, 2)), CAST(56.00 AS Decimal(6, 2)), 4, 878, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (124, N'Jynx', N'Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.', CAST(1.40 AS Decimal(6, 2)), CAST(40.60 AS Decimal(6, 2)), 0, 879, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (125, N'Electabuzz', N'When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.', CAST(1.10 AS Decimal(6, 2)), CAST(30.00 AS Decimal(6, 2)), 4, 880, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (126, N'Magmar', N'In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon''s fiery bursts create heat waves that ignite grass and trees in its surroundings.', CAST(1.30 AS Decimal(6, 2)), CAST(44.50 AS Decimal(6, 2)), 4, 881, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (127, N'Pinsir', N'Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon''s movements turn sluggish in cold places.', CAST(1.50 AS Decimal(6, 2)), CAST(55.00 AS Decimal(6, 2)), 4, 882, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (128, N'Tauros', N'This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.', CAST(1.40 AS Decimal(6, 2)), CAST(88.40 AS Decimal(6, 2)), 1, 883, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (129, N'Magikarp', N'Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.', CAST(0.90 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), 4, 884, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (130, N'Gyarados', N'When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon''s wildly violent nature.', CAST(6.50 AS Decimal(6, 2)), CAST(235.00 AS Decimal(6, 2)), 4, 885, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (131, N'Lapras', N'People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.', CAST(2.50 AS Decimal(6, 2)), CAST(220.00 AS Decimal(6, 2)), 4, 886, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (132, N'Ditto', N'Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.', CAST(0.30 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 2, 887, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (133, N'Eeve', N'Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.', CAST(0.30 AS Decimal(6, 2)), CAST(6.50 AS Decimal(6, 2)), 4, 888, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (134, N'Vaporeon', N'Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.', CAST(1.00 AS Decimal(6, 2)), CAST(29.00 AS Decimal(6, 2)), 4, 889, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (135, N'Jolteon', N'Jolteon''s cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.', CAST(0.80 AS Decimal(6, 2)), CAST(24.50 AS Decimal(6, 2)), 4, 890, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (136, N'Flareon', N'Flareon''s fluffy fur has a functional purpose—it releases heat into the air so that its body does not get excessively hot. This Pokémon''s body temperature can rise to a maximum of 1,650 degrees Fahrenheit.', CAST(0.90 AS Decimal(6, 2)), CAST(25.00 AS Decimal(6, 2)), 4, 860, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (137, N'Porygon', N'Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy protected so it cannot be duplicated by copying.', CAST(0.80 AS Decimal(6, 2)), CAST(36.50 AS Decimal(6, 2)), 2, 891, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (138, N'Omanyte', N'Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.', CAST(0.40 AS Decimal(6, 2)), CAST(7.50 AS Decimal(6, 2)), 4, 892, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (139, N'Omastar', N'Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.', CAST(1.00 AS Decimal(6, 2)), CAST(35.00 AS Decimal(6, 2)), 4, 892, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (140, N'Kabuto', N'Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.', CAST(0.50 AS Decimal(6, 2)), CAST(11.50 AS Decimal(6, 2)), 4, 863, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (141, N'Kabutops', N'Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water dweller to living on land as evident from the beginnings of change in its gills and legs.', CAST(1.30 AS Decimal(6, 2)), CAST(40.50 AS Decimal(6, 2)), 4, 863, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (142, N'Aerodactyl', N'Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.', CAST(1.80 AS Decimal(6, 2)), CAST(59.00 AS Decimal(6, 2)), 4, 893, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (143, N'Snorlax', N'Snorlax''s typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.', CAST(2.10 AS Decimal(6, 2)), CAST(460.00 AS Decimal(6, 2)), 4, 894, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (144, N'Articuno', N'Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.', CAST(1.70 AS Decimal(6, 2)), CAST(55.40 AS Decimal(6, 2)), 2, 895, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (145, N'Zapdos', N'Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.', CAST(1.60 AS Decimal(6, 2)), CAST(52.60 AS Decimal(6, 2)), 2, 880, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (146, N'Moltres', N'Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.', CAST(2.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(6, 2)), 2, 860, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (147, N'Dratini', N'Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.', CAST(1.80 AS Decimal(6, 2)), CAST(3.30 AS Decimal(6, 2)), 4, 896, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (148, N'Dragonair', N'Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from the crystals on its neck and tail.', CAST(4.00 AS Decimal(6, 2)), CAST(16.50 AS Decimal(6, 2)), 4, 896, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (149, N'Dragonite', N'Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.', CAST(2.20 AS Decimal(6, 2)), CAST(210.00 AS Decimal(6, 2)), 4, 896, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (150, N'Mewtwo', N'Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon''s body, they failed to endow Mewtwo with a compassionate heart.', CAST(2.00 AS Decimal(6, 2)), CAST(122.00 AS Decimal(6, 2)), 2, 897, NULL)
INSERT [dbo].[Pokemon] ([codPokemon], [nome], [descricao], [altura], [peso], [sexo], [codCategoria], [evoluiDe]) VALUES (151, N'Mew', N'Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.', CAST(0.40 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 2, 898, NULL)
INSERT [dbo].[Sexo] ([sexo], [tipoSexo]) VALUES (0, N'Femea')
INSERT [dbo].[Sexo] ([sexo], [tipoSexo]) VALUES (1, N'Masculino')
INSERT [dbo].[Sexo] ([sexo], [tipoSexo]) VALUES (2, N'Desconhecido')
INSERT [dbo].[Sexo] ([sexo], [tipoSexo]) VALUES (3, N'Macho')
INSERT [dbo].[Sexo] ([sexo], [tipoSexo]) VALUES (4, N'Ambos')
SET IDENTITY_INSERT [dbo].[Tipo] ON 

INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (211, N'Fighting')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (212, N'Grass')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (213, N'Poison')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (214, N'Rock')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (215, N'Eletric')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (216, N'Normal')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (217, N'Fire')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (218, N'Water')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (219, N'Electric')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (220, N'Bug')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (221, N'Posion')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (222, N'Flying')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (223, N'Electric. Ice')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (224, N'Ice')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (225, N'Ground')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (226, N'Psychic')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (227, N'Steel')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (228, N'Dragon')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (229, N'Fairy')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (230, N'Dark')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (231, N' Psychic')
INSERT [dbo].[Tipo] ([codTipo], [nmTipo]) VALUES (232, N' Ground')
SET IDENTITY_INSERT [dbo].[Tipo] OFF
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (71, 212)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (24, 213)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (32, 213)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (33, 213)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (34, 213)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (17, 216)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (18, 216)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (19, 216)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (20, 216)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (21, 216)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (22, 216)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (9, 218)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (14, 220)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (18, 222)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (21, 222)
INSERT [dbo].[TipoPokemon] ([codPokemon], [codTipo]) VALUES (22, 222)
ALTER TABLE [dbo].[Fraqueza]  WITH CHECK ADD  CONSTRAINT [FK_Fraqueza_Pokemon] FOREIGN KEY([codPokemon])
REFERENCES [dbo].[Pokemon] ([codPokemon])
GO
ALTER TABLE [dbo].[Fraqueza] CHECK CONSTRAINT [FK_Fraqueza_Pokemon]
GO
ALTER TABLE [dbo].[Fraqueza]  WITH CHECK ADD  CONSTRAINT [FK_Fraqueza_Tipo] FOREIGN KEY([CodTipo])
REFERENCES [dbo].[Tipo] ([codTipo])
GO
ALTER TABLE [dbo].[Fraqueza] CHECK CONSTRAINT [FK_Fraqueza_Tipo]
GO
ALTER TABLE [dbo].[HabilidadePokemon]  WITH CHECK ADD  CONSTRAINT [FK_HabilidadePokemon_Habilidade] FOREIGN KEY([codHabilidade])
REFERENCES [dbo].[Habilidade] ([codHabilidade])
GO
ALTER TABLE [dbo].[HabilidadePokemon] CHECK CONSTRAINT [FK_HabilidadePokemon_Habilidade]
GO
ALTER TABLE [dbo].[HabilidadePokemon]  WITH CHECK ADD  CONSTRAINT [FK_HabilidadePokemon_Pokemon] FOREIGN KEY([codPokemon])
REFERENCES [dbo].[Pokemon] ([codPokemon])
GO
ALTER TABLE [dbo].[HabilidadePokemon] CHECK CONSTRAINT [FK_HabilidadePokemon_Pokemon]
GO
ALTER TABLE [dbo].[Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Categoria] FOREIGN KEY([codCategoria])
REFERENCES [dbo].[Categoria] ([codCategoria])
GO
ALTER TABLE [dbo].[Pokemon] CHECK CONSTRAINT [FK_Pokemon_Categoria]
GO
ALTER TABLE [dbo].[Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Pokemon] FOREIGN KEY([evoluiDe])
REFERENCES [dbo].[Pokemon] ([codPokemon])
GO
ALTER TABLE [dbo].[Pokemon] CHECK CONSTRAINT [FK_Pokemon_Pokemon]
GO
ALTER TABLE [dbo].[Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Sexo] FOREIGN KEY([sexo])
REFERENCES [dbo].[Sexo] ([sexo])
GO
ALTER TABLE [dbo].[Pokemon] CHECK CONSTRAINT [FK_Pokemon_Sexo]
GO
ALTER TABLE [dbo].[TipoPokemon]  WITH CHECK ADD  CONSTRAINT [FK_TipoPokemon_Pokemon] FOREIGN KEY([codPokemon])
REFERENCES [dbo].[Pokemon] ([codPokemon])
GO
ALTER TABLE [dbo].[TipoPokemon] CHECK CONSTRAINT [FK_TipoPokemon_Pokemon]
GO
ALTER TABLE [dbo].[TipoPokemon]  WITH CHECK ADD  CONSTRAINT [FK_TipoPokemon_Tipo] FOREIGN KEY([codTipo])
REFERENCES [dbo].[Tipo] ([codTipo])
GO
ALTER TABLE [dbo].[TipoPokemon] CHECK CONSTRAINT [FK_TipoPokemon_Tipo]
GO
