import 'package:prueba/features/point_sale/data/data_sources/local/sale_data_sources.dart';
import 'package:prueba/features/point_sale/domain/entities/sale.dart';
import 'package:prueba/features/point_sale/domain/repository/sale_repository.dart';

class SaleRepositoryImpl implements SaleRepository {
  SaleDataSources saleDataSources = SaleDataSources();
  @override
  Future<int> createSale(SaleEntity sale) async {
    return await saleDataSources.createSale(sale);
  }
}
