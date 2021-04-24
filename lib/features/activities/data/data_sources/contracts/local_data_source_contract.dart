import 'package:im_bored_app/features/activities/data/models/activity_model.dart';

abstract class ActivityLocalDataSourceContract {
  Future<List<ActivityModel>> getFavoriteActivities();
  Future<bool> saveActivityAsFavorite(ActivityModel model);
}
