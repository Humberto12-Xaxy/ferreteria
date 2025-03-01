import 'package:prueba/features/point_sale/data/models/product_sale.dart';
import 'package:prueba/features/point_sale/domain/entities/product_sale.dart';

import '../../../../../core/core.dart';

class ProductsSalesDataSources {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> registerSale(ProductSaleEntity productSale) async {
    final db = await _databaseHelper.database;

    ProductsSalesModel productSaleModel = ProductsSalesModel(
      productId: productSale.productId,
      saleId: productSale.saleId,
      quantity: productSale.quantity,
      subtotal: productSale.subtotal,
    );
    await db.insert('products_sales', productSaleModel.toMap());
  }
}
