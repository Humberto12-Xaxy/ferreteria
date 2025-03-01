import 'package:prueba/features/point_sale/domain/entities/sale.dart';

class SaleModel extends SaleEntity {
  SaleModel({
    super.id,
    required super.date,
    required super.total,
  });

  factory SaleModel.fromJson(Map<String, dynamic> map) =>
      SaleModel(id: map['id'], date: map['date'], total: map['total']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'date': date,
        'total': total,
      };
}
