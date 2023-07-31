USE [db_Getgo]
GO
/****** Object:  Table [dbo].[TBL_M_USER_MASTER]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_M_USER_MASTER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [nvarchar](50) NULL,
	[FIRST_NAME] [nvarchar](50) NULL,
	[MIDDLE_NAME] [nvarchar](50) NULL,
	[LAST_NAME] [nvarchar](50) NULL,
	[EXTENSION_NAME] [nvarchar](50) NULL,
	[AGE] [int] NULL,
	[DATE_OF_BIRTH] [datetime] NULL,
	[SEX] [nvarchar](50) NULL,
	[MARITAL_STATUS] [nvarchar](50) NULL,
	[SPOUSE_NAME] [nvarchar](50) NULL,
	[USERNAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](50) NULL,
	[EMAIL_ADDRESS] [nvarchar](50) NULL,
	[CONTACTNO] [nvarchar](12) NULL,
	[COMPANY_NAME] [nvarchar](50) NULL,
	[REGION] [nvarchar](50) NULL,
	[PROVINCE] [nvarchar](50) NULL,
	[CITY] [nvarchar](50) NULL,
	[BARANGAY] [nvarchar](50) NULL,
	[STREET_NO] [nvarchar](50) NULL,
	[ZIPCODE] [nvarchar](50) NULL,
	[BUSSINESS_NAME] [nvarchar](50) NULL,
	[NATURE_OF_WORK] [nvarchar](50) NULL,
	[MONTHLY_GROSS] [int] NULL,
	[CHARACTER_REFERENCE] [nvarchar](50) NULL,
	[CO_GUARANTOR_NAME] [nvarchar](50) NULL,
	[CO_GUARANTOR_NUMBER] [nvarchar](50) NULL,
	[CREATED_BY] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[UPDATED_BY] [nvarchar](50) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[DELETE_FLAG] [int] NULL,
	[ACTIVE_FLAG] [int] NULL,
 CONSTRAINT [PK_TBL_M_USER_MASTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_M_USER_MASTER_ACCESS]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_M_USER_MASTER_ACCESS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [nvarchar](50) NULL,
	[ACCESS_ID] [int] NULL,
	[CREATED_BY] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[UPDATED_BY] [nvarchar](50) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[DELETE_FLAG] [int] NULL,
	[ACTIVE_FLAG] [int] NULL,
 CONSTRAINT [PK_TBL_M_USER_MASTER_ACCESS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_UPDATE]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_PROFILE_UPDATE]
@ACTION			NVARCHAR(50),
@USER_ID		NVARCHAR(50)=NULL,
@FIRST_NAME		NVARCHAR(50)=NULL,
@MIDDLE_NAME	NVARCHAR(50)=NULL,
@LAST_NAME		NVARCHAR(50)=NULL,
@DATE_OF_BIRTH	NVARCHAR(50)=NULL,
@SEX			NVARCHAR(50)=NULL,
@MARITAL_STATUS	NVARCHAR(50)=NULL,
@EMAIL_ADDRESS	NVARCHAR(50)=NULL,
@CONTACTNO		NVARCHAR(50)=NULL,
@REGION			NVARCHAR(50)=NULL,
@PROVINCE		NVARCHAR(50)=NULL,
@CITY			NVARCHAR(50)=NULL,
@BARANGAY		NVARCHAR(50)=NULL,
@STREET_NO		NVARCHAR(50)=NULL,
@ZIPCODE		NVARCHAR(50)=NULL


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @ACTION='PRIMARY'
BEGIN
UPDATE TBL_M_USER_MASTER	

SET 
FIRST_NAME		=@FIRST_NAME	,	
MIDDLE_NAME		=@MIDDLE_NAME	,
LAST_NAME		=@LAST_NAME		,
DATE_OF_BIRTH	=@DATE_OF_BIRTH	,
SEX				=@SEX			,
CONTACTNO = @CONTACTNO,
MARITAL_STATUS	=@MARITAL_STATUS 
WHERE USER_ID =@USER_ID
END
IF @ACTION='SECONDARY'
BEGIN
UPDATE TBL_M_USER_MASTER 

SET 
REGION		=@REGION	,		
PROVINCE	=@PROVINCE	,	
CITY		=@CITY		,	
BARANGAY	=@BARANGAY	,	
STREET_NO	=@STREET_NO	,	
ZIPCODE		=@ZIPCODE		
WHERE USER_ID =@USER_ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[APP_SIGNUP]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_SIGNUP]
@ACTION NVARCHAR(50),
@USERNAME NVARCHAR(50)=NULL,
@PHONENUMBER INT = NULL,
@PASSWORD NVARCHAR(50)=NULL,
@EMAIL NVARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--DECLARE	@ACTION NVARCHAR(50)='CHECK_EXIST';
--DECLARE	@USERNAME NVARCHAR(50)='dsfsdfds';
--DECLARE	@PASSWORD NVARCHAR(50)='123';
--DECLARE	@EMAIL NVARCHAR(50) = 'naragmaji@gmail.com';
  IF @ACTION= 'CHECK_EXIST'
  BEGIN
  SELECT
            COALESCE((SELECT '1' FROM TBL_M_USER_MASTER WHERE USERNAME = @USERNAME), '0') AS USERNAME,
            COALESCE((SELECT '1' FROM TBL_M_USER_MASTER WHERE EMAIL_ADDRESS = @EMAIL), '0') AS EMAIL,
			COALESCE((SELECT '1' FROM TBL_M_USER_MASTER WHERE CONTACTNO = @PHONENUMBER), '0') AS PHONENUMBER
  END
  ELSE IF @ACTION= 'INSERT'
  BEGIN
  DECLARE @Prefix NVARCHAR(3) = 'APP';
        DECLARE @CurrentDate NVARCHAR(6) = CONVERT(NVARCHAR(6), GETDATE(), 12);
        DECLARE @Sequence INT = 1;
        DECLARE @GeneratedUserID NVARCHAR(20);

        SET @GeneratedUserID = @Prefix + @CurrentDate + RIGHT('000' + CAST(@Sequence AS NVARCHAR(3)), 3);

        WHILE EXISTS (SELECT 1 FROM TBL_M_USER_MASTER WHERE USER_ID = @GeneratedUserID)
        BEGIN
            SET @Sequence += 1;
            SET @GeneratedUserID = @Prefix + @CurrentDate + RIGHT('000' + CAST(@Sequence AS NVARCHAR(3)), 3);
        END

        INSERT INTO TBL_M_USER_MASTER (USER_ID, USERNAME, CONTACTNO, PASSWORD, EMAIL_ADDRESS)
        VALUES (@GeneratedUserID, @USERNAME, @PHONENUMBER, @PASSWORD, @EMAIL);
  END

END
GO
/****** Object:  StoredProcedure [dbo].[APP_USER_GET]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[APP_USER_GET]
@USERNAME NVARCHAR(50)=null,
@PASSWORD NVARCHAR(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT USER_ID,LAST_NAME +','+ FIRST_NAME AS FULL_NAME FROM TBL_M_USER_MASTER WHERE USERNAME= @USERNAME  AND PASSWORD=@PASSWORD
END
GO
/****** Object:  StoredProcedure [dbo].[APP_USER_PROFILE_GET]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_USER_PROFILE_GET]
@USER_ID NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT * FROM TBL_M_USER_MASTER WHERE USER_ID=@USER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_APP_SIGNUP_CREATE_OR_UPDATE]    Script Date: 31/07/2023 10:34:10 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_APP_SIGNUP_CREATE_OR_UPDATE]
	@USERNAME NVARCHAR(50),
	@EMAIL NVARCHAR(50),
	@PHONENUMBER INT,
	@PASSWORD NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO TBL_M_USER_MASTER (USERNAME,EMAIL_ADDRESS,CONTACTNO,PASSWORD) VALUES(@USERNAME,@EMAIL,@PHONENUMBER,@PASSWORD)
END
GO
