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

-- Trigger to update the amount of both source account and destination account during transaction
USE BankManagementGroup13;
GO
CREATE TRIGGER UpdateAccountAmount
ON dbo.TransactionTable
AFTER INSERT, UPDATE
AS
BEGIN

    DECLARE @SourceAccountID INT;
    DECLARE @DestAccountID INT;
    DECLARE @TheAmount MONEY;
    DECLARE @SourceAccountMoneyAmount MONEY;
    DECLARE @DestinationAccountMoneyAmount MONEY;

    DECLARE @ResultantFromSubtraction MONEY;
    DECLARE @ResultantFromAddition MONEY;
    DECLARE @InsuranceID INT;
    DECLARE @CardID INT;
    DECLARE @TransactionType INT;

    Select @SourceAccountID = AccountID, 
    @DestAccountID = BeneficiaryAccountID, 
    @TheAmount = TransactionAmount, 
    @TransactionType = TransactionTypeID
    FROM inserted;

		
            SELECT @SourceAccountMoneyAmount = Balance FROM Account WHERE AccountID = @SourceAccountID;

            SELECT @DestinationAccountMoneyAmount = Balance FROM Account WHERE AccountID = @DestAccountID;

            -- Subtracting from the source account
            UPDATE Account SET Balance = @SourceAccountMoneyAmount - @TheAmount WHERE AccountID = @SourceAccountID;

            UPDATE Account SET Balance = @DestinationAccountMoneyAmount + @TheAmount WHERE AccountID = @DestAccountID;
		 
END
GO
--DROP TRIGGER UpdateAccountAmount




--PROCEDURE FOR PERFORMING ALL TRANSACTIONS LIKE ACCOUNT TRANSFERS, INSURANCE PAYMENTS/CLAIMS, LOAN REPAYMENTS/CLAIM, CARD TRANSACTIONS
GO
CREATE PROCEDURE 
MakeTransactionFromAccountToAccount(@SourceAccountID INT, @BeneficiaryAccountID INT, @Amount MONEY, @TransactionType INT,@ServiceID INT)
AS
BEGIN

    DECLARE @AccountBalance MONEY;
    DECLARE @SourceAccountExists INT;
    DECLARE @DestinationAccountExists INT;
    DECLARE @ExistingAmount MONEY;

    SELECT @SourceAccountExists = COUNT(AccountID) FROM Account WHERE AccountID = @SourceAccountID;

    SELECT @DestinationAccountExists = COUNT(AccountID) FROM Account WHERE AccountID = @BeneficiaryAccountID;

    IF @SourceAccountExists = 1 AND @DestinationAccountExists = 1

        BEGIN

        SELECT @AccountBalance = Balance FROM Account WHERE AccountID = @SourceAccountID;

        PRINT @Amount
        PRINT @AccountBalance
        
        IF @TransactionType = 3 OR 
        @TransactionType = 4 OR 
        @TransactionType = 6 OR 
        @AccountBalance >= @Amount 
            BEGIN

            BEGIN TRY;

            BEGIN TRANSACTION;

            IF @TransactionType=1      
                
                INSERT INTO dbo.TransactionTable 
                (AccountID, BeneficiaryAccountID, PaymentDate, TransactionAmount,TransactionTypeID) 
                VALUES (@SourceAccountID, @BeneficiaryAccountID, getDate(), @Amount,@TransactionType);

       
            ELSE IF @TransactionType=2 
                BEGIN
                    INSERT INTO dbo.TransactionTable 
                    (AccountID, BeneficiaryAccountID, InsuranceID, PaymentDate, TransactionAmount,TransactionTypeID) 
                    VALUES (@SourceAccountID,@BeneficiaryAccountID,@ServiceID, getDate(), @Amount,@TransactionType);

                    SELECT @ExistingAmount = InsurancePayment FROM Insurance WHERE InsuranceID = @ServiceID

                    UPDATE dbo.Insurance SET InsurancePayment = @ExistingAmount + @Amount, RecentInsurancePaymentDate=getDate()
                    WHERE InsuranceID = @ServiceID
                END
            ELSE IF @TransactionType=3
                BEGIN
                    INSERT INTO dbo.TransactionTable 
                    (AccountID,BeneficiaryAccountID, InsuranceID, PaymentDate, TransactionAmount,TransactionTypeID) 
                    VALUES (@SourceAccountID, @BeneficiaryAccountID,@ServiceID, getDate(), @Amount,@TransactionType);

                    SELECT @ExistingAmount = InsurancePayment FROM Insurance WHERE InsuranceID = @ServiceID

                    UPDATE dbo.Insurance SET RecentClaimDate = getDate(), InsuranceClaimed = @ExistingAmount + @Amount
                    WHERE InsuranceID = @ServiceID
                END
            ELSE IF @TransactionType=4 
                BEGIN
                    INSERT INTO dbo.TransactionTable 
                    (AccountID,BeneficiaryAccountID, LoanID, PaymentDate, TransactionAmount,TransactionTypeID) 
                    VALUES (@SourceAccountID, @BeneficiaryAccountID, @ServiceID, getDate(), @Amount,@TransactionType);

                    SELECT @ExistingAmount = LoanDisbursed FROM Loan WHERE LoanID = @ServiceID

                    UPDATE dbo.Loan SET LoanDisbursed = @ExistingAmount + @Amount, RecentDisbursementDate=getDate()
                    WHERE LoanID = @ServiceID
                END

            ELSE IF @TransactionType=5
                BEGIN

                    INSERT INTO dbo.TransactionTable 
                    (AccountID,BeneficiaryAccountID, LoanID, PaymentDate, TransactionAmount,TransactionTypeID) 
                    VALUES (@SourceAccountID,@BeneficiaryAccountID, @ServiceID, getDate(), @Amount,@TransactionType);


                    SELECT @ExistingAmount = LoanPaid FROM Loan WHERE LoanID = @ServiceID

                    UPDATE dbo.Loan SET LoanPaid = @ExistingAmount + @Amount, RecentPaymentDate = getDate()
                    WHERE LoanID = @ServiceID
                END


            ELSE IF @TransactionType=6

                BEGIN
                    INSERT INTO dbo.TransactionTable (AccountID, BeneficiaryAccountID, CardID, PaymentDate, TransactionAmount,TransactionTypeID) 
                    VALUES (@SourceAccountID,@BeneficiaryAccountID, @ServiceID, getDate(), @Amount,@TransactionType);

                    SELECT @ExistingAmount = Balance FROM Card WHERE CardID = @ServiceID

                    IF @ExistingAmount >= @Amount
                        BEGIN 
                            Update dbo.Card SET BALANCE = @ExistingAmount - @Amount WHERE CardID = @ServiceID
                        END

                    ELSE 
                        BEGIN
                            PRINT 'Insufficient Funds in the card'
                        END


                END



            ELSE IF @TransactionType=7

                BEGIN

                    INSERT INTO dbo.TransactionTable (AccountID, BeneficiaryAccountID, CardID, PaymentDate, TransactionAmount,TransactionTypeID) 
                    VALUES (@SourceAccountID, @BeneficiaryAccountID, @ServiceID, getDate(), @Amount,@TransactionType);


                    SELECT @ExistingAmount = Balance FROM Card WHERE CardID = @ServiceID

                    Update dbo.Card SET Balance = @ExistingAmount + @Amount WHERE CardID = @ServiceID 

                END

            ELSE 
                PRINT 'Invalid Transaction Attempt';

            PRINT 'Completed Account Transfer';

            COMMIT TRANSACTION;

            END TRY
            BEGIN CATCH
                PRINT 'Account transfer failed, please try again later'

   
                IF XACT_STATE() <> 0
                BEGIN
                ROLLBACK TRANSACTION;
                END;

            END CATCH

            END

        ELSE
            BEGIN
                PRINT 'Insufficient Funds';
            END
    -- PRINT "Successfully completed the transaction to Beneficiary Account";
        END
    ELSE
        PRINT 'Invalid Account ID'

END
GO

--DROP PROC MakeTransactionFromAccountToAccount;


CREATE PROCEDURE 
PerformTransactions(@SrcAccount INT, @BeneAccount INT, @ServiceID INT ,@Amount MONEY, @TransactionType INT)
AS
BEGIN
    IF @TransactionType=1
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=@SrcAccount,@BeneficiaryAccountID=@BeneAccount,@ServiceID=0, @Amount=@Amount, @TransactionType=@TransactionType
    ELSE IF @TransactionType=2
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=@SrcAccount, @BeneficiaryAccountID=0000000001, @ServiceID=@ServiceID, @Amount=@Amount, @TransactionType=@TransactionType;
    ELSE IF @TransactionType=3
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=0000000001, @BeneficiaryAccountID=@SrcAccount, @ServiceID=@ServiceID, @Amount=@Amount, @TransactionType=@TransactionType;
    ELSE IF @TransactionType=4
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=0000000001, @BeneficiaryAccountID=@SrcAccount, @ServiceID=@ServiceID, @Amount=@Amount, @TransactionType=@TransactionType;
    ELSE IF @TransactionType=5
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=@SrcAccount, @BeneficiaryAccountID=0000000001, @ServiceID=@ServiceID, @Amount=@Amount, @TransactionType=@TransactionType;
    ELSE IF @TransactionType=6
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=@SrcAccount, @BeneficiaryAccountID=0000000001, @ServiceID=@ServiceID, @Amount=@Amount, @TransactionType=@TransactionType;
    ELSE IF @TransactionType=7
        EXEC MakeTransactionFromAccountToAccount @SourceAccountID=@SrcAccount, @BeneficiaryAccountID=0000000001, @ServiceID=@ServiceID, @Amount=@Amount, @TransactionType=@TransactionType;
    ELSE 
        PRINT 'Invalid Transaction attempt';

END
GO

--ACCOUNT TRANSFER TEST CASE
--Insufficient Funds
EXEC PerformTransactions @SrcAccount = 1001001235, @BeneAccount = 1001001237, @ServiceID = 0, @Amount = 1000, @TransactionType = 1;
--Invalid Account
EXEC PerformTransactions @SrcAccount = 1001001235, @BeneAccount = 1001001200, @ServiceID = 0, @Amount = 1000, @TransactionType = 1;
--Valid Scenario
EXEC PerformTransactions @SrcAccount = 1001001235, @BeneAccount = 1001001237, @ServiceID = 0, @Amount = 100, @TransactionType = 1;
--Invalid Attempt
EXEC PerformTransactions @SrcAccount = 1001001235, @BeneAccount = 1001001237, @ServiceID = 0, @Amount = 100, @TransactionType = -1;
--Involved Tables
select * from Account;


--TRANSACTION TABLE
--Logs all the transactions made by the customer and bank



--INSURANCE INSTALLMENTS TEST CASE
-- on successful transaction amount is credited to bank account
EXEC PerformTransactions @SrcAccount = 1001001234, @BeneAccount = 1, @ServiceID = 101, @Amount = 1000, @TransactionType = 2;
select * from TransactionTable;
select * from Account;
select * from insurance;



--INSURANCE CLAIM TEST CASE
-- on successful transaction amount is deducted from bank account
EXEC PerformTransactions @SrcAccount = 1001001244, @BeneAccount = 1, @ServiceID = 103, @Amount = 1000, @TransactionType = 3;
select * from TransactionTable;
select * from Account;
select * from insurance;



--LOAN DISBURSEMENT TEST CASE
-- on successful transaction amount is deducted from bank account and credited to customer account
EXEC PerformTransactions @SrcAccount = 1001001235, @BeneAccount = 1, @ServiceID = 101, @Amount = 1000, @TransactionType = 4;
select * from TransactionTable;
select * from Account;
select * from loan;



--LOAN REPAYMENT TEST CASE
-- on successful transaction amount is credited to bank account and deducted from customer account
EXEC PerformTransactions @SrcAccount = 1001001237, @BeneAccount = 1001001237, @ServiceID = 102, @Amount = 2, @TransactionType = 5;
select * from TransactionTable;
select * from Account;
select * from loan;



--CARD TRANSACTION TEST CASE
--Insufficient funds in card
EXEC PerformTransactions @SrcAccount = 1001001234, @BeneAccount = 1001001237, @ServiceID = 1, @Amount = 1000, @TransactionType = 6;
-- on successful transaction amount is debited from balance amount in card table
EXEC PerformTransactions @SrcAccount = 1001001234, @BeneAccount = 1001001237, @ServiceID = 1, @Amount = 100, @TransactionType = 6;
select * from TransactionTable;
select * from Card;



--CARD REFILL TEST CASE
---- on successful transaction amount is deducted from customer account and credit to bank account.Card balance amount is also updated in Card Table
EXEC PerformTransactions @SrcAccount = 1001001244, @BeneAccount = 1001001237, @ServiceID = 8, @Amount = 1000, @TransactionType = 7;
select * from TransactionTable;
select * from Card;
