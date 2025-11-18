-- DQL: WHERE + AND
SELECT *
FROM `Products`
WHERE `category_id` = 1 AND `price` < 300;

-- DQL: WHERE + IN
SELECT *
FROM `Orders`
WHERE `status` IN ('shipped', 'completed');

-- DQL: WHERE + LIKE
SELECT *
FROM `Users`
WHERE `email` LIKE '%@gmail.com';

-- DQL: ORDER BY
SELECT *
FROM `Products`
ORDER BY `price` DESC;
