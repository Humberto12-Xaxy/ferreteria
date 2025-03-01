import 'package:prueba/features/point_sale/domain/entities/sale.dart';

abstract class SaleRepository {
  Future<int> createSale(SaleEntity sale);
}
