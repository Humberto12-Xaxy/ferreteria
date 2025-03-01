import '../../domain/entities/product_sale.dart';

class ProductsSalesModel extends ProductSaleEntity {
  ProductsSalesModel({
    required super.productId,
    required super.saleId,
    required super.quantity,
    required super.subtotal,
  });

  factory ProductsSalesModel.fromJson(Map<String, dynamic> map) =>
      ProductsSalesModel(
        productId: map['productId'],
        saleId: map['saleId'],
        quantity: map['quantity'],
        subtotal: map['subtotal'],
      );

  Map<String, dynamic> toMap() => {
        'product_id': productId,
        'sale_id': saleId,
        'quantity': quantity,
        'subtotal': subtotal,
      };
}
