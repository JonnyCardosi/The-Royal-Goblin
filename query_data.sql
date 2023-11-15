SELECT Food_Name AS "Food Name", Food_Count AS "Quantity Ordered"
FROM Food_Shipment
WHERE Food_Name = 'Wheat Noodles' OR Food_Name = 'Gyhua Beef' OR Food_Name = 'White Rice' OR Food_Name = 'Tomato' OR Food_Name = 'Beef Base';

SELECT Food_Name AS "Drink Name", Food_Count AS "Quantity Ordered"
FROM Food_Shipment
WHERE Food_Name = 'Black Tea' OR Food_Name = 'Coca Cola';


SELECT First_Name AS "Employee Name", Yearly_Salary AS "Yearly Salary"
FROM Employee;


SELECT SUM(Unit_Sale_Price*Food_Count) AS "Total Food Sales (USD)"
FROM Food_Shipment
WHERE Food_Name = 'Wheat Noodles' OR Food_Name = 'Gyhua Beef' OR Food_Name = 'White Rice' OR Food_Name = 'Tomato' OR Food_Name = 'Beef Base';

SELECT SUM(Unit_Sale_Price*Food_Count) AS "Total Drink Sales (USD)"
FROM Food_Shipment
WHERE Food_Name = 'Black Tea' OR Food_Name = 'Coca Cola';


SELECT AVG(Monthly_Revenue) AS "Average Monthly Revenue (USD)"
FROM Branch;

SELECT AVG(Monthly_Expense) AS "Average Monthly Expense (USD)"
FROM Branch;
