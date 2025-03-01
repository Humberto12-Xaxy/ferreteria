import 'package:prueba/features/inventory/domain/use_cases/create_product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';

part 'products_providers.g.dart';

enum FilterType { all, filtered }

@riverpod
class ProductsCurrentFilter extends _$ProductsCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void setCurrentFilter(FilterType newFilter) {
    state = newFilter;
  }
}

@riverpod
class Products extends _$Products {
  final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();

  @override
  Future<List<ProductEntity>> build() async {
    final getProductsUseCase =
        GetProductsUseCase(productRepository: productRepositoryImpl);

    return await getProductsUseCase.call();
  }

  Future<int> createProduct(ProductEntity product) async {
    final createProductUseCase =
        CreateProductUseCase(productRepository: productRepositoryImpl);
    ref.invalidateSelf();
    return await createProductUseCase.call(params: product);
  }
}
