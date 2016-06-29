if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DXBBS_BoardTopicProc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DXBBS_BoardTopicProc]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DXBBS_BoardTopTopicProc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DXBBS_BoardTopTopicProc]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DXBBS_CommonProc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DXBBS_CommonProc]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DXBBS_TopicProc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DXBBS_TopicProc]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Advertisement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Advertisement]
CREATE TABLE [dbo].[$TablePrefix_Forum_Advertisement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[IsUsing] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Advertisement_IsUsing]  DEFAULT ((0)),
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Advertisement_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Advertisement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Board]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Board]
CREATE TABLE [dbo].[$TablePrefix_Forum_Board](
	[ID] [int] NOT NULL,
	[FatherID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_FatherID]  DEFAULT ((0)),
	[FatherPath] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Depth] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_Depth]  DEFAULT ((0)),
	[RootID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_RootID]  DEFAULT ((0)),
	[ChildNum] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ChildNum]  DEFAULT ((0)),
	[Orders] [int] NULL,
	[ChildOrderType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ChildOrderType]  DEFAULT ((0)),
	[ChildLineNum] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ChildLineNum]  DEFAULT ((0)),
	[BoardName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[AllowTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_AllowTopic]  DEFAULT ((0)),
	[ShowType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ShowType]  DEFAULT ((0)),
	[NeedConfirm] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_NeedConfirm]  DEFAULT ((0)),
	[Locked] [int] NULL,
	[TitleColor] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[BoardRule] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Master] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[MasterID] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Photo] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[Logo] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TopicCount] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TopicCount]  DEFAULT ((0)),
	[TotalTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TotalTopic]  DEFAULT ((0)),
	[TotalReply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TotalReply]  DEFAULT ((0)),
	[TodayTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TodayTopic]  DEFAULT ((0)),
	[TodayReply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TodayReply]  DEFAULT ((0)),
	[ActiveBoardID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ActiveBoardID]  DEFAULT ((0)),
	[ActiveTopicID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ActiveTopicID]  DEFAULT ((0)),
	[ActiveTopicTitle] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ActiveUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ActiveUserID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ActiveUserID]  DEFAULT ((0)),
	[ActiveTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ActiveTime]  DEFAULT (getdate()),
	[LevelID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TeamID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[PowerType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_PowerType]  DEFAULT ((0)),
	[TopicOrderType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TopicOrderType]  DEFAULT ((0)),
	[TopicPerPage] [int] NULL,
	[ReplyPerPage] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_ReplyPerPage]  DEFAULT ((0)),
	[TemplateID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_TemplateID]  DEFAULT ((0)),
	[SkinID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_SkinID]  DEFAULT ((0)),
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Board_AddTime]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_BoardRecycle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_BoardRecycle]
CREATE TABLE [dbo].[$TablePrefix_Forum_BoardRecycle](
	[ID] [int] NOT NULL,
	[FatherID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_FatherID]  DEFAULT ((0)),
	[FatherPath] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Depth] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_Depth]  DEFAULT ((0)),
	[RootID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_RootID]  DEFAULT ((0)),
	[ChildNum] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ChildNum]  DEFAULT ((0)),
	[Orders] [int] NULL,
	[ChildOrderType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ChildOrderType]  DEFAULT ((0)),
	[ChildLineNum] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ChildLineNum]  DEFAULT ((0)),
	[BoardName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[AllowTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_AllowTopic]  DEFAULT ((0)),
	[ShowType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ShowType]  DEFAULT ((0)),
	[NeedConfirm] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_NeedConfirm]  DEFAULT ((0)),
	[Locked] [int] NULL,
	[TitleColor] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[BoardRule] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Master] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[MasterID] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Photo] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[Logo] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TopicCount] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TopicCount]  DEFAULT ((0)),
	[TotalTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TotalTopic]  DEFAULT ((0)),
	[TotalReply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TotalReply]  DEFAULT ((0)),
	[TodayTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TodayTopic]  DEFAULT ((0)),
	[TodayReply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TodayReply]  DEFAULT ((0)),
	[ActiveBoardID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ActiveBoardID]  DEFAULT ((0)),
	[ActiveTopicID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ActiveTopicID]  DEFAULT ((0)),
	[ActiveTopicTitle] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ActiveUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ActiveUserID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ActiveUserID]  DEFAULT ((0)),
	[ActiveTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ActiveTime]  DEFAULT (getdate()),
	[LevelID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TeamID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[PowerType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_PowerType]  DEFAULT ((0)),
	[TopicOrderType] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TopicOrderType]  DEFAULT ((0)),
	[TopicPerPage] [int] NULL,
	[ReplyPerPage] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_ReplyPerPage]  DEFAULT ((0)),
	[TemplateID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_TemplateID]  DEFAULT ((0)),
	[SkinID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_SkinID]  DEFAULT ((0)),
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_BoardRecycle_AddTime]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Emote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Emote]
CREATE TABLE [dbo].[$TablePrefix_Forum_Emote](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmoteName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[FileName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Orders] [int] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_Emote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Face]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Face]
CREATE TABLE [dbo].[$TablePrefix_Forum_Face](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FaceName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[FileName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Orders] [int] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_Face] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Favorite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Favorite]
CREATE TABLE [dbo].[$TablePrefix_Forum_Favorite](
	[UserID] [int] NULL,
	[TopicID] [int] NULL
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Friend]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Friend]
CREATE TABLE [dbo].[$TablePrefix_Forum_Friend](
	[UserID] [int] NULL,
	[FriendID] [int] NULL
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Group]
CREATE TABLE [dbo].[$TablePrefix_Forum_Group](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL,
	[GroupName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Group_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_History]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_History]
CREATE TABLE [dbo].[$TablePrefix_Forum_History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TodayTopic] [int] NULL,
	[TodayReply] [int] NULL,
	[TodayRegister] [int] NULL,
	[TodayOnline] [int] NULL,
	[TodayLogin] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_IP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_IP]
CREATE TABLE [dbo].[$TablePrefix_Forum_IP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Reason] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_IP_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_IP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Level]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Level]
CREATE TABLE [dbo].[$TablePrefix_Forum_Level](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Point] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Level_Point]  DEFAULT ((0)),
	[Photo] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Level_Photo]  DEFAULT ((0)),
	[Types] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Level_Types]  DEFAULT ((0)),
	[Power] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[StringPower] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Level_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Level] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Link]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Link]
CREATE TABLE [dbo].[$TablePrefix_Forum_Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Photo] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[URL] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Types] [int] NULL,
	[Orders] [int] NULL,
	[Introduce] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Link_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Log]
CREATE TABLE [dbo].[$TablePrefix_Forum_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Log_BoardID]  DEFAULT ((0)),
	[TopicID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Log_TopicID]  DEFAULT ((0)),
	[LogTitle] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Title] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Operator] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[OperatorID] [int] NULL,
	[Loger] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[LogerID] [int] NULL,
	[Reason] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Coin] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Log_Coin]  DEFAULT ((0)),
	[Point] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Log_Point]  DEFAULT ((0)),
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Log_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Menu]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Menu]
CREATE TABLE [dbo].[$TablePrefix_Forum_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[URL] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Target] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Color] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Strong] [int] NOT NULL CONSTRAINT [DF_$TablePrefix_Forum_Menu_Strong]  DEFAULT ((0)),
	[Disappear] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Menu_Disappear]  DEFAULT ((0)),
	[Login] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Menu_Login]  DEFAULT ((0)),
	[Orders] [int] NULL,
	[Types] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Menu_Types]  DEFAULT ((0)),
 CONSTRAINT [PK_$TablePrefix_Forum_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Message]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Message]
CREATE TABLE [dbo].[$TablePrefix_Forum_Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[FromID] [int] NULL,
	[FromName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ToID] [int] NULL,
	[ToName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[FromDelete] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Message_FromDelete]  DEFAULT ((0)),
	[ToDelete] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Message_ToDelete]  DEFAULT ((0)),
	[Types] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Message_Types]  DEFAULT ((0)),
	[IsRead] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Message_IsRead]  DEFAULT ((0)),
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Message_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_News]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_News]
CREATE TABLE [dbo].[$TablePrefix_Forum_News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_News_BoardID]  DEFAULT ((0)),
	[Title] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_News_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Permision]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Permision]
CREATE TABLE [dbo].[$TablePrefix_Forum_Permision](
	[Keys] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[BoardID] [int] NULL,
	[ItemID] [int] NULL,
	[Power] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[StringPower] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Types] [int] NULL,
	[PowerType] [int] NULL,
	[PermisionType] [int] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_Permision] PRIMARY KEY CLUSTERED 
(
	[Keys] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Replace]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Replace]
CREATE TABLE [dbo].[$TablePrefix_Forum_Replace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Former] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Later] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Replace_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Replace] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Reply1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Reply1]
CREATE TABLE [dbo].[$TablePrefix_Forum_Reply1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL,
	[TopicID] [int] NULL,
	[IsTopic] [int] NULL,
	[Title] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[TitleColor] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Length] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[EditUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[EditTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Floor] [int] NULL,
	[UBB] [int] NULL,
	[VoteID] [int] NULL,
	[State] [int] NULL,
	[TopicState] [int] NULL,
	[LevelID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TeamID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Coin] [int] NULL,
	[AskCoin] [int] NULL,
	[GoodAnswer] [int] NULL,
	[Hide] [int] NULL,
	[BuyUserID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[ReplyUserID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[AnswerContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TableNumber] [int] NULL DEFAULT ((0)),
	[DeleteType] [int] NULL DEFAULT ((0)),
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_Reply1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Skin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Skin]
CREATE TABLE [dbo].[$TablePrefix_Forum_Skin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NULL,
	[SkinName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[FilePath] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Skin_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Skin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Status]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Status]
CREATE TABLE [dbo].[$TablePrefix_Forum_Status](
	[TotalTopic] [int] NULL,
	[TotalReply] [int] NULL,
	[TotalMale] [int] NULL,
	[TotalFemale] [int] NULL,
	[NewUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ActiveTime] [datetime] NULL
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Table]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Table]
CREATE TABLE [dbo].[$TablePrefix_Forum_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Orders] [int] NULL,
	[Counts] [int] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Team]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Team]
CREATE TABLE [dbo].[$TablePrefix_Forum_Team](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Master] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[MasterID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_MasterID]  DEFAULT ((0)),
	[Members] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_Members]  DEFAULT ((0)),
	[Photo] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[NeedConfirm] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_NeedConfirm]  DEFAULT ((0)),
	[Confirmed] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_Confirmed]  DEFAULT ((1)),
	[Introduce] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[IsPublic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_IsPublic]  DEFAULT ((1)),
	[Point] [int] NOT NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_Point]  DEFAULT ((0)),
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Team_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Team] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_TeamJoin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_TeamJoin]
CREATE TABLE [dbo].[$TablePrefix_Forum_TeamJoin](
	[UserID] [int] NULL,
	[TeamID] [int] NULL
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_TeamMessage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_TeamMessage]
CREATE TABLE [dbo].[$TablePrefix_Forum_TeamMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_TeamMessage_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_TeamMessage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_TeamNews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_TeamNews]
CREATE TABLE [dbo].[$TablePrefix_Forum_TeamNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NULL,
	[Title] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_TeamNews_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_TeamNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_TeamPhoto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_TeamPhoto]
CREATE TABLE [dbo].[$TablePrefix_Forum_TeamPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NULL,
	[Title] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[Photo] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_TeamPhoto_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_TeamPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Template]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Template]
CREATE TABLE [dbo].[$TablePrefix_Forum_Template](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[FilePath] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Template_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Template] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Topic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Topic]
CREATE TABLE [dbo].[$TablePrefix_Forum_Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RootID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_RootID]  DEFAULT ((0)),
	[BoardID] [int] NULL,
	[Title] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[TitleColor] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[Click] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_Click]  DEFAULT ((0)),
	[Reply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_Reply]  DEFAULT ((0)),
	[LastReplyUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[LastReplyUserID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_LastReplyUserID]  DEFAULT ((0)),
	[LastReplyTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_LastReplyTime]  DEFAULT (getdate()),
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[IsTop] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_IsTop]  DEFAULT ((0)),
	[IsGood] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_IsGood]  DEFAULT ((0)),
	[IsLock] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_IsLock]  DEFAULT ((0)),
	[State] [int] NULL,
	[TableNumber] [int] NULL,
	[GroupID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_GroupID]  DEFAULT ((0)),
	[Confirmed] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Topic_Confirmed]  DEFAULT ((1)),
	[DeleteType] [int] NULL DEFAULT ((0)),
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_Topic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
CREATE INDEX [IX_$TablePrefix_Forum_Topic] ON [dbo].[$TablePrefix_Forum_Topic](LastReplyTime DESC)
CREATE INDEX [IX_$TablePrefix_Forum_Topic1] ON [dbo].[$TablePrefix_Forum_Topic](AddTime DESC)

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_TopicRecycle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_TopicRecycle]
CREATE TABLE [dbo].[$TablePrefix_Forum_TopicRecycle](
	[ID] [int] NOT NULL,
	[RootID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_RootID]  DEFAULT ((0)),
	[BoardID] [int] NULL,
	[Title] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[TitleColor] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[Click] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_Click]  DEFAULT ((0)),
	[Reply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_Reply]  DEFAULT ((0)),
	[LastReplyUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[LastReplyUserID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_LastReplyUserID]  DEFAULT ((0)),
	[LastReplyTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_LastReplyTime]  DEFAULT (getdate()),
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[IsTop] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_IsTop]  DEFAULT ((0)),
	[IsGood] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_IsGood]  DEFAULT ((0)),
	[IsLock] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_IsLock]  DEFAULT ((0)),
	[State] [int] NULL,
	[TableNumber] [int] NULL,
	[GroupID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_GroupID]  DEFAULT ((0)),
	[Confirmed] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_TopicRecycle_Confirmed]  DEFAULT ((1)),
	[DeleteType] [int] NULL DEFAULT ((0)),
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_TopicRecycle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_ReplyRecycle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_ReplyRecycle]
CREATE TABLE [dbo].[$TablePrefix_Forum_ReplyRecycle](
	[ID] [int] NOT NULL,
	[BoardID] [int] NULL,
	[TopicID] [int] NULL,
	[IsTopic] [int] NULL,
	[Title] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[TitleColor] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Length] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[EditUser] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[EditTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Floor] [int] NULL,
	[UBB] [int] NULL,
	[VoteID] [int] NULL,
	[State] [int] NULL,
	[TopicState] [int] NULL,
	[LevelID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TeamID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Coin] [int] NULL,
	[AskCoin] [int] NULL,
	[GoodAnswer] [int] NULL,
	[Hide] [int] NULL,
	[BuyUserID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[ReplyUserID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[AnswerContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[TableNumber] [int] NULL DEFAULT ((0)),
	[DeleteType] [int] NULL DEFAULT ((0)),
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_ReplyRecycle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_UploadFace]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_UploadFace]
CREATE TABLE [dbo].[$TablePrefix_Forum_UploadFace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[FileSize] [int] NULL,
	[FileType] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_UploadFace_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_UploadFace] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_UploadFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_UploadFile]
CREATE TABLE [dbo].[$TablePrefix_Forum_UploadFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UploadFile_BoardID]  DEFAULT ((0)),
	[TopicID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UploadFile_TopicID]  DEFAULT ((0)),
	[ReplyID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UploadFile_ReplyID]  DEFAULT ((0)),
	[FileName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[FileSize] [int] NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Types] [int] NULL,
	[FileType] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_UploadFile_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_UploadFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_User]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_User]
CREATE TABLE [dbo].[$TablePrefix_Forum_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserPass] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[PasswordType] [int] NULL  DEFAULT ((0)),
	[Question] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Answer] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Email] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Sex] [int] NULL,
	[Photo] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[PhotoWidth] [int] NULL,
	[PhotoHeight] [int] NULL,
	[NickName] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[Sign] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[LevelID] [int] NULL,
	[LevelType] [int] NULL,
	[TeamID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_TeamID]  DEFAULT ((0)),
	[Coin] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_Coin]  DEFAULT ((0)),
	[Point] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_Point]  DEFAULT ((0)),
	[Topic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_Topic]  DEFAULT ((0)),
	[Reply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_Reply]  DEFAULT ((0)),
	[TopicDel] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_TopicDel]  DEFAULT ((0)),
	[ReplyDel] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_ReplyDel]  DEFAULT ((0)),
	[GoodTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_GoodTopic]  DEFAULT ((0)),
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UploadNum] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_UploadNum]  DEFAULT ((0)),
	[UploadTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_UploadTime]  DEFAULT (getdate()),
	[LoginTime] [datetime] NULL,
	[LoginIP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Message] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[State] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_User_State]  DEFAULT ((0)),
	[RegTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_UserRecycle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_UserRecycle]
CREATE TABLE [dbo].[$TablePrefix_Forum_UserRecycle](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserPass] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[PasswordType] [int] NULL  DEFAULT ((0)),
	[Question] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Answer] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Email] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Sex] [int] NULL,
	[Photo] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[PhotoWidth] [int] NULL,
	[PhotoHeight] [int] NULL,
	[NickName] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[Sign] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[LevelID] [int] NULL,
	[LevelType] [int] NULL,
	[TeamID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_TeamID]  DEFAULT ((0)),
	[Coin] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_Coin]  DEFAULT ((0)),
	[Point] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_Point]  DEFAULT ((0)),
	[Topic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_Topic]  DEFAULT ((0)),
	[Reply] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_Reply]  DEFAULT ((0)),
	[TopicDel] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_TopicDel]  DEFAULT ((0)),
	[ReplyDel] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_ReplyDel]  DEFAULT ((0)),
	[GoodTopic] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_GoodTopic]  DEFAULT ((0)),
	[IP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UploadNum] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_UploadNum]  DEFAULT ((0)),
	[UploadTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_UploadTime]  DEFAULT (getdate()),
	[LoginTime] [datetime] NULL,
	[LoginIP] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Message] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[State] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_UserRecycle_State]  DEFAULT ((0)),
	[RegTime] [datetime] NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_UserRecycle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_UserDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_UserDetail]
CREATE TABLE [dbo].[$TablePrefix_Forum_UserDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RealName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[QQ] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ICQ] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[MSN] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Address] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Mobile] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Phone] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Birthday] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Country] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Province] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[City] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Star] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Blood] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Marry] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Study] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[School] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Introduce] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_$TablePrefix_Forum_UserDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[$TablePrefix_Forum_Vote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[$TablePrefix_Forum_Vote]
CREATE TABLE [dbo].[$TablePrefix_Forum_Vote](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_BoardID]  DEFAULT ((0)),
	[TopicID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_TopicID]  DEFAULT ((0)),
	[ReplyID] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_ReplyID]  DEFAULT ((0)),
	[Title] [nvarchar](250) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Result] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Click] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_Click]  DEFAULT ((0)),
	[Types] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_Types]  DEFAULT ((0)),
	[Days] [int] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_Days]  DEFAULT ((0)),
	[VoteSelect] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[VoteUserID] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[VoteUserName] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[AddTime] [datetime] NULL CONSTRAINT [DF_$TablePrefix_Forum_Vote_AddTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_$TablePrefix_Forum_Vote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em1.gif',1)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em2.gif',2)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em3.gif',3)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em4.gif',4)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em5.gif',5)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em6.gif',6)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em7.gif',7)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em8.gif',8)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em9.gif',9)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em10.gif',10)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em11.gif',11)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em12.gif',12)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em13.gif',13)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em14.gif',14)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em15.gif',15)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em16.gif',16)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em17.gif',17)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em18.gif',18)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em19.gif',19)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em20.gif',20)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em21.gif',21)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em22.gif',22)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em23.gif',23)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em24.gif',24)
insert into $TablePrefix_Forum_Emote (FileName,Orders) values ('emote/em25.gif',25)

insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/1.jpg',1)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/2.jpg',2)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/3.jpg',3)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/4.jpg',4)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/5.jpg',5)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/6.jpg',6)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/7.jpg',7)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/8.jpg',8)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/9.jpg',9)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/10.jpg',10)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/11.jpg',11)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/12.jpg',12)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/13.jpg',13)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/14.jpg',14)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/15.jpg',15)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/16.jpg',16)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/17.jpg',17)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/18.jpg',18)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/boy.jpg',19)
insert into $TablePrefix_Forum_Face (FileName,Orders) values ('userface/girl.jpg',20)

insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('管理员',0,80,1,'|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|','|2|1|2|1|300|1000|1000|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('超级版主',0,48,1,'|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('版主',0,32,2,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('实习版主',0,16,2,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|40|42|47|48|49|50|51|52|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('贵宾',0,16,3,'|1|2|3|4|5|6|7|9|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|5|5|5|5|500|500|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('访客',0,0,4,'|2|4|5|6|7|16|24|37|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('贫穷农民',50,1,5,'|1|2|3|4|5|6|7|9|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('普通工人',200,2,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('蓝领一族',800,3,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('白领阶层',1500,4,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('金领贵族',3000,5,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('企业老板',5000,9,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('资本家',10000,21,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())
insert into $TablePrefix_Forum_Level (LevelName,Point,Photo,Types,Power,StringPower,AddTime) values ('大资本家',20000,44,5,'|1|2|3|4|5|6|7|9|14|16|17|18|19|20|21|22|23|24|25|26|27|28|29|33|34|35|36|37|38|39|','|2|1|2|1|300|300|10|',getdate())

insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('登录','','Login.aspx','_self','#000000',0,1,0,1,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('注册','','Register.aspx','_self','#000000',0,1,0,2,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('忘记密码','','Forgetpassword.aspx','_self','#000000',0,1,0,3,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('用户中心','','ControlPanel.aspx','_self','#000000',0,0,1,4,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('搜索','','Search.aspx','_self','#000000',0,0,0,5,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('会员','','Members.aspx','_self','#000000',0,0,0,6,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('圈子','','Team.aspx','_self','#0000ff',0,0,0,7,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('在线','','UserOnline.aspx','_self','#000000',0,0,0,8,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('论坛模式转换','<SPAN id="ForumMode"></SPAN><SCRIPT language=javascript>var URL=window.top.document.location.href.toLowerCase();var Content="<a href=Frame.aspx?URL=" + location.href + " target=_top>分栏模式</a>";if (URL.indexOf("frame.aspx")>-1){Content="<a href=" + location.href + " target=_top>平板模式</a>";}var obj=document.getElementById("ForumMode");obj.innerHTML=Content;</script>','','_self','#000000',0,0,0,9,2)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('帮助','','http://www.dxbbs.com/help','_self','#000000',0,0,0,10,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('后台管理','','Admin_Index.aspx','_top','#000000',0,0,0,11,1)
insert into $TablePrefix_Forum_Menu (Title,Content,URL,Target,Color,Strong,Disappear,Login,Orders,Types) values ('退出','','Logout.aspx','_self','#000000',0,0,1,12,1)

insert into $TablePrefix_Forum_Template (TemplateName,FilePath,AddTime) values ('默认模板','template/default',getdate())

insert into $TablePrefix_Forum_Skin (TemplateID,SkinName,FilePath,AddTime) values (1,'默认皮肤','template/default/skins/default',getdate())

insert into $TablePrefix_Forum_Status (TotalTopic,TotalReply,TotalMale,TotalFemale,NewUser,ActiveTime) values (0,0,1,0,'admin',getdate())

insert into $TablePrefix_Forum_Table (Orders,Counts) values (1,0)

insert into $TablePrefix_Forum_User (UserName,UserPass,	PasswordType,Question,Answer,Email,Sex,Photo,PhotoWidth,PhotoHeight,NickName,Sign,LevelID,LevelType,TeamID,Coin,Point,Topic,Reply,TopicDel,ReplyDel,GoodTopic,IP,UploadNum,UploadTime,LoginTime,LoginIP,Message,State,RegTime) values ('admin','7a57a5a743894a0e',1,'','','',1,'userface/boy.jpg',88,110,'','',1,1,0,0,0,0,0,0,0,0,'127.0.0.1',0,getdate(),getdate(),'127.0.0.1','',0,getdate())