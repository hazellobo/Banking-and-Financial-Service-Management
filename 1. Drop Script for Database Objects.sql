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

USE [BankManagementGroup13]
GO
ALTER TABLE [dbo].[TransactionTable] DROP CONSTRAINT FK_TransactionTypeID
GO
ALTER TABLE [dbo].[TransactionTable] DROP CONSTRAINT FK_AccountID
GO
ALTER TABLE [dbo].[TransactionTable] DROP CONSTRAINT FK_CardID
GO
ALTER TABLE [dbo].[TransactionTable] DROP CONSTRAINT FK_InsuranceID
GO
ALTER TABLE [dbo].[TransactionTable] DROP CONSTRAINT FK_BeneficiaryAccountID
GO
ALTER TABLE [dbo].[TransactionTable] DROP CONSTRAINT FK_LoanID
GO
ALTER TABLE [dbo].[Loan] DROP CONSTRAINT FK_AccountID_Loan
GO
ALTER TABLE [dbo].[Loan] DROP CONSTRAINT FK_ApprovedBY_Loan
GO
ALTER TABLE [dbo].[Loan] DROP CONSTRAINT FK_LoanTypeID_Loan
GO
ALTER TABLE [dbo].[Insurance] DROP CONSTRAINT FK_AccountID_Insurance
GO
ALTER TABLE [dbo].[Insurance] DROP CONSTRAINT FK_ApprovedByEmployee_Insurance
GO
ALTER TABLE [dbo].[Insurance] DROP CONSTRAINT FK_InsuranceTypeID_Insurance
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT FK_EmployeeTypeID
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT FK_BranchCode
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT FK_PersonID
GO
ALTER TABLE [dbo].[CustomerFinancialHistory] DROP CONSTRAINT FK_CustomerID_CustomerFinancialHistory
GO
ALTER TABLE [dbo].[CustomerData] DROP CONSTRAINT FK_PersonID_CustomerData
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT FK_AccountID_Card
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT FK_CardTypeID_Card
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT FK_ApprovedBY_Card
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT FK_CardProviderID_Card
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT FK_BranchCode_Account
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT FK_CustomerID_Account
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT FK_CreatedByEmployee_Account
GO
DROP PROCEDURE [dbo].[PerformTransactions]
GO
DROP PROCEDURE [dbo].[MakeTransactionFromAccountToAccount]
GO
DROP TRIGGER [dbo].[UpdateAccountAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransactionType]') AND type in (N'U'))
DROP TABLE [dbo].[TransactionType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransactionTable]') AND type in (N'U'))
DROP TABLE [dbo].[TransactionTable]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
DROP TABLE [dbo].[Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanType]') AND type in (N'U'))
DROP TABLE [dbo].[LoanType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Loan]') AND type in (N'U'))
DROP TABLE [dbo].[Loan]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsuranceType]') AND type in (N'U'))
DROP TABLE [dbo].[InsuranceType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insurance]') AND type in (N'U'))
DROP TABLE [dbo].[Insurance]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeType]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFinancialHistory]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerFinancialHistory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerData]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CardType]') AND type in (N'U'))
DROP TABLE [dbo].[CardType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CardProvider]') AND type in (N'U'))
DROP TABLE [dbo].[CardProvider]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Card]') AND type in (N'U'))
DROP TABLE [dbo].[Card]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankBranch]') AND type in (N'U'))
DROP TABLE [dbo].[BankBranch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
DROP VIEW [dbo].[BankBranchVSServicesTaken]
GO
DROP VIEW [dbo].[AccountHolderCategories]
GO
DROP FUNCTION [dbo].[isPersonRegistered]
GO
DROP FUNCTION [dbo].[calculateCreditScoreStatus]
GO
DROP SYMMETRIC KEY user_Key_1;
GO
DROP CERTIFICATE usercert;
GO
DROP MASTER KEY;
GO
USE [master]
GO
DROP DATABASE [BankManagementGroup13]
GO
