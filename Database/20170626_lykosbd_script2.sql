USE [lykosdb]

/****** Object:  Table [all_categories]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [all_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_part_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [change_initiator]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [change_initiator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [change_need_approve]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [change_need_approve](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [change_need_submit]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [change_need_submit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [change_strategy]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [change_strategy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [component_type]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [component_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [country_impacted]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [country_impacted](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [form_parts_cateries]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [form_parts_cateries](
	[id] [int] NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_form_parts_cateries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [manufacturer]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [marketing_authorithation_holder]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [marketing_authorithation_holder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [packaging_matrials_period]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [packaging_matrials_period](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [pharmaceutical_form]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [pharmaceutical_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [product_code]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [product_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [product_name]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [product_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [sell_out_period]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [sell_out_period](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [strength]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [strength](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [type_of_artwork]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [type_of_artwork](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [type_of_change]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [type_of_change](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [users]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [users](
	[id] [uniqueidentifier] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[comment] [nvarchar](500) NOT NULL
) ON [PRIMARY]


/****** Object:  Table [variation_type]    Script Date: 16.06.2017 17:01:58 ******/

CREATE TABLE [variation_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[all_cat_id] [int] NULL,
	[name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


SET IDENTITY_INSERT [all_categories] ON 

INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (1, 1, N'Product Name')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (2, 1, N'Pharmaceutical form')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (3, 1, N'Strength')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (4, 1, N'Product code')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (5, 1, N'Manufacturer')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (6, 1, N'Marketing Authorithation Holder')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (7, 1, N'Country Impacted')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (8, 1, N'Change initiator')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (9, 1, N'Change initiator')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (10, 1, N'Date of request')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (11, 2, N'Type of artwork')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (12, 2, N'Type of change')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (13, 2, N'Variation type')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (14, 2, N'Does this change need to be submitted to regulatory authority before implementation?')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (15, 2, N'Does this change need to be approved by regulatory authority before implementation?')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (16, 2, N'How long can old packaging matrials still be used at manufacturing site after approval/notification?')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (17, 2, N'How long is the sell-out period of the imported finished product manufactured with old packaging after approval in the country')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (18, 2, N'Comments')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (19, 3, N'Type of component (should be attach approved artwork)')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (20, 4, N'Change strategy')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (21, 4, N'Implementation Date')
INSERT [all_categories] ([id], [form_part_cat_id], [name]) VALUES (22, 4, N'Comments')
SET IDENTITY_INSERT [all_categories] OFF
SET IDENTITY_INSERT [change_initiator] ON 

INSERT [change_initiator] ([id], [all_cat_id], [name]) VALUES (1, 8, N'Olga Kravchuk')
INSERT [change_initiator] ([id], [all_cat_id], [name]) VALUES (2, 8, N'Maria Zharkova')
INSERT [change_initiator] ([id], [all_cat_id], [name]) VALUES (3, 8, N'Zulfia Mamedova')
INSERT [change_initiator] ([id], [all_cat_id], [name]) VALUES (4, 8, N'Anastasiya Shapovalova')
INSERT [change_initiator] ([id], [all_cat_id], [name]) VALUES (5, 8, N'Alla Gunceva')
SET IDENTITY_INSERT [change_initiator] OFF
SET IDENTITY_INSERT [change_need_approve] ON 

INSERT [change_need_approve] ([id], [all_cat_id], [name]) VALUES (1, 15, N'No')
INSERT [change_need_approve] ([id], [all_cat_id], [name]) VALUES (2, 15, N'Yes: Expected Approval date:…..or Approval  date')
SET IDENTITY_INSERT [change_need_approve] OFF
SET IDENTITY_INSERT [change_need_submit] ON 

INSERT [change_need_submit] ([id], [all_cat_id], [name]) VALUES (1, 14, N'No')
INSERT [change_need_submit] ([id], [all_cat_id], [name]) VALUES (2, 14, N'Yes: Planned submission date….. or submission date…..')
SET IDENTITY_INSERT [change_need_submit] OFF
SET IDENTITY_INSERT [change_strategy] ON 

INSERT [change_strategy] ([id], [all_cat_id], [name]) VALUES (1, 20, N'depend on section 2')
SET IDENTITY_INSERT [change_strategy] OFF
SET IDENTITY_INSERT [component_type] ON 

INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (1, 19, N'leaflet')
INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (2, 19, N'carton')
INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (3, 19, N'blister')
INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (4, 19, N'tube')
INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (5, 19, N'sachet')
INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (6, 19, N'label')
INSERT [component_type] ([id], [all_cat_id], [name]) VALUES (7, 19, N'foil ')
SET IDENTITY_INSERT [component_type] OFF
SET IDENTITY_INSERT [country_impacted] ON 

INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (1, 7, N'Azerbaijan')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (2, 7, N'Armenia')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (3, 7, N'Georgia')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (4, 7, N'Kazakhstan')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (5, 7, N'Kyrgystan')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (6, 7, N'Moldova')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (7, 7, N'Russia')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (8, 7, N'Ukraine')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (9, 7, N'Uzbekistan')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (10, 7, N'Turkmenistan')
INSERT [country_impacted] ([id], [all_cat_id], [name]) VALUES (11, 7, N'CIS')
SET IDENTITY_INSERT [country_impacted] OFF
INSERT [form_parts_cateries] ([id], [name]) VALUES (1, N'Change request information')
INSERT [form_parts_cateries] ([id], [name]) VALUES (2, N'Description of the change')
INSERT [form_parts_cateries] ([id], [name]) VALUES (3, N'Packaging component(s)s to be change')
INSERT [form_parts_cateries] ([id], [name]) VALUES (4, N'Change`s implementation strategy')
SET IDENTITY_INSERT [manufacturer] ON 

INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (1, 5, N'OSO Biopharmaceuticals Manufacturing, LLC”, USA')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (2, 5, N'Pierre Fabre Medicament Production, Aquitaine Pharm International”, France')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (3, 5, N'Helsinn Birex Pharmaceuticals Ltd., Ireland')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (4, 5, N'Italfarmaco S.p.A., Italy,')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (5, 5, N'Aziende Chimiche Riunite Angelini Francesco A.C.R.A.F. S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (6, 5, N'Laboratoires Expanscience, France')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (7, 5, N'Angelini Pharma Ceska republika s.r.o.')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (8, 5, N'Laboratori Baldacci S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (9, 5, N'Catalent Italy S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (10, 5, N'Doppel Farmaceutici S.r.l., Cortemaggiore (PC) – Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (11, 5, N'Doppel Farmaceutici S.r.l., Rozzano -Italy ')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (12, 5, N'Abiogen Pharma S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (13, 5, N'Alfa Wassermann S.p.a., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (14, 5, N'Istituto De Angeli S.r.l., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (15, 5, N'Lamp San Prospero SpA., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (16, 5, N'Valpharma S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (17, 5, N'Dompe farmaceutici S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (18, 5, N'Zellaerosol GmbH, Germany')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (19, 5, N'Fidia Farmaceutici S.p.A., Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (20, 5, N'Edmond Pharma, Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (21, 5, N'LABIANA Pharmaceuticals S.L.U., Spain')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (22, 5, N'Fine Foods & Pharmaceuticals N.T.M. S.p.A.')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (23, 5, N'PIERRE FABRE MEDICAMENT PRODUCTION, Aignan, France')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (24, 5, N'Mipharm S.p.A, ')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (25, 5, N'IBSA Institut Biochimique SA, Italy')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (26, 5, N'DISCH AG, Switzerland')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (27, 5, N'Angelini Pharma Osterreich GmbH, Austria')
INSERT [manufacturer] ([id], [all_cat_id], [name]) VALUES (28, 5, N'Famar S.p.A., Italy ')
SET IDENTITY_INSERT [manufacturer] OFF
SET IDENTITY_INSERT [marketing_authorithation_holder] ON 

INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (1, 6, N'Helsinn Birex Pharmaceuticals Ltd., Ireland')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (2, 6, N'Italfarmaco S.p.A., Italy,')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (3, 6, N'Aziende Chimiche Riunite Angelini Francesco A.C.R.A.F. S.p.A., Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (4, 6, N'Laboratoires Expanscience, France')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (5, 6, N'Polichem S.r.l., Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (6, 6, N'UAB MRA, Lithuania')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (7, 6, N'Angelini Pharma Ceska republika s.r.o.')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (8, 6, N'Laboratori Baldacci S.p.A., Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (9, 6, N'Dompe farmaceutici S.p.A., Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (10, 6, N'DIFASS International S.r.l., Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (11, 6, N'IBSA Institut Biochimique SA, Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (12, 6, N'Fidia Farmaceutici S.p.A., Italy')
INSERT [marketing_authorithation_holder] ([id], [all_cat_id], [name]) VALUES (13, 6, N'SCHARPER S.p.A. Italy')
SET IDENTITY_INSERT [marketing_authorithation_holder] OFF
SET IDENTITY_INSERT [packaging_matrials_period] ON 

INSERT [packaging_matrials_period] ([id], [all_cat_id], [name]) VALUES (1, 16, N'until expiery day')
INSERT [packaging_matrials_period] ([id], [all_cat_id], [name]) VALUES (2, 16, N'define deadline')
SET IDENTITY_INSERT [packaging_matrials_period] OFF
SET IDENTITY_INSERT [pharmaceutical_form] ON 

INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (1, 2, N'solution for injection')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (2, 2, N'vaginal cream')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (3, 2, N'powder for solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (4, 2, N'hard capsules')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (5, 2, N'powder for suspension')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (6, 2, N'granules for solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (7, 2, N'vaginal suppositories')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (8, 2, N'syrup')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (9, 2, N'soft capsules')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (10, 2, N'oral solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (11, 2, N'coated tablets')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (12, 2, N'soft vaginal capsules')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (13, 2, N'granules for oral solution ')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (14, 2, N'solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (15, 2, N'spray')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (16, 2, N'powder for vaginal solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (17, 2, N'vaginal solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (18, 2, N'mouthwash solution')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (19, 2, N'prolonged release tablets')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (20, 2, N'lozenges')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (21, 2, N'film-coated prolonged release tablets')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (22, 2, N'vaginal tablets')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (23, 2, N'prefilled syringe')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (24, 2, N'drops')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (25, 2, N'foam')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (26, 2, N'gel')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (27, 2, N'rectal suppositories')
INSERT [pharmaceutical_form] ([id], [all_cat_id], [name]) VALUES (28, 2, N'effervescent tablets')
SET IDENTITY_INSERT [pharmaceutical_form] OFF
SET IDENTITY_INSERT [product_name] ON 

INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (1, 1, N'Aloxi')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (2, 1, N'Artrosilene')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (3, 1, N'Dafnegin')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (4, 1, N'Dalifast')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (5, 1, N'Dialrapid')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (6, 1, N'Ermucin')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (7, 1, N'Erdomed')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (8, 1, N'Feminella')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (9, 1, N'Fluifort')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (10, 1, N'ol')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (11, 1, N'Gliatilin')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (12, 1, N'Hyalgan')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (13, 1, N'Hymovis')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (14, 1, N'Intragel')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (15, 1, N'Macmiror ')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (16, 1, N'Macmiror Complex')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (17, 1, N'Metadoxil')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (18, 1, N'Normogin')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (19, 1, N'OKI')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (20, 1, N'Onicit')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (21, 1, N'Piascledine 300')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (22, 1, N'Spasmovax')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (23, 1, N'Tantum Verde')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (24, 1, N'Tecnofer')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (25, 1, N'Tantum Rosa')
INSERT [product_name] ([id], [all_cat_id], [name]) VALUES (26, 1, N'Trittico')
SET IDENTITY_INSERT [product_name] OFF
SET IDENTITY_INSERT [sell_out_period] ON 

INSERT [sell_out_period] ([id], [all_cat_id], [name]) VALUES (1, 17, N'until expiry date')
INSERT [sell_out_period] ([id], [all_cat_id], [name]) VALUES (2, 17, N'until next import cycle')
INSERT [sell_out_period] ([id], [all_cat_id], [name]) VALUES (3, 17, N'define deadline')
SET IDENTITY_INSERT [sell_out_period] OFF
SET IDENTITY_INSERT [strength] ON 

INSERT [strength] ([id], [all_cat_id], [name]) VALUES (1, 3, N'15%')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (2, 3, N'320 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (3, 3, N'5%')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (4, 3, N'80 mg/ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (5, 3, N'160 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (6, 3, N'60 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (7, 3, N'1%')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (8, 3, N'100 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (9, 3, N'600 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (10, 3, N'1000 mg/3 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (11, 3, N'1000 mg/4 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (12, 3, N'400 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (13, 3, N'20 mg/2 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (14, 3, N'24 mg/3 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (15, 3, N'40 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (16, 3, N'150 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (17, 3, N'80 mg/ 80 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (18, 3, N'40 mg/ 4 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (19, 3, N'500 mg, 200 000 UI')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (20, 3, N'200 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (21, 3, N'175 mg/ 5 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (22, 3, N'225 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (23, 3, N'500 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (24, 3, N'300 mg/ 5 ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (25, 3, N'90 mg/ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (26, 3, N'2,7 g/ 5 g')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (27, 3, N'50 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (28, 3, N'80 mg/ 2 g')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (29, 3, N'16 mg/ ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (30, 3, N'300 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (31, 3, N'500 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (32, 3, N'0,1%')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (33, 3, N'3 mg')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (34, 3, N'1,5 mg/ml')
INSERT [strength] ([id], [all_cat_id], [name]) VALUES (35, 3, N'0,25 mg/5 ml')
SET IDENTITY_INSERT [strength] OFF
SET IDENTITY_INSERT [type_of_artwork] ON 

INSERT [type_of_artwork] ([id], [all_cat_id], [name]) VALUES (1, 11, N'Artwork for submission to Authority')
INSERT [type_of_artwork] ([id], [all_cat_id], [name]) VALUES (2, 11, N'Artwork for production')
SET IDENTITY_INSERT [type_of_artwork] OFF
SET IDENTITY_INSERT [type_of_change] ON 

INSERT [type_of_change] ([id], [all_cat_id], [name]) VALUES (1, 12, N'Authority')
INSERT [type_of_change] ([id], [all_cat_id], [name]) VALUES (2, 12, N'Manufacturing')
INSERT [type_of_change] ([id], [all_cat_id], [name]) VALUES (3, 12, N'Regulatory Affairs')
INSERT [type_of_change] ([id], [all_cat_id], [name]) VALUES (4, 12, N'Marketing')
SET IDENTITY_INSERT [type_of_change] OFF
SET IDENTITY_INSERT [variation_type] ON 

INSERT [variation_type] ([id], [all_cat_id], [name]) VALUES (1, 13, N'New registration')
INSERT [variation_type] ([id], [all_cat_id], [name]) VALUES (2, 13, N'Renewal')
INSERT [variation_type] ([id], [all_cat_id], [name]) VALUES (3, 13, N'Variation ')
INSERT [variation_type] ([id], [all_cat_id], [name]) VALUES (4, 13, N'other')
SET IDENTITY_INSERT [variation_type] OFF
ALTER TABLE [all_categories]  WITH CHECK ADD FOREIGN KEY([form_part_cat_id])
REFERENCES [form_parts_cateries] ([id])

ALTER TABLE [change_initiator]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [change_need_approve]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [change_need_submit]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [change_strategy]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [component_type]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [country_impacted]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [manufacturer]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [marketing_authorithation_holder]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [packaging_matrials_period]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [pharmaceutical_form]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [product_code]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [product_name]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [sell_out_period]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [strength]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [type_of_artwork]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [type_of_change]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

ALTER TABLE [variation_type]  WITH CHECK ADD FOREIGN KEY([all_cat_id])
REFERENCES [all_categories] ([id])

