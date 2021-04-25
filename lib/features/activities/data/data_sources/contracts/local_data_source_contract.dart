import 'package:im_bored_app/core/result_types/result.dart';

import '../../models/activity_model.dart';

abstract class ActivityLocalDataSourceContract {
  Future<List<ActivityModel>> getFavoriteActivities();
  Future<bool> saveActivityAsFavorite(ActivityModel model);
  Future<ActivityModel> getLastFavoriteActivity();
  Future<Result<bool>> deleteFavoriteActivity(String key);
}
