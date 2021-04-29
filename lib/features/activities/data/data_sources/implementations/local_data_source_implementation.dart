import 'package:hive/hive.dart';

import '../../../../../core/constants/hive_constants.dart';
import '../../../../../core/utils/error_printer.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../utils/hive/activity_entity_adapter.dart';
import '../../exception_handling/exceptions/activity_exceptions.dart';
import '../contracts/local_data_source_contract.dart';

class ActivityLocalDataSourceImplementation
    extends ActivityLocalDataSourceContract {
  @override
  Future<void> deleteFavoriteActivity(String key) async {
    try {
      var box = await Hive.openBox(HiveConstants().FAVORITES_BOX);
      if (box.get(key) != null) {
        box.delete(key);
      } else {
        throw DeletingActivityException();
      }
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/deleteFavoriteActivity", e);
      throw DeletingActivityException();
    }
  }

  @override
  Future<ActivityEntity> getCachedActivity() async {
    try {
      var box = await Hive.openBox<ActivityEntityHive>(HiveConstants().CACHE_BOX);
      ActivityEntityHive activity = box.get(HiveConstants().CACHED_ITEM)!;
      return activity.toEntity();
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/getCachedActivity", e);
      throw ActivityNoCachedException();
    }
  }

  @override
  Future<List<ActivityEntity>> getFavoriteActivities() async {
    try {
      var box =
          await Hive.openBox<ActivityEntityHive>(HiveConstants().FAVORITES_BOX);
      var values = box.values.map((e) => e.toEntity()).toList();
      return values;
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/getFavoriteActivities", e);
      throw UnknownLocalException();
    }
  }

  @override
  Future<void> saveActivityAsFavorite(ActivityEntity entity) async {
    try {
      var box =
          await Hive.openBox<ActivityEntityHive>(HiveConstants().FAVORITES_BOX);
      box.put(entity.key, ActivityEntityHive.fromEntity(entity));
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/saveActivityAsFavorite", e);
      throw UnknownLocalException();
    }
  }

  @override
  Future<void> cacheActivity(ActivityEntity entity) async {
    try {
      var box = await Hive.openBox<ActivityEntityHive>(HiveConstants().CACHE_BOX);
      box.put(HiveConstants().CACHED_ITEM, ActivityEntityHive.fromEntity(entity));
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/saveActivityAsFavorite", e);
      throw UnknownLocalException();
    }
  }
}

