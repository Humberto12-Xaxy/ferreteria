import 'package:prueba/core/core.dart';
import 'package:prueba/features/inventory/domain/domain.dart';

class CreateProductUseCase extends UseCase<int, ProductEntity> {
  ProductRepository productRepository;

  CreateProductUseCase({
    required this.productRepository,
  });

  @override
  Future<int> call({ProductEntity? params}) async {
    return await productRepository.createProduct(params!);
  }
}
