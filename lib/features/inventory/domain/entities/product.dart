class ProductEntity {
  final int? id;
  final String? barCode;
  final String? name;
  final double? price;
  final double? purchase;
  final int? stock;
  final String? typeSale;

  ProductEntity({
    this.id,
    required this.barCode,
    required this.name,
    required this.price,
    required this.purchase,
    required this.stock,
    required this.typeSale,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.stock == stock &&
        other.barCode == barCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        barCode.hashCode;
  }
}
