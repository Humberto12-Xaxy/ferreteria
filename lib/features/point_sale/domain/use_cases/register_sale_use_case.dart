// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:prueba/core/core.dart';
import 'package:prueba/features/point_sale/domain/entities/product_sale.dart';
import 'package:prueba/features/point_sale/domain/repository/product_sale_repository.dart';

class RegisterSaleUseCase implements UseCase<void, ProductSaleEntity> {
  ProductSaleRepository productsSalesRepository;

  RegisterSaleUseCase({
    required this.productsSalesRepository,
  });

  @override
  Future<void> call({ProductSaleEntity? params}) async {
    // TODO: implement call
    return await productsSalesRepository.registerProductsSales(params!);
  }
}
