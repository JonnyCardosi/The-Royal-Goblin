CREATE TABLE Appliance (
	Appliance_ID		    NUMBER(10,0)		NOT NULL,
	Appliance_Name	        VARCHAR(30)		    NOT NULL,
	Appliance_Type	        VARCHAR(30)		    NOT NULL
        CHECK (Appliance_Type IN ('Rinse Basin', 'Insulator', 'Cooker', 'Utensil')),
CONSTRAINT Appliance_PK PRIMARY KEY (Appliance_ID));


CREATE TABLE Food (
    Food_Name		VARCHAR(30)		NOT NULL,
    Food_Type		VARCHAR(30)
        CHECK (Food_Type IN ('Meat', 'Grain', 'Soup', 'Vegetable', 'Mix', 'Beverage')),
CONSTRAINT Food_PK PRIMARY KEY (Food_Name));


CREATE TABLE Supplier (
    Supplier_ID 		NUMBER(10,0)		NOT NULL,
  	Address		        VARCHAR(50),
  	City 			    VARCHAR(30),
  	State 			    VARCHAR(30),
  	Country 		    VARCHAR(30),
 	Contact_Info	 	VARCHAR(50) 		NOT NULL,
CONSTRAINT Supplier_PK PRIMARY KEY (Supplier_ID));


CREATE TABLE Employee (
    Employee_ID 			NUMBER(10,0) 	       NOT NULL,
    First_Name 			    VARCHAR(30) 		   NOT NULL,
  	Middle_Initial 			VARCHAR(1),
  	Last_Name 			    VARCHAR(30) 		   NOT NULL,
  	Building_No 			VARCHAR(30),
  	Address			        VARCHAR(50),
  	City 				    VARCHAR(30),
  	State 				    VARCHAR(30),
  	Country 			    VARCHAR(30),
  	Social_Security_Number 	NUMBER(9,0) 		   NOT NULL,
  	Date_Of_Birth 			DATE                   NOT NULL,
  	Date_Employed 		    DATE                   DEFAULT SYSDATE,
  	Full_Time 			    VARCHAR(3)
		CHECK (Full_Time IN ('Yes', 'No')),
  	Hourly_Salary 			NUMBER(4,2),
 	Yearly_Salary 			NUMBER(7,2),
CONSTRAINT Employee_PK PRIMARY KEY (Employee_ID));


CREATE TABLE Branch (
    Branch_ID 			        NUMBER(10,0)		    NOT NULL,
 	Building_No 		        VARCHAR(30),
  	Address			            VARCHAR(50)	    	    NOT NULL,
  	City 				        VARCHAR(30) 		    NOT NULL,
  	State 				        VARCHAR(30),
  	Country 			        VARCHAR(30) 		    NOT NULL,
  	Date_Established 	        DATE DEFAULT SYSDATE,
  	Metric_Area			        NUMBER(7,2),
 	Street_Parking_Spots 	    NUMBER(3,0),
  	Private_Parking_Spots 	    NUMBER(4,0),
    Daily_Expense 		        NUMBER(8,2),
  	Monthly_Expense 		    NUMBER(10,2),
    Daily_Revenue 		        NUMBER(8,2),
  	Monthly_Revenue 		    NUMBER(10,2),
CONSTRAINT Branch_PK PRIMARY KEY (Branch_ID));


CREATE TABLE Renovation (
    Renovation_ID 	        NUMBER(10,0) 	    NOT NULL,
  	Renovation_Title 	    VARCHAR(50)		    NOT NULL,
  	Description 		    VARCHAR(1000),
CONSTRAINT Renovation_PK PRIMARY KEY (Renovation_ID));


CREATE TABLE Dish (
    Dish_ID 		    NUMBER(10,0) 		NOT NULL,
  	Dish_Name 		    VARCHAR(30)		    NOT NULL,
  	Spice_Level 		NUMBER(1,0)
		CHECK (Spice_Level IN (0,1,2,3)),
  	Has_Dairy 		    VARCHAR(3)
        CHECK (Has_Dairy IN ('Yes', 'No')),		
  	Has_Eggs 		    VARCHAR(3)
        CHECK (Has_Eggs IN ('Yes', 'No')),		
  	Has_Gluten 		    VARCHAR(3)
        CHECK (Has_Gluten  IN ('Yes', 'No')), 		
  	Has_Peanuts 		VARCHAR(3)
        CHECK (Has_Peanuts IN ('Yes', 'No')), 
  	Total_Cost 		    NUMBER(5,2),
  	Selling_Price 		NUMBER(5,2),
CONSTRAINT Dish_PK PRIMARY KEY (Dish_ID));


CREATE TABLE Renovation_Permit (
    Renovation_ID 	        NUMBER(10,0)		NOT NULL,
    Permit_Title		    VARCHAR(50)		    NOT NULL,		
  	Permit_Description 	    VARCHAR(1000),
CONSTRAINT Renovation_Permit_PK PRIMARY KEY (Renovation_ID, Permit_Title),
CONSTRAINT Renovation_Permit_FK FOREIGN KEY (Renovation_ID) REFERENCES Renovation (Renovation_ID));


CREATE TABLE Construction (
    Construction_ID 	NUMBER(10,0) 	    NOT NULL,
    Branch_ID 		    NUMBER(10,0)		NOT NULL,
  	Renovation_ID 	    NUMBER(10,0)		NOT NULL,
  	Start_Date 		    DATE			    DEFAULT SYSDATE,
  	End_Date 		    DATE			    DEFAULT SYSDATE,
  	Cost 			    NUMBER(10,2),
  	Potential_Revenue 	NUMBER(10,2),
CONSTRAINT Construction_PK PRIMARY KEY (Construction_ID),
CONSTRAINT Construction_Branch_FK FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID),
CONSTRAINT Construction_Renovation_FK FOREIGN KEY (Renovation_ID) REFERENCES Renovation (Renovation_ID));


CREATE TABLE Rinse_Basin (
	RAppliance_ID			NUMBER(10,0)		NOT NULL,
    Water_Pressure		    NUMBER(5,2),
    Length				    NUMBER(5,2),
    Width				    NUMBER(5,2),
    Depth				    NUMBER(5,2),
CONSTRAINT Rinse_Basin_PK PRIMARY KEY (RAppliance_ID),
CONSTRAINT Rinse_Basin_FK FOREIGN KEY (RAppliance_ID) REFERENCES Appliance (Appliance_ID)); 


CREATE TABLE Cooker (
	CAppliance_ID		NUMBER(10,0)		NOT NULL,
	Max_Temp		    NUMBER(5,2),		
	Weight			    NUMBER(5,2),
CONSTRAINT Cooker_PK PRIMARY KEY (CAppliance_ID),
CONSTRAINT Cooker_FK FOREIGN KEY (CAppliance_ID) REFERENCES Appliance (Appliance_ID));
	

CREATE TABLE Insulator (
	IAppliance_ID		NUMBER(10,0)		NOT NULL,
	Min_Temp		    NUMBER(5,2),		
	Length			    NUMBER(5,2),
	Width			    NUMBER(5,2),
	Height			    NUMBER(5,2),
CONSTRAINT Insulator_PK PRIMARY KEY (IAppliance_ID),
CONSTRAINT Insulator_FK FOREIGN KEY (IAppliance_ID) REFERENCES Appliance (Appliance_ID));


CREATE TABLE Preparation (
    Preparation_ID			NUMBER(10,0)		NOT NULL,
    Appliance_ID			NUMBER(10,0)	    NOT NULL,
    Food_Name			    VARCHAR(30)		    NOT NULL,
    Food_Handled_Weekly	    NUMBER(5,0),
CONSTRAINT Preparation_PK PRIMARY KEY (Preparation_ID),
CONSTRAINT Preparation_Appliance_FK FOREIGN KEY (Appliance_ID) REFERENCES Appliance (Appliance_ID),
CONSTRAINT Preparation_Food_FK FOREIGN KEY (Food_Name) REFERENCES Food (Food_Name));


CREATE TABLE Usage (
    Usage_ID			NUMBER(10,0)		NOT NULL,
    Appliance_ID		NUMBER(10,0)		NOT NULL,
    Employee_ID 		NUMBER(10,0) 	    NOT NULL,
    Weekly_Usage		NUMBER(5,0),
CONSTRAINT Usage_PK PRIMARY KEY ( Usage_ID),
CONSTRAINT  Usage_Appliance_FK FOREIGN KEY (Appliance_ID) REFERENCES Appliance (Appliance_ID),
CONSTRAINT Usage_Employee_FK FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID));


CREATE TABLE Equipment (
    Equipment_ID		    NUMBER(10,0)		NOT NULL,
    Branch_ID 		        NUMBER(10,0) 	    NOT NULL,
	Appliance_ID		    NUMBER(10,0)		NOT NULL,
    Equipment_Count	        NUMBER(7,0),
CONSTRAINT Equipment_PK PRIMARY KEY ( Equipment_ID),
CONSTRAINT Equipment_Appliance_FK FOREIGN KEY (Appliance_ID) REFERENCES Appliance (Appliance_ID),
CONSTRAINT Equipment_Branch_FK FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID));


CREATE TABLE Ingredient (
    Ingredient_ID		    NUMBER(10,0)		NOT NULL,
    Food_Name		        VARCHAR(30)		    NOT NULL,
    Dish_ID 		        NUMBER(10,0) 	    NOT NULL,
    Ingredient_Count	    NUMBER(3,0),
CONSTRAINT Ingredient_PK PRIMARY KEY (Ingredient_ID),
CONSTRAINT Ingredient_Food_FK FOREIGN KEY (Food_Name) REFERENCES Food (Food_Name),
CONSTRAINT Ingredient_Dish_FK FOREIGN KEY (Dish_ID) REFERENCES Dish (Dish_ID));


CREATE TABLE Menu (
	Menu_ID		          NUMBER(10,0)		NOT NULL,
	Dish_ID 		      NUMBER(10,0) 	    NOT NULL,
    Branch_ID 		      NUMBER(10,0) 	    NOT NULL,
	Menu_Item_Count	      NUMBER(3,0),
CONSTRAINT Menu_PK PRIMARY KEY (Menu_ID),
CONSTRAINT Menu_Dish_FK FOREIGN KEY (Dish_ID) REFERENCES Dish (Dish_ID),
CONSTRAINT Menu_Branch_FK FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID));


CREATE TABLE Service (
	Service_ID		    NUMBER(10,0)		NOT NULL,
	Employee_ID 		NUMBER(10,0)		NOT NULL,
    Food_Name		    VARCHAR(30)		    NOT NULL,
	Total_Weight		NUMBER(3,2),
CONSTRAINT Service_PK PRIMARY KEY (Service_ID),
CONSTRAINT Service_Employee_FK FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID),
CONSTRAINT Service_Food_FK FOREIGN KEY (Food_Name) REFERENCES Food (Food_Name));


CREATE TABLE Staff (
	Staff_ID		    NUMBER(10,0)		NOT NULL,
    Employee_ID 		NUMBER(10,0)		NOT NULL,
    Branch_ID 		    NUMBER(10,0)		NOT NULL,
	Staff_Count		    NUMBER(4,0),
CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_Employee_FK FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID),
CONSTRAINT Staff_Branch_FK FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID));


CREATE TABLE Appliance_Shipment ( 
    AShipment_ID 		NUMBER(10,0)		NOT NULL,
    Supplier_ID 		NUMBER(10,0)		NOT NULL,
    Appliance_ID		NUMBER(10,0)		NOT NULL,
  	Date_Shipped 		DATE 			    DEFAULT SYSDATE,
  	Date_Arrived 		DATE			    DEFAULT SYSDATE,
  	Unit_Cost 		    NUMBER(10,2),	
  	Appliance_Count 	NUMBER(5,0),
CONSTRAINT Appliance_Shipment_PK PRIMARY KEY (AShipment_ID),
CONSTRAINT Appliance_Shipment_FK1 FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID),
CONSTRAINT Appliance_Shipment_FK2 FOREIGN KEY (Appliance_ID) REFERENCES Appliance (Appliance_ID));


CREATE TABLE Food_Shipment (
    FShipment_ID 		    NUMBER(10,0) 	    NOT NULL,
    Supplier_ID 		    NUMBER(10,0) 	    NOT NULL,
    Food_Name		        VARCHAR(30)		    NOT NULL,
  	Date_Shipped 		    DATE     		    DEFAULT SYSDATE,
 	Date_Arrived 		    DATE     		    DEFAULT SYSDATE,
  	Unit_Cost	 	        NUMBER(10,2),
    Unit_Sale_Price	 	    NUMBER(10,2),
  	Food_Count 		        NUMBER(5,0),
CONSTRAINT Food_Shipment_PK PRIMARY KEY (FShipment_ID),
CONSTRAINT Food_Shipment_Supplier_FK FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID),
CONSTRAINT Food_Shipment_Food_FK FOREIGN KEY (Food_Name) REFERENCES Food (Food_Name)); 

