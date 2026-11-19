-- 1. Full inventory report with category names and dynamic total value
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    p.Price,
    p.Quantity,
    (p.Price * p.Quantity) AS TotalValue
FROM Products p
INNER JOIN Categories c 
    ON p.CategoryID = c.CategoryID;

-- 2. Total inventory value grouped by category
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount,
    SUM(p.Quantity) AS TotalUnits,
    SUM(p.Price * p.Quantity) AS CategoryValuation
FROM Categories c
LEFT JOIN Products p 
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY CategoryValuation DESC;

-- 3. Low-stock alert (products with fewer than 15 units)
SELECT 
    p.ProductName,
    c.CategoryName,
    p.Quantity
FROM Products p
INNER JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE p.Quantity < 15
ORDER BY p.Quantity ASC;