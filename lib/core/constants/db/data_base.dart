// ignore_for_file: non_constant_identifier_names

final String CREATE_DATA_BASE = '''
      CREATE TABLE `products` (
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `bar_code` varchar(255),
      `name` varchar(255),
      `price` double,
      `purchase` double,
      `stock` int,
      `type_sale` varchar(255)
      );

    CREATE TABLE `sales` (
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `date` DATETIME,
      `total` double
      );

    CREATE TABLE `products_sales` (
      `product_id` int,
      `sale_id` int,
      `quantity` int,
      `subtotal` double
      );

''';

    // ALTER TABLE `sales` ADD FOREIGN KEY (`id`) REFERENCES `products_sales` (`sale_id`);

    // ALTER TABLE `products` ADD FOREIGN KEY (`id`) REFERENCES `products_sales` (`product_id`);
