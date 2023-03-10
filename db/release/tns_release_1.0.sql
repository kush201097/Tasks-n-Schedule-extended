USE [tasknschedule]
GO

/****** Object:  Table [dbo].[attachment]    Script Date: 20-01-2023 13:32:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS attachment;
CREATE TABLE [dbo].[attachment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskid] [varchar](50) NOT NULL,
	[filepath] [varchar](50) NOT NULL,
	[userid] [int] NOT NULL,
	[commentid] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL,
	[creationdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS avtar;
CREATE TABLE [dbo].[avtar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagepath] [varchar](50) NULL,
	[defaultpath] [varchar](50) NOT NULL,
	[userid] [int] NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS comment;
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[taskid] [int] NOT NULL,
	[description] [varchar](256) NOT NULL,
	[status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS email;
CREATE TABLE [dbo].[email](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[useremail] [varchar](100) NOT NULL,
	[htmlbody] [varchar](512) NOT NULL,
	[status] [tinyint] NOT NULL,
	[emailtype] [varchar](50) NOT NULL,
	[sentdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS license;
CREATE TABLE [dbo].[license](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orgid] [int] NOT NULL,
	[licensekey] [varchar](50) NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[expirydate] [datetime] NOT NULL,
	[isactive] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS module;
CREATE TABLE [dbo].[module](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[projectid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS organization;
CREATE TABLE [dbo].[organization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orgname] [varchar](50) NOT NULL,
	[orgdomain] [varchar](50) NOT NULL,
	[industrytype] [varchar](50) NULL,
	[contactemail] [varchar](50) NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
	[parentorgid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[organization] ADD  DEFAULT ((0)) FOR [parentorgid]
GO

DROP TABLE IF EXISTS project;
CREATE TABLE [dbo].[project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[orgid] [int] NOT NULL,
	[techstack] varchar(256),
	[ishavingmodule] [tinyint] NOT NULL,
	[createdby] [int] NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[modifiedby] [int] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS sprint;
CREATE TABLE [dbo].[sprint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[projectid] [int] NOT NULL,
	[versionid] [int] NOT NULL,
	[issprintreportsent] [tinyint] NOT NULL,
	[sprintstartdate] [datetime] NOT NULL,
	[sprintenddate] [datetime] NOT NULL,
	[createdby] [int] NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[modifiedby] [int] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[sprint] ADD  DEFAULT ((0)) FOR [issprintreportsent]
GO

DROP TABLE IF EXISTS sprint_email_audit;
CREATE TABLE [dbo].[sprint_email_audit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[useremail] [varchar](100) NOT NULL,
	[sprintid] [int] NOT NULL,
	[htmlbody] [varchar](512) NOT NULL,
	[sendby] [varchar](100) NOT NULL,
	[sentdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[sprint_email_audit] ADD  DEFAULT ((0)) FOR [sendby]
GO

DROP TABLE IF EXISTS task;
CREATE TABLE [dbo].[task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [varchar](256) NOT NULL,
	[typeid] [tinyint] NOT NULL,
	[statusid] [tinyint] NOT NULL,
	[priorityid] [tinyint] NOT NULL,
	[linktaskid] [int] NOT NULL,
	[projectid] [int] NOT NULL, 
	[moduleid] [int] NOT NULL,
	[storypoint] [int] NOT NULL,
	[createdby] [int] NOT NULL,
	[creationdate] [datetime] NULL,
	[modifiedby] [int] NOT NULL,
	[modifieddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS task_sprint;
CREATE TABLE [dbo].[task_sprint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sprintid] [int] NOT NULL,
	[taskid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS task_user;
CREATE TABLE [dbo].[task_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskid] [int] NOT NULL,
	[assignee] [int] NOT NULL,
	[reporter] [int] NOT NULL,
	[qacontact] [int] NOT NULL,
	[developercontact] [int] NOT NULL,
	[modifiedby] [int] NOT NULL,
	[modifieddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS taskpriority;
CREATE TABLE [dbo].[taskpriority](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS taskstatus;
CREATE TABLE [dbo].[taskstatus](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS tasktype;
CREATE TABLE [dbo].[tasktype](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS userroles;
CREATE TABLE [dbo].[userroles](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[roledescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS users;
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[orgid] [int] NOT NULL,
	[roleid] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[createdby] [int] NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[modifiedby] [int] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS version;
CREATE TABLE [dbo].[version](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[projectid] [int] NOT NULL,
	[versionstartdate] [datetime] NOT NULL,
	[versionenddate] [datetime] NOT NULL,
	[createdby] [int] NOT NULL,
	[creationdate] [datetime] NOT NULL,
	[modifiedby] [int] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS project_user;
CREATE TABLE [dbo].[project_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[projectid] [int] NOT NULL,
	[moduleid] [int] NOT NULL,
	[status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO