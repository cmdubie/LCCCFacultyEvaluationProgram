CREATE TABLE [dbo].[COMMENT] (
    [CommentID]       INT           IDENTITY (1, 1) NOT NULL,
    [ClassNum]        INT           NOT NULL,
    [Term]            INT           NOT NULL,
    [StudentComments] VARCHAR (1024) NOT NULL,
    PRIMARY KEY CLUSTERED ([CommentID] ASC, [Term] ASC, [ClassNum] ASC)
);

