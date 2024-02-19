
SET XACT_ABORT ON;


DECLARE @sourceAcc INT = 1234567899; -- Source account number
DECLARE @destAcc INT = 1234567898;   -- Destination account number
DECLARE @fundsToTransfer DECIMAL(10, 2) = 150.00; -- Amount to transfer

BEGIN TRY

    BEGIN TRANSACTION;

    UPDATE Accounts
    SET Balance = Balance - @fundsToTransfer
    WHERE AccountNumber = @sourceAcc;


    UPDATE Accounts
    SET Balance = Balance + @fundsToTransfer
    WHERE AccountNumber = @destAcc;


    COMMIT TRANSACTION;


    PRINT 'Fund transfer completed successfully.';

END TRY
BEGIN CATCH

    ROLLBACK TRANSACTION;


    PRINT 'An error occurred during the fund transfer. Transaction has been rolled back.';
END CATCH;
