import 'package:prueba/features/inventory/domain/domain.dart';

import '../../../../../core/core.dart';
import '../../models/products.dart';

class ProductDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<ProductModel>> getProducts() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> data = await db.query('products');

    final List<ProductModel> products =
        data.map((product) => ProductModel.fromJson(product)).toList();

    return products;
  }

  Future<int> createProducts(ProductEntity product) async {
    final db = await _databaseHelper.database;
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      barCode: product.barCode,
      price: product.price,
      purchase: product.purchase,
      stock: product.stock,
      typeSale: product.typeSale,
    );

    int id = await db.insert('products', productModel.toMap());

    return id;
  }

  Future<ProductEntity> getProductByBarCode(String barcode) async {
    final db = await _databaseHelper.database;
    final data = await db.query(
      'products',
      where: 'bar_code=?',
      whereArgs: [barcode],
    );

    if (data.isEmpty) {
      return ProductEntity(
          barCode: null,
          name: null,
          price: null,
          purchase: null,
          stock: null,
          typeSale: null);
    } else {
      ProductEntity product = data
          .map(
            (product) => ProductModel.fromJson(product),
          )
          .toList()
          .first;
      return product;
    }
  }

  Future<void> updateStocProduct(ProductEntity product) async {
    final db = await _databaseHelper.database;
    final productModel = ProductModel(
        id: product.id,
        barCode: product.barCode,
        name: product.name,
        price: product.price,
        purchase: product.purchase,
        stock: product.stock,
        typeSale: product.typeSale);
    await db.update('products', productModel.toMap(),
        where: 'id=?', whereArgs: [product.id]);
  }
}
