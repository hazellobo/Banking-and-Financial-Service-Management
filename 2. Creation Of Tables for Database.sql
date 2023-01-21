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

-- Creation of Tables for our Database Implementation

--Create database
IF NOT EXISTS (SELECT * FROM sys.databases where name='BankManagementGroup13')
BEGIN
	CREATE DATABASE BankManagementGroup13;
END;
GO
USE BankManagementGroup13;

--Table Branch
GO
CREATE TABLE BankBranch(
    BranchCode INT NOT NULL PRIMARY KEY,
    BranchName VARCHAR(20) NOT NULL,
	PhoneNumber CHAR(10) NOT NULL CHECK (PhoneNumber like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Email VARCHAR(50) NOT NULL,
    [Address] VARCHAR(50) NOT NULL,
    City VARCHAR(10) NOT NULL,
    [State] VARCHAR(15) NOT NULL,
	ZipCode CHAR(5) NOT NULL CHECK (ZipCode like '[0-9][0-9][0-9][0-9][0-9]')
);
GO
-- Table Person
CREATE TABLE Person(
    PersonID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    SSN VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
	PhoneNumber CHAR(10) NOT NULL,
    [Address] VARCHAR(MAX) NOT NULL,
    City VARCHAR(20) NOT NULL,
	[State] VARCHAR(15) NOT NULL,
	ZipCode CHAR(5) NOT NULL
);
GO
--Table Employee Type
CREATE TABLE EmployeeType(
    EmployeeTypeID INT NOT NULL PRIMARY KEY,
    [Type] VARCHAR(50) NOT NULL
);
GO
--Table Employee
CREATE TABLE Employee(
    EmployeeID INT NOT NULL PRIMARY KEY,
    EmployeeTypeID INT NOT NULL, 
    BranchCode INT NOT NULL, 
    PersonID INT NOT NULL, 
	CONSTRAINT FK_EmployeeTypeID FOREIGN KEY(EmployeeTypeID) REFERENCES EmployeeType(EmployeeTypeID),
	CONSTRAINT FK_BranchCode FOREIGN KEY(BranchCode) REFERENCES BankBranch(BranchCode),
	CONSTRAINT FK_PersonID FOREIGN KEY(PersonID) REFERENCES Person(PersonID)
);
GO
--Table Customer Data
CREATE TABLE CustomerData(
    CustomerID INT NOT NULL PRIMARY KEY,
    PersonID INT NOT NULL,
	CONSTRAINT FK_PersonID_CustomerData FOREIGN KEY(PersonID) REFERENCES Person(PersonID)
);
GO
--Table Customer Financial History
CREATE TABLE CustomerFinancialHistory(
    FinancialHistoryID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    CreditScore INT,
    LastUpdatedTime DATE,
	CONSTRAINT FK_CustomerID_CustomerFinancialHistory FOREIGN KEY(CustomerID) REFERENCES CustomerData(CustomerID)
);
GO
--Table Account
CREATE TABLE Account(
    AccountID INT NOT NULL PRIMARY KEY,
    BranchCode INT,
    CustomerID INT,
    CreatedByEmployee INT,
    AccountType VARCHAR(10),
    Balance MONEY DEFAULT 0.0,
	CONSTRAINT FK_BranchCode_Account FOREIGN KEY(BranchCode) REFERENCES BankBranch(BranchCode),
	CONSTRAINT FK_CustomerID_Account FOREIGN KEY(CustomerID) REFERENCES CustomerData(CustomerID),
	CONSTRAINT FK_CreatedByEmployee_Account FOREIGN KEY(CreatedByEmployee) REFERENCES Employee(EmployeeID)
);
GO
--Insurance Type
CREATE TABLE InsuranceType(
    InsuranceTypeID INT PRIMARY KEY,
    InsuranceName VARCHAR(30),
    InsuranceDescription VARCHAR(50)
);
GO
--Table Insurance
CREATE TABLE Insurance(
    InsuranceID INT NOT NULL PRIMARY KEY,
    AccountID INT NOT NULL,
    InsuranceTypeID INT NOT NULL,
    ApprovedByEmployee INT NOT NULL,
    InsuranceAmount MONEY,
    InsurancePayment MONEY DEFAULT 0.0,
    InsuranceClaimed MONEY DEFAULT 0.0,
    InsuranceIssuedDate DATE,
    RecentClaimDate DATE,
    RecentInsurancePaymentDate DATE,
	CONSTRAINT FK_AccountID_Insurance FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT FK_ApprovedByEmployee_Insurance FOREIGN KEY(ApprovedByEmployee) REFERENCES Employee(EmployeeID),
	CONSTRAINT FK_InsuranceTypeID_Insurance FOREIGN KEY(InsuranceTypeID) REFERENCES InsuranceType(InsuranceTypeID)
);

GO
--Table Loan Type
CREATE TABLE LoanType(
    LoanTypeID INT PRIMARY KEY,
    LoanType VARCHAR(30),
    LoanDescription VARCHAR(50)
);
GO
--Table Loan
CREATE TABLE Loan(
    LoanID INT NOT NULL PRIMARY KEY,
    AccountID INT NOT NULL,
    LoanTypeID INT NOT NULL,
	ApprovedByEmployee INT NOT NULL,
    LoanAmount MONEY DEFAULT 0.0,
    LoanPaid MONEY DEFAULT 0.0,
    RecentPaymentDate DATE,
    LoanDisbursed MONEY,
    RecentDisbursementDate DATE,
	CONSTRAINT FK_AccountID_Loan FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT FK_ApprovedBY_Loan FOREIGN KEY(ApprovedByEmployee) REFERENCES Employee(EmployeeID),
	CONSTRAINT FK_LoanTypeID_Loan FOREIGN KEY(LoanTypeID) REFERENCES LoanType(LoanTypeID)
);
GO
-- This table stores the different credit card providers such as Visa, Mastercard and so on
CREATE TABLE CardProvider(
    CardProviderID INT PRIMARY KEY,
    Name VARCHAR(20)
);
GO
--Card Types
CREATE TABLE CardType(
    CardTypeID INT PRIMARY KEY,
    Type VARCHAR(20),
    CardDescription VARCHAR(MAX)
);
GO
--Card
CREATE TABLE Card(
    CardID INT PRIMARY KEY,
    AccountID INT,
    CardTypeID INT,
    ApprovedBY INT,
    CardProviderID INT,
    Balance MONEY,
    Status VARCHAR(10),
    InterestRate FLOAT,
	CONSTRAINT FK_AccountID_Card FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
    CONSTRAINT FK_CardTypeID_Card FOREIGN KEY(CardTypeID) REFERENCES CardType(CardTypeID),
    CONSTRAINT FK_ApprovedBY_Card FOREIGN KEY(ApprovedBY) REFERENCES Employee(EmployeeID),
    CONSTRAINT FK_CardProviderID_Card FOREIGN KEY(CardProviderID) REFERENCES CardProvider(CardProviderID),
);
GO
--Stores all types of transactions
CREATE TABLE TransactionType(
    TransactionTypeID INT NOT NULL PRIMARY KEY,
    TransactionDescription VARCHAR(50)
);
GO
-- Transaction Table
CREATE TABLE TransactionTable(
    TransactionID INT IDENTITY PRIMARY KEY,
    TransactionTypeID INT,
    AccountID INT,
    CardID INT,
    InsuranceID INT,
    LoanID INT,
    BeneficiaryAccountID INT,
    PaymentDate DATE,
    TransactionAmount MONEY,
	CONSTRAINT FK_TransactionTypeID  FOREIGN KEY(TransactionTypeID) REFERENCES TransactionType(TransactionTypeID),
    CONSTRAINT FK_AccountID  FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
    CONSTRAINT FK_CardID  FOREIGN KEY(CardID) REFERENCES Card(CardID),
    CONSTRAINT FK_InsuranceID  FOREIGN KEY(InsuranceID) REFERENCES Insurance(InsuranceID),
    CONSTRAINT FK_LoanID  FOREIGN KEY(LoanID) REFERENCES Loan(LoanID),
    CONSTRAINT FK_BeneficiaryAccountID  FOREIGN KEY(BeneficiaryAccountID) REFERENCES Account(AccountID),
);

