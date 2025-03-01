import 'package:prueba/features/point_sale/domain/entities/product_sale.dart';

abstract class ProductSaleRepository {
  Future<void> registerProductsSales(ProductSaleEntity producSale);
  // Future<List<ProductsSalesEntity>> getProductsSales();
}
