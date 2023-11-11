import 'package:get_it/get_it.dart';
import 'package:toko_sona/core/networking/rest_client.dart';
import 'package:toko_sona/feature/home/home_repository.dart';
import 'package:toko_sona/misc/router/router.dart';
import 'package:dio/dio.dart';
import 'package:toko_sona/misc/utils/url_constant.dart';

final app = GetIt.instance;

void setUpServices() async {
  app
    ..registerLazySingleton(() => MainRouter())
    ..registerLazySingleton(
      () => Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: UrlConstant.basUrl,
        ),
      ),
    )
    ..registerLazySingleton(() => RestClient(app<Dio>()))
    ..registerLazySingleton(() => HomeRepository(app<RestClient>()));
}
