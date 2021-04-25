import '../../../../core/result_types/result.dart';
import '../entities/activity_entity.dart';

abstract class ActivityRepositoryContract {
  Future<Result<ActivityEntity>> getRandomActivity();
  Future<Result<ActivityEntity>> getActivityByType(String type);

  Future<Result<List<ActivityEntity>>> getFavoriteActivities();
  Future<Result<bool>> saveActivityAsFavorite(ActivityEntity activity);

  Future<Result<bool>> deleteFavoriteActivity(String key);
}
