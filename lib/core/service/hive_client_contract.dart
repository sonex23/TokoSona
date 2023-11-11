import 'package:hive/hive.dart';

abstract class HiveClientContract {
  Future getByKeyAndBox({
    required String key,
    required String box,
  });
  Future saveByKeyAndBox({
    required String key,
    required String box,
    required TypeAdapter adapter,
  });
}
