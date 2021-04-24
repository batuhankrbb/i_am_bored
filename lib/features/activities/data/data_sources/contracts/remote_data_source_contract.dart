import 'package:im_bored_app/features/activities/data/models/activity_model.dart';

abstract class ActivityRemoteDataSourceContract {
  Future<ActivityModel> getRandomActivity();
  Future<ActivityModel> getActivityByType(String type);
}
