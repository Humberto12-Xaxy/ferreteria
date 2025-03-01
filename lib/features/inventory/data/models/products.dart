import 'package:prueba/features/inventory/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.barCode,
    required super.name,
    required super.price,
    required super.purchase,
    required super.stock,
    required super.typeSale,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) => ProductModel(
        id: map['id'],
        barCode: map['bar_code'],
        name: map['name'],
        price: map['price'],
        purchase: map['purchase'],
        stock: map['stock'],
        typeSale: map['type_sale'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'bar_code': barCode,
        'name': name,
        'price': price,
        'purchase': purchase,
        'stock': stock,
        'type_sale': typeSale,
      };
}
