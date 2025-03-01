import 'package:prueba/features/inventory/data/data.dart';
import 'package:prueba/features/inventory/domain/domain.dart';
import 'package:prueba/features/inventory/presentation/providers/products_providers.dart';
import 'package:prueba/features/point_sale/data/data.dart';
import 'package:prueba/features/point_sale/data/repository/sale_repository_impl.dart';
import 'package:prueba/features/point_sale/domain/entities/product_sale.dart';
import 'package:prueba/features/point_sale/domain/entities/sale.dart';
import 'package:prueba/features/point_sale/domain/use_cases/get_product_by_barcode_use_case.dart';
import 'package:prueba/features/point_sale/domain/use_cases/register_sale_use_case.dart';
import 'package:prueba/features/point_sale/domain/use_cases/sale_create_sale_use_case.dart';
import 'package:prueba/features/point_sale/domain/use_cases/update_product_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_car_provider.g.dart';

@riverpod
class ShoppingCar extends _$ShoppingCar {
  ProductRepositoryImpl productRepository = ProductRepositoryImpl();
  ProductSaleRepositoryImpl productSaleRepositoryImpl =
      ProductSaleRepositoryImpl();
  SaleRepositoryImpl saleRepositoryImpl = SaleRepositoryImpl();

  @override
  List<ProductShoppingCar> build() {
    return [];
  }

  Future<void> addProduct(String barCode) async {
    final getProductsUseCase =
        GetProductByBarcodeUseCase(productRepository: productRepository);
    final product = await getProductsUseCase.call(params: barCode);

    if (product.name == null) {
      return;
    }

    final existingProductIndex =
        state.indexWhere((data) => data.product == product);

    if (existingProductIndex != -1) {
      final existingProduct = state[existingProductIndex];
      final updateProduct = existingProduct.copyWith(
        quantity: existingProduct.quantity + 1,
        subtotal:
            (existingProduct.quantity + 1) * existingProduct.product.price!,
      );
      state = [
        ...state.sublist(0, existingProductIndex),
        updateProduct,
        ...state.sublist(existingProductIndex + 1),
      ];
    } else {
      final productShopping = ProductShoppingCar(
          product: product, quantity: 1, subtotal: product.price!);
      state = [...state, productShopping];
    }
  }

  void changeQuantity(ProductEntity product, int quantity) {
    final existingProductIndex =
        state.indexWhere((data) => data.product == product);

    if (existingProductIndex != -1) {
      final existingProduct = state[existingProductIndex];
      final updatedProduct = existingProduct.copyWith(
        quantity: quantity,
        subtotal: quantity * existingProduct.product.price!,
      );

      if (updatedProduct.quantity <= 0) {
        deleteProduct(updatedProduct.product);
      } else {
        state = [
          ...state.sublist(0, existingProductIndex),
          updatedProduct,
          ...state.sublist(existingProductIndex + 1),
        ];
      }
    }
  }

  void deleteProduct(ProductEntity product) {
    state = state.where((data) => data.product != product).toList();
  }

  double get total {
    return state.fold(0, (sum, item) => sum + item.subtotal);
  }

  Future<void> charge() async {
    final saleUsecase =
        SaleCreateSaleUseCase(saleRepository: saleRepositoryImpl);

    final productSaleUseCase =
        RegisterSaleUseCase(productsSalesRepository: productSaleRepositoryImpl);

    final updateProductUseCase =
        UpdateProductUseCase(productRepository: productRepository);

    final saleEntity = SaleEntity(
        date: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        total: total);

    final saleId = await saleUsecase.call(params: saleEntity);
    for (ProductShoppingCar productShopping in state) {
      final productSaleEntity = ProductSaleEntity(
        productId: productShopping.product.id!,
        saleId: saleId,
        quantity: productShopping.quantity,
        subtotal: productShopping.subtotal,
      );
      await productSaleUseCase.call(params: productSaleEntity);

      final productEntity = ProductEntity(
        id: productShopping.product.id,
        barCode: productShopping.product.barCode,
        name: productShopping.product.name,
        price: productShopping.product.price,
        purchase: productShopping.product.purchase,
        stock: (productShopping.product.stock! - productShopping.quantity),
        typeSale: productShopping.product.typeSale,
      );

      await updateProductUseCase.call(params: productEntity);
    }

    ref.invalidate(productsProvider);

    state = [];
  }
}

class ProductShoppingCar {
  final ProductEntity product;
  final int quantity;
  final double subtotal;

  ProductShoppingCar({
    required this.product,
    required this.quantity,
    required this.subtotal,
  });

  ProductShoppingCar copyWith({
    ProductEntity? product,
    int? quantity,
    double? subtotal,
  }) {
    return ProductShoppingCar(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductShoppingCar &&
        other.product == product &&
        other.quantity == quantity &&
        other.subtotal == subtotal;
  }

  @override
  int get hashCode {
    return product.hashCode ^ quantity.hashCode ^ subtotal.hashCode;
  }
}
