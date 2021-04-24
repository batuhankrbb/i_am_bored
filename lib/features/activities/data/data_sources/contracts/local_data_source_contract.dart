import '../../models/activity_model.dart';

abstract class ActivityLocalDataSourceContract {
  Future<List<ActivityModel>> getFavoriteActivities();
  Future<bool> saveActivityAsFavorite(ActivityModel model);
  Future<ActivityModel> getLastFavoriteActivity();
}
