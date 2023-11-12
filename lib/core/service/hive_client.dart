import 'package:hive_flutter/hive_flutter.dart';
import 'package:toko_sona/core/service/hive_client_contract.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/utils/hive_constant.dart';

class HiveClient extends HiveClientContract {
  @override
  Future<void> setupHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
    await Hive.openBox(HiveConstant.productBox);
    await Hive.openBox(HiveConstant.cartBox);
  }

  @override
  Future getByKeyAndBox({required String key, required String box}) async {
    var hiveBox = Hive.box(box);
    return hiveBox.get(key);
  }

  @override
  Future saveByKeyAndBox({required String key, required String box, required Object value}) async {
    var hiveBox = Hive.box(box);
    await hiveBox.put(key, value);
  }

  @override
  Future deleteAllValueByBox({required String box}) async {
    var hiveBox = Hive.box(box);
    await hiveBox.deleteAll(hiveBox.keys);
  }

  @override
  Future deleteValueByKey({required String key, required String box}) async {
    var hiveBox = Hive.box(box);
    await hiveBox.delete(key);
  }
}
