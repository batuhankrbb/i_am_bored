import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:im_bored_app/core/hive/hive_constants.dart';
import 'package:im_bored_app/features/activities/data/data_sources/external_related/hive/activity_entity_adapter.dart';

class HiveHelper {
  HiveHelper._();

  static final HiveHelper _HiveHelperInstance = HiveHelper._();

  factory HiveHelper() {
    return _HiveHelperInstance;
  }

  Future<void> setUpHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ActivityEntityHiveAdapter());
    var boxes = [HiveConstants().CACHE_BOX, HiveConstants().FAVORITES_BOX];

    for (var box in boxes) {
      Hive.openBox(box);
    }
  }

  T getData<T>(String boxName, dynamic key) {
    var box = Hive.box(boxName);
    return box.get(key);
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box = Hive.box(boxName);
    await box.delete(key);
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box = Hive.box(boxName);
    await box.put(key, data);
  }

  List<T> getAll<T>(String boxName) {
    var box = Hive.box<T>(boxName);
    return box.values.toList();
  }

}
