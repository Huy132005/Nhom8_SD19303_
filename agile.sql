CREATE DATABASE TuongGoPhongThuy;
GO
USE TuongGoPhongThuy;
GO

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
INSERT INTO Categories (name, slug, description)
VALUES
('Phật Giáo', 'phat-giao', 'Các sản phẩm tượng Phật mang ý nghĩa tâm linh.'),
('Phong Thủy', 'phong-thuy', 'Sản phẩm phong thủy đem lại may mắn.'),
('Tượng Thú', 'tuong-thu', 'Tượng động vật với các ý nghĩa biểu trưng.'),
('Chữ và Biểu Tượng', 'chu-bieu-tuong', 'Tượng chữ và biểu tượng truyền thống.'),
('Nghệ Thuật Đương Đại', 'nghe-thuat-duong-dai', 'Sản phẩm nghệ thuật hiện đại.'),
('Gỗ Quý', 'go-quy', 'Tượng gỗ từ nguyên liệu cao cấp.'),
('Phúc Lộc Thọ', 'phuc-loc-tho', 'Sản phẩm mang biểu tượng Tam Đa.'),
('Thần Tài', 'than-tai', 'Các sản phẩm tượng Thần Tài truyền thống.'),
('Trang Trí Nhà Cửa', 'trang-tri-nha-cua', 'Các sản phẩm dùng trang trí nội thất.'),
('Quà Tặng Cao Cấp', 'qua-tang-cao-cap', 'Sản phẩm quà tặng giá trị.'),
('Phong Cảnh', 'phong-canh', 'Tượng mô phỏng phong cảnh đẹp.'),
('Lịch Sử', 'lich-su', 'Tượng mang ý nghĩa lịch sử.'),
('Truyền Thống Việt Nam', 'truyen-thong-viet-nam', 'Sản phẩm tượng Việt Nam truyền thống.'),
('Thiền Tịnh', 'thien-tinh', 'Tượng mang ý nghĩa thiền tịnh.'),
('Đồ Thủ Công', 'do-thu-cong', 'Tượng gỗ thủ công tỉ mỉ.');

INSERT INTO Orders (customer_name, customer_phone, customer_address, total_amount, status)
VALUES
('Nguyễn Văn A', '0987654321', 'Hà Nội, Việt Nam', 5000000, 'COMPLETED'),
('Trần Thị B', '0978543212', 'TP.HCM, Việt Nam', 3000000, 'PROCESSING'),
('Lê Văn C', '0945678912', 'Đà Nẵng, Việt Nam', 1500000, 'PENDING'),
('Phạm Thị D', '0912345678', 'Hải Phòng, Việt Nam', 1000000, 'CANCELLED'),
('Bùi Minh E', '0909123456', 'Cần Thơ, Việt Nam', 4500000, 'COMPLETED'),
('Ngô Hoàng F', '0938123123', 'Quảng Ninh, Việt Nam', 2200000, 'PROCESSING'),
('Vũ Thị G', '0923456789', 'Thanh Hóa, Việt Nam', 3200000, 'COMPLETED'),
('Dương Văn H', '0987123456', 'Nghệ An, Việt Nam', 1800000, 'PROCESSING'),
('Hoàng Tuấn I', '0918123456', 'Bắc Giang, Việt Nam', 900000, 'PENDING'),
('Nguyễn Thị J', '0978123456', 'Bình Dương, Việt Nam', 2400000, 'COMPLETED'),
('Trần Thị K', '0938567890', 'Vĩnh Long, Việt Nam', 2700000, 'CANCELLED'),
('Lê Quốc L', '0918123786', 'Hậu Giang, Việt Nam', 3600000, 'PROCESSING'),
('Đinh Minh M', '0945623478', 'Huế, Việt Nam', 4200000, 'COMPLETED'),
('Nguyễn Văn N', '0923123456', 'Bình Phước, Việt Nam', 500000, 'PENDING'),
('Phạm Thanh O', '0987123123', 'Quảng Trị, Việt Nam', 1200000, 'PROCESSING');

INSERT INTO Products (name, slug, description, price, stock, image_url, dimensions, material, category_id)
VALUES
('Tượng Di Lặc', 'tuong-di-lac', 'Tượng Di Lặc mang ý nghĩa phúc lộc và thịnh vượng.', 1500000, 10, 'https://example.com/tuong-di-lac.jpg', '30x20x15 cm', 'Gỗ hương', 1),
('Tượng Phật Thích Ca', 'tuong-phat-thich-ca', 'Tượng Phật Thích Ca dành cho thiền tịnh và tâm an.', 2000000, 5, 'https://example.com/tuong-phat-thich-ca.jpg', '40x25x20 cm', 'Gỗ bách xanh', 2),
('Tượng Quan Công', 'tuong-quan-cong', 'Tượng Quan Công tượng trưng cho chính nghĩa và trung thành.', 1800000, 8, 'https://example.com/tuong-quan-cong.jpg', '35x22x18 cm', 'Gỗ mít', 3),
('Tượng Đạt Ma', 'tuong-dat-ma', 'Tượng Đạt Ma đại diện cho sự kiên nhẫn và giác ngộ.', 1600000, 12, 'https://example.com/tuong-dat-ma.jpg', '25x20x15 cm', 'Gỗ trắc', 4),
('Tượng Phúc Lộc Thọ', 'tuong-phuc-loc-tho', 'Tượng Tam Đa mang đến phúc, lộc, thọ cho gia đình.', 2500000, 7, 'https://example.com/tuong-phuc-loc-tho.jpg', '50x30x25 cm', 'Gỗ gụ', 5),
('Tượng Rồng Phun Ngọc', 'tuong-rong-phun-ngoc', 'Tượng rồng phong thủy mang ý nghĩa quyền lực và tài lộc.', 3000000, 15, 'https://example.com/tuong-rong-phun-ngoc.jpg', '60x25x20 cm', 'Gỗ hương', 6),
('Tượng Cá Chép Hóa Rồng', 'tuong-ca-chep-hoa-rong', 'Tượng cá chép tượng trưng cho sự thăng tiến và may mắn.', 1200000, 20, 'https://example.com/tuong-ca-chep-hoa-rong.jpg', '40x20x15 cm', 'Gỗ trắc', 7),
('Tượng Mã Đáo Thành Công', 'tuong-ma-dao-thanh-cong', 'Tượng ngựa mang ý nghĩa sự phát đạt và thành công.', 2500000, 10, 'https://example.com/tuong-ma-dao-thanh-cong.jpg', '50x30x25 cm', 'Gỗ gụ', 8),
('Tượng Phật Di Đà', 'tuong-phat-di-da', 'Tượng Phật Di Đà mang sự an lạc và bình yên.', 1700000, 8, 'https://example.com/tuong-phat-di-da.jpg', '35x22x18 cm', 'Gỗ bách xanh', 1),
('Tượng Phật Bà Quan Âm', 'tuong-phat-ba-quan-am', 'Tượng Quan Âm Bồ Tát hiện thân của lòng từ bi.', 2200000, 12, 'https://example.com/tuong-phat-ba-quan-am.jpg', '45x25x20 cm', 'Gỗ mít', 2),
('Tượng Hổ Uy Nghiêm', 'tuong-ho-uy-nghiem', 'Tượng hổ tượng trưng cho sự dũng mãnh và thành công.', 2800000, 6, 'https://example.com/tuong-ho-uy-nghiem.jpg', '50x30x20 cm', 'Gỗ lim', 3),
('Tượng Voi May Mắn', 'tuong-voi-may-man', 'Tượng voi biểu trưng cho trí tuệ và sự trường tồn.', 1400000, 10, 'https://example.com/tuong-voi-may-man.jpg', '30x20x15 cm', 'Gỗ xoan đào', 4),
('Tượng Chữ Phúc', 'tuong-chu-phuc', 'Tượng chữ Phúc mang ý nghĩa sự sung túc và viên mãn.', 800000, 25, 'https://example.com/tuong-chu-phuc.jpg', '25x15x10 cm', 'Gỗ hương', 5),
('Tượng Thần Tài', 'tuong-than-tai', 'Tượng Thần Tài giúp mang lại phúc lộc dồi dào.', 2600000, 8, 'https://example.com/tuong-than-tai.jpg', '40x20x18 cm', 'Gỗ trắc', 6),
('Tượng Lân Uy Nghiêm', 'tuong-lan-uy-nghiem', 'Tượng Lân phong thủy mang ý nghĩa bảo vệ và may mắn.', 1900000, 14, 'https://example.com/tuong-lan-uy-nghiem.jpg', '45x30x25 cm', 'Gỗ gụ', 7);

INSERT INTO Users (username, password, full_name, role)
VALUES
('admin', 'hashed_password_admin', 'Quản Trị Viên', 'ADMIN'),
('customer1', 'hashed_password_cust1', 'Nguyễn Văn A', 'CUSTOMER'),
('customer2', 'hashed_password_cust2', 'Trần Thị B', 'CUSTOMER'),
('customer3', 'hashed_password_cust3', 'Lê Văn C', 'CUSTOMER'),
('customer4', 'hashed_password_cust4', 'Phạm Thị D', 'CUSTOMER'),
('customer5', 'hashed_password_cust5', 'Bùi Minh E', 'CUSTOMER'),
('customer6', 'hashed_password_cust6', 'Ngô Hoàng F', 'CUSTOMER'),
('customer7', 'hashed_password_cust7', 'Vũ Thị G', 'CUSTOMER'),
('customer8', 'hashed_password_cust8', 'Dương Văn H', 'CUSTOMER'),
('customer9', 'hashed_password_cust9', 'Hoàng Tuấn I', 'CUSTOMER'),
('customer10', 'hashed_password_cust10', 'Nguyễn Thị J', 'CUSTOMER'),
('customer11', 'hashed_password_cust11', 'Trần Thị K', 'CUSTOMER'),
('customer12', 'hashed_password_cust12', 'Lê Quốc L', 'CUSTOMER'),
('customer13', 'hashed_password_cust13', 'Đinh Minh M', 'CUSTOMER'),
('customer14', 'hashed_password_cust14', 'Nguyễn Văn N', 'CUSTOMER');

INSERT INTO OrderItems (order_id, product_id, quantity, price_at_purchase)
VALUES
(1, 1, 2, 1500000),
(1, 2, 1, 2000000),
(2, 3, 3, 1800000),
(2, 4, 1, 1600000),
(3, 5, 2, 2500000),
(4, 6, 4, 3000000),
(5, 7, 1, 1200000),
(6, 8, 3, 2500000),
(7, 9, 2, 1700000),
(8, 10, 1, 2200000),
(9, 11, 5, 2800000),
(10, 12, 1, 1400000),
(11, 13, 2, 800000),
(12, 14, 1, 2600000),
(13, 15, 1, 1900000);


