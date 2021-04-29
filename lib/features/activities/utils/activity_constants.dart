import 'activity_types.dart';

class ActivityConstants {
  ActivityConstants._();

  static final ActivityConstants _ActivityConstantsInstance = ActivityConstants._();

  factory ActivityConstants() {
    return _ActivityConstantsInstance;
 }

 List<ActivityType> allActivityTypes = [
    ActivityType.education,
    ActivityType.recreational,
    ActivityType.social,
    ActivityType.diy,
    ActivityType.charity,
    ActivityType.cooking,
    ActivityType.relaxation,
    ActivityType.music,
    ActivityType.busywork
  ];
}