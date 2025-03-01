import 'package:prueba/features/point_sale/data/data_sources/local/products_sales_data_sources.dart';
import 'package:prueba/features/point_sale/domain/entities/product_sale.dart';
import 'package:prueba/features/point_sale/domain/repository/product_sale_repository.dart';

class ProductSaleRepositoryImpl implements ProductSaleRepository {
  ProductsSalesDataSources productsSalesDataSources =
      ProductsSalesDataSources();

  // @override
  // Future<List<ProductsSalesEntity>> getProductsSales() {
  //   // TODO: implement getProductsSales
  //   throw UnimplementedError();
  // }

  @override
  Future<void> registerProductsSales(
      ProductSaleEntity producsSales) async {
    await productsSalesDataSources.registerSale(producsSales);
  }
}
