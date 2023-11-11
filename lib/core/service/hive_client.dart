import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:toko_sona/core/service/hive_client_contract.dart';

class HiveClient extends HiveClientContract {
  Logger logger = Logger();
  @override
  Future getByKeyAndBox({required String key, required String box}) async {
    var hiveBox = Hive.box(box);
    return hiveBox.get(key);
  }

  @override
  Future saveByKeyAndBox({required String key, required String box, required Object adapter}) async {
    var hiveBox = Hive.box(box);
    await hiveBox.put(key, adapter);
  }
}
