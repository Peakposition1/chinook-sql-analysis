-- ==========================================
-- Chinook SQL Project Queries
-- ==========================================

-- 1️⃣ Show all customers
SELECT * 
FROM Customer;

-- 2️⃣ Show only specific columns from customers
SELECT FirstName, LastName, Country
FROM Customer;

-- 3️⃣ Count how many customers there are
SELECT COUNT(*) AS TotalCustomers
FROM Customer;

-- 4️⃣ Count customers by country
SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country;

-- 5️⃣ Join customers and invoices to see all purchases
SELECT 
    Customer.FirstName,
    Customer.LastName,
    Invoice.InvoiceId,
    Invoice.Total
FROM Customer
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId;

-- 6️⃣ Total spent per customer
SELECT 
    Customer.FirstName,
    Customer.LastName,
    SUM(Invoice.Total) AS TotalSpent
FROM Customer
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId;

-- 7️⃣ Top 10 customers by total spending
SELECT 
    Customer.FirstName,
    Customer.LastName,
    SUM(Invoice.Total) AS TotalSpent
FROM Customer
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY TotalSpent DESC
LIMIT 10;

-- 8️⃣ Total revenue per country
SELECT 
    Customer.Country,
    SUM(Invoice.Total) AS TotalRevenue
FROM Customer
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.Country
ORDER BY TotalRevenue DESC;

