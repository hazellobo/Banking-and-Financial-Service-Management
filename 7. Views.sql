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


-- VIEW 1
-- View to show the number of Services in each Bank Branch
USE BankManagementGroup13;
GO
CREATE OR ALTER VIEW BankBranchVSServicesTaken AS
SELECT temp1.*, temp2.NumLoanTaker, temp3.NumCardTaker FROM 
((SELECT bb.BranchCode,  COUNT(DISTINCT i.InsuranceID)[NumInsauranceTaker] 
FROM dbo.BankBranch bb JOIN dbo.Account a ON bb.BranchCode = a.BranchCode 
LEFT JOIN dbo.Insurance i ON a.AccountID = i.AccountID 
group by bb.BranchCode) temp1 
JOIN 
(SELECT bb.BranchCode,  COUNT(DISTINCT l.LoanID)[NumLoanTaker] 
FROM dbo.BankBranch bb JOIN dbo.Account a ON bb.BranchCode = a.BranchCode 
JOIN dbo.Loan l ON a.AccountID = l.AccountID 
group by bb.BranchCode) temp2 ON temp1.BranchCode = temp2.BranchCode 
JOIN 
(SELECT bb.BranchCode, COUNT(DISTINCT c.CardID)[NumCardTaker] 
FROM dbo.BankBranch bb JOIN dbo.Account a ON bb.BranchCode = a.BranchCode 
LEFT JOIN dbo.Card c ON a.AccountID = c.AccountID 
group by bb.BranchCode) temp3 ON temp2.BranchCode = temp3.BranchCode );
GO
SELECT * FROM [BankBranchVSServicesTaken];




--VIEW 2
--View to Categorize customers Account holders into Minor, Senior and Adult
GO
OPEN SYMMETRIC KEY user_Key_1 DECRYPTION BY CERTIFICATE usercert;
GO
CREATE OR ALTER VIEW AccountHolderCategories AS
SELECT AgeGroup, COUNT(AgeGroup)[NumCustomers] FROM
(select distinct C.CustomerID,
CASE 
WHEN datediff( YY, CONVERT(varchar, DecryptByKey(DateOfBirth_encrypt)), getdate()) BETWEEN 18 AND 59 THEN 'Adult' 
WHEN datediff( YY, CONVERT(varchar, DecryptByKey(DateOfBirth_encrypt)) , getdate()) > 60 THEN 'Senior'
ELSE 'Minor'
END AS AgeGroup
from Account A JOIN CustomerData C ON A.CustomerID = C.CustomerID 
JOIN PERSON P ON P.PersonID = C.PersonID) temp
GROUP BY AgeGroup;
GO
select * from AccountHolderCategories;

