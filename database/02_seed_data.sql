-- ============================================================
-- PROJE: SATIŞ & STOK ZEKA PLATFORMU
-- ADIM 2: SEED DATA (KATEGORİ VE ÜRÜNLER)
-- ============================================================

USE SalesIntelligenceDB;
GO

INSERT INTO Categories (CategoryName, Description) VALUES
('Elektronik',      'Telefon, bilgisayar, tablet ve aksesuarlar'),
('Giyim',           'Erkek, kadın ve çocuk giyim ürünleri'),
('Ev & Yaşam',      'Mobilya, mutfak ve dekorasyon ürünleri'),
('Spor & Outdoor',  'Spor ekipmanları, fitness ve outdoor'),
('Kitap & Hobi',    'Kitaplar, masa oyunları ve hobi setleri');
GO

INSERT INTO Products (CategoryID, ProductName, SKU, UnitPrice, CostPrice, StockQty, MinStockQty) VALUES
(1, 'Akıllı Telefon X12',       'ELK-001', 8999.99,  5500.00, 45, 10),
(1, 'Kablosuz Kulaklık Pro',     'ELK-002',  899.99,   450.00, 80, 15),
(1, 'Laptop UltraSlim 15"',      'ELK-003', 14999.99, 9000.00, 20,  5),
(1, 'Tablet S8',                 'ELK-004', 5499.99,  3200.00, 30, 10),
(1, 'Smartwatch Active',         'ELK-005', 2499.99,  1200.00, 60, 10),
(2, 'Erkek Slim Fit Gömlek',     'GIY-001',  299.99,   120.00, 150, 20),
(2, 'Kadın Trençkot',            'GIY-002',  899.99,   400.00,  70, 15),
(2, 'Unisex Spor Ayakkabı',      'GIY-003',  649.99,   280.00, 100, 20),
(2, 'Çocuk Şişme Mont',          'GIY-004',  499.99,   200.00,  40, 10),
(3, 'Ergonomik Çalışma Koltuğu', 'EVY-001', 3499.99,  1800.00,  15,  5),
(3, 'Ahşap Yemek Masası',        'EVY-002', 5999.99,  3000.00,   8,  3),
(3, 'Airfryer Sıcak Hava Fritözü','EVY-003', 999.99,   500.00,  55, 10),
(4, 'Yoga Matı Kaydırmaz',       'SPR-001',  249.99,   100.00,  90, 20),
(4, 'Dambıl Seti 20kg',          'SPR-002',  599.99,   280.00,  35, 10),
(4, 'Koşu Bandı Katlanabilir',   'SPR-003', 7999.99,  4500.00,  10,  3),
(5, 'Python ile Veri Analizi',   'KIT-001',  149.99,    60.00, 200, 30),
(5, 'İleri Seviye SQL Rehberi',  'KIT-002',  129.99,    55.00, 180, 30),
(5, '1000 Parça Manzara Puzzle', 'KIT-003',  199.99,    80.00,  65, 15);
GO
