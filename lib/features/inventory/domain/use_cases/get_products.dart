// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/core.dart';
import '../domain.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>, void> {
  ProductRepository productRepository;

  GetProductsUseCase({
    required this.productRepository,
  });

  @override
  Future<List<ProductEntity>> call({params}) async {
    return await productRepository.getProducts();
  }
}
