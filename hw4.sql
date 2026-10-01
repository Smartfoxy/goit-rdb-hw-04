-- # task 3 
SELECT * FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id

INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id

INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id;

-- # task 4.1
SELECT COUNT(*) FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id

INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id

INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id;

-- task # 4.2 (a) усі INNER JOIN замінено на LEFT JOIN
SELECT COUNT(*) AS row_count
FROM order_details od
LEFT JOIN orders o ON o.id = od.order_id
LEFT JOIN products p ON p.id = od.product_id
LEFT JOIN customers c ON c.id = o.customer_id
LEFT JOIN employees e ON e.employee_id = o.employee_id
LEFT JOIN shippers s ON s.id = o.shipper_id
LEFT JOIN suppliers su ON su.id = p.supplier_id
LEFT JOIN categories ca ON ca.id = p.category_id;

-- task # 4.2 (b) customers приєднано через RIGHT JOIN
SELECT COUNT(*) AS row_count
FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
RIGHT JOIN customers c ON c.id = o.customer_id
LEFT JOIN products p ON p.id = od.product_id
LEFT JOIN employees e ON e.employee_id = o.employee_id
LEFT JOIN shippers s ON s.id = o.shipper_id
LEFT JOIN suppliers su ON su.id = p.supplier_id
LEFT JOIN categories ca ON ca.id = p.category_id;

SELECT COUNT(*) FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
WHERE o.id IS NULL;

-- task # 4.3 рядки, де employee_id > 3 та <= 10
SELECT *
FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id
INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id
INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id
WHERE e.employee_id > 3 AND e.employee_id <= 10;

-- task # 4.4 групування за назвою категорії, кількість рядків, середня кількість товару
SELECT ca.name AS category_name,
       COUNT(*) AS row_count,
       ROUND(AVG(od.quantity), 2) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id
INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id
INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id
WHERE e.employee_id > 3 AND e.employee_id <= 10
GROUP BY ca.name;

-- task # 4.5
SELECT ca.name AS category_name,
       COUNT(*) AS row_count,
       ROUND(AVG(od.quantity), 2) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id
INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id
INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id
WHERE e.employee_id > 3 AND e.employee_id <= 10
GROUP BY ca.name
HAVING AVG(od.quantity) > 21;

-- task # 4.6 сортування за спаданням кількості рядків
SELECT ca.name AS category_name,
       COUNT(*) AS row_count,
       ROUND(AVG(od.quantity), 2) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id
INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id
INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id
WHERE e.employee_id > 3 AND e.employee_id <= 10
GROUP BY ca.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC;

-- task # 4.7 чотири рядки з пропущеним першим рядком
SELECT ca.name AS category_name,
       COUNT(*) AS row_count,
       ROUND(AVG(od.quantity), 2) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON o.id = od.order_id
INNER JOIN products p ON p.id = od.product_id
INNER JOIN customers c ON c.id = o.customer_id
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers s ON s.id = o.shipper_id
INNER JOIN suppliers su ON su.id = p.supplier_id
INNER JOIN categories ca ON ca.id = p.category_id
WHERE e.employee_id > 3 AND e.employee_id <= 10
GROUP BY ca.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;