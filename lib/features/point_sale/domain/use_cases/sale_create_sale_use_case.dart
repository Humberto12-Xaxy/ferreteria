// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prueba/core/core.dart';
import 'package:prueba/features/point_sale/domain/entities/sale.dart';
import 'package:prueba/features/point_sale/domain/repository/sale_repository.dart';

class SaleCreateSaleUseCase implements UseCase<int, SaleEntity> {
  SaleRepository saleRepository;

  SaleCreateSaleUseCase({
    required this.saleRepository,
  });

  @override
  Future<int> call({SaleEntity? params}) async {
    return await saleRepository.createSale(params!);
  }
}
