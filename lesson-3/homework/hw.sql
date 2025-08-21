BULK INSERT SQL Serverga tashqi fayldan (masalan, .txt yoki .csv) katta hajmdagi ma’lumotlarni tezda import qilish uchun ishlatiladi.


List four file formats that can be imported into SQL Server.

CSV, TXT, XML, JSON formatlari import qilininshi mumkin.
drop table Products2

CREATE TABLE Products2 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products2 (ProductID, ProductName, Price) VALUES
(1, 'Notebook', 1325.50),
(2, 'Iphone', 1850.00),
(3, 'Earphones', 190.50);



Explain the difference between NULL and NOT NULL.

NULL – qiymat yo‘qligini bildiradi.

NOT NULL – ustunda albatta qiymat bo‘lishini ta’minlaydi.


ALTER TABLE Products2
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

SELECT * FROM Products2;

ALTER TABLE Products2
ADD CategoryID INT;

CREATE TABLE Categories0 (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);


Explain the purpose of the IDENTITY column in SQL Server.
IDENTITY ustuni avtomatik tarzda raqamlarni ketma-ket yaratib beradi. 

BULK INSERT Products2
FROM 'C:\\Users\\user\\Desktop\\Emails.csv'
WITH (
    FIELDTERMINATOR = ',',   
    ROWTERMINATOR = '\r\n',    
    FIRSTROW = 2
);
ALTER TABLE Products2
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


Explain the differences between PRIMARY KEY and UNIQUE KEY.
PRIMARY KEY: ustunni asosiy identifikator qiladi, NULL qabul qilmaydi. Har bir jadvalda PRIMARY KEY bittadan ko'p bo'laolmaydi.
UNIQUE KEY: ustundagi qiymatlar alohida hususiyarga (unique) ega bo‘lishi kerak, lekin bir nechta bo'lishi mumkin; 


ALTER TABLE Products2
ADD CONSTRAINT CHK_Price1 CHECK (Price > 0);

ALTER TABLE Products2
ADD Stock INT NOT NULL DEFAULT 0;

SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products2;


Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
FOFOREIGN KEY — bu jadvallar orasida ota-bola munosabatini o‘rnatadi va ma’lumotlarning noto‘g‘ri kiritilishiga yo‘l qo‘ymaydiю

CREATE TABLE Customers12 (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

CREATE TABLE Operations (
    OrderID INT IDENTITY(100, 10) PRIMARY KEY,
    OrderDate DATE
);

CREATE TABLE OrderDetails1 (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);



Explain the use of COALESCE and ISNULL functions for handling NULL values.

ISNULL(expression, replacement) → agar expression NULL bo‘lsa, replacementni qaytaradi.

COALESCE: birinchi NULL bo‘lmagan qiymatni qaytaradi va ko‘p argumentni qabul qiladi, ISNULL esa faqat 2 ta qabul qiladi.

CREATE TABLE Employees3 (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

ALTER TABLE OrderDetails1
ADD CONSTRAINT FK_OrderDetails1_Orders
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ON DELETE CASCADE
ON UPDATE CASCADE;
