-- =====================================================
-- SKEMA CRM / MEMBERSHIP - PT Nusantara Retail Mandiri
-- Target: PostgreSQL (Neon). Jalankan di Neon SQL Editor.
-- =====================================================
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id      VARCHAR(10)  PRIMARY KEY,           -- VARCHAR agar tipe sama dengan CSV (dtype str)
    customer_name    VARCHAR(100) NOT NULL,
    membership_tier  VARCHAR(20)  NOT NULL
                     CHECK (membership_tier IN ('Bronze','Silver','Gold','Platinum')),
    city             VARCHAR(50),
    join_date        DATE         NOT NULL,
    is_active        SMALLINT     NOT NULL DEFAULT 1 CHECK (is_active IN (0,1))  -- SMALLINT agar WHERE is_active = 1 valid
);

CREATE INDEX idx_customers_active ON customers (is_active);

INSERT INTO customers (customer_id, customer_name, membership_tier, city, join_date, is_active) VALUES
('C001','Budi Santoso','Gold','Semarang','2023-02-11',1),
('C002','Siti Rahayu','Silver','Jakarta','2023-05-20',1),
('C003','Agus Prasetyo','Bronze','Surabaya','2024-01-08',1),
('C004','Dewi Lestari','Platinum','Bandung','2022-09-14',0),
('C005','Rizky Ramadhan','Silver','Yogyakarta','2024-03-30',1),
('C006','Putri Anggraini','Gold','Semarang','2023-07-02',1),
('C007','Hendra Wijaya','Bronze','Medan','2025-01-17',1),
('C008','Maya Kusuma','Platinum','Jakarta','2022-11-25',1),
('C009','Fajar Nugroho','Bronze','Solo','2025-04-09',1),
('C010','Lina Marlina','Silver','Bandung','2024-06-12',1),
('C011','Doni Setiawan','Bronze','Surabaya','2024-08-19',0),
('C012','Rina Wulandari','Gold','Denpasar','2023-10-05',1),
('C013','Yusuf Hakim','Silver','Makassar','2024-12-01',1),
('C014','Anita Sari','Platinum','Jakarta','2022-06-30',1),
('C015','Teguh Prabowo','Bronze','Semarang','2025-06-21',1);

-- Cek hasil
SELECT membership_tier, COUNT(*) FROM customers WHERE is_active = 1 GROUP BY membership_tier;
