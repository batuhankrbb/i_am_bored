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

    await Hive.openBox<ActivityEntityHive>(HiveConstants().CACHE_BOX);
    await Hive.openBox<ActivityEntityHive>(HiveConstants().FAVORITES_BOX);
  }

  Future<T> getData<T>(String boxName, dynamic key) async {
    var box =  Hive.box<T>(boxName);
    return box.get(key)!;
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box =  Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box =  Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    var box =  Hive.box<T>(boxName);
    return box.values.toList();
  }
}
