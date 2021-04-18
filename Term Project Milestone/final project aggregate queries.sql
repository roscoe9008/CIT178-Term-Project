/*Use ScentsyDB;
Select Zipcode.State, Count(Distinct Customers.CustID) AS [Customers per State]
From Customers Join Zipcode on Customers.ZipCode=Zipcode.Zipcode
Group by Zipcode.State
Order by Zipcode.State ASC;

Select Count(OrderDetails.InventoryID) AS [Total qty ordered], Inventory.ProdName,
Sum(OrderDetails.QTY)*Inventory.CustPrice as [Total Price]
From OrderDetails Join Inventory on OrderDetails.InventoryID=Inventory.InventoryID
group by Inventory.ProdName, inventory.CustPrice, Inventory.InventoryID
Order by Inventory.InventoryID;

select COUNT(OrderDetails.InventoryID) as [Total Items Ordered],
		AVG(Inventory.CustPrice) as [Average Cost per Item]
From OrderDetails join Inventory on OrderDetails.InventoryID=Inventory.InventoryID;

select min(Inventory.CustPrice*OrderDetails.QTY) as [Minimum Amount Due],
	   max(Inventory.CustPrice*OrderDetails.QTY) as [Maximum Amount Due],
	   avg(Inventory.CustPrice*OrderDetails.QTY) as [Average Amount Due]
From Inventory join OrderDetails on Inventory.InventoryID=OrderDetails.InventoryID;*/

