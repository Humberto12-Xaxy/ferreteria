// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:prueba/core/core.dart';

import '../../../inventory/domain/domain.dart';

class GetProductByBarcodeUseCase implements UseCase<ProductEntity, String> {
  ProductRepository productRepository;

  GetProductByBarcodeUseCase({
    required this.productRepository,
  });

  @override
  Future<ProductEntity> call({String? params}) async {
    return await productRepository.getProductByBarCode(params!);
  }
}
