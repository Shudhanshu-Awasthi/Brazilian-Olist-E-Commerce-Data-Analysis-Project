-- =====================================================================
-- Olist E-commerce Database Schema
-- Generated Script
-- =====================================================================
-- 1. Create and use the database

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- =====================================================================
-- Table: customers
-- =====================================================================

DROP TABLE IF EXISTS customers;

CREATE TABLE customers
 (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state CHAR(2),
    PRIMARY KEY (customer_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Customers_Data.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state);


-- =====================================================================
-- Table: geolocation
-- =====================================================================

DROP TABLE IF EXISTS geolocation;

CREATE TABLE geolocation
 (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(11, 8),
    geolocation_lng DECIMAL(11, 8),
    geolocation_city VARCHAR(255),
    geolocation_state CHAR(2)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Geo_Location_Data.csv'
INTO TABLE geolocation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state);

-- =====================================================================
-- Table: order_items
-- =====================================================================

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATE,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Order_Items_Data.csv'
INTO TABLE order_items
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value);

-- =====================================================================
-- Table: order_payments
-- =====================================================================

DROP TABLE IF EXISTS order_payments;

CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, payment_sequential)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Order_Payments_Data.csv'
INTO TABLE order_payments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(order_id, payment_sequential, payment_type, payment_installments, payment_value);

-- =====================================================================
-- Table: order_reviews
-- =====================================================================
DROP TABLE IF EXISTS order_reviews;
CREATE TABLE order_reviews 
(
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATE,
    review_answer_timestamp DATE,
    PRIMARY KEY (review_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Order_Reviews_Data.csv'
INTO TABLE order_reviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(review_id, order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp);


-- =====================================================================
-- Table: orders
-- =====================================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATE,
    order_approved_at DATE NULL,
    order_delivered_carrier_date DATE NULL,
    order_delivered_customer_date DATE NULL,
    order_estimated_delivery_date DATE,
    PRIMARY KEY (order_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Orders_Data.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  order_id,
  customer_id,
  order_status,
  order_purchase_timestamp,
  @order_approved_at,
  @order_delivered_carrier_date,
  @order_delivered_customer_date,
  order_estimated_delivery_date
)
SET
  order_approved_at = NULLIF(@order_approved_at, ''),
  order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
  order_delivered_customer_date = NULLIF(@order_delivered_customer_date, '');


-- =====================================================================
-- Table: products
-- =====================================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(255) NULL,
    product_name_length INT NULL,
    product_description_length INT NULL,
    product_photos_qty INT NULL,
    product_weight_g INT NULL,
    product_length_cm INT NULL,
    product_height_cm INT NULL,
    product_width_cm INT NULL,
    PRIMARY KEY (product_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Products_Data.csv'
INTO TABLE products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm);

-- =====================================================================
-- Table: sellers
-- =====================================================================

DROP TABLE IF EXISTS sellers;

CREATE TABLE sellers
(
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(255),
    seller_state CHAR(2),
    PRIMARY KEY (seller_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Sellers_Data.csv'
INTO TABLE sellers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(seller_id, seller_zip_code_prefix, seller_city, seller_state);

-- =====================================================================
-- Table: product_category_name_translation
-- =====================================================================

DROP TABLE IF EXISTS product_category_name_translation;

CREATE TABLE product_category_name_translation
(
    product_category_name VARCHAR(255),
    product_category_name_english VARCHAR(255),
    PRIMARY KEY (product_category_name)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

LOAD DATA INFILE 'D:/Business Analyst Training/Analytics Projects/CSV_Cleaned_Data_Sets/Product_Category_Name_Translation_Data.csv'
INTO TABLE product_category_name_translation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(product_category_name, product_category_name_english);