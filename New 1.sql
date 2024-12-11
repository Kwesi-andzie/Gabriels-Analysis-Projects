CREATE DATABASE Shopping;

CREATE TABLE Customer
(CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(20) NOT NULL,
Email VARCHAR(25),
PhoneNumber CHAR(10) NOT NULL
); 

INSERT ALL
    INTO Customer(CustomerID,CustomerName,Email,PhoneNumber)VALUES('26563','Josh','SuperJosh@gmail.com','5712233232')
    INTO Customer(CustomerID,CustomerName,Email,PhoneNumber)VALUES('26564','Drake','DrakeKnowsBest@yahoo.com','6067677876')
    INTO Customer(CustomerID,CustomerName,Email,PhoneNumber)VALUES('26565','Samamtha','SamEverything@gmail.com','2025433563')
    INTO Customer(CustomerID,CustomerName,Email,PhoneNumber)VALUES('26566','Fanum','LuvFanum@outlook.com','4348677867')
    INTO Customer(CustomerID,CustomerName,Email,PhoneNumber)VALUES('26567','Mike','MiketheKing@yahoo.com','4549987897')
SELECT * FROM DUAL ;
COMMIT;
    


SELECT CustomerID,CustomerName,Email
FROM Customer
WHERE PhoneNumber= 2025433563;




-- FOCUSING ON JOINS AND NULL VALUES 
SELECT * 
FROM Customer
INNER JOIN Transaction_Info
ON Customer.CustomerID = Transaction_Info.CustomerID;


SELECT CustomerName,Email,PhoneNumber
FROM Customer;

--Business user requirement -see provided detailed view of customer transactions showing specific customer information with their associated transaction details.
SELECT CustomerName,PhoneNumber,Payment_Method,Total_Amount,Trans_Date
FROM Customer
RIGHT JOIN Transaction_Info
ON Customer.CustomerID = Transaction_Info.CustomerId;

SELECT CustomerName,Email,PhoneNumber
FROM Customer
LEFT JOIN Transaction_Info
ON Customer.CustomerID = Transaction_Info.CustomerId;



CREATE TABLE Transaction_Info
(TransactionID INT PRIMARY KEY NOT NULL,
Payment_Method VARCHAR(10) NOT NULL,
Total_Amount DECIMAL(3,2),
Trans_Date DATE NOT NULL,
CustomerID INT NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--Add FK constraint name
--Constraint does not exist due to db already given the FK one 
ALTER TABLE Transaction_Info 
DROP CONSTRAINT CustomerID;

ALTER TABLE Transaction_Info 
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);



ALTER TABLE Transaction_Info 
MODIFY Payment_Method VARCHAR(12);

DESCRIBE TABLE Transaction_Info;

INSERT ALL
    INTO Transaction_Info(TransactionID,Payment_Method,Total_Amount,Trans_Date,CustomerID)VALUES('445','Apple Pay','116.52','5-DEC-2024','26563')
    INTO Transaction_Info(TransactionID,Payment_Method,Total_Amount,Trans_Date,CustomerID)VALUES('446','Credit Card','84.12','10-OCT-2024','26565')
    INTO Transaction_Info(TransactionID,Payment_Method,Total_Amount,Trans_Date,CustomerID)VALUES('447','Debit Card','203.68','1-MAR-2024','26566')
    INTO Transaction_Info(TransactionID,Payment_Method,Total_Amount,Trans_Date,CustomerID)VALUES('448','Google Pay','52.04','8-FEB-2024','26567')
    INTO Transaction_Info(TransactionID,Payment_Method,Total_Amount,Trans_Date,CustomerID)VALUES('449','Cash','150.00','9-NOV-2024','26564')
SELECT * FROM DUAL;
COMMIT;





CREATE TABLE Purchase_Details
(Quantity NUMBER,
Subtotal INT NOT NULL,
Discount DECIMAL(4,2) NOT NULL,
Tax DECIMAL(3,1),
Shipping_Cost INT, 
CustomerID INT NOT NULL,
FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);


---changed the datatype applied to the developed data

ALTER TABLE Purchase_Details 
MODIFY Discount DECIMAL(5,4);

ALTER TABLE Purchase_Details 
MODIFY Tax DECIMAL(1,2);

ALTER TABLE Purchase_Details 
MODIFY Shipping_Cost DECIMAL(1,2);

INSERT ALL 
        INTO Purchase_Details(Quantity,Subtotal,Discount,Tax,Shipping_Cost,CustomerID)VALUES('12','105','0.2400','2.36','5.36','26563')
        INTO Purchase_Details(Quantity,Subtotal,Discount,Tax,Shipping_Cost,CustomerID)VALUES('35','195','0.1500','1.36','8.36','26564')
        INTO Purchase_Details(Quantity,Subtotal,Discount,Tax,Shipping_Cost,CustomerID)VALUES('8','78','0.3000','3.36','3.36','26565')
        INTO Purchase_Details(Quantity,Subtotal,Discount,Tax,Shipping_Cost,CustomerID)VALUES('7','50','0.1000','9.36','2.36','26566')
        INTO Purchase_Details(Quantity,Subtotal,Discount,Tax,Shipping_Cost,CustomerID)VALUES('23','145','0.5000','9.36','7.36','26567')
SELECT * FROM DUAL;
COMMIT;







CREATE TABLE Location
(StoreID INT NOT NULL,
StoreName VARCHAR(15) NOT NULL,
Location VARCHAR(20) NOT NULL,
Channel VARCHAR(10),
TransactionID INT NOT NULL,
FOREIGN KEY(TransactionID) REFERENCES Transaction_Info(TransactionID)
);


SELECT *
FROM Location
INNER JOIN Transaction_Info
ON Location.TransactionID = Transaction_Info.TransactionID;

--Business User wants to see requirment based on store data and which customer purchases
SELECT Location.Location,StoreName,Payment_Method,Transaction_Info.TransactionID,Customer.CustomerName
FROM Location
LEFT JOIN Transaction_Info
ON Location.TransactionID = Transaction_Info.TransactionID
RIGHT JOIN Customer
ON Customer.CustomerID = Transaction_Info.CustomerID;


INSERT ALL
        INTO Location(StoreID,StoreName,Location,Channel,TransactionID)VALUES('123','Walmart','Chicago,Illinois','In-store','445')
        INTO Location(StoreID,StoreName,Location,Channel,TransactionID)VALUES('456','Costco','Las Vegas,Nevada','In-store','447')
        INTO Location(StoreID,StoreName,Location,Channel,TransactionID)VALUES('789','Target','Washington DC','Pickup','446')
        INTO Location(StoreID,StoreName,Location,Channel,TransactionID)VALUES('321','Giant','Dallas,Texas','Delivery','448')
        INTO Location(StoreID,StoreName,Location,Channel,TransactionID)VALUES('765','LA-Mart','Arlington,Virginia','Pickup','449')
    SELECT * FROM DUAL;

---Add PK to establish FK to reference
ALTER TABLE Location 
ADD CONSTRAINT StoreID 
PRIMARY KEY(StoreID);





CREATE TABLE Product
(ProductID INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(25) NOT NULL,
Description CLOB,
Price DECIMAL(4,2) NOT NULL,
StockQuantity INT,
CustomerID INT NOT NULL,
FOREIGN KEY(CustomerID)REFERENCES Customer(CustomerID)
); 

---Deleted column Description
ALTER TABLE Product 
DROP COLUMN Description;

ALTER TABLE Product
MODIFY Price DECIMAL(6,2);

INSERT ALL
        INTO Product(ProductID,ProductName,Price,StockQuantity,CustomerID)VALUES('223','Downy Wipes','15.00','1500','26567')
        INTO Product(ProductID,ProductName,Price,StockQuantity,CustomerID)VALUES('224','Nike Tech Sweatsuit','200.00','20','26564')
        INTO Product(ProductID,ProductName,Price,StockQuantity,CustomerID)VALUES('225','AmericanEagle shorts','40.00','200','26563')
        INTO Product(ProductID,ProductName,Price,StockQuantity,CustomerID)VALUES('226','UnderArmor Hoodie','65.00','200','26565')
        INTO Product(ProductID,ProductName,Price,StockQuantity,CustomerID)VALUES('227','Champion Tshirt','35.00','100','26566')
SELECT * FROM DUAL;

--ADD CONSTRAINT NAMES TO FKs & PKs 


CREATE TABLE Employee
(EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(10) NOT NULL,
LastName VARCHAR(20) NOT NULL,
JobTitle VARCHAR(50) NOT NULL,
Salary DECIMAL(10,2) NOT NULL,
StoreID INT NOT NULL,
TransactionID INT NOT NULL,
FOREIGN KEY (StoreID) REFERENCES Location(StoreID),
FOREIGN KEY (TransactionID) REFERENCES Transaction_Info(TransactionID)
);  

 SELECT * FROM Employee;
   
select '55636','Jonathan','Jonathanlul@yahoo.com','4048449353'
from dual
union all
select '78765','Selena', 'SelenaGomez@gmail.com','7035657655'
from dual;
commit;
      



 