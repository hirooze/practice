USE [test]
GO

UPDATE [dbo].[TEST_T]
   SET [ID] = 1
      ,[NAME] = 'test222'
      ,[DATE] = '2021/11/25'
 WHERE ID=1
GO