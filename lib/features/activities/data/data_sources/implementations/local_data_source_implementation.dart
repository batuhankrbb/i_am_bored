import 'package:im_bored_app/core/constants/hive_constants.dart';
import 'package:im_bored_app/core/result_types/result.dart';
import 'package:im_bored_app/core/utils/error_printer.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/local_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/exception_handling/exceptions/activity_exceptions.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:im_bored_app/features/activities/utils/hive/activity_entity_adapter.dart';

class ActivityLocalDataSourceImplementation
    extends ActivityLocalDataSourceContract {
  @override
  Future<void> deleteFavoriteActivity(String key) async {
    try {
      var box = await Hive.openBox(HiveConstants.FAVORITES_BOX);
      if (box.get(key) != null) {
        box.delete(key);
      } else {
        throw DeletingActivityException();
      }
    } catch (e) {
      printError(
          "ActivityLocalDataSourceImplementation/deleteFavoriteActivity", e);
      throw DeletingActivityException();
    }
  }

  @override
  Future<ActivityEntity> getCachedActivity() async {
    try {
      var box = await Hive.openBox<ActivityEntityHive>(HiveConstants.CACHE_BOX);
      ActivityEntityHive activity = box.get(HiveConstants.CACHED_ITEM)!;
      return activity.toEntity();
    } catch (e) {
       printError(
          "ActivityLocalDataSourceImplementation/getCachedActivity", e);
      throw ActivityNoCachedException();
    }
  }

  @override
  Future<List<ActivityEntity>> getFavoriteActivities() async {
    try {
      var box =
          await Hive.openBox<ActivityEntityHive>(HiveConstants.FAVORITES_BOX);
      var values = box.values.map((e) => e.toEntity()).toList();
      return values;
    } catch (e) {
      printError(
          "ActivityLocalDataSourceImplementation/getFavoriteActivities", e);
      throw UnknownLocalException();
    }
  }

  @override
  Future<void> saveActivityAsFavorite(ActivityEntity entity) async {
    try {
      var box =
          await Hive.openBox<ActivityEntityHive>(HiveConstants.FAVORITES_BOX);
      box.put(entity.key, ActivityEntityHive.fromEntity(entity));
    } catch (e) {
      printError(
          "ActivityLocalDataSourceImplementation/saveActivityAsFavorite", e);
      throw UnknownLocalException();
    }
  }

  @override
  Future<void> cacheActivity(ActivityEntity entity) async {
    try {
      var box = await Hive.openBox<ActivityEntityHive>(HiveConstants.CACHE_BOX);
      box.put(HiveConstants.CACHED_ITEM, ActivityEntityHive.fromEntity(entity));
    } catch (e) {
      printError(
          "ActivityLocalDataSourceImplementation/saveActivityAsFavorite", e);
      throw UnknownLocalException();
    }
  }
}

/*
class ActivityNoCachedException extends ActivityException {
  ActivityNoCachedException({Exception? exception})
      : super(exception: exception);
}

class UnknownLocalException extends ActivityException {
  UnknownLocalException({Exception? exception}) : super(exception: exception);
}

class DeletingActivityException extends ActivityException {
  DeletingActivityException({Exception? exception})
      : super(exception: exception);
}
*/
