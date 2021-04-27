import '../../../../core/result_types/result.dart';
import '../entities/activity_entity.dart';

abstract class ActivityRepositoryContract {
  Future<Result<ActivityEntity>> getRandomActivity();
  Future<Result<ActivityEntity>> getActivityByType(String type);

  Future<Result<List<ActivityEntity>>> getFavoriteActivities();
  Future<Result<void>> saveActivityAsFavorite(ActivityEntity activity);
  Future<Result<void>> deleteFavoriteActivity(String key);
}
