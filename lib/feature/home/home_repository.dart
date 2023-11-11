import 'package:dio/dio.dart';
import 'package:toko_sona/core/networking/rest_client.dart';
import 'package:toko_sona/core/networking/result.dart';
import 'package:toko_sona/feature/home/home_repository_contract.dart';
import 'package:toko_sona/feature/home/product/product_entity.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';

class HomeRepository extends HomeRepositoryContract {
  final RestClient restClient;
  HomeRepository(this.restClient);

  @override
  Future<Result<List<ProductViewparam>>> getAllProducts() async {
    List<ProductViewparam> productList = [];
    try {
      List<ProductEntity> resultEntity = await restClient.getAllProducts();
      for (var entity in resultEntity) {
        productList.add(ProductViewparam.fromEntity(entity));
      }
      return Result.data(productList);
    } on DioException catch (e) {
      return Result.error(e.message);
    }
  }

  @override
  Future<Result<List<String>>> getAllCategories() async {
    List<String> categories = [];
    try {
      List<String> resultEntity = await restClient.getAllCategories();
      for (var entity in resultEntity) {
        categories.add(entity);
      }
      return Result.data(categories);
    } on DioException catch (e) {
      return Result.error(e.message);
    }
  }
}
