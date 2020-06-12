--- zad 1
CREATE PROCEDURE fib
(
@ilosc INT
)

AS 
DECLARE @lfib INT=0;
DECLARE @l1 INT=0;
DECLARE @l2 INT=1;

IF @ilosc = 1
BEGIN
 SET @lfib=0 ;
END;
ELSE 
BEGIN
	WHILE @ilosc-1 > 1
	BEGIN
	 SET @lfib = @l1 + @l2;
	 SET @l1 = @l2;
	 SET @l2 = @lfib;
	 SET @ilosc = @ilosc-1;
	END;
END;
SELECT @lfib as Ciag_Fib;
RETURN;
EXEC Fib @ilosc = 5;

--- zad 2
CREATE TRIGGER trigging ON Person.Person 
FOR UPDATE AS
UPDATE Person SET LastName=upper(LastName)
UPDATE Person.Person SET FirstName='Terry' WHERE MiddleName='J'
SELECT * FROM Person.Person

--- zad 3
CREATE TRIGGER taxRateMonitoring ON Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
SET NOCOUNT ON;
 DECLARE @new FLOAT;
 DECLARE @old FLOAT;
 SELECT @new = TaxRate FROM inserted
 SELECT @old = TaxRate FROM deleted
 
 IF ((@new > @old + 0.3* @old) OR (@new < @old - 0.3* @old))
  BEGIN
     print 'B³¹d - zmiana wartoœci w polu TaxRate przekroczy³a 30%'
     ROLLBACK
     RETURN
  END;
 END;
UPDATE Sales.SalesTaxRate SET TaxRate='14' WHERE SalesTaxRateID=9
SELECT * FROM Sales.SalesTaxRate