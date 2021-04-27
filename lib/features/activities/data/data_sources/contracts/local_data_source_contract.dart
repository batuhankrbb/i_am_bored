import '../../../../../core/result_types/result.dart';
import '../../../domain/entities/activity_entity.dart';

abstract class ActivityLocalDataSourceContract {
  Future<List<ActivityEntity>> getFavoriteActivities();
  Future<ActivityEntity> getCachedActivity();
  Future<void> saveActivityAsFavorite(ActivityEntity entity);
  Future<void> deleteFavoriteActivity(String key);
}
