-- DML: Додавання нового користувача
INSERT INTO `Users` (`name`, `email`, `password_hash`) VALUES
('Андрій Федоров', 'andrii.fedorov@gmail.com', 'hash_12345');

-- DML: Додавання нового товару
INSERT INTO `Products` (`name`, `description`, `price`, `stock_quantity`, `category_id`) VALUES
('Кісточка для собак', 'Іграшка для жування ручної роботи.', 250.00, 50, 1);

-- DML: Оновлення ціни товару
UPDATE `Products`
SET `price` = 230.00
WHERE `name` = 'Кісточка для собак';

-- DML: Видалення позиції з замовлення
DELETE FROM `Order_Items`
WHERE `order_id` = 2 AND `product_id` = 8;
