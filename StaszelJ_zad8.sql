---zad1
BEGIN
	SELECT AVG(Rate) AS AVGstawka FROM HumanResources.EmployeePayHistory;
	SELECT hre.*, hrepr.Rate FROM HumanResources.EmployeePayHistory hrepr, HumanResources.Employee hre
	WHERE hrepr.BusinessEntityID = hre.BusinessEntityID AND hrepr.Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory);
END;

---zad2
CREATE OR ALTER FUNCTION dbo.ShipDateOrder(
@OrderID INT)
RETURNS DATETIME
AS
BEGIN 
	DECLARE @ShipDate DATETIME;
	SELECT @ShipDate = ShipDate from Purchasing.PurchaseOrderHeader WHERE PurchaseOrderID = @OrderID;
	RETURN @ShipDate;
END;
SELECT dbo.ShipDateOrder(27);

---zad3
CREATE OR ALTER PROCEDURE InfoProdukt @Nazwa NVARCHAR(50)
AS BEGIN
	SELECT ProductID, ProductNumber, SafetyStockLevel FROM Production.Product WHERE Name=@Nazwa;
END;
EXEC InfoProdukt @Nazwa = 'Blade';

---zad4
CREATE OR ALTER FUNCTION dbo.NumerKarty(
@OrderID INT)
RETURNS NVARCHAR(25)
AS
BEGIN 
	DECLARE @Card NVARCHAR(25);
	SELECT @Card = scc.CardNumber 
		FROM Sales.CreditCard scc 
		INNER JOIN Sales.SalesOrderHeader ssoh
		ON scc.CreditCardID = ssoh.CreditCardID
		AND @OrderID = ssoh.SalesOrderID
	RETURN @Card;
END;
SELECT dbo.NumerKarty(43660);

---zad5
CREATE OR ALTER PROCEDURE Dzielenie @num1 FLOAT, @num2 FLOAT
AS 
BEGIN
	DECLARE @div FLOAT
	IF @num1 > @num2
	BEGIN 
		SELECT @div = @num1 / @num2;
		PRINT 'Wynik dzielenia to: ' 
		PRINT @div
	END
	ELSE
	BEGIN
		PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
	END
END;
EXEC Dzielenie @num1 = 4.0, @num2 = 3.0;