import 'package:toko_sona/core/networking/result.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';

abstract class HomeRepositoryContract {
  Future<Result<List<ProductViewparam>>> getAllProducts();
  Future<Result<List<String>>> getAllCategories();
}
