CREATE DATABASE TuongGoPhongThuy
go
use TuongGoPhongThuy
go

CREATE TABLE Categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL UNIQUE,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description NTEXT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE Orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name NVARCHAR(150) NULL,
    customer_phone VARCHAR(20) NULL,
    customer_address NVARCHAR(500) NULL,
    total_amount DECIMAL(18,2) NOT NULL CHECK (total_amount >= 0),
    status VARCHAR(50) DEFAULT 'PENDING' CHECK (status IN ('CANCELLED', 'COMPLETED', 'PROCESSING', 'PENDING')),
    order_date DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE Products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description NTEXT NULL,
    price DECIMAL(18,2) NOT NULL CHECK (price >= 0),
    stock INT DEFAULT 0 CHECK (stock >= 0),
    image_url VARCHAR(512) NULL,
    dimensions NVARCHAR(100) NULL,
    material NVARCHAR(100) NULL,
    category_id INT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE SET NULL
);

CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name NVARCHAR(150) NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('CUSTOMER', 'ADMIN')),
    created_at DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE OrderItems (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE SET NULL
);
