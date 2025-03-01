import 'package:prueba/features/inventory/data/data_sources/local/product_data_source.dart';
import 'package:prueba/features/inventory/data/models/products.dart';
import 'package:prueba/features/inventory/domain/domain.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource = ProductDataSource();

  @override
  Future<List<ProductModel>> getProducts() async {
    final products = await productDataSource.getProducts();
    return products;
  }

  @override
  Future<int> createProduct(ProductEntity product) async {
    return await productDataSource.createProducts(product);
  }

  @override
  Future<ProductEntity> getProductByBarCode(String barcode) async {
    return await productDataSource.getProductByBarCode(barcode);
  }

  @override
  Future<void> updateStockProduct(ProductEntity product) async {
    return await productDataSource.updateStocProduct(product);
  }
}
