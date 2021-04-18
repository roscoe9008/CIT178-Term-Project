/* Final Project Views */

/*View 1 (Updatable View)*/

/*
CREATE VIEW CostView
AS 
SELECT InventoryID, ProdName, MyCost
FROM dbo.Inventory
GO
*/

--SELECT * FROM CostView

/*
UPDATE CostView
SET MyCost = 10
WHERE InventoryID = 1
*/

--SELECT * FROM CostView

/*View 2*/

/*
CREATE VIEW CustomerToCity
AS
SELECT c.Name, CONCAT(z.City, ', ', z.State) AS CityState FROM dbo.Customers c
INNER JOIN	dbo.Zipcode z ON z.Zipcode = c.ZipCode;
GO
*/

--SELECT * FROM CustomerToCity


/*View 3*/
/*
CREATE VIEW OrderQuantity
AS
SELECT o.OrderID, i.ProdName, od.QTY
FROM Orders o
INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
INNER JOIN dbo.Inventory i ON i.InventoryID = od.InventoryID
GO
*/

--SELECT * FROM OrderQuantity

/*View 4*/

/*
CREATE VIEW InventoryCategories
AS 
SELECT DISTINCT Category AS ProductCategories
FROM dbo.Inventory 
GO
*/

--SELECT * FROM InventoryCategories