import '../../../../../core/result_types/result.dart';
import '../../../domain/entities/activity_entity.dart';

abstract class ActivityLocalDataSourceContract {
  Future<List<ActivityEntity>> getFavoriteActivities();
  Future<bool> saveActivityAsFavorite(ActivityEntity entity);
  Future<ActivityEntity> getCachedActivity();
  Future<Result<bool>> deleteFavoriteActivity(String key);
}
