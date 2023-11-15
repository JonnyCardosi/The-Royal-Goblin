-- =====================================================
-- File Name:    exercise_insert_data.sql
-- Instructor:   Nguyen Thai
-- Student:      
-- Date:         
-- Description:  To populate data in SQL tables:
--                  Exercise_Customers
--                  Exercise_Items
--                  Exercise_Orders
-- =====================================================

INSERT INTO Exercise_Customers VALUES (12345, 'Smith', '23 High St.', 'Boston', 'MA', '02110', '(617)222-2222');
INSERT INTO Exercise_Customers VALUES (12341, 'Jones', '123 West St.', 'Salem', 'MA', '02321', '(617)222-2222');
INSERT INTO Exercise_Customers VALUES (23121, 'Barney', '329 South St.', 'Boston', 'MA', '02110', '(617)291-1212');
INSERT INTO Exercise_Customers VALUES (23111, 'Kelly', '75 Yarmouth St.', 'Natick', 'MA', '01583', '(508)111-1111');
INSERT INTO Exercise_Customers VALUES (21111, 'Brian', '65 Main St.', 'Quincy', 'MA', '02169', '(617)472-4171');
INSERT INTO Exercise_Customers VALUES (21112, 'West', '54 Porter St.', 'Cambridge', 'MA', '02393', '(617)233-2121');
INSERT INTO Exercise_Customers VALUES (21113, 'Taylor', '23 Prince St.', 'Boston', 'MA', '02110', '(617)230-2212');
INSERT INTO Exercise_Customers VALUES (21114, 'Namath', '35 Dyer St.', 'Salem', 'MA', '02321', '(781)223-2121');
INSERT INTO Exercise_Customers VALUES (21115, 'Popkin', '356 Union St.', 'Lynn', 'MA', '01827', '(617)233-2232');
INSERT INTO Exercise_Customers VALUES (21116, 'Rice', '87 Boyston St.', 'Boston', 'MA', '02932', '(617)222-2220');

Insert into Exercise_Items values (98672, 'desk chair', 'Chair');
Insert into Exercise_Items values (98532, 'Desk Lamp', 'Lamp');
Insert into Exercise_Items values (98533, 'Floor Lamp I', 'Lamp');
Insert into Exercise_Items values (98421, 'Sofa', 'LRF');
Insert into Exercise_Items values (98321, 'Futon', 'LRF');
Insert into Exercise_Items values (98231, 'Recliner', 'LRF');
Insert into Exercise_Items values (98675, 'Table', 'DRF');
Insert into Exercise_Items values (98642, 'Bed', 'BRF');
Insert into Exercise_Items values (98754, 'Desk', 'LRF');
Insert into Exercise_Items values (98253, 'Filing Cabinet', 'OFF');

INSERT INTO Exercise_Orders VALUES (34567,	12345,	98672,	22);
INSERT INTO Exercise_Orders VALUES (34568,	21112,	98532,	3);
INSERT INTO Exercise_Orders VALUES (34569,	21114,	98532,	1);
INSERT INTO Exercise_Orders VALUES (34570,	21116,	98421,	201);
INSERT INTO Exercise_Orders VALUES (34571,	21115,	98321,	12);
INSERT INTO Exercise_Orders VALUES (34572,	12341,	98231,	1);
INSERT INTO Exercise_Orders VALUES (34573,	23121,	98675,	232);
INSERT INTO Exercise_Orders VALUES (34574,	23111,	98642,	12);
INSERT INTO Exercise_Orders VALUES (34575,	23121,	98754,	2);
INSERT INTO Exercise_Orders VALUES (34576,	21111,	98253,	33);

