import 'package:prueba/features/inventory/data/models/products.dart';
import 'package:prueba/features/inventory/domain/domain.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
  Future<int> createProduct(ProductEntity product);
  Future<ProductEntity> getProductByBarCode(String barcode);
}
