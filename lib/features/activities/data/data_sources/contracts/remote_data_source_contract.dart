import '../../models/activity_model.dart';

abstract class ActivityRemoteDataSourceContract {
  Future<ActivityModel> getRandomActivity();
  Future<ActivityModel> getActivityByType(String type);
}
