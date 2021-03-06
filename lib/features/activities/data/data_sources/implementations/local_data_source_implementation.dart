
import '../../../../../core/hive/hive_constants.dart';
import '../../../../../core/hive/hive_helper.dart';
import '../../../../../core/utils/error_printer.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../exception_handling/exceptions/activity_exceptions.dart';
import '../contracts/local_data_source_contract.dart';
import '../external_related/hive/activity_entity_adapter.dart';

class ActivityLocalDataSourceImplementation
    extends ActivityLocalDataSourceContract {
  var _helper = HiveHelper();

  @override
  Future<void> deleteFavoriteActivity(String key) async {
    try {
      await _helper.deleteData<ActivityEntityHive>(
          HiveConstants().FAVORITES_BOX, key);
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/deleteFavoriteActivity", e);
      throw ActivityException.deletingActivityException();
    }
  }

  @override
  Future<ActivityEntity> getCachedActivity() async {
    try {
      var activity = await _helper.getData<ActivityEntityHive>(
          HiveConstants().CACHE_BOX, HiveConstants().CACHED_ITEM);
      return activity.toEntity();
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/getCachedActivity", e);
      throw ActivityException.noCachedException();
    }
  }

  @override
  Future<List<ActivityEntity>> getFavoriteActivities() async {
    try {
      var values =
          await _helper.getAll<ActivityEntityHive>(HiveConstants().FAVORITES_BOX);
      var convertedValues = values.map((e) => e.toEntity()).toList();
      return convertedValues;
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/getFavoriteActivities", e);
      throw ActivityException.unknownLocalException();
    }
  }

  @override
  Future<void> saveActivityAsFavorite(ActivityEntity entity) async {
    try {
      await _helper.putData<ActivityEntityHive>(HiveConstants().FAVORITES_BOX,
          entity.key, ActivityEntityHive.fromEntity(entity));
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/saveActivityAsFavorite", e);
      throw ActivityException.unknownLocalException();
    }
  }

  @override
  Future<void> cacheActivity(ActivityEntity entity) async {
    try {
     await _helper.putData<ActivityEntityHive>(HiveConstants().CACHE_BOX,
          HiveConstants().CACHED_ITEM, ActivityEntityHive.fromEntity(entity));
    } catch (e) {
      ErrorHelper().printError(
          "ActivityLocalDataSourceImplementation/saveActivityAsFavorite", e);
      throw ActivityException.unknownLocalException();
    }
  }
}
