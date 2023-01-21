/* Group 13
INFO 6210 Database Management and Database Design
P4
Submitted by 
Sree Achyutha Penmetcha             NUID : 002960283
Ankita Kumari                       NUID : 002929668
Hazel Lobo                          NUID : 001001740
Sanjana Chatti                      NUID : 002105435
Vachana Belgavi                     NUID : 002101078
*/

USE BankManagementGroup13;

--COMPUTE COLUMN BASED ON A FUNCTION
--Calculate Credit Score Status Column from CustomerID
GO
--Table before column computation
SELECT * FROM CustomerFinancialHistory;
GO


CREATE FUNCTION calculateCreditScoreStatus(@CustomerID INT)
RETURNS varchar(12)
AS
   BEGIN

   DECLARE @CreditScore as INT
   DECLARE @Status as VARCHAR(12)

   SELECT @CreditScore = CreditScore FROM CustomerFinancialHistory C
   WHERE C.CustomerID = @CustomerID

   IF @CreditScore BETWEEN 300 AND 579
		SET @Status = 'Poor'
   ELSE IF @CreditScore BETWEEN 580 AND 669
		SET @Status = 'Fair'
   ELSE IF @CreditScore BETWEEN 670 AND 739
		SET @Status = 'Good'
   ELSE IF @CreditScore BETWEEN 740 AND 799
		SET @Status = 'Very Good'
   ELSE IF @CreditScore BETWEEN 800 AND 850
		SET @Status = 'Exceptional'
   
   RETURN @Status
   END
GO   

--Adding Column to track Credit Status
ALTER TABLE dbo.CustomerFinancialHistory
ADD [Status] AS (dbo.calculateCreditScoreStatus(CustomerID));
GO
--Table after column Computation
SELECT * FROM CustomerFinancialHistory;


--Droping Column and Function
ALTER TABLE dbo.CustomerFinancialHistory DROP COLUMN [Status];
GO
DROP FUNCTION calculateCreditScoreStatus;




--TABLE-LEVEL CONSTRAINT FUNCTION 
--Added a Constraint to not allow a person with the same Name and SSN to register
GO
CREATE FUNCTION isPersonRegistered(@firstName VARCHAR(20), @lastName VARCHAR(20), @SSN VARCHAR(50))
RETURNS SMALLINT
AS
BEGIN
   DECLARE @COUNT SMALLINT=0;

   SELECT @COUNT = COUNT(PersonID) FROM Person
   WHERE FirstName = @firstName AND LastName = @lastName AND SSN = @SSN;

   RETURN @COUNT;

END
GO

--Added a constraint
ALTER TABLE Person WITH NOCHECK ADD CONSTRAINT checkRegisteredPerson
CHECK (dbo.isPersonRegistered(FirstName, LastName, SSN) = 0);
GO

--TEST CASES
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [DateOfBirth], [SSN], [Email], [PhoneNumber], [Address], [City], [State], [ZipCode]) VALUES
(180, 'Liam', 'Ira', CAST('1960-01-20' AS Date), '8776598', 'liamiran@gmail.com', '4133211531', 'Mcgreevey Way', 'Boston', 'MA', '02120');


--Dropping constraint and function
ALTER TABLE PERSON DROP CONSTRAINT checkRegisteredPerson;
GO
DROP FUNCTION isPersonRegistered;