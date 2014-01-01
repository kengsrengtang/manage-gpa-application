
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/01/2014 16:29:37
-- Generated from EDMX file: C:\Users\Dil Kuwor\Documents\GitHub\manage-gpa-application\GPA\GPA\Models\GPAModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GPA_DB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserFeedback]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Feedbacks] DROP CONSTRAINT [FK_UserFeedback];
GO
IF OBJECT_ID(N'[dbo].[FK_UserStudent_GPA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Student_GPA] DROP CONSTRAINT [FK_UserStudent_GPA];
GO
IF OBJECT_ID(N'[dbo].[FK_Student_GPACourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Student_GPA] DROP CONSTRAINT [FK_Student_GPACourse];
GO
IF OBJECT_ID(N'[dbo].[FK_GradeStudent_GPA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Student_GPA] DROP CONSTRAINT [FK_GradeStudent_GPA];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_UserUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_RoleUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleTask_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoleTask] DROP CONSTRAINT [FK_RoleTask_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleTask_Task]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoleTask] DROP CONSTRAINT [FK_RoleTask_Task];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserDetails]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserUserDetails];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[Feedbacks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Feedbacks];
GO
IF OBJECT_ID(N'[dbo].[Grades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grades];
GO
IF OBJECT_ID(N'[dbo].[UserDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserDetails];
GO
IF OBJECT_ID(N'[dbo].[Student_GPA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Student_GPA];
GO
IF OBJECT_ID(N'[dbo].[UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRoles];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Tasks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tasks];
GO
IF OBJECT_ID(N'[dbo].[RoleTask]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleTask];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [VerificationCode] nvarchar(max)  NULL,
    [UserDetail_UserDetail_ID] int  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SubCode] nvarchar(max)  NOT NULL,
    [Level] nvarchar(max)  NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [Credit] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Feedbacks'
CREATE TABLE [dbo].[Feedbacks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Grades'
CREATE TABLE [dbo].[Grades] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GradeScore] nvarchar(max)  NOT NULL,
    [GPA] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserDetails'
CREATE TABLE [dbo].[UserDetails] (
    [Email] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [State] nvarchar(max)  NULL,
    [Zip] nvarchar(max)  NULL,
    [Status] int  NULL,
    [UserDetail_ID] int  NOT NULL
);
GO

-- Creating table 'Student_GPA'
CREATE TABLE [dbo].[Student_GPA] (
    [UserId] int  NOT NULL,
    [CourseId] int  NOT NULL,
    [GradeId] int  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] bit  NOT NULL,
    [UserId] int  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tasks'
CREATE TABLE [dbo].[Tasks] (
    [TaskId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RoleTask'
CREATE TABLE [dbo].[RoleTask] (
    [Roles_Id] int  NOT NULL,
    [Tasks_TaskId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Feedbacks'
ALTER TABLE [dbo].[Feedbacks]
ADD CONSTRAINT [PK_Feedbacks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Grades'
ALTER TABLE [dbo].[Grades]
ADD CONSTRAINT [PK_Grades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserDetail_ID] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [PK_UserDetails]
    PRIMARY KEY CLUSTERED ([UserDetail_ID] ASC);
GO

-- Creating primary key on [UserId], [CourseId] in table 'Student_GPA'
ALTER TABLE [dbo].[Student_GPA]
ADD CONSTRAINT [PK_Student_GPA]
    PRIMARY KEY CLUSTERED ([UserId], [CourseId] ASC);
GO

-- Creating primary key on [Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [TaskId] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [PK_Tasks]
    PRIMARY KEY CLUSTERED ([TaskId] ASC);
GO

-- Creating primary key on [Roles_Id], [Tasks_TaskId] in table 'RoleTask'
ALTER TABLE [dbo].[RoleTask]
ADD CONSTRAINT [PK_RoleTask]
    PRIMARY KEY CLUSTERED ([Roles_Id], [Tasks_TaskId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Feedbacks'
ALTER TABLE [dbo].[Feedbacks]
ADD CONSTRAINT [FK_UserFeedback]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserFeedback'
CREATE INDEX [IX_FK_UserFeedback]
ON [dbo].[Feedbacks]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Student_GPA'
ALTER TABLE [dbo].[Student_GPA]
ADD CONSTRAINT [FK_UserStudent_GPA]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CourseId] in table 'Student_GPA'
ALTER TABLE [dbo].[Student_GPA]
ADD CONSTRAINT [FK_Student_GPACourse]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Student_GPACourse'
CREATE INDEX [IX_FK_Student_GPACourse]
ON [dbo].[Student_GPA]
    ([CourseId]);
GO

-- Creating foreign key on [GradeId] in table 'Student_GPA'
ALTER TABLE [dbo].[Student_GPA]
ADD CONSTRAINT [FK_GradeStudent_GPA]
    FOREIGN KEY ([GradeId])
    REFERENCES [dbo].[Grades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GradeStudent_GPA'
CREATE INDEX [IX_FK_GradeStudent_GPA]
ON [dbo].[Student_GPA]
    ([GradeId]);
GO

-- Creating foreign key on [UserId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserUserRole]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRole'
CREATE INDEX [IX_FK_UserUserRole]
ON [dbo].[UserRoles]
    ([UserId]);
GO

-- Creating foreign key on [RoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_RoleUserRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleUserRole'
CREATE INDEX [IX_FK_RoleUserRole]
ON [dbo].[UserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [Roles_Id] in table 'RoleTask'
ALTER TABLE [dbo].[RoleTask]
ADD CONSTRAINT [FK_RoleTask_Role]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tasks_TaskId] in table 'RoleTask'
ALTER TABLE [dbo].[RoleTask]
ADD CONSTRAINT [FK_RoleTask_Task]
    FOREIGN KEY ([Tasks_TaskId])
    REFERENCES [dbo].[Tasks]
        ([TaskId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleTask_Task'
CREATE INDEX [IX_FK_RoleTask_Task]
ON [dbo].[RoleTask]
    ([Tasks_TaskId]);
GO

-- Creating foreign key on [UserDetail_UserDetail_ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserUserDetails]
    FOREIGN KEY ([UserDetail_UserDetail_ID])
    REFERENCES [dbo].[UserDetails]
        ([UserDetail_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserDetails'
CREATE INDEX [IX_FK_UserUserDetails]
ON [dbo].[Users]
    ([UserDetail_UserDetail_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------