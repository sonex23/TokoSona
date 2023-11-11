import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:toko_sona/feature/home/product/product_entity.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('/products')
  Future<List<ProductEntity>> getAllProduct();
}
