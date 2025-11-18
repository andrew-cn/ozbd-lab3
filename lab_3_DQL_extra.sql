-- DQL: Агрегація (COUNT + GROUP BY)
SELECT `category_id`, COUNT(*) AS `total_products`
FROM `Products`
GROUP BY `category_id`;

-- DQL: Агрегація (SUM)
SELECT SUM(`price` * `stock_quantity`) AS `total_stock_value`
FROM `Products`;

-- DQL: Агрегація (AVG, MIN, MAX)
SELECT AVG(`price`) AS `average_price`, MIN(`price`) AS `min_price`, MAX(`price`) AS `max_price`
FROM `Products`
WHERE `category_id` = 1;

-- DQL: GROUP BY + JOIN
SELECT u.name, SUM(oi.quantity * oi.price_at_purchase) AS total_spent
FROM Users AS u
JOIN Orders AS o ON u.id = o.user_id
JOIN Order_Items AS oi ON o.id = oi.order_id
GROUP BY u.id, u.name
ORDER BY total_spent DESC;

-- DQL: HAVING
SELECT u.name, SUM(oi.quantity * oi.price_at_purchase) AS total_spent
FROM Users AS u
JOIN Orders AS o ON u.id = o.user_id
JOIN Order_Items AS oi ON o.id = oi.order_id
GROUP BY u.id, u.name
HAVING total_spent > 1000
ORDER BY total_spent DESC;

-- DQL: INNER JOIN
SELECT u.name AS customer_name, p.name AS product_name, oi.quantity, o.status
FROM Users AS u
INNER JOIN Orders AS o ON u.id = o.user_id
INNER JOIN Order_Items AS oi ON o.id = oi.order_id
INNER JOIN Products AS p ON oi.product_id = p.id
WHERE o.status = 'completed'
ORDER BY u.name;

-- DQL: LEFT JOIN
SELECT u.name AS customer_name, o.id AS order_id
FROM Users AS u
LEFT JOIN Orders AS o ON u.id = o.user_id
ORDER BY u.name;

-- DQL: Subquery
SELECT p.name
FROM Products AS p
WHERE p.id NOT IN (
    SELECT DISTINCT oi.product_id FROM Order_Items AS oi
);

-- DQL: UNION
SELECT u.name AS item_name, 'User' AS item_type FROM Users AS u
UNION
SELECT c.name AS item_name, 'Category' AS item_type FROM Categories AS c
ORDER BY item_type, item_name;
