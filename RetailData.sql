create database Retail;
Use Retail;

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'D:/Infotact Internship/Project 1/Retail_Project/clean_sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM sales_data;
SELECT * FROM clean_sales_data;

DESCRIBE sales_data;

/*- SELECT order_date FROM sales_data LIMIT 10; */

SELECT 
    DATE(order_date) AS order_day,
    COUNT(order_id) AS total_orders
FROM sales_data
GROUP BY order_day;

CREATE TABLE sales_data (
    order_id INT,
    order_date DATE,
    product VARCHAR(100),
    category VARCHAR(100),
    city VARCHAR(100),
    quantity INT,
    price FLOAT,
    revenue FLOAT
);

SELECT SUM(revenue) AS total_revenue FROM sales_data;

SELECT product, SUM(quantity) AS total_sold
FROM sales_data
GROUP BY product
ORDER BY total_sold DESC;


SELECT category, SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY category;

SELECT city, SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY city;


SELECT 
    MONTH(order_date) AS month,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY month
ORDER BY month;


SELECT 
    HOUR(order_date) AS hour,
    COUNT(order_id) AS total_orders
FROM sales_data
GROUP BY hour
ORDER BY total_orders DESC;