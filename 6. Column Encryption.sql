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

--- ENCRYPTION
USE BankManagementGroup13;
--Encryption on User Details

/*
COMMANDS TO DROP KEYS
DROP SYMMETRIC KEY user_Key_1;
DROP CERTIFICATE usercert;
DROP MASTER KEY;
*/
GO
--Table before Encryption
SELECT * FROM PERSON
GO
--CREATE MASTER KEY
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password2022$';
GO
 -- CREATE CERTIFICATE
CREATE CERTIFICATE usercert WITH SUBJECT = 'User Indentity Details';

GO
-- CREATE SYMMETRIC KEY
CREATE SYMMETRIC KEY user_Key_1
WITH ALGORITHM = AES_256  -- it can be AES_128,AES_192,DES etc
ENCRYPTION BY CERTIFICATE usercert;
GO
--Encryption
ALTER TABLE Person ADD FirstName_encrypt varbinary(MAX),LastName_encrypt varbinary(MAX),
DateOfBirth_encrypt varbinary(MAX),SSN_encrypt varbinary(MAX),Email_encrypt varbinary(MAX),
PhoneNumber_encrypt varbinary(MAX),Address_encrypt varbinary(MAX),City_encrypt varbinary(MAX),
State_encrypt varbinary(MAX),ZipCode_encrypt varbinary(MAX);
GO

OPEN SYMMETRIC KEY user_Key_1 DECRYPTION BY CERTIFICATE usercert;
GO

UPDATE Person
        SET FirstName_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(20), FirstName)),
		    LastName_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(20), LastName)),
			DateOfBirth_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(50), DateOfBirth)),
			SSN_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(50), SSN)),
			Email_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(50), Email)),
			PhoneNumber_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(char(10), PhoneNumber)),
			Address_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(MAX), Address)),
			State_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(15), State)),
			City_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(20), City)),
			ZipCode_encrypt = EncryptByKey (Key_GUID('user_Key_1'),CONVERT(varchar(5), ZipCode))
        FROM Person;
GO

-- Close SYMMETRIC KEY
CLOSE SYMMETRIC KEY user_Key_1;
GO

--View encrypted data
SELECT FirstName_encrypt, LastName_encrypt, DateOfBirth_encrypt, SSN_encrypt, Email_encrypt ,
PhoneNumber_encrypt, Address_encrypt, State_encrypt, City_encrypt, ZipCode_encrypt FROM Person;
GO
--Dropping Old Columns 
ALTER TABLE PERSON DROP CONSTRAINT checkRegisteredPerson;
GO
ALTER TABLE Person DROP COLUMN [FirstName], [LastName], [DateOfBirth], [SSN], [Email],[PhoneNumber], [Address], [City], [State], [ZipCode];
GO



 --- DECRYPTION
OPEN SYMMETRIC KEY user_Key_1 DECRYPTION BY CERTIFICATE usercert;
GO
SELECT FirstName_encrypt, LastName_encrypt, DateOfBirth_encrypt, SSN_encrypt, Email_encrypt ,
PhoneNumber_encrypt, Address_encrypt, State_encrypt, City_encrypt, ZipCode_encrypt,
CONVERT(varchar, DecryptByKey(FirstName_encrypt)) AS 'Decrypted Firstname',
CONVERT(varchar, DecryptByKey(LastName_encrypt)) AS 'Decrypted Lastname',
CONVERT(varchar, DecryptByKey(DateOfBirth_encrypt)) AS 'Decrypted DateOfBirth',
CONVERT(varchar, DecryptByKey(SSN_encrypt)) AS 'Decrypted SSN',
CONVERT(varchar, DecryptByKey(Email_encrypt)) AS 'Decrypted Email',
CONVERT(varchar, DecryptByKey(PhoneNumber_encrypt)) AS 'Decrypted PhoneNumber',
CONVERT(varchar, DecryptByKey(State_encrypt)) AS 'Decrypted State',
CONVERT(varchar, DecryptByKey(City_encrypt)) AS 'Decrypted City',
CONVERT(varchar, DecryptByKey(ZipCode_encrypt)) AS 'Decrypted Zipcode'
FROM Person;
GO
CLOSE SYMMETRIC KEY user_Key_1;
GO
--Table After Encryption
SELECT * FROM PERSON
GO

