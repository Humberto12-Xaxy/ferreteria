class ProductSaleEntity {
  final int productId;
  final int saleId;
  final int quantity;
  final double subtotal;

  ProductSaleEntity({
    required this.productId,
    required this.saleId,
    required this.quantity,
    required this.subtotal,
  });
}
