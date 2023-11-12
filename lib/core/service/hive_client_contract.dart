abstract class HiveClientContract {
  void setupHive();
  Future getByKeyAndBox({
    required String key,
    required String box,
  });

  Future saveByKeyAndBox({
    required String key,
    required String box,
    required Object value,
  });

  Future deleteValueByKey({
    required String key,
    required String box,
  });

  Future deleteAllValueByBox({
    required String box,
  });
}
