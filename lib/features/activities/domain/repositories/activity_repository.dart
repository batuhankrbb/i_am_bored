import 'package:im_bored_app/core/result_types/result.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';

abstract class ActivityRepositoryContract {
  Future<Result<ActivityEntity>> getRandomActivity();
  Future<Result<ActivityEntity>> getActivityByType(String type);

  Future<Result<List<ActivityEntity>>> getFavoriteActivities();
  Future<Result<bool>> saveActivityAsFavorite(ActivityEntity activity);
}
