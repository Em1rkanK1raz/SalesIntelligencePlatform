-- ============================================================
-- PROJE: SATIŞ & STOK ZEKA PLATFORMU
-- ADIM 1: VERİTABANI VE TABLOLARIN OLUŞTURULMASI
-- ============================================================

CREATE DATABASE SalesIntelligenceDB;
GO

USE SalesIntelligenceDB;
GO

CREATE TABLE Categories (
    CategoryID   INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description  NVARCHAR(255) NULL,
    CreatedAt    DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE Products (
    ProductID    INT IDENTITY(1,1) PRIMARY KEY,
    CategoryID   INT NOT NULL,
    ProductName  NVARCHAR(200) NOT NULL,
    SKU          NVARCHAR(50) UNIQUE NOT NULL,
    UnitPrice    DECIMAL(10,2) NOT NULL,
    CostPrice    DECIMAL(10,2) NOT NULL,
    StockQty     INT DEFAULT 0,
    MinStockQty  INT DEFAULT 10,
    IsActive     BIT DEFAULT 1,
    CreatedAt    DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

CREATE TABLE Customers (
    CustomerID   INT IDENTITY(1,1) PRIMARY KEY,
    FirstName    NVARCHAR(100) NOT NULL,
    LastName     NVARCHAR(100) NOT NULL,
    Email        NVARCHAR(200) UNIQUE NOT NULL,
    City         NVARCHAR(100) NULL,
    Country      NVARCHAR(100) DEFAULT 'Turkey',
    Segment      NVARCHAR(50) NULL,
    CreatedAt    DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE Orders (
    OrderID      INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID   INT NOT NULL,
    OrderDate    DATETIME2 NOT NULL,
    ShipDate     DATETIME2 NULL,
    Status       NVARCHAR(50) DEFAULT 'Pending',
    TotalAmount  DECIMAL(10,2) NULL,
    Discount     DECIMAL(5,2) DEFAULT 0,
    CreatedAt    DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

CREATE TABLE OrderItems (
    OrderItemID  INT IDENTITY(1,1) PRIMARY KEY,
    OrderID      INT NOT NULL,
    ProductID    INT NOT NULL,
    Quantity     INT NOT NULL,
    UnitPrice    DECIMAL(10,2) NOT NULL,
    Discount     DECIMAL(5,2) DEFAULT 0,
    LineTotal    AS (Quantity * UnitPrice * (1.0 - Discount / 100.0)) PERSISTED,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

CREATE TABLE InventoryLog (
    LogID          INT IDENTITY(1,1) PRIMARY KEY,
    ProductID      INT NOT NULL,
    ChangeType     NVARCHAR(50) NOT NULL,
    QuantityChange INT NOT NULL,
    StockAfter     INT NOT NULL,
    Note           NVARCHAR(255) NULL,
    CreatedAt      DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_InventoryLog_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
