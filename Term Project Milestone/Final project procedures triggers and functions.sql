/* Final Project Procedures */

--Stored procedure that retrieves and displays data 

/*
USE ScentsyDB;
GO
CREATE PROCEDURE sp_showCustomers
AS
SELECT * FROM dbo.Customers
ORDER BY Name
GO

EXEC dbo.sp_showCustomers
*/

--Stored procedure that takes 1 or more input parameters and retrieves results based on the value

/*
USE ScentsyDB;
GO
CREATE PROCEDURE sp_getInventoryItem @inventoryID INT
AS
BEGIN
    SELECT *
    FROM dbo.Inventory
    WHERE InventoryID = @inventoryID;
END;
GO

EXEC sp_getInventoryItem 2
*/

--Stored procedure that takes 1 or more input parameters and includes 1 or more output parameters

/*
USE ScentsyDB;
GO
CREATE PROC sp_CustomerContact
    @CustID INT,
    @Name NVARCHAR(30) OUTPUT,
    @Address NVARCHAR(70) OUTPUT,
    @Email NVARCHAR(50) OUTPUT,
    @CellNum NVARCHAR(15) OUTPUT
AS
SELECT @Name = Name,
       @Address = CONCAT(Address, ', ', ZipCode),
       @Email = Email,
       @CellNum = Cell#
FROM Customers
WHERE CustID = @CustID;
GO

DECLARE @Name NVARCHAR(30);
DECLARE @Address NVARCHAR(70);
DECLARE @Email NVARCHAR(50);
DECLARE @CellNum NVARCHAR(15);
EXEC sp_CustomerContact 3,
                        @Name OUTPUT,
                        @Address OUTPUT,
                        @Email OUTPUT,
                        @CellNum OUTPUT;
SELECT @Name AS 'Name',
       @Address AS 'Address',
       @Email AS 'Email Address',
       @CellNum AS 'Cell phone number';
*/

--Stored procedure that includes a return value


--Get number of customers in a specific zip code:

/*
USE ScentsyDB;
GO
CREATE PROC sp_CustomersInZipCode @ZipCode VARCHAR(12)
AS
DECLARE @CustomerCount INT;
SELECT @CustomerCount = COUNT(*)
FROM Customers
WHERE ZipCode = @ZipCode;
RETURN @CustomerCount;
GO

EXEC dbo.sp_CustomersInZipCode @ZipCode = '30120' -- varchar(12)
*/

/* Final Project User Defined Functions */

--Scalar function that accepts an argument

/*
USE ScentsyDB;
GO
CREATE FUNCTION fn_GetCustomer
    (@CustomerName nvarchar(30) = '%')
    RETURNS int 
BEGIN
    RETURN (SELECT CustID FROM dbo.Customers WHERE Name Like @CustomerName);
END; 


SELECT * FROM dbo.Customers

USE [ScentsyDB]
GO

SELECT [dbo].[fn_GetCustomer] (
   '%Rose%')
GO
*/


--Table function that accepts at least one argument

/*
USE ScentsyDB;
GO
CREATE FUNCTION fn_GetCustomersInZipCode
(
    @ZipCode NVARCHAR(12)
)
RETURNS TABLE
RETURN
(
    SELECT *
    FROM dbo.Customers
    WHERE ZipCode = @ZipCode
);

SELECT * FROM Customers
USE [ScentsyDB]
GO

SELECT * FROM [dbo].[fn_GetCustomersInZipCode] (
   '61821')
GO
*/

/* Final Project Triggers */

--Create Archival Customers table with activity column to store type of activity on Customers table:
/*
SELECT *
INTO CustomersArchive
FROM dbo.Customers
WHERE 1 = 2;

ALTER TABLE CustomersArchive ADD Activity VARCHAR(50);
GO
*/

--Trigger that will add deleted data from one of your tables into an archive or transaction table

/*
CREATE TRIGGER CustomerArchive_Delete ON Customers
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustID int
	DECLARE @Name nvarchar(30)
	DECLARE @Address nvarchar(50)
	DECLARE @ZipCode nvarchar(12)
	DECLARE @Email nvarchar(50)
	DECLARE @Cell# nvarchar(10)

    SELECT @CustID =DELETED.CustID, @Name = DELETED.Name, @Address = DELETED.Address,
	@ZipCode = DELETED.ZipCode, @Email = DELETED.Email, @Cell# = DELETED.Cell#
	FROM DELETED

    INSERT INTO dbo.CustomersArchive VALUES(@CustID,@Name,@Address, @ZipCode, @Email, @Cell#, 'Deleted' )
END
GO

SELECT * FROM CustomersArchive
--Deleting FK references to delete from Customers table:
DELETE FROM dbo.OrderDetails WHERE OrderID IN (SELECT OrderID FROM dbo.Orders WHERE CustomerID = 3)
DELETE FROM dbo.Orders WHERE CustomerID = 3
DELETE FROM dbo.Customers WHERE CustID = 3
SELECT * FROM CustomersArchive
*/

--Insert trigger that adds to the archive or transaction table when a row is inserted

/*
CREATE TRIGGER CustomerArchive_INSERT ON Customers
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustID int
	DECLARE @Name nvarchar(30)
	DECLARE @Address nvarchar(50)
	DECLARE @ZipCode nvarchar(12)
	DECLARE @Email nvarchar(50)
	DECLARE @Cell# nvarchar(10)

    SELECT @CustID =INSERTED.CustID, @Name = INSERTED.Name, @Address = INSERTED.Address,
	@ZipCode = INSERTED.ZipCode, @Email = INSERTED.Email, @Cell# = INSERTED.Cell#
	FROM INSERTED

    INSERT INTO dbo.CustomersArchive VALUES(@CustID,@Name,@Address, @ZipCode, @Email, @Cell#, 'Inserted' )
END
GO

SELECT * FROM dbo.Customers
INSERT INTO dbo.Customers
(
    CustID,
	Name,
    Address,
    ZipCode,
    Email,
    Cell#
)
VALUES
(   
	(SELECT (MAX(CustID) + 1) FROM dbo.Customers),
	'Elmer Austin', -- Name - varchar(30)
    'abcd', -- Address - varchar(50)
    '61821', -- ZipCode - varchar(12)
    'abcd@abcd.com', -- Email - varchar(50)
    '123456'  -- Cell# - varchar(15)
    )
SELECT * FROM dbo.CustomersArchive

*/

--Update trigger that adds to the archive or transaction table when a row is modified

/*
CREATE TRIGGER CustomerArchive_Update ON Customers
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    SET NOCOUNT ON;
    DECLARE @CustID int
	DECLARE @Name nvarchar(30)
	DECLARE @Address nvarchar(50)
	DECLARE @ZipCode nvarchar(12)
	DECLARE @Email nvarchar(50)
	DECLARE @Cell# nvarchar(10)

    SELECT @CustID =INSERTED.CustID, @Name = INSERTED.Name, @Address = INSERTED.Address,
	@ZipCode = INSERTED.ZipCode, @Email = INSERTED.Email, @Cell# = INSERTED.Cell#
	FROM INSERTED

	-- Since all the data is being written to the archive table, no need to identify what was changed
    INSERT INTO CustomersArchive VALUES(@CustID,@Name,@Address, @ZipCode, @Email, @Cell#, 'Updated' )
END
GO

UPDATE dbo.Customers
SET Name = 'Elmer Austin UPDATED'
WHERE CustID = (SELECT CustID FROM dbo.Customers WHERE Name = 'Elmer Austin')

SELECT * FROM CustomersArchive
*/