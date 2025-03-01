// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prueba/core/core.dart';

import '../../../inventory/domain/domain.dart';

class UpdateProductUseCase implements UseCase<void, ProductEntity> {
  ProductRepository productRepository;

  UpdateProductUseCase({
    required this.productRepository,
  });

  @override
  Future<void> call({ProductEntity? params}) async {
    await productRepository.updateStockProduct(params!);
  }
}
