use try;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    JoinDate DATE,
    Region VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Parshwa', 'Shah', 'Parshwa@gmail.com', '2021-01-15', 'North'),
(2, 'Raj', 'kumar', 'Raj123@gmail.com', '2021-03-22', 'South');

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Smartphone', 'Electronics', 600.00);

INSERT INTO Sales VALUES
(1, 1, 1, '2021-05-10', 1, 800.00),
(2, 2, 2, '2021-05-15', 2, 1200.00);

INSERT INTO Regions VALUES
(1, 'North'),
(2, 'South');

-- total revenue by year
SELECT 
    YEAR(SaleDate) AS Year,
    SUM(TotalAmount) AS TotalRevenue
FROM 
    Sales
GROUP BY 
    YEAR(SaleDate)
ORDER BY 
    Year;
    
    -- Top 5 Selling products
    SELECT 
    p.ProductName,
    SUM(s.Quantity) AS TotalSold
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    TotalSold DESC
LIMIT 5;

-- Sales By region 
SELECT 
    r.RegionName,
    SUM(s.TotalAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    Customers c ON s.CustomerID = c.CustomerID
JOIN 
    Regions r ON c.Region = r.RegionName
GROUP BY 
    r.RegionName
ORDER BY 
    TotalSales DESC;
    
    -- CRA
    
    SELECT 
    YEAR(SaleDate) AS Year,
    COUNT(DISTINCT CustomerID) AS ActiveCustomers
FROM 
    Sales
GROUP BY 
    YEAR(SaleDate)
ORDER BY 
    Year;




