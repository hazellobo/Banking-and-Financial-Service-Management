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
-- Insurance Type
INSERT INTO dbo.InsuranceType VALUES (1, 'Life Insurance', 'This is a Life Insurance');
INSERT INTO dbo.InsuranceType VALUES (2, 'Health Insurance', 'This is a Health Insurance');
INSERT INTO dbo.InsuranceType VALUES (3, 'Renters Insurance', 'This is a Renters Insurance');
INSERT INTO dbo.InsuranceType VALUES (4, 'Disability Insurance', 'This is a Disability Insurance');
INSERT INTO dbo.InsuranceType VALUES (5, 'Long Term Care Insurance', 'This is a Long term Insurance');
INSERT INTO dbo.InsuranceType VALUES (6, 'Auto Insurance', 'This is a Auto Insurance');
INSERT INTO dbo.InsuranceType VALUES (7, 'Travel Insurance', 'This is a Travel Insurance');
INSERT INTO dbo.InsuranceType VALUES (8, 'Homeowner Insurance', 'This is a Homeowner Insurance');
INSERT INTO dbo.InsuranceType VALUES (9, 'Funeral Insurance', 'This is Funeral Insurance');
INSERT INTO dbo.InsuranceType VALUES (10, 'Pet Health Insurance', 'This is Pet Health Insurance');


-- Loan Type
INSERT INTO dbo.LoanType VALUES (1, 'Personal Loan', 'This is Personal Loan');
INSERT INTO dbo.LoanType VALUES (2, 'Gold Loan', 'This is Gold Loan');
INSERT INTO dbo.LoanType VALUES (3, 'Education Loan', 'This is Education Loan');
INSERT INTO dbo.LoanType VALUES (4, 'Mortgage Loan', 'This is Mortgage Loan');
INSERT INTO dbo.LoanType VALUES (5, 'Home Equity Loan', 'This is Home Equity Loan');
INSERT INTO dbo.LoanType VALUES (6, 'Credit-builder Loan', 'This is Credit-builder Loan');
INSERT INTO dbo.LoanType VALUES (7, 'Small Business Loan', 'This is Small Business Loan');
INSERT INTO dbo.LoanType VALUES (8, 'Car Loan', 'This is Car Loan');
INSERT INTO dbo.LoanType VALUES (9, 'Land Loan', 'This is Credit-builder Loan');
INSERT INTO dbo.LoanType VALUES (10, 'Small Quick Loan', 'This is Small Quick Loan');


-- Card Type
INSERT INTO dbo.CardType VALUES (1, 'Credit Card', 'A credit card allows you to make purchases and pay for them later');
INSERT INTO dbo.CardType VALUES (2, 'Platinum Card', 'A payment card that can be used in place of cash to make purchases');
INSERT INTO dbo.CardType VALUES (3, 'Forex Card', 'Foreign exchange Card');
INSERT INTO dbo.CardType VALUES (4, 'Prepaid Card', 'A card you can use to pay for things that is placed in the prepaid card account in advance');
INSERT INTO dbo.CardType VALUES (5, 'Gift Card', 'A prepaid debit card that is loaded with a specific amount, which can then be used to make purchases and other financial transactions');
INSERT INTO dbo.CardType VALUES (6, 'Virtual Card', 'A card is stored on phone and can be used to pay contactless in stores or online')


-- Inserting into BankBranch
INSERT INTO dbo.BankBranch VALUES (111, 'Newbury Street', '9876543210','newburystreet@gmail.com', '11th Newbury Street','Boston','Massachusetts', '02115');
INSERT INTO dbo.BankBranch VALUES (112, 'Roxbury','8765432109' ,'roxbury@gmail.com', '12th Roxbury Street','Boston','Massachusetts', '02116');
INSERT INTO dbo.BankBranch VALUES (113, 'Mission Hill','7654321098','missionhill@gmail.com','13th Mission Main Road','Boston','Massachusetts', '02117');
INSERT INTO dbo.BankBranch VALUES (114, 'Calumet Street','6543210987','calumetstreet@gmail.com','14th Calumet Street','Boston','Massachusetts', '02118');
INSERT INTO dbo.BankBranch VALUES (115, 'Down Town','5432109876', 'downtown@gmail.com','15th Down Town Road','Boston','Massachusetts', '02114');
INSERT INTO dbo.BankBranch VALUES (116, 'Massachusetts Avenue', '4321098765','massavenue@gmail.com','16th Maasachusettes Avenue','Boston','Massachusetts', '02113');
INSERT INTO dbo.BankBranch VALUES (117, 'Back Bay','3210987654','backbay@gmail.com','17th Back Bay Avenue','Boston','Massachusetts', '02112');
INSERT INTO dbo.BankBranch VALUES (118, 'Commonwealth','2109876543','commonwealth@gmail.com','18th Commonwealth Road','Boston','Massachusetts', '02111' );
INSERT INTO dbo.BankBranch VALUES (119, 'Oak Grove','1098765432','oakgrove@gmail.com', '19th Oak Grove Station','Boston','Massachusetts', '02111' );
INSERT INTO dbo.BankBranch VALUES (120, 'Forest Hill','1234567890', 'foresthill@gmail.com','20th Forest Hill Crossing','Boston','Massachusetts', '02109');


-- Person
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [DateOfBirth], [SSN], [Email], [PhoneNumber], [Address], [City], [State], [ZipCode]) VALUES
(101, 'Liam', 'Ira', CAST('1960-01-20' AS Date), '8776598', 'liamiran@gmail.com', '4133211531', 'Mcgreevey Way', 'Bosto', 'MA', '02120'),
(102, 'Cassia', 'Smith', CAST('1960-09-28' AS Date), '6552187', 'smith.c@gmail.com', '4133211542', 'Smith', 'Housto', 'TX', '04128'),
(103, 'Jim', 'Kelly', CAST('1960-05-19' AS Date), '8741987', 'kelly.jim@gmail.com', '4133211553', 'Ponce', 'Natick', 'MA', '02128'),
(104, 'Da', 'Rock', CAST('1999-11-22' AS Date), '5813981', 'rocky22@yahoo.com', '4133215144', 'Horado', 'Waltham', 'MA', '02116'),
(105, 'Kelly', 'Smith', CAST('1995-02-21' AS Date), '4719832', 'smith.kelly@gmail.com', '4133211568', 'Park Street', 'Allston', 'TX', '12021'),
(106, 'Pharell', 'Ira', CAST('1970-01-29' AS Date), '2087615', 'iranpharell@gmail.com', '4133211519', 'Norway', 'Portland', 'OR', '74074'),
(107, 'Joel', 'Dough', CAST('1992-02-22' AS Date), '3498109', 'doughjoe1992@gmail.com', '4133115011', 'Tremont', 'Stillwater', 'OK', '88123'),
(108, 'Louis', 'Smith', CAST('1990-08-22' AS Date), '8761230', 'smith.louis@gmail.com', '4133215300', 'Ward', 'Manhatta', 'NY', '03412'),
(109, 'Kare', 'Lee', CAST('1980-02-23' AS Date), '7812450', 'karen.lee@gmail.com', '4133211506', 'Fenway', 'Michiga', 'MI', '44210'),
(110, 'Larry', 'Dennis', CAST('1991-02-22' AS Date), '9812091', 'dennis1991@yahoo.com', '4133315807', 'Roxburry', 'San Jose', 'CA', '02120'),
(111, 'Zara', 'Larso', CAST('1964-12-12' AS Date), '9812121', 'wittyzara@hotmail.com', '4133211513', 'Mcgreevey Way', 'Bosto', 'MA', '04128'),
(112, 'Edward', 'Pattinso', CAST('1998-12-01' AS Date), '8232091', 'edward98@gmail.com', '4133215244', 'Smith', 'Housto', 'TX', '02128'),
(113, 'Mary', 'Louis', CAST('1966-01-01' AS Date), '7812440', 'louis.mary66@gmail.com', '4133111538', 'Ponce', 'Natick', 'MA', '02116'),
(114, 'Hazel', 'Lobo', CAST('1967-12-20' AS Date), '8741287', 'lobohazel20@gmail.com', '4133911519', 'Horado', 'Waltham', 'MA', '12021'),
(115, 'Ankita', 'Kumari', CAST('1998-12-25' AS Date), '5123481', 'kumari.a@yahoo.com', '4133515011', 'Park Street', 'Allston', 'TX', '74074'),
(116, 'Achyth', 'Varma', CAST('1969-01-12' AS Date), '4719812', 'varma.achyuth@gmail.com', '4133715300', 'Norway', 'Portland', 'OR', '74074'),
(117, 'Vachana', 'Belgavi', CAST('1962-02-12' AS Date), '2032615', 'belgavi.v@gmail.com', '4133311553', 'Tremont', 'Stillwater', 'OK', '88123'),
(118, 'Shraddha', 'Baheti', CAST('1994-04-12' AS Date), '3231109', 'baheti.shraddha@gmail.com', '4133315144', 'Ward', 'Manhatta', 'NY', '44210'),
(119, 'Sanjana', 'Chatti', CAST('1950-12-12' AS Date), '8451230', 'chatti.s@gmail.com', '4133311568', 'Fenway', 'Michiga', 'MI', '02120'),
(120, 'Mak', 'Weins', CAST('1998-01-06' AS Date), '8147230', 'weins.mark@yahoo.com', '4133311519', 'Roxburry', 'San Jose', 'CA', '74074'),
(121, 'Alan', 'Walker', CAST('2012-01-06' AS Date), '8147120', 'walker.alan@yahoo.com', '4133311519', 'Roxburry', 'Boston', 'MA', '02135'),
(122, 'Simon', 'Wang', CAST('2015-01-06' AS Date), '775503940', 'simon.wang@yahoo.com', '4133311519', 'Manhattan', 'New York', 'NY', '12313'),
(123, 'ron', 'weasley', CAST('2011-01-06' AS Date), '738979973', 'weasley.ron@yahoo.com', '4133311519', 'Roxburry', 'Boston', 'MA', '02135'),
(124, 'stephen', 'strange', CAST('2011-01-06' AS Date), '547357386', 'stephen.strange@yahoo.com', '4133311519', 'Manhattan', 'New York', 'NY', '12313'),
(125, 'elizabeth', 'Wong', CAST('2014-01-06' AS Date), '836257394', 'Wong.elizabeth@yahoo.com', '4133311519', 'Roxburry', 'Boston', 'MA', '02135'),
(126, 'tony', 'stark', CAST('2017-01-06' AS Date), '900867940', 'tony.stark@yahoo.com', '4133311519', 'Manhattan', 'New York', 'NY', '12313'),
(127, 'emma', 'watson', CAST('2016-01-06' AS Date), '537534221', 'watson.emma@yahoo.com', '4133311519', 'Roxburry', 'Boston', 'MA', '02135'),
(128, 'harry', 'potter', CAST('2014-01-06' AS Date), '162584984', 'harry.wang@yahoo.com', '4133311519', 'Silicon Valley', 'CA', 'CA', '12313'),
(129, 'optimus', 'prime', CAST('2013-01-06' AS Date), '908509007', 'prime.optimus@yahoo.com', '4133311519', 'Roxburry', 'Boston', 'MA', '02135'),
(130, 'peter', 'parker', CAST('2012-01-06' AS Date), '257457284', 'peter.parker@yahoo.com', '4133311519', 'Manhattan', 'New York', 'NY', '12313'),
(131, 'Sam', 'Kelly', CAST('2004-05-06' AS Date), '745829452', 'sam.kelly@gmail.com', '6179596326', 'Waterfall Drive', 'Canton', 'MA', '02021'),
(132, 'Karren', 'Murphy', CAST('2003-05-06' AS Date), '749638527', 'karren.murphy@gmail.com', '8629468358', 'Beverly Hills', 'Long Island', 'NY', '53852'),
(133, 'Irene', 'Schmidt', CAST('2005-05-06' AS Date), '549254862', 's.irene@yahoo.com', '6835839362', 'Living Space', 'Long Island', 'NY', '35724'),
(134, 'Shoaib', 'Ullah', CAST('1987-05-06' AS Date), '583912111', 'u.shoaib@yahoo.com', '7539215231', 'Casey St', 'Staten Island', 'NY', '63471'),
(135, 'George', 'Clernon', CAST('2010-03-17' AS Date), '649418115', 'g.clernon@gmail.com', '6939151939', '70 Baker St', 'Riverdale', 'NY', '43164'),
(136, 'Owais', 'Ahmed', CAST('2007-05-18' AS Date), '581438009', 'a.owais@gmail.com', '5915735718', '89 Bolivar St', 'Canton', 'MA', '02031'),
(137, 'Charles', 'Bass', CAST('1997-07-26' AS Date), '639518538', 'c.bass@gmail.com', '6591538862', 'Edgewater', 'Canton', 'MA', '02021'),
(138, 'Randy', 'Doll', CAST('1975-05-06' AS Date), '649528427', 'd.randy@gmail.com', '6925936283', 'Mountain View', 'Stoughton', 'MA', '03031'),
(139, 'Kayleigh', 'Moquin', CAST('1996-05-06' AS Date), '639538528', 'm.kayleigh@gmail.com', '6178359264', 'Bernard St', 'Bershire', 'NH', '07071'),
(140, 'Ronald', 'Lahley', CAST('2012-05-06' AS Date), '548251936', 'r.lahley@gmail.com', '6179540372', '27 Walnut St', 'Nautica', 'NY', '64291'); 


-- Employee Type
INSERT [dbo].[EmployeeType] ([EmployeeTypeID], [Type]) VALUES (201, 'Branch Manager');
INSERT [dbo].[EmployeeType] ([EmployeeTypeID], [Type]) VALUES (202, 'Account Creator');
INSERT [dbo].[EmployeeType] ([EmployeeTypeID], [Type]) VALUES (203, 'Loan Approver');
INSERT [dbo].[EmployeeType] ([EmployeeTypeID], [Type]) VALUES (204, 'Insurance Approver');
INSERT [dbo].[EmployeeType] ([EmployeeTypeID], [Type]) VALUES (205, 'Card Approver');


-- Employee
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (900, 201, 111, 111);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (901, 202, 111, 112);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (902, 203, 111, 113);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (903, 204, 111, 114);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (904, 205, 111, 115);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (905, 201, 112, 116);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (906, 202, 112, 117);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (907, 203, 112, 118);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (908, 204, 112, 119);
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeTypeID], [BranchCode], [PersonID]) VALUES (909, 205, 112, 120);


-- Customer Data
INSERT INTO dbo.CustomerData VALUES (301, 101);
INSERT INTO dbo.CustomerData VALUES (302, 102);
INSERT INTO dbo.CustomerData VALUES (303, 103);
INSERT INTO dbo.CustomerData VALUES (304, 104);
INSERT INTO dbo.CustomerData VALUES (305, 105);
INSERT INTO dbo.CustomerData VALUES (306, 106);
INSERT INTO dbo.CustomerData VALUES (307, 107);
INSERT INTO dbo.CustomerData VALUES (308, 108);
INSERT INTO dbo.CustomerData VALUES (309, 109);
INSERT INTO dbo.CustomerData VALUES (310, 110);
INSERT INTO dbo.CustomerData VALUES (311, 121);
INSERT INTO dbo.CustomerData VALUES (312, 122);
INSERT INTO dbo.CustomerData VALUES (313, 123);
INSERT INTO dbo.CustomerData VALUES (314, 124);
INSERT INTO dbo.CustomerData VALUES (315, 125);
INSERT INTO dbo.CustomerData VALUES (316, 126);
INSERT INTO dbo.CustomerData VALUES (317, 127);
INSERT INTO dbo.CustomerData VALUES (318, 128);
INSERT INTO dbo.CustomerData VALUES (319, 129);
INSERT INTO dbo.CustomerData VALUES (320, 130);
INSERT INTO dbo.CustomerData VALUES (321, 131);
INSERT INTO dbo.CustomerData VALUES (322, 132);
INSERT INTO dbo.CustomerData VALUES (323, 133);
INSERT INTO dbo.CustomerData VALUES (324, 134);
INSERT INTO dbo.CustomerData VALUES (325, 135);
INSERT INTO dbo.CustomerData VALUES (326, 136);
INSERT INTO dbo.CustomerData VALUES (327, 137);
INSERT INTO dbo.CustomerData VALUES (328, 138);
INSERT INTO dbo.CustomerData VALUES (329, 139);
INSERT INTO dbo.CustomerData VALUES (330, 140);

-- Customer Financial History
INSERT INTO dbo.CustomerFinancialHistory (FinancialHistoryID, CustomerID, CreditScore, LastUpdatedTime) VALUES
(401, 301, 365, '2022-01-23'),
(402, 302, 593, '2021-11-16'),
(403, 303, 715, '2022-07-31'),
(404, 304, 778, '2022-03-17'),
(405, 305, 825, '2021-09-05'),
(406, 306, 570, '2021-12-09'),
(407, 307, 590, '2022-02-14'),
(408, 308, 671, '2022-03-19'),
(409, 309, 741, '2022-04-18'),
(410, 310, 804, '2022-05-02'),
(411, 311, 570, '2022-06-09'),
(412, 312, 590, '2021-02-14'),
(413, 313, 671, '2021-03-19'),
(414, 314, 741, '2020-04-18'),
(415, 315, 804, '2021-05-02'),
(416, 316, 570, '2022-04-09'),
(417, 317, 590, '2022-07-14'),
(418, 318, 671, '2021-01-19'),
(419, 319, 741, '2021-07-18'),
(420, 320, 804, '2022-05-26'),
(421, 321, 570, '2021-11-09'),
(422, 322, 590, '2021-11-14'),
(423, 323, 671, '2022-05-19'),
(424, 324, 741, '2021-12-18'),
(425, 325, 804, '2022-02-02'),
(426, 326, 570, '2021-08-09'),
(427, 327, 590, '2022-08-02'),
(428, 328, 671, '2021-11-19'),
(429, 329, 741, '2021-06-18'),
(430, 330, 804, '2022-07-26');

-- Account
INSERT INTO dbo.Account VALUES (1001001234, 111, 301, 900, 'Savings', 12452);
INSERT INTO dbo.Account VALUES (1001001235, 111, 301, 900, 'Checking', 731);
INSERT INTO dbo.Account VALUES (1001001236, 112, 302, 901, 'Savings', 298);
INSERT INTO dbo.Account VALUES (1001001237, 112, 302, 901, 'Checking', 13);
INSERT INTO dbo.Account VALUES (1001001238, 113, 303, 902, 'Savings', 4764);
INSERT INTO dbo.Account VALUES (1001001239, 113, 303, 902, 'Checking', 4008);
INSERT INTO dbo.Account VALUES (1001001240, 114, 304, 903, 'Savings', 10007);
INSERT INTO dbo.Account VALUES (1001001241, 114, 304, 903, 'Checking', 2056);
INSERT INTO dbo.Account VALUES (1001001242, 115, 305, 904, 'Savings', 3684);
INSERT INTO dbo.Account VALUES (1001001243, 115, 305, 904, 'Checking', 622);
INSERT INTO dbo.Account VALUES (1001001244, 116, 306, 905, 'Savings', 456);
INSERT INTO dbo.Account VALUES (1001001245, 116, 306, 905, 'Checking', 34);
INSERT INTO dbo.Account VALUES (1001001246, 117, 307, 906, 'Savings', 86483);
INSERT INTO dbo.Account VALUES (1001001247, 117, 307, 906, 'Checking', 6789);
INSERT INTO dbo.Account VALUES (1001001248, 118, 308, 907, 'Savings', 2545);
INSERT INTO dbo.Account VALUES (1001001249, 118, 308, 907, 'Checking', 767);
INSERT INTO dbo.Account VALUES (1001001250, 119, 309, 908, 'Savings', 234);
INSERT INTO dbo.Account VALUES (1001001251, 119, 309, 908, 'Checking', 1465);
INSERT INTO dbo.Account VALUES (1001001252, 120, 310, 909, 'Savings', 7659);
INSERT INTO dbo.Account VALUES (1001001253, 120, 310, 909, 'Checking', 9860);
INSERT INTO dbo.Account (AccountID, BranchCode, AccountType, Balance) VALUES (0000000001, 111,'Bank', 1000000000);
INSERT INTO dbo.Account VALUES (1001001254, 111, 311, 900, 'Savings', 67392);
INSERT INTO dbo.Account VALUES (1001001255, 111, 311, 900, 'Checking', 8468);
INSERT INTO dbo.Account VALUES (1001001256, 112, 312, 902, 'Savings', 7486);
INSERT INTO dbo.Account VALUES (1001001257, 112, 312, 902, 'Checking', 920);
INSERT INTO dbo.Account VALUES (1001001258, 113, 313, 902, 'Savings', 8597);
INSERT INTO dbo.Account VALUES (1001001259, 113, 313, 902, 'Checking', 98);
INSERT INTO dbo.Account VALUES (1001001260, 114, 314, 903, 'Savings', 9567);
INSERT INTO dbo.Account VALUES (1001001261, 114, 314, 903, 'Checking', 88);
INSERT INTO dbo.Account VALUES (1001001262, 115, 315, 904, 'Savings', 4556);
INSERT INTO dbo.Account VALUES (1001001263, 115, 315, 904, 'Checking', 453);
INSERT INTO dbo.Account VALUES (1001001264, 116, 316, 905, 'Savings', 56743);
INSERT INTO dbo.Account VALUES (1001001265, 116, 316, 905, 'Checking', 66);
INSERT INTO dbo.Account VALUES (1001001266, 117, 317, 906, 'Savings', 5573);
INSERT INTO dbo.Account VALUES (1001001267, 117, 317, 906, 'Checking', 5577);
INSERT INTO dbo.Account VALUES (1001001268, 118, 318, 907, 'Savings', 24467);
INSERT INTO dbo.Account VALUES (1001001269, 118, 318, 907, 'Checking', 5577);
INSERT INTO dbo.Account VALUES (1001001270, 119, 319, 908, 'Savings', 245578);
INSERT INTO dbo.Account VALUES (1001001271, 119, 319, 908, 'Checking', 5467);
INSERT INTO dbo.Account VALUES (1001001272, 120, 320, 909, 'Savings', 3426);
INSERT INTO dbo.Account VALUES (1001001273, 120, 320, 909, 'Checking', 43);
INSERT INTO dbo.Account VALUES (1001001274, 111, 321, 900, 'Savings', 67392);
INSERT INTO dbo.Account VALUES (1001001275, 111, 321, 900, 'Checking', 8468);
INSERT INTO dbo.Account VALUES (1001001276, 112, 322, 902, 'Savings', 7486);
INSERT INTO dbo.Account VALUES (1001001277, 112, 322, 902, 'Checking', 920);
INSERT INTO dbo.Account VALUES (1001001278, 113, 323, 902, 'Savings', 8597);
INSERT INTO dbo.Account VALUES (1001001279, 113, 323, 902, 'Checking', 98);
INSERT INTO dbo.Account VALUES (1001001280, 114, 324, 903, 'Savings', 9567);
INSERT INTO dbo.Account VALUES (1001001281, 114, 324, 903, 'Checking', 88);
INSERT INTO dbo.Account VALUES (1001001282, 115, 325, 904, 'Savings', 4556);
INSERT INTO dbo.Account VALUES (1001001283, 115, 325, 904, 'Checking', 453);
INSERT INTO dbo.Account VALUES (1001001284, 116, 326, 905, 'Savings', 56743);
INSERT INTO dbo.Account VALUES (1001001285, 116, 326, 905, 'Checking', 66);
INSERT INTO dbo.Account VALUES (1001001286, 117, 327, 906, 'Savings', 5573);
INSERT INTO dbo.Account VALUES (1001001287, 117, 327, 906, 'Checking', 5577);
INSERT INTO dbo.Account VALUES (1001001288, 118, 328, 907, 'Savings', 24467);
INSERT INTO dbo.Account VALUES (1001001289, 118, 328, 907, 'Checking', 5577);
INSERT INTO dbo.Account VALUES (1001001290, 119, 329, 908, 'Savings', 245578);
INSERT INTO dbo.Account VALUES (1001001291, 119, 329, 908, 'Checking', 5467);
INSERT INTO dbo.Account VALUES (1001001292, 120, 330, 909, 'Savings', 3426);
INSERT INTO dbo.Account VALUES (1001001293, 120, 330, 909, 'Checking', 43);

-- insuranceTable
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(101,1001001234,2,901,500000,CAST('2022-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(102,1001001239,3,902,2000000,CAST('2021-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(103,1001001244,1,903,200000,CAST('2018-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(104,1001001236,5,904,3000000,CAST('2012-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(105,1001001241,2,905,100000,CAST('2022-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(106,1001001235,1,906,450000,CAST('2021-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(107,1001001238,10,907,90000,CAST('2021-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(108,1001001243,9,908,90000,CAST('2021-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(109,1001001251,4,908,400000,CAST('2021-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(110,1001001252,7,901,10000,CAST('2022-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(111,1001001252,6,902,100000,CAST('2022-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(112,1001001240,8,909,300000,CAST('2022-01-20' AS Date));
INSERT into dbo.Insurance (InsuranceID, AccountID, InsuranceTypeID, ApprovedByEmployee, InsuranceAmount,InsuranceIssuedDate) VALUES(113,1001001239,10,903,50000,CAST('2022-01-20' AS Date));


-- Loan
INSERT INTO dbo.Loan (LoanID, AccountID, LoanTypeID, ApprovedByEmployee, LoanAmount, LoanPaid, RecentPaymentDate, LoanDisbursed, RecentDisbursementDate) VALUES
(101, 1001001235, 1, 902, 500000, 2000, '2022-06-12', 30000, '2021-02-05'),
(102, 1001001237, 2, 902, 2000000, 300000, '2022-04-12', 1000000, '2020-03-03'),
(103, 1001001239, 1, 907, 100000, 2000.0000, '2022-07-15', 30000, '2022-03-23'),
(104, 1001001241, 3, 907, 300000, 10000, '2022-02-14', 3000000, '2019-04-19'),
(105, 1001001243, 3, 902, 300000, 20000, '2022-04-22', 150000, '2018-05-15'),
(106, 1001001245, 8, 907, 500000, 2000, '2022-03-23', 250000, '2017-04-12'),
(107, 1001001247, 8, 902, 500000, 20000, '2022-02-19', 300000, '2020-04-13'),
(108, 1001001249, 10, 902, 5000, 1000, '2022-06-18', 3000, '2021-04-14'),
(109, 1001001251, 1, 902, 70000, 2000, '2022-08-02', 30000, '2022-04-15'),
(110, 1001001253, 1, 907, 80000, 2000, '2022-05-18', 30000, '2022-04-15'),
(111, 1001001235, 1, 907, 40000, 10000, '2022-08-01', 30000, '2020-04-18'),
(112, 1001001237, 1, 902, 60000, 30000, '2022-04-19', 60000, '2020-04-07'),
(113, 1001001239, 1, 907, 50000, 10000, '2022-07-18', 50000, '2021-01-08'),
(114, 1001001239, 1, 907, 70000, 10000, '2022-07-18', 70000, '2021-02-08'),
(115, 1001001244, 1, 907, 50000, 20000, '2022-06-18', 50000, '2021-03-08'),
(116, 1001001276, 1, 907, 45000, 5000, '2022-06-18', 45000, '2021-04-08'),
(117, 1001001285, 1, 907, 88000, 55000, '2022-05-18', 88000, '2021-05-08'),
(118, 1001001265, 1, 907, 43000, 1000, '2022-05-18', 43000, '2021-06-08');

-- Card Provider
INSERT into dbo.CardProvider VALUES(1,'Chase');
INSERT into dbo.CardProvider VALUES(2,'Discover');
INSERT into dbo.CardProvider VALUES(3,'Bank of America');
INSERT into dbo.CardProvider VALUES(4,'American Express');
INSERT into dbo.CardProvider VALUES(5,'Capital One');
INSERT into dbo.CardProvider VALUES(6,'Citibank');
INSERT into dbo.CardProvider VALUES(7,'Wells Fargo');
INSERT into dbo.CardProvider VALUES(8,'Barclays');
INSERT into dbo.CardProvider VALUES(9,'Synchrony');


-- Card
INSERT into dbo.card VALUES(1,1001001234,1,900,1,900,'Approved',7.2);
INSERT into dbo.card VALUES(2,1001001245,4,903 ,4,750,'Approved',6);
INSERT into dbo.card VALUES(3,1001001247,3,904, 4,890,'Approved',6.2);
INSERT into dbo.card VALUES(4, 1001001242,3,902,7,600,'Pending',4);
INSERT into dbo.card VALUES(5,1001001250,3,903, 2,500,'Approved',6);
INSERT into dbo.card VALUES(6,1001001252,2,904, 1,700,'Approved',6);
INSERT into dbo.card VALUES(7,1001001249,1,906, 9,900,'Approved',5.5);
INSERT into dbo.card VALUES(8,1001001244,6,905, 3,490,'Approved',6);
INSERT into dbo.card VALUES(9,1001001241,4,903, 2,890,'Approved',5.5);
INSERT into dbo.card VALUES(10,1001001237,5,900, 6,2000,'Approved',5.6);
INSERT into dbo.card VALUES(11,1001001236,6,901, 8,900,'Pending',6);
INSERT into dbo.card VALUES(12,1001001239,2,902, 5,2000,'Approved',5.5);
INSERT into dbo.card VALUES(13, 1001001270, 1, 900, 1, 2000, 'Pending', 7.2);
INSERT into dbo.card VALUES(14, 1001001271, 2, 901, 2, 9000, 'Approved', 0.0);
INSERT into dbo.card VALUES(15, 1001001272, 3, 902, 3, 200, 'Pending', 7.2);
INSERT into dbo.card VALUES(16, 1001001273, 4, 903, 4, 900, 'Approved', 7.2);
INSERT into dbo.card VALUES(17, 1001001274, 5, 904, 5, 90, 'Approved', 7.2);

-- Transaction Type
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(1, 'Account Transfer');
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(2, 'Insurance Installment');
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(3, 'Insurance Claim');
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(4, 'Loan Disbursement');
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(5, 'Loan Repayment');
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(6, 'Card Transaction');
INSERT INTO dbo.TransactionType (TransactionTypeID, TransactionDescription) VALUES(7, 'Card Refill');