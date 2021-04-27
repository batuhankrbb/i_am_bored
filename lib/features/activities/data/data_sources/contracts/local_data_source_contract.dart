import 'package:im_bored_app/core/result_types/result.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';

import '../../models/activity_model.dart';

abstract class ActivityLocalDataSourceContract {
  Future<List<ActivityEntity>> getFavoriteActivities();
  Future<bool> saveActivityAsFavorite(ActivityEntity entity);
  Future<ActivityEntity> getCachedActivity();
  Future<Result<bool>> deleteFavoriteActivity(String key);
}
