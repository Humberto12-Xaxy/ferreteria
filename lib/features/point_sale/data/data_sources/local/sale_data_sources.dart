import 'package:prueba/core/core.dart';
import 'package:prueba/features/point_sale/data/models/sale.dart';
import 'package:prueba/features/point_sale/domain/entities/sale.dart';

class SaleDataSources {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int> createSale(SaleEntity sale) async {
    final db = await _databaseHelper.database;
    SaleModel saleModel = SaleModel(date: sale.date, total: sale.total);
    return await db.insert('sales', saleModel.toMap());
  }
}
