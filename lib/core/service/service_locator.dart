import 'package:get_it/get_it.dart';
import 'package:toko_sona/misc/router/router.dart';

final app = GetIt.instance;

void setUpServices() async {
  app.registerLazySingleton(() => MainRouter());
}
