USE ShopDB;
GO

CREATE TABLE dbo.Categories (
    CategoryID   INT IDENTITY(1,1) NOT NULL,
    Name         NVARCHAR(100) NOT NULL,
    Description  NVARCHAR(500) NULL,
    CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (CategoryID)
) ON FG_Data;
GO

CREATE TABLE dbo.Products (
    ProductID    INT IDENTITY(1,1) NOT NULL,
    CategoryID   INT NOT NULL,
    Name         NVARCHAR(200) NOT NULL,
    Price        DECIMAL(10,2) NOT NULL,
    Stock        INT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (ProductID),
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
        REFERENCES dbo.Categories(CategoryID)
) ON FG_Data;
GO

CREATE TABLE dbo.Customers (
    CustomerID   INT IDENTITY(1,1) NOT NULL,
    FirstName    NVARCHAR(100) NOT NULL,
    LastName     NVARCHAR(100) NOT NULL,
    Email        NVARCHAR(200) NOT NULL UNIQUE,
    Phone        NVARCHAR(50) NULL,
    CreatedAt    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED (CustomerID)
) ON FG_Data;
GO

CREATE TABLE dbo.Addresses (
    AddressID    INT IDENTITY(1,1) NOT NULL,
    CustomerID   INT NOT NULL,
    City         NVARCHAR(100) NOT NULL,
    Street       NVARCHAR(200) NOT NULL,
    PostalCode   NVARCHAR(20) NULL,
    CONSTRAINT PK_Addresses PRIMARY KEY CLUSTERED (AddressID),
    CONSTRAINT FK_Addresses_Customers FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
) ON FG_Data;
GO

CREATE TABLE dbo.Orders (
    OrderID      INT IDENTITY(1,1) NOT NULL,
    CustomerID   INT NOT NULL,
    OrderDate    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    Status       NVARCHAR(50) NOT NULL DEFAULT N'New',
    CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (OrderID),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
) ON FG_Data;
GO

CREATE TABLE dbo.OrderItems (
    OrderItemID  INT IDENTITY(1,1) NOT NULL,
    OrderID      INT NOT NULL,
    ProductID    INT NOT NULL,
    Quantity     INT NOT NULL,
    UnitPrice    DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_OrderItems PRIMARY KEY CLUSTERED (OrderItemID),
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID)
) ON FG_Data;
GO

CREATE TABLE dbo.Payments (
    PaymentID    INT IDENTITY(1,1) NOT NULL,
    OrderID      INT NOT NULL,
    Amount       DECIMAL(10,2) NOT NULL,
    PaidAt       DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    Method       NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Payments PRIMARY KEY CLUSTERED (PaymentID),
    CONSTRAINT FK_Payments_Orders FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID)
) ON FG_Data;
GO