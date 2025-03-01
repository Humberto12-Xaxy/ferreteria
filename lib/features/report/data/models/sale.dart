import 'package:prueba/features/report/domain/entities/sale.dart';

class SaleModel extends SaleEntity {
  SaleModel({
    super.id,
    required super.date,
    required super.total,
  });

  factory SaleModel.fromJson(Map<String, dynamic> map) => SaleModel(
        id: map['id'],
        date: map['date'],
        total: map['total'],
      );

  factory SaleModel.toJson(SaleEntity sale) => SaleModel(
        id: sale.id,
        date: sale.date,
        total: sale.total,
      );
}
